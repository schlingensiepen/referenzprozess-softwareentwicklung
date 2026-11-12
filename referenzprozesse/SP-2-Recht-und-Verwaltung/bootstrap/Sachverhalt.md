---
type: facade-bootstrap
fassade: "Sachverhalt"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Sachverhalt

_(Ziel: `wiki/Sachverhalt.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status, Einstufung und Stufe dieser Fassade: Steckbrief
§ Mitgebrachte Fassaden (Pflicht ab Stufe 2) — vor der
Aktivierung lesen. Beim Merge und bei jedem
Stufenwechsel:

1. Stufe prüfen: aktiv ab **Stufe 2** (Streit); die Zeile
   `Ausbaustufe` in [[Aktivierter-Prozess]] führt die
   Stufe.
   Unterhalb der Stufe bleibt die Fassaden-Datei mit
   `active: false` liegen (volle Auslieferung; ihre
   Glieder in der Kette entfallen abgeleitet,
   [[Kettenpruefung]] §Fehlende und vertretene Glieder);
   der Stufenwechsel ist eine Entscheidung
   ([[Zuschnitt-aendern]]) und liest diese Datei erneut.
2. Bei Aktivierung `active: true` setzen und den
   Kopf-Satz „wird ab Stufe … aktiv“ um das Datum der
   Aktivierung ergänzen.
3. Bei Aktivierung den Vortrag aus der Akte in
   Tatsachen `TAT-NNN` zerlegen — je Tatsache Herkunft
   und Stellung (fremder Vortrag bekommt eine
   Stellung); das Feld Verfahrensgrundsatz am
   Verfahren steuert die angebotenen Stellungen.
4. Materielle Fristen (Verjährung, Ausschlussfristen)
   aus den Tatsachen berechnen und in [[Fristen]]
   anlegen; den Sachverhalts-Stand anbieten
   ([[Katalog-Sachverhalt-Stand]]).
5. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Belege laufen über [[Beweisangebote]] (optional ab
  Stufe 2); ohne aktive Fassade nennt das Feld Beweis
  die Anlage oder das Dokument direkt.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
