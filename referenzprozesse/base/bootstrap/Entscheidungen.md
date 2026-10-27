---
type: facade-bootstrap
fassade: "Entscheidungen"
prozess: "base"
---

# Bootstrap — Entscheidungen

_(Ziel: `wiki/Entscheidungen.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung dieser Fassade: Pflicht-Fassade in jedem
Projekt, mit und ohne Prozess (Wiki.md §3a
„mandatory“) — keine Aktivierungs-Wahl, `active: true`
bleibt; Freigaben, die Freigabe des Abschluss-Stands
und der Marken-Wechsel werden hier gebucht. Beim Init:

1. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] prüfen (Status, Kurzform).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
