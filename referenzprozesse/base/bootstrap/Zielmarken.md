---
type: facade-bootstrap
fassade: "Zielmarken"
prozess: "base"
---

# Bootstrap — Zielmarken

_(Ziel: `wiki/Zielmarken.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung dieser Fassade: Pflicht-Fassade in jedem
Projekt, mit und ohne Prozess (Wiki.md §3a
„mandatory“) — keine Aktivierungs-Wahl, `active: true`
bleibt. Beim Init:

1. **Erste Marke anlegen** (dieser Schritt ist der
   führende Ort der Regel): der Init legt genau eine
   Marke mit `- **Zustand:** in-progress` an. Ihre
   **Bezeichnung nennt der Anwender** — er hat sie in
   Turn 2 genannt ([[Init-Choreografie]] §Init-Fragen;
   der Agent hatte dort die typische Marke des
   gewählten Prozesses vorgeschlagen, gelesen aus
   dessen Marken-Dokument `Marken-<P>.md`, Abschnitt
   „Typische Marke“, Basis: [[Marken]]; ohne Prozess
   „1.0“); fehlt sie, fragt der Agent jetzt. Dazu
   darf der Agent aus dem Auftrag bis zu zwei weitere
   künftige Marken vorschlagen (Ableiten-und-Vorlegen;
   die Vorstellung des Mechanismus ist bereits im
   Init-Fahrplan erfolgt, Fahrplan-Vorlage Punkt 6).
   Format der Marken-Einträge samt Zeile `Zustand:`:
   [[Zielmarken#Meta]] („Marken-Dreiklang“). Die erste
   Marke ist zugleich der erste Wert, den der Agent
   jedem neuen Element in das Pflichtfeld `zielmarke:`
   schreibt ([[Zielmarken#Meta]] „Pflichtfeld
   `zielmarke:`“) — ab dem ersten Element, das der
   Init bucht; deshalb steht dieser Schritt vor jeder
   Buchung, auch vor der Freigabe-Buchung der
   mitgebrachten Ordner des Prozess-Merge
   ([[Init-Choreografie]] §Phase D Turn 3). In einem
   Komponenten-Projekt trägt jede Marke `fuer_marke:`;
   woher der Wert kommt (erste Marke: Übergabe-Stand;
   jede weitere: Nachricht des Koordinators zum Start
   seiner Folge-Marke): [[Zielmarken#Meta]]
   („Zuliefernde Komponenten“). Dieselbe
   Vorschlags-Regel (typische Marke aus
   `Marken-<P>.md`, sonst die nächste Nummer; die
   Bezeichnung nennt der Anwender) gilt später, wenn
   beim Marken-Wechsel keine künftige Marke vorliegt
   oder nach einer Ruhe des Projekts weitergearbeitet
   wird ([[Zielmarken#Meta]], Wechsel-Prozedur Schritt
   1 und „Ruhe-Zeile“).
2. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] prüfen (Status, Kurzform).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
