---
type: facade-bootstrap
fassade: "Verfahren"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Verfahren

_(Ziel: `wiki/Verfahren.md`. Ausführung beim Init/Merge
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
2. Erstes Verfahren anlegen (Init-Frage „Gegenüber und
   erstes Verfahren“, SP-2-`index.md` §4.6 Frage 2): Stelle
   ([[Organisationen]] mit `authority`), Aktenzeichen
   ([[Aktenzeichen]]; sonst `VF-001` als Schlüssel),
   Instanz, Gegenüber mit Stellung, Rolle des
   Anwenders, Vertretung und Vertretungszwang,
   Verfahrensgrundsatz, Nummerierungsschema der
   Anlagen (Voreinstellung des Referenzprozesses
   vorschlagen), Status, Stufe, in der das Verfahren
   beginnt.
3. Bestehende Akte zuerst einlesen
   ([[Eingangsdokumente]]): daraus Vorgänger,
   Instanzenzug, weitere Verfahren und laufende
   Fristen ziehen; laufende Fristen sofort melden
   ([[Fristen]]).
4. Je Verfahren den `case`-Knoten anlegen
   ([[Katalog-Verfahren]]).
5. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Die Register [[Fristen]], [[Eingangsdokumente]],
  [[Aktenzeichen]] und [[Chronologie]] sind mit SP-2
  Pflicht (Steckbrief § Basis-Fassaden); ihre Einträge
  nennen das Verfahren (`case:` bzw. Aktenzeichen).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
  Die SP-2-Präfixe werden gesammelt im
  `internal-rule`-Knoten `Aktivierter-Prozess.md`
  verbucht (Merge-Schritt, nicht pro Fassade; dort
  auch die Zeile `Ausbaustufe`).
