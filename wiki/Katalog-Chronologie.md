---
type: catalog-entry
art: register
---

# Katalog-Chronologie

Register-Eintrag: Fassade `timeline` ([[Chronologie]])
mit Element-Typ `event`.

### timeline

- **Zweck:** Zeitachse — was ist wann passiert
- **Pflichtfelder:** `type: timeline`
- **Präfix:** `—`
- **Datei:** `wiki/Chronologie.md`
- **Singleton**

### event

- **Zweck:** gewichtiges Ereignis mit Kontext,
  Beteiligten, Quelle (Hybrid zur Chronologie)
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: event`, `date`
  (`YYYY-MM-DD`)
- **Empfohlen:** `case`, `source` (String-Slugs, keine
  Wikilinks — Wiki.md §4.1)
- **Optional:** `origin: redaktionell`
- **Beispielname:**
  `2026-04-15 Ereignis Angebot angenommen 2026-117.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Chronologie]].
