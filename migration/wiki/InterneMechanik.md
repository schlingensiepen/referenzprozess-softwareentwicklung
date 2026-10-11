---
type: internal-machinery-log
active: true   # kann nicht deaktiviert werden — InterneMechanik ist Pflicht-Fassade (mandatory)
---

# InterneMechanik

## Meta

- **Typ:** `internal-machinery-log` — Fassade für das
  gesamte Steuerungs-Wissen dieses Projekts: Konzepte,
  Prozeduren, Muster, Regeln. Singleton,
  Pflicht-Fassade.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Detail-Typen mit `internal-` Präfix** („zur
  internen Verwendung des Projekt-Systems" — grenzt ab
  von `concept` für Anwender-Fachbegriffe):
  - **`internal-concept`** — Konzept-Erklärung: was ist
    X, welche Rolle spielt X, wie hängt es zusammen.
  - **`internal-procedure`** — Handlungs-Prozedur: wie
    mache ich X Schritt für Schritt.
  - **`internal-pattern`** — wiederkehrendes
    Design-Muster mit Wahl-Optionen.
  - **`internal-rule`** — verbindliche einzelne
    Konvention.
- **Detail-Knoten-Konventionen:** Frontmatter
  `type: internal-<concept|procedure|pattern|rule>`;
  Dateiname sprechend, flach im `wiki/`-Root
  (Kategorisierung über diese Fassade, keine
  Unter-Ordner). Body frei strukturiert; bei Prozeduren
  empfohlen: Zweck, Schritte, Grenzen.
- **Kanonizität:** die Betriebs-Konfiguration des
  Projekts lebt in `internal-rule`-Knoten dieser
  Fassade ([[Aktivierter-Prozess]],
  [[WorkspaceManager-Kontrakt]], [[Commit-Sprache]]) —
  nicht in [[Facts]] (Anwender-Terrain) und nicht in
  der Instruktionsdatei (dort nur gespiegelt, mit
  Warntext-Header).
- **Pflege:** neue Steuerungs-Regeln des Projekts
  entstehen als `internal-*`-Knoten plus
  Register-Eintrag hier — im selben Vorgang.

---

**Stand:** _(vom Agenten beim Init und laufend gepflegt)_

Register des Steuerungs-Wissens dieses Projekts.
Format pro Eintrag:

```markdown
### [[<Knoten-Name>]]

- **Typ:** internal-concept | internal-procedure |
  internal-pattern | internal-rule
- **Kurzform:** <ein Satz — was regelt/erklärt der Knoten>
```

## internal-rule

_(mitgelieferte Basis-Regeln; Betriebs-Konfiguration
kommt beim Init hinzu)_

### [[Berichten-statt-Blockieren]]

- **Typ:** internal-rule
- **Kurzform:** Werkzeug- und Prüf-Ergebnisse werden
  berichtet, nicht zur Blockade der laufenden Aktion
  gemacht.

### [[Do-first-mit-Veto]]

- **Typ:** internal-rule
- **Kurzform:** mechanische Folge-Schritte einer
  ausgelösten Standardaufgabe ohne Einzel-Rückfrage,
  sichtbar gemeldet, Veto möglich.

### [[Konzept-Repositories]]

- **Typ:** internal-rule
- **Kurzform:** Register der Konzept-/Proposal-
  Repositories fürs Konzept-Angebot (Geltung Basis
  oder Prozess, Betreiber-Vorbelegung ersetzbar,
  Prozess-Anhänge werden beim Merge übernommen).

### [[Projekt-Präfixe]]

- **Typ:** internal-rule
- **Kurzform:** Register projekt-eigener
  Commit-Präfixe (Modul-/Bereichs-Präfixe);
  Deklaration vor erster Verwendung, undeklarierte
  freie Präfixe meldet der Trigger-Hygiene-Wächter.

### [[WorkspaceManager-Kontrakt]]

- **Typ:** internal-rule
- **Kurzform:** Kontrakt für docsources.yml und
  WorkspaceManager (Konvertierung, Fallback,
  Lebenszyklus) plus die beim Init gefüllte
  Betriebs-Konfiguration (Verfügbarkeit pro Rolle).

### [[Instruktionsdatei-Pflege]]

- **Typ:** internal-rule
- **Kurzform:** Rolle, Pflichtabschnitte und
  Synchronisation der KI-Agent-Instruktionsdatei;
  bei Anlage, Abgleich oder Resync lesen.

### [[MCP-Setup]]

