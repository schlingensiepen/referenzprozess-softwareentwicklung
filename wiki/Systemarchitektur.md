---
type: system-architecture-overview
active: false   # abgelöst durch [[Softwaresystemarchitektur]] (RP-1, Wiki.md §11.4); führend: wiki/Fassaden.md
---

# Systemarchitektur

**Abgelöst durch [[Softwaresystemarchitektur]]** (RP-1;
Wiki.md §11.4 — diese Fassade bleibt als Hintergrund
mit `active: false`, neuer Inhalt geht an die aktive
Fassade).

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) —
Systemarchitektur ist bei jedem Entwicklungsvorhaben
(Software, Hardware, System) relevant.

## Meta

- **Typ:** `system-architecture-overview` — Fassade
  der Systemarchitektur: Register der
  **Architektur-Festlegungen** (ARC) und lebende
  Übersicht mit generischen Sektionen. Singleton,
  ID-Präfix `ARC-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register; dazu
  lebende Sektionen (Zweck und Abgrenzung,
  Komponenten, Beziehungen, Verantwortungen,
  Design-Prinzipien).
- **ARC-Elemente:** Struktur-Beschreibungen ohne
  Alternativen-Abwägung — Zuschnitt und Zuständigkeit
  einer Komponente, Kommunikation über Contracts,
  Lage. Sie stützen sich per `abgeleitet_von:` auf
  Entscheidungen und Funktionsbeschreibungen; eine
  Wahl mit Alternativen (Muster, Technologie) bleibt
  eine DEC in [[Entscheidungen]]. Ein ARC-Element
  legt der Agent als `offen` an; es bleibt
  bearbeitbar, bis es einzeln angenommen wird oder
  mit der Freigabe des ersten Stands, der es verweist,
  und ist ab dann eingefroren
  ([[Einfrieren-und-Abloesen]] §Eintrittsregel); eine
  Änderung ist dann eine Ablösung. Bis zur Bildung des
  Stands ist diese Fassade die Lese-Klammer der Phase
  P5 ([[Lebenslauf-eines-Stands]]). Der Stand der
  Phase P5
  ist das Architekturdokument
  ([[Katalog-Architekturdokument]]).
- **Lebende Sektionen:** die übrigen Sektionen sind
  Sollzustand — bei Änderungen überschrieben, nicht
  fortgeschrieben; ein Stand kopiert sie. Was eine
  Festlegung ist, steht als ARC-Element, nicht nur
  im Fließtext.
- **Kanonizität:** die Wahrheit beim Status der
  ARC-Elemente liegt in dieser Fassade —
  Detail-Knoten (Typ `architecture-description`)
  spiegeln (Wiki.md §1.1a, [[Register-Grundmuster]]);
  bei den lebenden Sektionen liegt die Wahrheit hier.
- **Eintragsformat (ARC):** `### ARC-NNN — <Kurzsatz>`
  in der Sektion §Festlegungen, mit Feldern Status +
  status_date / Gestützt auf (DEC, FUNC) / Angelegt
  (Anlage-Datum `JJJJ-MM-TT`, Pflichtfeld seit 2.0 am
  Eintrag ohne Detail-Knoten, sonst `datum:` im
  Detail-Knoten; [[Katalog]] §Typ-Konventionen) /
  Zielmarke
  ([[Zielmarken]]; Pflichtfeld, kanonisch hier) /
  Ablösung / Detail
  (Wikilink, nur wenn Detail-Knoten existiert).
  Beschreibt die Festlegung eine Schnittstelle, aus
  der ein Contract abgeleitet wird, nennt sie
  zusätzlich **Provider** und **Consumer**
  (Komponenten-Namen aus §Komponenten; Felder
  `provider:` und `consumer:` am Detail-Knoten,
  [[Katalog-Systemarchitektur]]) — daran prüft der
  Lint die Consumer-Registrierungen im
  [[Contract-Index]].
- **`architecture-description`-Detail-Knoten-
  Konventionen:** Frontmatter-Felder:
  [[Katalog-Systemarchitektur]] — lesen beim Anlegen
  eines ARC-Knotens. Sektionen: Festlegung /
  Begründung aus DEC und FUNC / Vermerke (append-only)
  / Bezüge (Fassaden-Eintrag [[Systemarchitektur]]).
  Dateiname `ARC-NNN <Kurzsatz>.md`.
