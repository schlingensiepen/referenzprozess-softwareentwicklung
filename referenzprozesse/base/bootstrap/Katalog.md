---
type: facade-bootstrap
fassade: "Katalog"
prozess: "base"
---

# Bootstrap — Katalog

_(Ziel: `wiki/Katalog.md` samt Katalog-Einträgen
`wiki/Katalog-<Name>.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung und Deaktivierungs-Grenzen dieser Fassade:
Wiki.md §3a („mandatory vs. optional beim Init“,
„Deaktivierungs-Grenzen“) — vor den Schritten lesen.

1. Bearbeitungsstand-Zeile setzen; die Basis-Einträge liegen
   bereits als Dateien im `wiki/` und sind in der
   Fassade verankert.
2. Bei Prozess-Wahl im Init: die mitgebrachten
   Katalog-Einträge des gewählten Prozesses liegen nach
   dem Zusammenkopieren (Wiki.md §11.3) als Dateien im
   `wiki/`; je Eintrag eine Zeile im Abschnitt
   „Prozess-mitgebrachte Einträge“ anlegen; Ersetzungen
   (`Replaces type`) nach Wiki.md §11.4 anwenden.
3. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie `Basis`.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
