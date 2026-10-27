---
type: catalog-entry
art: einzeltyp
---

# Katalog-evidence

Einzeltyp-Eintrag: Relations-Typ `evidence` ohne
eigenes Register. Was eine Relation ist:
[[Katalog-Mitgliedschaften]] (Einleitung).

### evidence

- **Zweck:** Beweismittel-Beziehung — verknüpft eine
  Beweismittel-Quelle mit der belegten Aussage. Die
  Rolle „Beweismittel" ist relational, nicht
  intrinsisch: ein und dasselbe Dokument kann in einem
  Verfahren Beweismittel sein und in einem anderen
  nicht. Kein eigener Entity-Typ.
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: evidence`, `source`
  (Wikilink-Slug des Wissenselements, das das
  Beweismittel darstellt; beliebiger Typ zulässig:
  `document`, `person`-Entity, `thing`, `event`, …)
- **Optional-Feld:** `target:` — die belegte Aussage;
  entfällt, wenn die Aussage bereits im `source`-Knoten
  selbst ausgeschrieben ist.
- **Herkunft:** mitgebracht vom Prozess
  Recht-und-Verwaltung; hier zur Katalog-Vollständigkeit
  benannt.
