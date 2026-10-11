# MasterPrompt — Projektkonventionen für KI-gestützte Arbeit

**Stand: 23.08.2026**

Dieses Dokument ist die **KI-agnostische Quelle** aller
Konventionen für die Zusammenarbeit zwischen User und
KI-Agent in einem Projekt, das auf diesem Template
basiert.

Der MasterPrompt wird **nur auf explizite Anweisung**
des Users gelesen. Die beim Sessionstart automatisch
geladene Datei ist die **agent-spezifische
Instruktionsdatei** (siehe §8), die aus dem MasterPrompt
abgeleitet wird.

**Adaptions-Pflicht (DEC-211):** Alle hier und in den
Teildateien beschriebenen Mechanismen (Sub-Agenten,
Prüf-/Recherche-Werkzeuge, Datei- und Git-Operationen,
Wächter-Läufe, Konvertierungen) sind
**werkzeug-agnostisch** formuliert. Jeder ausführende
Agent MUSS sie auf seine **lokalen Werkzeuge und
agenten-spezifischen Mechanismen** adaptieren — mit
seinen Mitteln dasselbe Verhalten herstellen, die
Regel-Substanz dabei unverändert lassen und die
gewählte Adaption in `Tools.md` bzw. seiner
Instruktionsdatei (§8) dokumentieren. Kann ein
Mechanismus lokal nicht hergestellt werden, gilt
Berichten-statt-Blockieren.

## Teildateien

Umfangreichere Regelwerke sind in eigene Teildateien
ausgelagert. Jede ist in sich abgeschlossen und wird
bei Bedarf gezielt konsultiert:

- **`Wiki.md`** — komplette Wiki-Logik: Ingest,
  Knotentypen, Knoten-Aufbau, Index, Log,
  Cross-References, Lint, Snapshots.
- **`Outgoing.md`** — Outgoing-Pipeline: Format,
  Pandoc-Templates, Versandkanäle.
- **`Vorgehen.md`** — Vorgehensrahmen: Phasen,
  Freigaben, Scaffolding.
- **`Reviewmuster.md`** — Multi-Agent-Reviews,
  Muster-Katalog, Modell-Klassen.
- **`Styleguide.md`** — allgemeine Schreibanweisungen.
- **`Styleguide-project.md`** — projektspezifische
  Schreibanweisungen (wird im Projekt vom Agenten
  angelegt).
- **`Styleguide-md.md`** — Markdown-Konventionen für
  User-Facing Dateien.
- **`Styleguide-wiki.md`** — Strukturstandard für
  Wiki-Knoten.
- **`Styleguide-chat.md`** — Konventionen für die
  Chat-Interaktion mit dem User (wird im Projekt
  vom Agenten aus Standard-Textbaustein angelegt,
  siehe [[Standarddateien-Katalog]] §2.7a).

## 1. Ordnerstruktur

```
Root/                             ← Arbeitsverzeichnis
├── MasterPrompt.md               ← dieses Dokument
├── Wiki.md, Outgoing.md          ← Teildateien
├── Vorgehen.md                   ← Vorgehensrahmen (Phasen, Freigaben, Scaffolding)
├── Reviewmuster.md               ← Multi-Agent-Reviews, Modell-Klassen
├── Styleguide*.md                ← Styleguides
├── README.md                     ← verzweigender Einstieg (§2)
├── <Instruktionsdatei>           ← z.B. CLAUDE.md, .cursorrules
├── Tools.md                      ← installierte MCPs/Erweiterungen
├── Offene Fragen.md              ← aus Arbeitsmodus (optional)
├── TODO.md                       ← offene Punkte des Users
├── docsources.yml                ← Quellen für Konvertierung
├── index.md                      ← Gesamtindex
├── index-output.md               ← Index der Ausgangsdokumente
├── index-overview.md             ← Index der Übersichtsdokumente
├── [Arbeitsdokumente].md         ← weitere .md nach Bedarf
├── _template/                    ← nur Modus B: Template-Submodul, Nur-Lese
├── referenzprozesse/             ← Prozess-Vorlagen, Nur-Lese (siehe Anbindungs-Modi)
│   ├── base/
│   │   ├── bootstrap/            ← Einmal-Anweisungen je Fassade (DEC-217, nie kopiert)
│   │   └── wiki/                 ← Basis-Fassaden-Skelette
│   ├── SP-1-Standardprozess/     ← ausgearbeiteter Prozess
│   ├── RP-1-Systementwicklung/   ← ausgearbeiteter Prozess
│   └── <weitere>/                ← Platzhalter mit `status: geplant`
├── raw/                          ← Originaldokumente (immutable)
├── input/                        ← Volltext-Konvertierungen (immutable)
│   ├── raw/                      ← aus raw/ konvertiert
│   └── <name>/                   ← aus docsources.yml-Quellen
├── research/                     ← Recherche-Archiv des Agenten (immutable, §1.8)
│   └── REC-NNN - <Kurzsatz>/     ← Quellen-Downloads je Rechercheartefakt
├── tools/                        ← Projekt-Skripte des Agenten (§1.9)
├── wiki/                         ← Wiki-Layer mit Fassaden + Detail-Knoten
│   ├── index.md                  ← Wiki-Katalog mit Meta-Header
│   ├── log.md                    ← Ingest-Log
│   ├── Facts.md                  ← Projekteinstieg, Stolpersteine [mandatory]
│   ├── Knotentypen.md            ← kanonischer Typen-Katalog [mandatory]
│   ├── Fassaden.md               ← FassadenLandkarte [mandatory]
│   ├── InterneMechanik.md        ← Steuerungs-Wissen [mandatory]
│   ├── <weitere Fassaden>.md     ← alle Fassaden mit Status: `wiki/Fassaden.md`
│   ├── templates/                ← Kopiervorlagen für Root-Setup-Dateien (§2, §7.5)
│   └── <Wiki-Knoten>.md          ← Detail-Knoten (siehe Wiki.md)
├── output/                       ← eingefrorene Übergabe-Stände, versioniert
├── overview/                     ← eingefrorene Selbst-Auswertungen, versioniert
└── outgoing/                     ← Versandstand-Ordner (siehe Outgoing.md)
```

Alles projektspezifische Wissen — inkl. Meta-Wissen wie
Terminologie (Glossar), Fakten (Facts), Chronologie und
Typenkatalog — lebt im `wiki/`. Root enthält
Steuerdateien und Setup-Artefakte. Übersicht und
Aktivierungs-Status aller Fassaden führt
`wiki/Fassaden.md` (FassadenLandkarte) — der Baum oben
zeigt nur die Anker.

**Anbindungs-Modi.** Beim Init entscheidet der
Anwender, wie das Template ins Projekt kommt. Es gibt
zwei zulässige Modi und nur diese zwei — keine dritte
Bauform, keine Mischform:

- **Modus A — Lese-Referenz + einmalige Kopie.** Der
  Agent liest die Template-Dateien aus einem
  angegebenen Pfad und kopiert sie einmalig ins
  Anwender-Root (inkl. `referenzprozesse/` als
  Nur-Lese-Vorlage). Das Projekt ist danach
  **selbsttragend** — kein aktiver Bezug zum Template
  mehr; Updates erfordern bewusstes manuelles
  Nachziehen.
- **Modus B — git-Submodul `_template/`.** Der Agent
  bindet das Template-Repo als Submodul unter
  `_template/` ein (Nur-Lese). Version-Pinning per
  Submodul-Commit-Hash; Template-Updates aktiv
  abrufbar per `git submodule update --remote`.

`referenzprozesse/` liegt in der Template-Quelle
(Modus B: `_template/referenzprozesse/`; Modus A: als
kopierte Nur-Lese-Vorlage im Anwender-Root) und ist
**Nur-Lese** — zulässige Lese-Zugriffe sind der
Steckbrief-Scan beim Init und das Lesen als
Merge-Quelle (Wiki.md §11.3). Der Agent schreibt dort
nie.

### 1.1 Root-Verzeichnis

Im Root liegen alle Markdown-Arbeitsdokumente,
Styleguides, Index-Dateien und Steuerdateien. Die
Ordner `raw/`, `input/`, `research/`, `tools/`,
`wiki/`, `output/`, `overview/` und `outgoing/` werden
von der KI verwaltet und folgen den Konventionen dieses
Dokuments und seiner Teildateien.

Der User kann weitere Unterordner im Root anlegen —
für Teilaufgaben, Zwischendokumente oder thematische
Gruppierungen. Diese unterliegen keiner festen
Konvention. Es gilt:

- **Übergabe-Stände** (z.B. Stellungnahmen,
  Angebote, Berichte; ebenso Übergaben an
  andere Agenten/Repos, §1.5) werden auch aus
  Unterordnern heraus in `output/` abgelegt und
  versioniert.
- **Selbst-Auswertungen** werden in `overview/`
  abgelegt (§1.6).
- **Versand-fertige Dokumente** werden als
  Versandstand-Ordner in `outgoing/` abgelegt (siehe
  `Outgoing.md`).
- Die KI legt selbst keine Unterordner im Root an,
  außer die oben definierten Standard-Ordner.
- **Ausnahme mit Freigabe — und die Freigabe wird
  gebucht:** jede Root-Ordner-Freigabe ist ein
  Eintrag im Entscheidungs-Register (§9.1
  Doku-Pflicht — die mündliche Zusage im Chat genügt
  nicht); die Anlage selbst wird im Erledigt-Block
  ausgewiesen. Der Struktur-Wächter (§5.3 C6) meldet
  Nicht-Standard-Ordner ohne auffindbare
  Freigabe-Buchung. Zwei Freigabe-Quellen:
  (a) der **User** gibt Ordner frei (etwa
  Quellcode-, Test- oder CI-Verzeichnisse für
  Codeprojekte); (b) **Prozesse** deklarieren
  mitgebrachte Ordner in ihrer Steckbrief-Sektion
  „Mitgebrachte Ordner" — der Prozess-Merge
  übernimmt die Deklaration automatisch als
  Freigabe-Buchung (Standardaufgabe, Wiki.md
  §11.3). Das Arbeiten nach einem
  **Referenzprozess** impliziert diese Freigabe für
  die dort benannten Ordner — der Referenzprozess-
  Text nennt sie namentlich oder legt fest, wo sie
  im Verlauf (z.B. in einer Scaffolding-Vorlage)
  beschlossen werden.
- **Plattform-Konvention öffnet die Ordner-Regel:**
  Schreibt ein Werkzeug oder eine Plattform den
  Ablageort zwingend vor, darf der Agent diesen
  Pfad ohne eigene Ordner-Freigabe anlegen und
  nutzen — er gilt als Teil des zugehörigen
  deklarierten Bereichs (die `ci/`-Deklaration
  deckt die CI-Workflows der Plattform, wo immer
  diese sie physisch verlangt). Beispiele:
  `.github/workflows/` (GitHub Actions),
  `.gitlab-ci.yml` (GitLab CI), `Jenkinsfile`
  (Jenkins). Die Anlage wird im Erledigt-Block
  ausgewiesen; der Struktur-Wächter (§5.3 C6)
  meldet solche Konventions-Pfade nicht als Befund.
  Die Öffnung ist eng: sie greift nur, wenn die
  Plattform den Ort diktiert — frei wählbare Ordner
  laufen über Deklaration oder Freigabe.

