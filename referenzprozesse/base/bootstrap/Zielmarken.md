---
type: facade-bootstrap
fassade: "Zielmarken"
prozess: "base"
---

# Bootstrap — Zielmarken

_(Ziel: `wiki/Zielmarken.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; in Modus A
liegt sie in der mitkopierten
`referenzprozesse/base/bootstrap/`-Vorlage —
DEC-217.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **optional** mit Basis-Vorauswahl
„aktiv". Beim Init:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „aktivieren").
2. Bei Aktivierung: **Erst-Definition** — der Agent
   leitet aus dem Auftrag zwei bis drei
   Marken-Vorschläge ab (Ableiten-und-Vorlegen; die
   Vorstellung des Mechanismus ist bereits im
   Init-Fahrplan erfolgt, Fahrplan-Vorlage
   Punkt 6); mindestens die `in-progress`-Marke
   entsteht beim Init.
3. `### Verankerungen` abarbeiten. Bei Abwahl
   bleibt die Fassaden-Datei mit `active: false`
   liegen (dann entfallen Erst-Definition und
   Marken-Mechanik; Reaktivierung liest diese
   Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie `Basis`.
- Keine `internal-*`-Knoten anzulegen.
