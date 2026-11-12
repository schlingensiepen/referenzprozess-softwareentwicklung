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
— Beispiel `member`). Relationen ohne Register
bringen Prozesse mit (etwa die Beweismittel-Relation
`evidence` mit SP-2).

### member-log

- **Zweck:** Relations-Register aller
  `member`-Relationen (Person↔Organisation)
- **Pflichtfelder:** `type: member-log`
- **Präfix:** `—`
- **Datei:** `wiki/Mitgliedschaften.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: false`)
- **Abgrenzung der Rollen-Fassaden:** [[Ansprechpartner]]
  = Rolle einer **Person im Projekt**;
  Geschäftsbeziehungen (mit dem Standardprozess
  Systementwicklung) = **Organisation zum Projekt**;
  Beteiligte (mit dem Standardprozess Recht und
  Verwaltung) = **Rolle im Verfahren mit Vertretung**
  („Müller ist Kläger in Verfahren x“);
  Mitgliedschaften = **Zugehörigkeit unabhängig vom
  Projekt** („Maier ist Geschäftsführer in der
  Bau-Mich-Auf GmbH“). Dieselbe Bauform — Relation
  Person oder Organisation ↔ etwas —, nicht derselbe
  Gegenstand; eine Zugehörigkeit, die über das Projekt
  hinaus erheblich wird, gehört hierher.
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade): Mitgliedschaften
  bleibt auch in SP-2 **`active: false`** — der
  Verfahrens-Starter schaltet sie nicht ein; die
  Beteiligten eines Verfahrens stehen in der Fassade
  Beteiligte des Prozesses. Der Agent **schlägt das
  Einschalten vor**, wenn eine Zugehörigkeit über
  Verfahren oder Zeit hinweg erheblich wird (etwa die
  Organstellung eines Beteiligten in mehreren
  Verfahren) — als Angebot nach Wiki.md §3a
  „Fassaden-Promotion“, der Anwender entscheidet.

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
