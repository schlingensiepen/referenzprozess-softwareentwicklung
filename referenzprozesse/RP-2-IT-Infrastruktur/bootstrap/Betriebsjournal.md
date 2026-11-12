---
type: facade-bootstrap
fassade: "Betriebsjournal"
prozess: "RP-2-IT-Infrastruktur"
---

# Bootstrap — Betriebsjournal

_(Ziel: `wiki/Betriebsjournal.md`. Ausführung beim
Init/Merge bzw. bei Reaktivierung — Wiki.md §11.3/§3a.
Diese Datei wird nie ins Anwender-wiki kopiert; sie
liegt in beiden Modi unter
`_template/referenzprozesse/RP-2-IT-Infrastruktur/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status und Einstufung dieser Fassade: Steckbrief
§ Mitgebrachte Fassaden; was mandatory für den Merge
bedeutet: Wiki.md §3a, §11.3 — vor den Schritten
lesen. Beim Merge:

1. `active: true` bestätigen (Default).
2. Je Zielumgebung aus [[Zielumgebungen]] einen
   Abschnitt `### <Umgebung>` anlegen, sobald dort der
   erste Lauf, die erste Prüfung oder Beobachtung zu
   buchen ist — auch die Ist-Aufnahme des Einstiegs
   „Bestand erfassen“ ist ein Eintrag der Art Prüfung
   (`## Meta` der Fassade). Nichts vorab erfinden.
3. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (RP-2)`.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (etwa ein stehendes OK) entstehen
  nicht hier, sondern als Entscheidungseintrag
  `stehendes-ok` in [[Entscheidungen]]
  ([[Vorgehen-RP-2]] §5).
