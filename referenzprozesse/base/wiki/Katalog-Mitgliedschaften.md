---
type: catalog-entry
art: register
---

# Katalog-Mitgliedschaften

Register-Eintrag: Fassade `member-log`
([[Mitgliedschaften]]) mit Element-Typ `member`
(Relation als Detail-Knoten, Kategorie a).

Relations verknüpfen bestehende Wiki-Knoten über
Frontmatter-Felder — sie beschreiben eine Rolle
zwischen Knoten, keine eigenständige Sache. Ein
Relations-Typ verknüpft zwei (oder mehr) Entitäten
mit einem Zweck bzw. spezifischen Attributen und
hat keinen eigenständigen Objekt-Charakter (im
Gegensatz zu Entitäten wie Person, Organisation,
Ort). Realisierung je nach Komplexität und
Attribut-Umfang: **inline in einer Fassade**
(Kategorie b — Beispiel [[Ansprechpartner]]) oder
als **Detail-Knoten mit Frontmatter** (Kategorie a
— Beispiel `member`). Relation ohne Register:
[[Katalog-evidence]].

### member-log

- **Zweck:** Relations-Register aller
  `member`-Relationen (Person↔Organisation)
- **Pflichtfelder:** `type: member-log`
- **Präfix:** `—`
- **Datei:** `wiki/Mitgliedschaften.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: false`)

### member

- **Zweck:** Mitgliedschafts-Relation — verknüpft
  eine Person mit einer Organisation, mit Rolle und
  Zeitraum.
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: member`, `person`,
  `organization` (String-Slugs der verknüpften
  Knoten).
- **Optional:** `role:`, `from:`/`to:`
  (Zeitraum, `YYYY-MM-DD`).
- **Beispielname:** `Tina Reiherbach bei
  Stadtwerke Mittelbach.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Mitgliedschaften]].