### 1.2 raw/

Enthält Eingangsdokumente im **Originalformat**:
eingescannte PDFs, empfangene Briefe, Formulare,
amtliche Dokumente — so wie sie eingegangen sind.

Dateien in `raw/` werden **nicht versioniert** und
**nicht umbenannt**. Sie werden vom User abgelegt und
verbleiben dort als unveränderliche Originale unter
ihrem Originalnamen.

**Eiserne Regel:** Der **Agent** verändert Dateien
in `raw/` nie. Der **User** darf `raw/`-Dateien
überschreiben (z.B. besserer OCR-Scan) oder ergänzen
— eine Überschreibung löst über den Drift-Check
(Sessionstart Phase C1) automatisch Re-Konvertierung
und Re-Ingest aus. Für den Nachweis früherer Stände
dient der git-Verlauf.

`raw/` ist als unveränderliches Archiv konzipiert;
Löschungen und Umbenennungen bleiben Ausnahme (siehe
§1.3.1 Lebenszyklus). Die Konvertierung nach
`input/raw/` steuert der WorkspaceManager (siehe
§1.3.1).

### 1.3 input/

Enthält die **Volltexte** der Eingangsdokumente als
Markdown-Dateien (`.md`), organisiert in Unterordnern
nach Herkunft.

Die Konvertierung wird vom **WorkspaceManager**
gesteuert, einem externen Programm, das anhand der
Datei `docsources.yml` im Projektroot arbeitet
(siehe §1.3.1).

**Ablauf im Überblick:**

- Ursprung `raw/`: `raw/<datei>.pdf` → Konverter →
  `input/raw/<datei>.md` → Agent-Ingest → Wiki-
  Knoten in `wiki/` mit Provenienz-Verweis auf
  `input/raw/` und `raw/`.
- Ursprung externe Quelle: externer Pfad → Konverter
  → `input/<name>/<datei>.md` → Agent-Ingest →
  Wiki-Knoten mit Provenienz-Verweis.

**Namenskonvention:** Der Basename bleibt beim
Konvertieren erhalten (`raw/scan_2025_03.pdf` →
`input/raw/scan_2025_03.md`). Grund: sonst würde
der Konverter beim nächsten Lauf jede Datei neu
schreiben. Die "sprechenden" Namen leben in den
Wiki-Knoten.

Dateien in `input/` behalten **immer ihren
Originalnamen** und werden **weder umbenannt noch
verändert** — diese Regel gilt für den kompletten
`input/`-Baum (`input/raw/` und alle
`input/<name>/`-Unterordner), weil der
WorkspaceManager bei jedem Lauf denselben Ort
beschreibt.

Die KI arbeitet **nicht direkt** mit `input/`,
sondern mit den daraus abgeleiteten Wiki-Knoten in
`wiki/` (siehe `Wiki.md`).

Eingangsdokumente werden nicht versioniert.

**Eiserne Regel:** Dateien in `input/` werden nie
verändert.

#### 1.3.1 docsources.yml und WorkspaceManager

`docsources.yml` im Projektroot definiert externe
Quellen; der **WorkspaceManager** konvertiert
Originale 1:1 nach `input/` (`raw/` automatisch →
`input/raw/`), gestartet vom User, nicht vom Agent.
Ohne WorkspaceManager übernimmt der Agent die
Konvertierung on demand selbst (Fallback). Der
vollständige Kontrakt (Quellen-Format,
Fallback-Regeln, Lebenszyklus) und die beim Init
gebuchte Verfügbarkeit: [[WorkspaceManager-Kontrakt]]
— bei Konvertierungs- und Versand-Fragen lesen.

### 1.4 wiki/

**Arbeitsbasis der KI und Single Source of Truth für
KI-Arbeit.** Ebenen:

- **Fassaden (Übersichts-Knoten):** geschlossene, am
  Stück lesbare Dokumente (`Facts.md`,
  `Knotentypen.md`, `Mission Statement.md`,
  `Chronologie.md`, `Fristen.md`, `Aktenzeichen.md`,
  `Ansprechpartner.md`, `Glossar.md` etc.).
- **Detail-Knoten (atomar):** pro eigenständig
  zitierbarem Dokument bzw. Wissensobjekt ein
  Wiki-Knoten (`document`, `entity`, `concept`,
  `event`, `deadline`, `case`, `argument` etc.).

Vollständig beschrieben in **`Wiki.md`**.

Das Wiki ist ein **lebender, unversionierter
Sachstand**. Die Ordnerstruktur ist flach
(Obsidian-flavored), ohne Unterordner. Die
Detail-Typ-Konventionen (Frontmatter, Aufbau) trägt
jede Fassade selbst in ihrer `## Meta`-Sektion —
es gibt keinen Kopiervorlagen-Ordner für
Knoten-Instanzen. Einzige Unterordner-Ausnahme:
`wiki/templates/` mit Kopiervorlagen für
Root-Setup-Dateien ([[Standarddateien-Katalog]]
§2.7a/§2.13, §7.5).

**Progressive Disclosure:** Für Überblick reichen die
Fassaden (context-window-schonend); für Details
folgt der Agent den Wikilinks in die Detail-Knoten.
Details siehe `Wiki.md`.

### 1.5 output/

Enthält **eingefrorene Übergabe-Stände**: inhaltliche
Ausgangsdokumente (Stellungnahmen, Angebote, Briefe,
Berichte) **und** Übergaben an andere Agenten oder
Repos (z.B. Startprompts, Deploy-Dokumente, Testpläne
in Mehr-Repo-Prozessen) — Übergabe ist Übergabe,
unabhängig davon, ob ein Mensch oder ein Agent
empfängt. Dokumente in `output/` werden
**versioniert** (siehe §4). Das Verzeichnis wird von
KI und User gemeinsam genutzt.

**Zweigleisigkeits-Regel:** Übergabe-Artefakte mit
lebendem Wissens-Kern (z.B. Spezifikationen,
Testpläne) laufen zweigleisig — die **lebende
Fassung** ist ein Wiki-Knoten (mit Typ und
indexierender Fassade), der **Freigabe-/
Übergabe-Stand** ist die versionierte Datei hier;
der Freigabe-Eintrag im Entscheidungs-Register
verweist auf die exakte Version. Was lebt, lebt im
`wiki/` — `output/` friert ein. **Stand-Zwang
(DEC-214):** jede Zweck-Freigabe bindet sich an
einen solchen versionierten Stand und folgt der
kanonischen Formel „Stand x von ⟨Artefakt⟩,
freigegeben für Zweck Z [zu Marke M]"
(Vorgehen.md §4).

### 1.6 overview/

Enthält **eingefrorene Selbst-Auswertungen**:
Analysen, Zusammenfassungen, Vergleichstabellen,
Auswertungen, Wiki-Snapshots. Zielgruppe ist der User
selbst.

**Abgrenzung:** beides ist eingefroren und
versioniert — `output/` sind Übergabe-Stände (jemand
anderes empfängt), `overview/` sind Auswertungen für
uns selbst. Lebendes Wissen gehört in keins von
beiden, sondern ins `wiki/`.

Dokumente in `overview/` werden **versioniert** (§4)
und können **Snapshots** aus dem Wiki enthalten
(siehe `Wiki.md` und §4.7).

### 1.7 outgoing/

Enthält **Versandstand-Ordner** — je Versand ein
Ordner `YYYY-MM-DD HH-mm - <Adressat> - <Benennung>/`
mit dem `Anschreiben.md` (YAML-Frontmatter), den
daraus erzeugten Artefakten (PDF, EML, DOCX) und den
**tatsächlich versandten Anlagen-Kopien**. Die
Artefakte erzeugt der WorkspaceManager via Pandoc;
wenn keiner verfügbar ist (Init-Frage §5.3 Phase D),
übernimmt der Agent die Erzeugung selbst mit seinen
Tools und APIs — analog zur
Konvertierungs-Fallback-Regel in §1.3.1.

Vollständig beschrieben in **`Outgoing.md`**.

Ein Versandstand-Ordner ist als Ganzes
**unveränderlich** ab Erzeugung und wird **nicht
versioniert** — erneuter Versand ist ein neuer Ordner
mit neuem Zeitstempel; der führende Zeitstempel
sortiert chronologisch.

### 1.8 research/

**Recherche-Archiv des Agenten** — das Gegenstück zu
`raw/`+`input/` für agent-beschaffte Quellen. Die
Kanal-Trennung ist strikt: **Herkunft User →
`raw/`/`input/` (dort schreibt der Agent nie);
Herkunft Agent-Recherche → `research/`** (dort legt
der Agent ab; `docsources.yml` bleibt unberührt).

- **Struktur:** ein Ordner je Rechercheartefakt —
  `research/REC-NNN - <Kurzsatz>/` mit den
  Original-Downloads (PDF, Normtext,
  Spezifikation), HTML-Seiten als
  Markdown-Snapshot und ggf. Konvertierungen
  (Fallback-Logik §1.3.1).
- **Archiv-Schwelle:** archiviert wird, worauf ein
  Zitat im REC-Knoten oder eine Übernahme-Buchung
  sich stützt; ergebnislose Läufe archivieren
  nichts.
- **Unveränderlichkeit:** Dateien unveränderlich ab
  Ablage; Ordner append-only (Quellen-Nachträge zu
  einer laufenden Recherche erlaubt, nie Ersetzen).
- **Verzahnung:** der REC-Detail-Knoten verweist auf
  die archivierten Kopien; die `quelle_liste` führt
  Herkunfts-URL **und** Archiv-Pfad (Details:
  `## Meta` der Fassade Rechercheartefakte, §5.6).

### 1.9 tools/

**Projekt-Werkzeuge des Agenten** (DEC-220):
Skripte, die das Projekt betreiben — Konverter,
Massen-Ingest-Skripte, Lint- und Kadenz-Werkzeuge,
Automatisierungen. Abgrenzung: Produkt-Code gehört
in die vom Prozess deklarierten Code-Bereiche
(`src/`, `tests/`, `ci/`, `deploy/` — SP-1);
`Tools.md` bleibt die Dokumentations-Datei und
registriert auch diese Skripte.

- **Registrier-Pflicht:** jedes Skript erhält einen
  Eintrag in `Tools.md` (Kategorie
  „Projekt-Skripte": Zweck, Aufruf, ggf.
  Abhängigkeiten).
- **Struktur:** flach; Unterordner nach Bedarf ohne
  weitere Freigabe.
- **Kein Wahrheits-Ort:** Ergebnisse von Skripten
  folgen den normalen Ablage-Regeln (wiki/, output/,
  overview/) — `tools/` trägt nur die Werkzeuge.

## 2. Standarddateien im Root

Diese Standarddateien existieren — mitgeliefert oder
vom Agenten angelegt:

- **`MasterPrompt.md`** — dieses Dokument; wird nur
  auf Anweisung des Users gelesen.
- **`Wiki.md`, `Outgoing.md`** — Teildateien zu den
  jeweiligen Themenkomplexen.
- **KI-Agent-Instruktionsdatei** (`CLAUDE.md`,
  `.cursorrules` etc.) — beim Sessionstart
  automatisch geladen (§8).
- **`Styleguide.md`, `Styleguide-md.md`,
  `Styleguide-wiki.md`** — mitgelieferte Styleguides.
