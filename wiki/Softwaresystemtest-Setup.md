---
type: software-system-test-setup
replaces_type: system-test-setup
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Softwaresystemtest-Setup

**Ich löse [[Systemtest-Setup]] aus SP-1 ab und verändere
die Semantik wie folgt:** software-spezifische Sektionen
(Unit-Tests, Integrationstests, docker-compose.yml,
Umgebungsvariablen, Ausführung).

## Meta

- **Typ:** `software-system-test-setup` —
  Sollzustands-Fassade Softwaresystemtest-Setup.
  Singleton; löst `system-test-setup` aus SP-1 ab
  (`replaces_type:` als Typ-Name, String-Notation;
  Katalog-Eintrag [[Katalog-Softwaresystemtest-Setup]]).
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei allen hier
  festgehaltenen Setup-Angaben liegt in dieser Fassade
  (Wiki.md §1.1a).
- **Geheimnisse-Regel:** Werte von Zugangsdaten stehen
  nie in dieser Fassade — nur Variablennamen und
  Erklärung, wie sie zu setzen sind
  (MasterPrompt §6.3).
- **Abgrenzung:** diese Fassade beschreibt, **wie**
  geprüft wird. Die einzelnen Testfälle stehen als
  TEST-Elemente im SP-1-Register [[Testfaelle]], die
  Ergebnisse eines Durchgangs nach Testplan im
  SP-1-Register [[Testberichte]].
- **Ausnahmen sind Feststellungen:** braucht ein
  Projekt keine externen Dienste, wird das ausdrücklich
  festgehalten — das Fehlen der `docker-compose.yml`
  ist dann eine bewusste Feststellung, kein Versäumnis.
- **Betrieb docker-compose:** der Agent stellt die
  `docker-compose.yml` bereit, deployt sie aber nicht;
  der User deployt und meldet Host, Ports und
  Zugangsdaten zurück.
- **Testplan ist ein Stand, kein Detail-Knoten:**
  diese Fassade hält die Solllage (Testarten,
  Testumgebung, Ausführung, Ausnahmen) und bleibt
  lebend; der Testplan zu einer Marke ist ein Stand
  mit der Dokumenttyp-Kennung `testplan`, abgeleitet
  aus den Testfällen und mit Kopie dieser Solllage
  ([[Katalog-Testplan]]; Mechanik:
  [[Einfrieren-und-Abloesen]]). Für Ausführende ohne
  Wiki-Zugang gibt es je Testdurchgang die
  Durchführungs-Instanz
  ([[Katalog-Durchfuehrungs-Instanz]]).
- **Testergebnis-Regel:** die dreistufige
  Nachweis-Regel (flüchtiger Lauf, beleg-würdiger Lauf
  mit TRES oder REP, nicht reproduzierbarer Lauf)
  gilt unverändert aus SP-1 — führender Ort `## Meta`
  der SP-1-Fassade [[Systemtest-Setup]]; lesen, bevor
  ein Testlauf belegt wird.
- **Commit-Präfix:** Änderungen laufen unter dem
  SP-1-Präfix `Test-Setup:` weiter (kein eigener
  RP-1-Präfix).

---

**Bearbeitungsstand:** _(vom Agenten aus der Test-Framework-
Entscheidung abgeleitet und bei Änderungen
überschrieben)_

Beschreibt, wie geprüft wird.

## Unit-Tests

<Übersicht der vorhandenen und geplanten Unit-Tests.
Verantwortungsbereich pro Test-Datei.>

## Integrationstests

<Setup-Beschreibung, benötigte externe Dienste,
Ausführungsanleitung.>

## docker-compose.yml

<Verweis auf die `docker-compose.yml` für Integrationstest-
Dienste (Datenbanken, Message-Broker etc.). Datei muss
eigenständig und ohne lokale Docker-Installation nutzbar
sein.>

## Umgebungsvariablen

<Namen der Umgebungsvariablen für Host, Ports und
Zugangsdaten — **niemals deren Werte** (MasterPrompt
§6.3). Nur Variablennamen und Erklärung, wie sie zu
setzen sind.>

## Ausführung

<Konkrete Befehle für Unit- und Integrationstests,
Voraussetzungen, erwartete Ausgabe.>
