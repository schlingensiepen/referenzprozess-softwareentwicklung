---
type: catalog-entry
art: einzeltyp
process: RP-1
---

# Katalog-user-story

**Ich bin neu in RP-1.** Einzeltyp-Eintrag: Element-Typ
`user-story`, die RP-1-Form des Bedarfs — erweitert
und ersetzt `need` ([[Katalog-Bedarfe]]); Register und
Präfix bleiben die der Basis-Fassade [[Bedarfe]]
(NEED). Beim Prozess-Merge (Wiki.md §11.3) wird dieser
Eintrag als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert; die Ersetzung läuft nach
Wiki.md §11.4.

### user-story

- **Zweck:** Bedarf in der Form der User-Story — „Als
  ⟨Rolle⟩ will ich ⟨Ziel⟩, damit ⟨Nutzen⟩“, mit
  Akzeptanzkriterien
- **Extends:** `need`
- **Replaces type:** `need`
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** ja
- **Pflichtfelder:** `type: user-story` (die übrigen
  Pflichtfelder erbt der Typ von `need`, darunter
  `rollen` mit Rollen aus [[Rollen]])
- **Dokumenttypen:** [[Katalog-Konzept-Stand]]
- **Beispielname:** `NEED-001 Antrag ohne Papier stellen.md`
- **Kanonizität:** wie `need` — Wahrheit bei
  Status-Drift liegt in `wiki/Bedarfe.md`
  (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Bedarfe]], mit zwei Abweichungen: Frontmatter
  `type: user-story` und der Spiegel
  `replaces_type: need` (Ersetzung: [[Katalog]]
  §Typ-Konventionen); Sektionen Story /
  Akzeptanzkriterien / Vermerke (append-only) /
  Bezüge.
