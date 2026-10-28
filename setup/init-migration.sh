#!/bin/sh
# init-migration.sh — kopiert die Starter-Ausstattung von
# referenzprozess-softwareentwicklung in ein BESTEHENDES Projekt
# und tauscht danach die Migrations-Varianten ein.
#
# Aufruf: aus dem Projektordner, z.B.
#   sh _template/setup/init-migration.sh
# Ein Agent führt dieses Skript nur nach Zustimmung des Anwenders
# aus (Angebot in der Anleitung), nie ungefragt.
#
# Führender Ort der Kopier-Liste ist migration/MIGRATION.md
# (Phase 0) — dieses Skript implementiert sie. Kollisionen: das
# Skript überschreibt nie eine vorgefundene Datei; eine vorhandene
# Datei, deren Inhalt mit der Starter-Datei (oder ihrer Variante)
# identisch ist, ist keine Kollision und wird nur gezählt; jede
# andere wird ausgelassen und gelistet. Ein vorgefundener Ordner
# wiki/, der nicht aus diesem Starter stammt (kein inhaltsgleiches
# wiki/Init-Choreografie.md), ist EINE Kollision auf Ordner-Ebene:
# nichts wird hineinkopiert, keine Variante dorthin getauscht. Die
# Liste ist der Eingang der Kollisionsfrage im Phase-1-Fragen-Block
# (je Datei oder Ordner umbenennen und verlinken, integrieren oder
# beides); nach der Antwort benennt der Agent um und lässt das
# Skript erneut laufen — es ergänzt nur Fehlendes. Nichts wird still
# ausgelassen. Varianten werden nur gegen Dateien getauscht, die
# dieser Lauf selbst kopiert hat; ein kollidierendes Varianten-Ziel
# bleibt unangetastet. Das Skript braucht kein Temp-Verzeichnis und
# schreibt nur in den Projektordner.
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

SCRIPT_DIR=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
SRC=$(dirname -- "$SCRIPT_DIR")
DST=$(pwd)

if [ "$SRC" = "$DST" ]; then
    echo "FEHLER: Bitte aus dem Projektordner aufrufen, nicht im Starter selbst." >&2
    exit 1
fi

# Ordner-Kollision: liegt im Projekt schon ein wiki/, das nicht aus
# diesem Starter stammt? Erkennungs-Datei ist wiki/Init-Choreografie.md
# (muss vorhanden und inhaltsgleich sein, sonst ist der Ordner fremd).
WIKI_MARKER=wiki/Init-Choreografie.md
WIKI_FREMD=0
if [ -e "$DST/wiki" ]; then
    if [ ! -f "$DST/$WIKI_MARKER" ] \
       || ! cmp -s -- "$SRC/$WIKI_MARKER" "$DST/$WIKI_MARKER"; then
        WIKI_FREMD=1
    fi
fi

# Varianten-Tabelle (MIGRATION.md Phase 0 „Danach eintauschen“):
# gibt zum Ziel-Pfad den Pfad der Variante relativ zum Starter-Root
# aus, sonst nichts.
variant_of() {
    case $1 in
        devstate_active.md)                 echo "migration/devstate_active.md" ;;
        wiki/Zielmarken.md)                 echo "migration/wiki/Zielmarken.md" ;;
        wiki/Aktivierter-Prozess.md)        echo "migration/wiki/Aktivierter-Prozess.md" ;;
        wiki/Commit-Sprache.md)             echo "migration/wiki/Commit-Sprache.md" ;;
        wiki/WorkspaceManager-Kontrakt.md)  echo "migration/wiki/WorkspaceManager-Kontrakt.md" ;;
        wiki/InterneMechanik.md)            echo "migration/wiki/InterneMechanik.md" ;;
        *) ;;
    esac
}

