---
type: requirement-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Anforderungen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `requirement-log` — Register aller
  Anforderungen des Projekts (setzt ein
  Entwicklungsvorhaben voraus). Singleton, ID-Präfix
  `REQ-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei
  Anforderungs-Status liegt in dieser Fassade —
  Detail-Knoten (Typ `requirement`) spiegeln
  (Wiki.md §1.1a). Kanonisch an der Fassade sind auch
  die Sektions-Zuordnung (Funktional vs.
  Nicht-funktional) und der Ablöseverweis.
- **Gliederung:** `## Funktional` und
  `## Nicht-funktional`, beide chronologisch nach ID.
- **Eintragsformat:** `### REQ-NNN — <Kurzsatz>` mit
  Feldern Status (8-Zustand: offen | aufgeschoben |
  angenommen | in-umsetzung | umgesetzt | abgeschlossen
  | verworfen | abgelöst durch REQ-XXX) / Auslöser (nur
  bei aufgeschoben oder umgesetzt-wartet-auf-Prüfung) /
  Verweise (BR- / REQ- / Contracts) / Grund (bei
  verworfen) / Detail (Wikilink, nur wenn Detail-Knoten
  existiert).
- **Detail-Knoten-Pflicht:** sobald Nachweis, Vermerke,
  Umsetzungs-Notizen, längere Beschreibung oder
  zitierpflichtige Bezüge anfallen.
- **`requirement`-Detail-Knoten-Konventionen:**
  Frontmatter `type: requirement`, `id: REQ-NNN`,
  `status` (8-Zustand), `status_date`, optional
  `trigger` (Datum oder Zielmarken-Bezeichnung) /
  `zielmarke` (Marken-Bezeichnung; nur wenn
  verschoben oder für eine Marke geplant,
  [[Zielmarken]]) /
  `superseded_by: REQ-NNN`, dazu `subtype:
  functional|non-functional`. Sektionen: Anforderung
  (Ausformulierung) / Nachweis (bei abgeschlossen: Art
  — automatisierter Test, Agent-Feststellung, manuelle
  Prüfung — und Ergebnis) / Verweise (auslösende
  Meldung BR-NNN, betroffene Requirements, Contracts/
  Komponenten) / Vermerke (append-only) / Bezüge
  (Fassaden-Eintrag [[Anforderungen]]). Dateiname
  `REQ-NNN <Kurzsatz>.md`.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Funktional

_(Einträge nach ID sortiert, chronologisch angelegt)_

## Nicht-funktional

_(Einträge nach ID sortiert, chronologisch angelegt)_