- **Komponenten (Lage-Entität):** die Sektion
  §Komponenten ist das Register der Komponenten und
  ihrer **Lage** — eine Zeile je Komponente (Name,
  Aufgabe, Repo-Name als Qualifizierer in Verweisen
  über Repo-Grenzen, Pfad, Remote, Detail). Eine
  Komponente ist eine Entität; ihr Zuschnitt ist ein
  ARC-Element, ihre Lage lebend und im Stand kopiert.
  **Eigenes Bauteil** ist eine Zeile, deren Lage das
  eigene Repo ist; ein Standalone-Projekt hat genau
  eine solche Zeile. Im Komponenten-Repo führt die
  Sektion zusätzlich den Koordinator und die
  bekannten Nachbarn (gefüllt aus dem Startprompt).
  Lint und Prüfungen lesen die
  Lage hier; eine eigene Komponenten-Fassade gibt es
  nicht.
- **`system-component`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Systemarchitektur]];
  Dateiname im Title-Case (`Auth Modul.md`,
  `Sensorik Baugruppe.md`). Sektionen: Zweck (ein bis drei Sätze) /
  Schnittstellen (angeboten und genutzt: Form,
  Gegenstelle, Vertrag) / Verantwortung (wofür
  zuständig — und wofür ausdrücklich nicht) /
  Abhängigkeiten / Bezüge (Fassaden-Eintrag
  [[Systemarchitektur]]). **Anlage-Schwelle:**
  Pflicht, sobald eine Komponente einen eigenen
  Bearbeiter oder Peer-Agenten, einen Contract oder
  ein eigenes Repository hat — dann ist der Knoten
  der stabile Bezugs-Anker („meine Komponente" ist
  eine Datei). Darunter Kann — Faustregel: sobald eine
  Komponente mehrfach referenziert wird, eigene
  Schnittstellen hat oder als Argumentations-Anker
  dient.
- **`system`-Detail-Knoten:** das entwickelte System
  selbst und relevante Umsysteme/Nachbar-Systeme
  können als Knoten vom Typ `system` angelegt werden
  (Katalog-Eintrag [[Katalog-Systemarchitektur]]).
  Indexiert über
  §Zweck und Abgrenzung bzw. §Beziehungen — es gibt
  kein eigenes Systeme-Register.
- **Zielumgebungen und Deployments** sind eine eigene
  Achse ([[Zielumgebungen]], [[Deployments]]); die
  Architektur gilt je Marke umgebungsunabhängig.
- **Ablösung:** RP-1 löst diese Fassade mit
  `Softwaresystemarchitektur` ab (per `replaces_type:`,
  Wiki.md §11.4).
- **Commit-Präfix:** `Architektur:` (Fassade und
  ARC-Detail-Knoten).

---

**Bearbeitungsstand:** _(vom Agenten beim Init aus dem Auftrag
abgeleitet; lebende Sektionen bei Änderungen
überschrieben, Festlegungen als ARC-Elemente geführt)_

Beschreibt den **Sollzustand** des Systems.

## Zweck und Abgrenzung

<Was leistet das System — und ausdrücklich, was leistet
es nicht.>

## Festlegungen

_(Register der Architektur-Festlegungen, chronologisch
nach ID; Eintragsformat in `## Meta`.)_

## Komponenten

_(Register der Komponenten und ihrer Lage — führender
Ort. Eine Zeile je Komponente; Detail-Knoten nach der
Anlage-Schwelle in `## Meta`. Standalone: eine Zeile
mit dem eigenen Repo.)_

| Komponente | Aufgabe | Repo-Name | Pfad | Remote | Detail |
|---|---|---|---|---|---|
| <Name> | <ein Satz> | <Qualifizierer> | <lokaler Pfad> | <Remote oder —> | <[[Wikilink]] oder — > |

## Beziehungen

<Wie die Komponenten zusammenhängen: Schnittstellen,
Datenflüsse, Abhängigkeiten, Verträge zwischen
Komponenten.>

## Verantwortungen

<Zuständigkeit je Komponente bzw. Bereich — wer oder was
verantwortet welchen Teil des Systems.>

## Design-Prinzipien

<Die für dieses Vorhaben verbindlichen übergreifenden
Prinzipien und Muster.>
