---
type: catalog-entry
art: einzeltyp
process: RP-1
---

# Katalog-use-case

**Ich bin neu in RP-1.** Einzeltyp-Eintrag: Element-Typ
`use-case`, die RP-1-Form des Szenarios — erweitert
und ersetzt `scenario` ([[Katalog-Szenarien]]);
Register und Präfix bleiben die der Basis-Fassade
[[Szenarien]] (SCEN). Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert;
die Ersetzung läuft nach Wiki.md §11.4.

### use-case

- **Zweck:** Szenario in der Form des Use Case —
  Vorbedingung, Hauptablauf, Alternativabläufe,
  Nachbedingung
- **Extends:** `scenario`
- **Replaces type:** `scenario`
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** ja
- **Pflichtfelder:** `type: use-case` (die übrigen
  Pflichtfelder erbt der Typ von `scenario`, darunter
  `rollen` mit Rollen aus [[Rollen]])
- **Dokumenttypen:** [[Katalog-Konzept-Stand]]
- **Beispielname:** `SCEN-001 Antrag online einreichen.md`
- **Kanonizität:** wie `scenario` — Wahrheit bei
  Status-Drift liegt in `wiki/Szenarien.md`
  (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Szenarien]], mit zwei Abweichungen: Frontmatter
  `type: use-case` und der Spiegel
  `replaces_type: scenario` (Ersetzung: [[Katalog]]
  §Typ-Konventionen); Sektionen Vorbedingung /
  Hauptablauf / Alternativabläufe / Nachbedingung /
  Vermerke (append-only) / Bezüge.
