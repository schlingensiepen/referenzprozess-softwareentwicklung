---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Testberichte

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`test-report-log` ([[Testberichte]]) mit Element-Typ
`test-report`. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### test-report-log

- **Zweck:** Register aller Testberichte dieses Repos
  (Durchgänge nach Testplan)
- **Pflichtfelder:** `type: test-report-log`
- **Präfix:** `TRES`
- **Datei:** `wiki/Testberichte.md`
- **Singleton**
- **Kanonizität:** kanonisch für die Kurzform aller
  TRES-Einträge (Wiki.md §1.1a); ein TRES ist
  Nachweis, eingefroren ab Anlage.

### test-report

- **Zweck:** Ergebnis eines Testdurchgangs nach einem
  freigegebenen Testplan-Stand, je TEST-ID
  (Detail-Knoten zum TRES-Eintrag im Register)
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: test-report`, `id` (Format
  `TRES-NNN`), `status` (`angenommen` ab Anlage, ohne
  weitere Übergänge; [[Register-Lebenszyklus]]),
  `status_date`, `marke` (geerbt aus dem
  Testplan-Stand; ein BUG aus diesem Testbericht trägt
  sie als Marke der Meldung — der getestete Stand ist
  der Stand, an dem der Fehler beobachtet wurde,
  [[Katalog-Fehlermeldungen]]), `herkunft` (Liste; Inhalt und
  Format: [[Einfrieren-und-Abloesen]] §Stand),
  `datum`
- **Optional:** `alias` (Liste; Wiki.md §4.1)
- **Beispielname:** `TRES-001 Systemtest Marke 1.0.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Testberichte]].
- **Nicht Bestandenes:** was ein Testbericht mit nicht
  bestandenen oder blockierten Testfällen für die
  Freigabe des Deploy-Stands bedeutet (Anwender
  entscheidet, Einschränkung im Freigabe-Eintrag,
  Fehlerstand-Angebot): `## Meta` von [[Testberichte]]
  — lesen, bevor die Freigabe vorgelegt wird.
