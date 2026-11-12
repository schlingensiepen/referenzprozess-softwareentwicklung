---
type: internal-rule
---

# Umbenennen nur per Einzel-Edit

**Regel:** Kontext-sensitive Nummern oder Bezeichner
werden nie per globaler Ersetzung geändert, sondern
per Einzel-Edit mit Kontext-Prüfung. Lesen vor jeder
Umbenennung — von Kennungen, Phasennummern,
Knotennamen, Feldwerten.

1. Keine Massen-Ersetzung (`sed`, `perl`,
   Skript-Replace) für Bezeichner, deren Bedeutung vom
   Kontext abhängt; stattdessen Einzel-Edit mit Blick
   auf die Stelle oder ein kontext-bewusster Subagent.
2. Massen-Ersetzung nur bei nachweislich eindeutigem
   Marker (etwa ein vollständiger Wikilink
   `[[Name]]`).
3. Danach per Suche prüfen: Reste des alten Musters
   und unerwünschte neue Treffer (Wikilink-Titel,
   Frontmatter, Dateinamen, historische Zitate, die
   den alten Namen bewusst tragen).
4. Verstärkte Vorsicht direkt nach einer aufgelösten
   Namens-Kollision: dort kommt die eben gelöste
   Kollision am leichtesten zurück.
5. **Abgrenzung — Anhängen per Skript:** Das reine
   **Anhängen** gleichlautender Standard-Vermerke an
   viele Einträge per Einfüge-Skript ist zulässig, wenn
   das Skript nur anhängt und nichts ersetzt; danach
   Diff-Prüfung („keine Löschungen, Köpfe unverändert“),
   bei Bedarf eine Stichprobe durch einen Subagenten.
6. **Wiki-Knoten** werden nicht umbenannt (Wiki.md
   §5.5); Bezeichner des Regelwerks ändert nur das
   Upgrade, Wikilinks kontextbezogen.

**Warum:** Eine globale Ersetzung trifft auch Stellen,
die den alten Bezeichner bewusst tragen — Titel von
Wikilinks, Zitate, historische Einträge — und bringt so
eine eben gelöste Kollision zurück.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Namensbeständigkeit: Wiki.md §5.5, MasterPrompt §3.8
- Prüfung danach: Prüfprogramm (Wiki.md §9)