- **`Styleguide-project.md`, `Styleguide-chat.md`** —
  beim Init angelegte Styleguides.
- **Fassaden im Wiki** — stellen sich in der eigenen
  `## Meta`-Sektion selbst vor; Landkarte
  `wiki/Fassaden.md`.
- **`Tools.md`** — Verzeichnis installierter MCPs
  und Erweiterungen (§7).
- **`Offene Fragen.md`** (optional) — offene Fragen
  aus dem Arbeitsmodus (§5.1.3).
- **`TODO.md`** — offene Punkte und Erinnerungen
  des Users.
- **`docsources.yml`** (optional) —
  Quellen-Definition für den WorkspaceManager
  (§1.3.1).
- **Index-Dateien** — `index.md`, `index-output.md`,
  `index-overview.md`, `wiki/index.md`.
- **`README.md`** — der verzweigende Einstieg für
  Ankommende.

Beschreibung, Mitliefer-Status und Anlage-Zeitpunkt
jeder Datei samt Kopiervorlagen-Anschlüssen
(`wiki/templates/`): [[Standarddateien-Katalog]] —
Nachschlag bei Datei-Anlage und bei Fragen zu einer
Standarddatei.

## 3. Namenskonvention

### 3.1 Allgemeines Schema (output/, overview/)

```
<Datum> - <Absender> - <Empfänger> - <Dokumentname> - <Betreff> - <Gegenstand>_VV_TLA.ext
```

Bestandteile:

- **Datum:** `YYYY-MM-DD` (ISO 8601). Das Datum im
  bzw. des Dokuments, nicht das Dateidatum im
  Dateisystem. Bei datumstragenden
  Eingangsdokumenten: deren Dokumentdatum.
- **Absender:** Name oder Kurzbezeichnung.
- **Empfänger:** Name oder Kurzbezeichnung.
- **Dokumentname:** Dokumenttyp (z.B.
  "Stellungnahme", "Angebot").
- **Betreff:** Hauptbegriffe der Betreffzeile, auf
  1–3 Begriffe verkürzt.
- **Gegenstand:** der betrachtete Gegenstand.
- **VV:** zweistellige Versionsnummer (01, 02, 03 …).
- **TLA:** dreibuchstabiges Kürzel des Bearbeiters
  (§4.2).
- **ext:** Dateierweiterung.

### 3.2 Weglassregel

**Felder, die nicht zutreffen, werden weggelassen —
mitsamt dem zugehörigen Trennzeichen " - ".**

Beispiele:

- Dokument ohne Betreff und Gegenstand:
  `<Datum> - <Absender> - <Empfänger> - <Dokumentname>_VV_TLA.ext`
- Dokument ohne Empfänger:
  `<Datum> - <Absender> - <Dokumentname> - <Gegenstand>_VV_TLA.ext`

### 3.3 Eingangsdokumente (raw/, input/)

Dateien in `raw/` und `input/` behalten **immer ihre
Originalnamen** — sie werden weder umbenannt noch
verändert (eiserne Regel).

### 3.4 Wiki-Knoten (wiki/)

Eigene Namenskonvention im Obsidian-Stil (Title Case
mit Leerzeichen). Siehe `Wiki.md`.

### 3.5 output/ und overview/

Volles Schema mit Versionsteil aus §3.1.

Beispiele:

```
2026-02-20 - Vogelsang GbR - Stadt Mittelbach - Stellungnahme - Sanierung Amselweg_01_AIG.docx
```

### 3.6 outgoing/

Versandstand-**Ordner** nach eigener Konvention
`YYYY-MM-DD HH-mm - <Adressat> - <Benennung>/`, darin
`Anschreiben.md` als fester Name; **ohne Versionsteil**
(`_VV_TLA`), weil nicht versioniert — der Zeitstempel
disambiguiert. Details siehe `Outgoing.md`.

### 3.7 Sonderzeichen in Dateinamen

Umlaute und Sonderzeichen werden durch ihre
offizielle Umschrift ersetzt:

- ö → oe, ä → ae, ü → ue, ß → ss
- Ö → Oe, Ä → Ae, Ü → Ue

Beispiele: "Mühlgäßle" → "Muehlgaessle",
"Amselstraße" → "Amselstrasse".

### 3.8 Namensbeständigkeit (Ketten-ID)

**Einmal vergebene Dateinamen werden nicht mehr
geändert.** Der Teil vor `_VV_TLA` heißt **Ketten-ID**
und ist unveränderlich. Weder Datum noch andere
Bestandteile dürfen nachträglich korrigiert werden.
Nur der Versionsteil wird hochgezählt.

Dateien in `raw/` und `input/` werden grundsätzlich
nicht umbenannt. Wiki-Knoten behalten nach dem
erstmaligen Anlegen ihren Namen (sonst brechen
Cross-References).

Hintergrund: Umbenennung bricht Verweise in
Index-Dateien, Chronologie, Arbeitsdokumenten und
externen Referenzen.

### 3.9 Neuheits-Marker in Namen vermeiden

In Datei-Namen, Bezeichnern, IDs und Register-
Präfixen keine Marker wie NEU, NEU-N, GANZNEU,
FINAL, WIRKLICH_FINAL, V2, V2_final etc. — solche
Marker altern schnell und erzeugen Folge-Namen wie
NEUER, NEU2, WIRKLICH_WIRKLICH_FINAL.

Stattdessen:

- **Sachlich präzisieren:** statt NEU-Umbau →
  Umbau-Rollen-Ebenen (was neu ist an dem Umbau).
- **Zeitlich präzisieren wo passend:** statt
  NEU-Version → 2026-08-Version oder v5.
- **Generisch benennen:** statt NEU-Fassade →
  Agent-Berichte.md (was die Fassade ist, nicht
  dass sie neu ist).

Ausnahme: kurzlebiges Session-Vokabular in
Design-Diskussionen (z.B. „NEU-1..NEU-N" in einer
Vorlauf-Runde) ist zulässig, solange es **nicht** in
dauerhafte Artefakte übernommen wird (nicht als
Datei-Name, nicht als Präfix im Register). Die
Marker landen im Session-Protokoll, verschwinden
aber bei Materialisierung.

## 4. Versionierung

### 4.1 Grundprinzip

**Versioniert** (mit `_VV_TLA`):

- `output/` — inhaltliche Ausgangsdokumente
- `overview/` — Analysen und Snapshots

**Nicht versioniert:**

- `raw/` — Originaldokumente
- `input/` — Volltext-Konvertierungen
- `wiki/` — lebender Sachstand (inkl. aller Fassaden
  wie `Facts.md`, `Chronologie.md`, `Fristen.md` etc.)
- `outgoing/` — versand-fertige Verpackung
- Root-Steuerdateien (`TODO.md`, `Tools.md`,
  `Offene Fragen.md`, Indizes etc.)

### 4.2 Bearbeiterkürzel (TLA)

- **AIG:** KI-Agent (Artificial Intelligence
  Generated).
- **User-TLA:** wird beim ersten Gebrauch abgefragt.
  Beispiel: `ABC` — frei gewähltes Kürzel der
  bearbeitenden Person.

### 4.3 Versionskette

Die Versionskette wechselt zwischen Bearbeitern: die
KI verwendet immer die nächste freie Versionsnummer
mit Kürzel `AIG` und arbeitet auf User-Versionen
weiter; es gibt keine Lücken. Beispiel-Kette, Regeln
und Snapshot-Anschluss: [[Versionsketten]] — bei
Output-Erzeugung lesen.

### 4.4 Unveränderlichkeit versionierter Dokumente

**Grundsatz:** Versionierte Dokumente (`output/`,
`overview/`) werden **nie überschrieben und nie
gelöscht** — jede Änderung erzeugt eine neue
Version. Detail: [[Versionsketten]].

### 4.5 Was zählt als neue Version

Neue Version bei inhaltlicher Änderung, Korrektur
oder Bearbeiter-Wechsel; keine bei Lesen/Analysieren
oder Verschieben/Kopieren ohne Änderung. Abgrenzung:
[[Versionsketten]].

### 4.6 Markdown als Arbeitsformat

Alle Dokumente in `output/` und `overview/` werden
von der KI zunächst als Markdown (`.md`) erstellt.
Markdown bleibt das Arbeitsformat, solange der
Review-Prozess zwischen KI und User läuft. Erst wenn
der User den Inhalt für abgeschlossen erklärt und
**explizit ein anderes Format anfordert**, wird
konvertiert. Die Markdown-Version bleibt Teil der
Versionskette.

**Abgrenzung:** Dokumente in `outgoing/` durchlaufen
eine eigene Pandoc-Pipeline zur Erzeugung von PDF,
EML oder DOCX — automatisch durch den
WorkspaceManager, nicht user-initiiert. Siehe
`Outgoing.md`.

### 4.7 Snapshots aus dem Wiki

Ein **Snapshot** friert einen aktuellen Wiki-Zustand
zu einem bestimmten Anlass in einer `overview/`-Datei
ein. Details siehe `Wiki.md`.

## 5. Verhalten der KI

### 5.1 Grundhaltung — drei Modi

#### 5.1.0 Ableitbarkeit vor Rückfrage

**Bevor der Agent eine Frage stellt, prüft er, ob die
Antwort aus vorhandenen Dateien ableitbar ist** —
insbesondere aus `raw/`, `input/`, `docsources.yml`
sowie bestehenden Standarddateien im Projektroot.

Nur wenn die Information **nicht** ableitbar ist
(z.B. Bearbeiter-TLA, redaktionelle Stolpersteine,
eine subjektive Auswahl), wird gefragt. Alles andere
wird **abgeleitet, als Entwurf vorgelegt und zur
Bestätigung oder Korrektur durch den User**
angeboten.

Dieses Prinzip gilt in allen drei Modi (§5.1.1–§5.1.3).

#### 5.1.1 Standard-Modus (Default)

Gilt für alle Aufgaben, die nicht unter §5.1.2 oder
§5.1.3 fallen.

- **Bei Unklarheit:** Agent fragt nach; führt nicht
  aus.
- Gilt insbesondere für inhaltliche Entscheidungen,
  Formulierungen in `output/` und `outgoing/`, neue
  Konzepte und alle Vorgänge mit Außenwirkung.

#### 5.1.2 Standardaufgaben — ausgenommen von der Rückfrageregel

Für mechanisch festgelegte Vorgänge, deren Regeln in
diesem Dokument und den Teildateien vollständig
beschrieben sind, fragt der Agent **nicht** nach,
sondern führt direkt aus:

- **Ingest-Mechanik** (siehe `Wiki.md`; beim
  Massen-Ingest gilt die Namensraum- und
  Kollisions-Vorschrift Wiki.md §5.2a — die
  Namensraum-Deklaration selbst ist
  Anwender-Entscheidung, keine Standardaufgabe)
- **Index-Pflege** (`wiki/index.md`, Teilindizes)
- **Log-Einträge** in `wiki/log.md`
- **git-Commits** (§6) je Zug
- **Aktualisierung von `Tools.md`** nach Installation
  (§7)
