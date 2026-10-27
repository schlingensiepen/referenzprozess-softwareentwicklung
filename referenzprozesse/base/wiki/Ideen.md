---
type: idea-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Ideen

## Meta

- **Typ:** `idea-log` — Register aller Ideen des
  Projekts: unverbindliche Vorschläge für spätere
  Iterationen, domänen-übergreifend. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Ideen-Status liegt
  in dieser Fassade — Detail-Knoten (Typ `idea`)
  spiegeln (Wiki.md §1.1a).
- **Abgrenzung:** Ideen sind bewusst
  iterationsübergreifend — nicht verbindlich, nicht
  als Anforderungen und nicht als Entscheidungen
  einzuordnen. Geht eine Idee in einen konkreten Plan
  über, wechselt sie in `in-umsetzung`.
- **Zurückgestellte Entscheidungen** stehen hier als
  IDEA mit `Auslöser:` (Datum oder Marke), nicht in
  [[Entscheidungen]]. Dieses Register ist ein
  **Sammel-Register** (Sammelzustand-Zeile in
  [[Katalog-Ideen]]). Die Regel dazu und welche
  Register Wächter und Marken-Trigger prüfen:
  [[Einfrieren-und-Abloesen]] §Eintrittsregel — lesen,
  bevor eine Entscheidung zurückgestellt wird.
- **Eintragsformat:** `### IDEA-NNN — <Titel>` mit
  Feldern Status (8-Zustand) / Herkunft (aus welcher
  Diskussion/welchem Review) / Angelegt (Anlage-Datum
  `JJJJ-MM-TT`, Pflichtfeld seit 2.0 am Eintrag ohne
  Detail-Knoten, sonst `datum:` im Detail-Knoten;
  [[Katalog]] §Typ-Konventionen) / Zielmarke
  ([[Zielmarken]]; Pflichtfeld, kanonisch hier) /
  Auslöser (nur bei aufgeschoben) /
  Verweise / Grund (bei verworfen) / Detail (Wikilink,
  nur wenn Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** sobald Optionen abgewogen,
  Trade-offs dokumentiert oder Vorbedingungen
  ausformuliert sind.
- **`idea`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder (Pflicht und Kann):
  [[Katalog-Ideen]] — lesen beim Anlegen eines
  IDEA-Knotens. Sektionen: Problem oder
  Chance / Optionen / Trade-offs / Voraussetzungen /
  Herkunft / Vermerke (append-only) / Bezüge
  (Fassaden-Eintrag [[Ideen]]). Dateiname
  `IDEA-NNN <Titel>.md`.

---

**Bearbeitungsstand:** _(vom User oder Agenten laufend gepflegt)_

Chronologische Liste.

## Einträge

_(chronologisch nach ID)_
