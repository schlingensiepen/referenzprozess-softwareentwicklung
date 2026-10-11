#!/bin/sh
# init-frisch.sh — kopiert die Startausstattung des Starters
# referenzprozess-softwareentwicklung in ein NEUES Projekt.
#
# Aufruf: aus dem Projektordner, z.B.
#   _template/setup/init-frisch.sh
#
# Führender Ort der Kopier-Liste ist INIT.md (§1) — dieses Skript
# implementiert sie. Kollisionsregel: nie eine vorhandene
# Projekt-Datei überschreiben; Kollisionen werden gelistet und
# gehören in den Fragen-Block von INIT.md. Das Skript braucht
# kein Temp-Verzeichnis und schreibt nur in den Projektordner.
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

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SRC=$(dirname -- "$SCRIPT_DIR")
DST=$(pwd)

if [ "$SRC" = "$DST" ]; then
    echo "FEHLER: Bitte aus dem Projektordner aufrufen, nicht im Starter selbst." >&2
    exit 1
fi

# Datei-Liste (Kopier-Liste INIT.md §1) erzeugen und in EINEM
# Block verarbeiten — Zähler und Kollisions-Liste leben im
# selben Subshell-Kontext, keine Temp-Dateien nötig.
{
    for f in MasterPrompt.md Wiki.md Vorgehen.md Reviewmuster.md \
             Outgoing.md Styleguide.md Styleguide-md.md \
             Styleguide-wiki.md devstate_active.md; do
        printf '%s\n' "$f"
    done
    ( cd "$SRC" && find referenzprozesse wiki -type f | sort )
} | {
    COPIED=0
    SKIPPED=0
    COLLREL=""

    while IFS= read -r rel; do
        if [ -e "$DST/$rel" ]; then
            COLLREL="${COLLREL}${rel}
"
            SKIPPED=$((SKIPPED + 1))
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

    echo "Starter-Startausstattung (frisch) kopiert: $COPIED Datei(en)."
    if [ -n "$COLLREL" ]; then
        echo ""
        echo "ACHTUNG — $SKIPPED Kollision(en), vorhandene Dateien wurden NICHT überschrieben:"
        printf '%s' "$COLLREL" | while IFS= read -r rel; do
            echo "  - $rel"
        done
        echo "Diese Liste gehört in den Fragen-Block von INIT.md."
    fi
    echo ""
    echo "Nächster Schritt: den Agenten '$SRC/INIT.md' abarbeiten lassen."
}
exit 0
