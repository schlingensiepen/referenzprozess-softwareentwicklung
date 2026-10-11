---
type: facade-bootstrap
fassade: "Geschäftsbeziehungen"
prozess: "SP-1-Standardprozess"
---

# Bootstrap — Geschäftsbeziehungen

_(Ziel: `wiki/Geschäftsbeziehungen.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; in Modus A
liegt sie in der mitkopierten
`referenzprozesse/SP-1-Standardprozess/bootstrap/`-Vorlage —
DEC-217.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **optional** mit Vorauswahl
„deaktiviert" (Steckbrief § Mitgebrachte Fassaden).
Beim Merge:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „deaktiviert lassen,
   sofern kein Markt-Kontext"; bei
   Produktentwicklungs-Vorhaben Empfehlung
   „aktivieren").
2. Bei Aktivierung: `### Verankerungen` abarbeiten. Bei Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest
   diese Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-1)`.
- Keine `internal-*`-Knoten anzulegen.
