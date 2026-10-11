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
# gehören in den Fragen-Block von INIT.md.
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

TMPDIRBASE=${TMPDIR:-/tmp}
COLL="$TMPDIRBASE/starter-init-kollisionen.$$"
: > "$COLL"
COPIED=0
SKIPPED=0

# kopiert eine Datei (Pfad relativ zum Starter-Root), nie überschreibend
copy_file() {
    rel=$1
    if [ -e "$DST/$rel" ]; then
        printf '%s\n' "$rel" >> "$COLL"
        SKIPPED=$((SKIPPED + 1))
        return 0
    fi
    dir=$(dirname -- "$rel")
    [ "$dir" = "." ] || mkdir -p "$DST/$dir"
    cp -- "$SRC/$rel" "$DST/$rel"
    COPIED=$((COPIED + 1))
}

# --- Wurzel-Dokumente (Kopier-Liste INIT.md §1) ---
for f in MasterPrompt.md Wiki.md Vorgehen.md Reviewmuster.md \
         Outgoing.md Styleguide.md Styleguide-md.md Styleguide-wiki.md \
         devstate_active.md; do
    copy_file "$f"
done

# .gitignore nur, wenn im Projekt keine existiert (zählt nicht als Kollision)
if [ ! -e "$DST/.gitignore" ] && [ -e "$SRC/.gitignore" ]; then
    cp -- "$SRC/.gitignore" "$DST/.gitignore"
    COPIED=$((COPIED + 1))
fi

# --- referenzprozesse/ und wiki/ (komplett, Datei für Datei) ---
for tree in referenzprozesse wiki; do
    ( cd "$SRC" && find "$tree" -type f ) | sort > "$TMPDIRBASE/starter-init-dateien.$$"
    while IFS= read -r rel; do
        copy_file "$rel"
    done < "$TMPDIRBASE/starter-init-dateien.$$"
    rm -f "$TMPDIRBASE/starter-init-dateien.$$"
done

# --- Abschluss-Meldung ---
echo "Starter-Startausstattung (frisch) kopiert: $COPIED Datei(en)."
if [ -s "$COLL" ]; then
    echo ""
    echo "ACHTUNG — $SKIPPED Kollision(en), vorhandene Dateien wurden NICHT überschrieben:"
    while IFS= read -r rel; do
        echo "  - $rel"
    done < "$COLL"
    echo "Diese Liste gehört in den Fragen-Block von INIT.md."
fi
rm -f "$COLL"
echo ""
echo "Nächster Schritt: den Agenten '$SRC/INIT.md' abarbeiten lassen."
exit 0
