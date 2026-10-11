---
type: types-appendix
process: SP-1
---

# Knotentypen-Anhang — SP-1

**Ich bin neu in SP-1.** Dieser Anhang bringt die SP-1-
spezifischen Detail-Knotentypen und Fassaden-Typen mit.
Beim Prozess-Merge (Wiki.md §11.3) werden die
Detail-Typ-Blöcke in die Anwender-`wiki/Knotentypen.md`
unter „Domänen-Detail-Typen" eingespielt, die
Fassaden-Typ-Blöcke unter „Fassaden (Singleton-Typen)"
und die Relations-Typ-Blöcke in den Relations-Katalog.
Der Anhang selbst wird nicht als eigene Datei ins
Anwender-`wiki/` kopiert.

_(Kein Fassaden-Knoten — Katalog-Anhang ohne
Bootstrap-Dateien/Meta-Sektionen; die Betriebs-Semantik der
Typen steht in der `## Meta`-Sektion der jeweils
indexierenden Fassade.)_

---

### requirement

- **Zweck:** fachliche oder nicht-funktionale Anforderung
  (Detail-Knoten für REQ-Eintrag im Register)
- **Pflichtfelder:** `type: requirement`, `id`
  (Format `REQ-NNN`), `status` (8-Zustands-Enum),
  `status_date`
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung), `zielmarke`
  (Marken-Bezeichnung; nur wenn verschoben oder für
  eine Marke geplant, [[Zielmarken]]),
  `superseded_by`
- **Beispielname:** `REQ-001 Nutzer kann Datei hochladen.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Anforderungen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Anforderungen]].

### bug-report

- **Zweck:** einzelne Fehlermeldung (Detail-Knoten für
  BR-Eintrag im Register)
- **Pflichtfelder:** `type: bug-report`, `id`
  (Format `BR-NNN`), `status`, `status_date`
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung), `zielmarke`
  (Marken-Bezeichnung; nur wenn verschoben oder für
  eine Marke geplant, [[Zielmarken]]),
  `superseded_by`, `fix_requirement`
- **Beispielname:** `BR-001 Login-Timeout nach 5 Minuten.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Fehlermeldungen.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Fehlermeldungen]].

### system-component

- **Zweck:** einzelner Baustein des Systems (Komponente,
  Modul, Baugruppe) — Detail-Knoten zur
  Systemarchitektur-Fassade; die Sollzustands-Übersicht
  liegt in `wiki/Systemarchitektur.md`
- **Pflichtfelder:** `type: system-component`
- **Optional:** `system_component_type` — Enum-Feld
  (Konvention `<typ>_type`): `service` | `library` |
  `component` | `module` | `baugruppe` (erweiterbar)
- **Beispielname:** `Auth Modul.md`, `Sensorik Baugruppe.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Systemarchitektur.md` (Wiki.md §1.1a).
- **Register:** §Bausteine der Fassade
  [[Systemarchitektur]] — eine Zeile je Baustein;
  Detail-Knoten-Pflicht nach der Anlage-Schwelle in
  deren `## Meta` (eigener Bearbeiter/Peer-Agent,
  Contract oder eigenes Repo → Pflicht).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Systemarchitektur]].

### system

- **Zweck:** das entwickelte System als Ganzes oder
  ein relevantes Umsystem/Nachbar-System
  (Detail-Knoten zur Systemarchitektur-Fassade)
- **Pflichtfelder:** `type: system`
- **Beispielname:** `Lagerverwaltung.md`,
  `Umsystem ERP.md`
- **Kanonizität und Indexierung:** über die Fassade
  [[Systemarchitektur]] (§Zweck und Abgrenzung bzw.
  §Beziehungen) — es gibt kein eigenes
  Systeme-Register.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Systemarchitektur]].

### role

- **Zweck:** einzelne Verwendungs-Rolle im
  Nutzer-Prozess (Detail-Knoten zum Eintrag im
  Verwendungs-Rollen-Register)
- **Pflichtfelder:** `type: role`, `id` (sprechender
  Slug, z.B. `sachbearbeiter`), `status`, `status_date`
- **Optional:** `verwendet_in` (String-Liste),
  `system_abbildung` (RP-1-Ergänzung)
- **Beispielname:** `Sachbearbeiter.md`
- **Kanonizität:** Wahrheit bei Status und
  Kurzbeschreibung liegt in
  `wiki/Verwendungs-Rollen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Verwendungs-Rollen]].

### decision (SP-1-Präzisierung)

- **Basis-Typ:** `decision` liegt in der Basis
  (universeller Mechanismus, Register
  [[Entscheidungen]]) — SP-1 präzisiert ihn
  MADR-kompatibel; kein neuer Typ, keine neue
  Fassade. Beim Prozess-Merge wird dieser Block an
  den Basis-`decision`-Block der
  Anwender-`wiki/Knotentypen.md` angefügt.
- **Zusätzliche Kann-Frontmatter-Felder** (englische
  Kopfschlüssel nach MADR-Konvention):
  `decision-makers: []`, `consulted: []`,
  `informed: []` — Rollen, keine Klarnamen
  (Unveränderlichkeit der DEC-Detail-Dateien,
  Personenbezug).
- **Empfohlene Detail-Abschnitte** in fester
  Reihenfolge: Kontext und Problem / Betrachtete
  Optionen / Entscheidung / Folgen / Verworfen und
  warum.
- **Flag `document-format: madr`** (Kann-Feld im
  Frontmatter): nicht gesetzt — Felder optional,
  Abschnitte Empfehlung; gesetzt — strenge
  Konvention: Abschnitte Pflicht, englische
  Kopfschlüssel, der Kopf ist reine Buchhaltung.
- **Unverändert:** Dateiname und Fließtext-Sprache
  folgen der Projekt-Konvention; Register-Mechanik
  und `## Meta` der Fassade [[Entscheidungen]]
  gelten weiter.

