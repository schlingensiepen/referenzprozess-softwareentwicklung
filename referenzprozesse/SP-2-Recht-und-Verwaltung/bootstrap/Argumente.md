---
type: facade-bootstrap
fassade: "Argumente"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Argumente

_(Ziel: `wiki/Argumente.md`. Ausführung beim Init/Merge
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
3. Bei Aktivierung die Linien der laufenden Marke als
   `ARG-NNN` mit Status `offen` anlegen — je Linie
   Kernthese, Begründung, Belege und
   **Pflicht-Gegeneinwand mit Antwort**; Verweis auf
   die Strategie ([[Strategie]]).
4. Den Argumentations-Stand anbieten
   ([[Katalog-Argumentation-Stand]]); er verweist nur
   auf angenommene Argumente.
5. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
