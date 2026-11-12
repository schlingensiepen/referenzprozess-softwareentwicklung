---
type: facade-bootstrap
fassade: "Strategie"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Strategie

_(Ziel: `wiki/Strategie.md`. Ausführung beim Init/Merge
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
3. Bei Aktivierung zur laufenden Marke die erste
   Strategie als `STR-001` mit Status `offen` anlegen
   (Ziel, Grundlinie, Vorgehensplan, Sperrliste,
   Haltung) und den Strategie-Stand anbieten
   ([[Katalog-Strategie-Stand]]; Freigabe nur durch den
   Anwender).
4. Offene Auslöser als Eventualpläne `EVP-NNN`
   anlegen (drohende Vollstreckung → „Eilrechtsschutz“
   bzw. „Vollstreckungsschutz“); der
   Posteingangs-Wächter liest sie ab jetzt.
5. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Die Strategie ist Pflicht-Eingabe jedes Prüfauftrags
  ([[Vorgehen-SP-2]] §Prüfen); der Prüfplan nennt sie.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
