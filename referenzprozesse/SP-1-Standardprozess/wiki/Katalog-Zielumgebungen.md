---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Zielumgebungen

**Ich bin neu in SP-1.** Register-Eintrag:
Entitäts-Fassade `target-environment-log`
([[Zielumgebungen]]) mit dem Entitäts-Typ
`target-environment`. Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### target-environment-log

- **Zweck:** Register der Zielumgebungen, in die das
  Ergebnis ausgeliefert wird (lebende Fakten)
- **Pflichtfelder:** `type: target-environment-log`
- **Präfix:** `—` (Umgebungen tragen einen Namen,
  keine ID)
- **Datei:** `wiki/Zielumgebungen.md`
- **Singleton**

### target-environment

- **Zweck:** einzelne Zielumgebung mit ihren Fakten
  (Provider, Hosts, Versionen, Verweise auf
  Zugangsdaten) — Detail-Knoten zum Eintrag der
  Fassade
- **Klasse:** außerhalb (Entität; im Stand kopiert)
- **Pflichtfelder:** `type: target-environment`
- **Beispielname:** `Produktion Hoster A.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Zielumgebungen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Zielumgebungen]].
