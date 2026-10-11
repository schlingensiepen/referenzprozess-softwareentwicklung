---
type: types
active: true   # kann nicht deaktiviert werden — Knotentypen ist Pflicht-Fassade (mandatory)
---

# Knotentypen

## Meta

- **Typ:** `types` — kanonischer Katalog aller im
  Projekt zulässigen Wiki-Knotentypen. Singleton,
  Pflicht-Fassade.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Rolle:** der Katalog beschreibt Typen generisch
  (Pflichtfelder, Datei-Konvention,
  Singleton-Markierung). Was in diesem Projekt aktiv
  ist, steht in [[Fassaden]]; Struktur-Konventionen der
  Detail-Knoten (Frontmatter-Muster, Sektions-Aufbau)
  stehen in der `## Meta`-Sektion der jeweils
  indexierenden Fassade.
- **Erweiterung:** Projekte ergänzen eigene Typen unter
  §Projektspezifische Erweiterungen; jeder neue
  Detail-Typ braucht eine indexierende Fassade und
  einen Katalog-Eintrag hier.
- **Prozess-Merge:** Prozess-Typen kommen über die
  `Knotentypen-Anhang-<Prozess>`-Dateien in diesen
  Katalog (Wiki.md §11.3/§11.4).

---

**Stand:** _(vom Agenten beim Init befüllt und
projektspezifisch erweitert)_

Konzeptuelle Beschreibung der Typen: siehe
`../Wiki.md` §3, §3a.

---

## Typ-Konventionen

- **Terminologie:** Typ- und Feld-Namen sind englisch
  (Default); deutsche Ausnahmen nur, wenn kein
  sinnvolles englisches Äquivalent besteht.
- **Enum-Felder** folgen dem Muster `<typ>_type:`
  (z.B. `document_type`, `organization_type`) — für
  Klassifikation ohne zusätzliche Pflichtfelder,
  wenn alle Instanzen dieselbe Feld-Struktur tragen.
  Ein `subtype:`-Feld ist obsolet und wird nicht
  mehr verwendet.
- **Vererbung `extends:`** — ein Katalog-Eintrag kann
  mit `extends: <eltern-typ>` einen einzelnen
  Eltern-Typ benennen (Einzel-Vererbung): der
  Kind-Typ erbt alle Pflicht- und Kann-Felder des
  Eltern-Typs, ergänzt eigene Felder und
  überschreibt keine geerbten. Vererbung ist für
  echte semantische Spezialisierung mit
  zusätzlichen Feldern gedacht; Klassifikation ohne
  Feld-Änderung nutzt das Enum-Feld.
  Auflösungs-Regel beim Anlegen einer Instanz:
  Katalog-Eintrag des Typs prüfen; steht dort
  `extends:`, auch den Eltern-Eintrag prüfen und
  dessen Pflichtfelder in die Prüfliste aufnehmen.
  Vererbungs-Zyklen im Katalog sind verboten.

---

## Fassaden (Singleton-Typen)

Existieren höchstens einmal pro Projekt.

### mission

- **Zweck:** Projekt-Überblick für neue Leser und
  externe Agenten (Kurzform)
- **Pflichtfelder:** `type: mission`
- **Datei:** `wiki/Mission Statement.md`
- **Singleton**

### mission-long

- **Zweck:** Projekt-Überblick (Langform)
- **Pflichtfelder:** `type: mission-long`
- **Datei:** `wiki/Mission Statement Long.md`
- **Singleton**

### facts

- **Zweck:** Projekteinstieg, projektweite Fakten,
  Stolpersteine (Anwender-Terrain)
- **Pflichtfelder:** `type: facts`
- **Datei:** `wiki/Facts.md`
- **Singleton, Pflicht**

### facade-registry

- **Zweck:** MetaFassade — Register aller Fassaden mit
  Kurzform, Status und Kategorie (FassadenLandkarte)
- **Pflichtfelder:** `type: facade-registry`
- **Datei:** `wiki/Fassaden.md`
- **Singleton, Pflicht**

### internal-machinery-log

