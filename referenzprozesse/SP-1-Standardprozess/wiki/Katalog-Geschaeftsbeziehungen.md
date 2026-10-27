---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Geschaeftsbeziehungen

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`business-relation-log` ([[Geschaeftsbeziehungen]]) mit
den inline geführten Relations-Typen `customer`,
`competitor` und `partner` (Kategorie b, keine
Detail-Knoten-Pflicht). Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### business-relation-log

- **Zweck:** Register der Geschäftsbeziehungen des
  Projekts zu externen Organisationen — führt die
  Relations `customer`, `competitor`, `partner`
  inline (Kategorie b, keine Detail-Knoten-Pflicht)
- **Pflichtfelder:** `type: business-relation-log`
- **Präfix:** `—`
- **Datei:** `wiki/Geschaeftsbeziehungen.md`
- **Singleton** — optional, Vorauswahl deaktiviert
  (Steckbrief § Mitgebrachte Fassaden)

### customer

- **Zweck:** Relation Organisation ↔ Projektaspekt —
  „Organisation X ist Kunde für Aspekt Y"
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: customer`
- **Geführt in:** [[Geschaeftsbeziehungen]] (inline)

### competitor

- **Zweck:** Relation Organisation ↔ Projektaspekt —
  „Organisation X ist Wettbewerber bei Aspekt Y"
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: competitor`
- **Geführt in:** [[Geschaeftsbeziehungen]] (inline)

### partner

- **Zweck:** Relation Organisation ↔ Projektaspekt —
  „Organisation X ist Partner für Aspekt Y"
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: partner`
- **Geführt in:** [[Geschaeftsbeziehungen]] (inline)
