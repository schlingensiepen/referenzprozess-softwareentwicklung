---
type: types-appendix
process: RP-1
---

# Knotentypen-Anhang — RP-1

**Ich bin neu in RP-1.** Dieser Anhang bringt die RP-1-
spezifischen Detail-Knotentypen und Fassaden-Typen mit.
Beim Prozess-Merge (Wiki.md §11.3) werden die
Detail-Typ-Blöcke in die Anwender-`wiki/Knotentypen.md`
unter „Domänen-Detail-Typen" eingespielt, die
Fassaden-Typ-Blöcke unter „Fassaden (Singleton-Typen)";
`supersedes:`-Ablösungen laufen nach Wiki.md §11.4.
Der Anhang
selbst wird nicht als eigene Datei ins Anwender-`wiki/`
kopiert.

_(Kein Fassaden-Knoten — Katalog-Anhang ohne
Bootstrap-Dateien/Meta-Sektionen; die Betriebs-Semantik der
Typen steht in der `## Meta`-Sektion der jeweils
indexierenden Fassade.)_

**Vermerk zur Zwischenphase:** `user-story` und `use-case`
werden voraussichtlich zu **Ausprägungen der generischen
SP-1-Vorstufen** `need` / `scenario` umformuliert
(Umformulierung folgt; der ursprünglich vorgesehene
dritte Basis-Typ `structure` ist entfallen — redundant
zur Systemarchitektur-Fassade plus
`system-component`-Detail-Typ). Aktuell stehen sie hier
in der historischen Form aus dem Basis-Katalog, damit
sie im Repo verankert bleiben und beim Merge in
Anwender-Wikis landen können.

---

### user-story

- **Zweck:** User-Story im Agile-Sinne
- **Pflichtfelder:** `type: user-story`, `rollen:`
  (String-Liste der referenzierten Verwendungs-Rollen —
  Definitionen leben führend in
  `wiki/Verwendungs-Rollen.md`)
- Voraussichtlich künftig: Ausprägung von `need` aus
  SP-1 (Vermerk oben).

### use-case

- **Zweck:** Use Case mit Akteuren und Abläufen
- **Pflichtfelder:** `type: use-case`, `rollen:`
  (String-Liste, analog `user-story`)
- Voraussichtlich künftig: Ausprägung von `scenario`
  aus SP-1 (Vermerk oben).

### Softwaresystemkomponente (`software-system-component`)

- **Supersedes:** `system-component` aus SP-1 — löst den
  generischen `system-component` ab und verfeinert die
  Semantik zu software-spezifischer Komponenten-
  beschreibung (einzelnes Modul, Service oder Muster;
  die Sollzustands-Übersicht liegt in der
  `software-system-architecture-overview`-Fassade
  `wiki/Softwaresystemarchitektur.md`).
- **Zweck:** Beschreibung einer einzelnen
  Software-Komponente oder eines Musters
- **Pflichtfelder:** `type: software-system-component`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Softwaresystemarchitektur]].

### contract

- **Zweck:** vereinbarter Vertrag zwischen
  Komponenten (Schnittstelle, Protokoll, Zusagen) —
  Detail-Knoten zum Contract-Index; die Datei liegt
  im **Provider-Repo**
- **Pflichtfelder:** `type: contract`, `id` (Format
  `CON-NNN`), `status` (8-Zustands-Enum,
  Contract-Lesart siehe `## Meta` der Fassade
  [[Contract-Index]]), `status_date`
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung, [[Zielmarken]]),
  `zielmarke` (Marken-Bezeichnung; nur wenn
  verschoben oder eine Fassung für eine Marke
  geplant ist),
  `superseded_by`,
  `fassung` (aktuelle freigegebene Fassung)
- **Beispielname:** `CON-001 Terminal-API.md`
- **Cross-Repo-Adressierung:** `<komponente>/CON-NNN`
  (gleiches Muster wie `terminal/REQ-014`).
- **Kanonizität geteilt:** Inhalt kanonisch in diesem
  Knoten (Provider); Status und Index-Zeile
  kanonisch im [[Contract-Index]] des Koordinators.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Contract-Index]].