- **Zweck:** Fassade des Steuerungs-Wissens (Konzepte,
  Prozeduren, Muster, Regeln — `internal-*`-Knoten)
- **Pflichtfelder:** `type: internal-machinery-log`
- **Datei:** `wiki/InterneMechanik.md`
- **Singleton, Pflicht**

### timeline

- **Zweck:** Zeitachse — was ist wann passiert
- **Pflichtfelder:** `type: timeline`
- **Datei:** `wiki/Chronologie.md`
- **Singleton**

### deadline-log

- **Zweck:** Fälligkeitsübersicht mit Sektionen
  Offen/Erledigt/Abgelaufen
- **Pflichtfelder:** `type: deadline-log`
- **Datei:** `wiki/Fristen.md`
- **Singleton**

### file-number-log

- **Zweck:** Register aller Aktenzeichen im Projekt
- **Pflichtfelder:** `type: file-number-log`
- **Datei:** `wiki/Aktenzeichen.md`
- **Singleton**

### contact-log

- **Zweck:** Register — wer ist wofür zuständig
- **Pflichtfelder:** `type: contact-log`
- **Datei:** `wiki/Ansprechpartner.md`
- **Singleton**

### glossary

- **Zweck:** Freigegebene Terminologie
- **Pflichtfelder:** `type: glossary`
- **Datei:** `wiki/Glossar.md`
- **Singleton**

### glossary-review

- **Zweck:** Glossar-Vorschläge in Bearbeitung
  (Review-Zwischenstufe)
- **Pflichtfelder:** `type: glossary-review`
- **Datei:** `wiki/Glossar Review.md`
- **Singleton**

### concept-log

- **Zweck:** Register der Sach-Wissens-Anker
  (`concept`-Knoten) — Sach-Ebene; die Sprach-Ebene
  (Benennungen) regelt das Glossar
- **Pflichtfelder:** `type: concept-log`
- **Datei:** `wiki/Konzepte.md`
- **Singleton**

### target-mark-log

- **Zweck:** Register der Zielmarken — benannte
  Planungs-Horizonte (Versionen, Ereignis-Marken,
  Etappen) mit den Zeigern `current` und
  `in-progress`; definiert das `zielmarke:`-Feld
  und die Marken-Trigger-Semantik für die planbaren
  Register-Typen
- **Pflichtfelder:** `type: target-mark-log`
- **Datei:** `wiki/Zielmarken.md`
- **Singleton**

### types

- **Zweck:** kanonischer Typen-Katalog (diese Datei)
- **Pflichtfelder:** `type: types`
- **Datei:** `wiki/Knotentypen.md`
- **Singleton, Pflicht**

### idea-log

- **Zweck:** Register unverbindlicher Ideen für spätere
  Iterationen (domänen-übergreifend)
- **Pflichtfelder:** `type: idea-log`
- **Datei:** `wiki/Ideen.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`, per Init-Fassaden-Auswahl
  deaktivierbar)
- **Kanonizität:** kanonisch für den 8-Zustands-Status
  aller IDEA-Einträge (Wiki.md §1.1a).

### decision-log

- **Zweck:** Register aller Entscheidungen des Projekts
  (universeller Mechanismus)
- **Pflichtfelder:** `type: decision-log`
- **Datei:** `wiki/Entscheidungen.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`, per Init-Fassaden-Auswahl
  deaktivierbar)
- **Kanonizität:** kanonisch für den 8-Zustands-Status
  aller DEC-Einträge (Wiki.md §1.1a).

### input-document-log

- **Zweck:** Register aller Eingangsdokumente —
  fokussierte Sicht auf die beim Ingest angelegten
  `document`-Knoten
- **Pflichtfelder:** `type: input-document-log`
- **Datei:** `wiki/Eingangsdokumente.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)

### agent-report-log

- **Zweck:** Register aller Sub-Agent-Berichte des
  Projekts
- **Pflichtfelder:** `type: agent-report-log`
- **Datei:** `wiki/Agent-Berichte.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)
- **Kanonizität:** kanonisch für den Bericht-Status
  aller REP-Einträge (Wiki.md §1.1a).

