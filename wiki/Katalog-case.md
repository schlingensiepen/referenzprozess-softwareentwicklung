---
type: catalog-entry
art: einzeltyp
---

# Katalog-case

Einzeltyp-Eintrag: Domänen-Detail-Typ `case`
(Rechtsfall). Bleibt bis zur SP-2-Ausarbeitung in der
Basis, ohne indexierende Fassade. Beweismittel sind
kein eigener Entity-Typ — sie werden als
`evidence`-Relation abgebildet ([[Katalog-evidence]]).

### case

- **Zweck:** laufendes Verfahren — bündelt Documents,
  Fristen, Status
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: case`, `status`
  (`aktiv`/`ruhend`/`abgeschlossen`)
- **Struktur-Konvention:** Sektionen Gegenstand und
  Parteien / Status / Fristen / Zugehörige Documents
  (chronologisch) / Status-Log / Offene Punkte /
  Bezüge.
