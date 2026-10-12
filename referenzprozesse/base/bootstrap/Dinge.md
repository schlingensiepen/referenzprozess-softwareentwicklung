---
type: facade-bootstrap
fassade: "Dinge"
prozess: "base"
---

# Bootstrap — Dinge

_(Ziel: `wiki/Dinge.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
DEC-217, DEC-223.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **optional** mit Basis-Vorauswahl
„deaktiviert" (geringere Grundlast; Reaktivierung
trivial). Beim Init:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „deaktiviert
   lassen", sofern physische Dinge im Projekt
   keine Rolle spielen).
2. Bei Aktivierung: `### Verankerungen` abarbeiten. Bei Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest
   diese Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] von „deaktiviert" auf
  „aktiv" umsetzen (Kurzform-Erklärung, Wikilink,
  Kategorie `Basis`).
- Keine `internal-*`-Knoten anzulegen.
