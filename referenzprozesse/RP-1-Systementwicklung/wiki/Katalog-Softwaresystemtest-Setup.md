---
type: catalog-entry
art: einzeltyp
process: RP-1
---

# Katalog-Softwaresystemtest-Setup

**Ich löse [[Katalog-Systemtest-Setup]] aus SP-1 ab
und verändere die Semantik wie folgt:**
Einzeltyp-Eintrag: Fassade `software-system-test-setup`
([[Softwaresystemtest-Setup]]; ersetzt
`system-test-setup`) ohne Element-Typ. Der Testplan ist
kein Wiki-Knoten, sondern ein Stand mit der
Dokumenttyp-Kennung `testplan` ([[Katalog-Testplan]],
von SP-1 mitgebracht); das Test-Setup bleibt lebend und
wird in diesem Stand kopiert. Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert;
Ersetzungen laufen nach Wiki.md §11.4.

### software-system-test-setup

- **Zweck:** Sollzustands-Fassade Softwaresystemtest-Setup
  — löst [[Systemtest-Setup]] (`system-test-setup`) aus
  SP-1 ab; software-spezifische Sektionen
- **Replaces type:** `system-test-setup`
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: software-system-test-setup`
- **Datei:** `wiki/Softwaresystemtest-Setup.md`
- **Singleton**
- **Ableitungen:** Testplan-Stand [[Katalog-Testplan]];
  Durchführungs-Instanz je Testdurchgang
  [[Katalog-Durchfuehrungs-Instanz]].
