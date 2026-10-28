#!/bin/sh
# init-frisch.sh — kopiert die Startausstattung des Starters
# referenzprozess-softwareentwicklung in ein NEUES Projekt.
#
# Aufruf: aus dem Projektordner, z.B.
#   sh _template/setup/init-frisch.sh
# Ein Agent führt dieses Skript nur nach Zustimmung des Anwenders
# aus (Angebot in der Anleitung), nie ungefragt.
#
# Führender Ort der Kopier-Liste ist INIT.md (Schritt 1) — dieses
# Skript implementiert sie. Kollisionen: das Skript überschreibt
# nie eine vorhandene Projekt-Datei; eine vorhandene Datei, deren
# Inhalt mit der Starter-Datei identisch ist, ist keine Kollision
# und wird nur gezählt; jede andere wird ausgelassen und gelistet.
# Ein vorgefundener Ordner wiki/, der nicht aus diesem Starter
# stammt (kein inhaltsgleiches wiki/Init-Choreografie.md), ist EINE
# Kollision auf Ordner-Ebene: nichts wird hineinkopiert. Die Liste
# ist der Eingang der Kollisionsfrage im Fragen-Block von INIT.md
# (je Datei oder Ordner umbenennen und verlinken, integrieren oder
# beides); nach der Antwort benennt der Agent um und lässt das
# Skript erneut laufen — es ergänzt nur Fehlendes. Nichts wird still
# ausgelassen. Das Skript braucht kein Temp-Verzeichnis und schreibt
# nur in den Projektordner.
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

# Datei-Liste (Kopier-Liste INIT.md Schritt 1) erzeugen und in EINEM
# Block verarbeiten — Zähler und Kollisions-Liste leben im selben
# Subshell-Kontext, keine Temp-Dateien nötig.
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
    COLLREL=""

    if [ "$WIKI_FREMD" -eq 1 ]; then
        COLLREL="wiki/
"
        SKIPPED=1
    fi

    while IFS= read -r rel; do
        if [ -e "$DST/$rel" ]; then
            if cmp -s -- "$SRC/$rel" "$DST/$rel"; then
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

    echo "Starter-Startausstattung (frisch) kopiert: $COPIED Datei(en); schon vorhanden und inhaltsgleich: $SAME."
    if [ -n "$COLLREL" ]; then
        echo ""
        echo "ACHTUNG — $SKIPPED Kollision(en): Vorgefundenes mit anderem Inhalt wurde NICHT überschrieben, die Starter-Datei bzw. der Starter-Ordner wurde ausgelassen:"
        printf '%s' "$COLLREL" | while IFS= read -r rel; do
            echo "  - $rel"
        done
        if [ "$WIKI_FREMD" -eq 1 ]; then
            echo "  (wiki/ stammt nicht aus diesem Starter — kein inhaltsgleiches $WIKI_MARKER — und zählt als eine Kollision auf Ordner-Ebene; nichts wurde hineinkopiert.)"
        fi
        echo "Diese Liste ist der Eingang der Kollisionsfrage im Fragen-Block von INIT.md (je Datei oder Ordner: umbenennen und verlinken, integrieren oder beides). Erst nach der Antwort: Vorgefundenes umbenennen (Vorschlag <Name>-vorgefunden), dann dieses Skript erneut ausführen — es ergänzt nur Fehlendes."
    fi
    echo ""
    echo "Nächster Schritt: den Agenten '$SRC/INIT.md' abarbeiten lassen."
}
exit 0
