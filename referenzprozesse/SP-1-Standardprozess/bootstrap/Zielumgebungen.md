---
type: facade-bootstrap
fassade: "Zielumgebungen"
prozess: "SP-1-Standardprozess"
---

# Bootstrap — Zielumgebungen

_(Ziel: `wiki/Zielumgebungen.md`. Ausführung beim Init/Merge
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
2. Erste Umgebung erst anlegen, wenn sie feststeht
   (spätestens vor dem ersten Deploy-Stand); nichts
   vorab erfinden. Soweit bekannt, die Kann-Felder
   Zugriffsstufe des Agenten und Ausführende (Mensch
   oder Agent) mit eintragen (`## Meta` der Fassade);
   der Init fragt sie nicht ab. Ist RP-2 aktiv, sind
   diese und die weiteren Felder der RP-2-Präzisierung
   Pflicht; der Einstieg „Bestand erfassen“ füllt sie,
   die Init-Frage von RP-2 erhebt Zugriffsstufe und
   Ausführende (RP-2 `index.md` §5).
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
