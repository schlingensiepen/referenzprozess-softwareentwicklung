---
type: facade-bootstrap
fassade: "Abnahmeprotokolle"
prozess: "RP-2-IT-Infrastruktur"
---

# Bootstrap — Abnahmeprotokolle

_(Ziel: `wiki/Abnahmeprotokolle.md`. Ausführung beim
Init/Merge bzw. bei Reaktivierung — Wiki.md §11.3/§3a.
Diese Datei wird nie ins Anwender-wiki kopiert; sie
liegt in beiden Modi unter
`_template/referenzprozesse/RP-2-IT-Infrastruktur/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status und Einstufung dieser Fassade: Steckbrief
§ Mitgebrachte Fassaden; was mandatory für den Merge
bedeutet: Wiki.md §3a, §11.3 — vor den Schritten
lesen. Beim Merge:

1. `active: true` bestätigen (Default).
2. Keinen Eintrag vorab anlegen: der erste Eintrag
   entsteht mit der ersten Abnahme am Ziel nach einem
   freigegebenen Deploy-Stand (`## Meta` der Fassade).
3. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (RP-2)`.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
