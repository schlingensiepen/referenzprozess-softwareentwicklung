---
type: role-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Verwendungs-Rollen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `role-log` — Register aller
  Verwendungs-Rollen: Rollen im Nutzer-Prozess, den
  das Entwicklungs-Ergebnis unterstützt
  (Sachbearbeiter, Antragsteller, Freigeber, Endnutzer
  etc.) — domänen-agnostisch. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität und führender Ort:** die Wahrheit bei
  Status und Kurzbeschreibung liegt in dieser Fassade;
  Detail-Knoten (Typ `role`) spiegeln (Wiki.md §1.1a).
  Rollen-Definitionen leben nur hier — `need`-,
  `scenario`-, `user-story`- und `use-case`-Knoten
  referenzieren Rollen per `rollen:`-Frontmatter-Feld
  und definieren sie nicht inline neu. Taucht beim
  Ausformulieren eine neue Rolle auf, wird sie zuerst
  hier angelegt, dann referenziert.
- **Eintragsformat:** `### <Rollen-Name>` (alphabetisch
  sortiert) mit Feldern Status (8-Zustand) /
  Kurzbeschreibung / Verwendet in ([[…]] —
  Rückverweis-Sammler auf die referenzierenden Knoten)
  / Detail (Wikilink, nur wenn Detail-Knoten
  existiert).
- **`role`-Detail-Knoten-Konventionen:** Frontmatter
  `type: role`, `id: <sprechender Slug>` (z.B.
  `sachbearbeiter`), `status`, `status_date`,
  `verwendet_in:` (Liste von Knoten-Slugs als Strings,
  keine Wikilinks im Frontmatter — Wiki.md §4.1). Body:
  ausformulierte Beschreibung (Verantwortlichkeiten,
  Verhaltens-Muster, typische Aufgaben, Abgrenzungen zu
  ähnlichen Rollen). Rückverlinkung ist
  Standardaufgabe im selben Vorgang — Vor- und
  Rückverweise werden gemeinsam gepflegt.
- **RP-1-Ergänzung:** in RP-1-aktivierten Projekten
  erhält `role` zusätzlich das Feld
  `system_abbildung:` (String-Notation), das auf die
  technische Umsetzung der Rolle im Ziel-System
  verweist (Details im RP-1-Teil-Wiki).

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Einträge

_(Rollen alphabetisch sortiert)_
