#!/bin/sh
# upgrade.sh — hebt ein Projekt, das aus dem Starter
# referenzprozess-softwareentwicklung stammt, mechanisch auf den Stand
# des Starters, aus dem dieses Skript stammt (Anleitung:
# upgrade/UPGRADE.md Schritt 3; Sprung 1.x → 2.0: upgrade/1.x-nach-2.0.md).
#
# Aufruf aus dem Projektordner, nachdem _template/ den neuen Stand
# trägt und der Tausch committet ist (UPGRADE.md Schritt 2):
#   sh _template/setup/upgrade.sh [Optionen]
# Aus einem Klon des Starters außerhalb des Projekts aufgerufen, führt
# das Skript nur den Tausch aus (Modus A: _template/ durch den Klon
# ersetzen; Modus B: Submodul auf den neuen Stand der Quelle setzen)
# und hält dann für den Commit „Vorlage auf Stand … gesetzt“ an; die
# Mechanik folgt im zweiten Aufruf aus _template/setup/. Mit
# --nur-pruefen zeigt es aus dem Klon die Vorschau.
# Ein Agent führt dieses Skript nur nach Zustimmung des Anwenders aus
# (Angebot in der Anleitung), nie ungefragt; der Weg von Hand bleibt.
# Ein zweiter Lauf auf demselben Projekt ändert nichts mehr.
# Voraussetzung: das Projekt arbeitet mit dem Software-Prozess des
# Starters (RP-1 auf SP-1); bei einem anderen Prozess hält das Skript
# an — die neuen Dateien kommen dann von Hand aus
# _template/referenzprozesse/ (UPGRADE.md Schritt 3).
#
# Nur Mechanik, Inhalte bleiben unverändert: Vorprüfung
# (Sicherungs-Commit, Modus, Herkunft, Prozess, alte Version), Tausch
# bzw. Submodul-Update (nur aus einem Klon), Datei-Umbenennungen per
# git mv (nie über eine vorhandene Datei), neue Dateien des neuen
# Stands (nie überschreiben), Formalien im Frontmatter einschließlich
# `supersedes:` am Nachfolger einer Ablösung, Zeilen `Template-Stand`
# und `Vorher` im Herkunfts-Vermerk, Trefferliste für den Agenten,
# danach der Lint-Kern. Was das Skript nicht tut: Wikilinks und
# Kennungen nachziehen (kontext-bewusst durch den Agenten, kein sed),
# Inhalte zusammenführen, committen, ungetrackte Dateien anfassen.
# POSIX-sh; erwartet git, awk, sed, grep, find, cmp.
#
# Optionen:
#   --vorher <Version>     alte Version der Vorlage für die Zeile
#                          `Vorher` (z.B. 1.1); sonst aus der Zeile
#                          Template-Stand oder, in Modus B, aus einem
#                          Release-Tag `release-<X.Y>` genau auf dem
#                          Pin des Submoduls vor dem Tausch — ist sie
#                          so nicht ablesbar, bricht das Skript ab
#                          (den Anwender fragen)
#   --ref <Tag|Commit>     Modus B, Aufruf aus einem Klon: Stand, auf den
#                          das Submodul gesetzt wird (sonst der aktuelle
#                          Stand der Quelle)
#   --stichtag JJJJ-MM-TT  Tag des Upgrades (sonst heute)
#   --vorlage-bestaetigt   der Anwender hat bestätigt, dass das Projekt
#                          aus diesem Starter stammt (wenn die Herkunft
#                          nicht ablesbar ist)
#   --nur-pruefen          nichts ändern: Ausgangsstand, Vorhaben und
#                          Trefferliste ausgeben; läuft auch vor dem
#                          Sicherungs-Commit
#   --ohne-lint            den Lint-Lauf am Ende auslassen
#
# Copyright 2026 Jörn Schlingensiepen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied. See the License for the specific language governing
# permissions and limitations under the License.

set -u

STARTER=referenzprozess-softwareentwicklung
VORHER=""
REF=""
STICHTAG=""
BESTAETIGT=0
PRUEFEN=0
OHNE_LINT=0

fehler() { printf 'FEHLER: %s\n' "$1" >&2; exit 1; }
fehlt_wert() { fehler "Option $1 erwartet einen Wert"; }

while [ $# -gt 0 ]; do
    case $1 in
        --vorher)   [ $# -ge 2 ] || fehlt_wert "$1"; shift; VORHER=$1 ;;
        --ref)      [ $# -ge 2 ] || fehlt_wert "$1"; shift; REF=$1 ;;
        --stichtag) [ $# -ge 2 ] || fehlt_wert "$1"; shift; STICHTAG=$1 ;;
        --vorlage-bestaetigt) BESTAETIGT=1 ;;
        --nur-pruefen) PRUEFEN=1 ;;
        --ohne-lint) OHNE_LINT=1 ;;
        -h|--help) awk 'NR > 1 && !/^#/ { exit } NR > 1 { sub(/^# ?/, ""); print }' "$0"; exit 0 ;;
        *) fehler "unbekannte Option $1 (--help zeigt die Optionen)" ;;
    esac
    shift
done

case $STICHTAG in
    "") STICHTAG=$(date +%Y-%m-%d) ;;
    [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) ;;
    *) fehler "--stichtag erwartet JJJJ-MM-TT" ;;
esac

SCRIPT_DIR=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
SRC=$(dirname -- "$SCRIPT_DIR")
DST=$(pwd)

[ "$SRC" = "$DST" ] && fehler "Bitte aus dem Projektordner aufrufen, nicht im Starter selbst."
[ -f "$SRC/INIT.md" ] && [ -f "$SRC/MasterPrompt.md" ] && [ -f "$SRC/upgrade/UPGRADE.md" ] \
    || fehler "'$SRC' ist kein Stand des Starters $STARTER (INIT.md, MasterPrompt.md, upgrade/UPGRADE.md erwartet)."

