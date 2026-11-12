---
type: facade-bootstrap
fassade: "Schriftsaetze"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Schriftsätze

_(Ziel: `wiki/Schriftsaetze.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status und Einstufung dieser Fassade: Steckbrief
§ Mitgebrachte Fassaden (Pflicht ab Stufe 1); was
mandatory für den Merge bedeutet: Wiki.md §3a, §11.3 —
vor den Schritten lesen. Beim Merge:

1. `active: true` bestätigen (Default; Pflicht ab
   Stufe 1, in jeder Ausbaustufe).
2. Kette je Verfahren aus der Akte aufbauen: jeder
   eingegangene Schriftsatz des Gegenübers und der
   Stelle als Zeile `eingegangen` mit Eingangsdokument
   ([[Eingangsdokumente]], `document_type:
   schriftsatz`); jeder eigene eingereichte als Zeile
   `eingereicht` mit Einreichung ([[Einreichungen]]);
   je Zeile ab `eingereicht` bzw. `eingegangen` den
   `submission`-Knoten mit `## Anlagen` anlegen
   ([[Katalog-Schriftsaetze]]).
3. Den Schriftsatz der laufenden Marke als Zeile
   `angekündigt` anlegen; sein Text entsteht in
   `output/` ([[Katalog-Schriftsatz]]).
4. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Outgoing.md §Versandstand baut `attachments` aus
  dem Abschnitt `## Anlagen`; die Paketprüfung ist
  Vorbedingung des Versandstands ([[Vorgehen-SP-2]]
  §Versand).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
  Die SP-2-Präfixe werden gesammelt im
  `internal-rule`-Knoten `Aktivierter-Prozess.md`
  verbucht (Merge-Schritt, nicht pro Fassade; dort
  auch die Zeile `Ausbaustufe`).
