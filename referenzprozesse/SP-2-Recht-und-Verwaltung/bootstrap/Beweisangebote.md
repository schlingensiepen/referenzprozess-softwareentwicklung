---
type: facade-bootstrap
fassade: "Beweisangebote"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Beweisangebote

_(Ziel: `wiki/Beweisangebote.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden (optional ab Stufe 2) — vor
der Aktivierungs-Wahl lesen. Beim Merge und später auf
Angebot oder Anweisung:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage ab Stufe 2 mit Empfehlung
   „aktivieren, sobald eine Tatsache bestritten ist
   oder ein Beweisbeschluss eingeht“; unterhalb von
   Stufe 2 nicht anbieten). Bei Abwahl bleibt die
   Fassaden-Datei mit `active: false` liegen
   (Reaktivierung liest diese Bootstrap-Datei erneut;
   das Angebot des Agenten ist ein Aktions-Entwurf,
   Wiki.md §3a „Fassaden-Promotion“).
2. Bei Aktivierung die Beweisangebote aus der Akte je
   Beweisthema anlegen (`source` Pflicht, `target` die
   TAT-ID aus [[Sachverhalt]], Beweisart, Art des
   Angebots); Urkunden mit ihrer Nummer in
   [[Anlagen]] verknüpfen; die Felder Beweis der
   Tatsachen nachführen.
3. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Ohne diese Fassade bleibt `evidence` als
  Relations-Typ verfügbar (Feld Beweis in
  [[Sachverhalt]] nennt Anlage oder Dokument direkt);
  die Fassade bündelt und bewertet.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
