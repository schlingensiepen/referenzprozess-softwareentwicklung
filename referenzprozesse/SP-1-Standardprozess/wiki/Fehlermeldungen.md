---
type: bug-report-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Fehlermeldungen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `bug-report-log` — Register aller
  Fehlermeldungen des Projekts (setzt ein gebautes
  Ding plus Nutzung voraus). Singleton, ID-Präfix
  `BR-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei
  Fehlermeldungs-Status liegt in dieser Fassade —
  Detail-Knoten (Typ `bug-report`) spiegeln
  (Wiki.md §1.1a).
- **Meldungen, nicht Arbeit:** das Register führt
  Meldungen — die Reparatur läuft als Anforderung im
  `wiki/Anforderungen.md`-Register (Zusatzfeld
  `Fix-Anforderung: [[REQ-XXX]]`). So bleibt die
  BR-Liste eine saubere Meldungsliste, keine
  Aufgabenliste.
- **Eintragsformat:** `### BR-NNN — <Beobachtetes
  Verhalten in einem Satz>` mit Feldern Status
  (8-Zustand) / Datum (letzter Statuswechsel) /
  Auslöser (nur bei aufgeschoben oder
  umgesetzt-wartet-auf-Prüfung) / Fix-Anforderung
  ([[REQ-XXX]], sobald angelegt) / Original
  ([[BR-XXX]], nur bei abgelöst als Duplikat) / Grund
  (bei verworfen) / Detail (Wikilink, nur wenn
  Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** sobald
  Reproduktionsschritte, Analyse-Notizen oder Vermerke
  anfallen — bei komplexen Fehlern mit
  Reproduktions-Setup fast immer.
- **`bug-report`-Detail-Knoten-Konventionen:**
  Frontmatter `type: bug-report`, `id: BR-NNN`,
  `status` (8-Zustand), `status_date`, optional
  `trigger` (Datum oder Zielmarken-Bezeichnung) /
  `zielmarke` (Marken-Bezeichnung; nur wenn
  verschoben oder für eine Marke geplant,
  [[Zielmarken]]) /
  `superseded_by: BR-NNN` /
  `fix_requirement: REQ-NNN` (sobald Fix-Anforderung
  angelegt). Sektionen: Beobachtetes Verhalten /
  Erwartetes Verhalten / Reproduktionsschritte /
  Analyse und Eingrenzung / Verweise (Fix-Anforderung,
  Original bei Duplikat, betroffenes Requirement bei
  Regression) / Vermerke (append-only) / Bezüge
  (Fassaden-Eintrag [[Fehlermeldungen]]). Dateiname
  `BR-NNN <Beobachtetes Verhalten in einem Satz>.md`.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

Eine chronologische Liste.

## Einträge

_(chronologisch nach ID)_
