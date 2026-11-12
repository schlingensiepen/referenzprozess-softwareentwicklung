---
type: facade-bootstrap
fassade: "Steuersubjekte"
prozess: "RP-21-Steuer-und-Abgabenfall"
---

# Bootstrap — Steuersubjekte

_(Ziel: `wiki/Steuersubjekte.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese Datei
wird nie ins Anwender-wiki kopiert; sie liegt in beiden
Modi unter
`_template/referenzprozesse/RP-21-Steuer-und-Abgabenfall/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird nie
ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden (Pflicht ab dem
zweiten Subjekt, Auslöser) — vor der Aktivierungs-Wahl
lesen. Beim Merge und später auf Angebot oder
Anweisung:

1. **Auslöser prüfen:** Führt die Akte Bescheide oder
   Pflichten für mehr als ein Steuersubjekt (Ehegatten,
   Eltern und Kinder, Gesellschaft und Gesellschafter,
   Haftungsschuldner neben dem Abgabenpflichtigen), ist
   die Fassade Pflicht: `active: true` setzen, keine
   Frage. Bei einem Subjekt Ja/Nein-Frage mit Empfehlung
   „aktivieren, sobald ein zweites Subjekt zu erwarten
   ist oder Kennzeichen mehrerer Stellen zu führen
   sind“; bei Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest diese
   Bootstrap-Datei erneut; das Angebot des Agenten ist
   ein Aktions-Entwurf, Wiki.md §3a
   „Fassaden-Promotion“). Der Agent meldet den Auslöser,
   wenn das zweite Subjekt im Posteingang erscheint.
2. Bei Aktivierung je Subjekt den `taxpayer`-Knoten aus
   den vorhandenen Bescheiden und Erklärungen anlegen:
   Person bzw. Organisation verknüpfen ([[Personen]],
   [[Organisationen]] — fehlende Knoten anlegen),
   Kennzeichen mit Historie und Quelle, zuständige
   Stellen je Abgabenart, Schreibweisen aus der
   Texterkennung ([[Katalog-Steuersubjekte]]).
3. Die Ketten in [[Bescheidketten]] auf das Subjekt
   umhängen (Feld `subjekt` an den `notice`-Knoten vom
   Beteiligten-Eintrag auf den Subjekt-Knoten).
4. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (RP-21)`.
- [[Katalog-Steuersubjekte]] in [[Katalog]] verankern
  (Register-Eintrag, Entitäts-Typ `taxpayer`).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig davon
  als `internal-rule` in [[InterneMechanik]].