- **Agent-Bericht-Ingest** nach Sub-Agent-Rückkehr:
  REP-Detail-Knoten anlegen (Bericht unverändert
  übernehmen), Fassaden-Eintrag in
  `wiki/Agent-Berichte.md`, Commit mit Präfix
  `Report:`. Pflicht ab nicht-trivialen Läufen
  (Sub-Agent mit eigenständigem Urteil oder Analyse;
  bloße Tool-Aufrufe sind ausgenommen).
- **Recherche-Ingest** nach Recherche-Abschluss:
  REC-Detail-Knoten anlegen, Fassaden-Eintrag in
  `wiki/Rechercheartefakte.md`, Commit mit Präfix
  `Recherche:` (siehe §5.6).
- **Prozess-Merge** beim Init nach Prozess-Wahl
  (`Wiki.md` §11.3, siehe §5.3 Turn 2)
- **Prozess-Upgrade** bei user-initiiertem Auslöser
  („Aktiviere Prozess X", „Wechsele auf Prozess Y"):
  Merge (`Wiki.md` §11.3) plus Migration bestehender
  Instanzen (`Wiki.md` §11.5). Migrations-Rückfragen
  bei Lücken sind Teil des Ablaufs (Rückfragen-Block
  nach §5.3 Phase D), keine Ausnahme von der Regel.

**Beispiel-Prüfung bei Regel-Änderung:** Ändert sich
eine im Entscheidungs-Register verankerte Regel,
prüft der Agent die davon berührten Beispiele und
Erläuterungen in den lebenden Dokumenten mit und
zieht sie nach (Standardaufgabe im selben Zug).

Standardaufgaben laufen nach [[Do-first-mit-Veto]]:
der Agent führt aus und meldet im Erledigt-Block;
der User kann widersprechen, dann wird
zurückgerollt.

Bei Unklarheit innerhalb eines Standardvorgangs fällt
der Vorgang zurück in den Default-Modus — Agent
fragt (oder protokolliert, falls Arbeitsmodus aktiv).

#### 5.1.3 Arbeitsmodus (Batch-Modus)

Bei größeren Mengen (z.B. Initial-Ingest vieler
`input/`-Dateien, Bulk-Updates) schlägt der Agent
**aktiv vor**, in den Arbeitsmodus zu wechseln. Nur
mit User-Zustimmung aktiv.

Im Arbeitsmodus:

- **Keine Rückfragen bei Unklarheit**, sondern
  **Dokumentation** in `Offene Fragen.md`.
- **Überspringen** des betroffenen Teilschritts,
  Weiterarbeit am nächsten.
- Pro Eintrag werden festgehalten: Kontext, Frage,
  was übersprungen wurde, was nachzuarbeiten ist,
  Status.
- Am Ende des Batches präsentiert der Agent die
  gesammelten Fragen.

Verlassen: automatisch am Batch-Ende, aktiv durch
den Agent bei **kritischer** Unklarheit, oder auf
User-Anweisung.

**Kritisch** heißt: ohne Klärung würde der Agent
voraussichtlich große Teile des Arbeitsergebnisses
falsch ausarbeiten. Einzelne unklare Punkte
rechtfertigen keine Unterbrechung — der Agent
versucht klare und vermutlich klare Teile zu
bearbeiten und dokumentiert unklare Teile in
`Offene Fragen.md`.

**Facts-Vorschläge im Arbeitsmodus** folgen derselben
Regel: sie landen in `Offene Fragen.md` und werden
am Batch-Ende präsentiert (nicht ad-hoc gefragt).

### 5.2 Offene Fragen.md

Format eines Eintrags:

```markdown
## <N>. <Kontext> — <Kurzbezeichnung>

- **Aufgetreten beim:** <Vorgang>
- **Frage:** <die offene Frage>
- **Übersprungen:** <was nicht getan wurde>
- **Nacharbeit nach Antwort:** <was zu tun ist>
- **Status:** offen | erledigt
```

Pflege: Der Agent ergänzt im Arbeitsmodus; der User
beantwortet im Chat; der Agent führt die Nacharbeit
aus und setzt den Status.

### 5.3 Sessionstart-Ablauf

Der Sessionstart läuft in den folgenden Phasen —
gleich für Init und regulären Start;
Init-spezifische Schritte sind markiert.

#### Phase A — Orientierung

**A1 git-Prüfung** — bei jedem Sessionstart, nicht
nur beim Init (Checkliste: [[Git-Bestandsaufnahme]]):

- Wenn `.git/` vorhanden: OK, weiter mit
  `git status`. Dirty-Zustand informativ melden,
  **nicht blockierend**; Agent committet dirty
  Änderungen nicht automatisch.
- Wenn nicht vorhanden **und** Ordner leer/frisch
  (Init-Situation): `git init` anbieten,
  `.gitignore` mitliefern, Initial-Commit.
- Wenn nicht vorhanden **und** Ordner nicht leer
  (git wurde entfernt oder Repo wurde ohne git
  kopiert): **Fail-Safe** — Meldung „git-Repo
  fehlt, bitte einrichten oder wiederherstellen.
  Standardaufgaben mit Commit-Anteil (Ingest,
  Prozess-Merge, Fassaden-Pflege) werden bis dahin
  ausgesetzt." Keine automatische `git init` in
  einem gefüllten Ordner (Risiko: leerer Verlauf
  verdeckt Historie).
- **Submodul-Check (Modus B):** existiert
  `_template/`, ist aber **leer** (Submodul nach
  `git clone` ohne `--recursive` nicht
  initialisiert): melden und
  `git submodule update --init` anbieten. Bis zur
  Initialisierung werden nur die Schritte
  zurückgestellt, die die Template-Quelle brauchen
  (Steckbrief-Scan, Merge-Quelle) — alles andere
  läuft weiter.