### research-artifact-log

- **Zweck:** Register aller Rechercheartefakte —
  extern beschafftes Wissen als Nachweis, nicht
  Wahrheit
- **Pflichtfelder:** `type: research-artifact-log`
- **Datei:** `wiki/Rechercheartefakte.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)
- **Kanonizität:** kanonisch für den
  Recherche-Status aller REC-Einträge
  (Wiki.md §1.1a).

### person-log

- **Zweck:** Register aller `person`-Knoten
- **Pflichtfelder:** `type: person-log`
- **Datei:** `wiki/Personen.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)

### place-log

- **Zweck:** Register aller `place`-Knoten
- **Pflichtfelder:** `type: place-log`
- **Datei:** `wiki/Orte.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: false`)

### organization-log

- **Zweck:** Register aller `organization`-Knoten
- **Pflichtfelder:** `type: organization-log`
- **Datei:** `wiki/Organisationen.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)

### thing-log

- **Zweck:** Register aller `thing`-Knoten
- **Pflichtfelder:** `type: thing-log`
- **Datei:** `wiki/Dinge.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: false`)

### member-log

- **Zweck:** Relations-Register aller
  `member`-Relationen (Person↔Organisation)
- **Pflichtfelder:** `type: member-log`
- **Datei:** `wiki/Mitgliedschaften.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: false`)

---

## Kern-Detail-Typen

### document

- **Zweck:** ein Wiki-Knoten pro eigenständig
  zitierbarem Eingangsdokument
- **Pflichtfelder:** `type: document`,
  `document_type` (Enum), `source_text`,
  `ingested_at`
- **Empfohlen:** `source_original` (bei Scans),
  `pages` (bei Sammeldokumenten)
- **Enum-Werte `document_type`**
  (Domänen-Gruppierung ist reine Sortierhilfe):
  - Rechtsfall: `bescheid`, `urteil`, `einspruch`,
    `kommentar`, `schreiben`, `formular`
  - SW-Entwicklung: `spec`, `issue`, `adr-doc`,
    `protocol`, `pr`, `changelog`
  - Produktentwicklung: `brief`, `presentation`,
    `market-research`
  - Wissenschaft: `paper`, `book`, `preprint`,
    `norm`, `standard`, `thesis-doc`
  - Übernommene Konzepte: `proposal`
- **Beispielname:**
  `2026-03-11 Angebot 2026-117 Sanierung Amselweg.md`
- **Bezugs-Rolle „Gegenstand" (DEC-216):** worauf
  sich ein Dokument bezieht (der Gegenstand eines
  Bescheids, einer Bestellung, eines Angebots), ist
  ein **Verweis-Feld im Body** (Wikilink auf das
  betroffene Wissenselement beliebigen Typs) — kein
  eigener Entity-Typ.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Eingangsdokumente]].

### person

- **Zweck:** Person mit Stammdaten und Rollen
  (Basis-Entity)
- **Pflichtfelder:** `type: person`
- **Beispielname:** `Tina Reiherbach.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Personen]].

### place

- **Zweck:** Ort mit Stammdaten (Basis-Entity)
- **Pflichtfelder:** `type: place`
- **Beispielname:** `Mittelbach Muehlgaessle.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Orte]].

### organization

- **Zweck:** Organisation mit Stammdaten und Rollen
  (Basis-Entity)
- **Pflichtfelder:** `type: organization`,
  `organization_type` (Enum: `company`, `team`,
  `abteilung`, `division`, `institution`,
  `publisher`, … — erweiterbar)
- **Optional:** `parent_organization`
  (Unterorganisationen rekursiv)
- **Beispielname:** `Stadtwerke Mittelbach.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Organisationen]].

### thing

- **Zweck:** physisches, identifizierbares Ding mit
  Stammdaten (Basis-Entity) — Gerät, Sensor, Aktor,
  Fahrzeug, Bauwerk, Beweisstück. **Abgrenzung
  (DEC-216):** nicht für Software-/Daten-Objekte;
  und nicht für den „Gegenstand" eines
  Verfahrens/Bescheids — der ist eine Bezugs-Rolle
  (Verweis-Feld am `document`-Knoten auf das
  betroffene Wissenselement beliebigen Typs), keine
  Entity-Klasse.
