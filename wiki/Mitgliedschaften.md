---
type: member-log
active: false   # Vorauswahl deaktiviert; Aktivierung im Init wählbar oder später per Reaktivierung
---

# Mitgliedschaften

## Meta

- **Bootstrap/Reaktivierung:**
  Einmal-Anweisungen in der Template-Quelle
  `_template/referenzprozesse/base/bootstrap/Mitgliedschaften.md` —
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
  eigenständigen Objekt-Charakter.
  Frontmatter-Felder: [[Katalog-Mitgliedschaften]] —
  lesen beim Anlegen eines `member`-Knotens. Body: Kurzbeschreibung, `## Bezüge`. Dateiname
  `<Person> bei <Organisation>.md`, flach im wiki/.
  Einfache Mitgliedschaften ohne Detail-Bedarf sind
  als reiner Fassaden-Eintrag zulässig.
- **Pflege:** beim Ingest und redaktionell.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