# ---------------------------------------------------------------------
# 1 Vorprüfung: git-Repo, Sicherungs-Commit, Modus, Herkunft
# ---------------------------------------------------------------------

TOP=$(git rev-parse --show-toplevel 2>/dev/null) || fehler "Kein git-Repo im Projektordner — Anleitung UPGRADE.md Schritt 1."
[ "$TOP" = "$DST" ] || fehler "Bitte aus dem Projekt-Root aufrufen ('$TOP')."
git rev-parse --verify -q HEAD >/dev/null || fehler "Noch kein Commit im Projekt — erst der Sicherungs-Commit (UPGRADE.md Schritt 1)."
GITDIR=$(git rev-parse --git-dir)
if [ -e "$GITDIR/MERGE_HEAD" ] || [ -d "$GITDIR/rebase-merge" ] || [ -d "$GITDIR/rebase-apply" ]; then
    fehler "Laufender Merge oder Rebase — anhalten, Lage beschreiben (UPGRADE.md Schritt 1)."
fi
# Sicherungs-Commit: getrackte Dateien ohne Änderung; ungetrackte Dateien
# hat Schritt 1 bewusst ausgelassen (sensibel oder groß) — sie bleiben
# unberührt und werden genannt. Mit --nur-pruefen keine Bedingung.
UNGETRACKT=$(git -c core.quotePath=false status --porcelain | sed -n 's/^?? //p')
if [ "$PRUEFEN" -eq 0 ] && [ -n "$(git status --porcelain --untracked-files=no)" ]; then
    fehler "Geänderte getrackte Dateien — erst committen: der Sicherungs-Commit (UPGRADE.md Schritt 1) bzw. der Commit des vorigen Schritts, dann erneut aufrufen."
fi

AP="$DST/wiki/Aktivierter-Prozess.md"
[ -f "$AP" ] || fehler "wiki/Aktivierter-Prozess.md fehlt — kein Herkunfts-Vermerk; Ausgangsstand erfragen (UPGRADE.md Schritt 0), Weg von Hand."

# Anbindungs-Modus
MODUS=""
if git config -f "$DST/.gitmodules" --get submodule._template.path >/dev/null 2>&1; then
    MODUS=B
elif [ -d "$DST/_template" ] && [ ! -e "$DST/_template/.git" ]; then
    MODUS=A
elif [ -e "$DST/_template/.git" ]; then
    fehler "_template/ trägt ein eigenes .git, steht aber nicht in .gitmodules — Weg von Hand (UPGRADE.md Schritt 0)."
else
    fehler "_template/ fehlt — Vorlage und Einbindung wie beim Init erfragen (UPGRADE.md Schritt 0), danach erneut aufrufen."
fi

# Herkunft: 2.0-Form (## Herkunft, Zeilen Template-Stand/Quelle) oder
# 1.x-Form (Feld „Template-Herkunft“)
HV_FORM=""
grep -q '^## Herkunft' "$AP" && grep -q '^- \*\*Template-Stand:\*\*' "$AP" && HV_FORM=2.0
[ -z "$HV_FORM" ] && grep -q 'Template-Herkunft' "$AP" && HV_FORM=1.x
ALT_STAND=$(sed -n 's/^- \*\*Template-Stand:\*\* *\([0-9][0-9.]*\) seit .*/\1/p' "$AP" | head -n 1)
QUELLE_ZEILE=$(grep -E 'Template-Herkunft|^- \*\*Quelle:\*\*' "$AP" | head -n 1)
QUELLE_OK=0
case $QUELLE_ZEILE in *"$STARTER"*) QUELLE_OK=1 ;; esac
SUB_URL=""
if [ "$MODUS" = B ]; then
    SUB_URL=$(git config -f "$DST/.gitmodules" --get submodule._template.url 2>/dev/null || true)
    case $SUB_URL in *"$STARTER"*) QUELLE_OK=1 ;; esac
fi
if [ "$QUELLE_OK" -eq 0 ] && [ "$BESTAETIGT" -eq 0 ]; then
    fehler "Herkunft nicht als '$STARTER' erkennbar (Zeile Quelle bzw. Feld Template-Herkunft: '${QUELLE_ZEILE:-fehlt}'${SUB_URL:+; Submodul-URL: $SUB_URL}). Stammt das Projekt aus einer anderen Vorlage, bekommt _template/ deren neuen Stand — Weg von Hand (UPGRADE.md Schritt 0 und 2). Hat der Anwender bestätigt, dass es aus diesem Starter stammt: --vorlage-bestaetigt."
fi

# Prozess: der Starter ist mit RP-1 auf SP-1 vorbefüllt; nur dafür legt
# das Skript neue Dateien an (Fassaden, die der aktive Prozess
# voraussetzt). Gelesen wird der zuerst genannte Prozess der Zeile
# `Prozess` (2.0-Form, ## Herkunft), sonst der Zeile „Gewählter Prozess“.
PROZESS=""
for z in '^- \*\*Prozess:\*\*' '^- \*\*Gewählter Prozess:\*\*'; do
    [ -z "$PROZESS" ] || break
    PROZESS=$(grep "$z" "$AP" | head -n 1 | grep -o '[RS]P-[0-9][0-9]*' | head -n 1 || true)
done
if [ "$PROZESS" != RP-1 ]; then
    fehler "Prozess des Projekts ist nicht der Software-Prozess des Starters (RP-1 auf SP-1): ${PROZESS:-keine Zeile Prozess bzw. Gewählter Prozess mit einem Prozess-Kürzel} — das Skript legt nur dessen Dateien an. Weg von Hand: UPGRADE.md Schritt 3, neue Dateien aus _template/referenzprozesse/ (Basis und aktiver Prozess, Wiki.md §11.3)."
fi

