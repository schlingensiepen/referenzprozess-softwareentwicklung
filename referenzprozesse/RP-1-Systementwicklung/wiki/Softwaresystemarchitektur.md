---
type: software-system-architecture-overview
supersedes: system-architecture-overview
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Softwaresystemarchitektur

**Ich löse [[Systemarchitektur]] aus SP-1 ab und verändere
die Semantik wie folgt:** software-spezifische Sektionen
(Zweck+Abgrenzung, Einstiegspunkte, Technologie-Stack,
Architektur, Stilkonvention, Design-Patterns).

## Meta

- **Typ:** `software-system-architecture-overview` —
  Sollzustands-Fassade Softwaresystemarchitektur.
  Singleton; löst `system-architecture-overview` aus
  SP-1 ab (`supersedes:` als Katalog-Name im
  Frontmatter, String-Notation).
- **Kategorie:** (b) Inline-Fassade im wiki/ mit
  optionalen Detail-Knoten — siehe Wiki.md
  §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei allen hier
  festgehaltenen Aspekten liegt in dieser Fassade —
  Detail-Knoten (Typ `software-system-component`)
  dürfen für einzelne Komponenten oder Muster ergänzt
  werden, die Fassade behält die Übersicht
  (Wiki.md §1.1a).
- **Sollzustand:** nicht fortgeschrieben — bei
  Änderungen überschrieben; die zugehörige Entscheidung
  mit Begründung steht im Entscheidungsregister.
- **Architekturdokument (DEC-214):** Zweck-Freigaben
  der Architektur binden sich an ein versioniertes
  **Architekturdokument** in `output/` —
  eine wiki-verweisende Ableitung dieser Fassade
  (MasterPrompt §1.5 Stand-Zwang, §9.6 Grade) —,
  nie an die lebende Fassade selbst; der
  Freigabe-Eintrag nennt den exakten Stand.
- **Contract-Bezug:** bei Multi-Komponenten-Setups
  referenzieren die Komponenten-Beschreibungen ihre
  Zeilen im [[Contract-Index]].
- **`software-system-component`-Detail-Knoten-
  Konventionen:** Frontmatter
  `type: software-system-component`; Dateiname im
  Title-Case. Sektionen: Zweck (ein bis drei Sätze) /
  Schnittstellen (API, Contract, Protokoll,
  Gegenstelle) / Verantwortung (z.B. Zuständigkeit je
  Verzeichnis — und wofür ausdrücklich nicht) /
  Abhängigkeiten (Komponenten, Bibliotheken, externe
  Dienste mit kurzer Einordnung) / Bezüge
  (Fassaden-Eintrag [[Softwaresystemarchitektur]]).
  **Anlage-Schwelle** (aus SP-1 geerbt, in RP-1
  praktisch immer erreicht): Pflicht, sobald eine
  Komponente einen eigenen Bearbeiter oder
  Peer-Agenten, einen Contract oder ein eigenes
  Repository hat — der Knoten ist der stabile
  Bezugs-Anker der Komponente; der [[Contract-Index]]
  verlinkt auf die Komponenten-Knoten.
- **Komponenten-Register:** die Sektion §Komponenten
  ist das Register — eine Zeile je Komponente (Name,
  Aufgabe, Rolle Koordinator-/Komponenten-Repo,
  Wikilink auf den Detail-Knoten). Ein separates
  Komponenten-Register gibt es nicht; diese Fassade
  ist der eine führende Ort.
- **`deployment`-Detail-Knoten:** lebendes
  Deploy-Wissen (Zielumgebung, Verfahren,
  Betriebs-Voraussetzungen) ist ein Detail-Knoten
  vom Typ `deployment`, indexiert über diese Fassade
  (analog dem `system`-Typ); das Deploy-Dokument
  (P10) ist der eingefrorene `output/`-Stand
  (Zweigleisigkeit, MasterPrompt §1.5).
- **Commit-Präfix:** Änderungen laufen unter dem
  SP-1-Präfix `Architektur:` weiter (kein eigener
  RP-1-Präfix).

---

**Stand:** _(vom Agenten beim Init aus dem Auftrag
abgeleitet und bei Änderungen überschrieben — nicht
fortgeschrieben)_

Beschreibt den **Sollzustand** des Projekts.

## Zweck und Abgrenzung

<Was leistet das Projekt — und ausdrücklich, was leistet
es nicht.>

## Einstiegspunkte

<Alle geplanten Einstiegspunkte mit Dateipfad und
Aufgabe: Hauptprogramme, CLI-Entry-Points, Server-
Startskripte, eigenständige Service-Funktionen,
Lambda-Handler etc.>

## Technologie-Stack

<Gewählte Sprache(n), Frameworks, Runtime-Versionen. Jede
externe Bibliothek mit kurzer Einordnung, wofür sie
eingesetzt wird. Bei gemischten Technologien: Aufteilung
beschreiben.>

## Architektur

<Zuständigkeit je Verzeichnis (z.B. `src/api/` → REST-
Controller, `src/models/` → Datenmodelle) sowie das
verbindliche Architekturmuster (MVC, Hexagonal, Layered
etc.).>

## Komponenten

_(Register der Komponenten — führender Ort. Eine Zeile
je Komponente; Detail-Knoten nach der Anlage-Schwelle
in `## Meta`. Beim Standalone-Fall ohne
Komponenten-Split bleibt die Tabelle einzeilig oder
entfällt mit Vermerk.)_

| Komponente | Aufgabe | Repo/Rolle | Detail |
|---|---|---|---|
| <Name> | <ein Satz> | <Koordinator/Komponente> | <[[Wikilink]] oder — > |

## Stilkonvention

<Gesetzte Stilvorgabe (PEP 8, ESLint-Standards etc.) und
die Werkzeuge, die sie durchsetzen.>

## Design-Patterns

<Die für dieses Projekt verbindlichen Design-Patterns.>
