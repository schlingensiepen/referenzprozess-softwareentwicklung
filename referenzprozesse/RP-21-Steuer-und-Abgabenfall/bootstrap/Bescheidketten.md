---
type: facade-bootstrap
fassade: "Bescheidketten"
prozess: "RP-21-Steuer-und-Abgabenfall"
---

# Bootstrap — Bescheidketten

_(Ziel: `wiki/Bescheidketten.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese Datei
wird nie ins Anwender-wiki kopiert; sie liegt in beiden
Modi unter
`_template/referenzprozesse/RP-21-Steuer-und-Abgabenfall/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird nie
ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden (Pflicht ab Stufe 1) —
vor dem Merge lesen. Beim Merge:

1. Die Fassade ist **Pflicht ab Stufe 1**: `active: true`
   bleibt; keine Aktivierungs-Frage. Bei einem Join von
   RP-21 in ein laufendes RP-20-Projekt gilt dasselbe —
   die Fassade kommt mit dem Merge.
2. **Bestand aus der Akte:** alle vorhandenen Bescheide
   (Eingangsdokumente mit `document_type: bescheid`,
   dazu Erklärungen und Abrechnungen als Quelle der
   erwarteten Bescheide) je Subjekt × Abgabenart ×
   Zeitraum zu Ketten ordnen — älteste zuerst; je
   Bescheid den `notice`-Knoten anlegen bzw. den
   vorhandenen Eingangsdokument-Knoten um den Typ
   `notice` und seine Felder ergänzen
   ([[Katalog-Bescheidketten]]). **Laufende Fristen
   sofort melden** (Rechtsbehelfsfrist ab Bekanntgabe
   mit der Fiktion der Ordnung, [[Fristenkatalog-RP-21]]).
3. Je Kette **Angreifbarkeit** und **Lückenliste**
   bestimmen (`## Meta` der Fassade); Lücken als
   Erwartung in [[Fristen]] anlegen.
4. Ist [[Steuersubjekte]] noch inaktiv und die Akte führt
   mehr als ein Subjekt, deren Bootstrap auslösen
   (Auslöser „zweites Subjekt“).
5. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (RP-21)`.
- [[Katalog-Bescheidketten]] in [[Katalog]] verankern
  (Register-Eintrag; der Typ `notice` erweitert
  `document` — der Basis-Eintrag
  [[Katalog-Eingangsdokumente]] nennt den Zusammenhang
  und die zusätzlichen `document_type`-Werte für RP-21).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (etwa ein fester Abrufturnus für ein
  Behördenportal) entstehen unabhängig davon als
  `internal-rule` in [[InterneMechanik]].
