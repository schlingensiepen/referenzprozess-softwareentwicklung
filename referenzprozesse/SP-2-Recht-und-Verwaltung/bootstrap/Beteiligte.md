---
type: facade-bootstrap
fassade: "Beteiligte"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Beteiligte

_(Ziel: `wiki/Beteiligte.md`. Ausführung beim Init/Merge
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
2. Init-Frage „Rolle und Interessen“ (SP-2-`index.md`
   §4.6 Frage 1; Inhalt der Rolle: [[Vorgehen-SP-2]]
   §14) aktiv stellen und nachfragen: in wessen
   Namen der Anwender handelt, eigenes Interesse und
   das der vertretenen Person, Beziehung zum
   Gegenüber, Ziel, Vollmacht, übrige Beteiligte,
   bekannter und gewollter Konflikt. Den Anwender als
   ersten Eintrag je Verfahren anlegen (auch als
   öffentliche Stelle).
3. Gegenüber und weitere Beteiligte aus der Akte
   anlegen, je mit Rolle und Instanz, Vertretung und
   Vollmacht, Pflicht zur Nutzung elektronischer
   Kanäle; Kostenträger und Dritte mit eigener Frist,
   sobald bekannt.
4. Pflichtteil „Rolle und Interessen“ im
   [[Mission Statement]] füllen und hierher verlinken;
   Konflikt-Hinweis einmal als Vermerk.
5. Wiedervorlage „Rolle prüfen“ als selbst gesetzte
   Frist anlegen ([[Fristen]]; Turnus aus der
   Init-Frage 10 des Prozesses, `index.md` §4.6 —
   Voreinstellung: drei Monate).
6. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- [[Personen]] und [[Organisationen]] sind die
  Entitäten der Beteiligten; fehlende Knoten anlegen.
- [[Mitgliedschaften]] bleibt `active: false`; das
  Einschalten schlägt der Agent erst vor, wenn eine
  Zugehörigkeit über Verfahren oder Zeit hinweg
  erheblich wird.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
  Die SP-2-Präfixe werden gesammelt im
  `internal-rule`-Knoten `Aktivierter-Prozess.md`
  verbucht (Merge-Schritt, nicht pro Fassade; dort
  auch die Zeile `Ausbaustufe`).