- **Pflichtfelder:** `type: thing`
- **Beispielname:** `Messstation MS-04.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Dinge]].

### concept

- **Zweck:** Fachbegriff, Norm, Prinzip oder
  technisches Konzept — Sach-Wissens-Anker für
  Cross-References (Sach-Ebene; die Benennung
  regelt das Glossar — Sprach-Ebene)
- **Pflichtfelder:** `type: concept`
- **Beispielname:** `Skonto.md`,
  `Semantic Line Breaks.md`, `REST API.md`
- **Register:** Eintrag in der Fassade [[Konzepte]]
  ist Teil der Knoten-Anlage (Name +
  Ein-Satz-Erläuterung + Wikilink).
- **Struktur-Konvention:** Sektionen `## Definition`
  (knapp), `## Kontext / Anwendung`, optional
  `## Bezüge zu Grundlagen`, `## Bezüge` (Angewendet
  in, Verwandte Concepts, Glossar-Verweis).
- **Struktur-Konventionen im Übrigen:** `## Meta`
  der Fassade [[Konzepte]].

### target-mark

- **Zweck:** einzelne **gewichtige** Zielmarke als
  Detail-Knoten zum Eintrag im Zielmarken-Register
  (Kriterium „gewichtig", Wiki.md §2.4); Regelfall
  bleibt der Inline-Eintrag in der Fassade
- **Pflichtfelder:** `type: target-mark`
- **Beispielname:** `1.0 Aurora.md`
- **Kanonizität:** Wahrheit bei Zeigern und Abfolge
  liegt in `wiki/Zielmarken.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Zielmarken]].

### event

- **Zweck:** gewichtiges Ereignis mit Kontext,
  Beteiligten, Quelle (Hybrid zur Chronologie)
- **Pflichtfelder:** `type: event`, `date`
- **Empfohlen:** `case`, `source`
- **Optional:** `origin: redaktionell`
- **Beispielname:**
  `2026-04-15 Ereignis Angebot angenommen 2026-117.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Chronologie]].

### deadline

- **Zweck:** gewichtige Frist mit Kontext,
  Teilschritten, Historie (Hybrid zu Fristen)
- **Pflichtfelder:** `type: deadline`, `status`
  (`offen`/`erfuellt`/`abgelaufen`), `due`
- **Empfohlen:** `case`, `source`
- **Optional:** `fulfilled_at`
- **Beispielname:**
  `2026-05-15 Frist Bindefrist Angebot 2026-117.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Fristen.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Fristen]].

### idea

- **Zweck:** unverbindliche Idee mit Optionen,
  Trade-offs, Vorbedingungen und Herkunft
  (Detail-Knoten der Ideen-Fassade)
- **Pflichtfelder:** `type: idea`, `id` (Format
  `IDEA-NNN`), `status` (8-Zustands-Enum),
  `status_date`
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung), `zielmarke`
  (Marken-Bezeichnung; nur wenn verschoben oder für
  eine Marke geplant, [[Zielmarken]]),
  `superseded_by`
- **Beispielname:**
  `IDEA-003 Projekttyp mit aktivem Steuerungsverhalten.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Ideen.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Ideen]].

### decision

- **Zweck:** Projekt-, Design- oder Architektur-
  Entscheidung (Detail-Knoten für DEC-Eintrag im
  Register). ADR-Muster; universeller Mechanismus —
  jedes Projekt dokumentiert Entscheidungen.
- **Pflichtfelder:** `type: decision`, `id`
  (Format `DEC-NNN`), `status` (8-Zustands-Enum),
  `status_date`
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung), `zielmarke`
  (Marken-Bezeichnung; nur wenn verschoben oder für
  eine Marke geplant, [[Zielmarken]]),
  `supersedes` (Liste),
  `superseded-by` (Liste)
