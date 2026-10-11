---
type: organization-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Organisationen

## Meta

- **Typ:** `organization-log` — Register aller
  Organisations-Knoten des Projekts. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Eintragsformat:** `[[<Name>]]` mit Kurzform
  (Rolle bzw. Bedeutung im Projekt, ein Satz);
  Unterorganisationen eingerückt unter ihrer
  übergeordneten Organisation.
- **`organization`-Detail-Knoten-Konventionen:**
  Frontmatter `type: organization`,
  `organization_type` (Enum: company, team,
  abteilung, division, institution, publisher, … —
  erweiterbar), optional `parent_organization`
  (String-Slug der übergeordneten Organisation;
  Unterorganisationen rekursiv über dieses Feld).
  Body: Kurzbeschreibung nach der H1, Sektionen
  `## Stammdaten` und `## Bezüge` (Erwähnt in,
  Unterorganisationen, Mitglieder). Dateiname
  `<Name>.md`, flach im wiki/.
- **Pflege:** beim Ingest und redaktionell.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
