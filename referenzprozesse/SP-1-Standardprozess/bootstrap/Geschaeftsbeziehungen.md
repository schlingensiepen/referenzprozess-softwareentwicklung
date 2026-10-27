---
type: facade-bootstrap
fassade: "Geschaeftsbeziehungen"
prozess: "SP-1-Standardprozess"
---

# Bootstrap — Geschäftsbeziehungen

_(Ziel: `wiki/Geschaeftsbeziehungen.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-1-Standardprozess/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden — vor der
Aktivierungs-Wahl lesen. Beim Merge:

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
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