# alte Version für die Zeile `Vorher`: Zeile Template-Stand (2.0-Form)
# oder, in Modus B, ein Release-Tag genau auf dem Pin des Submoduls VOR
# dem Tausch — nach dem Tausch (Aufruf aus _template/setup/) ist das
# der Pin im Commit vor dem letzten Commit, der _template geändert hat;
# vor dem Tausch (Aufruf aus einem Klon) der Pin in HEAD. Nie der Pin
# des neuen Stands, nie eine Form mit Suffix (release-1.1-3-g…).
SUB_ALT=""
SUB_JETZT=""
ALT_PIN=""
VOR_TAUSCH=""
if [ "$SRC" = "$DST/_template" ]; then
    TAUSCH=$(git log -n 1 --format=%H -- _template 2>/dev/null || true)
    [ -n "$TAUSCH" ] && VOR_TAUSCH=$(git rev-parse -q --verify "$TAUSCH~1" 2>/dev/null || true)
else
    VOR_TAUSCH=HEAD
fi
if [ "$MODUS" = B ]; then
    SUB_JETZT=$(git -C "$DST/_template" describe --tags --always 2>/dev/null || true)
    [ -n "$VOR_TAUSCH" ] && ALT_PIN=$(git rev-parse -q --verify "$VOR_TAUSCH:_template" 2>/dev/null || true)
    if [ -n "$ALT_PIN" ]; then
        SUB_ALT=$(git -C "$DST/_template" describe --tags --exact-match "$ALT_PIN" 2>/dev/null \
                  || git -C "$DST/_template" rev-parse --short "$ALT_PIN" 2>/dev/null || true)
    fi