- **Beispielname:** `DEC-001 Wiki-Layer ersetzt stage.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Entscheidungen.md` (Wiki.md §1.1a).
- **Unveränderlichkeits-Regeln** (Kurzform; Betrieb
  siehe `## Meta` der Fassade [[Entscheidungen]]):
  - Inhalt eingefroren ab Status `angenommen`;
    ausgenommen nur YAML-Header, sichtbarer
    Kopf-Vermerk, Vermerke-Sektion (append-only)
    und Tippfehler-/tote-Verweis-Korrekturen.
  - Ablösung ersetzt vollständig — ein Ablöse-DEC
    beantwortet die Frage komplett neu, kein
    „gilt weiter außer Absatz X".
  - `supersedes:`/`superseded-by:` immer als Listen
    mit DEC-ID-Werten, in beide Richtungen gepflegt.
  - DEC-Nummern werden nie wiederverwendet; Lücken
    bleiben.
  - Abgelöste DECs tragen einen sichtbaren
    Ablöse-Vermerk am Dokumentanfang.
  - Verworfene Alternativen sind Pflichtteil jedes
    DEC.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Entscheidungen]].

### agent-report

- **Zweck:** zitierfähiger Bericht eines Sub-Agenten
  (interne Analyse, Prüfung, Ausführung)
- **Pflichtfelder:** `type: agent-report`, `id`
  (Format `REP-NNN`), `titel`, `modell`, `datum`,
  `ampel` (`gruen`/`gelb`/`rot`/`—`)
- **Beispielname:** `REP-001 — Pipeline-Review.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Agent-Berichte.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Agent-Berichte]].

### research-artifact

- **Zweck:** Ergebnis einer externen Recherche als
  zitierfähiger Nachweis — extern beschafftes
  Wissen ist Nachweis, nicht Wahrheit
- **Pflichtfelder:** `type: research-artifact`,
  `id` (Format `REC-NNN`), `titel`, `quelle_liste`
  (Liste), `datum`
- **Beispielname:** `REC-001 — Vergleich
  Lizenzmodelle.md`
- **Kanonizität:** Wahrheit bei Recherche-Status
  liegt in `wiki/Rechercheartefakte.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Rechercheartefakte]].

### internal-concept / internal-procedure / internal-pattern / internal-rule

- **Zweck:** Steuerungs-Wissen des Projekt-Systems —
  Konzept-Erklärung (`internal-concept`),
  Handlungs-Prozedur (`internal-procedure`),
  Design-Muster mit Wahl-Optionen (`internal-pattern`),
  verbindliche einzelne Konvention (`internal-rule`).
  Der `internal-` Präfix grenzt ab von `concept`
  (Anwender-Fachbegriffe).
- **Pflichtfelder:** `type: internal-<concept |
  procedure | pattern | rule>`
- **Beispielname:** `Berichten-statt-Blockieren.md`,
  `Git-Bestandsaufnahme.md`
- **Ablage:** flach im `wiki/`-Root.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[InterneMechanik]].

---

## Relations

Relations verknüpfen bestehende Wiki-Knoten über
Frontmatter-Felder — sie beschreiben eine Rolle
zwischen Knoten, keine eigenständige Sache. Ein
Relations-Typ verknüpft zwei (oder mehr) Entitäten
mit einem Zweck bzw. spezifischen Attributen und
hat keinen eigenständigen Objekt-Charakter (im
Gegensatz zu Entitäten wie Person, Organisation,
Ort). Realisierung je nach Komplexität und
Attribut-Umfang: **inline in einer Fassade**
(Kategorie b — Beispiel [[Ansprechpartner]]) oder
als **Detail-Knoten mit Frontmatter** (Kategorie a
— Beispiel `member`).

### evidence

- **Zweck:** Beweismittel-Beziehung — verknüpft eine
  Beweismittel-Quelle mit der belegten Aussage. Die
  Rolle „Beweismittel" ist relational, nicht
  intrinsisch: ein und dasselbe Dokument kann in einem
  Verfahren Beweismittel sein und in einem anderen
  nicht. Kein eigener Entity-Typ.
- **Pflicht-Feld:** `source:` — Wikilink-Slug des
  Wissenselements, das das Beweismittel darstellt
  (beliebiger Typ zulässig: `document`, `person`-Entity,
  `thing`, `event`, …).
