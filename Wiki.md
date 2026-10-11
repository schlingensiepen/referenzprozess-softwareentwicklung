# Wiki — lebender Sachstand

**Stand: 23.08.2026**

Dieses Dokument beschreibt die vollständige Logik des
`wiki/`-Layers und ist eine Teildatei des MasterPrompts.
Es gilt zusammen mit den Regeln aus `MasterPrompt.md`.

## 1. Grundidee und Entkopplung

### 1.1 Rolle des Wiki

Das Wiki ist die **Single Source of Truth für alles
projektspezifische Wissen** — inklusive Meta-Wissen
wie Terminologie, Chronologie, Fristen und
Typenkatalog. Ebenen:

- **Fassaden (Übersichts-Knoten):** geschlossene,
  am Stück lesbare Dokumente, die zusammenhängende
  Aspekte des Projekts abbilden (Facts,
  Knotentypen, Fassaden, InterneMechanik,
  Chronologie, Fristen, Aktenzeichen,
  Ansprechpartner, Ideen, Entscheidungen, Glossar,
  Mission Statement — vollständige Übersicht in
  §3a, Projekt-Status in der FassadenLandkarte
  [[Fassaden]]). Details §3a.
- **Detail-Knoten (atomar):** pro eigenständig
  zitierbarem Wissensobjekt ein Wiki-Knoten
  (`document`, `person`, `organization`, `concept`,
  `event`, `deadline`, `decision` etc.). Details §3.

`raw/` und `input/` bleiben **Single Source of Truth
für Nachweis und Zitation**.

**Progressive Disclosure:** Für Überblick reichen
die Fassaden (context-window-schonend, beim
Sessionstart geladen). Für Details folgt der Agent
den Wikilinks in die Detail-Knoten. Bei Aufgaben mit
Außenwirkung sind die Detail-Knoten für Inhalt
maßgeblich; für einzelne Felder ist die Fassade
kanonisch — siehe §1.1a.

### 1.1a Feld-Kanonizität (Fassade ↔ Detail-Knoten)

Wo Fassade und Detail-Knoten dasselbe Feld tragen
können, gilt:

- **Detail-Knoten maßgeblich für Inhalt** (Beschreibung,
  Kontext, Nachweis, Vermerke, ausformulierte Fassung).
- **Fassade kanonisch für die als kanonisch markierten
  Felder** (typischerweise Status, Sektions-Zuordnung,
  Ablösungs-Verweise). Jede Fassade benennt diese
  Felder in ihrer `## Meta`-Sektion.

**Schichten, die die Regel arbeitsfähig machen:**

1. **Kanonische Änderungsrichtung.** Wer ein kanonisches
   Feld ändern will, fasst die **Fassade** an, nicht den
   Detail-Knoten. Der Detail-Knoten spiegelt. Damit gibt
   es die Konfliktquelle strukturell nicht.
2. **Standardaufgabe „Fassade nachziehen".** Wenn die
   Änderung dennoch am Detail-Knoten passiert (weil der
   Agent im Kontext dieses Knotens arbeitet), ist das
   Nachziehen der Fassade **Standardaufgabe im selben
   Vorgang** (MasterPrompt §5.1.2 — kein Veto, keine
   Rückfrage). Analog zu Log-Einträgen oder Index-Pflege.
3. **Subagenten-Auftrag umfasst den Nachzug.** Ein
   delegierter Auftrag, der einen Wiki-Knoten ändert,
   umfasst den Fassaden-Nachzug für kanonische Felder
   automatisch — als Teil dessen, was „einen Wiki-Knoten
   ändern" im Template bedeutet.
4. **Sicherheitsnetz Lint.** Sessionstart und Snapshot-
   Lint finden residuale Drift und melden sie als
   Warnung zur Nachpflege durch den User.

**Aktuelle kanonische Ausnahmen** (jede folgt diesem
Muster):

- **Frist-Status:** Fassade `wiki/Fristen.md` kanonisch;
  Detail-Knoten `deadline` spiegelt. Siehe §10a.
- **Stolpersteine:** Fassade `wiki/Facts.md` kanonisch
  gegenüber Detail-Knoten-Inhalten. Siehe MasterPrompt
  §5.4.
- **Register-Status:** `wiki/Entscheidungen.md` (Basis,
  optional) sowie mit SP-1
  `wiki/Anforderungen.md` und `wiki/Fehlermeldungen.md`
  kanonisch für den 8-Zustands-Status; Detail-Knoten
  (`decision`, `requirement`, `bug-report`) spiegeln.

### 1.2 Strikte Entkopplung (eiserne Regel)

`raw/` und `input/` werden **nie verändert**. Der
Wiki-Layer ist vollständig entkoppelt:

- Änderungen am Wiki propagieren nicht zurück.
- Änderungen an `input/` propagieren nicht automatisch
  ins Wiki — Re-Ingest muss explizit angestoßen werden.

### 1.3 Provenienz

Jeder Wiki-Knoten trägt die vollständige Provenienz im
Frontmatter (§4.1). Beim Zitieren in `output/`- oder
`outgoing/`-Dokumenten wird der **Originalname** der
Quelle geführt, nicht der Wiki-Knoten-Name. Beispiel:

> vgl. Grundsteuermessbescheid vom 11.03.2025,
> `scan_2025_03.pdf` S. 4–6

## 2. Ingest-Prozess

### 2.1 Ablauf

Pro `input/`-Datei:

1. KI liest die Datei.
2. Identifiziert enthaltene Einzeldokumente (eins bei
   Einzeldokument, *n* bei Sammeldokument).
3. Legt pro Einzeldokument einen Wiki-Knoten an:
   - Volltext des Einzeldokuments
   - Typ-Zuordnung mit **Vorschlags-Bias
     (DEC-218):** bei typ-mehrdeutigem Material
     zuerst die Typen/Subtypes der aktiven
     Prozesse vorschlagen, dann die generischen
     Basis-Typen; die Wahlfreiheit bleibt
     unberührt.
   - Frontmatter mit Provenienz (§4.1)
   - Metadatenblock und Kurzzusammenfassung (§4.3/4.4)
   - Cross-References (§8)
4. Extrahiert Datumsangaben aus dem Dokument und
   trägt sie ein:
   - **Ereignisse** (Bescheiddatum, erwähnte
     Vergangenheitsdaten) → Eintrag in
     `wiki/Chronologie.md`.
   - **Fristen** (Einspruchsfristen, Abgabefristen,
     Erledigungsfristen) → Eintrag in
     `wiki/Fristen.md` unter `## Offen`, zusätzlich
     ein knapper "Frist gesetzt"-Eintrag in
     `wiki/Chronologie.md`.
   - Für **gewichtige** Ereignisse/Fristen (§2.4):
     zusätzlich ein `event`- bzw. `deadline`-Detail-
     Knoten wird als **Aktions-Entwurf** vorgelegt
     (Vorschlagsblock am Ingest-Ende).
5. Aktualisiert `wiki/Eingangsdokumente.md`
   (Register-Eintrag pro neuem document-Knoten),
   `wiki/Aktenzeichen.md`, `wiki/Ansprechpartner.md`
   (soweit relevant) und `wiki/index.md` (§6).
6. Schreibt einen Eintrag in `wiki/log.md` (§7).
7. Erzeugt einen git-Commit mit passendem Präfix
   (`Ingest:` für Wiki-Knoten, `Chronologie:` /
   `Fristen:` / `Aktenzeichen:` / `Ansprechpartner:`
   für die Fassaden — siehe MasterPrompt §6.2).

**Do-first-mit-Veto:** Der Ingest ist eine
Standardaufgabe nach MasterPrompt §5.1.2. Alle
mechanischen Nebenprodukte (Wiki-Knoten,
Fassaden-Einträge, Cross-References) werden ohne
Rückfrage eingetragen; der User kann per Veto
rückgängig machen. Regel-Kern und Grenzen:
[[Do-first-mit-Veto]] (führender Ort). Ausnahmen
in Kurzform:

- **Facts:** eigene Sonderregel (siehe
  MasterPrompt §5.4 unter "Progressive Disclosure",
  Ausnahme 2 — Stolpersteine überstimmen Detail-
  Knoten). Facts-Vorschläge landen im Frage-Block
  am Ingest-Ende, sparsam und mit Erläuterung.
- **Glossar:** Vorschläge landen in
  `wiki/Glossar Review.md`; nur nach User-Freigabe
  in `wiki/Glossar.md`.
- **Detail-Knoten für "gewichtige" Ereignisse/
  Fristen und neue Concepts:** als Aktions-Entwurf
  am Ingest-Ende vorgelegt (User widerspricht bei
  Bedarf).

**Vorschlagsblock am Ingest-Ende** (nach
MasterPrompt §5.3 Phase D — Erledigt/Aktion/Frage):

```
Erledigt beim Ingest:
- X Wiki-Knoten angelegt: [[…]], [[…]], …
- Chronologie um Y Einträge erweitert
- Aktenzeichen-Register um Z Einträge erweitert
- Ansprechpartner um W Einträge erweitert
- person-/organization-Knoten angelegt:
  [[Sondermann]], [[Finanzamt Mittelbach]]
- …

Aktion (mache ich als Nächstes, sofern kein Veto):
- Ereignis "…" scheint gewichtig — event-Knoten
  anlegen (mit Kontext …).
- Frist "…" mit mehreren Teilschritten — deadline-
  Knoten anlegen.
- Neuer Concept "AdV" als Detail-Knoten anlegen?

Frage (brauche ich von dir):
- Für Facts: Widerspruch beim Datum (Dokument sagt
  15.01., bestehende Chronologie sagt 16.01.) — als
  Stolperstein aufnehmen?
- Für Glossar-Review: Neuer Begriff "AdV" —
  Vorschlag in Review-Datei ablegen?
```

Im Arbeitsmodus (MasterPrompt §5.1.3) landen Facts-
Vorschläge und andere Fragen in
`Offene Fragen.md` statt sofort präsentiert zu
werden.