**Bootstrap-Init-Frage** (nur wenn der Anwender
einen Pfad zur Template-Quelle übergeben hat, z.B.
„lies `<pfad>/MasterPrompt.md` und setze das Projekt
entsprechend auf"): direkt nach der git-Prüfung, vor
allem weiteren Init-Content, stellt der Agent die
zweistufige Modus-Frage (Anbindungs-Modi siehe §1).

Turn α — Anbindungs-Modus:

> Ich lese den Template-Pfad `<pfad>` als Zeiger auf
> ein Template. Wie soll ich das Template anbinden?
>
> - **A** — Lese-Referenz mit einmaligem Kopieren:
>   dein Projekt trägt die relevanten Teile danach
>   selbst, keine Update-Verbindung.
> - **B** — git-Submodul unter `_template/`: dein
>   Projekt pinnt einen Template-Commit-Hash und
>   kann später Template-Updates aktiv ziehen.

Turn β — nur bei Modus B: Origin-Klärung. Die
Submodul-Quelle ist **nie der übergebene absolute
Pfad**, sondern die Upstream-URL des lokalen Klons
(`git -C <pfad> remote get-url origin`):

> Für den Submodul-Origin nutze ich die aus deinem
> lokalen Klon ausgelesene Upstream-URL: `<url>`.
> Ist das korrekt? Alternativ: nenn mir eine andere
> URL.

Wenn die URL nicht ableitbar ist oder das Einbinden
fehlschlägt, entscheidet der Anwender: alternative
URL, Rückfall auf Modus A, oder Abbruch. Die
getroffene Modus-Wahl wird als DEC im
Anwender-Register gebucht.

**A2 Ordner-Struktur:**

Erwartete Ordner: `raw/`, `input/`, `research/`,
`tools/`, `output/`, `overview/`, `wiki/`,
`outgoing/`.
Fehlende werden **ohne Rückfrage** angelegt
(Standardaufgabe §5.1.2).

**A3 KI-Agent-Instruktionsdatei:**

- Existiert die für den Agenten zutreffende Datei
  (z.B. `CLAUDE.md`)?
- Fehlt → für Phase D vormerken (Anlegen mit
  User-Dialog).
- Existiert → Pflichtabschnitte gemäß §8.3
  abgleichen; fehlende für Phase D vormerken.
- **Synchronisations-Check:** MasterPrompt jünger als
  Instruktionsdatei? → für Phase D vormerken
  (Resync-Vorschlag).

#### Phase A0 — Setup lebende Dokumente (nur Init mit Template-Quelle)

Nach der Modus-Wahl kopiert der Agent die
Wurzel-Dokumente und das Basis-Wiki
(`referenzprozesse/base/wiki/`) als **lebende
Kopien** ins Anwender-Projekt; bei Modus A wandert
zusätzlich `referenzprozesse/` als Nur-Lese-Vorlage
mit. Ablauf und Modus-Unterschiede:
[[Init-Choreografie]] §Phase A0 (beim allerersten
Init über die Template-Quelle erreichbar).
#### Phase B — Kontext laden

Grundsatz beim Laden: das `wiki/` ist die Quelle
der Wahrheit (§9) — der geladene Kontext ersetzt
das spätere Nachschlagen nicht.

**Lese-Tiefen** je Übersichts-Knoten und Root-Datei.
Nicht alles muss beim Sessionstart voll gelesen
werden — manche Dokumente sind operativ kritisch
(Grundregeln, Facts, Chat-Konventionen, akute
Fristen), andere nur bei Bedarf zu konsultieren,
wieder andere reine Meta-Information für Menschen
und externe Agenten.

**Voll lesen** (in dieser Reihenfolge):

1. Instruktionsdatei — Grundregeln.
2. `wiki/Fassaden.md` — Landkarte zuerst: sie
   steuert, welche Fassaden überhaupt aktiv sind.
3. `wiki/Facts.md` — mit **Priorität auf den
   Stolperstein-Abschnitt**.
4. `Styleguide-chat.md` — Chat-Interaktion mit dem
   User (der Agent kommuniziert ab der ersten
   Ausgabe nach diesen Regeln).
5. `Offene Fragen.md` — Nacharbeit nicht vergessen.
6. `wiki/Fristen.md` — akute und abgelaufene Fristen
   erkennen (falls Fassade aktiv).
7. `Tools.md` — verfügbare MCPs und Erweiterungen,
   inkl. Kategorien „Prüf-Werkzeuge",
   „Recherche-Werkzeuge", „Sub-Agent-Werkzeuge",
   „Kadenz-Werkzeuge" und „Projekt-Skripte"
   (siehe §5.6, §6.1, §7, §1.9).
8. `TODO.md` — für Überblick in Phase D.

**Registrieren** (Existenz + Kopfzeile, bei Bedarf
konsultieren):

- Styleguides (`Styleguide.md`, `Styleguide-project.md`,
  `Styleguide-md.md`, `Styleguide-wiki.md`) — bei
  Schreibvorgängen.
- Indizes (`index.md`, `index-output.md`,
  `index-overview.md`, `wiki/index.md`) — bei
  Bestandsfragen.
- `wiki/InterneMechanik.md` samt ihren
  `internal-*`-Detail-Knoten — bei Fragen zur
  Betriebs-Konfiguration und zu Steuerungs-Regeln.
- die übrigen aktiven Fassaden laut
  `wiki/Fassaden.md` (z.B. Chronologie,
  Aktenzeichen, Ansprechpartner, Glossar,
  Glossar Review, Knotentypen, Agent-Berichte,
  Rechercheartefakte, Eingangsdokumente) — bei
  Bedarf.
- Prozess-Steckbriefe werden bei Bedarf im Init
  (Phase D Turn 1) per Scan von
  `referenzprozesse/*/Steckbrief.md` gelesen
  (Wiki.md §11.2); Phase B lädt sie nicht vorab.

**Nicht auto-gelesen** (für Menschen und externe
Agenten):

- `wiki/Mission Statement.md`,
  `wiki/Mission Statement Long.md`.

**Vor dem Init noch nicht vorhanden:**
`Styleguide-chat.md` und `Tools.md` entstehen erst
im Init — ihr Fehlen vor bzw. während des Init ist
kein Befund.

**Nicht existente Fassaden:** Der Agent prüft, ob sie
in `wiki/Fassaden.md` als **deaktiviert** geführt
sind. Falls ja: kein Befund. Falls nein: für Phase D
vormerken.

**Konfigurations-Sync:** Der Agent prüft Konsistenz
zwischen den kanonischen Quellen —
`wiki/Fassaden.md` (Fassaden-Status) und den
`internal-rule`-Knoten der InterneMechanik
(Betriebs-Konfiguration: [[Aktivierter-Prozess]],
[[WorkspaceManager-Kontrakt]], [[Commit-Sprache]]) —
und der gespiegelten Konfigurations-Übersicht in
seiner Instruktionsdatei. Die Übersicht in der
Instruktionsdatei ist automatisch generiert und
trägt einen entsprechenden Warntext-Header
(siehe §8.3).

Bei Drift überschreibt der Agent **nicht still**,
sondern legt den Konflikt in Phase D als **Frage**
vor: "Ich sehe eine Diskrepanz — die Quelle sagt X,
die Instruktionsdatei sagt Y. Welcher Stand gilt?"
Nach User-Antwort:

- **Quelle gilt:** Agent synct in die
  Instruktionsdatei (Standardfall).
- **Instruktionsdatei gilt:** Agent pflegt die
  User-Änderung in die Quelle (`wiki/Fassaden.md`
  bzw. `internal-rule`-Knoten) und synct dann
  zurück.

Beide Wege werden im Erledigt-Block gemeldet.

**Init-Zusatz:** Wenn beim Init `raw/` oder `input/`
bereits Dateien enthalten, scannt der Agent diese
Eingangsdokumente **so weit, wie nötig, um den
Projektcharakter zu erfassen** (kleine Textdateien
voll, bei großen die ersten Seiten oder den Kopf).
Daraus werden in Phase D **Entwürfe** für
Instruktionsdatei, `wiki/Facts.md` und ggf. weitere
Setup-Dateien abgeleitet — nicht Fragen an den User
(§5.1.0).

#### Phase C — Abgleiche und Frist-Check

Technische Abgleiche; alle erzeugen nur Vormerkungen
für Phase D. Leitlinie: **lieber einen Hinweis mehr
als einen zu wenig.**

**C1 raw/ ↔ input/raw/:**

- Fehlende Konvertierungen → Phase D. **Falls WM
  für Konvertierung vorhanden** (siehe
  [[WorkspaceManager-Kontrakt]]): WM-Lauf anbieten.
  **Sonst:**
  Selbst-Konvertierung on demand anbieten
  (§1.3.1 Fallback).
- Aktualität: `input/raw/`-Datei älter als
  `raw/`-Datei → Phase D (analog).

**C2 docsources.yml ↔ input/<name>/:**

- Falls `docsources.yml` existiert: abgleichen.
- Fehlende oder veraltete Konvertierungen → Phase D.
- Fehlende `docsources.yml` → Hinweis in Phase D.

**C3 input/ ↔ wiki/ Drift-Check:**

- Wiki-Knoten vom Typ `document` scannen
  (Frontmatter `source_text`, `ingested_at`).
- `input/`-Dateien ohne Wiki-Knoten → Ingest-
  Kandidaten.
- `input/`-Dateien jünger als `ingested_at` → Re-
  Ingest-Kandidaten.

**C4 Frist-Lebenszyklus-Check:**

- Alle `deadline`-Knoten mit `status: offen` und
  `due < heute` finden.
- Statuswechsel auf `abgelaufen` (Standardaufgabe),
  Fassaden-Eintrag in Sektion `## Abgelaufen`
  verschieben, Chronologie-Vermerk "Frist
  abgelaufen" anlegen.
- Bei registrierten externen Fristensammlern
  (Fristen.md, Sektion `## Externe Fristensammler`):
  offene Fristen ohne „Gespiegelt:"-Vermerk melden
  und den Nachzug anbieten; bei Sammlern im Modus
  **Vollspiegelung** zusätzlich anstehende
  Statuswechsel-Nachführungen ausführen.
- Meldung im Erledigt-Block: "N Fristen seit letzter
  Session abgelaufen: [Liste]".
- **Zusätzlicher Trigger:** bei erstem User-Input an
  einem neuen Tag während einer laufenden Session
  (Datum-Vergleich per System-Reminder).

**C5 Register-Lebenszyklus-Check** (nur aktiv, wenn
mindestens eine Register-Fassade aktiv ist — Basis:
Entscheidungen, Ideen; Prozess-Register wie
Anforderungen/Fehlermeldungen nach Merge — Status
siehe `wiki/Fassaden.md`):

- Alle Register-Detail-Knoten (Basis: `decision`, `idea`;
  mit SP-1 zusätzlich `requirement`, `bug-report`; von
  weiteren Prozessen mitgebracht) und ihre Fassaden-
  Einträge mit `trigger` prüfen — Datum **oder**
  Zielmarken-Bezeichnung ([[Zielmarken]]): wenn
  Trigger-Datum ≤ heute oder die Trigger-Marke die
  aktuelle `in-progress`-Marke ist (Marken-Zweig
  nur bei aktivierter Fassade Zielmarken),
  Statuswechsel
  `aufgeschoben` → `offen` (Standardaufgabe), Fassade
  nachziehen
  (Fassaden-Nachzug im selben Zug, siehe §5.4).
- Meldung im Erledigt-Block **nur bei Befund**; bei
  leerem Befund keine Ausgabe (kein Rauschen).
- **Zusätzlicher Trigger:** bei erstem User-Input an
  einem neuen Tag während einer laufenden Session
  (Datum-Vergleich per System-Reminder, analog C4).

C5 ist eine Wächter-Ausprägung (Basis-Trigger T1).
Der Wächter läuft darüber hinaus auf User-Anfrage
(T3, Basis) und — mit SP-1 — an Prozess-Meilensteinen
(T2) — siehe §5.4 „Wächter-Trigger".

**C6 Wiki-Struktur-Wächter** (regulärer Start nach
abgeschlossenem Init):

- Keine zwei Dateien gleichen Namens nach dem Merge
  über Basis- und aktive Prozess-Wikis — sonst
  Vormerkung Phase D.
- `wiki/Fassaden.md`-Status und `active:`-Frontmatter
  der Fassaden-Dateien sind synchron — sonst
  Vormerkung Phase D.
- **Stale-Fassaden-Check (DEC-212):** die jüngste
  `**Stand:**`-Zeile der aktiven Fassaden gegen die
  jüngste Arbeits-Aktivität (`git log`) halten —
  liegt mehr als ein Arbeitstag Aktivität ohne
  jede Fassaden-Pflege dazwischen, Befund im
  Erledigt-Block plus Nachzugs-Angebot.
- **Root-Inventar:** jeder von der KI verwaltete
  Nicht-Standard-Ordner im Root hat eine
  Freigabe-Buchung im Entscheidungs-Register (§1.1)
  — sonst Meldung im Erledigt-Block (melden, nicht
  blockieren; User-eigene Unterordner ohne
  KI-Verwaltung und Plattform-Konventions-Pfade
  nach der §1.1-Öffnungsklausel sind kein Befund).

**C7 Trigger-Hygiene-Wächter** (regulärer Start nach
abgeschlossenem Init; berichtet nur, blockiert nie —
[[Berichten-statt-Blockieren]]; Historie wird nicht
umgeschrieben, Ziel ist „ab jetzt wieder konform"):

- **Commit-Hygiene:** `git log` seit dem letzten
  Sessionstart auf Präfix-Konformität prüfen
  (Basis-Präfix-Katalog in [[Commit-Prozedur]],
  Zeiger in §6.2; Prozess-Präfixe,
  [[Projekt-Präfixe]]). Abweichungen zählen und
  melden; zeigt sich ein wiederkehrendes freies
  Präfix-Muster (z.B. Modul-Namen), die Deklaration
  als Projekt-Präfix anbieten.
- **Review-Trigger:** (a) im Register
  `wiki/Agent-Berichte.md` bzw.
  `wiki/Rechercheartefakte.md` vergebene REP-/
  REC-IDs ohne abgelegten Detail-Knoten melden;
  (b) seit dem letzten Start gebuchte Freigaben
  ohne zugehörigen Prüf-Bericht melden (§5.6
  Prüf-Pflichten sind Angebots-Sache — gemeldet
  wird die Lücke, nicht nachträglich blockiert);
  (c) Versandstand-Ordner in `outgoing/` ohne
  gefülltes `review:`-Feld melden (Outgoing.md
  §3.2 — Pflicht-Angebot vor Versand, §5.6).
- **Handoff-Hygiene:** liegt der letzte
  `wiki/Chronologie.md`-Eintrag erkennbar vor dem
  letzten Arbeits-Commit oder ist ein vorhandenes
  `devstate_active.md` älter als der letzte
  Code-Commit → Rückstand melden und den Nachzug
  anbieten (§9.2 — der verpasste Handoff-Moment von
  gestern wird zur sichtbaren Lücke von heute).
- **Fassaden-Kandidaten:** eine Serie gleichartiger
  Detail-Knoten ohne Register-Fassade (und ohne
  vertagten Ideen-Eintrag dazu) → als Beobachtung
  melden; das Promotions-Angebot folgt der Regel
  Wiki.md §3a „Fassaden-Promotion".
- **Recherche-Trigger:** offene R-Angebote der
  aktuellen Prozess-Phase (Tabelle „Angebote an
  Phasen" des aktiven Prozesses), zu denen weder
  ein REC-Eintrag noch eine dokumentierte
  „Keine Recherche"-Entscheidung existiert, als
  offenes Angebot in Erinnerung bringen.
- Meldung im Erledigt-Block **nur bei Befund**
  (kein Rauschen).

**Bewusst nicht Teil:** `output/`, `overview/`,
`outgoing/` (dort gibt es keinen Drift) sowie
Lint-Workflow (siehe `Wiki.md`, auf Anfrage oder
vor Snapshot).

#### Phase D — Ausgabe an den User

Die Befunde aus A bis C werden in einer einzigen
Nachricht zusammengefasst — in **drei strikt
getrennten Abschnitten**.

**Beim Init ist Phase D ein mehrstufiger Ablauf**
über mehrere Turns: Turn 0 Init-Fahrplan nach
[[Fahrplan-Vorlage]]; Turn 1 Basis-Fragen; Turn 2
Umsetzung mit Prozess-Merge und
Fassaden-Auswahl-Vorlage; Turn 3
Fassaden-Umsetzung; danach Konzept-Angebot,
Mission-Statement-Setup und Abschluss-Turn. Die
vollständige Turn-Choreografie samt
Frage-Bausteinen: [[Init-Choreografie]] — beim Init
lesen (beim allerersten Init über die
Template-Quelle erreichbar).

Im **regulären Sessionstart** (nicht Init) ist Phase
D **ein einziger Turn** — Erledigt + Aktion + ggf.
Frage.

**Ausgabeformat:**

```
Erledigt:
- …

Aktion (mache ich als Nächstes, sofern kein Veto):
- …

Frage (brauche ich von dir):
- …
```

**Regel:** Keine Phasen- oder Paragraphen-Nomenklatur
(`D1`, `D4`, `§5.3`) im User-facing Output — Phasen
sind agent-intern. Der User sieht nur die Substanz.

**Regel:** Keine Vermischung innerhalb der Abschnitte.
Fragen stehen ausschließlich im Frage-Block; alles
Ableitbare landet als Entwurfsvorschlag im
Aktion-Block (§5.1.0).

##### Erledigt

Was der Agent in Phase A–C tatsächlich getan oder
festgestellt hat — reine Statusmeldung, keine offenen
Punkte. Beispiele:

- Standardordner angelegt.
- `MasterPrompt.md` und Teildateien gelesen.
- git-Status geprüft (clean / dirty mit Details).
- Drift-Check Wiki durchgeführt.
- Fristen-Überblick (abgelaufen, akut ≤14 Tage,
  nächst-fällig) aus `wiki/Fristen.md`.
- TODO-Überblick und offene Fragen zur Erinnerung.

##### Aktion (ohne Rückfrage, Widerspruch möglich)

Konkrete Vorschläge, die der Agent umsetzt, wenn der
User nicht widerspricht. Typische Beispiele:

- Fehlende Pflichtabschnitte in der Instruktionsdatei
  aus gelesenen Inhalten ergänzen.
- MasterPrompt ↔ Instruktionsdatei synchronisieren.
- Bei Init: Setup-Dateien (Instruktionsdatei,
  `Styleguide-project.md`, `Styleguide-chat.md`,
  Facts-/Knotentypen-Befüllung, initiale
  Wiki-Knoten) als Entwürfe anlegen — Einzelheiten:
  [[Init-Choreografie]] §Init-Aktionen.
- Fehlende Konvertierungen in `raw/ → input/raw/`:
  bei vorhandenem WM den User bitten, den Konverter
  laufen zu lassen; sonst Selbst-Konvertierung on
  demand (§1.3.1 Fallback).
- Ingest oder Re-Ingest durchführen, falls `input/`
  gefüllt ist.
- MCPs und Erweiterungen aus einem passenden Katalog
  vorschlagen (§7).

##### Frage (nicht-ableitbare User-Eingaben)

**Im laufenden Betrieb** maximal 1–2 echte
User-Eingaben pro strukturierter Nachricht.

**Beim Init** kommen fixe Setup-Fragen in fester
Reihenfolge dazu (Turn 1: TLA, WorkspaceManager,
Prozess-Angebot, Commit-Sprache; Turn 2:
prozess-spezifische Init-Fragen und
Fassaden-Auswahl-Vorlage; ggf. weitere Fragen aus
dem Ingest der ersten Dokumente). Wortlaut,
Menü-Formate und Umsetzungs-Regeln:
[[Init-Choreografie]].

Für den laufenden Betrieb bleibt es bei den
folgenden nicht-ableitbaren Kategorien:

- Redaktionelle Stolpersteine, die aus der Erfahrung
  des Users kommen.
- Auswahl unter gleichwertigen Optionen, wenn keine
  aus den Inputs eindeutig besser ist.

Alles Übrige gehört in Aktion, nicht in Frage.

Die Schlussnotiz aus Phase E folgt unmittelbar darauf.

#### Phase E — Bereit

Nach der Phase-D-Ausgabe schließt der Agent mit einer
knappen Zeile, die den Ready-Status signalisiert:

```
Bereit für den ersten Auftrag.
```

Bei lautlosem Sessionstart (nichts erledigt, keine
Aktion, keine Frage) ersetzt die Schlussnotiz den
Phase-D-Output vollständig und wird verkürzt:

```
Sessionstart abgeschlossen. Keine offenen Punkte.
Bereit für den ersten Auftrag.
```

Danach wartet der Agent passiv. Die normalen
Arbeitsmodi (§5.1) gelten ab dieser Stelle.

### 5.4 Bei der Arbeit

- **Ausgabe-Hygiene:** bei strukturierten Nachrichten
  (Zusammenfassungen, Sessionstart, Übergabepunkte)
  **Erledigt / Aktion / Frage strikt trennen**.
  Fragen landen ausschließlich im Frage-Block;
  ableitbare Inhalte als Entwurf in den Aktion-Block
  (§5.1.0). Keine Phasen- oder Paragraphen-
  Nomenklatur im User-facing Output.
- **Progressive Disclosure.** Für Überblick und
  Kurzform lies die Übersichts-Knoten (Fassaden) in
  `wiki/`. Für vertiefte Bearbeitung, Zitat oder
  inhaltliche Prüfung folge den Wikilinks in die
  Detail-Knoten. Bei Aufgaben mit Außenwirkung
  (`output/`, `outgoing/`) ist die Detail-Version
  für Inhalt maßgeblich; für kanonische Felder ist
  die Fassade maßgeblich (Wiki.md §1.1a).
- **Wächter-Trigger** (aktiv, sobald mindestens eine
  Register-Fassade aktiv ist — Basis: Entscheidungen,
  Ideen; Prozess-Register wie Anforderungen/
  Fehlermeldungen nach Merge — Status siehe
  `wiki/Fassaden.md`): Der Wächter läuft **nicht
  am Ende jedes Zugs** — das wäre bei der
  Template-typischen Commit-Frequenz zu granular. Er
  läuft an folgenden Triggern plus einer Rückfallebene:
  - **T1 Sessionstart-Phase C5** (Basis) —
    obligatorisch, datumsbasierte Auslöser prüfen
    (siehe §5.3 Phase C5).
  - **T3 auf User-Anfrage** (Basis) — z.B. „Wächter-
    Lauf", „Register-Stand", „was ist offen".
  - **Rückfallebene: mindestens täglich** (Basis) —
    T1 wird zusätzlich bei erstem User-Input an einem
    neuen Tag während einer laufenden Session
    ausgelöst (Datum-Vergleich per System-Reminder,
    analog C4/C5).
  - **T2 Meilenstein-Vorgang** (prozess-
    spezifische Erweiterung, mit SP-1; weitere
    Prozesse können analoge T2-Trigger definieren) —
    volle Wächter-Runde bei den prozess-definierten
    Meilensteinen (z.B. Ende einer Scaffolding-
    Vorlage, Freigabe-Buchung).
  
  Ausgabeform bei Befund: Erledigt/Aktion/Frage-
  Raster. Bei leerem Befund keine Ausgabe.
- **Feld-Kanonizität (Praxisregel).** Wer ein
  kanonisches Feld ändert (Status, Sektions-Zuordnung,
  Ablösungs-Verweis), **ändert die Fassade, nicht den
  Detail-Knoten**. Detail-Knoten spiegelt. Wenn die
  Änderung dennoch am Detail-Knoten anfällt, ist der
  Fassaden-Nachzug **Standardaufgabe im selben Zug**
  (§5.1.2). Vollständige Regel und Vier-Schichten-
  Absicherung: Wiki.md §1.1a. Konkrete kanonische
  Fassaden:
  - **Frist-Status:** `wiki/Fristen.md` kanonisch
    (Wiki.md §10a). Bei Deaktivierung der Fassade
    wechselt die Kanonizität auf den `deadline`-
    Detail-Knoten.
  - **Stolpersteine:** `wiki/Facts.md` kanonisch
    gegenüber Detail-Knoten-Inhalten. Bei Widerspruch
    klärt der Agent zeitnah und pflegt den Detail-
    Knoten nach (oder aktualisiert den Stolperstein,
    wenn er veraltet ist).
- **Styleguides respektieren:**
  - **Schreibende Ausgaben** (`output/`, `overview/`,
    `outgoing/`, Wiki-Knoten): erst
    `Styleguide-project.md`, dann `Styleguide.md`,
    dann formatspezifisch (`Styleguide-md.md` oder
    `Styleguide-wiki.md`).
  - **Chat-Interaktion mit dem User:**
    `Styleguide-chat.md`.
- **Mit `wiki/` arbeiten:** Die KI liest und
  referenziert Eingangsdokumente ausschließlich über
  Wiki-Knoten, nicht direkt über `input/`.
- **Wiki-Pflege** (Index, Log, Cross-References)
  gemäß `Wiki.md`.
- **Namenskonvention einhalten** in `output/`,
  `overview/`, `outgoing/` gemäß §3.
- **Versionierung einhalten** in `output/` und
  `overview/` gemäß §4.
- **Nicht eigenmächtig umbenennen** (Ketten-ID §3.8,
  eiserne Regel für `raw/` und `input/`).
- **Chronologie pflegen** beim Ingest (siehe
  `Wiki.md`).
- **Fristen prüfen:** vor jeder Finalisierung in
  `output/` oder Erzeugung in `outgoing/` einen Blick
  in `wiki/Fristen.md` werfen, ob relevante Fristen
  akut sind.
- **TODO.md prüfen** bei relevanten Aufgaben.

### 5.5 Unsicherheiten

Bei Unsicherheit über

- Zuordnung eines Dokuments zu einem Ordner,
- korrekte Benennung,
- inhaltliche Entscheidungen,
- ob eine Aktion ausgeführt oder nur vorgeschlagen
  werden soll,

→ **nicht ausführen**, sondern fragen (Default-Modus)
bzw. in `Offene Fragen.md` dokumentieren
(Arbeitsmodus). Keine Annahmen treffen.

### 5.6 Prüf- und Rechercheangebot

Der Agent kann bei Bedarf **Prüf-Subagenten**
starten und **externe Recherche** anbieten; jede
Sub-Agent-Beauftragung, deren Ergebnis als Bericht
entstehen soll, folgt dem
Standard-Beauftragungs-Rahmen. Das vollständige
Muster (Beauftragungs-Rahmen, Standard-Prüf- und
Standard-Recherche-Prompt, Zwei-Modelle-Regel,
Angebots-Tabelle, Ingest- und Archiv-Regeln):
[[Angebots-und-Beauftragungs-Muster]] — vor jedem
Angebot und jeder Beauftragung lesen.
Subagenten-Beauftragungen referenzieren als
Einstieg die **freigegebenen Stände** der
Grundlagen-Artefakte (kanonische Freigabe-Formel,
§1.5) statt lebender Fassaden (DEC-214).

## 6. Git-Umgang

Der Agent arbeitet aktiv mit git, wenn ein Repository
vorhanden ist. Andernfalls bietet er am Setup die
Einrichtung an (§5.3). Für den Commit-Moment gilt die
Vier-Fragen-Checkliste [[Commit-Prozedur]] (Zug —
Präfix — Sprache — Kadenz-Zeile); die Regel-Substanz
steht in §6.1/§6.2.

### 6.1 Commit-Kadenz

Commits **je Zug** — ein Zug ist eine thematisch
abgeschlossene Einheit aus mehreren
Arbeitsschritten; 1 Zug = 1 Commit; Züge sind nicht
weiter bündelbar (kein „drei Züge in einem Commit").
Begriffs-Kette: Arbeitsschritt < Zug <
Meilenstein-Vorgang — Arbeitsschritt und Zug sind hier
definiert; der Meilenstein-Vorgang ist eine
prozess-spezifische Erweiterung (mit SP-1: dessen
mitgebrachter Knoten [[Meilenstein-und-T2]],
Kurzform SP-1-`index.md` §4.3). Typische Züge:

- **Ingest:** Erzeugen/Aktualisieren von
  Wiki-Knoten.
- **Output-Version:** neue `_VV_TLA`-Version in
  `output/`.
- **Overview-Version:** neue Version oder
  Snapshot in `overview/`.
- **Outgoing:** Anlegen einer `outgoing/`-Datei.
- **Wiki-Änderungen:** redaktionelle Änderungen.
- **Facts/Chronologie/Fristen:** inhaltliche
  Ergänzungen.
- **Fragen:** Änderungen an `Offene Fragen.md`.
- **Setup:** Installation/Entfernung eines MCPs
  oder einer Erweiterung.

Keine Leer-Commits.

**Am Session-Ende:** Der Agent legt einen
**abschließenden Commit** für alle Änderungen an,
die durch die Zug-Commits noch nicht
erfasst wurden — Rest-Aufräumen (z.B. redaktionelle
Kleinständerungen, aggregierte Statusnotizen), damit
die Session mit sauberem Arbeitsbaum endet. Wenn
alle Änderungen bereits committet sind, entfällt der
Abschluss-Commit.

**Werkzeug-Kadenz-Bericht:** Bei Commits, die
prozess-relevante Änderungen enthalten (was
„prozess-relevant" heißt, definiert der aktive
Prozess — z.B. Quelltext-Änderungen bei
Software-Prozessen), führt der Agent die in
`Tools.md` registrierte **Werkzeug-Kadenz** aus
(Kategorie „Kadenz-Werkzeuge", §7.5) und schreibt
das Ergebnis als Info-Zeilen in die Commit-Message
(`Tests: …`, `Lint: …`). Rote Ergebnisse blockieren
den Commit **nicht** ([[Berichten-statt-Blockieren]])
— Zwischenstands-Commits mit rotem Zustand sind
erlaubt; die Info-Zeile macht in der Historie
sichtbar, welcher Commit Zwischenstand und welcher
grüner Meilenstein war. Die Kadenz-Ausführung wird
beim Init als **Standing-Freigabe** eingerichtet
(still ausführen, Ergebnis immer zeigen); der
Anwender kann sie pro Commit ausdrücklich
abschalten. Doku-only-Commits (nur
Dokumentations-Dateien geändert) laufen ohne Kadenz.

**Scaffolding-Commit-Konvention:** Der letzte Commit
des Meilenstein-Vorgangs „Projekt startfähig machen"
trägt das englische Commit-Message-Präfix
`Initial project scaffolding` — **strikt einer pro
Repo**. Er markiert das Ende des
Startfähigkeits-Vorgangs und die Grenze für
zweistufige Prozess-Regeln (die vor und nach ihm
unterschiedlich greifen). Details in
`Vorgehen.md` §7a.

### 6.2 Commit-Nachrichten

**Format:**

```
<Präfix>: <Kurzbeschreibung>

[optional: längere Erklärung]
```

**Präfixe:** Jede Commit-Message beginnt mit einem
Präfix aus dem Basis-Katalog. Der vollständige
Basis-Präfix-Katalog steht in [[Commit-Prozedur]]
§Basis-Präfix-Katalog — beim Committen dort
nachschlagen; typische Vertreter: `Ingest:`,
`Wiki:`, `Output:`, `Report:`, `Setup:`,
`Sonstiges:`.

Prozesse können eigene Commit-Präfixe deklarieren
(führender Ort: jeweiliger Prozess-Steckbrief,
Sektion „Mitgebrachte Präfixe" — einheitlich mit den
übrigen Mitbringsel-Deklarationen, DEC-208).
**Projekte** können darüber hinaus eigene
Modul-/Bereichs-Präfixe deklarieren — Register ist der
`internal-rule`-Knoten [[Projekt-Präfixe]]
(Deklaration vor erster Verwendung, ein Satz Zweck
genügt). Undeklarierte freie Präfixe gelten als
Abweichung und werden vom Trigger-Hygiene-Wächter
(§5.3 C7) gemeldet.

**Sprache:** projektspezifisch, beim Init festgelegt
und im `internal-rule`-Knoten [[Commit-Sprache]]
persistent gehalten (siehe §5.3 Phase D Turn 1).
Optionen:

- **(A) Projektsprache für alles** — Standardwahl ohne
  Prozess (z.B. Rechtsfall). Alle Präfixe in Projektsprache.
- **(B) Sprache folgt Artefakt** — Vorauswahl bei Codeprojekt-
  Prozessen (SP-1+). Wiki-/Dokument-Präfixe (Facts,
  Chronologie, Anforderungen, Architektur, …) in
  Projektsprache; Code-nahe Präfixe (`Code:`, `Scaffolding:`)
  englisch.
- **(C) Englisch für alles** — internationalisierte
  Codeprojekte. Alle Präfixe englisch.

Bei gemischten Commits (nur unter (B)): die überwiegende
Sprache — mit kurzem Vermerk „and code" bzw. „und Doku" in
der Kurzbeschreibung.

### 6.3 Nicht committen

- Agent-spezifische lokale Konfiguration (z.B.
  `.claude/settings.local.json`).
- Temporäre Dateien und Build-Artefakte außerhalb der
  versionierten Ordner.
- Sehr große Binärinhalte in `raw/` — ggf. via
  `.gitignore` ausklammern und git-lfs nutzen.
- **Zugangsdaten und Geheimnisse** gehören in keine
  committete Datei — API-Keys, Passwörter, Tokens,
  SSH-Private-Keys, WikiJS-Credentials, SMTP-Zugänge etc.
  Bereitstellung über Umgebungsvariablen. Eine lokale
  Datei mit Werten ist zulässig, sofern sie von
  `.gitignore` erfasst ist — der Ausschluss ist
  **sicherzustellen, bevor** der erste Wert
  hineingeschrieben wird. Eine Vorlagendatei mit
  Variablennamen und Platzhaltern (ohne Werte) darf
  committet werden. Erhält der Agent Zugangsdaten im
  Klartext im Chat, schreibt er sie nur in die
  ausgeschlossene lokale Konfiguration und weist
  darauf hin, dass sie im Gesprächsverlauf stehen.

### 6.4 Push und Remote

- Der Agent pusht **nicht eigenmächtig**.
- Auf Anfrage pusht er in bestehende Remotes;
  Einrichtung neuer Remotes nur auf ausdrückliche
  Anweisung.

Für Projekte, die Werkstatt und ausgeliefertes
Produkt in getrennten Repos führen wollen, siehe das
Muster [[Two-Repo-Submodul-Muster]].

### 6.5 Orthogonalität zur `_VV_TLA`-Kette

Die `_VV_TLA`-Kette dokumentiert **fachliche Stände**
eines Dokuments; git dokumentiert den **technischen
Verlauf** der Projektdatei-Basis. Beide Ebenen sind
unabhängig voneinander.

## 7. MCPs und Agent-Erweiterungen

**Grundsatz:** MCPs (agent-übergreifendes Protokoll)
und Agent-Erweiterungen (Skills, Rules, Workflows —
je nach Agent) erweitern den Agenten um Werkzeuge
und Fähigkeiten. Der Agent installiert MCPs und
Erweiterungen **nicht eigenmächtig**. Er fragt und
darf **aktiv vorschlagen**, was zum Projekt passt.
Begriffsklärung, Frage-Momente (Init, ad-hoc) und
empfohlener Startkatalog: [[MCP-Setup]] — beim
Setup und bei neuem Werkzeug-Bedarf lesen. Jede
Installation wird in `Tools.md` dokumentiert (§7.5).

### 7.5 Dokumentation: Tools.md

Alle installierten MCPs und Erweiterungen werden in
`Tools.md` dokumentiert. Das Gerüst mit allen
Kategorien (MCPs, Erweiterungen, Prüf-Werkzeuge,
Recherche-Werkzeuge, Sub-Agent-Werkzeuge,
Kadenz-Werkzeuge, Projekt-Skripte) liegt als
Kopiervorlage unter
`wiki/templates/Tools-Vorlage.md` — bei Anlage von
`Tools.md` kopieren und die Beispiele ersetzen.

## 8. KI-Agent-Instruktionsdatei

### 8.1 Grundsatz: KI-Agnostik

Der MasterPrompt ist **KI-agnostisch**. Jeder Agent
erzeugt daraus **seine eigene native
Instruktionsdatei**:

| Agent | Instruktionsdatei |
|---|---|
| Claude Code | `CLAUDE.md` |
| Cursor | `.cursorrules` |
| Windsurf | `.windsurfrules` oder `.windsurf/rules` |

Mehrere solche Dateien dürfen im selben Projekt
koexistieren. Alle sind abgeleitete Sichten auf
denselben MasterPrompt.

Dieselbe Agnostik gilt für die **Mechanismen**: der
Agent adaptiert jede beschriebene Prozedur auf seine
lokalen Werkzeuge und agenten-spezifischen
Mechanismen (Adaptions-Pflicht, Kopf-Abschnitt) und
hält die Adaption in `Tools.md` bzw. der
Instruktionsdatei fest.

### 8.2 Rolle

Die Instruktionsdatei wird beim Sessionstart
**automatisch** geladen und ist der verpflichtende
Minimal-Kontext vor der ersten User-Nachricht — im
Gegensatz zum MasterPrompt, der nur auf Anweisung
gelesen wird. Details: [[Instruktionsdatei-Pflege]].

### 8.3 Pflichtabschnitte

Jede Instruktionsdatei enthält verbindlich die
Pflichtabschnitte Projekt-Identifikation, eiserne
Regeln, Detail-Referenzen, Arbeitsmodi- und
git-Verweise, Projektsprache, projektspezifische
Besonderheiten sowie die Konfigurations-Übersicht
mit Warntext-Header. Vollständige Liste samt
Warntext-Wortlaut: [[Instruktionsdatei-Pflege]] —
bei Anlage und Abgleich der Instruktionsdatei lesen.

### 8.4 Synchronisation

Bei geändertem MasterPrompt werden die
Instruktionsdateien nachgezogen; jeder Agent ist nur
für **seine** Datei zuständig. Ablauf:
[[Instruktionsdatei-Pflege]].

## 9. Wahrheits-Hygiene

**Das `wiki/` ist die Quelle der Wahrheit dieses
Projekts.** Alles Besprochene, Entschiedene und
Erarbeitete muss dort abgelegt sein — was nicht im
`wiki/` steht, ist nicht festgelegt. Die laufende
Unterhaltung ist Arbeitsspeicher, nicht Quelle: sie
wird beim Verdichten lückenhaft. Daraus folgen zwei
Pflichten (DEC-212):

- **Lese-Pflicht:** vor jeder Behauptung über eine
  Festlegung und vor jeder Frage an den Anwender
  wird im `wiki/` nachgeschlagen.
  Festlegungs-Behauptungen nennen ihre REQ-/DEC-
  (bzw. Register-)Nummer — ohne Nummer ist es eine
  Erinnerung, und Erinnerungen werden erst geprüft,
  dann ausgesprochen. Fragen nennen, wo gesucht
  wurde.
- **Pflege-Pflicht:** neue Klärungen, Berichte und
  Stände werden **im selben Zug** abgelegt —
  Berichte vor der Chat-Zusammenfassung, Fassaden
  im Arbeits-Rhythmus (C6 wacht über
  Stand-Zeilen-Alter).

Grundprinzip dahinter: **Wissen lebt auf der Platte,
nicht im Kopf.** Wer die Session fortsetzt (der gleiche Agent
nach Compact, ein neuer Agent nach Session-Ende, der
User in einer späteren Session), muss durch reines
Lesen der Dateien den vollen Wahrheitsstand
rekonstruieren können. Die folgenden Regeln stellen
das operativ sicher.

**Wahrheits-Hierarchie:** Das Entscheidungs-Register
(`wiki/Entscheidungen.md`) trägt die
Entscheidungs-Wahrheit; die Fassaden tragen die
Status- und Sollzustands-Wahrheit (Wiki.md §1.1a);
eingefrorene Stände (`output/`, `overview/`,
`research/`, REP-/REC-Knoten) sind Nachweis. Alle
übrigen Dokumente werden aus dieser Wahrheit
gepflegt — nie umgekehrt.

### 9.1 Doku-Pflicht bei Klärung

Was in einer Session zwischen User und Agent
**mündlich geklärt wird, wandert sofort in eine
Datei** — nicht auf spätere Audits verschoben, nicht
im Kopf gelassen, nicht implizit im Chat-Verlauf
verankert.

Zielort je nach Klärung:

- Neue Projekt-Wahrheit → DEC-Register-Eintrag
  (`wiki/Entscheidungen.md`), dünn oder mit
  Detail-Knoten — Konventionen siehe `## Meta` der
  Fassade [[Entscheidungen]].
- Prozess-spezifische Wahrheit (Klärungen zur
  Anwendung des aktiven Prozesses in diesem
  Projekt) → als Entscheidung ins DEC-Register,
  bei Bedarf mit Verweis im `internal-rule`-Knoten
  [[Aktivierter-Prozess]]. `referenzprozesse/` ist
  in beiden Anbindungs-Modi Nur-Lese (§1) —
  Befunde, die das Prozess-Template selbst
  verbessern würden, werden als Ideen-Eintrag
  (`wiki/Ideen.md`) festgehalten und dem
  Template-Betreiber über den Update-Weg
  (README §Template aktualisieren) zurückgemeldet.
- Terminologische Klarstellung → `wiki/Glossar.md`
  (Kurzform) und/oder `concept`-Knoten (erweitert).
- User-Kondensat gegen Agent-Fehlkonzept →
  `wiki/Facts.md`, **nur auf explizite Anwender-
  Anweisung** (siehe §9.4).

**Zeitpunkt:** unmittelbar nach der Klärung im
gleichen Session-Turn, spätestens vor dem nächsten
inhaltlich weiterführenden Schritt. Nicht auf „das
machen wir später" verschieben — das verlängert die
Lücke und der nächste Agent kann die Klärung nicht
rekonstruieren.

### 9.2 Handoff-Zustand und Wahrheits-Konsolidierung

Der **Handoff-Zustand**: alles ist auf die Platte
geschrieben, sodass ein anderer Agent nahtlos
weiterarbeiten kann — ohne diesen Chat. Vor jedem
**Handoff-Moment** (T1 Session-Resume-Vorbereitung,
T2 User-Aufforderung, T3 Sub-Agent-Beauftragung,
T4 Prozess-Merge und Prozess-Upgrade) stellt der
Agent diesen Zustand aktiv her. Prüf-Frage,
Moment-Definitionen und die
Standard-Konsolidierungs-Aktionen samt
Handoff-Commit: [[Handoff-Prozedur]] — an
Handoff-Momenten lesen.

### 9.3 Thematische Listen: ein führender Ort

Wenn ein Thema als **enumerierende Liste** dargestellt
wird (Kategorien, Typen, Trigger, Regel-Bereiche,
Katalog-Elemente), lebt diese Liste an **genau einem
Ort** — dem führenden Ort. Alle anderen Erwähnungen
sind **Verweise** (Wikilink, Markdown-Link, Prosa-
Zeiger), keine Kopien.

**Auslegungs-Heuristik:** „Muss ich beim Erweitern von
Ort A auch Ort B nachtragen?" → wenn ja: Verstoß;
Ort A führt, Ort B verweist.

**Ausnahmen:**

- **Konfigurations-Anzeigen** (welche der katalogisierten
  Elemente sind hier aktiv, welche Anwender-Konfiguration
  gilt) sind keine Definitions-Liste, sondern
  Anwendung; dürfen die Elemente nennen, sollten aber
  Verweis-Charakter auf den Katalog tragen. Beispiel:
  `wiki/Fassaden.md` zeigt den Aktivierungs-Status
  der Fassaden — der Katalog aller möglichen
  Fassaden lebt in `Wiki.md` §3a.
- **Aggregat-Zeiger** („aktuell 107 DECs im Register")
  sind erlaubt (Zahl ist Kern-Aussage).

**Migration nicht flächendeckend** — nur bei
Berührung; analog zur Anzahl-Ansage-Regel in
`Styleguide-md.md` §3.1.

### 9.4 Umgang mit Facts.md

`wiki/Facts.md` ist **Anwender-Terrain** mit zwei
Regel-Aspekten:

**(1) Autorschaft.** Der Anwender ist der einzige
inhaltliche Autor. Der Agent editiert Facts
**ausschließlich auf explizite Anweisung** („trage
in Facts ein, dass …", „aktualisiere Facts-Stand",
„reaktiviere die Fristen-Fassade"). Kein
selbständiger Nachtrag — auch nicht wenn der Agent
die Information für nützlich hält. Wenn dem Agent
eine Info in Facts fehlt, schlägt er sie dem
Anwender vor; erst nach Freigabe wird sie
eingetragen. Ausnahme: rein technische Frontmatter-
Wartung (Aktivierungs-Prozeduren, `active`-Feld).

**(2) Inhaltscharakter.** Facts trägt **Kondensat** —
prominent platzierte Klarstellungen, die der
Anwender für so wichtig hält, dass sie beim
Sessionstart hoch priorisiert gelesen werden.
Zweck: hartnäckige Agent-Fehlkonzepte durch
prominente Anwender-Aussagen überschreiben.

- **Kein Verweis-Charakter:** Facts trägt keine
  Zeiger auf zusätzliche Datenmengen. Wenn eine
  Wahrheit an einem anderen Ort lebt, wird sie
  entweder dort gelassen (und Facts erwähnt sie
  nicht) oder als Kondensat in Facts formuliert.
- **Kein Aggregat / keine Bilanz:** Session-
  Bilanzen, Register-Gesamtstand-Zählungen und
  Chronologie-Zusammenfassungen gehören in die
  entsprechenden Fassaden (Chronologie,
  Entscheidungen), nicht in Facts.

Konfiguration lebt nicht in Facts: Fassaden-Status
führt `wiki/Fassaden.md`, Betriebs-Konfiguration
(Prozess-Wahl, WM-Rollen, Commit-Sprache) die
`internal-rule`-Knoten der InterneMechanik.

### 9.5 Geschlossene Verweise

Der Basisrahmen (dieser MasterPrompt, seine
Teildateien, das Basis-Wiki) arbeitet mit
**geschlossenen Verweisen**. Erlaubt sind:

- interne §-Verweise innerhalb eines Dokuments,
- Verweise auf andere Basisrahmen-Dateien
  (`Wiki.md`, `Vorgehen.md`, `Reviewmuster.md`,
  Styleguides, …),
- Wikilinks zwischen Basisrahmen-Wiki-Knoten,
- externe URLs als Beleg oder Vertiefung.

Nicht erlaubt sind Verweise auf Dokumente außerhalb
des Repos, die zum Verständnis nötig wären — jede
Regel steht vollständig im Text.

Klarstellung: eine Regel, die als eigener
Detail-Knoten im Anwender-`wiki/` liegt (z.B. ein
`internal-rule`-Knoten), gilt als vollständig im
Basisrahmen enthalten; verboten bleiben nur
Verweise, die aus dem Basisrahmen hinausführen.

### 9.6 Selbsttragende Dokumente

**Prüfregel:** Jedes Dokument im Repo bleibt
verständlich und befolgbar, wenn jeder Verweis nach
außen ins Leere zeigt. Externes Wissen wird mit
Aussage und Begründung hereingeholt (z.B. per
Konzept-Übernahme, §5.3 Phase D); externe Verweise
sind Belege oder Vertiefung, nie
Verständnisvoraussetzung. **Redundanz ist dafür
ausdrücklich zulässig.**

**Zwei Geschlossenheits-Grade (DEC-214):**
**wiki-verweisend** für interne Arbeits-Dokumente
(Spezifikation, Architekturdokument — der Leser ist
ein Agent mit Repo-Zugang; Details und Begründungen
bleiben im wiki, das Dokument verweist:
Kontextfenster-Schutz). **Selbsttragend** für
Außen-Dokumente (Benutzer-/Entwicklerdoku und alles
an Empfänger ohne Repo-Zugang — kein Verweis als
Verständnis-Voraussetzung). Die Prüfregel oben gilt
in voller Schärfe für den selbsttragenden Grad.

Daraus folgen vier Arbeitsregeln:

- **Anweisungen selbsttragend.** Eine Anweisung, die
  einzeln weitergegeben werden kann, ist auch
  gegenüber den übrigen Dateien selbsttragend.
  Verweise auf Nummern oder Abschnitte anderer
  Dokumente stehen nur als Herkunftsvermerk in
  Klammern und dürfen zum Befolgen nicht nötig
  sein — Aussage und Regel stehen ausgeschrieben in
  der Anweisung selbst.
- **Entscheidungs-Kern inline.** Wo ein Dokument
  sich auf eine Entscheidung stützt, stehen Aussage
  und Begründung im Dokument selbst; ein Verweis auf
  das Entscheidungs-Register ist Wartungsvermerk,
  nie Verständnisvoraussetzung.
- **Redundanz wird gepflegt, nicht vermieden.** Weil
  Wissen bewusst mehrfach im Repo steht, gehört zu
  jeder inhaltlichen Änderung die Frage, welche
  anderen Stellen sie berührt — und die Antwort
  gehört in denselben Zug. Der Anwender benennt die
  für sein Projekt wichtigen Paarungen und pflegt
  sie explizit. Typische Paarungen: Fassade ↔
  Detail-Knoten (Wiki.md §1.1a);
  `wiki/Fassaden.md`-Status ↔ `active:`-Frontmatter
  der Fassaden-Dateien; Instruktionsdatei-Spiegel ↔
  seine Quellen (§8.3).
- **Erzeugtes ist als erzeugt gekennzeichnet.** Wo
  Dateien aus anderen Dateien erzeugt werden
  (aufgeteilte Dokumente, Verzeichnisse,
  Übersichten), tragen sie einen sichtbaren Hinweis
  „automatisch erzeugt aus X" am Anfang und benennen
  die führende Quelle; Änderungen geschehen
  ausschließlich an der Quelle (Beispiel: die
  Konfigurations-Übersicht in der
  Instruktionsdatei, §8.3).
