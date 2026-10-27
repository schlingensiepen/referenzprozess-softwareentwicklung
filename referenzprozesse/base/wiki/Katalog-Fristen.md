---
type: catalog-entry
art: register
---

# Katalog-Fristen

Register-Eintrag: Fassade `deadline-log` ([[Fristen]])
mit Element-Typ `deadline`.

### deadline-log

- **Zweck:** Fälligkeitsübersicht mit Sektionen
  Offen/Erledigt/Abgelaufen
- **Pflichtfelder:** `type: deadline-log`
- **Präfix:** `—`
- **Datei:** `wiki/Fristen.md`
- **Singleton**

### deadline

- **Zweck:** gewichtige Frist mit Kontext,
  Teilschritten, Historie (Hybrid zu Fristen)
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: deadline`, `status`
  (`offen`/`erfuellt`/`abgelaufen`), `due`
  (`YYYY-MM-DD`)
- **Empfohlen:** `case`, `source` (String-Slugs, keine
  Wikilinks — Wiki.md §4.1)
- **Optional:** `fulfilled_at` (bei `erfuellt`)
- **Beispielname:**
  `2026-05-15 Frist Bindefrist Angebot 2026-117.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Fristen.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Fristen]].
