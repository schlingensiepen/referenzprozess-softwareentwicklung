---
type: catalog-entry
art: register
---

# Katalog-Rechercheartefakte

Register-Eintrag: Fassade `research-artifact-log`
([[Rechercheartefakte]]) mit Element-Typ
`research-artifact`.

### research-artifact-log

- **Zweck:** Register aller Rechercheartefakte —
  extern beschafftes Wissen als Nachweis, nicht
  Wahrheit
- **Pflichtfelder:** `type: research-artifact-log`
- **Präfix:** `REC`
- **Datei:** `wiki/Rechercheartefakte.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)
- **Kanonizität:** ein REC ist Nachweis, eingefroren
  ab Anlage; die Fassaden-Zeile spiegelt den
  Detail-Knoten (`## Meta` der Fassade, Wiki.md
  §1.1a).

### research-artifact

- **Zweck:** Ergebnis einer externen Recherche als
  zitierfähiger Nachweis — extern beschafftes
  Wissen ist Nachweis, nicht Wahrheit
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: research-artifact`,
  `id` (Format `REC-NNN`), `titel`, `quelle_liste`
  (Liste; je Quelle Herkunfts-URL **und** Archiv-Pfad
  unter `research/REC-NNN - <Kurzsatz>/`, sofern
  archiviert), `datum`
- **Optional:** `marke` (Marke, zu der die Recherche
  gehört), `alias` (Liste; Wiki.md §4.1)
- **Beispielname:** `REC-001 — Vergleich
  Lizenzmodelle.md`
- **Kanonizität:** Nachweis, eingefroren ab Anlage;
  der Detail-Knoten führt, die Fassaden-Zeile in
  `wiki/Rechercheartefakte.md` spiegelt ihn.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Rechercheartefakte]].
