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
- **Eintragsformat:** `### IDEA-NNN — <Titel>` mit
  Feldern Status (8-Zustand) / Herkunft (aus welcher
  Diskussion/welchem Review) / Auslöser (nur bei
  aufgeschoben oder umgesetzt-wartet-auf-Prüfung) /
  Verweise / Grund (bei verworfen) / Detail (Wikilink,
  nur wenn Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** sobald Optionen abgewogen,
  Trade-offs dokumentiert oder Vorbedingungen
  ausformuliert sind.
- **`idea`-Detail-Knoten-Konventionen:** Frontmatter
  `type: idea`, `id: IDEA-NNN`, `status` (8-Zustand),
  `status_date`, optional `trigger` (Datum oder
  Zielmarken-Bezeichnung, [[Zielmarken]]),
  `zielmarke` (Marken-Bezeichnung; nur wenn
  verschoben oder für eine Marke geplant) und
  `superseded_by: IDEA-NNN`. Sektionen: Problem oder
  Chance / Optionen / Trade-offs / Voraussetzungen /
  Herkunft / Vermerke (append-only) / Bezüge
  (Fassaden-Eintrag [[Ideen]]). Dateiname
  `IDEA-NNN <Titel>.md`.

---

**Stand:** _(vom User oder Agenten laufend gepflegt)_

Chronologische Liste.

## Einträge

_(chronologisch nach ID)_
