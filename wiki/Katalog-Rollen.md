---
type: catalog-entry
art: register
---

# Katalog-Rollen

Register-Eintrag: Fassade `role-log` ([[Rollen]]) mit
Element-Typ `role`. Vormals SP-1-Eintrag
`Katalog-Verwendungs-Rollen`; die Fassade liegt seit
2.0 in der Basis.

### role-log

- **Zweck:** Register der Rollen-Definitionen
  (führender Ort; referenziert von Bedarfen,
  Szenarien und ihren Spezialisierungen)
- **Pflichtfelder:** `type: role-log`
- **Präfix:** `—` (sprechende Slugs statt Nummern)
- **Datei:** `wiki/Rollen.md`
- **Singleton, Basis-Fassade** (Einstufung: Wiki.md
  §3a)

### role

- **Zweck:** einzelne Rolle im Prozess, den das
  Ergebnis des Projekts unterstützt (Detail-Knoten zum
  Eintrag im Rollen-Register)
- **Klasse:** außerhalb (lebende Quelle; referenzierte
  Rollen werden im Stand kopiert)
- **Pflichtfelder:** `type: role`, `id` (sprechender
  Slug, z.B. `sachbearbeiter`), `rolle_art` (seit 2.0)
  (Art der Rolle; Werte nennt der aktive Prozess, mit
  SP-1 `verwendungsrolle`; erweiterbar), `status`
  (`aktiv` oder `verworfen`), `status_date`
- **Optional:** `verwendet_in` (String-Liste der
  referenzierenden Knoten-Slugs, keine Wikilinks im
  Frontmatter — Wiki.md §4.1); ein
  Prozess darf Felder ergänzen (mit RP-1
  `system_abbildung`)
- **Beispielname:** `Sachbearbeiter.md`
- **Kanonizität:** Wahrheit bei Status und
  Kurzbeschreibung liegt in `wiki/Rollen.md`
  (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Rollen]].
