---
type: input-document-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Eingangsdokumente

## Meta

- **Typ:** `input-document-log` — Register aller
  Eingangsdokumente des Projekts: zitierbare
  Originaldokumente aus `raw/` / `input/`. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Dokument-Status
  liegt in dieser Fassade — Detail-Knoten (Typ
  `document`) spiegeln (Wiki.md §1.1a).
- **Pflege:** automatisch beim Ingest (Wiki.md §2.1) —
  Register-Eintrag pro neuem document-Knoten, keine
  Rückfrage.
- **Eintragsformat:**
  `### YYYY-MM-DD — <Kurzbezeichnung> (<document_type>)`
  mit Feldern Aktenzeichen ([[Aktenzeichen]]-Bezug,
  falls vorhanden) / Absender bzw. Quelle
  ([[Ansprechpartner]]-Bezug, falls vorhanden) /
  Detail (Wikilink auf den Dokument-Knoten).
  Chronologische Liste, optional gruppiert nach
  `document_type` (z.B. `brief`, `schreiben`,
  `protocol`, …).
- **`document`-Detail-Knoten-Konventionen:** Frontmatter
  `type: document`, `document_type` (Enum, siehe
  [[Knotentypen]]), `source_text:
  input/raw/<datei>.md`, `ingested_at`, empfohlen
  `source_original` (bei Scans), `pages` (nur bei
  Sammeldokumenten). Body: Volltext, Metadaten-Block
  (Dokumenttyp, Datum, Absender, Empfänger,
  Aktenzeichen, weitere Datenfelder),
  Kurzzusammenfassung in Fließtext, `## Bezüge` (Case,
  erwähnte Entities, Concepts). Dateiname
  `<Datum> <Dokumentname> <Gegenstand>.md`.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt; optionale
Gruppen nach document_type)_