# Datei-Liste (Kopier-Liste MIGRATION.md Phase 0) erzeugen und in
# EINEM Block verarbeiten — Zähler, Kollisions-Liste und der
# Varianten-Eintausch leben im selben Subshell-Kontext, keine
# Temp-Dateien nötig.
{
    for f in MasterPrompt.md Wiki.md Vorgehen.md Reviewmuster.md \
             Outgoing.md Styleguide.md Styleguide-md.md \
             Styleguide-wiki.md devstate_active.md; do
        printf '%s\n' "$f"
    done
    # referenzprozesse/, tools/ und upgrade/ werden NICHT kopiert —
    # sie bleiben in _template/ (Nur-Lese, beide Einbindungs-Modi).
    # wiki/ nur, wenn es nicht als fremder Ordner kollidiert.
    if [ "$WIKI_FREMD" -eq 0 ]; then
        ( cd "$SRC" && find wiki -type f | sort )
    fi
} | {
    COPIED=0
    SAME=0
    SKIPPED=0
    SWAPPED=0
    COLLREL=""

    if [ "$WIKI_FREMD" -eq 1 ]; then
        COLLREL="wiki/
"
        SKIPPED=1
    fi

    while IFS= read -r rel; do
        if [ -e "$DST/$rel" ]; then
            var=$(variant_of "$rel")
            if cmp -s -- "$SRC/$rel" "$DST/$rel" \
               || { [ -n "$var" ] && cmp -s -- "$SRC/$var" "$DST/$rel"; }; then
                SAME=$((SAME + 1))
            else
                COLLREL="${COLLREL}${rel}
"
                SKIPPED=$((SKIPPED + 1))
            fi
        else
            case $rel in
                */*) mkdir -p "$DST/${rel%/*}" ;;
            esac
            cp -- "$SRC/$rel" "$DST/$rel"
            COPIED=$((COPIED + 1))
        fi
    done

    # .gitignore nur, wenn im Projekt keine existiert
    # (Sonderfall, zählt nicht als Kollision)
    if [ ! -e "$DST/.gitignore" ] && [ -e "$SRC/.gitignore" ]; then
        cp -- "$SRC/.gitignore" "$DST/.gitignore"
        COPIED=$((COPIED + 1))
    fi

    # war $1 eine Kollision (vorgefundene Datei mit anderem Inhalt
    # oder Datei in einem fremden, kollidierenden wiki/)?
    collided() {
        case $1 in
            wiki/*) [ "$WIKI_FREMD" -eq 1 ] && return 0 ;;
        esac
        printf '%s' "$COLLREL" | grep -Fxq -- "$1"
    }

    # tauscht eine eben kopierte (oder inhaltsgleich vorhandene)
    # Frisch-Datei gegen ihre Migrations-Variante; Kollisionen
    # bleiben unangetastet — sie kommen nach der Kollisionsfrage
    # (MIGRATION.md Phase 1) durch den Agenten.
    swap_variant() {
        variant_rel=$1   # Pfad der Variante relativ zum Starter-Root
        target_rel=$2    # Ziel-Pfad relativ zum Projekt-Root
        if [ -e "$DST/$target_rel" ] && ! collided "$target_rel" \
           && ! cmp -s -- "$SRC/$variant_rel" "$DST/$target_rel"; then
            cp -f -- "$SRC/$variant_rel" "$DST/$target_rel"
            SWAPPED=$((SWAPPED + 1))
        fi
    }

    swap_variant "migration/devstate_active.md"                "devstate_active.md"
    swap_variant "migration/wiki/Zielmarken.md"                "wiki/Zielmarken.md"
    swap_variant "migration/wiki/Aktivierter-Prozess.md"       "wiki/Aktivierter-Prozess.md"
    swap_variant "migration/wiki/Commit-Sprache.md"            "wiki/Commit-Sprache.md"
    swap_variant "migration/wiki/WorkspaceManager-Kontrakt.md" "wiki/WorkspaceManager-Kontrakt.md"
    swap_variant "migration/wiki/InterneMechanik.md"           "wiki/InterneMechanik.md"

    echo "Starter-Ausstattung (Migration) kopiert: $COPIED Datei(en), $SWAPPED Variante(n) eingetauscht; schon vorhanden und inhaltsgleich: $SAME."
    if [ -n "$COLLREL" ]; then
        echo ""
        echo "ACHTUNG — $SKIPPED Kollision(en): Vorgefundenes mit anderem Inhalt wurde NICHT überschrieben, die Starter-Datei (bzw. ihre Variante) oder der Starter-Ordner wurde ausgelassen:"
        printf '%s' "$COLLREL" | while IFS= read -r rel; do
            echo "  - $rel"
        done
        if [ "$WIKI_FREMD" -eq 1 ]; then
            echo "  (wiki/ stammt nicht aus diesem Starter — kein inhaltsgleiches $WIKI_MARKER — und zählt als eine Kollision auf Ordner-Ebene; nichts wurde hineinkopiert, keine Variante dorthin getauscht.)"
        fi
        echo "Diese Liste ist der Eingang der Kollisionsfrage im Phase-1-Fragen-Block von migration/MIGRATION.md (je Datei oder Ordner: umbenennen und verlinken, integrieren oder beides). Erst nach der Antwort: Vorgefundenes umbenennen (Vorschlag <Name>-vorgefunden), dann dieses Skript erneut ausführen — es ergänzt nur Fehlendes und tauscht die Varianten ein."
    fi
    echo ""
    echo "Nächster Schritt: den Agenten '$SRC/migration/MIGRATION.md' abarbeiten lassen."
}
exit 0