**Register-Detail-Knoten unter SP-1:** SP-1 bringt als
Register-Detail-Typen `requirement`, `bug-report` und
`role` mit — der Typ `decision` liegt in der Basis
(universeller Mechanismus); SP-1 präzisiert ihn nur
(siehe oben).
Die Register-Typen teilen sich einheitliche
Register-Felder im Frontmatter
(`id`, `status`, `status_date`, `trigger` — Datum oder
Zielmarken-Bezeichnung —, `zielmarke` — nur wenn
verschoben oder für eine Marke geplant —,
`superseded_by`)
und folgen dem **8-Zustands-Lebenszyklus** (offen |
aufgeschoben | angenommen | in-umsetzung | umgesetzt |
abgeschlossen | verworfen | abgelöst durch —
[[Register-Lebenszyklus]]). Die Fassaden
sind kanonisch für den Status (Wiki.md §1.1a); die
Detail-Knoten spiegeln. Detail-Knoten Pflicht, sobald
Body-Inhalte anfallen (Nachweis, Vermerke, längere
Beschreibung, zitierpflichtige Bezüge).

---

## Fassaden-Typen (Singletons)

Von SP-1 mitgebrachte Fassaden mit generischen (nicht
software-spezifischen) Sektionen — Systemarchitektur und
Test-Setup sind bei jedem Entwicklungsvorhaben (Software,
Hardware, System) relevant:

### requirement-log

- **Zweck:** Register aller Anforderungen
  (REQ-Register, Sektionen Funktional /
  Nicht-funktional)
- **Pflichtfelder:** `type: requirement-log`
- **Datei:** `wiki/Anforderungen.md`
- **Singleton**

### bug-report-log

- **Zweck:** Register aller Fehlermeldungen
  (BR-Register; Meldungen, nicht Arbeit)
- **Pflichtfelder:** `type: bug-report-log`
- **Datei:** `wiki/Fehlermeldungen.md`
- **Singleton**

### system-architecture-overview

- **Zweck:** Sollzustands-Fassade Systemarchitektur
  (Zweck+Abgrenzung, Bausteine, Beziehungen,
  Verantwortungen, Design-Prinzipien)
- **Pflichtfelder:** `type: system-architecture-overview`
- **Datei:** `wiki/Systemarchitektur.md`
- **Singleton**

### system-test-setup

- **Zweck:** Sollzustands-Fassade Systemtest-Setup
  (Testarten, Testumgebung, Ausführung, Ausnahmen)
- **Pflichtfelder:** `type: system-test-setup`
- **Datei:** `wiki/Systemtest-Setup.md`
- **Singleton**

### role-log

- **Zweck:** Register aller Verwendungs-Rollen im
  Nutzer-Prozess (führender Ort für
  Rollen-Definitionen)
- **Pflichtfelder:** `type: role-log`
- **Datei:** `wiki/Verwendungs-Rollen.md`
- **Singleton**

### business-relation-log

- **Zweck:** Register der Geschäftsbeziehungen des
  Projekts zu externen Organisationen — führt die
  Relations `customer`, `competitor`, `partner`
  inline (Kategorie b, keine Detail-Knoten-Pflicht)
- **Pflichtfelder:** `type: business-relation-log`
- **Datei:** `wiki/Geschäftsbeziehungen.md`
- **Singleton** — optional, Vorauswahl deaktiviert
  (Steckbrief § Mitgebrachte Fassaden)

---

## Relations-Typen

Beim Prozess-Merge werden diese Blöcke in den
Relations-Katalog der Anwender-`wiki/Knotentypen.md`
eingespielt (analog den Detail-Typ-Blöcken):

### customer

- **Relation:** Organisation ↔ Projektaspekt —
  „Organisation X ist Kunde für Aspekt Y"
- **Geführt in:** [[Geschäftsbeziehungen]] (inline)

### competitor

- **Relation:** Organisation ↔ Projektaspekt —
  „Organisation X ist Wettbewerber bei Aspekt Y"
- **Geführt in:** [[Geschäftsbeziehungen]] (inline)

### partner

- **Relation:** Organisation ↔ Projektaspekt —
  „Organisation X ist Partner für Aspekt Y"
- **Geführt in:** [[Geschäftsbeziehungen]] (inline)
