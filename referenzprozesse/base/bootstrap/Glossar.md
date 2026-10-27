---
type: facade-bootstrap
fassade: "Glossar"
prozess: "base"
---

# Bootstrap — Glossar

_(Ziel: `wiki/Glossar.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung und Basis-Vorauswahl dieser Fassade:
Wiki.md §3a („mandatory vs. optional beim Init“) —
vor der Aktivierungs-Wahl lesen. Beim Init:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „aktivieren";
   sinnvollerweise zusammen mit [[Glossar Review]]).
2. Bei Aktivierung: `### Verankerungen` abarbeiten. Bei Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest
   diese Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] prüfen (Status, Kurzform).
- Die mitgelieferten Einträge unter `## Einträge`
  (Begriffe des Regelwerks) bleiben stehen; sie gelten
  als freigegeben mit dem Template-Stand und
  durchlaufen den Review-Prozess nicht.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