**Ingest-Fehler (kaputtes PDF, leerer OCR,
verschlüsselte Datei, unbekanntes Format, zu großes
Dokument):** Der Agent legt einen **Skelett-
`document`-Knoten** an mit vollständiger Provenienz
und dem zusätzlichen Frontmatter-Feld
`ingest_status: failed`. Body enthält einen kurzen
Grund-Vermerk ("Ingest fehlgeschlagen — OCR
unlesbar" o.ä.). Kein Volltext, keine
Cross-References, keine Chronologie-/Fristen-
Extraktion, kein `## Bezüge`-Inhalt (Überschrift
darf leer bleiben).

```yaml
---
type: document
document_type: <sofern erkennbar>
source_text: input/raw/<datei>.md
source_original: raw/<datei>.pdf
ingested_at: YYYY-MM-DD
ingest_status: failed
---

# <Datum sofern erkennbar> <Name aus Dateiname>

**Ingest fehlgeschlagen:** <Grund kurz>.
Manuelle Nachpflege oder Re-Ingest nach besserer
Konvertierung erforderlich.

## Bezüge
```

Der Agent kann später auf Fragen wie "Bei welchen
Dokumenten gab es Probleme beim Ingest?" antworten,
indem er alle Knoten mit `ingest_status: failed`
findet.

Sobald ein besserer Ingest möglich ist (User liefert
Passwort, bessere OCR, kleinere Fassung), wird der
Skelett-Knoten per Re-Ingest ersetzt und
`ingest_status` entfernt.

### 2.2 Re-Ingest (Drift)

Wenn eine `input/`-Datei jünger ist als der
`ingested_at`-Zeitstempel der aus ihr abgeleiteten
Wiki-Knoten, ist ein Re-Ingest nötig. Die KI erkennt
das bei Sessionstart (Phase C3 des Sessionstart-
Ablaufs) und bietet es dem User an.

Der Re-Ingest ersetzt den bestehenden Wiki-Knoten
(nicht versioniert; der git-Verlauf dokumentiert den
technischen Verlauf).

### 2.3 Pflege von Chronologie und Fristen beim Ingest

Beim Ingest werden Datumsangaben aus dem Dokument
extrahiert und **in Kategorien** eingetragen
([[Do-first-mit-Veto]], siehe §2.1):

#### Chronologie (Ereignisse — rückwärtsgerichtet)

- Die KI extrahiert Ereignisdaten (Bescheiddatum,
  erwähnte Vergangenheitsdaten, Entscheidungen) und
  trägt sie in `wiki/Chronologie.md` ein.
- Nicht-dokumentarische Ereignisse (Telefonate,
  Meetings) werden redaktionell ergänzt, erkennbar
  z.B. am Marker `(redaktionell)`.

#### Fristen (vorwärtsgerichtet)

- Die KI erkennt Fristen (Einspruchsfristen,
  Abgabefristen, Erledigungsfristen) und trägt sie in
  `wiki/Fristen.md` unter `## Offen` ein.
- Jeder Frist-Eintrag verweist per Wikilink auf den
  auslösenden `document`-Knoten und ggf. auf den
  zugehörigen `case`-Knoten.
- Zusätzlich wird in `wiki/Chronologie.md` ein knapper
  Vermerk "Frist gesetzt" mit Datum und Verweis
  angelegt — `wiki/Chronologie.md` bleibt das
  Ereignis-Protokoll, `wiki/Fristen.md` das aktive
  Verzeichnis offener Pflichten.
- Wird eine Frist später als erfüllt oder abgelaufen
  markiert, trägt die KI zusätzlich ein
  entsprechendes Ereignis in `wiki/Chronologie.md`
  ein.

### 2.4 Kriterium "gewichtig"

Ereignisse und Fristen bekommen beim Ingest
**zusätzlich einen Detail-Knoten** (`event` bzw.
`deadline`), wenn sie "gewichtig" sind. Ansprechpartner
bekommen bei Gewichtigkeit einen `person`-Knoten.
**Für Aktenzeichen entfällt die
Entscheidung** — Aktenzeichen haben keinen eigenen
Detail-Knotentyp; ihr Kontext lebt im Metadatenblock
der zugehörigen `case`- oder `document`-Knoten.
**Gewichtige Zielmarken** dürfen einen
`target-mark`-Detail-Knoten bekommen — sie
entstehen nicht beim Ingest, sondern bei der
Planung; die Faustregeln unten gelten sinngemäß.

**Faustregeln** (der Agent entscheidet halb-
automatisch, User bestätigt Aktions-Entwurf am
Ingest-Ende):

- Wird an mehreren Stellen im Wiki referenziert
  (oder wird es voraussichtlich sein).
- Trägt Kontext, der über die Kurzform hinausgeht.
- Backlinks lieferten erkennbaren Nutzen.
- Case-Meilenstein (Einspruch eingelegt, Verhandlung,
  Bescheid ergangen).
- User verlangt es explizit.

Fehlt eines dieser Kriterien, bleibt der Eintrag in
der Fassade eine Zeile.

### 2.5 Kategorisierung der Register

Grundregel der Verortung: **wiki/ = Wissen;
Root/output/overview/ = Session-Artefakte.** Jedes
Register des Projekts fällt in eine der folgenden
Kategorien; die Fassaden- und Register-Köpfe
verweisen auf diese Kategorisierung:

- **(a) Fassade + Detail-Knoten im wiki/** — die
  Fassade indexiert eigenständige Detail-Knoten
  (z.B. Eingangsdokumente, Entscheidungen, Ideen,
  Agent-Berichte, Rechercheartefakte, Fristen —
  soweit Detail-Knoten existieren).
- **(b) Inline-Fassade im wiki/** — die Fassade
  verwaltet ihre Inhalte inline, ohne Detail-Knoten
  (z.B. Chronologie, Facts, Ansprechpartner,
  Knotentypen).
- **(c) Inline-Register im Root** — Session-
  Artefakte, keine Wissens-Sicht (z.B. TODO.md,
  `Offene Fragen.md`, Tools.md, `index-output.md`,
  `index-overview.md`).

## 3. Knotentypen

### 3.0 Katalog: wiki/Knotentypen.md ist kanonisch

**Die tatsächlich verwendeten Knotentypen des
Projekts liegen in `wiki/Knotentypen.md`** (Singleton
mit Typ `types`). Diese Datei kommt vorausgefüllt
mit dem Standardkatalog des Templates und kann
jederzeit erweitert werden — **Erweiterung ist das
erwartete Default-Verhalten**, wann immer ein neues
Wissensobjekt keinem bisherigen Typ entspricht (siehe
§3.5).

Wiki.md §3 beschreibt die **konzeptionelle Struktur**
der Kern-Detail-Typen (Zweck, Rolle in der Wiki-
Mechanik, Entstehungsregeln), weil sie eng mit
Ingest, Fassaden-Mechanik und Snapshots verzahnt
sind. **Pflichtfelder, Enum-Werte und Beispielnamen
werden nicht in Wiki.md dupliziert** — sie stehen
ausschließlich in `wiki/Knotentypen.md`.

Bei Konflikten gilt: `wiki/Knotentypen.md` ist die
kanonische Quelle für das konkrete Projekt.

### 3.0a Terminologie-Konventionen

- **Sprach-Default englisch:** Typ- und Feld-Namen
  sind englisch (`person`, `event`, `decision`,
  `document_type`, `research-artifact`, …).
  Deutsche Ausnahmen nur, wenn kein sinnvolles
  englisches Äquivalent besteht. Fassaden-Dateinamen
  bleiben deutsch (`wiki/Entscheidungen.md` für den
  Typ `decision-log`).
- **Enum-Feld-Namen** folgen dem Muster
  `<typ>_type:` (`document_type`,
  `organization_type`) — siehe §3.4.
- **`subtype:` ist obsolet** und wird nicht mehr
  verwendet; an seine Stelle treten Enum-Felder und
  Vererbung (§3.4).

### 3.1 Übersicht

Der Katalog ist in folgende Kategorien organisiert:

| Kategorie | Rolle |
|---|---|
| **Fassaden (Singletons)** | Übersichts-Knoten für Themenkomplexe — §3a. Standard-Kandidaten in `wiki/Knotentypen.md`. |
| **Kern-Detail-Typen** | Zentrale Detail-Knoten: `document`, Basis-Entities (`person`, `place`, `organization`, `thing`), `concept`, `event`, `deadline`, `idea`, `decision`, `agent-report`, `research-artifact`, `internal-*` — §3.2. |
| **Relations-Typen** | Verknüpfen bestehende Knoten mit Zweck/Attributen, ohne eigenständigen Objekt-Charakter (z.B. `member`) — §3.2a. |
| **Domänen-Detail-Typen** | Domänen- bzw. prozess-spezifisch — §3.3. |

Konkrete Typen, Pflichtfelder und Enum-Werte: siehe
`wiki/Knotentypen.md`. Für neue Typen: §3.5.

### 3.2 Kern-Detail-Typen (konzeptionell)

Die folgenden Kern-Detail-Typen sind so eng mit
der Wiki-Mechanik verzahnt (Ingest, Fassaden,
Snapshots), dass ihre Semantik hier beschrieben ist.
Pflichtfelder und weitere Detail-Angaben stehen in
`wiki/Knotentypen.md`.

#### document

Ein Wiki-Knoten pro eigenständig zitierbarem
Eingangsdokument. **Entsteht beim Ingest** (§2.1).
Trägt Volltext, Metadatenblock, Kurzzusammenfassung
und Cross-References. Provenienz-Frontmatter
(`source_text`, `ingested_at` etc.) verweist auf
`input/`.

#### person / place / organization / thing (Basis-Entities)

Person, Ort, Organisation oder physisches Ding, auf
die Dokumente Bezug nehmen. Halten Stammdaten und
Rollen; `organization` trägt das Enum-Feld
`organization_type:` und optional
`parent_organization:` (Unterorganisationen
rekursiv). **KI erkennt beim Ingest Entitäten und
legt Knoten an oder ergänzt bestehende**
([[Do-first-mit-Veto]]). User kann redaktionell
ergänzen. Indexierende Fassaden: [[Personen]],
[[Orte]], [[Organisationen]], [[Dinge]].

#### concept

Fachbegriff, Norm, Prinzip oder technisches Konzept.
Dient der Begriffsklärung und als Anker für
Cross-References. **Redaktionell** — die KI darf
Kandidaten als Aktions-Entwurf am Ingest-Ende
vorlegen, legt Concept-Knoten aber nicht ohne
User-Zustimmung an. Concepts sind explizite
Begriffsklärungen — deshalb strenger als andere
Typen.

#### event

Für **gewichtige Ereignisse** aus dem Chronologie-
Hybrid (§2.3, §2.4). Ereignisse, die genug Kontext
haben, um als eigener Detail-Knoten zu leben
(mehrere Beteiligte, Case-Meilenstein, mehrfach
zitiert). **Entsteht halb-automatisch beim Ingest**
bei "gewichtigen" Ereignissen (Aktions-Entwurf) oder
redaktionell auf User-Anweisung. Namensmarker
`Ereignis` verhindert Kollision mit `document`.

#### deadline

Für **gewichtige Fristen** aus dem Fristen-Hybrid
(§2.3, §2.4). **Kanonizität:** Der Detail-Knoten
trägt `status` standalone-lesbar; die Fassade
`wiki/Fristen.md` ist kanonisch (§1.1a). Statuswechsel
werden im Rahmen von §10a beidseitig gehalten.
Namensmarker `Frist` verhindert Kollision.

#### idea

Für **unverbindliche Ideen** aus der Ideen-Fassade.
Detail-Knoten Pflicht, sobald Optionen,
Trade-offs oder Voraussetzungen ausformuliert werden.
Register-Felder im Frontmatter (`id`, `status`,
`status_date`, ggf. `trigger` — Datum oder
Zielmarken-Bezeichnung —, `zielmarke`,
`superseded_by`) analog
zu den Register-Typen (Basis: `decision`; SP-1:
`requirement`, `bug-report`). **Kanonizität:** Die Fassade
`wiki/Ideen.md` ist kanonisch für den Status (§1.1a).

#### decision

Für **Design- und Prozess-Entscheidungen** aus der
Entscheidungen-Fassade.
Detail-Knoten Pflicht, sobald verworfene Alternativen,
Vermerke, Nachweise oder ausführliche Wahl-Begründung
anfallen. Register-Felder im Frontmatter (`id`, `status`,
`status_date`, ggf. `superseded-by`) analog zu den
anderen Register-Typen. **Kanonizität:** Die Fassade
`wiki/Entscheidungen.md` ist kanonisch für den Status
(§1.1a). Für DEC-Einträge gelten
Unveränderlichkeits-Regeln (Inhalt eingefroren ab
Status `angenommen`, Ablösung nur vollständig und
unter neuer Nummer) — führender Ort ist der Katalog
`wiki/Knotentypen.md`, Betriebs-Detail die `## Meta`
der Fassade [[Entscheidungen]].

#### agent-report

Zitierfähiger **Bericht eines Sub-Agenten** (interne
Analyse, Prüfung, Ausführung). Entsteht als
Standardaufgabe nach Sub-Agent-Rückkehr: Bericht
unverändert übernehmen, Register-Eintrag in der
Fassade [[Agent-Berichte]] (Präfix `REP-`).

#### research-artifact

Ergebnis einer **externen Recherche** als
zitierfähiger Nachweis — extern beschafftes Wissen
ist Nachweis, nicht Wahrheit; Übernahme ins Projekt
ist Anwender-Entscheidung. Entsteht nach
Recherche-Abschluss; Register-Eintrag in der Fassade
[[Rechercheartefakte]] (Präfix `REC-`).

#### internal-concept / internal-procedure / internal-pattern / internal-rule

**Steuerungs-Wissen des Projekt-Systems** —
Konzept-Erklärung, Handlungs-Prozedur,
wiederkehrendes Design-Muster, verbindliche einzelne
Konvention. Der `internal-`-Präfix grenzt ab von
`concept` (Anwender-Fachbegriffe). Indexierende
Fassade: [[InterneMechanik]].

### 3.2a Relations-Typen

Ein Relations-Typ **verknüpft zwei (oder mehr)
Knoten** mit einem Zweck bzw. spezifischen
Attributen; er hat keinen eigenständigen
Objekt-Charakter (im Gegensatz zu Entitäten wie
Person, Organisation, Ort). Realisierung je nach
Komplexität und Attribut-Umfang: **inline in einer
Fassade** (Kategorie b nach §2.5 — Beispiel
[[Ansprechpartner]]) oder als **Detail-Knoten mit
Frontmatter** (Kategorie a — Beispiel `member`,
Fassade [[Mitgliedschaften]]). Der Katalog führt
Relations als eigene Kategorie; die Regel aus §3.5
gilt sinngemäß — jeder Relations-Typ braucht eine
indexierende Sicht.

### 3.3 Domänen-Detail-Typen

Der Basis-Katalog führt als Domänen-Bestand die
Rechtsfall-Typen `case` und `argument` (bis zur
Ausarbeitung des zugehörigen Prozesses in der Basis
belassen, ohne indexierende Fassade).
**Prozess-spezifische Typen** kommen über die
Prozess-Anhänge (`Knotentypen-Anhang-<Prozess>.md`)
beim Merge in den Katalog (§11.3) — z.B.
`requirement` und `bug-report` mit SP-1,
`user-story` und `use-case` mit RP-1; `decision`
liegt bereits in der Basis (§3.2).

Details (Zweck, Pflichtfelder, Beispielnamen) stehen
in `wiki/Knotentypen.md`. Ein Projekt nutzt in der
Regel nur eine Teilmenge; nicht genutzte Typen
bleiben unbelegt und erscheinen nicht im Wiki-Index.

### 3.4 Vererbung und Enum-Felder

Ein `subtype:`-Feld gibt es nicht — Präzisierung
eines Typs läuft über folgende Mechanismen:

- **Enum-Feld `<typ>_type:`** — für Klassifikation
  ohne zusätzliche Pflichtfelder, wenn alle
  Instanzen dieselbe Feld-Struktur tragen (z.B.
  `document_type: bescheid`,
  `organization_type: company`). Die Enum-Werte
  stehen im Katalog und sind erweiterbar.
- **Vererbung `extends:`** — ein Katalog-Eintrag
  benennt mit `extends: <eltern-typ>` einen
  einzelnen Eltern-Typ (Einzel-Vererbung): der
  Kind-Typ erbt alle Pflicht- und Kann-Felder,
  ergänzt eigene Felder und überschreibt keine
  geerbten. Vererbungs-Zyklen im Katalog sind
  verboten. Beim Anlegen einer Instanz prüft der
  Agent den Katalog-Eintrag des Typs und — bei
  `extends:` — auch den Eltern-Eintrag (dessen
  Pflichtfelder kommen in die Prüfliste). Beim
  Prozess-Merge werden Vererbungs-Ketten
  Basis-zuerst aufgelöst: `extends:` zeigt auf
  einen Typ, der zum Merge-Zeitpunkt bereits im
  Katalog vorhanden ist (§11.3).

**Anwendungsregel:** Enum-Feld bei Klassifikation
ohne Feld-Änderung; Vererbung bei echter
semantischer Spezialisierung mit zusätzlichen
Feldern.

### 3.5 Neue Typen anlegen (Default-Verhalten)

**Es ist erwartetes Default-Verhalten**, dass der
Katalog in `wiki/Knotentypen.md` im Projektverlauf
wächst. Wenn ein Wissensobjekt auftaucht, das
keinem der bisherigen Typen entspricht:

1. Neuen Typ in `wiki/Knotentypen.md` definieren
   (Name, Zweck, Pflichtfelder, Beispielname).
2. Bei Detail-Typen (Kategorie a nach §2.5):
   indexierende Fassade anlegen — oder eine
   bestehende Fassade explizit als indexierend
   zuweisen. Die Struktur-Konventionen der
   Detail-Knoten stehen in der `## Meta`-Sektion
   dieser Fassade.
3. Die Fassade in `wiki/index.md` (Meta-Header)
   bzw. in der FassadenLandkarte `wiki/Fassaden.md`
   verankern.
4. Erste Instanz mit Frontmatter `type: <typ>`
   anlegen.

Fassaden-Typen (Singletons, Kategorie b) brauchen
selbst keine indexierende Fassade — sie **sind**
die Fassade.

Der Agent darf neue Typen vorschlagen (Aktions-
Entwurf), legt sie aber nicht ohne User-Bestätigung
an — neue Typen sind projektstrukturelle
Entscheidungen.

Die KI liest `wiki/Knotentypen.md` beim Sessionstart
(registrieren) und konsultiert sie bei jeder neuen
Knoten-Anlage.

**Ungenutzte Typen:** Die Domänen-Gruppierung im
Katalog ist reine **Sortierhilfe** — es gibt
**keinen expliziten Domänen-Aktivierungs-Schritt**.
Ein Typ wird faktisch aktiv durch **erste
Verwendung** in einem Wiki-Knoten. Ungenutzte Typen
bleiben dormant im Katalog: sie erscheinen nicht in
`wiki/index.md`, der Agent instanziiert sie nur,
wenn ein Wissensobjekt explizit passt oder der User
es verlangt.

Wenn ein Projekt den Katalog reduzieren möchte
(z.B. nur Rechtsfall-Typen behalten), kann der User
`wiki/Knotentypen.md` direkt bearbeiten — der Agent
respektiert die reduzierte Liste beim nächsten
Sessionstart.

### 3.6 Abgrenzungen

Diese Typen sind **bewusst kein** eigener Wiki-
Knotentyp:

- **`analysis`** — versionierte Analysen bleiben in
  `overview/` (mit `_VV_TLA`).
- **`summary`** — jeder Knoten hat ohnehin eine
  Kurzzusammenfassung.

## 3a. Fassaden-Knoten (Singleton-Typen)

Fassaden sind Übersichts-Knoten mit **eigenem
Typ pro Fassade**. Sie existieren höchstens einmal
pro Projekt (Singleton). Die Tabelle ist eine
Kurz-Übersicht — **jede Fassade stellt sich selbst
vor**: ihre Betriebs-Semantik (Format, Pflege,
Kanonizität) steht in ihrer eigenen
`## Meta`-Sektion (Zweiklang: Übersicht hier,
Vollversion in der Fassade). Die Zeilen-Reihenfolge
dieser Tabelle ist Katalog-Gruppierung ohne
Ordnungs-Anspruch — die Anzeige- und
Anlage-Reihenfolge der Fassaden regeln §6.1 und die
FassadenLandkarte [[Fassaden]].

| Typ | Datei | Zweck |
|---|---|---|
| `mission` | `wiki/Mission Statement.md` | Projekt-Überblick (Kurzform) |
| `mission-long` | `wiki/Mission Statement Long.md` | Projekt-Überblick (Langform) |
| `facts` | `wiki/Facts.md` | Projekteinstieg, Anwender-Fakten, Stolpersteine |
| `types` | `wiki/Knotentypen.md` | Kanonischer Typen-Katalog |
| `facade-registry` | `wiki/Fassaden.md` | FassadenLandkarte — Register aller Fassaden mit Status |
| `internal-machinery-log` | `wiki/InterneMechanik.md` | Steuerungs-Wissen des Projekts (`internal-*`-Knoten) |
| `timeline` | `wiki/Chronologie.md` | Zeitachse: was ist wann passiert |
| `deadline-log` | `wiki/Fristen.md` | Fälligkeitsübersicht (Offen/Erledigt/Abgelaufen) |
| `file-number-log` | `wiki/Aktenzeichen.md` | Register aller Aktenzeichen im Projekt |
| `contact-log` | `wiki/Ansprechpartner.md` | Wer ist wofür zuständig (Relations-Register) |
| `glossary` | `wiki/Glossar.md` | Freigegebene Terminologie |
| `glossary-review` | `wiki/Glossar Review.md` | Glossar-Vorschläge in Bearbeitung |
| `concept-log` | `wiki/Konzepte.md` | Register der Sach-Wissens-Anker (`concept`-Knoten); Sprach-Ebene regelt das Glossar |
| `target-mark-log` | `wiki/Zielmarken.md` | Register der Zielmarken (Planungs-Horizonte) mit Zeigern `current`/`in-progress` |
| `idea-log` | `wiki/Ideen.md` | Register unverbindlicher Ideen |
| `decision-log` | `wiki/Entscheidungen.md` | Register aller Entscheidungen (universeller Mechanismus) |
| `input-document-log` | `wiki/Eingangsdokumente.md` | Register aller Eingangsdokumente |
| `agent-report-log` | `wiki/Agent-Berichte.md` | Register aller Sub-Agent-Berichte |
| `research-artifact-log` | `wiki/Rechercheartefakte.md` | Register aller Rechercheartefakte (Nachweis, nicht Wahrheit) |
| `person-log` | `wiki/Personen.md` | Register aller `person`-Knoten |
| `place-log` | `wiki/Orte.md` | Register aller `place`-Knoten |
| `organization-log` | `wiki/Organisationen.md` | Register aller `organization`-Knoten |
| `thing-log` | `wiki/Dinge.md` | Register aller `thing`-Knoten |
| `member-log` | `wiki/Mitgliedschaften.md` | Relations-Register Person↔Organisation |

**mandatory vs. optional beim Init:**

- **mandatory** (nicht abwählbar, beim Init
  automatisch aktiv): `facts`, `types`,
  `facade-registry`, `internal-machinery-log`.
- **optional**: alle anderen — Anwender-Ja/Nein mit
  Voreinstellung (MasterPrompt §5.3 Phase D).
  Basis-Vorauswahl „aktiv": Mission Statement,
  Chronologie, Fristen, Aktenzeichen,
  Ansprechpartner, Ideen, Entscheidungen, Glossar,
  Glossar Review, Konzepte, Zielmarken,
  Eingangsdokumente,
  Agent-Berichte, Rechercheartefakte, Personen,
  Organisationen.
  Basis-Vorauswahl „deaktiviert": Mission Statement
  Long, Orte, Dinge, Mitgliedschaften.
- **Regel-Analog für Prozess-Steckbriefe:** die
  `§ Mitgebrachte Fassaden`-Sektion des Steckbriefs
  regelt mandatory/optional für die vom Prozess
  mitgebrachten Fassaden (§11.3).
- **Prozess-Fassaden.** Fassaden können auch von
  Prozessen mitgebracht werden (§11 Prozess-Teil-Wikis).
  Sie erscheinen im Anwender-`wiki/` nach dem
  Prozess-Merge und werden dort behandelt wie
  Basis-Fassaden (§3a-Regeln gelten). Konkrete
  Prozess-Fassaden siehe jeweiliger Prozess-Steckbrief.

**MetaFassade:** [[Fassaden]] ist das Register der
Fassaden — ihre „Detail-Elemente" sind andere
Fassaden. Komplementäre Meta-Register:
[[Knotentypen]] (Struktur), [[Fassaden]]
(Projekt-Ist), [[InterneMechanik]] (Steuerung),
[[Facts]] (Anwender-Fakten).

**Aktivierung / Deaktivierung:**

Alle Fassaden-Skelette liegen physisch im
Anwender-`wiki/` (Voll-Kopie-Modell). Der
Aktivierungs-Status lebt **führend in der
FassadenLandkarte `wiki/Fassaden.md`**; das
Frontmatter-Feld `active:` der jeweiligen Fassade
wird synchron gehalten. Deaktivierung markiert
Frontmatter (`active: false`), Kopf-Marker-Text in
der Fassade und den Landkarten-Status — die Datei
bleibt physisch vorhanden.

```yaml
---
type: timeline
active: false     # deaktiviert; führend: wiki/Fassaden.md
---
```

Deaktivierte Fassaden werden weder beim Sessionstart
gelesen noch beim Ingest gepflegt; reaktivierbar
sind sie jederzeit über die Landkarte. Bei
Schreib-Zugriff auf eine deaktivierte Fassade gilt:
Schreiben erlaubt, keine automatische Reaktivierung,
keine Warnung. Drift zwischen Landkarten-Status und
`active:`-Frontmatter meldet der Lint; ein
Sessionstart-Wächter kann die Synchronität
zusätzlich prüfen (KANN).

**Deaktivierungs-Grenzen für mandatory-Fassaden:**
Die vier Basis-mandatory-Fassaden (`facts`, `types`,
`facade-registry`, `internal-machinery-log`) sind
Pflicht-Fassaden und können **nie** deaktiviert
werden — ihre Skelette tragen `active: true` mit
einem entsprechenden Kommentar; setzt der User
`active: false`, ignoriert der Agent das und weist
auf die Regel hin. **Übrige mandatory-Fassaden**
(von Prozessen als mandatory mitgebracht) sind im
Init nicht abwählbar; deaktivieren lassen sie sich
später nur auf ausdrückliche Anweisung des Users —
der Agent weist auf die Folgen hin und führt dann
aus.

**Reaktivierung** („reaktiviere X"): läuft wie die
Aktivierung beim Merge — die Ja/Nein-Frage entfällt
(die Anweisung ist die Entscheidung). Der Agent
setzt `active: true`, liest die Bootstrap-Datei der
Fassade aus der Template-Quelle
(`referenzprozesse/<P>/bootstrap/<Fassade>.md`,
DEC-217; Modus A: mitkopierter bootstrap/-Ordner),
arbeitet sie ab und führt den Landkarten-Status
nach.

**Fassaden-Promotion** („wenn etwas häufig
vorkommt, könnte eine Fassade daraus werden"):
Erkennt der Agent eine Serie gleichartigen Wissens
ohne Register-Fassade — typisch beim Ingest (schon
wieder ein gleichartiger Detail-Knoten; zum
wiederholten Mal dieselbe Sammel-Sektion gefüllt)
oder als Wächter-Beobachtung (MasterPrompt §5.3
C7) —, bietet er die **Promotion** an: sobald eine
Serie erkennbar ist und weitere Einträge absehbar
sind. Das Angebot ist ein **Aktions-Entwurf**
(Struktur-Definition — nie Do-first): Kandidaten-
Name, beobachtetes Muster mit Belegen, Vorschlag
Kategorie a oder b, ggf. neuer Typ — und immer die
Gegen-Option „inline in einer bestehenden Fassade
weiterführen" (die Empfehlung ist konservativ, eine
Fassade muss sich verdienen). **Bei Ja** in einem
Zug: Eintrag im Entscheidungs-Register (Typ +
Fassade), Fassaden-Datei mit `## Meta` und
Eintragsformat, Landkarten-Eintrag in [[Fassaden]],
Katalog-Block unter „Projektspezifische
Erweiterungen" in [[Knotentypen]], Bestands-Knoten
einsortieren. **Bei Nein oder Später:** Ideen-
Eintrag „Fassaden-Kandidat <X>, vertagt" — je
Muster nur ein Angebot, Wiedervorlage über das
Ideen-Register. **Rückweg:** eine fehlgepromotete
Fassade wird deaktiviert; Einschmelzen der Einträge
nur auf ausdrückliche Anweisung.

**Betriebs-Regeln pro Fassade** stehen in der
jeweiligen Fassade (`## Meta`); übergreifende
Mechanik in diesem Dokument: Ingest-Pflege §2.3,
Kriterium "gewichtig" §2.4, Frist-Lebenszyklus §10a,
Glossar-Review-Prozess §3a.1.

### 3a.1 Glossar-Review-Prozess

Der Glossar ist die einzige Fassade mit expliziter
**Review-Zwischenstufe**. Der Agent darf Vorschläge
machen; sie landen aber nicht direkt in
`wiki/Glossar.md`, sondern in
`wiki/Glossar Review.md`.

**Format eines Glossar-Eintrags** (Beispiel):

```markdown
### Grundsteuerwertbescheid

**English:** property tax valuation notice
**Freigabe:**
**Kommentar:**
**Rückmeldung AIG:**

Bescheid des Finanzamts, mit dem der Grundsteuerwert
einer wirtschaftlichen Einheit festgestellt wird.
Grundlage für die Berechnung der Grundsteuer nach
neuem Recht.

**Verankert in:** [[2025-03-11 Grundsteuerwertbescheid Flst 136 Muehlgaessle]]
**Siehe auch:** [[Grundsteuerwert]]
```

**Feld-Semantiken:**

- `Rückmeldung AIG:` — Dialog-Feld. Agent trägt hier
  ein als Antwort auf User-Kommentare (Umsetzung
  oder Rückfrage). Bei User-Erst-Vorschlag ohne
  AIG-Beteiligung leer.
- `Kommentar:` — User-Anmerkung, Änderungswunsch,
  Frage.
- `Freigabe:` — User-Entscheidung final
  (`<Datum> <TLA>`).

**Prozess:**

1. Vorschlag (Agent oder User) in
   `wiki/Glossar Review.md` unter `## In Bearbeitung`.
2. Iterativer Dialog: User → `Kommentar:` → Agent →
   `Rückmeldung AIG:` → …
3. Bei Zufriedenheit: User setzt
   `Freigabe: <Datum> <TLA>`.
4. Agent verschiebt **nur die inhaltlichen Felder**
   (English, Definition-Text, Verankert in, Siehe
   auch) nach `wiki/Glossar.md`.
5. Der komplette Trail bleibt in
   `wiki/Glossar Review.md` unter
   `## Freigegeben (Audit-Trail)`.

`wiki/Glossar.md` bleibt clean — nur inhaltliche
Felder, keine Prozess-Felder.

**Duplizierung akzeptiert:** Wenn ein Glossar-Eintrag
und ein Concept-Knoten (§3.2) für denselben Begriff
existieren, ist die Definition in beiden — auf
unterschiedlicher Ebene (Glossar: lexikalische
Kurzfassung + Terminologie; Concept: erweiterte
Definition + Kontext + Backlinks). Drift wird
bewusst in Kauf genommen.

### 3a.2 Mission-Statement-Setup-Dialog

Mission Statement (Kurzform) und Mission Statement
Long haben einen definierten Setup-Dialog, weil sie
projektstrukturelle Basis-Kommunikation nach außen
sind — kein reines Ingest-Nebenprodukt.

**Kurzform (`wiki/Mission Statement.md`):**

1. **Nach Abschluss des sonstigen Setups** (Facts,
   Knotentypen, Fassaden-Auswahl, ggf. erste Ingest-
   Runde) fragt der Agent **aktiv**, was ins Mission
   Statement soll.
2. Der Agent **schlägt ggf. gleich einen Entwurf
   vor** — basierend auf Projekt-Identifikation aus
   der Instruktionsdatei, Facts §Projekteinstieg
   und den ersten ingestierten Dokumenten.
3. **Entwurf wird zur Freigabe vorgelegt.** User
   bestätigt, korrigiert oder ergänzt.
4. **Fallback:** Wenn der User keinen Vorschlag
   möchte, bleibt Mission Statement minimalistisch —
   nur Projektname + Zweck aus Facts
   §Projekteinstieg übernehmen.

**Langform (`wiki/Mission Statement Long.md`):**
Deaktiviert per Default (§3a). Wird nur auf explizite
User-Anweisung aktiviert. **Sobald aktiviert, gilt
derselbe Setup-Dialog** wie für die Kurzform (aktiv
fragen, Entwurf vorschlagen, Freigabe, Fallback) —
mit erweitertem Umfang.

Der Sessionstart Phase D (MasterPrompt §5.3) triggert
diesen Dialog beim Init; siehe dort für den Kontext
im Gesamtablauf.

## 4. Wiki-Knoten: Aufbau

### 4.1 Frontmatter

```yaml
---
type: document
document_type: bescheid
source_text: input/raw/scan_2025_03.md
source_original: raw/scan_2025_03.pdf
pages: 4-6
ingested_at: 2026-04-17
---
```

Feldregeln:

- **type:** einer der Knotentypen aus §3.
- **document_type:** bei `document` Pflicht —
  Enum-Wert aus `wiki/Knotentypen.md` (§3.4).
- **source_text:** bei `document` immer vorhanden;
  Pfad zur `input/`-Datei.
- **source_original:** bei `document` mit Scan-Quelle
  `raw/<datei>.pdf`; bei docsources-Quellen externer
  Pfad oder weggelassen.
- **pages:** nur bei Sammeldokumenten
  (`document`-Knoten, die Ausschnitte eines größeren
  Eingangsdokuments sind).
- **ingested_at:** Datum des Ingests (`YYYY-MM-DD`).
- **supersedes:** optional. Bei Wiki-Elementen aus einem
  Prozess-Teil-Wiki (§11) — **Katalog-Name (String)** des
  abgelösten Elements aus einem Basis-Prozess. Löst die
  Aktivitäts-Regel „nur hochwertigste aktiv" aus (§11.4).

Weitere Felder sind je Knotentyp zulässig (z.B.
`status` bei `case`, `case:`/`source:` bei `event`/
`deadline`, `parent:` bei hierarchischen Beziehungen).

**Frontmatter-Verweise auf andere Wiki-Knoten:
String-Notation Pflicht.** Alle Frontmatter-Felder, die
auf einen anderen Wiki-Knoten verweisen (`supersedes:`,
`case:`, `source:`, `parent:`, `refers-to:` etc.),
tragen den Wert als **schlichten String** (kanonisch-
eindeutiger Slug oder Anzeigename) — keine Wikilink-
Notation `[[…]]` im YAML-Block. Grund: YAML-Parser
behandeln `[[…]]` uneinheitlich (teils als
verschachtelte Liste, teils als Fehler); Wikilinks
funktionieren im Frontmatter nicht klickbar; und ein
einheitliches Frontmatter-Format erleichtert
automatisierte Verarbeitung. Wikilink-Verweise gehören
in Fließtext oder `## Bezüge` — dort werden sie als
klickbare Links gerendert.

### 4.2 Inhaltsstruktur

Grundmuster pro Detail-Knoten, in dieser Reihenfolge:

1. **Frontmatter** (§4.1)
2. **Volltext** (bei `document`) oder
   **Definition/Beschreibung** (bei `person`,
   `organization`, `concept`, …)
3. **Metadaten-Block** (bei `document`, siehe §4.3)
4. **Kurzzusammenfassung** (§4.4)
5. **`## Bezüge`** — Cross-Reference-Abschnitt (§8.3)

**Typ-spezifische Ausprägungen:**

- **document:** Volltext → Metadaten-Block →
  Kurzzusammenfassung → `## Bezüge`.
- **person / place / organization / thing:**
  Kurzbeschreibung → Stammdaten
  (je nach Typ: Adresse, Kontakt, Aktenzeichen,
  Rolle) → `## Bezüge`.
- **concept:** Definition (knapp) → Kontext/
  Anwendung → Bezüge zu Grundlagen → `## Bezüge`.
- **event:** Kontext → Beteiligte (Cross-References)
  → Ausschnitt aus Ursprungsdokument → `## Bezüge`.
- **deadline:** Was ist zu tun → Kontext →
  Teilschritte → Historie → `## Bezüge`.
- **case:** Gegenstand und Parteien → Status
  (aus `status:` im Frontmatter) → Fristen
  (Verweise auf `wiki/Fristen.md`) → chronologische
  Liste zugehöriger Documents → Status-Log →
  offene Punkte → `## Bezüge`.
- **argument:** Kernthese → Begründung → Belege
  (Cross-References) → Gegenargumente → Einsatzorte
  (Verweise auf `output/` oder Cases) →
  `## Bezüge`.

Für weitere Typen (prozess-mitgebrachte wie
`requirement`, `user-story`, `use-case` sowie
projektspezifische Erweiterungen) gilt das
Grundmuster analog:

1. Frontmatter
2. Kerninhalt (je nach Typ)
3. kontextuelle Abschnitte
4. `## Bezüge`

Konkrete Struktur-Konventionen je Typ stehen in der
`## Meta`-Sektion der jeweils indexierenden Fassade
(§3.5) bzw. im Katalog `wiki/Knotentypen.md`.

**Pflicht vs. Kann:**

- Pflicht (jeder Knoten): Frontmatter mit
  Pflichtfeldern (§4.1), Kern-Inhalt je nach Typ,
  **Kurzform an funktional passender Stelle**, und
  `## Bezüge`-Abschnitt (kann leer sein, aber
  Überschrift ist Pflicht).
- **Kurzform** heißt typ-spezifisch:
  - `document`: 4–8-Sätze-Kurzzusammenfassung
    (§4.4).
  - `person`, `place`, `organization`, `thing`:
    1–3-Sätze-Kurzbeschreibung ("was ist diese
    Entity").
  - `concept`: knappe Definition (1–2 Sätze).
  - `event`, `deadline`: knapper Kontext-Absatz.
  - `case`, `argument` und weitere Typen: an
    funktional gleichwertiger Stelle (Gegenstand,
    Kernthese o.ä.).
- Kann: weitere Unterabschnitte, Anhänge
  (Originalzitate in Blockquotes).

**Stilfragen** (Formulierungs-Konventionen,
Verwendungsdichte von Wikilinks, Kurzzusammenfassungs-
Länge, Datumsformate) regelt `Styleguide-wiki.md`.

### 4.3 Metadaten-Block (document)

```markdown
- **Dokumenttyp:** Grundsteuermessbescheid
- **Datum:** 11.03.2025
- **Absender:** Finanzamt Mittelbach
- **Empfänger:** Tina Reiherbach und Alexander Reiherbach
- **Aktenzeichen (Mess):** 12/345/6/00078/0000/9
- **Flurstück:** Flst 92, Amselweg 7, 62318 Mittelbach,
  Gemarkung Mittelbach
- **Grundsteuermessbetrag:** 38,71 €
- **Zurechnung:** Tina Reiherbach 1/2,
  Alexander Reiherbach 1/2
```

Felder, die nicht zutreffen, werden weggelassen
(keine `k.A.`- oder `—`-Einträge).

### 4.4 Kurzzusammenfassung

4–8 Sätze in Fließtext, ohne eigene Überschrift. Soll
den wesentlichen Inhalt so wiedergeben, dass man das
Dokument nicht öffnen muss, um zu verstehen, worum es
geht und was verfügt oder mitgeteilt wird.

## 5. Namenskonvention für Wiki-Knoten

### 5.1 Grundsatz: Obsidian-Stil

Wiki-Knoten folgen dem Obsidian-Stil: **Title Case mit
Leerzeichen**, z.B.:

- `Finanzamt Mittelbach.md`
- `Tina Reiherbach.md`
- `Flst 92 Amselweg 7.md`

Das ergibt lesbare Wikilinks wie
`[[Finanzamt Mittelbach]]`.

### 5.2 Dokumentenknoten

```
<Datum> <Dokumentname> <Gegenstand>.md
```

- **Datum** vorn (`YYYY-MM-DD`), damit das Datei-
  Listing chronologisch sortiert.
- **Absender und Empfänger** stehen im Frontmatter,
  nicht im Dateinamen — sie sind ohnehin über
  Entity-Knoten abrufbar.

Beispiele:

- `2025-03-11 Grundsteuerwertbescheid Flst 136 Muehlgaessle.md`
- `2025-04-15 Einspruch Grundsteuer 2025.md`

### 5.2a Massen-Ingest und Kollisionen

**Massen-Ingest mit deklariertem Namensraum:**
Erkennt der Agent eine Serie gleichartiger
Eingangsdokumente aus einer Quelle (Kontoauszüge,
Messprotokolle, Rechnungs-Läufe), bietet er **vor**
dem Ingest einen **technischen Namensraum** an — ein
deklariertes Muster wie
`<Präfix> <ISO-Datum> <Kennung>.md`, das die Serie
eindeutig und sortierbar macht. Die Deklaration ist
eine bewusste Anwender-Entscheidung und wird als
Eintrag im Entscheidungs-Register gebucht;
undeklarierte technische Namen bleiben Abweichung.
Die Serie braucht Fassaden-Deckung (typisch eine
eigene Sektion in [[Eingangsdokumente]]). Sprechende
Namen (§5.1/§5.2) bleiben der Standard für alles
Einzelne.

**Kollisions-Vorschrift** (gilt immer, nicht nur im
Massen-Fall): Bei Namens-Kollision wird **niemals
still auto-suffigiert** (kein `-2`, kein `(1)`).
Stattdessen: (a) existiert ein deklariertes Schema,
disambiguiert es (Datum/Kennung ist Teil des
Namens); (b) sonst Rückfrage mit Namens-Vorschlag.
Im laufenden Massen-Ingest gilt Berichten statt
Blockieren: der Rest der Serie läuft weiter,
Kollisions-Fälle werden gesammelt und als Block
vorgelegt.

### 5.3 Umlaute und Sonderzeichen

Wie im MasterPrompt §3.7 — ö → oe, ä → ae, ü → ue,
ß → ss usw.

### 5.4 Ordnerstruktur

Alle **Wiki-Knoten** liegen **flach in `wiki/`** —
Instanzen der in §3 definierten Typen (Detail-Knoten
und Fassaden). Keine Unterordner nach Knotentyp. Der
Typ steht im Frontmatter. Einzige
Unterordner-Ausnahme: `wiki/templates/` mit
Kopiervorlagen für Root-Setup-Dateien (MasterPrompt
§7.5 und [[Standarddateien-Katalog]] §2.7a/§2.13) —
keine Wiki-Knoten, kein Frontmatter-Typ.

### 5.5 Namensbeständigkeit

Wiki-Knoten-Namen sind **stabil**. Einmal vergeben,
werden sie nicht geändert, sonst brechen
Cross-References. Wenn sich die Zuordnung eines
Knotens grundlegend ändert, wird ein neuer Knoten
angelegt und der alte per Cross-Reference verknüpft
oder als veraltet markiert.

## 6. Wiki-Index (`wiki/index.md`)

### 6.1 Aufbau

Kompakter Katalog im Karpathy-Stil, keine Metadaten-
Duplikate.

Oben im `wiki/index.md` steht ein **Meta-Header** —
kurzer Prosa-Text, der die Wiki-Struktur, die
Lese-Regeln und die Mission-Statement-Behandlung
erklärt (für den Agent-Kontext beim Sessionstart und
für externe Agenten). Der Meta-Header verweist für
den Fassaden-Status auf die FassadenLandkarte
[[Fassaden]] — **der Index führt keine eigenen
Fassaden-Gruppen** (ein führender Ort für den
Fassaden-Status). Der Katalog folgt darunter und
listet die **Detail-Knoten nach Typ**:

1. **Kern-Detail-Typen** in Katalog-Reihenfolge
   (`document`, `person`, `place`, `organization`,
   `thing`, `concept`, `event`, `deadline`,
   `idea`, `decision`, `agent-report`,
   `research-artifact`, `internal-*`)
2. **Relations-Typen** (`member` usw.)
3. **Aktive Domänen- und Prozess-Detail-Typen**
   (`case`, `argument`, prozess-mitgebrachte Typen
   usw. — nur die im Projekt tatsächlich
   verwendeten)

Nicht genutzte Detail-Typen erscheinen nicht.
**Prozess-Detail-Typen erscheinen im Index wie
Basis-Typen**; die zugehörigen Prozess-Fassaden
werden nach dem Merge in der Landkarte unter der
Kategorie `Prozess-mitgebracht (<Prozess>)`
einsortiert.

**Die feste Reihenfolge der Fassaden** ist
Ordnungs-Regel der FassadenLandkarte [[Fassaden]]
(weggelassene erscheinen nicht): Mission Statement,
Mission Statement Long, Facts, Chronologie, Fristen,
Aktenzeichen, Ansprechpartner, Ideen,
Entscheidungen, Glossar, Glossar Review, Konzepte,
Zielmarken, Knotentypen, InterneMechanik, Fassaden,
Eingangsdokumente, Agent-Berichte,
Rechercheartefakte, Personen, Orte, Organisationen,
Dinge, Mitgliedschaften. Reihenfolge-Logik:
Einstieg, Zeit-Achse, Personen-/Ding-Register,
Design-Register, Terminologie, Steuerung/Meta,
Dokument-/Bericht-Register, Entity-Register.

**Innerhalb der Detail-Typen-Gruppen:** alphabetisch
nach Knotennamen. Bei `document`, `event`,
`deadline` entspricht das chronologisch, weil das
Datum vorn steht.

### 6.2 Eintragsformat

Pro Knoten: Wikilink + One-Liner aus der
Kurzzusammenfassung.

```markdown
## document

- **[[2025-03-11 Grundsteuerwertbescheid Flst 136 Muehlgaessle]]** —
  Erstbescheid mit festgestelltem Grundsteuerwert 123.400 €.
- **[[2025-04-15 Einspruch Grundsteuer 2025]]** —
  Einspruch gegen den Grundsteuermessbescheid
  vom 11.03.2025.

## person

- **[[Tina Reiherbach]]** — Miteigentümerin
  Flst 92 Amselweg 7.

## organization

- **[[Finanzamt Mittelbach]]** — zuständiges Finanzamt.
```

### 6.3 Pflege

- Automatisch durch die KI bei jedem neuen oder
  geänderten Knoten.
- User soll den Index nicht selbst editieren (Gefahr
  des Überschreibens beim nächsten Ingest).

## 7. Wiki-Log (`wiki/log.md`)

Append-only System-Log aller Ingest- und Re-Ingest-
Operationen. Greppable.

**Format:**

```markdown
## [2026-04-17] ingest
- document: [[2025-03-11 Grundsteuerwertbescheid Flst 136 Muehlgaessle]]
- source: input/raw/scan_2025_03.md (pages 4-6)

## [2026-04-17] re-ingest
- document: [[2025-04-15 Einspruch Grundsteuer 2025]]
- source: input/raw/einspruch.md
- reason: input/-Datei neuer als ingested_at
```

**Pflege:** voll-automatisch beim Ingest und
Re-Ingest. User editiert `log.md` nicht.

**Abgrenzung zu `wiki/Chronologie.md`:** `wiki/log.md`
ist ein technisches Protokoll, `wiki/Chronologie.md`
ein
inhaltliches Ereigniskalender. Sie dürfen sich
überlappen.

## 8. Cross-References

### 8.1 Was ist eine Cross-Reference

Ein Verweis von einem Wiki-Knoten zu einem anderen,
typischerweise auf eine Entity (`person`,
`organization`, …), ein `concept` oder
ein anderes `document`. Zweck: Navigation,
Graph-Ansicht in Obsidian, automatische Backlinks.

Beispiel im Volltext eines `document`-Knotens:

> Das [[Finanzamt Mittelbach]] stellt mit diesem
> Bescheid den Grundsteuerwert für
> [[Flst 136 Muehlgaessle]] auf 123.400 € fest.
> Empfänger ist [[Doris Vogelsang]].

### 8.2 Format

- **Wiki-interne Verweise:** Wikilinks
  `[[Knotenname]]`. Der Name muss exakt dem Dateinamen
  (ohne `.md`) entsprechen.
- **Verweise nach außen** (auf `output/`, `overview/`,
  externe Dateien): Standard-Markdown-Links
  `[Text](relativer/pfad.md)`.

### 8.3 Platzierung

Pro Knoten an folgenden Stellen:

1. **Inline im Volltext** — an der Stelle der
   Erwähnung.
2. **Dedizierter `## Bezüge`-Abschnitt** am Knotenende
   für explizite Beziehungen ("erwähnt in", "siehe
   auch", "gehört zu").

Beispiel für den Bezüge-Abschnitt:

```markdown
## Bezüge

- Gehört zu Case: [[Einspruch Grundsteuer Flst 136 Muehlgaessle]]
- Erwähnt Entity: [[Finanzamt Mittelbach]], [[Doris Vogelsang]]
- Verweist auf Concept: [[Grundsteuerwert]], [[Bodenrichtwert]]
```

### 8.4 Pflege

**[[Do-first-mit-Veto]]**, analog zur Chronologie-
Pflege (§2.3):

- Beim Ingest erkennt die KI in dem neuen Knoten
  erwähnte Entities und Concepts und **setzt
  Wikilinks direkt** ein.
- Der User kann per Veto rückgängig machen.
- Redaktionelle Nachpflege durch User oder KI
  jederzeit möglich.
- Standardaufgabe nach MasterPrompt §5.1.2.

### 8.5 Rückverweise (Backlinks)

Wikilinks sind gerichtet. Obsidian erzeugt Backlinks
dynamisch; außerhalb sind sie nicht direkt sichtbar.

Regel:

- **Explizite Rückverweise** stehen redaktionell im
  Bezüge-Abschnitt des Zielknotens.
- **Fehlende explizite Rückverweise** werden vom Lint
  erkannt und als Vorschlag vorgelegt (§9).

### 8.6 Entscheidungs-Verweise (Inlining-Regel)

Stützt sich ein Wiki-Knoten oder Dokument auf eine
Entscheidung, stehen **Aussage und Begründung inline
im Text**; der Register-Verweis ist Wartungsvermerk,
nie Verständnisvoraussetzung.

## 9. Lint

### 9.1 Prüfungen

- **Verwaiste Knoten** — keine eingehenden Wikilinks.
- **Fehlende Frontmatter-Pflichtfelder** gemäß
  Knotentyp.
- **Fehlende Einträge in `wiki/index.md`.**
- **Ungültige Wikilinks** — Zielknoten existiert nicht.
- **Nicht-verlinkte Erwähnungen** — Text enthält
  einen Knotennamen ohne Wikilink (fuzzy, daher als
  Vorschlag).
- **Verwaiste Übersichts-Einträge** — Fassaden-
  Eintrag hat Wikilink auf einen Detail-Knoten, der
  nicht (mehr) existiert.
- **Verwaiste Detail-Knoten** — `event`- oder
  `deadline`-Knoten, für den kein Fassaden-Eintrag
  existiert (informativ, kein Fehler).
- **Feld-Drift-Warnung** — Divergenz zwischen Fassade
  und Detail-Knoten bei kanonisch markierten Feldern
  (§1.1a). Warnung, kein Fehler (Fassade
  gilt). Klassischer Fall: Frist-Status (Sektion in
  `wiki/Fristen.md` vs. `status` im `deadline`-Knoten).
  Register-Status (Basis: Entscheidungen, Ideen; mit
  SP-1 zusätzlich Anforderungen, Fehlermeldungen; von
  weiteren Prozessen mitgebracht) folgt demselben Muster.
- **Vererbungs-Konsistenz** — Zyklen, fehlende Basen,
  Steckbrief-index-Drift (§11.2), Doppel-Definition
  eines Elements innerhalb eines Prozesses (§11.3).
- **Ablöse-Ketten-Konsistenz** — Element-Sackgassen und
  -Zyklen bei `supersedes:` (§11.4).
- *Optional, später:* Widersprüche zwischen Knoten.

### 9.2 Ausnahmen

Vom Waisen-Check ausgenommen:

- **Meta-Dateien** `wiki/index.md`, `wiki/log.md`.
- **Fassaden** sind **nicht** ausgenommen: sie haben
  eingehende Wikilinks aus der FassadenLandkarte
  `wiki/Fassaden.md` (§3a). Falls diese
  fehlen, soll der Lint das melden.

### 9.3 Auslöser

- **Auf Anfrage:** User löst Lint explizit aus.
- **Automatisch vor jedem Snapshot** (§10), damit
  der Snapshot konsistent ist.

### 9.4 Ausgabe

- **Bericht mit Fund-Liste.**
- **Triviale Funde** behebt die KI direkt (fehlende
  Index-Einträge, offensichtlich beidseitig nötige
  Rückverweise, wenn der Gegenknoten den Verweis
  bereits trägt).
- **Nicht-triviale Funde** werden als Vorschläge
  vorgelegt (verwaiste Knoten, nicht-verlinkte
  Erwähnungen, ungültige Wikilinks, Frist-Drift).

## 10. Snapshots aus dem Wiki nach overview/

### 10.1 Zweck

Das Wiki ändert sich fortlaufend. Ein **Snapshot**
friert einen aktuellen Zustand in einer
`overview/`-Datei ein — teilbar, lesbar ohne
Wiki-Tooling, mit Audit-Trail über `_VV_TLA`.

Typische Anlässe: Einspruchsfrist, Release-Stichtag,
Meilenstein-Review.

### 10.2 Ablauf

Immer **user-initiiert**.

1. User benennt Ankerpunkt und Anlass. Varianten:
   - **Sub-Fall A** (Snapshot eines konkreten
     Anlasses, Default): "Snapshot Einspruch
     Grundsteuer Flst 136, Stand heute".
   - **Sub-Fall B** (projektweiter Snapshot):
     "Snapshot Gesamtstand".
2. KI ermittelt den Anker-Knoten (bei Sub-Fall A
   meist `case`, `product`, `thesis` oder
   vergleichbar). Sub-Fall B hat keinen einzelnen
   Anker.
3. KI sammelt transitiv alle verlinkten Knoten, die
   inhaltlich zum Anlass gehören.
4. **Fassaden-Auszüge (Default für Sub-Fall A):**
   Agent extrahiert aus jeder Fassade automatisch
   die Einträge, die auf einbezogene Detail-Knoten
   verweisen (Chronologie-Zeilen zum Case,
   Fristen-Zeilen zum Case, Aktenzeichen,
   Ansprechpartner). Als "Auszug" im Snapshot
   dokumentiert.
   - **Override:** User kann beim Anlass explizit
     "ohne Fassaden-Auszüge" oder "mit vollständigen
     Fassaden" sagen.
   - **Sub-Fall B:** Fassaden komplett einbeziehen.
5. Vor der Bündelung läuft automatisch Lint (§9.3),
   damit der Snapshot konsistent ist.
6. KI bündelt die gesammelten Knoten in **eine**
   Markdown-Datei in `overview/`, benannt nach
   MasterPrompt §3.1 (mit `_VV_TLA`).
7. KI legt einen Eintrag in `index-overview.md` an.

### 10.3 Datei-Prinzip

**Ein Snapshot ist immer genau eine Datei.**

Grund: passt zum `overview/`-Prinzip "ein Dokument pro
Versionskette". Wird der Snapshot später aktualisiert,
entsteht eine neue Version (`_02_AIG.md` usw.), keine
zusätzliche Datei.

## 10a. Frist-Lebenszyklus

**Voraussetzung:** Die Fassade `wiki/Fristen.md` ist
aktiv (`active: true` bzw. Feld nicht gesetzt). Ist
`wiki/Fristen.md` deaktiviert, entfällt der gesamte
Frist-Lebenszyklus-Check: keine `deadline`-Detail-
Knoten werden neu angelegt, keine
`status`-Aktualisierung, keine Sektions-Verschiebung,
kein Chronologie-Vermerk. Vorhandene `deadline`-
Knoten bleiben unangetastet und tragen ihren
`status` weiterhin selbst. **Kanonizität wechselt
bei Deaktivierung auf den Detail-Knoten** — MasterPrompt
§5.4 (Ausnahme "Frist-Status Fassade maßgeblich")
greift dann nicht.

Der Statuswechsel bei Fristen läuft **automatisch mit
Meldung**:

- Agent prüft alle `deadline`-Knoten mit
  `status: offen` und `due < heute`.
- Setzt Status auf `abgelaufen`, verschiebt Fassaden-
  Eintrag in `wiki/Fristen.md` Sektion
  `## Abgelaufen`, legt Chronologie-Vermerk "Frist
  abgelaufen" an.
- Meldet im Erledigt-Block der Sessionstart-
  Nachricht: "N Fristen seit letzter Session
  abgelaufen: [Liste]".

**Trigger-Zeitpunkte:**

- **Sessionstart Phase C4** (MasterPrompt §5.3).
- **Bei erstem User-Input an einem neuen Tag** —
  wenn die Session länger läuft. Agent erkennt
  Tageswechsel über das aktuelle Datum (per
  System-Reminder) im Vergleich zum letzten Check.

**Kanonizität bei Drift:** die Fassade
`wiki/Fristen.md` gilt. Statuswechsel wird als
"Änderung der Kernaussage" behandelt und soll
beidseitig erfolgen (Fassade + Detail-Knoten). Lint
meldet Divergenz als Warnung.

## 10b. Sync-Pflicht bei Detail-Änderungen

Wenn ein Detail-Knoten erweitert oder redigiert wird,
gilt eine differenzierte Sync-Pflicht mit der
zugehörigen Fassade:

- **Kosmetische Änderungen** (Formulierung, Zusatz-
  kontext, Tippfehler-Fixes): **keine Sync-Pflicht**
  mit der Fassade — die Kurzform in der Fassade
  bleibt gültig.
- **Änderung der Kernaussage** (neuer Sachverhalt,
  geänderte Bewertung, Statuswechsel): Kurzform in
  der Fassade **wird nachgezogen**. Der Agent prüft
  das beim Redigieren und schlägt die Fassaden-
  Anpassung vor (Aktions-Entwurf).

Speziell für Fristen: Statuswechsel bei `deadline`-
Knoten gilt immer als Änderung der Kernaussage —
Sync ist Pflicht (§10a).

Bei Drift zwischen Fassade und Detail-Knoten meldet
der Lint eine Warnung. **Bei kanonisch markierten
Feldern gilt die Fassade** (§1.1a — konkret §10a für
Frist-Status, MasterPrompt §5.4 für Stolpersteine,
aktive Register-Fassaden für Register-Status — Basis
`Entscheidungen`/`Ideen` sowie vom Prozess mitgebrachte
wie `Anforderungen`/`Fehlermeldungen`); **für
Inhalt** (Beschreibung, Kontext, Nachweis, Vermerke)
sind Detail-Knoten maßgeblich (Progressive Disclosure,
siehe MasterPrompt §5.4).

## 11. Prozess-Teil-Wikis und Merge-Semantik

Jeder Prozess (SP-n, RP-n) bringt ein eigenes
**Teil-Wiki** als geschlossenes Paket mit — statt seine
Ausstattung in das Basis-Wiki einzuschleusen. Basis bleibt
schlank, jeder Prozess ergänzt lokal.

**Ort im Template:** `referenzprozesse/<PROZESS>/` als
self-contained Ordner; die Basis-Wiki-Skelette liegen
analog unter `referenzprozesse/base/wiki/`.

**Inhalt:**

- **`Steckbrief.md`** (Typ `process-brief`) — schlanke
  Selbstvorstellung mit festem Aufbau: „Was ich bin / Was
  ich kann / Was ich mitbringe / Setzt voraus / Volle
  Definition". Frontmatter `process:` und `extends:` sind
  hier **kanonisch** — der Merge-Agent liest die
  Vererbungs-Reihenfolge aus dem Steckbrief. Die Sektion
  `§ Mitgebrachte Fassaden` regelt mandatory/optional
  je Fassade (§11.3); die KANN-Sektion
  `§ Mitgebrachte Ordner` deklariert
  Root-Ordner-Freigaben des Prozesses (beim Merge
  automatisch als Freigabe-Buchung übernommen,
  MasterPrompt §1.1); die Sektion
  `§ Mitgebrachte Präfixe` ist der führende
  Deklarations-Ort der Prozess-Commit-Präfixe
  (§11.3 Schritt 6); die Sektion
  `§ Mitgebrachte Mechanik` deklariert vom Prozess
  mitgebrachte `internal-*`-Knoten samt
  Einführungs-Anweisungen (Eintragung,
  Neuverdrahtung, Kollisions-Regel, Rückbau —
  §11.3 Schritt 7). Die Deklarations-Sektionen
  stehen in fester Reihenfolge Fassaden → Ordner →
  Präfixe → Mechanik (Ordner und Mechanik
  entfallen, wenn keine mitgebracht werden, oder
  stehen als ausdrückliche Leer-Deklaration).
- **`index.md`** (Typ `process-mapping`) — Design-Wahrheit
  des Prozesses. Beginnt mit dem Verweissatz „Ich bin in
  [[Steckbrief]] beschrieben; konkret mache ich Folgendes:
  …". Trägt alle §-Sektionen (Positionierung, konkrete
  Basis-Instanzen, eigene Mechanismen, Rolle, Vorwahlen,
  Bezüge). Frontmatter `process:` / `extends:` spiegeln
  den Steckbrief.
- **`bootstrap/`** — Einmal-Anweisungen je Fassade
  (`bootstrap/<Fassade>.md`, DEC-217): wird beim
  Merge **nie** ins Anwender-wiki kopiert; der Agent
  liest und arbeitet sie aus der Template-Quelle ab.
- **`wiki/`** — Prozess-Teil-Wiki:
  - **Fassaden-Skelette** mit `## Meta`-Sektion
    (`Anforderungen.md`, `Fehlermeldungen.md`,
    `Systemarchitektur.md` bei SP-1 usw.); die
    Einmal-Anweisungen liegen daneben in
    `bootstrap/`.
  - **`Knotentypen-Anhang-<Prozess>.md`** — Typen, die
    dieser Prozess mitbringt (das Prozess-Suffix macht
    die Anhänge über alle Prozesse disjunkt). Wird beim
    Merge **nicht als Datei kopiert** — seine
    Typ-Blöcke werden in `wiki/Knotentypen.md`
    eingespielt.
  - **`Vorgehen-<Prozess>.md`** — das
    Vorgehens-Dokument des Prozesses.

**Zugangs-Ebenen:**

| Ebene | Datei | Zweck |
|---|---|---|
| Auswahl (schlank) | Scan über `referenzprozesse/*/Steckbrief.md` | Auswahl-Angebot im Init (MasterPrompt §5.3 Phase B/D) |
| Design-Wahrheit (voll) | `referenzprozesse/<PROZESS>/index.md` | Merge-Metadaten (Frontmatter) + Ableitung aller Artefakte |

Ein zentrales Prozess-Register gibt es nicht — die
Steckbriefe pro Prozess ersetzen es. Damit wird bei jedem
neuen Prozess **kein zentrales Register angefasst**; der
Ordner ist der Beitrag.

### 11.1 Selbst-Marker

Jedes Wiki-Element in einem Prozess-Teil-Wiki (Fassade,
Katalog-Eintrag im `Knotentypen-Anhang-<Prozess>`)
trägt einen **Selbst-Marker**, der seine Rolle im
Konzept-Netz benennt:

- **„Ich bin neu"** — bringt ein Element in die Basis
  ein, das es zuvor nicht gab.
- **„Ich löse X aus Prozess Z ab und verändere die
  Semantik wie folgt: …"** — überschreibt oder verfeinert
  ein Element aus einem Basis-Prozess.

**Träger: Frontmatter (für Maschinen) und Text (für
Menschen):**

- **Im Frontmatter:** Feld `supersedes:` (§4.1) — nur bei
  ablösenden Elementen; **Katalog-Name als String**
  (keine Wikilink-Notation im YAML).
  Neue Elemente haben das Feld nicht gesetzt.
- **Im Text:** einleitender Absatz nach der H1. „Ich bin
  neu in Prozess X" oder „Ich löse [[Y]] aus Prozess Z ab
  und verändere die Semantik wie folgt: …".

Der Text folgt dem Frontmatter — Drift wäre Lint-Warnung.

### 11.2 Vererbungs-Metadaten

Prozesse deklarieren im **Steckbrief-Frontmatter** ihre
Basis. **Genau eine Basis** (oder keine bei Wurzel-
Prozessen). Beispiele:

```yaml
# SP-1 baut auf keiner Vorstufe auf
---
type: process-brief
process: SP-1
status: ausgearbeitet
extends: []
---
```

```yaml
# RP-1 baut auf SP-1 auf
---
type: process-brief
process: RP-1
status: ausgearbeitet
extends: [SP-1]
---
```

Das Feld `status:` trägt den Ausbau-Stand des
Prozesses: `ausgearbeitet` (fertig, benutzbar) oder
`geplant` (Platzhalter — der Steckbrief-Scan im Init
bietet den Prozess nur mit Geplant-Ansage an; siehe
MasterPrompt §5.3). Fehlt das Feld, gilt der Prozess
als benutzbar.

**Regeln:**

- `extends:` als YAML-Liste mit **höchstens einem
  Element** (oder leer). Mehrere Basen sind aktuell nicht
  vorgesehen — Merge würde damit unnötig komplex. Wenn
  ein Anwender aus einem weiteren Prozess einzelne
  Konzepte hinzuziehen möchte, ist das ein bewusster,
  manueller Vorgang („hole aus Prozess X das Konzept Y"),
  der Kontextfenster kostet und daher nicht als
  Automatismus modelliert wird.
- Der Merge-Agent löst die Kette **linear** auf und
  merged **Basis-zuerst → Anwendungs-Prozess-zuletzt**.
  Beispiel: Anwender wählt RP-1 → Reihenfolge
  `Basis → SP-1 → RP-1`.
- **`index.md`-Frontmatter spiegelt** die Steckbrief-
  Felder (Steckbrief ist kanonisch, §11 Kopf).

**Lint-Regel „Vererbungs-Konsistenz":**

- **Zyklus** in der Vererbungs-Kette (Prozess A sieht
  sich beim Auflösen zum zweiten Mal) → Fehler.
- **Fehlende Basis** — `extends:` verweist auf
  Prozess-Ordner, der nicht existiert → Fehler.
- **Steckbrief/index-Drift** bei `process:`/`extends:`
  → Warnung (Steckbrief gewinnt).

Auslöser wie bestehende Lint-Regeln (§9.3) plus
**zusätzlich vor jedem Merge** (Prozess-Wahl im Init) —
Vorabprüfung.

**Aggregat bei Prozess-Auswahl:** Wenn der Agent im Init
die Prozesse zur Auswahl vorstellt (MasterPrompt §5.3
Phase D), führt er zuerst den Lint-Lauf (Vererbungs-
Konsistenz) über alle Steckbriefe aus. Aus dem Lint-
Ergebnis erzeugt er ein **konsolidiertes Aggregat**
(alle Steckbriefe zusammengefasst + resultierender
Vererbungsbaum), auf dessen Basis er die Auswahl
präsentiert. Fehler aus dem Lint blockieren die Auswahl-
Vorstellung — der Agent meldet sie und bittet um
Bereinigung, bevor er fortfährt. Warnungen (Drift)
laufen als Info-Zeile mit.

**Ort des Aggregats:** on-demand berechnet, keine
persistente Datei. Das bewahrt die self-contained-
Struktur der Prozess-Ordner (Hinzufügen eines Prozesses
= neuen Ordner anlegen, sonst nichts). Der spätere Merge
(§11.3) nutzt diese Vorarbeit direkt — Vererbungs-Kette
und Konsistenz sind zu dem Zeitpunkt schon geprüft.

### 11.3 Merge-Ablauf

Der Merge läuft **einmalig beim Init** (nach Prozess-Wahl)
und bei jedem **Prozess-Upgrade** (§11.5). Er ist
keine Sessionstart-Standardaufgabe — nach abgeschlossenem
Merge sind die Prozess-Artefakte im Anwender-`wiki/` und
werden wie Basis-Wiki behandelt.

**Voraussetzung:** Aggregat aus §11.2 liegt vor,
Vererbungs-Konsistenz-Lint sauber.

**Sequenz** — pro Prozess in Basis-zuerst-Reihenfolge:

1. **Fassaden-Skelette zusammenkopieren** (vorab:
   die Kollisions-Vorprüfung aus Schritt 7 — Sektion
   „Mitgebrachte Mechanik" des Steckbriefs lesen und
   Namens-/Funktions-Kollisionen mit bestehenden
   Knoten VOR dem Kopieren dem Anwender vorlegen):
   die
   Basis-Skelette aus `referenzprozesse/base/wiki/`
   (beim Init, einschließlich des
   Kopiervorlagen-Ordners `templates/`) und die
   Prozess-Skelette aus
   `referenzprozesse/<PROZESS>/wiki/` ins
   Anwender-`wiki/` — alle Dateien außer dem
   `Knotentypen-Anhang-<Prozess>`.
2. **Katalog-Anhang einspielen:** Typ-Blöcke aus
   `referenzprozesse/<PROZESS>/wiki/Knotentypen-Anhang-<Prozess>.md`
   in Anwender-`wiki/Knotentypen.md` einmergen (Typen-
   Blöcke anhängen bzw. bei `supersedes:` gemäß §11.4
   ersetzen); der Anhang wird nicht als Datei kopiert.
   Nach demselben Anhang-Muster wird — **falls
   vorhanden** — ein
   `Konzept-Repositories-Anhang-<Prozess>.md`
   eingespielt: seine Einträge wandern mit Geltung =
   Prozess in das Register
   `wiki/Konzept-Repositories.md`; auch dieser
   Anhang wird nicht als Datei kopiert. Deklariert
   der Steckbrief eine Sektion **„Mitgebrachte
   Ordner"**, werden diese Deklarationen als
   Freigabe-Buchung ins Entscheidungs-Register
   übernommen (Standardaufgabe; MasterPrompt §1.1) —
   die Ordner selbst entstehen erst bei Bedarf.

**Nach der Prozess-Kette:**

3. **Selbst-Marker anwenden** (§11.1): `supersedes:`-
   Verweise auflösen, abgelöste Fassaden auf
   `active: false` setzen und mit Wikilink
   „abgelöst durch [[neu]]" versehen; abgelöste Katalog-
   Einträge als Hintergrund markieren.
4. **Aktivierungs-Regel:** Für jede vom Prozess
   mitgebrachte Fassade greift die Steckbrief-Sektion
   `§ Mitgebrachte Fassaden`: mandatory automatisch
   aktiv, optional per Anwender-Ja/Nein mit
   Voreinstellung nach Steckbrief-Empfehlung.
5. **Bootstrap-Abarbeitung** pro aktivierter Fassade:
   die Bootstrap-Datei
   (`referenzprozesse/<P>/bootstrap/<Fassade>.md`)
   inklusive `### Verankerungen`-Checkliste aus der
   Template-Quelle abarbeiten — sie wird nie
   kopiert, in der Anwender-Fassade kann kein Rest
   zurückbleiben (DEC-217). Bei optionalen Fassaden
   erst bei Aktivierung.
6. **Aktivierungs-Kontext nachtragen:** im
   `internal-rule`-Knoten [[Aktivierter-Prozess]]
   (gewählter Prozess, Abweichungen von der
   Vorauswahl, abgelöste Ausprägungen, aktive
   Prozess-Präfixe — gelesen aus dem
   Prozess-Steckbrief §„Mitgebrachte Präfixe",
   DEC-208) und in der FassadenLandkarte
   [[Fassaden]] (neue Einträge Kategorie
   `Prozess-mitgebracht (<Prozess>)`, Status).
7. **Mitgebrachte Mechanik einführen:** deklariert
   der Steckbrief eine Sektion „Mitgebrachte
   Mechanik", liest der Agent sie und arbeitet die
   dort stehenden Einführungs-Anweisungen je Knoten
   ab — der Merge ist erst damit vollständig
   (Kopie allein reicht nicht):
   - **Kollisionen prüfen** — bereits vor dem
     Zusammenkopieren (Schritt 1): existiert im
     Anwender-`wiki/` ein gleichnamiger oder
     funktions-gleicher `internal-*`-Knoten, nicht
     überschreiben, sondern dem Anwender vorlegen
     (§5.2a sinngemäß).
   - **Eintragung:** Register-Eintrag je Knoten in
     [[InterneMechanik]], Kategorie
     `Prozess-mitgebracht (<Prozess>)`.
   - **Neuverdrahtung ausführen:** die in der
     Sektion deklarierten Zeiger prüfen,
     fehlende nachtragen bzw. bestehende
     umstellen; ersetzte projekt-eigene Regeln
     erhalten den Vermerk „abgelöst durch [[neu]]"
     (kein stiller Ersatz).
   - Die **Rückbau-Beschreibung** der Sektion bleibt
     stehen — sie gilt bei späterer
     Prozess-Deaktivierung.
8. **Commit** mit Präfix `Prozess-Merge:` (MasterPrompt
   §6.2).

**Disjunktheits-Regel** (führender Ort): Dateinamen
sind disjunkt über Basis + alle Prozess-Wikis;
Merge = Zusammenkopieren; `supersedes:` regelt
Ablösung von Fassaden gleichen Zwecks unter neuem
Namen. Gleichnamige Prozess-Anhänge werden per
Prozess-Suffix disjunkt gemacht
(`Knotentypen-Anhang-<Prozess>.md`) — keine
Ausnahme-Klasse. Geprüft beim Merge und per
Sessionstart-Wächter „keine zwei Dateien gleichen
Namens".

#### Namenskollisionen

Folgende Fälle mit jeweiliger Regel:

- **Innerhalb einer Ebene** (ein Prozess bringt zwei
  Elemente mit gleichem Namen mit): **Fehler in der
  Prozess-Definition**, muss vom Vererbungs-Lint (§11.2)
  vorab erkannt werden (zusätzliche Lint-Prüfung
  „Doppel-Definition im Prozess", §9.1).
- **Zwischen Ebenen ohne `supersedes:`** (Basis-Prozess
  bringt `X` mit, Anwendungs-Prozess bringt ebenfalls
  `X` mit ohne Ablöse-Marker): **Fehler beim Merge**,
  Merge bricht ab, Meldung an User — die Prozess-
  Definition muss `supersedes:` setzen oder einen
  anderen Namen wählen. Stillschweigendes Überschreiben
  ist nicht zulässig.
- **Zwischen Ebenen mit `supersedes:`** (Anwendungs-
  Prozess sagt explizit „ich löse `X` aus dem Basis-
  Prozess ab"): kein Konflikt, geregelte Ablösung nach
  §11.4.

### 11.4 Aktivitäts-Regel „nur hochwertigste aktiv"

Nach dem Merge (§11.3) ist im Anwender-`wiki/` immer nur
die **hochwertigste Ausprägung** jedes Elements aktiv;
abgelöste bleiben als Hintergrund im Wiki. Die konkrete
Regel unterscheidet die Element-Typen:

#### Grundregel: Ablösung nur unter neuem Namen

**Ein ablösendes Element (Katalog-Eintrag, Fassade)
trägt immer einen neuen Namen.**
Gleichnamige Ablösungen sind nicht zulässig — sie
würden entweder die alte Version stillschweigend
überschreiben (Historien-Verlust) oder Konflikte
erzeugen.

Diese Regel gilt einheitlich für alle Element-
Typen; die Details je Typ folgen unten.

#### Katalog-Einträge (Detail-Typen in `Knotentypen.md`)

Neue Semantik unter **neuem Frontmatter-Namen** (z.B.
`software-system-component` löst `system-component` ab).
Beide Einträge stehen im Katalog nebeneinander:

- Der neue trägt `supersedes: <alter Name>` als
  Frontmatter-Feld und Kopf-Marker im Text.
- Der abgelöste wird mit „**abgelöst durch <neuer Name>
  (aus Prozess Z)**" markiert.

Bestehende Detail-Knoten mit dem alten `type:` behalten
ihren Frontmatter zunächst — sie folgen der
**Migrations-Semantik §11.5**. Bei Upgrade werden sie
migriert (automatisch wo möglich, sonst Rückfrage).

#### Fassaden

Neue Fassade unter **neuem Dateinamen**; alte Fassade auf
`active: false` gesetzt, mit Wikilink im Kopf „abgelöst
durch [[neu]]". Beispiel:

- SP-1 bringt `wiki/Systemarchitektur.md` mit (`type:
  system-architecture-overview`).
- RP-1 löst diese ab durch
  `wiki/Softwaresystemarchitektur.md` (neuer Dateiname,
  `type: software-system-architecture-overview`,
  `supersedes: system-architecture-overview`).
- Nach Merge: `Systemarchitektur.md` trägt `active: false`
  und Kopf-Wikilink „abgelöst durch
  [[Softwaresystemarchitektur]]";
  `Softwaresystemarchitektur.md` trägt `active: true`;
  die FassadenLandkarte [[Fassaden]] führt beide
  Status-Einträge nach.

Deaktivierte Fassaden werden ohnehin nicht beim
Sessionstart gelesen (§3a) — die Regel greift
automatisch. Neuer Content geht an die aktive Fassade.

#### Instanz-Konventionen

Kopiervorlagen gibt es nicht — die
Struktur-Konventionen für neue Instanzen liefert die
`## Meta`-Sektion der jeweils aktiven (hochwertigsten)
Fassade; der Agent findet sie über den Ablöse-Verweis
des zugehörigen Katalog-Eintrags (siehe oben).

#### Aktivierungs-Kontext in [[Aktivierter-Prozess]] und [[Fassaden]]

Nach Merge trägt der Agent im `internal-rule`-Knoten
[[Aktivierter-Prozess]] nach:

```markdown
- **Aktive Prozesse:** Basis, SP-1, RP-1.
- **Abgelöste Ausprägungen:**
  - [[Systemarchitektur]] (SP-1) →
    [[Softwaresystemarchitektur]] (RP-1)
  - `system-component` (SP-1) →
    `software-system-component` (RP-1, per `supersedes:`
    abgelöst)
```

Bei nur einem aktiven Prozess ohne Ablösungen entfällt
die „Abgelöste Ausprägungen"-Zeile. Parallel wird der
Status der betroffenen Fassaden in der
FassadenLandkarte [[Fassaden]] nachgeführt.

#### Aktive-Ausprägungen-Aggregat (on-demand)

Analog zum Vererbungsbaum-Aggregat (§11.2) kann der Agent
bei Bedarf für jedes Element (Katalog-Eintrag, Fassade)
die vollständige Ablöse-Kette
rekonstruieren und das **aktive Blatt** bestimmen.

**Auslöser:**

- **Merge selbst (§11.3)** — Vorabprüfung, ob alle
  `supersedes:`-Verweise auflösbar sind. Zusätzliche
  Lint-Regeln:
  - **Element-Sackgasse:** `supersedes: X`, aber `X`
    existiert im Merge-Ergebnis nicht → Fehler.
  - **Element-Zyklus:** A supersedes B supersedes A →
    Fehler.
- **User-Anfragen** wie „was ist die aktive Ausprägung
  von `structure`?" — Agent berechnet on-demand.

**Ort des Aggregats:** on-demand, keine persistente
Datei. Die menschenlesbare Kurzform steht als „Abgelöste
Ausprägungen"-Zeile in [[Aktivierter-Prozess]]; die
vollständige Rekonstruktion bleibt on-demand.

#### Aktivität ist keine Voraussetzung

mandatory-Fassaden und Katalog-Elemente aktivieren
sich beim Merge **unbedingt** — kein Check „ist das
abgelöste Element aktiv?". Ein ablösendes Element
überschreibt strukturell; der Aktivitäts-Status des
abgelösten ist irrelevant (er wird ohnehin auf
`active: false` gesetzt oder als Hintergrund
markiert, siehe oben). Formulierung „Fassade X hängt
von Basis-Element Y ab" bedeutet nicht, dass Y vor X
aktiv sein muss — Y wird beim Merge angelegt oder
überschrieben, X funktioniert danach.
**optional-Fassaden folgen der Ja/Nein-Wahl** des
Anwenders (§11.3 Aktivierungs-Regel).

### 11.5 Prozess-Wahl und Upgrade

Situationen der Prozess-Wahl:

- **(A) Erster Init (Standardfall):** Anwender wählt beim
  Init einen oder mehrere Prozesse aus dem Auswahl-Angebot
  (§11.2 Aggregat). Der Agent führt den Merge nach §11.3
  aus — **keine Migration nötig**, da noch keine
  Instanzen existieren. Commit mit Präfix `Prozess-Merge:`.
- **(B) Upgrade (nachträglich):** Anwender ergänzt oder
  wechselt Prozesse in einem bestehenden Repo. Zusätzlich
  zum Merge greift die Migrations-Logik für bestehende
  Instanzen. Commit mit Präfix `Prozess-Upgrade:`.

#### (A) Erster Init

Der Agent präsentiert im Init-Angebot (MasterPrompt §5.3
Phase D) die verfügbaren Prozesse aus dem
Aggregat, Anwender wählt. Merge läuft nach §11.3;
Aktivitäts-Regel §11.4 greift; Aktivierungs-Kontext in
[[Aktivierter-Prozess]] und der FassadenLandkarte
[[Fassaden]] wird eingetragen.
Fertig.

#### (B) Upgrade

Unterfälle:

- **(B.a) Prozess hinzufügen** — Anwender hatte SP-1, will
  jetzt zusätzlich RP-1. Wenn RP-1 nichts aus SP-1 ablöst:
  reiner Merge. Wenn RP-1 Elemente ablöst: zusätzlich
  Migration nach unten stehendem Ablauf.
- **(B.b) Prozess wechseln/ablösen** — Anwender hatte
  SP-3, will jetzt SP-5. Läuft über denselben Ablauf.

**Ablauf:**

1. **Anwender löst Upgrade explizit aus** („Aktiviere
   RP-5 auf diesem Repo", „Wechsele auf SP-5").
2. **Agent führt Merge nach §11.3 durch** — neues Teil-
   Wiki wird eingespielt, Aktivitäts-Regel §11.4 greift.
3. **Aktive-Ausprägungen-Aggregat (§11.4) berechnen** —
   welche Elemente sind neu abgelöst?
4. **Für jedes abgelöste Element: bestehende Instanzen
   finden** (Wiki-Scan nach `type: <alter Name>` bzw.
   Verweise auf alte Fassade).
5. **Pro Instanz: automatische Migration versuchen** —
   Standardaufgabe [[Do-first-mit-Veto]] (MasterPrompt
   §5.1.2). Was automatisch geht, hängt vom ablösenden
   Element ab (z.B. wenn `system-component` von SP-1 auf
   RP-1's `software-system-component`-Ausprägung
   umgestellt wird und das Skelett feste Sektionen mit
   klaren Zuordnungen hat: Sektionen umbenennen und
   -reorganisieren). Die
   konkreten Migrations-Regeln stehen im ablösenden
   Element selbst.
6. **Lücken sammeln und im Rückfragen-Block vorlegen**
   (MasterPrompt §5.3 Phase D „Frage brauche ich von
   dir"). Beispiel: „Knoten `[[Sensor-Modul-Struktur]]`
   hat kein Feld für Technologie-Stack — was gehört hier
   hin?"
7. **Aktivierungs-Kontext in [[Aktivierter-Prozess]]
   und der FassadenLandkarte [[Fassaden]]
   aktualisieren.**
8. **Commit** mit Präfix `Prozess-Upgrade:` (MasterPrompt
   §6.2).

#### Kein Rollback im Wiki

Eine Prozess-Wahl (Init oder Upgrade) ist ein
**irreversibler Struktur-Vorgang** — der git-Verlauf
trägt die Historie, aber die Wiki-Ablösung wird nicht
automatisch zurückgenommen. Wer einen Prozess wieder
deaktivieren will, muss das explizit als neuen Upgrade-
Schritt tun (auf einen anderen Prozess wechseln oder
Fassaden-Deaktivierung manuell).

## 12. Format-Grundsatz

Das Wiki ist **Obsidian-kompatibel** gehalten:

- flache Ordnerstruktur in `wiki/`
- Wikilinks `[[Knotenname]]` für Wiki-interne Verweise
- projektspezifisches Frontmatter (§4.1)
- Title Case mit Leerzeichen in Dateinamen

**WikiJS-Publikation** erfordert eine einmalige
Konvertierung (Wikilinks → MD-Links, Frontmatter-
Mapping, Ordnerstruktur erzeugen). Das ist als
optionaler Export-Schritt gedacht, nicht als Default.
