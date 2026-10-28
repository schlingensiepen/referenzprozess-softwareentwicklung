#!/bin/sh
# upgrade.sh — hebt ein Projekt, das aus dem Starter
# referenzprozess-softwareentwicklung stammt, mechanisch auf den Stand
# des Starters, aus dem dieses Skript stammt (Anleitung:
# upgrade/UPGRADE.md Schritt 3; Sprung 1.x → 2.0: upgrade/1.x-nach-2.0.md).
#
# Aufruf aus dem Projektordner:
#   sh <neuer Stand>/setup/upgrade.sh [Optionen]
# <neuer Stand> ist ein Klon des Starters außerhalb des Projekts — bei
# Modus A (Einmal-Kopie) ersetzt das Skript _template/ durch diesen
# Klon — oder _template selbst, wenn _template/ den neuen Stand schon
# trägt. Bei Modus B (Submodul) setzt das Skript das Submodul auf den
# neuen Stand seiner Quelle; der Klon dient dann nur als Aufruf-Ort.
# Ein Agent führt dieses Skript nur nach Zustimmung des Anwenders aus
# (Angebot in der Anleitung), nie ungefragt; der Weg von Hand bleibt.
#
# Nur Mechanik, Inhalte bleiben unverändert: Vorprüfung
# (Sicherungs-Commit, Modus, Herkunft), Tausch bzw. Submodul-Update,
# Datei-Umbenennungen per git mv (nie über eine vorhandene Datei), neue
# Dateien des neuen Stands (nie überschreiben), Formalien im
# Frontmatter, Zeilen `Template-Stand` und `Vorher` im Herkunfts-Vermerk,
# Trefferliste für den Agenten, danach der Lint-Kern. Was das Skript
# nicht tut: Wikilinks und Kennungen nachziehen (kontext-bewusst durch
# den Agenten, kein sed), Inhalte zusammenführen, committen.
#
# Optionen:
#   --vorher <Version>     alte Version der Vorlage für die Zeile
#                          `Vorher` (z.B. 1.1); sonst aus dem
#                          Herkunfts-Vermerk, dem Submodul-Tag, zuletzt 1.x
#   --ref <Tag|Commit>     Modus B: Stand, auf den das Submodul gesetzt
#                          wird (sonst der aktuelle Stand der Quelle)
#   --stichtag JJJJ-MM-TT  Tag des Upgrades (sonst heute)
#   --vorlage-bestaetigt   der Anwender hat bestätigt, dass das Projekt
#                          aus diesem Starter stammt (wenn die Herkunft
#                          nicht ablesbar ist)
#   --nur-pruefen          nichts ändern: Ausgangsstand, Vorhaben und
#                          Trefferliste ausgeben
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
if [ -n "$(git status --porcelain)" ]; then
    fehler "Arbeitskopie nicht sauber — erst der Sicherungs-Commit (UPGRADE.md Schritt 1), dann erneut aufrufen."
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
QUELLE_ZEILE=$(grep 'Template-Herkunft\|^- \*\*Quelle:\*\*' "$AP" | head -n 1)
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

# alte Version für die Zeile `Vorher`
SUB_ALT=""
if [ "$MODUS" = B ]; then
    SUB_ALT=$(git -C "$DST/_template" describe --tags --always 2>/dev/null || true)
fi
if [ -z "$VORHER" ]; then
    if [ -n "$ALT_STAND" ]; then VORHER=$ALT_STAND
    else
        case $SUB_ALT in
            release-*) VORHER=${SUB_ALT#release-} ;;
            *) VORHER=1.x ;;
        esac
    fi
fi
# neue Version: aus dem neuen Stand (Vorbelegung des Herkunfts-Vermerks)
NACH=$(grep -o '[0-9][0-9]*\.[0-9][0-9]* seit JJJJ-MM-TT' "$SRC/wiki/Aktivierter-Prozess.md" | head -n 1 | cut -d' ' -f1)
[ -n "$NACH" ] || NACH=2.0

IN_PROGRESS=0
[ -f "$DST/wiki/Zielmarken.md" ] && grep -q 'in-progress' "$DST/wiki/Zielmarken.md" && IN_PROGRESS=1

printf 'Ausgangsstand\n'
printf '  Projekt:          %s\n' "$DST"
printf '  Neuer Stand:      %s\n' "$SRC"
printf '  Anbindungs-Modus: %s\n' "$MODUS"
printf '  Herkunfts-Form:   %s\n' "${HV_FORM:-keine (weder ## Herkunft noch Template-Herkunft)}"
printf '  Quelle:           %s\n' "${QUELLE_ZEILE:-fehlt}"
[ -n "$SUB_URL" ] && printf '  Submodul-URL:     %s\n' "$SUB_URL"
[ -n "$SUB_ALT" ] && printf '  Submodul-Stand:   %s\n' "$SUB_ALT"
printf '  Version:          %s -> %s (Stichtag %s)\n' "$VORHER" "$NACH" "$STICHTAG"
printf '  Zielmarken:       %s\n' "$([ "$IN_PROGRESS" -eq 1 ] && printf 'eine Marke in-progress' || printf 'keine Marke in-progress — der Anwender benennt die laufende Marke (UPGRADE.md Schritt 4)')"
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
            git mv -- "$alt" "$neu"
        else
            mv -- "$DST/$alt" "$DST/$neu"
        fi
    fi
    printf '  %s -> %s\n' "$alt" "$neu"
    UMBENANNT="${UMBENANNT}${alt}	${neu}