- **Optional-Feld:** `target:` — die belegte Aussage;
  entfällt, wenn die Aussage bereits im `source`-Knoten
  selbst ausgeschrieben ist.
- **Herkunft:** mitgebracht vom Prozess
  Recht-und-Verwaltung; hier zur Katalog-Vollständigkeit
  benannt.

### member

- **Zweck:** Mitgliedschafts-Relation — verknüpft
  eine Person mit einer Organisation, mit Rolle und
  Zeitraum.
- **Pflicht-Felder:** `type: member`, `person:`,
  `organization:` (String-Slugs der verknüpften
  Knoten).
- **Optional-Felder:** `role:`, `from:`/`to:`
  (Zeitraum).
- **Beispielname:** `Tina Reiherbach bei
  Stadtwerke Mittelbach.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Mitgliedschaften]].

---

## Domänen-Detail-Typen

### Rechtsfall

_(bleibt bis zur SP-2-Ausarbeitung in der Basis,
ohne indexierende Fassade)_

#### case

- **Zweck:** laufendes Verfahren — bündelt Documents,
  Fristen, Status
- **Pflichtfelder:** `type: case`, `status`
  (`aktiv`/`ruhend`/`abgeschlossen`)
- **Struktur-Konvention:** Sektionen Gegenstand und
  Parteien / Status / Fristen / Zugehörige Documents
  (chronologisch) / Status-Log / Offene Punkte /
  Bezüge.

#### argument

- **Zweck:** Argumentationslinie/Position für
  Einsprüche und Stellungnahmen
- **Pflichtfelder:** `type: argument`
- **Struktur-Konvention:** Sektionen Kernthese /
  Begründung / Belege / Gegenargumente / Einsatzorte /
  Bezüge.

_(Beweismittel sind kein eigener Entity-Typ — sie
werden als `evidence`-Relation abgebildet, siehe
§Relations.)_

### Entwicklung (prozess-mitgebracht)

_(Prozess-spezifische Detail-Typen werden nicht im
Basis-Katalog geführt. Sie liegen im jeweiligen
Prozess-Teil-Wiki und kommen beim Prozess-Merge
(Wiki.md §11.3) über die Anhänge in diesen Katalog:_

- `requirement`, `bug-report`, `system-component`,
  `role` — bringt SP-1 mit; siehe
  `Knotentypen-Anhang-SP-1`. Der Typ `decision` liegt
  in der Basis (universeller Mechanismus, siehe
  Kern-Detail-Typen oben).
- `user-story`, `use-case`, `software-system-component`
  (löst `system-component` ab) — bringt RP-1 mit;
  siehe `Knotentypen-Anhang-RP-1`.

---

## Infrastruktur-Typen der Template-Quelle

_(Typen der mitgelieferten Template-Dateien — sie
brauchen keine indexierende Fassade. Nur die beim
Merge kopierten landen im Anwender-wiki.)_

- **`process-procedure`** — `Vorgehen-<P>.md` der
  Prozesse; wird beim Merge ins Anwender-wiki
  kopiert.
- **`types-appendix`** — `Knotentypen-Anhang-<P>.md`;
  wird beim Merge nicht als Datei kopiert, seine
  Blöcke gehen in `wiki/Knotentypen.md` auf.
- **`process-brief`** — Prozess-Steckbriefe
  (Template-Quelle, nie kopiert).
- **`process-mapping`** — Prozess-Landkarten
  (Template-Quelle, nie kopiert).
- **`facade-bootstrap`** — Einmal-Anweisungen je
  Fassade in `referenzprozesse/<P>/bootstrap/`
  (DEC-217; Template-Quelle, nie kopiert).

## Projektspezifische Erweiterungen

_(Projekte ergänzen hier eigene Typen, die über den
Standardkatalog hinausgehen. Format wie oben; jeder
neue Detail-Typ braucht eine indexierende Fassade und
einen Eintrag hier.)_

_(vom User oder Agenten bei Bedarf gefüllt)_
