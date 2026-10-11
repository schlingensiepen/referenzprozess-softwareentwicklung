---
type: facade-bootstrap
fassade: "Systemtest-Setup"
prozess: "SP-1-Standardprozess"
---

# Bootstrap — Systemtest-Setup

_(Ziel: `wiki/Systemtest-Setup.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; in Modus A
liegt sie in der mitkopierten
`referenzprozesse/SP-1-Standardprozess/bootstrap/`-Vorlage —
DEC-217.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **mandatory** (Steckbrief
§ Mitgebrachte Fassaden) — sie wird beim SP-1-Merge
automatisch aktiv, keine Anwender-Frage. Beim Merge:

1. `active: true` bestätigen (Default).
2. Erst-Befüllung aus den Test-Entscheidungen ableiten,
   sobald sie getroffen sind.
3. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-1)`.
- Keine `internal-*`-Knoten anzulegen.