### specification

- **Zweck:** lebende Fassung einer Gesamt- oder
  Teilspezifikation (Detail-Knoten zum
  Spezifikations-Register dieses Repos);
  Freigabestände gehen versioniert nach `output/`
  (Zweigleisigkeit, MasterPrompt §1.5)
- **Pflichtfelder:** `type: specification`, `id`
  (Format `SPEC-NNN`), `status` (8-Zustands-Enum),
  `status_date`
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung, [[Zielmarken]]),
  `zielmarke` (Marken-Bezeichnung; nur wenn
  verschoben oder eine Fassung für eine Marke
  geplant ist),
  `superseded_by`
- **Beispielname:** `SPEC-001 Gesamtspezifikation.md`
- **Cross-Repo-Adressierung:** `<komponente>/SPEC-NNN`
  (gleiches Muster wie `terminal/REQ-014`).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Spezifikationen]].

### testplan

- **Zweck:** lebende Testplanung für einen Durchlauf,
  ein Release oder eine Abnahme (Detail-Knoten zur
  Test-Setup-Fassade — das Setup hält die Solllage,
  der Testplan den konkreten Plan); der
  übergabefähige Stand geht versioniert nach
  `output/` (Zweigleisigkeit)
- **Pflichtfelder:** `type: testplan`
- **Beispielname:** `Testplan Release 1.0.md`
- **Struktur-Konventionen und Indexierung:** `## Meta`
  der Fassade [[Softwaresystemtest-Setup]].
  Testergebnisse sind keine `testplan`-Knoten —
  Nachweis-Regel siehe ebenfalls dort.

### deployment

- **Zweck:** lebendes Deploy-Wissen (Zielumgebung,
  Verfahren, Betriebs-Voraussetzungen) —
  Detail-Knoten zur Architektur-Fassade, analog dem
  `system`-Typ aus SP-1; das Deploy-Dokument (P10)
  ist der eingefrorene `output/`-Stand
  (Zweigleisigkeit)
- **Pflichtfelder:** `type: deployment`
- **Beispielname:** `Deployment Produktionsumgebung.md`
- **Struktur-Konventionen und Indexierung:** `## Meta`
  der Fassade [[Softwaresystemarchitektur]].

---

## Fassaden-Typen (Singletons)

RP-1 löst die generischen SP-1-Fassaden ab
(Kompositum-Namen) und bringt den Contract-Index neu
mit:

### software-system-architecture-overview

- **Zweck:** Sollzustands-Fassade Softwaresystemarchitektur
  — löst [[Systemarchitektur]] (`system-architecture-overview`)
  aus SP-1 ab; software-spezifische Sektionen
- **Pflichtfelder:** `type: software-system-architecture-overview`,
  `supersedes: system-architecture-overview`
- **Datei:** `wiki/Softwaresystemarchitektur.md`
- **Singleton**

### software-system-test-setup

- **Zweck:** Sollzustands-Fassade Softwaresystemtest-Setup
  — löst [[Systemtest-Setup]] (`system-test-setup`) aus
  SP-1 ab; software-spezifische Sektionen
- **Pflichtfelder:** `type: software-system-test-setup`,
  `supersedes: system-test-setup`
- **Datei:** `wiki/Softwaresystemtest-Setup.md`
- **Singleton**

### specification-log

- **Zweck:** Register aller Spezifikationen dieses
  Repos (Koordinator: Gesamt-, Komponente:
  Teilspezifikation) — führender Ort für den
  Spezifikations-Status; Zweigleisigkeit mit
  `output/`-Freigabeständen
- **Pflichtfelder:** `type: specification-log`
- **Datei:** `wiki/Spezifikationen.md`
- **Singleton**

### contract-index

- **Zweck:** Register aller Contracts zwischen
  Komponenten (nur beim Koordinator aktiv;
  Contract-Inhalt kanonisch beim Provider)
- **Pflichtfelder:** `type: contract-index`
- **Datei:** `wiki/Contract-Index.md`
- **Singleton**