- **Typ:** internal-rule
- **Kurzform:** Begriffsklärung, Frage-Momente und
  empfohlener Startkatalog für MCPs und
  Agent-Erweiterungen; beim Setup und bei neuem
  Werkzeug-Bedarf lesen (Grundsatz bleibt in
  MasterPrompt §7).

### [[Handoff-Prozedur]]

- **Typ:** internal-rule
- **Kurzform:** Handoff-Zustand, Handoff-Momente
  T1–T4 und Standard-Konsolidierungs-Aktionen der
  Wahrheits-Konsolidierung; an Handoff-Momenten
  lesen.

## internal-procedure

_(mitgelieferte Basis-Prozeduren)_

### [[Git-Bestandsaufnahme]]

- **Typ:** internal-procedure
- **Kurzform:** Checkliste zur Aufnahme des
  git-Zustands eines Repos.

### [[Projekt-Sichtbarkeit-und-Lizenz]]

- **Typ:** internal-procedure
- **Kurzform:** Lizenz-Wahl und Repo-Sichtbarkeit
  klären, bei Multi-Repo pro Repo.

### [[Commit-Prozedur]]

- **Typ:** internal-procedure
- **Kurzform:** Vier-Fragen-Checkliste vor jedem
  Commit (Zug — Präfix — Sprache — Kadenz-Zeile)
  plus der Basis-Präfix-Katalog; Kadenz- und
  Sprach-Substanz bleibt in MasterPrompt §6.

## internal-concept

_(mitgelieferte Basis-Konzepte; vom Agenten bei
Bedarf ergänzt)_

### [[Standarddateien-Katalog]]

- **Typ:** internal-concept
- **Kurzform:** Beschreibungs-Katalog der
  Standarddateien im Projektroot (Zweck,
  Mitliefer-Status, Anlage-Zeitpunkt je Datei);
  Nachschlag bei Datei-Anlage.

### [[Versionsketten]]

- **Typ:** internal-concept
- **Kurzform:** Versionsketten-Detail der
  `_VV_TLA`-Versionierung (Ketten-Regeln,
  Unveränderlichkeit, Was-zählt-als-neue-Version);
  bei Output-Erzeugung lesen.

## internal-pattern

_(mitgelieferte Basis-Muster)_

### [[Init-Choreografie]]

- **Typ:** internal-pattern
- **Kurzform:** vollständige Init-Choreografie des
  Sessionstarts (Phase A0, Phase-D-Turns,
  Init-Fragen, Fassaden-Auswahl, Konzept-Angebot,
  Mission-Statement-Setup); beim allerersten Init
  über die Template-Quelle lesbar.

### [[Angebots-und-Beauftragungs-Muster]]

- **Typ:** internal-pattern
- **Kurzform:** Prüf- und Rechercheangebot samt
  Standard-Beauftragungs-Rahmen für Sub-Agenten
  (Prüf-/Recherche-Prompts, Zwei-Modelle-Regel,
  Angebots-Tabelle, Ingest- und Archiv-Regeln).

### [[Fahrplan-Vorlage]]

- **Typ:** internal-pattern
- **Kurzform:** Übersicht vor jeder mehrstufigen
  Anwender-Entscheidungs-Sequenz — ordnet die
  Kette, ohne Optionen vorwegzunehmen.

### [[Two-Repo-Submodul-Muster]]

- **Typ:** internal-pattern
- **Kurzform:** Werkstatt/Produkt-Trennung per
  Submodul; Einrichtung strukturiert über die
  sieben Meta-Felder einer Ableitungs-Regel.

## Einträge (Vorbelegung beim Starter-Bau, Migrations-Pfad)

- **[[Aktivierter-Prozess]]** (internal-rule) —
  RP-1 auf SP-1, Vorfestlegungen, Rolle offen.
- **[[Commit-Sprache]]** (internal-rule) — Entscheid
  offen, Frage im Migrations-Fragen-Block.
- **[[WorkspaceManager-Kontrakt]]** (internal-rule) —
  Projekt-Festlegung: nicht vorhanden, Agent
  übernimmt selbst; WSM-Verbot.
- **Prozess-mitgebracht (SP-1):**
  [[Register-Lebenszyklus]] (internal-concept),
  [[Meilenstein-und-T2]] (internal-rule),
  [[Register-Grundmuster]] (internal-pattern),
  [[devstate-Skelett]] (internal-pattern).
- Die Basis-Knoten (u.a. [[Init-Choreografie]],
  [[Commit-Prozedur]], [[Fahrplan-Vorlage]],
  [[Two-Repo-Submodul-Muster]],
  [[Handoff-Prozedur]], [[Angebots-und-Beauftragungs-Muster]])
  liegen mit und sind über ihre §Bezüge katalogisiert.
