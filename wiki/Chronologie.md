---
type: timeline
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Chronologie

## Meta

- **Typ:** `timeline` — rückwärtsgerichtete Zeitachse:
  was ist im Projekt passiert. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Eintragsformat:** pro Datum eine
  `## YYYY-MM-DD`-Sektion mit Bullet-Points
  „Ereignis-Kurzform → [[Wiki-Knoten]]" (Wikilink nur,
  wenn Detail-Knoten existiert).
- **Gewichtige Ereignisse:** zusätzlicher
  `event`-Detail-Knoten; der Chronologie-Eintrag
  verweist per Wikilink.
- **`event`-Detail-Knoten-Konventionen:** Frontmatter
  `type: event`, `date: YYYY-MM-DD`, empfohlen `case:`
  und `source:` (String-Slugs, keine Wikilinks —
  Wiki.md §4.1), optional `origin: redaktionell`.
  Sektionen: Kontext / Beteiligte / Ausschnitt aus
  Ursprungsdokument / Bezüge (Case, auslösendes
  Document, Chronologie-Datum).
- **Redaktionelle Ereignisse** (Telefonate, Meetings):
  am Marker `(redaktionell)` erkennbar.
- **Pflege:** beim Ingest und laufend.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
