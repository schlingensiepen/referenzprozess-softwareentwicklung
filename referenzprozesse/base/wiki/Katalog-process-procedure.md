---
type: catalog-entry
art: einzeltyp
---

# Katalog-process-procedure

Einzeltyp-Eintrag: Infrastruktur-Typ der
Template-Quelle. Braucht keine indexierende Fassade;
wird beim Merge ins Anwender-wiki kopiert.

### process-procedure

- **Zweck:** Prozess-Dokument eines Prozesses, das
  den gleichnamigen Knoten des zugrundeliegenden
  Prozesses ergänzt oder schärft — das
  Vorgehens-Dokument (`Vorgehen-<P>.md`:
  Phasen-Belegung, Angebote an Phasen, eigene
  Mechanik des Prozesses) und das Marken-Dokument
  (`Marken-<P>.md`: typische Marke der Projektart,
  ihr Produkt, Schnitt, Benennung; Basis: [[Marken]])
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: process-procedure`,
  `process`, `extends` (Liste, höchstens ein
  Element)
- **Beispielname:** `Vorgehen-SP-1.md`,
  `Marken-SP-1.md`
- **Ablage:** `referenzprozesse/<P>/wiki/`; beim
  Merge nach Anwender-`wiki/` kopiert (Wiki.md §11,
  Vorgehen.md §8).
