---
type: catalog-entry
art: register
process: RP-1
---

# Katalog-Softwaresystemarchitektur

**Ich löse [[Katalog-Systemarchitektur]] aus SP-1 ab
und verändere die Semantik wie folgt:** Register-Eintrag
mit Fassade `software-system-architecture-overview`
([[Softwaresystemarchitektur]]; ersetzt
`system-architecture-overview`) und dem Entitäts-Typ
`software-system-component` (ersetzt
`system-component`). Der Element-Typ
`architecture-description` (ARC) und der Typ `system`
bleiben SP-1-Typen in [[Katalog-Systemarchitektur]]
und werden nicht ersetzt; unter RP-1 indexiert diese
Fassade die ARC-Elemente — Kanonizität und
Struktur-Konventionen, die der SP-1-Eintrag bei
[[Systemarchitektur]] verortet, liegen dann in
[[Softwaresystemarchitektur]]. Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert;
Ersetzungen laufen nach Wiki.md §11.4.

### software-system-architecture-overview

- **Zweck:** Fassade der Softwaresystemarchitektur —
  Register der Architektur-Festlegungen (ARC) und
  lebende Übersicht mit software-spezifischen
  Sektionen; löst [[Systemarchitektur]]
  (`system-architecture-overview`) aus SP-1 ab
- **Replaces type:** `system-architecture-overview`
- **Pflichtfelder:** `type: software-system-architecture-overview`
- **Präfix:** `ARC`
- **Datei:** `wiki/Softwaresystemarchitektur.md`
- **Singleton**

### software-system-component

- **Zweck:** Beschreibung einer einzelnen
  Software-Komponente oder eines Musters —
  Detail-Knoten zur Zeile in §Komponenten der
  Fassade; Name und Lage stehen dort
- **Replaces type:** `system-component`
- **Klasse:** außerhalb (Entität; die Lage wird im
  Stand kopiert)
- **Pflichtfelder:** `type: software-system-component`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Softwaresystemarchitektur]].
- **Ersetzung:** löst den generischen
  `system-component` aus SP-1 ab und verfeinert die
  Semantik zu software-spezifischer Komponenten-
  beschreibung (einzelnes Modul, Service oder Muster;
  die Sollzustands-Übersicht liegt in der
  `software-system-architecture-overview`-Fassade
  `wiki/Softwaresystemarchitektur.md`).
