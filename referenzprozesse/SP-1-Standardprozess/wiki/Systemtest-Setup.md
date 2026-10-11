---
type: system-test-setup
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Systemtest-Setup

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — ein
Systemtest-Setup ist bei jedem Entwicklungsvorhaben
(Software, Hardware, System) relevant.

## Meta

- **Typ:** `system-test-setup` — Sollzustands-Fassade
  Systemtest-Setup mit generischen Sektionen.
  Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ mit
  optionalen Detail-Knoten — siehe Wiki.md
  §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei allen hier
  festgehaltenen Setup-Angaben liegt in dieser Fassade
  — Detail-Knoten dürfen für einzelne Test-Szenarien
  ergänzt werden (Wiki.md §1.1a).
- **Sollzustand:** bei Änderungen überschrieben, nicht
  fortgeschrieben.
- **Ausnahmen sind Feststellungen:** was das Setup
  nicht braucht (z.B. „keine externen Dienste"), wird
  ausdrücklich festgehalten — das Fehlen ist dann eine
  dokumentierte Entscheidung, kein Versäumnis.
- **Ablösung:** RP-1 löst diese Fassade mit
  `Softwaresystemtest-Setup` ab (per `supersedes:`,
  Wiki.md §11.4).

---

**Stand:** _(vom Agenten aus den Test-Entscheidungen
abgeleitet und bei Änderungen überschrieben)_

Beschreibt, wie geprüft wird.

## Testarten

<Welche Arten von Prüfungen das Vorhaben vorsieht
(z.B. Einzelprüfungen, Verbundprüfungen, Abnahmetests)
und was sie jeweils abdecken.>

## Testumgebung

<Benötigte Umgebung, Aufbauten, externe Dienste oder
Geräte — inklusive Zugang und Voraussetzungen.>

## Ausführung

<Wie die Prüfungen konkret ausgeführt werden:
Schritte bzw. Befehle, Voraussetzungen, erwartetes
Ergebnis.>

## Ausnahmen

<Bewusste Feststellungen, was das Setup nicht braucht
(z.B. „keine externen Dienste").>
