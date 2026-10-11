---
type: member-log
active: false   # Vorauswahl deaktiviert; Aktivierung im Init wählbar oder später per Reaktivierung
---

# Mitgliedschaften

## Meta

- **Bootstrap/Reaktivierung (DEC-217):**
  Einmal-Anweisungen in der Template-Quelle
  `referenzprozesse/base/bootstrap/Mitgliedschaften.md` —
  bei Reaktivierung von dort abarbeiten.

- **Typ:** `member-log` — Relations-Fassade: Register
  aller `member`-Relationen (Person↔Organisation)
  des Projekts. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Eintragsformat:** `[[<Person>]] bei
  [[<Organisation>]]` mit Kurzform (Rolle, Zeitraum);
  bei attribut-reichen Relationen Wikilink auf den
  Detail-Knoten.
- **`member`-Detail-Knoten-Konventionen:** `member`
  ist eine Relation, keine Entität — sie verknüpft
  eine Person mit einer Organisation und hat keinen
  eigenständigen Objekt-Charakter. Frontmatter
  `type: member`, `person:` und `organization:`
  (String-Slugs der verknüpften Knoten), optional
  `role:`, `from:`/`to:` (Zeitraum, `YYYY-MM-DD`).
  Body: Kurzbeschreibung, `## Bezüge`. Dateiname
  `<Person> bei <Organisation>.md`, flach im wiki/.
  Einfache Mitgliedschaften ohne Detail-Bedarf sind
  als reiner Fassaden-Eintrag zulässig.
- **Pflege:** beim Ingest und redaktionell.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
