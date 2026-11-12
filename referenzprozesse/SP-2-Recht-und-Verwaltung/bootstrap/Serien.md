---
type: facade-bootstrap
fassade: "Serien"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Serien

_(Ziel: `wiki/Serien.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden (optional) — vor
der Aktivierungs-Wahl lesen. Beim Merge und später auf
Angebot oder Anweisung:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (keine Vorauswahl; Aktivierung mit der
   Strang-Entscheidung „Serie“ des Anwenders
   ([[Marken-SP-2]] §Stränge) — die Entscheidung ist
   die Anweisung). Bei Abwahl bleibt die
   Fassaden-Datei mit `active: false` liegen
   (Reaktivierung liest diese Bootstrap-Datei erneut;
   das Angebot des Agenten ist ein Aktions-Entwurf,
   Wiki.md §3a „Fassaden-Promotion“).
2. Bei Aktivierung die Einheiten der Serie aus
   Manifest oder Akte anlegen (Einheitstyp, Schlüssel,
   Varianten; Einheits-Knoten verlinken, etwa
   [[Flurstuecke]]); die gemeinsame Marke der Serie in
   [[Zielmarken]] eintragen und den Serien-Stand
   anbieten ([[Katalog-Serien-Stand]]).
3. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Je Einheit entsteht eine Einreichung mit eigenem
  Nachweis und eigener Erwartung ([[Einreichungen]]).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
