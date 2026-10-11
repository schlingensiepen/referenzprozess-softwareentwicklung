# Wiki-Katalog

**Stand:** _(vom Agenten beim Init und laufend gepflegt)_

_(Kein Fassaden-Knoten — Struktur-Datei des Wiki-Layers,
ohne Bootstrap-/Meta-Sektionen.)_

## Wiki-Struktur (Meta-Header)

Dieses Wiki enthält das komplette projektspezifische
Wissen. Zwei Ebenen:

- **Fassaden** (Übersichts-Knoten) — geschlossene,
  am Stück lesbare Dokumente pro Themenkomplex
  (Facts, Chronologie, Fristen, Ansprechpartner
  etc.). Für Überblick beim Sessionstart geladen.
  Übersicht aller Fassaden mit Status: [[Fassaden]].
- **Detail-Knoten** — atomare Wiki-Knoten pro
  Wissensobjekt (`document`, `person`, `place`,
  `organization`, `thing`, `concept`, `event`,
  `deadline`, `idea`, `decision`, `case`,
  `argument` etc.).

**Progressive Disclosure:** Für Überblick reichen die
Fassaden. Für Details folgt der Agent den Wikilinks
in die Detail-Knoten. Bei Aufgaben mit Außenwirkung
sind die Detail-Knoten für Inhalt maßgeblich; für
kanonisch markierte Felder gilt die Fassade (klassische
Fälle: Frist-Status, Stolpersteine, Register-Status
über Basis-Register Entscheidungen/Ideen und vom
Prozess mitgebrachte Register wie Anforderungen/
Fehlermeldungen — siehe Wiki.md §1.1a).

**Externe Agenten und neue Leser** starten bei
`[[Mission Statement]]`, sofern angelegt.

**Fassaden-Status** (aktiv/deaktiviert) lebt führend in
der FassadenLandkarte [[Fassaden]] — dieser Katalog
listet die Detail-Knoten nach Typ.

Vollständige Wiki-Logik: siehe `../Wiki.md`.

## document

_(wird beim ersten Ingest angelegt)_

## person

_(wird beim Ingest oder redaktionell angelegt;
Register: [[Personen]])_

## place

_(wird beim Ingest oder redaktionell angelegt;
Register: [[Orte]])_

## organization

_(wird beim Ingest oder redaktionell angelegt;
Register: [[Organisationen]])_

## thing

_(wird beim Ingest oder redaktionell angelegt;
Register: [[Dinge]])_

## concept

_(wird redaktionell angelegt)_

## event

_(wird beim Ingest bei gewichtigen Ereignissen
angelegt)_

## deadline

_(wird beim Ingest bei gewichtigen Fristen angelegt)_

## idea

_(wird bei gewichtigen IDEA-Einträgen angelegt;
Register: [[Ideen]])_

## decision

_(wird bei gewichtigen DEC-Einträgen angelegt;
Register: [[Entscheidungen]])_

## agent-report

_(wird beim Abschluss von Sub-Agent-Aufträgen
angelegt; Register: [[Agent-Berichte]])_

## research-artifact

_(wird beim Recherche-Ingest angelegt; Register:
[[Rechercheartefakte]])_

## member

_(wird bei attribut-reichen Mitgliedschaften
angelegt; Register: [[Mitgliedschaften]])_

## internal-concept / internal-procedure / internal-pattern / internal-rule

_(mitgelieferte Basis-Knoten; beim Init um die
Betriebs-Konfigurations-Knoten ergänzt — Register:
[[InterneMechanik]])_
