---
type: facade-bootstrap
fassade: "Anlagen"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Anlagen

_(Ziel: `wiki/Anlagen.md`. Ausführung beim Init/Merge
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
2. Nummerierungsschema der Anlagen am Verfahren
   bestätigen ([[Verfahren]], Feld `anlagen_schema`;
   Voreinstellung des Referenzprozesses, Anordnung der
   Stelle geht vor).
3. Bereits eingereichte Anlagen aus der Akte mit ihren
   endgültigen Nummern anlegen (Verwendung
   `eingefuehrt`, Status `angenommen`); Lücken mit
   Verwendung `zurueckgenommen` sichtbar halten.
4. Für den Schriftsatz in Arbeit nur `temp-`-Einträge
   anlegen; die Umschreibung auf endgültige Nummern
   erfolgt beim Tag.
5. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Die `temp-`-Prüfung an Tag und Versandstand
  (FEHLER) ist Teil der Prozess-Prüfungen
  ([[Vorgehen-SP-2]] §Wächter); sie greift ab der
  Aktivierung.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
  Die SP-2-Präfixe werden gesammelt im
  `internal-rule`-Knoten `Aktivierter-Prozess.md`
  verbucht (Merge-Schritt, nicht pro Fassade; dort
  auch die Zeile `Ausbaustufe`).
