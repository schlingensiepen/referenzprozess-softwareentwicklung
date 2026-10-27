---
type: catalog-entry
art: register
---

# Katalog-Dinge

Register-Eintrag: Fassade `thing-log` ([[Dinge]]) mit
Element-Typ `thing`.

### thing-log

- **Zweck:** Register aller `thing`-Knoten
- **Pflichtfelder:** `type: thing-log`
- **Präfix:** `—`
- **Datei:** `wiki/Dinge.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: false`)

### thing

- **Zweck:** physisches, identifizierbares Ding mit
  Stammdaten (Basis-Entity) — Gerät, Sensor, Aktor,
  Fahrzeug, Bauwerk, Beweisstück. **Abgrenzung:**
  nicht für Software-/Daten-Objekte;
  und nicht für den „Gegenstand" eines
  Verfahrens/Bescheids — der ist eine Bezugs-Rolle
  (Verweis-Feld am `document`-Knoten auf das
  betroffene Wissenselement beliebigen Typs), keine
  Entity-Klasse.
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: thing`
- **Beispielname:** `Messstation MS-04.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Dinge]].
