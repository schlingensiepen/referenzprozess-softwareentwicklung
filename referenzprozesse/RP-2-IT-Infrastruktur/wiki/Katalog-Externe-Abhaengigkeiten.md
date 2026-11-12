---
type: catalog-entry
art: register
process: RP-2
---

# Katalog-Externe-Abhaengigkeiten

**Ich bin neu in RP-2.** Register-Eintrag:
Entitäts-Fassade `external-dependency-log`
([[Externe-Abhaengigkeiten]]) mit dem Entitäts-Typ
`external-dependency`. Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### external-dependency-log

- **Zweck:** Register der externen Abhängigkeiten der
  Anlagen — Anbieter, Limits, Guthaben, Fristen und
  Annahmen mit Prüfdatum (lebende Fakten)
- **Pflichtfelder:** `type: external-dependency-log`
- **Präfix:** `—` (Abhängigkeiten tragen einen Namen,
  keine ID)
- **Datei:** `wiki/Externe-Abhaengigkeiten.md`
- **Singleton**

### external-dependency

- **Zweck:** eine externe Abhängigkeit mit ihren Fakten
  und Annahmen — Detail-Knoten zum Eintrag der Fassade
- **Klasse:** außerhalb (Entität; lebend)
- **Pflichtfelder:** `type: external-dependency`, `art`
  (`hoster` | `dns` | `zertifikat` | `portal` |
  `fremd-image` | `lizenz` | `sonstiges`), `betrifft`
  (Liste der Zielumgebungen aus [[Zielumgebungen]])
- **Optional:** `fristen` (Liste der Fristen in
  [[Fristen]] — Vertragsende, Ablauf, Guthaben),
  `annahmen` (Liste; je Annahme ein Satz und die
  Prüf-Frist in [[Fristen]] mit `richtung: gegen-uns`,
  `## Meta` der Fassade), `alias` (Liste; Wiki.md §4.1)
- **Beispielname:** `Hoster A.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Externe-Abhaengigkeiten.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Externe-Abhaengigkeiten]].
- **Prüfdatum als Frist:** das Prüfdatum einer Annahme
  ist keine eigene Feldzeit dieses Registers, sondern
  eine Frist der Basis; so meldet der vorhandene
  Fristen-Lebenszyklus, und RP-2 braucht keinen eigenen
  Wächter ([[Vorgehen-RP-2]] §6).
