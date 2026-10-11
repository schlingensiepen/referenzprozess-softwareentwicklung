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

---

_(Eingespielt beim Starter-Bau aus
`Knotentypen-Anhang-SP-1.md` — Wiki.md §11.3
Schritt 3.)_

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


---

_(Eingespielt beim Starter-Bau aus
`Knotentypen-Anhang-RP-1.md` — Wiki.md §11.3
Schritt 3.)_

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
