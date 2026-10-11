#!/bin/sh
# init-migration.sh — kopiert die Starter-Ausstattung von
# referenzprozess-softwareentwicklung in ein BESTEHENDES Projekt
# und tauscht danach die Migrations-Varianten-Dateien ein.
#
# Aufruf: aus dem Projektordner, z.B.
#   _template/setup/init-migration.sh
#
# Führender Ort der Kopier-Liste ist migration/MIGRATION.md
# (Phase 0) — dieses Skript implementiert sie. Kollisionsregel:
# nie eine vorhandene Bestands-Datei überschreiben; Kollisionen
# werden gelistet und gehören in den Phase-1-Fragen-Block.
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
COLL="$TMPDIRBASE/starter-migration-kollisionen.$$"
DONE="$TMPDIRBASE/starter-migration-kopiert.$$"
: > "$COLL"
: > "$DONE"
COPIED=0
SKIPPED=0
SWAPPED=0

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
    printf '%s\n' "$rel" >> "$DONE"
    COPIED=$((COPIED + 1))
}

# tauscht eine eben kopierte Datei gegen ihre Migrations-Variante;
# Bestands-Dateien (Kollisionen) bleiben unangetastet
swap_variant() {
    variant_rel=$1   # Pfad der Variante relativ zum Starter-Root
    target_rel=$2    # Ziel-Pfad relativ zum Projekt-Root
    if grep -Fqx -- "$target_rel" "$DONE"; then
        cp -f -- "$SRC/$variant_rel" "$DST/$target_rel"
        SWAPPED=$((SWAPPED + 1))
    fi
}

# --- Wurzel-Dokumente (Kopier-Liste MIGRATION.md Phase 0) ---
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
    ( cd "$SRC" && find "$tree" -type f ) | sort > "$TMPDIRBASE/starter-migration-dateien.$$"
    while IFS= read -r rel; do
        copy_file "$rel"
    done < "$TMPDIRBASE/starter-migration-dateien.$$"
    rm -f "$TMPDIRBASE/starter-migration-dateien.$$"
done

# --- Varianten-Eintausch (migration/ ersetzt Frisch-Pendants) ---
swap_variant "migration/devstate_active.md"              "devstate_active.md"
swap_variant "migration/wiki/Zielmarken.md"              "wiki/Zielmarken.md"
swap_variant "migration/wiki/Aktivierter-Prozess.md"     "wiki/Aktivierter-Prozess.md"
swap_variant "migration/wiki/Commit-Sprache.md"          "wiki/Commit-Sprache.md"
swap_variant "migration/wiki/WorkspaceManager-Kontrakt.md" "wiki/WorkspaceManager-Kontrakt.md"
swap_variant "migration/wiki/InterneMechanik.md"         "wiki/InterneMechanik.md"

# --- Abschluss-Meldung ---
echo "Starter-Ausstattung (Migration) kopiert: $COPIED Datei(en), $SWAPPED Variante(n) eingetauscht."
if [ -s "$COLL" ]; then
    echo ""
    echo "ACHTUNG — $SKIPPED Kollision(en), Bestands-Dateien wurden NICHT überschrieben:"
    while IFS= read -r rel; do
        echo "  - $rel"
    done < "$COLL"
    echo "Diese Liste gehört in den Phase-1-Fragen-Block von migration/MIGRATION.md."
fi
rm -f "$COLL" "$DONE"
echo ""
echo "Nächster Schritt: den Agenten '$SRC/migration/MIGRATION.md' abarbeiten lassen."
exit 0
