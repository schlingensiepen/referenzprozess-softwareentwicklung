---
type: facade-bootstrap
fassade: "Mission Statement"
prozess: "base"
---

# Bootstrap — Mission Statement

_(Ziel: `wiki/Mission Statement.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
DEC-217, DEC-223.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **optional** mit Basis-Vorauswahl
„aktiv". Beim Init:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „aktivieren").
2. Bei Aktivierung: Setup-Dialog am Ende von
   Sessionstart Phase D führen (Wiki.md §3a.2): aktiv
   fragen → Entwurf vorschlagen → User bestätigt/
   korrigiert/ergänzt. Fallback: minimalistisch, nur
   Projektname + Zweck aus [[Facts]] §Projekteinstieg.
3. `### Verankerungen` abarbeiten. Bei Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest
   diese Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie `Basis`.
- Keine `internal-*`-Knoten anzulegen.
