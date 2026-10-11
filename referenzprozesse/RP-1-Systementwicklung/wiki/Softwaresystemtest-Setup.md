---
type: software-system-test-setup
supersedes: system-test-setup
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
  (`supersedes:` als Katalog-Name, String-Notation).
- **Kategorie:** (b) Inline-Fassade im wiki/ mit
  optionalen Detail-Knoten — siehe Wiki.md
  §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei allen hier
  festgehaltenen Setup-Angaben liegt in dieser Fassade
  — Detail-Knoten dürfen für einzelne
  Integrationstest-Szenarien ergänzt werden
  (Wiki.md §1.1a).
- **Geheimnisse-Regel:** Werte von Zugangsdaten stehen
  nie in dieser Fassade — nur Variablennamen und
  Erklärung, wie sie zu setzen sind
  (MasterPrompt §6.3).
- **Ausnahmen sind Feststellungen:** braucht ein
  Projekt keine externen Dienste, wird das ausdrücklich
  festgehalten — das Fehlen der `docker-compose.yml`
  ist dann eine bewusste Feststellung, kein Versäumnis.
- **Betrieb docker-compose:** der Agent stellt die
  `docker-compose.yml` bereit, deployt sie aber nicht;
  der User deployt und meldet Host, Ports und
  Zugangsdaten zurück.
- **`testplan`-Detail-Knoten:** die lebende
  Testplanung für einen Durchlauf, ein Release oder
  eine Abnahme ist ein Detail-Knoten vom Typ
  `testplan` (diese Fassade hält die Solllage und
  indexiert die Pläne); der übergabefähige Stand
  geht versioniert nach `output/` (Zweigleisigkeit,
  MasterPrompt §1.5).
- **Testergebnis-Regel (dreistufig):**
  (1) normaler Test-Lauf: Output flüchtig im
  Code-Bereich, Nachweis ist die Kadenz-Zeile im
  Commit; (2) beleg-würdiger Lauf (Freigabe,
  Abnahme, Meilenstein): Ergebnis als
  REP-Detail-Knoten ins Register [[Agent-Berichte]]
  — mit kuratierten Auszügen (relevante Fälle als
  Zitate) und **Reproduzierbarkeits-Angabe**
  (Commit-Hash, Werkzeug, Aufruf); (3) nur wenn ein
  Lauf nicht reproduzierbar ist und sein
  Voll-Material aufbewahrt werden muss: eingefrorene
  Kopie nach `overview/` mit REP-Verweis. Es gibt
  keinen eigenen Testergebnis-Knotentyp.
- **Commit-Präfix:** Änderungen laufen unter dem
  SP-1-Präfix `Test-Setup:` weiter (kein eigener
  RP-1-Präfix).

---

**Stand:** _(vom Agenten aus der Test-Framework-
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