"
}

# Trefferliste: Dateien unter wiki/ (und, ohne drittes Argument, Root-*.md),
# die ein Muster enthalten
treffer() {
    muster=$1; titel=$2; nurwiki=${3:-}
    hits=$( { [ -n "$nurwiki" ] || find "$DST" -maxdepth 1 -type f -name '*.md'; find "$DST/wiki" -type f -name '*.md' 2>/dev/null; } \
            | sort | while IFS= read -r f; do
                grep -l -- "$muster" "$f" 2>/dev/null
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
if [ "$MODUS" = B ]; then
    if [ "$PRUEFEN" -eq 1 ]; then
        printf '  würde das Submodul _template auf %s setzen\n' "${REF:-den aktuellen Stand der Quelle}"
    else
        if [ -n "$REF" ]; then
            if ! git -C "$NEU" fetch --quiet origin || ! git -C "$NEU" checkout --quiet "$REF" 2>/dev/null; then
                fehler "Quelle nicht erreichbar oder Stand '$REF' unbekannt ($SUB_URL) — melden und anhalten; der Anwender nennt eine andere Quelle, stellt den Zugang her oder lässt das Upgrade (UPGRADE.md Grundsätze)."
            fi
        else
            git submodule --quiet update --init --remote -- _template \
                || fehler "Quelle nicht erreichbar ($SUB_URL) — melden und anhalten; der Anwender nennt eine andere Quelle, stellt den Zugang her oder lässt das Upgrade (UPGRADE.md Grundsätze)."
        fi
        [ -f "$NEU/upgrade/UPGRADE.md" ] || fehler "Nach dem Submodul-Update fehlt _template/upgrade/UPGRADE.md — die Quelle trägt keinen 2.0-Stand."
        printf '  Submodul _template steht auf %s (%s)\n' "$(git -C "$NEU" describe --tags --always)" "$(git -C "$NEU" rev-parse --short HEAD)"
    fi
else
    if [ "$SRC" = "$NEU" ]; then
        printf '  _template/ trägt den neuen Stand schon (Aufruf aus _template/setup/) — kein Tausch\n'
    elif [ "$PRUEFEN" -eq 1 ]; then
        printf '  würde _template/ durch eine Kopie von %s ersetzen (ohne .git)\n' "$SRC"
    else
        rm -rf "$NEU"
        mkdir -p "$NEU"
        cp -R "$SRC/." "$NEU/"
        rm -rf "$NEU/.git"
        printf '  _template/ durch Kopie von %s ersetzt' "$SRC"
        if git -C "$SRC" rev-parse --verify -q HEAD >/dev/null 2>&1; then
            printf ' (%s, %s)' "$(git -C "$SRC" describe --tags --always)" "$(git -C "$SRC" rev-parse --short HEAD)"
        fi
        printf '\n'
    fi
fi
[ "$PRUEFEN" -eq 1 ] && NEU=$SRC
printf '\n'

# ---------------------------------------------------------------------
# 3 Umbenennungen (git mv, nie über eine vorhandene Datei)
# ---------------------------------------------------------------------

printf 'Umbenennungen%s\n' "$([ "$PRUEFEN" -eq 1 ] && printf ' (Vorschau)')"
umbenennen wiki/Verwendungs-Rollen.md wiki/Rollen.md
umbenennen wiki/Knotentypen.md wiki/Katalog.md
find "$DST/wiki" -type f -name '*.md' | sort | while IFS= read -r f; do
    rel=${f#"$DST/"}
    case $rel in
        *ä*|*ö*|*ü*|*Ä*|*Ö*|*Ü*|*ß*) printf '%s\n' "$rel" ;;
    esac
done > "$DST/.upgrade-umlaute.tmp"
while IFS= read -r rel; do
    [ -n "$rel" ] || continue
    umbenennen "$rel" "$(ae_name "$rel")"
done < "$DST/.upgrade-umlaute.tmp"
rm -f "$DST/.upgrade-umlaute.tmp"
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
    NEUANG=0; GLEICH=0; DELTA=""; OPTIONAL=""
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
                case $rel in */*) mkdir -p "$DST/${rel%/*}" ;; esac
                cp -- "$NEU/$rel" "$DST/$rel"
            fi
            NEUANG=$((NEUANG + 1))
            printf '  + %s\n' "$rel"
            if sed -n '2,/^---$/p' "$NEU/$rel" | grep -q '^active: false'; then
                OPTIONAL="${OPTIONAL}${rel}
"
            fi
        fi
    done
    if [ ! -e "$DST/.gitignore" ] && [ -e "$NEU/.gitignore" ]; then
        [ "$PRUEFEN" -eq 0 ] && cp -- "$NEU/.gitignore" "$DST/.gitignore"
        NEUANG=$((NEUANG + 1)); printf '  + .gitignore\n'
    fi
    printf '  angelegt: %s; vorhanden und inhaltsgleich: %s\n' "$NEUANG" "$GLEICH"
    if [ -n "$OPTIONAL" ]; then
        printf '  Hinweis an den Anwender — neue Fassaden liegen deaktiviert bereit (active: false), Aktivierung per Zuruf:\n'
        printf '%s' "$OPTIONAL" | sed 's/^/    - /'
    fi
    printf '\n'
    if [ -n "$DELTA" ]; then
        printf 'Delta-Nachzug — bestehende Dateien, die vom neuen Stand abweichen (nie automatisch; Übernahmen als Vorschlag, UPGRADE.md Schritt 5):\n'
        printf '%s' "$DELTA" | sed 's/^/  - /'
        printf '\n'
    fi
}

# ---------------------------------------------------------------------
# 5 Formalien im Frontmatter (1.x-nach-2.0.md Abschnitt 1)
# ---------------------------------------------------------------------

printf 'Formalien%s\n' "$([ "$PRUEFEN" -eq 1 ] && printf ' (Vorschau)')"
find "$DST/wiki" -type f -name '*.md' | sort | while IFS= read -r f; do
    grep -q '^subtype:\|^superseded-by:\|umgesetzt-wartet-auf-Prüfung\|^type: role$' "$f" || continue
    tmp="$f.upgrade-tmp"
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
            if (line ~ /\*\*Status:\*\*.*umgesetzt-wartet-auf-Prüfung/) sub(/umgesetzt-wartet-auf-Prüfung/, "umgesetzt (Prüfung offen — vor dem Upgrade umgesetzt-wartet-auf-Prüfung)", line)
            print line
        }
        END {
            if (wartet == 1) {
                if (verm == 0) { print ""; print "## Vermerke"; print "" }
                print "- **Vermerk " stichtag " (Upgrade):** Status vor dem Upgrade `umgesetzt-wartet-auf-Prüfung`; Prüfung offen."
            }
        }' "$f" > "$tmp"
    if cmp -s -- "$f" "$tmp"; then
        rm -f "$tmp"
    else
        printf '  %s\n' "${f#"$DST/"}"
        if [ "$PRUEFEN" -eq 0 ]; then mv -- "$tmp" "$f"; else rm -f "$tmp"; fi
    fi
done | {
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
if [ "$HV_FORM" = 2.0 ]; then
    printf '  %s\n  %s\n  (Vermerk mit der Zuordnungstabelle direkt unter Vorher: 1.x-nach-2.0.md Abschnitt 2)\n' "$TS" "$VZ"
    if [ "$PRUEFEN" -eq 0 ]; then
        awk -v ts="$TS" -v vz="$VZ" '
            /^- \*\*Template-Stand:\*\*/ && !done { print ts; print vz; done = 1; next }
            { print }' "$AP" > "$AP.upgrade-tmp" && mv -- "$AP.upgrade-tmp" "$AP"
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
            END { if (!done) { print ""; block() } }' "$AP" > "$AP.upgrade-tmp" && mv -- "$AP.upgrade-tmp" "$AP"
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
treffer 'SPEC-[0-9]' 'SPEC → FUNC mit alias: (Einträge, Detail-Knoten, Verweise)'
treffer 'BR-[0-9]' 'BR → BUG mit alias: (Einträge, Detail-Knoten, Verweise)'
treffer '^\*\*Stand:\*\*' 'Pflegezeile „Stand:“ → „Bearbeitungsstand:“ (Fassaden)' wiki
treffer '^type: testplan\|^type: deployment' 'Altknoten testplan/deployment — lesbar, Überführung anbieten' wiki
treffer '^fassung:' 'Contract-Einträge mit fassung — Umzug beim Upgrade des Providers anbieten' wiki
treffer '^> \*\*⚠ Abgelöst durch \[\[' 'Ablöse-Vermerke der 1.x-Form — bleiben stehen (Lint-Hinweis)' wiki
treffer '^### IDEA-.*Fassaden-Kandidat' 'Ideen-Einträge „Fassaden-Kandidat“ — bleiben' wiki
treffer 'Prüfung offen — vor dem Upgrade' 'Register-Zeilen mit Auslöser: — Auslöser-Zeile streichen' wiki
treffer 'Template-Herkunft' 'Herkunfts-Vermerk 1.x-Form — Zeilen Quelle, Prozess, Rolle füllen' wiki
[ "$IN_PROGRESS" -eq 1 ] || printf '  Zielmarken: keine Marke in-progress — laufende Marke vom Anwender benennen lassen und anlegen (vor dem Lint, UPGRADE.md Schritt 4)\n'
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
