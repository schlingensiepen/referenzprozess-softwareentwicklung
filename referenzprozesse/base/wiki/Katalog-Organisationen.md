---
type: catalog-entry
art: register
---

# Katalog-Organisationen

Register-Eintrag: Fassade `organization-log`
([[Organisationen]]) mit Element-Typ `organization`.

### organization-log

- **Zweck:** Register aller `organization`-Knoten
- **Pflichtfelder:** `type: organization-log`
- **Präfix:** `—`
- **Datei:** `wiki/Organisationen.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)

### organization

- **Zweck:** Organisation mit Stammdaten und Rollen
  (Basis-Entity)
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: organization`,
  `organization_type` (Enum: `company`, `team`,
  `abteilung`, `division`, `institution`,
  `publisher`, … — erweiterbar)
- **Optional:** `parent_organization` (String-Slug
  der übergeordneten Organisation;
  Unterorganisationen rekursiv über dieses Feld)
- **Beispielname:** `Stadtwerke Mittelbach.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Organisationen]].
