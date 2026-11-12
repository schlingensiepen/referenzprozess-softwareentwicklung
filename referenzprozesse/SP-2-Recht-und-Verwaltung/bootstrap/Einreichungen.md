---
type: facade-bootstrap
fassade: "Einreichungen"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Einreichungen

_(Ziel: `wiki/Einreichungen.md`. Ausführung beim Init/Merge
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
2. Geprüfte Versandwege der Stellen aufnehmen
   (Init-Frage „Kanäle und Versandwege“,
   SP-2-`index.md` §4.6 Frage 5): je Stelle Kanal, Nummer,
   Postfach, Seiten- und Anlagengrenze am
   [[Organisationen]]-Knoten; Standard der Erwartung
   je Stelle.
3. Bereits erfolgte Einreichungen aus der Akte als
   Einträge mit Nachweis und Zugang anlegen (Status
   `eingereicht`); fehlt der Nachweis, Status
   `abgesandt` und Nachfrage beim Anwender.
4. Offene Erwartungen als Fristen `für-uns` anlegen
   ([[Fristen]], `entstehung: erwartung`).
5. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Jede neue Einreichung legt ab jetzt automatisch eine
  Erwartung an ([[Fristen]]); der Wächter meldet eine
  Einreichung ohne Nachweis oder mit abweichender
  Prüfsumme ([[Vorgehen-SP-2]] §Wächter).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
  Die SP-2-Präfixe werden gesammelt im
  `internal-rule`-Knoten `Aktivierter-Prozess.md`
  verbucht (Merge-Schritt, nicht pro Fassade; dort
  auch die Zeile `Ausbaustufe`).
