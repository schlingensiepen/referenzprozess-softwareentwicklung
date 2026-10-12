---
type: facade-bootstrap
fassade: "Softwaresystemtest-Setup"
prozess: "RP-1-Systementwicklung"
---

# Bootstrap — Softwaresystemtest-Setup

_(Ziel: `wiki/Softwaresystemtest-Setup.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/RP-1-Systementwicklung/bootstrap/` —
DEC-217, DEC-223.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **mandatory** (Steckbrief
§ Mitgebrachte Fassaden) — sie wird beim RP-1-Merge
automatisch aktiv, keine Anwender-Frage. Beim Merge
(bzw. Prozess-Upgrade):

1. `active: true` bestätigen (Default).
2. Ablösung vollziehen (Wiki.md §11.4): die
   SP-1-Fassade [[Systemtest-Setup]] auf
   `active: false` setzen und dort den Vermerk
   „abgelöst durch [[Softwaresystemtest-Setup]]"
   eintragen; vorhandene Inhalte übernehmen.
3. Erst-Befüllung aus der Test-Framework-Entscheidung
   ableiten, sobald sie getroffen ist.
4. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (RP-1)`; den
  Systemtest-Setup-Eintrag auf `deaktiviert` setzen mit
  Vermerk „abgelöst durch [[Softwaresystemtest-Setup]]".
- Keine `internal-*`-Knoten anzulegen; die Ablösung
  wird im `internal-rule`-Knoten
  `Aktivierter-Prozess.md` unter „Abgelöste
  Ausprägungen" verbucht (Merge-Schritt).
