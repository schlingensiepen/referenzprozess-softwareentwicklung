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
- **Werkzeug-Dauerfreigabe:** je dauerhaft
  freigegebenem Werkzeug ein `internal-rule`-Knoten
  `Werkzeug-Dauerfreigabe-<Werkzeug>.md` mit
  Werkzeug, Umfang (welche Aufträge), Datum der
  Freigabe und dem Satz „jederzeit widerrufbar“;
  Register-Eintrag unter `## internal-rule`. Beim
  Widerruf entfallen Knoten und Register-Eintrag.
  Wann gefragt wird und was die Freigabe bewirkt:
  [[Angebots-und-Beauftragungs-Muster]] §Auftragsliste
  zur Freigabe — lesen vor der Buchung.
- **Abgrenzung:** diese Fassade sagt, **wie das
  Projekt arbeitet**; welche Typen es gibt, sagt der
  [[Katalog]] (Meta-Fassade mit Katalog-Einträgen,
  darunter [[Katalog-InterneMechanik]] für die
  `internal-*`-Typen) — lesen, bevor ein neuer Typ
  oder Mechanik-Knoten angelegt wird.

---

**Bearbeitungsstand:** _(vom Agenten beim Init und laufend gepflegt)_

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
  sichtbar gemeldet, Veto möglich; Grenzen, darunter
  Aufträge mit Außenwirkung, Kosten oder Kontingent.

### [[Konzept-Repositories]]

- **Typ:** internal-rule
- **Kurzform:** Register der Konzept-/Proposal-
  Repositories fürs Konzept-Angebot (Geltung Basis
  oder Prozess, Betreiber-Vorbelegung ersetzbar,
  Prozess-Anhänge werden beim Merge übernommen).

### [[Projekt-Praefixe]]

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
  H1–H4 und Standard-Konsolidierungs-Aktionen der
  Wahrheits-Konsolidierung; an Handoff-Momenten
  lesen.

### [[Einfrieren-und-Abloesen]]

- **Typ:** internal-rule
- **Kurzform:** Klassen Element · Nachweis · außerhalb,
  Freeze-Zeitpunkt, vollständige Ablösung unter neuer
  ID, Eintrittsregel, Bildung eines Stands
  (Ableitungsprüfung, Kopien, Herkunftszeile,
  Leseregel, Überholt-Regel); vor der Bildung eines
  Stands, vor jeder Ablösung und beim Anlegen eines
  Register-Elements lesen.

### [[Kettenpruefung]]

- **Typ:** internal-rule
- **Kurzform:** Prüfung eines Pflicht-Stands gegen
  alle freigegebenen Vorgänger derselben Marke
  (Widerspruch, Abdeckung, Unbegründetes; Lint- und
  Reviewer-Anteil), Freigabe-Ordnung als Warnung mit
  Tag als Pflicht-Glied P9 und Übernahme aus der
  Vormarke, fehlende und vertretene Glieder (Verzicht
  je Phase, Koordinator ohne Bauteile, Übergabe-Stand,
  Ende der Komponenten-Kette), Freigabe-Ordnung des
  Koordinators, Komponenten-Kette nach Übernahme-Art
  mit Consumer-Prüfung und Rücklauf; vor jeder
  Freigabe eines Pflicht-Stands lesen.

### [[Marken]]

- **Typ:** internal-rule
- **Kurzform:** die Marke als Zwischenziel-Anker jeder
  Projektart — was sie abschließt (Produkt, Tag,
  Abschluss-Stand), wann eine neue beginnt, Frist als
  Eigenschaft, Beispiele je Projektart, Projekt ohne
  Prozess, Marken-Dokument je Prozess; beim Init
  (erste Marke) und vor einem Marken-Wechsel lesen.

### [[Meilenstein-und-T2]]

- **Typ:** internal-rule
- **Kurzform:** Wächter-Trigger T2
  (Prozess-Meilenstein-Wechsel, volle Runde C4–C8),
  Meilenstein-Anlässe, Meilenstein-Regel „agent-lokal“
  mit Koordinator-Meilenstein, Meilenstein-Vorgang
  (Prozess-mitgebracht, SP-1).

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

### [[Lebenslauf-eines-Stands]]

- **Typ:** internal-procedure
- **Kurzform:** Ablauf vom ersten Element bis nach
  der Freigabe eines Stands in acht Schritten
  (Erarbeiten `offen`er Elemente, Lese-Klammer
  Fassade, Bildung auf Angebot oder Zuruf, Prüfung vor
  der Vorlage, Vorlage des Stands selbst, Korrektur in
  die Elemente mit neuer Version, Freigabe mit Annahme
  der verwiesenen Elemente, Überholt und Übernahme)
  samt Arten der Abweichung; Mechanik bleibt an den
  führenden Orten. Lesen, sobald in einer Phase das
  erste Element entsteht, und vor der Bildung eines
  Stands.

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

