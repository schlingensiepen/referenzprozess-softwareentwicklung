---
type: catalog-entry
art: register
---

# Katalog-Eingangsdokumente

Register-Eintrag: Fassade `input-document-log`
([[Eingangsdokumente]]) mit Element-Typ `document`.

### input-document-log

- **Zweck:** Register aller Eingangsdokumente —
  fokussierte Sicht auf die beim Ingest angelegten
  `document`-Knoten
- **Pflichtfelder:** `type: input-document-log`
- **Präfix:** `—`
- **Datei:** `wiki/Eingangsdokumente.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)

### document

- **Zweck:** ein Wiki-Knoten pro eigenständig
  zitierbarem Eingangsdokument
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: document`,
  `document_type` (Enum), `source_text`
  (`input/raw/<datei>.md`), `ingested_at`
- **Empfohlen:** `source_original` (bei Scans),
  `pages` (bei Sammeldokumenten)
- **Beispielname:**
  `2026-03-11 Angebot 2026-117 Sanierung Amselweg.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Eingangsdokumente]].
- **Enum-Werte `document_type`**
  (Domänen-Gruppierung ist reine Sortierhilfe):
  - Rechtsfall: `bescheid`, `urteil`, `einspruch`,
    `kommentar`, `schreiben`, `formular`
  - SW-Entwicklung: `spec`, `issue`, `adr-doc`,
    `protocol`, `pr`, `changelog`
  - Produktentwicklung: `brief`, `presentation`,
    `market-research`
  - Wissenschaft: `paper`, `book`, `preprint`,
    `norm`, `standard`, `thesis-doc`
  - Übernommene Konzepte: `proposal`
- **Bezugs-Rolle „Gegenstand":** worauf
  sich ein Dokument bezieht (der Gegenstand eines
  Bescheids, einer Bestellung, eines Angebots), ist
  ein **Verweis-Feld im Body** (Wikilink auf das
  betroffene Wissenselement beliebigen Typs) — kein
  eigener Entity-Typ.
