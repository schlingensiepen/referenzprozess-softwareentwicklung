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
# Varianten werden nur gegen Dateien getauscht, die dieser Lauf
# selbst kopiert hat. Das Skript braucht kein Temp-Verzeichnis
# und schreibt nur in den Projektordner.
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
    ( cd "$SRC" && find referenzprozesse wiki -type f | sort )
} | {
    COPIED=0
    SKIPPED=0
    SWAPPED=0
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

    # war $1 eine Kollision (Bestands-Datei)?
    collided() {
        printf '%s' "$COLLREL" | grep -Fxq -- "$1"
    }

    # tauscht eine eben kopierte Datei gegen ihre
    # Migrations-Variante; Bestands-Dateien (Kollisionen)
    # bleiben unangetastet — Fallback: MIGRATION.md Phase 0
    swap_variant() {
        variant_rel=$1   # Pfad der Variante relativ zum Starter-Root
        target_rel=$2    # Ziel-Pfad relativ zum Projekt-Root
        if [ -e "$DST/$target_rel" ] && ! collided "$target_rel"; then
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

    echo "Starter-Ausstattung (Migration) kopiert: $COPIED Datei(en), $SWAPPED Variante(n) eingetauscht."
    if [ -n "$COLLREL" ]; then
        echo ""
        echo "ACHTUNG — $SKIPPED Kollision(en), Bestands-Dateien wurden NICHT überschrieben:"
        printf '%s' "$COLLREL" | while IFS= read -r rel; do
            echo "  - $rel"
        done
        echo "Diese Liste gehört in den Phase-1-Fragen-Block von migration/MIGRATION.md."
    fi
    echo ""
    echo "Nächster Schritt: den Agenten '$SRC/migration/MIGRATION.md' abarbeiten lassen."
}
exit 0