fi
if [ -z "$VORHER" ]; then
    if [ -n "$ALT_STAND" ]; then VORHER=$ALT_STAND
    else
        case $SUB_ALT in
            release-*)
                v=${SUB_ALT#release-}
                printf '%s\n' "$v" | grep -q '^[0-9][0-9]*\.[0-9][0-9]*$' && VORHER=$v ;;
        esac
    fi
fi
# neue Version: aus dem neuen Stand (Vorbelegung des Herkunfts-Vermerks)
NACH=$(grep -o '[0-9][0-9]*\.[0-9][0-9]* seit JJJJ-MM-TT' "$SRC/wiki/Aktivierter-Prozess.md" | head -n 1 | cut -d' ' -f1)
[ -n "$NACH" ] || NACH=2.0
# Wiederholungslauf: Template-Stand nennt schon die Zielversion und eine
# Zeile Vorher steht — der Herkunfts-Vermerk bleibt dann unverändert.
SCHON=0
STAND_GLEICH=0
if [ "$HV_FORM" = 2.0 ] && [ "$ALT_STAND" = "$NACH" ]; then
    if grep -q '^- \*\*Vorher:\*\*' "$AP"; then
        SCHON=1
    else
        # Template-Stand nennt die Zielversion, ohne Zeile Vorher: das
        # Projekt wurde auf diesem Stand angelegt (Init oder Migration) —
        # kein Sprung. Ob ein neuerer Commit derselben Version nachgezogen
        # werden soll, fragt der Agent den Anwender; das Skript schreibt
        # keine Zeile Vorher.
        STAND_GLEICH=1
        [ "$PRUEFEN" -eq 1 ] || fehler "Projekt trägt den Stand $NACH schon (Template-Stand ohne Zeile Vorher) — kein Sprung; ob ein neuerer Commit derselben Version nachgezogen werden soll, fragt der Agent den Anwender (UPGRADE.md Schritt 0)."
    fi
fi
if [ -z "$VORHER" ] && [ "$SCHON" -eq 0 ] && [ "$STAND_GLEICH" -eq 0 ]; then
    [ "$PRUEFEN" -eq 1 ] || fehler "Alte Version nicht ablesbar (keine Zeile Template-Stand, kein Release-Tag genau auf dem Pin vor dem Tausch${SUB_ALT:+: $SUB_ALT}) — den Anwender fragen und --vorher <Version> angeben (UPGRADE.md Schritt 0)."
    VORHER="offen — --vorher <Version> angeben (UPGRADE.md Schritt 0)"
fi

IN_PROGRESS=0
[ -f "$DST/wiki/Zielmarken.md" ] && grep -q '^- \*\*Zustand:\*\* *in-progress' "$DST/wiki/Zielmarken.md" && IN_PROGRESS=1

printf 'Ausgangsstand\n'
printf '  Projekt:          %s\n' "$DST"
printf '  Neuer Stand:      %s\n' "$SRC"
printf '  Anbindungs-Modus: %s\n' "$MODUS"
printf '  Herkunfts-Form:   %s\n' "${HV_FORM:-keine (weder ## Herkunft noch Template-Herkunft)}"
printf '  Quelle:           %s\n' "${QUELLE_ZEILE:-fehlt}"
[ -n "$SUB_URL" ] && printf '  Submodul-URL:     %s\n' "$SUB_URL"
[ -n "$SUB_JETZT" ] && printf '  Submodul-Stand:   %s (vor dem Tausch: %s)\n' "$SUB_JETZT" "${SUB_ALT:-nicht ablesbar}"
printf '  Prozess:          %s\n' "$PROZESS"
if [ "$SCHON" -eq 1 ]; then
    printf '  Version:          schon %s (Zeile Vorher vorhanden) — Wiederholungslauf, Herkunfts-Vermerk bleibt\n' "$NACH"
elif [ "$STAND_GLEICH" -eq 1 ]; then
    printf '  Version:          schon %s (ohne Zeile Vorher) — kein Sprung; Nachzug innerhalb der Version: Anwender fragen (UPGRADE.md Schritt 0)\n' "$NACH"
else
    printf '  Version:          %s -> %s (Stichtag %s)\n' "$VORHER" "$NACH" "$STICHTAG"
fi
printf '  Zielmarken:       %s\n' "$([ "$IN_PROGRESS" -eq 1 ] && printf 'eine Marke in-progress' || printf 'Zustandszeile in-progress nicht gefunden — Zielmarken selbst lesen; fehlt eine laufende Marke, benennt sie der Anwender (UPGRADE.md Schritt 4)')"
if [ -n "$UNGETRACKT" ]; then
    printf '  Ungetrackt:       in Schritt 1 ausgelassen, bleiben unberührt:\n'
    printf '%s\n' "$UNGETRACKT" | sed 's/^/    - /'
fi
printf '\n'

# ---------------------------------------------------------------------
# Hilfsfunktionen
# ---------------------------------------------------------------------

# Dateiname ohne Umlaut und ß
ae_name() {
    printf '%s' "$1" | sed 's/ä/ae/g; s/ö/oe/g; s/ü/ue/g; s/Ä/Ae/g; s/Ö/Oe/g; s/Ü/Ue/g; s/ß/ss/g'
}

# umbenennen per git mv (ungetrackt: mv), nie über eine vorhandene Datei;
# gibt die alte Datei in UMBENANNT (alt<TAB>neu je Zeile) aus
UMBENANNT=""
umbenennen() {
    alt=$1; neu=$2
    [ -e "$DST/$alt" ] || return 0
    if [ -e "$DST/$neu" ]; then
        printf '  ausgelassen: %s -> %s (Ziel vorhanden)\n' "$alt" "$neu"
        return 0
    fi
    if [ "$PRUEFEN" -eq 0 ]; then
        if git ls-files --error-unmatch -- "$alt" >/dev/null 2>&1; then
            git mv -- "$alt" "$neu" || fehler "git mv $alt -> $neu fehlgeschlagen — Lage prüfen, dann erneut aufrufen."
        else
            mv -- "$DST/$alt" "$DST/$neu" || fehler "mv $alt -> $neu fehlgeschlagen — Lage prüfen, dann erneut aufrufen."
        fi
    fi
    printf '  %s -> %s\n' "$alt" "$neu"
    UMBENANNT="${UMBENANNT}${alt}	${neu}
"
}

# alter Name einer Datei vor der Umbenennung dieses Laufs (sonst der Name selbst)
alter_name() {
    printf '%s' "$UMBENANNT" | awk -F '	' -v n="$1" '$2 == n { print $1; f = 1 } END { if (!f) print n }'
}

# alte Fassung einer Datei aus dem Stand von _template/ vor dem Tausch
# (Modus A: der Commit vor dem Tausch; Modus B: der alte Pin) — leer, wenn
# nicht ablesbar; Rückgabe 1, wenn es die Datei dort nicht gab
alte_fassung() {
    af_rel=$(alter_name "$1")
    if [ "$MODUS" = B ]; then
        [ -n "$ALT_PIN" ] && git -C "$DST/_template" show "$ALT_PIN:$af_rel" 2>/dev/null
    else
        [ -n "$VOR_TAUSCH" ] && git show "$VOR_TAUSCH:_template/$af_rel" 2>/dev/null
    fi
}

# Ablösungen aus dem Frontmatter aller Detail-Knoten: je Zeile
# <abgelöste ID><TAB><Nachfolger-ID> (superseded-by wie superseded_by,
# Einzelwert, Inline-Liste oder Listenform)
abloesungen() {
    find "$DST/wiki" -type f -name '*.md' | sort | while IFS= read -r f; do
        awk '
            NR == 1 && $0 != "---" { exit }
            NR > 1 && $0 == "---" { exit }
            /^id:[ \t]*/ { id = $0; sub(/^id:[ \t]*/, "", id); sub(/[ \t]+$/, "", id); lst = 0; next }
            /^superseded[-_]by:[ \t]*$/ { lst = 1; next }
            /^superseded[-_]by:[ \t]*[^ \t]/ { v = $0; sub(/^superseded[-_]by:[ \t]*/, "", v); gsub(/[][" \t]/, "", v); n = split(v, a, ","); for (i = 1; i <= n; i++) if (a[i] != "") succ[++m] = a[i]; lst = 0; next }
            lst && /^[ \t]+-[ \t]*/ { v = $0; sub(/^[ \t]+-[ \t]*/, "", v); gsub(/[" \t]/, "", v); if (v != "") succ[++m] = v; next }
            { lst = 0 }
            END { if (id != "") for (i = 1; i <= m; i++) print id "\t" succ[i] }
        ' "$f"
    done
}

# Temp-Verzeichnis außerhalb des Projekts (nichts bleibt im Projekt liegen)
TMPD=${TMPDIR:-/tmp}/upgrade.$$
mkdir -p "$TMPD" || fehler "Temp-Verzeichnis $TMPD nicht anlegbar"
trap 'rm -rf "$TMPD"' EXIT

# Trefferliste: Dateien unter wiki/ (und, ohne drittes Argument, Root-*.md),
# die ein Muster (ERE) enthalten — und, mit viertem Argument, auch das zweite
treffer() {
    muster=$1; titel=$2; nurwiki=${3:-}; muster2=${4:-}
    hits=$( { [ -n "$nurwiki" ] || for f in "$DST"/*.md; do [ -f "$f" ] && printf '%s\n' "$f"; done; find "$DST/wiki" -type f -name '*.md' 2>/dev/null; } \
            | sort | while IFS= read -r f; do
                [ -z "$muster2" ] || grep -q -E -- "$muster2" "$f" 2>/dev/null || continue
                grep -E -l -- "$muster" "$f" 2>/dev/null
              done | sed "s#^$DST/##")
    [ -n "$hits" ] || return 0
    n=$(printf '%s\n' "$hits" | wc -l | tr -d ' ')
    printf '  %s (%s Datei(en)):\n' "$titel" "$n"
    printf '%s\n' "$hits" | sed 's/^/    - /'
}

# ---------------------------------------------------------------------
# 2 Tausch bzw. Submodul-Update
# ---------------------------------------------------------------------

printf 'Tausch von _template/\n'
NEU="$DST/_template"
if [ "$SRC" = "$NEU" ]; then
    printf '  kein Tausch — _template/ trägt den neuen Stand schon (Schritt 2; Aufruf aus _template/setup/)\n'
elif [ "$MODUS" = B ]; then
    if [ "$PRUEFEN" -eq 1 ]; then
        printf '  würde das Submodul _template auf %s setzen und für den Commit anhalten\n' "${REF:-den aktuellen Stand der Quelle}"
    else
        if [ -n "$REF" ]; then
            if ! git -C "$NEU" fetch --quiet origin || ! git -C "$NEU" checkout --quiet "$REF" 2>/dev/null; then
                fehler "Quelle nicht erreichbar oder Stand '$REF' unbekannt ($SUB_URL) — melden und anhalten; der Anwender nennt eine andere Quelle, stellt den Zugang her oder lässt das Upgrade (UPGRADE.md Grundsätze)."
            fi
        else
            git submodule --quiet update --init --remote -- _template \
                || fehler "Quelle nicht erreichbar ($SUB_URL) — melden und anhalten; der Anwender nennt eine andere Quelle, stellt den Zugang her oder lässt das Upgrade (UPGRADE.md Grundsätze)."
        fi
        [ -f "$NEU/upgrade/UPGRADE.md" ] || fehler "Nach dem Submodul-Update fehlt _template/upgrade/UPGRADE.md — die Quelle ist kein Stand dieses Starters (Projekt aus der allgemeinen Vorlage: Weg von Hand). Rücknahme: git submodule update -- _template"
        printf '  Submodul _template steht auf %s (%s)\n' "$(git -C "$NEU" describe --tags --always)" "$(git -C "$NEU" rev-parse --short HEAD)"
    fi
else
    if [ "$PRUEFEN" -eq 1 ]; then
        printf '  würde _template/ durch eine Kopie von %s ersetzen (ohne .git) und für den Commit anhalten\n' "$SRC"
    else
        if printf '%s\n' "$UNGETRACKT" | grep -q '^_template/'; then
            fehler "Ungetrackte Dateien unter _template/ — vor dem Tausch der Kopie sichern oder entfernen (UPGRADE.md Schritt 1)."
        fi
        if ! { rm -rf "$NEU" && mkdir -p "$NEU" && cp -R "$SRC/." "$NEU/" && rm -rf "$NEU/.git"; }; then
            fehler "Kopie nach _template/ fehlgeschlagen — Lage prüfen; Rücknahme: git checkout -- _template"
        fi
        printf '  _template/ durch Kopie von %s ersetzt' "$SRC"
        if git -C "$SRC" rev-parse --verify -q HEAD >/dev/null 2>&1; then
            printf ' (%s, %s)' "$(git -C "$SRC" describe --tags --always)" "$(git -C "$SRC" rev-parse --short HEAD)"
        fi
        printf '\n'
    fi
fi
if [ "$SRC" != "$NEU" ] && [ "$PRUEFEN" -eq 0 ]; then
    # Der Tausch bekommt seinen eigenen Commit (UPGRADE.md Schritt 2);
    # die Mechanik folgt im Aufruf aus _template/setup/.
    printf '\nTausch ausgeführt, sonst nichts geändert. Nächster Schritt: Commit „Vorlage auf Stand %s gesetzt“, dann sh _template/setup/upgrade.sh%s aus dem Projektordner (UPGRADE.md Schritt 3).\n' "$NACH" "${VORHER:+ --vorher $VORHER}"
    exit 0
fi
[ "$PRUEFEN" -eq 1 ] && NEU=$SRC
printf '\n'

# ---------------------------------------------------------------------
# 3 Umbenennungen (git mv, nie über eine vorhandene Datei)
# ---------------------------------------------------------------------

printf 'Umbenennungen%s\n' "$([ "$PRUEFEN" -eq 1 ] && printf ' (Vorschau)')"
umbenennen wiki/Verwendungs-Rollen.md wiki/Rollen.md
umbenennen wiki/Knotentypen.md wiki/Katalog.md
UMLAUTE=$(find "$DST/wiki" -type f -name '*.md' | sort | while IFS= read -r f; do
    rel=${f#"$DST/"}
    case $rel in
        *ä*|*ö*|*ü*|*Ä*|*Ö*|*Ü*|*ß*) printf '%s\n' "$rel" ;;
    esac
done)
# Here-Dokument statt Pipe: die Schleife läuft in dieser Shell und
# ergänzt UMBENANNT (ohne Temp-Datei im Projekt)
while IFS= read -r rel; do
    [ -n "$rel" ] || continue
    umbenennen "$rel" "$(ae_name "$rel")"
done <<EOF
$UMLAUTE
EOF
[ -n "$UMBENANNT" ] || printf '  keine\n'
printf '\n'

# ---------------------------------------------------------------------
# 4 Neue Dateien des neuen Stands (nie überschreiben), Delta-Liste
# ---------------------------------------------------------------------

printf 'Neue Dateien des neuen Stands%s\n' "$([ "$PRUEFEN" -eq 1 ] && printf ' (Vorschau)')"
{
    for f in MasterPrompt.md Wiki.md Vorgehen.md Reviewmuster.md \
             Outgoing.md Styleguide.md Styleguide-md.md \
             Styleguide-wiki.md; do
        printf '%s\n' "$f"
    done
    # referenzprozesse/, tools/, upgrade/, migration/, docs/, setup/ bleiben
    # in _template/ (Nur-Lese); devstate_active.md ist Projekt-Inhalt.
    ( cd "$NEU" && find wiki -type f | sort )
} | {
    NEUANG=0; GLEICH=0; DELTA=""; OPTIONAL=""; ABGELOEST=""
    while IFS= read -r rel; do
        if [ "$PRUEFEN" -eq 1 ] && printf '%s' "$UMBENANNT" | grep -q "	$rel\$"; then
            printf '  = %s (nach der Umbenennung vorhanden — Delta-Nachzug)\n' "$rel"
            DELTA="${DELTA}${rel}
"
        elif [ -e "$DST/$rel" ]; then
            if cmp -s -- "$NEU/$rel" "$DST/$rel"; then
                GLEICH=$((GLEICH + 1))
            else
                DELTA="${DELTA}${rel}
"
            fi
        else
            if [ "$PRUEFEN" -eq 0 ]; then
                case $rel in */*) mkdir -p "$DST/${rel%/*}" || fehler "mkdir für $rel fehlgeschlagen" ;; esac
                cp -- "$NEU/$rel" "$DST/$rel" || fehler "Kopie von $rel fehlgeschlagen"
            fi
            NEUANG=$((NEUANG + 1))
            printf '  + %s\n' "$rel"
            if sed -n '2,/^---$/p' "$NEU/$rel" | grep -q '^active: false'; then
                # abgelöste Fassaden (active: false mit Verweis auf den
                # Nachfolger) sind nicht aktivierbar, nur Hintergrund
                if sed -n '2,/^---$/p' "$NEU/$rel" | grep -q -E '^active: false.*abgelöst durch'; then
                    ABGELOEST="${ABGELOEST}${rel}
"
                else
                    OPTIONAL="${OPTIONAL}${rel}
"
                fi
            fi
        fi
    done
    if [ ! -e "$DST/.gitignore" ] && [ -e "$NEU/.gitignore" ]; then
        if [ "$PRUEFEN" -eq 0 ]; then cp -- "$NEU/.gitignore" "$DST/.gitignore" || fehler "Kopie von .gitignore fehlgeschlagen"; fi
        NEUANG=$((NEUANG + 1)); printf '  + .gitignore\n'
    fi
    printf '  angelegt: %s; vorhanden und inhaltsgleich: %s\n' "$NEUANG" "$GLEICH"
    if [ -n "$OPTIONAL" ]; then
        printf '  Hinweis an den Anwender — neue Fassaden liegen deaktiviert bereit (active: false), Aktivierung per Zuruf:\n'
        printf '%s' "$OPTIONAL" | sed 's/^/    - /'
    fi
    if [ -n "$ABGELOEST" ]; then
        printf '  abgelöste Fassaden (bleiben deaktiviert, der Nachfolger ist aktiv):\n'
        printf '%s' "$ABGELOEST" | sed 's/^/    - /'
    fi
    printf '\n'
    if [ -n "$DELTA" ]; then
        # Einteilung nach UPGRADE.md Schritt 5: gleicht die lebende Kopie
        # dem alten Stand der Vorlage, hat das Projekt sie nie verändert
        # (eine Gruppe); sonst einzeln. Ohne alten Stand: nicht eingeteilt.
        GRUPPE=""; EINZELN=""; OFFEN=""
        while IFS= read -r rel; do
            [ -n "$rel" ] || continue
            if alte_fassung "$rel" | cmp -s -- - "$DST/$rel"; then
                GRUPPE="${GRUPPE}${rel}
"
            elif alte_fassung "$rel" >/dev/null; then
                EINZELN="${EINZELN}${rel}
"
            else
                OFFEN="${OFFEN}${rel}
"
            fi
        done <<EOF
$DELTA
EOF
        printf 'Delta-Nachzug — bestehende Dateien, die vom neuen Stand abweichen (nie automatisch; Übernahmen als Vorschlag, UPGRADE.md Schritt 5):\n'
        if [ -n "$GRUPPE" ]; then
            printf '  vom Projekt nie verändert (gleich dem alten Stand der Vorlage) — als eine Gruppe vorschlagen:\n'
            printf '%s' "$GRUPPE" | sed 's/^/    - /'
        fi
        if [ -n "$EINZELN" ]; then
            printf '  mit projekt-eigenen Änderungen — einzeln vorschlagen (Regelwerks-Text aus der Vorlage, Einträge des Projekts bleiben):\n'
            printf '%s' "$EINZELN" | sed 's/^/    - /'
        fi
        if [ -n "$OFFEN" ]; then
            printf '  alter Stand der Vorlage nicht ablesbar — einzeln vergleichen:\n'
            printf '%s' "$OFFEN" | sed 's/^/    - /'
        fi
        printf '\n'
    fi
}

# ---------------------------------------------------------------------
# 5 Formalien im Frontmatter (1.x-nach-2.0.md Abschnitt 1)
# ---------------------------------------------------------------------

printf 'Formalien%s\n' "$([ "$PRUEFEN" -eq 1 ] && printf ' (Vorschau)')"
{
find "$DST/wiki" -type f -name '*.md' | sort | while IFS= read -r f; do
    grep -q -E '^subtype:|^superseded-by:|^superseded_by:[ \t]*[^ \t[]|umgesetzt-wartet-auf-Prüfung|^type: role$' "$f" || continue
    if head -n 1 "$f" | grep -q "$(printf '\r')"; then
        printf '  CRLF: %s — Zeilenenden CR LF, Formalien nicht umgestellt (von Hand oder nach Umstellung auf LF)\n' "${f#"$DST/"}"
        continue
    fi
    tmp="$TMPD/formalien"
    awk -v stichtag="$STICHTAG" '
        BEGIN { fm = 0; fmdone = 0; wartet = 0; rolle = 0; hat_art = 0; verm = 0 }
        {
            line = $0
            if (NR == 1 && line == "---") { fm = 1; print line; next }
            if (fm == 1) {
                if (line == "---") {
                    if (rolle == 1 && hat_art == 0) print "rolle_art: verwendungsrolle"
                    fm = 0; fmdone = 1; print line; next
                }
                if (line ~ /^subtype:/) sub(/^subtype:/, "requirement_type:", line)
                if (line ~ /^superseded-by:/) sub(/^superseded-by:/, "superseded_by:", line)
                if (line ~ /^superseded_by:[ \t]*[^ \t[]/) {
                    # Einzelwert -> Listenform (Wiki.md §4.1)
                    v = line; sub(/^superseded_by:[ \t]*/, "", v); gsub(/[" \t]/, "", v)
                    n = split(v, a, ","); print "superseded_by:"
                    for (i = 1; i <= n; i++) if (a[i] != "") print "  - " a[i]
                    next
                }
                if (line ~ /^status:[ \t]*umgesetzt-wartet-auf-Prüfung/) { sub(/umgesetzt-wartet-auf-Prüfung/, "umgesetzt", line); wartet = 1 }
                if (line ~ /^type:[ \t]*role[ \t]*$/) rolle = 1
                if (line ~ /^rolle_art:/) hat_art = 1
                print line; next
            }
            if (line ~ /^## Vermerke/) verm = 1
            else if (verm == 1 && line ~ /^## /) {
                if (wartet == 1) { print "- **Vermerk " stichtag " (Upgrade):** Status vor dem Upgrade `umgesetzt-wartet-auf-Prüfung`; Prüfung offen."; print ""; wartet = 2 }
                verm = 0
            }
            if (line ~ /\*\*Status:\*\*.*umgesetzt-wartet-auf-Prüfung/ && line !~ /Prüfung offen — vor dem Upgrade/) sub(/umgesetzt-wartet-auf-Prüfung/, "umgesetzt (Prüfung offen — vor dem Upgrade umgesetzt-wartet-auf-Prüfung)", line)
            print line
        }
        END {
            if (wartet == 1) {
                if (verm == 0) { print ""; print "## Vermerke"; print "" }
                print "- **Vermerk " stichtag " (Upgrade):** Status vor dem Upgrade `umgesetzt-wartet-auf-Prüfung`; Prüfung offen."
            }
        }' "$f" > "$tmp"
    if ! cmp -s -- "$f" "$tmp"; then
        printf '  %s\n' "${f#"$DST/"}"
        [ "$PRUEFEN" -eq 0 ] && { cat -- "$tmp" > "$f" || fehler "Schreiben von ${f#"$DST/"} fehlgeschlagen"; }
    fi
    rm -f "$tmp"
done
# Ablösung beidseitig: `supersedes:` am Nachfolger (YAML-Header, vom Freeze
# ausgenommen) — 1.x kannte nur superseded-by am abgelösten Knoten
abloesungen | while IFS='	' read -r alt neu; do
    [ -n "$alt" ] && [ -n "$neu" ] || continue
    nf=$(find "$DST/wiki" -type f -name '*.md' -exec grep -l -E "^id:[ 	]*${neu}[ 	]*\$" {} + 2>/dev/null | sort | head -n 1)
    [ -n "$nf" ] || { printf '  %s: Nachfolger %s ohne Detail-Knoten — supersedes von Hand prüfen\n' "$alt" "$neu"; continue; }
    tmp="$TMPD/supersedes"
    awk -v alt="$alt" '
        NR == 1 && $0 == "---" { fm = 1; print; next }
        fm && lst && /^[ \t]+-[ \t]*/ { v = $0; sub(/^[ \t]+-[ \t]*/, "", v); gsub(/[" \t]/, "", v); if (v == alt) da = 1; print; next }
        fm && lst { if (!da) print "  - " alt; lst = 0 }
        fm && $0 == "---" {
            if (!hat) { print "supersedes:"; print "  - " alt }
            fm = 0; print; next
        }
        fm && /^supersedes:[ \t]*$/ { print; hat = 1; lst = 1; da = 0; next }
        fm && /^supersedes:[ \t]*\[[ \t]*\][ \t]*$/ { print "supersedes:"; print "  - " alt; hat = 1; next }
        fm && /^supersedes:[ \t]*[^ \t]/ {
            v = $0; sub(/^supersedes:[ \t]*/, "", v); gsub(/[][" \t]/, "", v)
            n = split(v, a, ","); print "supersedes:"
            for (i = 1; i <= n; i++) if (a[i] != "") { print "  - " a[i]; if (a[i] == alt) da = 1 }
            if (!da) print "  - " alt
            hat = 1; next
        }
        { print }' "$nf" > "$tmp"
    if ! cmp -s -- "$nf" "$tmp"; then
        printf '  %s (supersedes: %s ergänzt)\n' "${nf#"$DST/"}" "$alt"
        [ "$PRUEFEN" -eq 0 ] && { cat -- "$tmp" > "$nf" || fehler "Schreiben von ${nf#"$DST/"} fehlgeschlagen"; }
    fi
    rm -f "$tmp"
done
} | {
    n=0
    while IFS= read -r l; do printf '%s\n' "$l"; n=$((n + 1)); done
    [ "$n" -gt 0 ] || printf '  keine\n'
}
printf '\n'

# ---------------------------------------------------------------------
# 6 Herkunfts-Vermerk: Template-Stand und Vorher
# ---------------------------------------------------------------------

printf 'Herkunfts-Vermerk (wiki/Aktivierter-Prozess.md)%s\n' "$([ "$PRUEFEN" -eq 1 ] && printf ' (Vorschau)')"
TS="- **Template-Stand:** $NACH seit $STICHTAG"
VZ="- **Vorher:** $VORHER (bis $STICHTAG)"
if [ "$SCHON" -eq 1 ]; then
    printf '  unverändert — Template-Stand %s und Zeile Vorher stehen schon (Wiederholungslauf)\n' "$NACH"
elif [ "$STAND_GLEICH" -eq 1 ]; then
    printf '  unverändert — Template-Stand %s steht schon, kein Sprung (keine Zeile Vorher)\n' "$NACH"
elif [ "$HV_FORM" = 2.0 ]; then
    printf '  %s\n  %s\n  (Vermerk mit der Zuordnungstabelle direkt unter Vorher: 1.x-nach-2.0.md Abschnitt 2)\n' "$TS" "$VZ"
    if [ "$PRUEFEN" -eq 0 ]; then
        awk -v ts="$TS" -v vz="$VZ" '
            /^- \*\*Template-Stand:\*\*/ && !done { print ts; print vz; done = 1; next }
            { print }' "$AP" > "$TMPD/ap"
        cat -- "$TMPD/ap" > "$AP" || fehler "Schreiben von wiki/Aktivierter-Prozess.md fehlgeschlagen"
    fi
else
    QUELLE_NEU="offen — Repo-URL und Commit bzw. Tag des neuen Stands (UPGRADE.md Schritt 7)"
    case $QUELLE_ZEILE in
        *OFFEN*|*offen*|"") ;;
        *) QUELLE_NEU="$(printf '%s' "$QUELLE_ZEILE" | sed 's/^- \*\*Template-Herkunft:\*\* *//; s/ — beim Einbinden.*//') (vor dem Upgrade) — neuen Stand eintragen (UPGRADE.md Schritt 7)" ;;
    esac
    printf '  neuer Abschnitt ## Herkunft mit:\n  %s\n  %s\n  - **Quelle:** %s\n  - **Anbindungs-Modus:** %s\n  - **Prozess:** offen (aus „Gewählter Prozess“ übernehmen)\n  - **Rolle:** offen (aus „RP-1-Rolle“ übernehmen)\n  - **Übernahme-Art:** —\n' "$TS" "$VZ" "$QUELLE_NEU" "$MODUS"
    printf '  Das Feld „Template-Herkunft“ bleibt stehen, bis der Agent die Zeilen füllt (Trefferliste).\n'
    if [ "$PRUEFEN" -eq 0 ]; then
        awk -v ts="$TS" -v vz="$VZ" -v q="$QUELLE_NEU" -v m="$MODUS" '
            function block() {
                print "## Herkunft"; print ""
                print ts; print vz
                print "- **Quelle:** " q
                print "- **Anbindungs-Modus:** " m
                print "- **Prozess:** offen — aus der Zeile „Gewählter Prozess“ übernehmen (Format: [[Init-Choreografie]] §Phase A0)"
                print "- **Rolle:** offen — aus der Zeile „RP-1-Rolle“ übernehmen"
                print "- **Übernahme-Art:** — (nur bei Rolle Komponent)"
                print ""
            }
            /^## Bezüge/ && !done { block(); done = 1 }
            { print }
            END { if (!done) { print ""; block() } }' "$AP" > "$TMPD/ap"
        cat -- "$TMPD/ap" > "$AP" || fehler "Schreiben von wiki/Aktivierter-Prozess.md fehlgeschlagen"
    fi
fi
printf '\n'

# ---------------------------------------------------------------------
# 7 Trefferliste für den Agenten (kontext-bewusst nachziehen, kein sed)
# ---------------------------------------------------------------------

printf 'Trefferliste für den Agenten (1.x-nach-2.0.md Abschnitt 2 und 3)\n'
if [ -n "$UMBENANNT" ]; then
    printf '%s' "$UMBENANNT" | while IFS='	' read -r alt neu; do
        base=${alt##*/}; base=${base%.md}
        treffer "\[\[$base" "Wikilinks auf '$base' (jetzt '${neu##*/}')"
    done
fi
treffer '^type: types' 'Katalog: alter Knotentypen-Inhalt (type: types) — projekt-eigene Typen als Katalog-Einträge, dann Inhalt aus _template/wiki/Katalog.md'
treffer '(^### |\[\[|^id: *)SPEC-[0-9]' 'SPEC → FUNC mit alias: (Einträge, Detail-Knoten, Verweise)'
treffer '(^### |\[\[|^id: *)BR-[0-9]' 'BR → BUG mit alias: (Einträge, Detail-Knoten, Verweise)'
treffer '^\*\*Stand:\*\*' 'Pflegezeile „Stand:“ → „Bearbeitungsstand:“ (Fassaden)' wiki
treffer '^type: (testplan|deployment)$' 'Altknoten testplan/deployment — lesbar, Überführung anbieten' wiki
treffer '^fassung:' 'Contract-Einträge mit fassung — Umzug beim Upgrade des Providers anbieten (1.x-nach-2.0.md Abschnitt 3)' wiki
treffer '^> \*\*⚠ Abgelöst durch \[\[' 'Ablöse-Vermerke der 1.x-Form — bleiben stehen (Lint-Hinweis)' wiki
treffer '^- \*\*Auslöser:\*\*' 'Register-Zeilen mit Auslöser: zum Status umgesetzt (Prüfung offen) — Zeile streichen, Inhalt in den Vermerk des Knotens' wiki 'Prüfung offen — vor dem Upgrade'
treffer '^- \*\*Zustand:\*\* *current' 'Marken-Zeiger current der 1.x-Form — Zeile Zustand nach 1.x-nach-2.0.md Abschnitt 2 (abgeschlossen, in-progress, künftig)' wiki
treffer 'Template-Herkunft' 'Herkunfts-Vermerk 1.x-Form — Zeilen Quelle, Prozess, Rolle füllen' wiki
[ "$IN_PROGRESS" -eq 1 ] || printf '  Zielmarken: Zustandszeile in-progress nicht gefunden — Zielmarken selbst lesen; fehlt eine laufende Marke, vom Anwender benennen lassen und anlegen (vor dem Lint, UPGRADE.md Schritt 4)\n'
printf '\n'

# ---------------------------------------------------------------------
# 8 Lint-Kern
# ---------------------------------------------------------------------

if [ "$PRUEFEN" -eq 1 ]; then
    printf 'Nur geprüft — nichts geändert. Ohne --nur-pruefen führt das Skript die Schritte aus.\n'
    exit 0
fi
if [ "$OHNE_LINT" -eq 0 ] && [ -f "$NEU/tools/lint.sh" ]; then
    printf 'Lint-Kern (Trefferliste; maßgeblich ist der Lauf nach UPGRADE.md Schritt 8):\n'
    sh "$NEU/tools/lint.sh" . || true
    printf '\n'
fi
printf 'Nächster Schritt: Commit „Upgrade: Mechanik“, dann UPGRADE.md Schritt 4 bis 8 mit %s/upgrade/1.x-nach-2.0.md.\n' "$NEU"
exit 0
