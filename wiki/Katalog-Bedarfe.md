---
type: catalog-entry
art: register
---

# Katalog-Bedarfe

Register-Eintrag: Fassade `need-log` ([[Bedarfe]]) mit
Element-Typ `need`. Ein Prozess darf den Element-Typ
per Spezialisierung ersetzen; Register und Präfix
bleiben.

### need-log

- **Zweck:** Register der Bedarfe — was jemand will
  und warum (Vorstufe der Anforderungen)
- **Pflichtfelder:** `type: need-log`
- **Präfix:** `NEED`
- **Datei:** `wiki/Bedarfe.md`
- **Singleton, Basis-Fassade** (Einstufung: Wiki.md
  §3a)

### need

**abgelöst durch user-story (aus Prozess RP-1)**

- **Zweck:** einzelner Bedarf aus Sicht einer oder
  mehrerer Rollen (Detail-Knoten zum Eintrag im
  Bedarfs-Register)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** ja
- **Pflichtfelder:** `type: need`, `id` (Format
  `NEED-NNN`), `status` (8-Zustands-Enum),
  `status_date`, `datum` (seit 2.0) (Anlage-Datum
  `JJJJ-MM-TT`, nie geändert; [[Katalog]]
  §Typ-Konventionen), `rollen` (String-Liste der
  Rollen aus [[Rollen]]), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  Bestand ohne Feld: [[Zielmarken]] §Meta)
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung; nur bei `aufgeschoben`),
  `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste)
- **Dokumenttypen:** —. Mit SP-1: Konzept-Stand.
- **Beispielname:** `NEED-001 Antrag ohne Papier stellen.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Bedarfe.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Bedarfe]].