### [[Register-Lebenszyklus]]

- **Typ:** internal-concept
- **Kurzform:** Status-Achse der Register-Einträge,
  Zustände je Register-Art, samt Feld-Regeln
  (Prozess-mitgebracht, SP-1).

## internal-pattern

_(mitgelieferte Basis-Muster)_

### [[Init-Choreografie]]

- **Typ:** internal-pattern
- **Kurzform:** vollständige Init-Choreografie des
  Sessionstarts (Phase A0 mit Anbindungs-Modi und
  Kopierliste, Phase-D-Turns, Init-Fragen samt
  Ein-/Zwei-Repo-Frage, Init mit Startprompt einer
  Komponente, Prozess-Angebot, Fassaden-Auswahl,
  Konzept-Angebot, Mission-Statement-Setup); beim Init
  lesen, beim allerersten Init über die
  Template-Quelle.

### [[Angebots-und-Beauftragungs-Muster]]

- **Typ:** internal-pattern
- **Kurzform:** Prüf- und Rechercheangebot samt
  Standard-Beauftragungs-Rahmen für Sub-Agenten
  (Recherche-Prompt, Angebots-Tabelle, Review-Auslöser,
  Ingest- und Archiv-Regeln; Ablauf eines Prüflaufs in
  `Reviewmuster.md` §2), Auftragsliste zur Freigabe und
  Werkzeug-Dauerfreigabe; vor jedem Angebot und jeder
  Beauftragung lesen.

### [[Fahrplan-Vorlage]]

- **Typ:** internal-pattern
- **Kurzform:** Übersicht vor jeder mehrstufigen
  Anwender-Entscheidungs-Sequenz — ordnet die
  Kette, ohne Optionen vorwegzunehmen.

### [[Two-Repo-Submodul-Muster]]

- **Typ:** internal-pattern
- **Kurzform:** Werkstatt/Produkt-Trennung per
  Submodul (Angebots-Trigger, Bauform-Wahl,
  Standardbelegung Werkstatt/Produkt/Schleuse,
  Ein-Repo-Fall); Einrichtung strukturiert über die
  sieben Meta-Felder einer Ableitungs-Regel; bei der
  Ein-/Zwei-Repo-Frage und vor dem Übertrag ins
  Produkt lesen.

### [[Register-Grundmuster]]

- **Typ:** internal-pattern
- **Kurzform:** Register-Status-Kanonizität als
  Ausnahme von Wiki.md §1.1a: Vier-Schichten-
  Absicherung, Feldliste kanonisch vs. gespiegelt
  (Prozess-mitgebracht, SP-1).

### [[devstate-Skelett]]

- **Typ:** internal-pattern
- **Kurzform:** `devstate_active.md` im Repo-Root:
  Anlage-Zeitpunkt, Minimal-Skelett, Koordinator-Regel
  (Prozess-mitgebracht, SP-1).

## Einträge (Vorbelegung beim Starter-Bau, Migrations-Pfad)

- **[[Aktivierter-Prozess]]** (internal-rule) —
  RP-1 auf SP-1, Vorfestlegungen eingearbeitet; den
  Herkunfts-Vermerk (Template-Stand, Quelle,
  Anbindungs-Modus) schreibt die Migration, die Rolle
  entscheidet der Anwender in ihrem Fragen-Block
  (`_template/migration/MIGRATION.md` Phase 1).
- **[[Commit-Sprache]]** (internal-rule) — Entscheid
  offen; Vorschlag der Migration: bisherige Regelung
  bis zur regulären Frage in Phase 5.
- **[[WorkspaceManager-Kontrakt]]** (internal-rule) —
  Betriebs-Konfiguration für die Dauer der Migration
  vorbelegt (nicht vorhanden, der Agent übernimmt
  selbst); reguläre Frage in Phase 5.
- **Prozess-mitgebracht (SP-1):** die Mechanik-Knoten
  [[Register-Lebenszyklus]], [[Meilenstein-und-T2]],
  [[Register-Grundmuster]] und [[devstate-Skelett]]
  sind beim Starter-Bau kopiert und oben in ihren
  Typ-Sektionen eingetragen; RP-1 bringt keine
  eigenen Mechanik-Knoten mit.
- Die Basis-Knoten (u.a. [[Init-Choreografie]],
  [[Commit-Prozedur]], [[Fahrplan-Vorlage]],
  [[Two-Repo-Submodul-Muster]], [[Handoff-Prozedur]],
  [[Angebots-und-Beauftragungs-Muster]]) liegen mit
  und sind über ihre §Bezüge katalogisiert.
