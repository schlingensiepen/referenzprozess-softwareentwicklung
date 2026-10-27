---
type: system-test-setup
active: false   # abgelöst durch [[Softwaresystemtest-Setup]] (RP-1, Wiki.md §11.4); führend: wiki/Fassaden.md
---

# Systemtest-Setup

**Abgelöst durch [[Softwaresystemtest-Setup]]** (RP-1;
Wiki.md §11.4 — diese Fassade bleibt als Hintergrund
mit `active: false`, neuer Inhalt geht an die aktive
Fassade).

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — ein
Systemtest-Setup ist bei jedem Entwicklungsvorhaben
(Software, Hardware, System) relevant.

## Meta

- **Typ:** `system-test-setup` — Sollzustands-Fassade
  Systemtest-Setup mit generischen Sektionen.
  Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei allen hier
  festgehaltenen Setup-Angaben liegt in dieser Fassade
  (Wiki.md §1.1a).
- **Sollzustand, lebend:** bei Änderungen
  überschrieben, nicht fortgeschrieben; der
  Testplan-Stand kopiert das Setup
  ([[Katalog-Testplan]]).
- **Abgrenzung:** diese Fassade beschreibt, **wie**
  geprüft wird. Die einzelnen Testfälle stehen als
  TEST-Elemente in [[Testfaelle]], die Ergebnisse
  eines Durchgangs in [[Testberichte]].
- **Ausnahmen sind Feststellungen:** was das Setup
  nicht braucht (z.B. „keine externen Dienste"), wird
  ausdrücklich festgehalten — das Fehlen ist dann eine
  dokumentierte Entscheidung, kein Versäumnis.
- **Testergebnis-Regel (dreistufig; führender Ort,
  gilt auch unter RP-1):**
  (1) normaler Test-Lauf: Output flüchtig im
  Code-Bereich, Nachweis ist die Kadenz-Zeile im
  Commit; (2) beleg-würdiger Lauf (Freigabe,
  Abnahme, Meilenstein): bei einem Testdurchgang nach
  Testplan ist der Nachweis der Testbericht (TRES) in
  [[Testberichte]] — seine Herkunft ist die
  Reproduzierbarkeits-Angabe; ein beleg-würdiger Lauf
  ohne Testplan wird REP-Detail-Knoten im Register
  [[Agent-Berichte]] mit kuratierten Auszügen
  (relevante Fälle als Zitate) und
  **Reproduzierbarkeits-Angabe** (Commit-Hash,
  Werkzeug, Aufruf); (3) nur wenn ein Lauf nicht
  reproduzierbar ist und sein Voll-Material
  aufbewahrt werden muss: eingefrorene Kopie nach
  `overview/` mit Verweis auf TRES bzw. REP. Außer
  TRES gibt es keinen eigenen Testergebnis-Typ.
- **Ablösung:** RP-1 löst diese Fassade mit
  `Softwaresystemtest-Setup` ab (per `replaces_type:`,
  Wiki.md §11.4).

---

**Bearbeitungsstand:** _(vom Agenten aus den Test-Entscheidungen
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
