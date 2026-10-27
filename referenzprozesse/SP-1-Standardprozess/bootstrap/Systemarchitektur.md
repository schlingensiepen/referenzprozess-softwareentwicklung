---
type: facade-bootstrap
fassade: "Systemarchitektur"
prozess: "SP-1-Standardprozess"
---

# Bootstrap — Systemarchitektur

_(Ziel: `wiki/Systemarchitektur.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-1-Standardprozess/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status und Einstufung dieser Fassade: Steckbrief
§ Mitgebrachte Fassaden; was mandatory für den Merge
bedeutet: Wiki.md §3a, §11.3 — vor den Schritten
lesen. Beim Merge:

1. `active: true` bestätigen (Default).
2. Erst-Befüllung der lebenden Sektionen aus dem
   Auftrag ableiten, sobald das Vorhaben umrissen ist
   (Sollzustand, siehe Meta); in §Komponenten
   mindestens die Zeile des eigenen Repos anlegen
   (Repo-Name, Pfad, Remote). Festlegungen entstehen
   als ARC-Elemente erst mit Anwender-OK.
3. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-1)`.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
