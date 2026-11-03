# MasterPrompt — Projektkonventionen für KI-gestützte Arbeit

**Bearbeitungsstand: 2026-10-25**

Dieses Dokument ist die **KI-agnostische Quelle** aller
Konventionen für die Zusammenarbeit zwischen User und
KI-Agent in einem Projekt, das auf diesem Template
basiert.

Der MasterPrompt wird **nur auf explizite Anweisung**
des Users gelesen. Die beim Sessionstart automatisch
geladene Datei ist die **agent-spezifische
Instruktionsdatei** (siehe §8), die aus dem MasterPrompt
abgeleitet wird.

**Adaptions-Pflicht:** Alle hier und in den
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
  Typen und Katalog, Knoten-Aufbau, Index, Log,
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
├── _template/                    ← Template-Quelle, Nur-Lese, beide Modi
│   └── referenzprozesse/         ← Prozess-Vorlagen (siehe Anbindungs-Modi)
│       ├── base/
│       │   ├── bootstrap/        ← Einmal-Anweisungen je Fassade (nie kopiert; Wiki.md §11)
│       │   └── wiki/             ← Basis-Fassaden-Skelette
│       ├── SP-1-Standardprozess/ ← ausgearbeiteter Prozess
│       ├── RP-1-Systementwicklung/ ← ausgearbeiteter Prozess
│       └── <weitere>/            ← Platzhalter mit `status: geplant`
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
│   ├── Katalog.md                ← Katalog der Typen (Meta-Fassade) [mandatory]
│   ├── Katalog-<Name>.md         ← Katalog-Einträge (je Register bzw. Einzeltyp)
│   ├── Fassaden.md               ← FassadenLandkarte [mandatory]
│   ├── InterneMechanik.md        ← Steuerungs-Wissen [mandatory]
│   ├── Zielmarken.md             ← Marken als Zwischenziel-Anker [mandatory]
│   ├── Entscheidungen.md         ← Entscheidungen, Freigaben, Marken-Wechsel [mandatory]
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
Anwender, wie das Template ins Projekt kommt: als
Einmal-Kopie (Modus A) oder als git-Submodul (Modus B)
unter `_template/`. Die beiden Modi, ihre
Update-Mechanik und was danach ins Projekt kopiert
wird: [[Init-Choreografie]] §Phase A0 — lesen beim
Init und vor einem Template-Update; den Update-Weg
eines bestehenden Projekts (über den Starter) nennt
`README.md` §Template aktualisieren.

In beiden Modi ist `_template/` die Template-Quelle.
`referenzprozesse/` bleibt in
`_template/referenzprozesse/` (keine Kopie ins
Anwender-Root) und ist **Nur-Lese** — zulässige
Lese-Zugriffe sind unter anderem der Steckbrief-Scan
beim Init, das Lesen als Merge-Quelle (Wiki.md §11.3),
die Bootstrap-Abarbeitung (Wiki.md §3a, §11.3
Schritt 5), das Lesen der Prozess-Definition
(`index.md`, `Steckbrief.md`) und nicht gemergter
Prozess-Knoten, auf die ein Zeiger im Wiki verweist,
sowie der Aufruf von `_template/tools/lint.sh`. Der
Agent schreibt dort nie.

### 1.1 Root-Verzeichnis

Im Root liegen alle Markdown-Arbeitsdokumente,
Styleguides, Index-Dateien und Steuerdateien. Die
Ordner `raw/`, `input/`, `research/`, `tools/`,
`wiki/`, `output/`, `overview/` und `outgoing/` werden
von der KI verwaltet und folgen den Konventionen dieses
Dokuments und seiner Teildateien. Daneben liegt in
beiden Anbindungs-Modi `_template/` — die
Template-Quelle, Nur-Lese, kein KI-verwalteter
Arbeitsordner (Anbindungs-Modi, §1).

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
  §11.3; beim Init erst, nachdem die erste Marke
  angelegt ist — der Eintrag trägt `zielmarke:`,
  [[Init-Choreografie]] §Phase D Turn 3). Das
  Arbeiten nach einem
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
  `Katalog.md`, `Mission Statement.md`,
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

**Progressive Disclosure:** wie Fassaden und
Detail-Knoten zusammen gelesen werden: §5.4 — lesen,
bevor aus dem Wiki eine inhaltliche Aussage
abgeleitet wird.

### 1.5 output/

Enthält **eingefrorene Übergabe-Stände**: inhaltliche
Ausgangsdokumente (Stellungnahmen, Angebote, Briefe,
Berichte) **und** Übergaben an andere Agenten oder
Repos (z.B. Startprompts, Deploy-Stände, Testpläne
in Mehr-Repo-Prozessen) — Übergabe ist Übergabe,
unabhängig davon, ob ein Mensch oder ein Agent
empfängt. Dokumente in `output/` werden
**versioniert** (siehe §4; vor jedem Schreiben in
`output/` §4.3 und §4.4 lesen). Das Verzeichnis wird
von KI und User gemeinsam genutzt.

**Dreiklang:** Register-Wissen hat drei Ebenen — die
**Fassade** (lebend) und ihre **Elemente**
(eingefroren ab ihrem Freeze-Zeitpunkt) liegen im
`wiki/`, der **Stand** je Dokumenttyp ist das
abgeleitete, versionierte Dokument hier — mit einem von
zwei Graden, wiki-verweisend oder selbsttragend (§9.6;
ein selbsttragender Stand, etwa eine Benutzer-Doku,
verweist auf keine Elemente, sondern ist aus
eingefrorenen Quell-Ständen ausformuliert,
[[Einfrieren-und-Abloesen]] §Stand). Was lebt,
lebt im `wiki/` — `output/` friert ein. **Der Stand
ist der einzige Ort einer Zweck-Freigabe; Ausnahme
ist der Tag** (Kernsatz der Freigabe und was mit ihr
einfriert: `Vorgehen.md` §4 „Freigabe-Regel“). Die Vorlage an den
Anwender ist immer der Stand hier, einen Entwurf
daneben gibt es nicht; ein Stand trägt im Namen weder
Absender noch Empfänger (§3.1, §3.2) und kein
Status-Wort (§3.9). Wann ein
Artefakt seinen Stand erhalten muss und wie eine
Freigabe an ihn gebunden und gebucht wird
(Stand-Zwang, Freigabe-Formel): `Vorgehen.md` §4 —
lesen vor jeder Freigabe; der Ablauf vom ersten
Element bis nach der Freigabe:
[[Lebenslauf-eines-Stands]] — lesen, sobald in einer
Phase das erste Element entsteht.

- **Herkunftszeile:** im Kopf jedes Stands stehen
  Marke, Datum, Zweck und Herkunft als
  Frontmatter-Felder (`marke`, `datum`, `zweck`,
  `herkunft`; selbsttragende
  Ableitungen `marke`, `quell_stand`) — Bedeutung und
  Format: [[Einfrieren-und-Abloesen]] §Stand, lesen
  beim Anlegen eines Stands.
- **Kopien:** Kopien der nicht eingefrorenen Knoten
  und der lebenden Quellen liegen neben dem Stand in
  `output/<Ketten-ID>_VV_TLA/` (Dateiname des Stands
  ohne Endung) — was kopiert wird und wie es
  gekennzeichnet ist: [[Einfrieren-und-Abloesen]]
  §Kopien.
- **Überholte Stände** werden abgeleitet, nicht
  gebucht (Lint berechnet, C5 meldet) —
  [[Einfrieren-und-Abloesen]] §Überholt-Regel, lesen,
  wenn ein verwiesenes Element abgelöst wird.
- **Nachrichten** an andere Repos im Verbund liegen in
  `output/nachrichten/` des Absenders, ohne `_VV_TLA`:
  sie sind ab Anlage eingefroren und werden nicht
  versioniert. Felder, Nummer, Quittung und Buchung:
  [[Katalog-message]], lesen vor der ersten Nachricht.

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

**Abgrenzung:** `outgoing/` dient nur dem Versand an
Menschen. Übergaben an andere Agenten oder Repos sind
Stände in `output/`, Nachrichten im Verbund liegen in
`output/nachrichten/` (§1.5).

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

**Projekt-Werkzeuge des Agenten:**
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
  Absender und Empfänger treffen bei einem **Stand**
  (abgeleitetes Register-Dokument, §1.5) nicht zu und
  entfallen dort nach §3.2; die Marke eines Stands
  steht nur in seinem Kopf, nicht im Namen
  ([[Einfrieren-und-Abloesen]] §Stand „Dateiname“).
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
- Stand eines Dokumenttyps (ohne Absender und
  Empfänger, Gegenstand nur bei mehreren Ständen eines
  Typs je Marke):
  `<Datum> - <Dokumentname>[ - <Gegenstand>]_VV_TLA.md`

### 3.3 Eingangsdokumente (raw/, input/)

Dateien in `raw/` und `input/` behalten **immer ihre
Originalnamen** — sie werden weder umbenannt noch
verändert (eiserne Regel).

### 3.4 Wiki-Knoten (wiki/)

Eigene Namenskonvention im Obsidian-Stil (Title Case
mit Leerzeichen). Siehe `Wiki.md`.

### 3.5 output/ und overview/

Volles Schema mit Versionsteil aus §3.1. Ausnahme:
Nachrichten in `output/nachrichten/` (§1.5).

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

**Status-Wörter in Namen versionierter Dokumente:**
Namen in `output/` und `overview/` (Ketten-ID, §3.1)
tragen keine Status-Wörter wie „Entwurf“, „final“ oder
„freigegeben“. Die Ketten-ID ist unveränderlich
(§3.8) — ein Status-Wort bliebe für immer im Namen
stehen, auch wenn der Status längst ein anderer ist.
Ob und wofür ein Stand freigegeben ist, steht nur im
Freigabe-Eintrag (`Vorgehen.md` §4); einen „Entwurf“
neben dem Stand gibt es nicht (§1.5). Der Lint meldet
ein solches Wort im Namen als Hinweis.

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

Wie die Versionskette zwischen KI und User wechselt
(Nummernvergabe, Weiterarbeit auf User-Versionen,
Snapshot-Anschluss), dazu Unveränderlichkeit und was
als neue Version zählt: [[Versionsketten]] (ganzer
Knoten) — lesen bei jeder Output-Erzeugung.

### 4.4 Unveränderlichkeit versionierter Dokumente

Das Verbot, ein versioniertes Dokument in `output/`
oder `overview/` nach seiner Ablage zu überschreiben
oder zu löschen: [[Versionsketten]]
§Unveränderlichkeit — lesen vor jedem Schreiben dort,
ob neue Version, Ersetzen, Korrektur oder Löschen.

### 4.5 Was zählt als neue Version

Wann eine Änderung eine neue Version erzeugt und wann
nicht: [[Versionsketten]] §Was zählt als neue Version
— lesen vor jeder Ablage in `output/` oder
`overview/`.

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

**Fragen-Reihenfolge nach Vorfestlegungs-Stärke.**
Bleiben mehrere Fragen, ordnet der Agent sie nach der
Stärke ihrer **Vorfestlegung**: die Frage, deren
Antwort am meisten anderes festlegt, kommt zuerst.
Nach jeder Antwort prüft er, welche Folgefragen
entfallen oder ableitbar geworden sind, und stellt sie
nicht mehr. (Für die Init-Fragen gilt dieselbe Regel;
ihre Reihenfolge steht in der [[Init-Choreografie]].)

**Übersicht zuerst, Briefing-Modus anbieten.** Stehen
**etwa drei oder mehr** Klärpunkte an, zeigt der Agent
zuerst die Liste — geordnet nach Vorfestlegungs-Stärke,
je Punkt eine Zeile — und bietet den
**Briefing-Modus** an, mit kurzer Erläuterung: je Punkt
ein kurzes Briefing, Diskussion, Weitergehen erst auf
ausdrücklichen Zuruf („weiter“); Alternative ist die
Klärung aller Punkte im Block. Ohne diese Erläuterung
gibt es kein Angebot. Unter der Schwelle fragt der
Agent direkt. Eine Tabelle mit mehreren Vorschlägen
zur Freigabe zählt als Liste von Klärpunkten, auch bei
Befunden aus Subagenten-Berichten; Fachbegriffe werden
im Briefing kurz erklärt. Der Anwender kann jederzeit
wechseln („Rest im Block“); eine dauerhafte
Modus-Vorliebe wird als Projekt-Regel in
[[InterneMechanik]] gebucht.

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
  Instanzen (`Wiki.md` §11.5) — nicht, solange eine
  Zwischenmarke läuft (§5.4 „Zwischenmarke“): dann
  verweist der Agent auf die Zeit nach der Rückkehr zur
  zurückgestellten Marke. Migrations-Rückfragen
  bei Lücken sind Teil des Ablaufs (Rückfragen-Block
  nach §5.3 Phase D), keine Ausnahme von der Regel;
  wurden Instanzen migriert, folgt das
  Absicherungs-Review ohne Angebot (`Reviewmuster.md`
  §2 Schleife 2).

**Beispiel-Prüfung bei Regel-Änderung:** Ändert sich
eine im Entscheidungs-Register verankerte Regel,
prüft der Agent die davon berührten Beispiele und
Erläuterungen in den lebenden Dokumenten mit und
zieht sie nach (Standardaufgabe im selben Zug).

Wie Standardaufgaben ohne Einzel-Rückfrage ausgeführt,
gemeldet und per Veto zurückgerollt werden und wo das
endet: [[Do-first-mit-Veto]] — lesen vor der ersten
Standardaufgabe.

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
  `.gitignore` mitliefern (Kopie aus
  `_template/.gitignore`, sobald die Modus-Wahl
  `_template/` angelegt hat), Initial-Commit mit
  Präfix `Setup:` (§6.2; die Commit-Sprache ist noch
  nicht gewählt, der Präfix ist sprachneutral). Dieser
  Commit ist **nicht** der Scaffolding-Commit
  `Initial project scaffolding` (§6.1), der erst das
  Ende des Startfähigkeits-Vorgangs markiert.
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
„Lies `<Pfad zur Vorlage>/MasterPrompt.md` und setze
das Projekt entsprechend auf“ — der Startweg aus
`README.md`): direkt nach der git-Prüfung, vor
allem weiteren Init-Content, stellt der Agent die
zweistufige Modus-Frage (Anbindungs-Modi siehe §1).

Turn α — Anbindungs-Modus:

> Ich lese den Template-Pfad `<pfad>` als Zeiger auf
> ein Template. Wie soll ich das Template anbinden?
>
> - **A** — Einmal-Kopie unter `_template/`: ich
>   kopiere das Template einmalig nach `_template/`
>   und committe es mit — als Archiv des Stands, mit
>   dem dein Projekt aufgesetzt wurde; keine
>   Update-Verbindung, Updates durch bewussten
>   Austausch der Kopie.
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

Was der Agent nach der Modus-Wahl aus `_template/`
als lebende Kopien ins Anwender-Projekt übernimmt
(Kopierliste) und was dort bleibt:
[[Init-Choreografie]] §Phase A0 — lesen direkt nach
der Modus-Wahl (beim allerersten Init über die
Template-Quelle erreichbar).

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
7. `Tools.md` — verfügbare Werkzeuge und die
   Werkzeug-Wahlen des Projekts, je Kategorie
   (Kategorien: §7.5).
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
  Glossar Review, Katalog, Agent-Berichte,
  Rechercheartefakte, Eingangsdokumente) — bei
  Bedarf.
- Prozess-Steckbriefe werden bei Bedarf im Init
  (Phase D Turn 1) per Scan von
  `_template/referenzprozesse/*/Steckbrief.md` gelesen
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
mindestens ein Sammel-Register mit `aufgeschoben`
aktiv ist; aktiv-Status
siehe `wiki/Fassaden.md`). Welche Register das sind,
sagt die Sammelzustand-Zeile
ihres Katalog-Eintrags — Wert `ja` ([[Katalog]]
§Typ-Konventionen
— lesen beim Zusammenstellen der zu prüfenden
Register, auch nach jedem Prozess-Merge); auf den
beschreibenden Registern mit `offen` ohne
`aufgeschoben` (Wert `offen`) und auf
Eintritts-Registern läuft C5 nicht — dort gibt es
keinen `trigger` und nichts zu reaktivieren; was die
Werte für Status und `trigger` bedeuten:
[[Einfrieren-und-Abloesen]] §Eintrittsregel.

- Alle Detail-Knoten der Sammel-Register und ihre
  Fassaden-Einträge mit `trigger` prüfen —
  Datum **oder** Zielmarken-Bezeichnung
  ([[Zielmarken]]): wenn Trigger-Datum ≤ heute oder
  die Trigger-Marke die aktuelle `in-progress`-Marke
  ist, Statuswechsel
  `aufgeschoben` → `offen` (Standardaufgabe), Fassade
  nachziehen
  (Fassaden-Nachzug im selben Zug, Wiki.md §1.1a).
- **Überholte Stände** melden: der Lint-Kern
  berechnet, welche Stände (jüngste Version je
  Ketten-ID; für diese Berechnung liest er keine
  Freigabe) nach der Überholt-Regel mit Marken-Bezug
  ([[Einfrieren-und-Abloesen]] — der Nachfolger des
  verwiesenen Elements gilt für die Marke des Stands;
  bei der Übernahme in eine Folge-Marke gegen diese
  geprüft) überholt sind; C5 meldet sie laufend,
  nicht erst beim Marken-Wechsel — „laufend“ schließt
  den Lint-Lauf nach jeder Ablösung ein (dort
  §Ablösung). Die Antwort ist ein neuer Stand, keine
  Buchung von „überholt“.
- Meldung im Erledigt-Block **nur bei Befund**; bei
  leerem Befund keine Ausgabe (kein Rauschen).
- **Zusätzlicher Trigger:** bei erstem User-Input an
  einem neuen Tag während einer laufenden Session
  (Datum-Vergleich per System-Reminder, analog C4).

C5 ist eine Wächter-Ausprägung (Basis-Trigger T1);
zu welchen weiteren Anlässen der Wächter läuft:
§5.4 „Wächter-Trigger".

**C6 Wiki-Struktur-Wächter** (regulärer Start nach
abgeschlossenem Init):

- Keine zwei Dateien gleichen Namens nach dem Merge
  über Basis- und aktive Prozess-Wikis — sonst
  Vormerkung Phase D.
- `wiki/Fassaden.md`-Status und `active:`-Frontmatter
  der Fassaden-Dateien sind synchron — sonst
  Vormerkung Phase D.
- **Stale-Fassaden-Check** (Pflege-Pflicht, §9): die jüngste
  `**Bearbeitungsstand:**`-Zeile der aktiven Fassaden gegen die
  jüngste Arbeits-Aktivität (`git log`) halten —
  liegt mehr als ein Arbeitstag Aktivität ohne
  jede Fassaden-Pflege dazwischen, Befund im
  Erledigt-Block plus Nachzugs-Angebot.
- **Root-Inventar:** jeder von der KI verwaltete
  Nicht-Standard-Ordner im Root hat eine
  Freigabe-Buchung im Entscheidungs-Register (§1.1)
  — sonst Meldung im Erledigt-Block (melden, nicht
  blockieren; User-eigene Unterordner ohne
  KI-Verwaltung, Plattform-Konventions-Pfade
  nach der §1.1-Öffnungsklausel und die
  Template-Quelle `_template/` sind kein Befund; ein
  `referenzprozesse/` im Root dagegen ist einer —
  Prozess-Vorlagen liegen in `_template/`, §1
  Anbindungs-Modi).

**C7 Trigger-Hygiene-Wächter** (regulärer Start nach
abgeschlossenem Init; berichtet nur, blockiert nie —
[[Berichten-statt-Blockieren]]; Historie wird nicht
umgeschrieben, Ziel ist „ab jetzt wieder konform"):

- **Commit-Hygiene:** `git log` seit dem letzten
  Sessionstart auf Präfix-Konformität prüfen
  (Basis-Präfix-Katalog in [[Commit-Prozedur]],
  Zeiger in §6.2; Prozess-Präfixe,
  [[Projekt-Praefixe]]). Abweichungen zählen und
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
  dazu Prüfberichte (`review-report`), deren
  Prüf-Modell gleich dem Bau-Modell ist (`modell`
  = `bau_modell`) — **Prüf-Modell = Bau-Modell**
  melden: erkannt wird es vom Vor-Check
  `sh _template/tools/lint.sh` (Aufruf mit Stichtag:
  `Tools.md` §Projekt-Skripte), gemeldet hier;
  Meldung, kein Block — auch im Ein-Modell-Weg (der
  beim Init gewählte Ersatzweg ohne zweites Modell,
  `Tools.md` §Prüf-Werkzeuge, `Reviewmuster.md` §2
  Schleife 2): dort ist die Lage erwartet, die
  Meldung bleibt, und der Freigabe-Eintrag nennt die
  Einschränkung ([[Entscheidungen]] Meta
  „Freigabe-Einträge“). Gemeldet wird nur, wenn
  `modell` und `bau_modell` dasselbe Modell nennen
  (Anwender als Prüfer, Ersatzweg (b):
  `Reviewmuster.md` §2 Schleife 2);
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
  Wiedervorlage „Fassaden-Kandidat <X>“ in `TODO.md`,
  ohne Entscheidung des Anwenders dazu im
  Entscheidungs-Register und ohne vertagten
  Ideen-Eintrag „Fassaden-Kandidat <X>, vertagt“ aus
  dem Bestand) → als Beobachtung melden; das
  Promotions-Angebot folgt der Regel Wiki.md §3a
  „Fassaden-Promotion".
- **Recherche-Trigger:** offene R-Angebote der
  aktuellen Prozess-Phase (Tabelle „Angebote an
  Phasen" des aktiven Prozesses), zu denen weder
  ein REC-Eintrag noch eine dokumentierte
  „Keine Recherche"-Entscheidung existiert, als
  offenes Angebot in Erinnerung bringen.
- Meldung im Erledigt-Block **nur bei Befund**
  (kein Rauschen).

**C8 Nachrichten-Wächter** (nur aktiv, wenn der
Abschnitt Komponenten der Architektur-Fassade (mit
SP-1) mindestens einen **Nachbarn** führt, also eine
Zeile, deren Lage nicht das eigene Repo ist; ohne
Nachbarn kein C8; berichtet nur, blockiert nie):

- **Gelesen** wird `output/nachrichten/` im eigenen
  Repo und bei jedem Nachbarn; dessen Pfad steht in
  der Zeile des Nachbarn im Abschnitt Komponenten.
- **Beim Absender:** eigene Nachrichten mit
  fehlender Quittung melden. **Beim Empfänger:**
  Nachrichten an das eigene Repo mit fehlender
  Buchung melden — erkannt werden beide vom
  Vor-Check `sh _template/tools/lint.sh` (Aufruf:
  `Tools.md` §Projekt-Skripte; Befunde
  `NACHRICHT-OFFEN` und `OHNE-ZUGRIFF`), gemeldet
  hier (ohne Lesezugriff auf einen Nachbarn meldet
  der Vor-Check einen Hinweis; die Empfängerseite im
  Komponenten-Repo braucht die eigene Zeile im
  Abschnitt Komponenten oder `--repo`, siehe
  `lint.sh --help`); Buchen und Quittieren
  schlägt der Agent im Aktion-Block vor (wer was
  bucht: `Vorgehen.md` §3a).
- Geprüft wird **allein über `erwartet:`** und die
  folgende Buchung (`quelle:`) bzw. Quittung
  (`antwort_auf:`); `art` prüft C8 nicht. Wann eine
  Nachricht offen ist, wie gebucht und quittiert wird:
  [[Katalog-message]] — lesen vor dem ersten C8-Lauf.
- **Anlässe:** T1 (Sessionstart), T2 (volle Runde),
  der tägliche Rückfall (erster User-Input an einem
  neuen Tag, analog C4) und T5 „Nachricht
  eingegangen“ — Signal und Zeit-Trigger: §5.4
  „Wächter-Trigger“.
- Meldung im Erledigt-Block **nur bei Befund**
  (kein Rauschen).

**Bewusst nicht Teil:** `output/` (außer
`output/nachrichten/`, C8), `overview/`,
`outgoing/` (dort gibt es keinen Drift) sowie
Lint-Workflow (siehe `Wiki.md` §9, auf Anfrage oder
vor Snapshot; davor der deterministische Vor-Check
`sh _template/tools/lint.sh` — Template-Werkzeug,
nur lesen, keine Kopie ins Projekt-`tools/`; Aufruf
mit Stichtag und weitere Anlässe: `Tools.md`
§Projekt-Skripte, `Wiki.md` §9).

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
  Facts-/Katalog-Befüllung, initiale
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

**Beim Init** kommen fixe Setup-Fragen dazu, geordnet
nach Vorfestlegungs-Stärke (§5.1.0): vorn die
Prozess-Wahl und die Frage „ein Repo mit allem oder ein
zweites Repo für das Produkt?“
([[Two-Repo-Submodul-Muster]]), hinten Details wie die
Commit-Sprache; in Turn 2 die prozess-spezifischen
Init-Fragen, die Bezeichnung der ersten Marke und die
Fassaden-Auswahl-Vorlage.
Reihenfolge mit der Vorfestlegung je Frage, Wortlaut,
Menü-Formate, Briefing-Angebot, Ableitung aus einem
Startprompt und Umsetzungs-Regeln:
[[Init-Choreografie]] §Init-Fragen im Frage-Block —
lesen vor Turn 1.

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
- **Zielmarke beim Anlegen.** Jedes neue Element
  (DEC, IDEA, NEED, SCEN; mit Prozess z.B. REQ, BUG,
  FUNC, ARC, SPEC, TEST, DEPL, CON) erhält beim Anlegen
  das Pflichtfeld `zielmarke:` mit der aktuellen
  `in-progress`-Marke — für eine spätere Marke
  Geplantes mit dieser Marke; ein BUG trägt die Marke
  des Produkt-Stands, an dem der Fehler beobachtet
  wurde (Deploy-Stand der Umgebung oder Testbericht in
  `gefunden_in:`; ist sie nicht eindeutig, fragt der
  Agent im Frage-Block, §5.1.0, und schreibt nie die
  laufende Marke hinein — SP-1 `Fehlermeldungen.md`
  §Meta „Zielmarke“); die DEPL eines Deploy-Stands, der
  zu einer abgeschlossenen Marke nachgetragen wird (neue
  oder anders ausgerollte Umgebung), eine Entscheidung,
  die nur diese Umgebung betrifft, und eine
  Fix-Anforderung auf einen Deploy (ein Fehler in der
  Auslieferung, behoben durch einen weiteren
  Deploy-Stand) tragen die Marke des nachgetragenen
  Deploy-Stands —
  die Marke dessen, was ausgerollt wird; ist sie nicht
  eindeutig oder ist unklar, ob die Entscheidung nur
  die Umgebung betrifft, fragt der Agent (SP-1
  `Katalog-Deployments.md`, `Anforderungen.md`
  „Fehlerbehebungen“; `Zielmarken.md` §Meta,
  Nachtrag); ein Freigabe-Eintrag
  trägt die Marke der Freigabe, ein
  Marken-Wechsel-Eintrag die abgeschlossene Marke
  ([[Entscheidungen]] Meta); bis zum Freeze umhängbar,
  Nachweise tragen das Feld nicht. Zusammen mit dem
  Feld schreibt der Agent das Anlage-Datum des
  Elements (`datum:` im Kopf des Detail-Knotens, ohne
  Detail-Knoten die Zeile `Angelegt` im Eintrag; nie
  geändert) — fehlt das Feld vor der Annahme, ergänzt
  er es; danach heilt es nur der angehängte Vermerk
  `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)`,
  den der Lint wie das Feld liest (eine DEC ist mit der
  Buchung angenommen: dort heilt es der Vermerk, auch
  im selben Zug; Regel, Sitz,
  Anlage-Datum, Bestand und Heilweg: [[Zielmarken]]
  §Meta „Pflichtfeld `zielmarke:`“). Ruht das Projekt
  (keine Marke `in-progress`, Ruhe-Zeile in
  [[Zielmarken]]), legt der Agent zuerst eine Marke an,
  bevor er ein Element bucht, und legt dann die
  Übernahme der Stände der letzten Marke vor — der
  nachgeholte zweite Teil des Wechsels ([[Zielmarken]]
  §Meta „Ruhe-Zeile“, Weitermachen).
- **Zwischenmarke.** Soll das Produkt einer
  abgeschlossenen Marke korrigiert werden (ein anderes
  Ausrollen bei unverändertem Produkt ist keine
  Korrektur, sondern ein Nachtrag — `Zielmarken.md`
  §Meta, Nachtrag), während die nächste schon läuft,
  zieht der Agent die Patch-Marke als Zwischenmarke vor
  und stellt die laufende Marke zurück — erst nachdem
  er das angekündigt hat (die laufende Marke ruht, neue
  Elemente erhalten die Zwischenmarke in `zielmarke:`,
  jede Freigabe ohne Stand-Datei nennt ihre Marke und
  Stände tragen ihre Marke im Kopf, Arbeit an der
  zurückgestellten Marke nennt diese ausdrücklich, die
  Arbeit am Produkt läuft auf einem eigenen Zweig ab
  dem Tag der Vormarke — Zweig-Konvention in
  `wiki/Facts.md` neben der Tag-Konvention —, er
  kehrt danach zurück), bei größeren
  Anpassungswünschen gefragt hat, ob die Arbeit besser
  auf dem Planweg in der laufenden Marke weitergeht,
  gefragt hat, ob die Zwischenmarke Vorgänger oder
  Sackgasse ist — mit den Folgen beider Fälle —, und
  der Anwender sein OK gegeben hat; die Antwort ist
  änderbar, bis in der Zwischenmarke zum ersten Mal
  abgelöst oder überlagert wird. Eine zweite Korrektur
  gleicher Art nimmt er in dieselbe Zwischenmarke auf
  (mit derselben Ankündigung), eine andere Art folgt
  als eigene Zwischenmarke nach dem Abschluss der
  ersten; zur zurückgestellten Marke kehrt er nach der
  letzten zurück. In Fällen, die
  diese Regeln nicht abdecken, fragt er den Anwender.
  In einer Sackgasse überlagert er Elemente der
  regulären Linie (`ueberlagert:`) statt sie abzulösen,
  fragt, wenn eine Überlagerung einen schon
  freigegebenen oder übernommenen Stand trifft, ob eine
  neue Version entsteht oder der Stand bleibt, und
  fragt, bevor die Sackgasse abgeschlossen ist, ob Teile
  davon in die reguläre Linie übernommen werden —
  Übernahme statt Umhängen; der Zweig einer Sackgasse
  bleibt stehen. Bei der Rückkehr aus einem Vorgänger
  legt er doppelte Nachfolger zur Wahl vor und führt
  den Zweig in die Hauptlinie zurück, Konflikte legt er
  vor (`Vorgehen.md` §4; Vollform
  [[Zielmarken]] §Meta „Zwischenmarke“). Gepusht wird
  der Zweig wie jeder Commit nur auf Anfrage (§6.4).
  Solange eine Zwischenmarke läuft, gibt es kein
  Prozess-Upgrade (§5.1.2); der Agent verweist auf die
  Zeit nach der Rückkehr.
- **Fix-Anforderung auf einen Deploy.** Bei der
  Freigabe eines weiteren Deploy-Stands, der eine
  Fix-Anforderung auf einen Deploy umsetzt
  (Nachtragszeile oder Freigabe-Eintrag), fragt der
  Agent im Frage-Block, wann er nach der Bestätigung
  der Behebung fragen soll — Datum oder Anlass —,
  trägt die Wiedervorlage in `TODO.md` ein (die Antwort
  ist die Anweisung dafür) und fragt zum genannten
  Zeitpunkt; sagt der Anwender „noch nicht“, fragt er
  im selben Zug nach dem neuen Zeitpunkt und ändert die
  Wiedervorlage; mit der Bestätigung schließt er BUG
  und Fix-Anforderung im selben Zug ab und erledigt die
  Wiedervorlage, ohne sie folgt eine weitere
  Fix-Anforderung auf einen Deploy, und er führt
  dieselbe Wiedervorlage fort
  (SP-1 `Anforderungen.md` „Fehlerbehebungen“).
- **Wächter-Trigger** (aktiv, sobald mindestens eine
  Register-Fassade aktiv ist — welche es gibt, sagen
  die Register-Einträge im [[Katalog]], z.B.
  Entscheidungen, Ideen und nach Merge die
  Prozess-Register; Status siehe
  `wiki/Fassaden.md`): Der Wächter läuft **nicht
  am Ende jedes Zugs** — das wäre bei der
  Template-typischen Commit-Frequenz zu granular. Er
  läuft an folgenden Triggern plus einer Rückfallebene:
  - **T1 Sessionstart-Phase C5** (Basis) —
    obligatorisch, datumsbasierte Auslöser prüfen
    (siehe §5.3 Phase C5); mit Nachbarn zusätzlich
    C8.
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
    volle Wächter-Runde C4–C8 bei den
    prozess-definierten Meilensteinen (z.B. Ende einer
    Scaffolding-Vorlage, Freigabe-Buchung).
  - **T4 Freigabe-Bezugsprüfung** (Basis, während der
    Arbeit; dazu der Zielmarken-Wechsel als
    gebündelter Lauf) — Auslöser, Prüfung und
    Reaktion: `Vorgehen.md` §5.
  - **T5 Nachricht eingegangen** (Basis, nur C8;
    aktiv wie C8, §5.3) — ein Nachbar hat eine neue
    Nachricht abgelegt; T5 löst nur C8 aus, keine
    volle Runde. **Kein Weck-Modus:** Nachrichten
    empfängt nur ein laufender Agent. Er beobachtet
    `output/nachrichten/` der Nachbarn und gibt bei
    einer neuen Nachricht ein Signal; wie, löst er mit
    den Werkzeugen seiner Runtime (z.B.
    Dateisystem-Beobachtung wie inotify unter Linux;
    mit Peer-Werkzeug ist die Zustellung das Signal,
    `Vorgehen.md` §3). Kann er sich nur einen
    Zeit-Trigger bauen, fragt er den Anwender, wie oft
    er nachschauen soll. Die Wahl steht in `Tools.md`,
    Kategorie „Peer-Agenten: Start und Transport“
    (Werkzeug-Wahl, `Vorgehen.md` §7b); installiert
    wird nichts ohne Zustimmung des Anwenders.
  
  Ausgabeform bei Befund: Erledigt/Aktion/Frage-
  Raster. Bei leerem Befund keine Ausgabe.
- **Feld-Kanonizität.** Welche Ebene beim Ändern
  eines Status-, Sektions- oder Ablösungs-Felds führt
  (Fassade oder Detail-Knoten), wie der Nachzug als
  Standardaufgabe läuft und wie Drift abgesichert ist:
  Wiki.md §1.1a — lesen, bevor ein solches Feld
  geändert wird. Welche Felder eine Fassade kanonisch
  führt, nennt ihre `## Meta` (z.B. Frist-Status in
  [[Fristen]], Stolpersteine in [[Facts]]).
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
starten und **externe Recherche** anbieten. Wie
Angebote und Sub-Agent-Beauftragungen gebaut sind
(Beauftragungs-Rahmen, Recherche-Prompt,
Angebots-Formate, Auftragsliste und
Werkzeug-Dauerfreigabe, Ingest und Archiv):
[[Angebots-und-Beauftragungs-Muster]] — vor jedem
Angebot und jeder Beauftragung lesen. Wie ein
Prüflauf abläuft (Standard-Prüfprompt,
Zwei-Modelle-Regel, Selbst-Triage, Reifekriterium)
und was gilt, wenn kein zweites Modell verfügbar ist
(zuerst ein Werkzeug, sonst der beim Init gewählte
Ersatzweg aus `Tools.md`): `Reviewmuster.md` §2 —
lesen vor jeder Prüf-Beauftragung.

**Review-Auslöser.** Wann der Agent von sich aus ein
Review anbietet (nach einer Änderung, vor jeder
Publikation, beim Übertrag ins Produkt-Repo; nach
Upgrade und Migration — beim Prozess-Upgrade nur mit
Migration — läuft ohne Angebot das Absicherungs-Review,
`Reviewmuster.md` §2 Schleife 2), in
welchem Umfang und bis zu welcher Reife:
[[Angebots-und-Beauftragungs-Muster]], Absatz
„Review-Angebote — Auslöser“ — lesen nach jeder
Änderung und vor jeder
Publikation; Muster, Runden-Obergrenze und
Konvergenz-Bericht: `Reviewmuster.md`.

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
mitgebrachter Knoten `Meilenstein-und-T2`,
Kurzform SP-1-`index.md` §4.3). Die Phasen sind eine
andere Achse: Züge finden innerhalb einer Phase statt
und bilden sie; der Zweck einer Freigabe ist eine
Phase, kein Zug (`Vorgehen.md` §4). Typische Züge:

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
übrigen Mitbringsel-Deklarationen; gelesen beim
Prozess-Merge, Wiki.md §11.3 Schritt 6).
**Projekte** können darüber hinaus eigene
Modul-/Bereichs-Präfixe deklarieren — Register ist der
`internal-rule`-Knoten [[Projekt-Praefixe]]
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
- Ein Tag der Implementierung ist eine Freigabe, kein
  Commit-Schritt: Wortlaut des Eintrags, wer den Tag
  setzt, Tag-Konvention und Pfade des Produkts in
  `wiki/Facts.md`, Projekt ohne Prozess —
  `Vorgehen.md` §4 „Freigabe per Tag“ (führender Ort);
  Vorbedingungen in [[Kettenpruefung]] §Code-Glieder,
  Ablauf mit RP-1 in `Vorgehen-RP-1.md` §3 „Tag
  setzen“ — lesen, bevor ein Tag entsteht.

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

Alle installierten MCPs und Erweiterungen und die
Werkzeug-Wahlen des Projekts werden in `Tools.md`
dokumentiert. Welche Kategorien `Tools.md` führt, samt
Beispielen: Kopiervorlage
`wiki/templates/Tools-Vorlage.md` — bei Anlage von
`Tools.md` kopieren und die Beispiele ersetzen.

## 8. KI-Agent-Instruktionsdatei

### 8.1 Grundsatz: KI-Agnostik

Der MasterPrompt ist **KI-agnostisch**. Jeder Agent
erzeugt daraus **seine eigene native
Instruktionsdatei**; alle sind abgeleitete Sichten auf
denselben MasterPrompt. Welche Datei zu welchem
Agenten gehört und ob mehrere nebeneinander stehen
dürfen: [[Standarddateien-Katalog]] §2.3 — lesen bei
Anlage der Instruktionsdatei.

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
Pflichten:

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
  im Arbeits-Rhythmus (C6 wacht über das Alter der
  Bearbeitungsstand-Zeile).

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
- Terminologische Klarstellung → Vorschlag in
  `wiki/Glossar Review.md` (das Glossar führt die
  Definition; Weg und Eintragsform: Wiki.md §3a.1),
  Erklärung bei Bedarf im `concept`-Knoten.
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
**Handoff-Moment** (H1 Session-Resume-Vorbereitung,
H2 User-Aufforderung, H3 Sub-Agent-Beauftragung,
H4 Prozess-Merge und Prozess-Upgrade) stellt der
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
  der Fassaden — was eine Fassade ist, steht in
  ihrem Katalog-Eintrag (Übersicht: `Wiki.md` §3a).
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

### 9.6 Link-Regel und selbsttragende Dokumente

**Zwei Grade eines Dokuments.** Ein Dokument ist
entweder **wiki-verweisend** oder **selbsttragend**;
die Achse original ↔ abgeleitet ist davon unabhängig.

- **Wiki-verweisend** ist, was nur mit dem Wiki
  gelesen wird — der Leser ist ein Agent mit
  Repo-Zugang (Spezifikation, Architekturdokument,
  Subagenten-Auftrag). Details und Begründungen
  bleiben im Wiki, das Dokument verweist; wird es
  umfangreich oder wiederholt es sich, setzt sich ein
  Link.
- **Selbsttragend** ist, was **am Stück** an einen
  Empfänger ohne Wiki-Zugang weitergegeben werden muss:
  die Doku-Stände der Kette (Entwickler-Doku,
  Benutzer-Doku, Betriebs-Anleitung — selbsttragende
  Pflicht-Stände, mit SP-1), Release-Notes,
  Durchführungs-Instanz eines Tests, Übergabe-Dokument
  ohne Lesezugriff, README nach außen. Keine Wikilinks,
  keine Register-IDs, Begründungen ausgeschrieben. Ein
  Stand kann beide Grade haben; der Grad steht in
  seinem Katalog-Eintrag ([[Einfrieren-und-Abloesen]]
  §Stand).

**Link-Regel (Wiki und wiki-verweisende Dokumente).**
Wissen, das an mehreren Stellen genutzt wird, steht an
**einem Ort** und wird verlinkt, damit keine Drift
entsteht; jede Aussage steht einmal, statt einer
zweiten Formulierung steht ein Link. Zweck ist nicht
Ordnung, sondern **Kontextökonomie**: wer navigiert,
liest nur, was er tatsächlich braucht. Wo ein Link
steht, steht eine **Link-Beschreibung** — kurz, was
hinter dem Link zu erwarten ist; sonst müsste der Leser
das Ziel ganz lesen. Die Link-Beschreibung ist
prinzipbedingt akzeptierte Redundanz. **Ihre Grenze:**
sie nennt Gegenstand, Zweck und Lese-Moment des Ziels
und enthält keine Regel-Aussage, die man ohne das Ziel
befolgen könnte; was ein Agent zwingend wissen muss,
ohne das Ziel zu lesen, steht an seinem führenden Ort.
Die Paarung Fassade ↔ Detail-Knoten (Wiki.md §1.1a)
ist davon nicht betroffen. Stützt sich ein
wiki-verweisendes Dokument auf eine Entscheidung,
steht dort der Link mit Beschreibung, nicht die
Wiederholung (Wiki.md §8.6).

**Anerkannte Redundanz** neben Link-Beschreibung und
bewussten Paarungen, je mit eigenem Mechanismus:
Kopien lebender Quellen in eingefrorenen Ständen
(gekennzeichnet als Kopie, mit Leseregel —
[[Einfrieren-und-Abloesen]], Abschnitte Kopien und
Leseregel);
selbsttragende Ableitungen mit Herkunfts-Kopf (neu
abgeleitet statt gepflegt, siehe unten);
Einmal-Instanzen wie Subagenten-Aufträge und
Startprompts (erzeugt, nicht gepflegt); die
Belegungs-Tabellen der Prozess-Vorgehen als Anwendung
des Phasen-Katalogs. Andere Wiederholungen sind nicht
anerkannt.

**Prüfregel für selbsttragende Dokumente:** Ein
selbsttragendes Dokument bleibt verständlich und
befolgbar, wenn jeder Verweis nach außen ins Leere
zeigt. Externes Wissen wird mit Aussage und Begründung
hereingeholt (z.B. per Konzept-Übernahme, §5.3
Phase D); externe Verweise sind Belege oder
Vertiefung, nie Verständnisvoraussetzung.
**Redundanz ist dafür ausdrücklich zulässig.** Für
Wiki und wiki-verweisende Dokumente gilt diese
Prüfregel nicht, dort gilt die Link-Regel.

Daraus folgen die Arbeitsregeln:

- **Anweisungen selbsttragend nur bei Weitergabe am
  Stück.** Eine Anweisung, die am Stück an Empfänger
  ohne Wiki-Zugang geht, trägt Aussage und Regel
  ausgeschrieben in sich; Verweise auf Nummern oder
  Abschnitte anderer Dokumente stehen nur als
  Herkunftsvermerk in Klammern und dürfen zum Befolgen
  nicht nötig sein. **Subagenten-Aufträge sind
  wiki-verweisend:** sie nennen Einstieg und
  freigegebene Stände (§5.6), der Subagent liest im
  Wiki, was er braucht.
- **Entscheidungs-Kern inline nur in selbsttragenden
  Dokumenten.** Wo ein selbsttragendes Dokument sich
  auf eine Entscheidung stützt, werden Aussage und
  Begründung übernommen — und, wo es die Sache trägt,
  auch die erwogenen und verworfenen Alternativen; ein
  Verweis auf das Entscheidungs-Register ist
  Wartungsvermerk, nie Verständnisvoraussetzung. Im
  Wiki und in wiki-verweisenden Dokumenten gilt Link
  statt Wiederholung.
- **Neu ableiten statt nachpflegen.** Abgeleitete
  selbsttragende Dokumente — Ableitungen wie
  selbsttragende Stände — werden zu festgelegten
  Zeitpunkten aus dem Wiki bzw. aus ihren Quell-Ständen
  erzeugt, nicht von Hand nachgezogen — mit
  Herkunfts-Kopf und nach dem Pflicht-Angebot eines
  Reviews (§5.6): **jeder Text stammt aus dem Wiki.**
  Komplett neu heißt das ganze Dokument neu erzeugt;
  bei einer Einarbeitung werden die geänderten Kapitel
  neu erzeugt und die übrigen unverändert aus der
  letzten Vollfassung übernommen, bei einem
  Änderungsdokument der Zuwachs gegenüber der
  Vollfassung — in jeder Form geht die Prüfung über
  das ganze Dokument (welche Form wann: die
  Doku-Abfrage, [[Kettenpruefung]] §Kette).
  Standard-Auslöser für Dokumente, die das Produkt
  beschreiben, ist die Freigabe eines Stands für das
  Ausliefern oder der Zuruf; ein eigener Auslöser des
  Dokumenttyps geht vor — bei den Doku-Ständen der
  Kette die Doku-Abfrage.
- **Paarungs-Pflege für bewusste Paarungen.** Die
  bewussten Paarungen sind Kurz- und Vollform, keine
  Redundanz, und werden explizit gepflegt — zu jeder
  inhaltlichen Änderung gehört die Frage, welche
  Paarung sie berührt, und die Antwort gehört in
  denselben Zug. Die Paarungen sind abschließend:
  Fassade ↔ Detail-Knoten (Wiki.md §1.1a);
  `wiki/Fassaden.md`-Status ↔ `active:`-Frontmatter
  der Fassaden-Dateien; Instruktionsdatei-Spiegel ↔
  seine Quellen (§8.3). Der Anwender benennt, welche
  davon für sein Projekt wichtig sind. Weitere
  Wiederholungen werden nicht gepflegt, sondern auf
  Link mit Beschreibung gestellt.
- **Erzeugtes ist als erzeugt gekennzeichnet.** Wo
  Dateien aus anderen Dateien erzeugt werden
  (aufgeteilte Dokumente, Verzeichnisse,
  Übersichten), tragen sie einen sichtbaren Hinweis
  „automatisch erzeugt aus X" am Anfang und benennen
  die führende Quelle; Änderungen geschehen
  ausschließlich an der Quelle (Beispiel: die
  Konfigurations-Übersicht in der
  Instruktionsdatei, §8.3).
- **Eine Anweisung je wiederkehrender Tätigkeit.**
  Für jede Tätigkeit, die im Projekt wiederkehrend
  anfällt (z.B. Ingest einer Dokumentart, Bildung
  eines Stands, Versand, Wächter-Lauf, ein
  projekt-eigener Prüf- oder Veröffentlichungs-Schritt),
  gibt es genau eine Anweisung: was zu tun ist, in
  welcher Reihenfolge, woran man erkennt, dass es
  fertig ist — vollständig und ohne externes Vorwissen
  befolgbar. Sie steht als Anleitung
  (`internal-procedure`) in [[InterneMechanik]] oder,
  wo sie das Template schon mitbringt, als
  MasterPrompt-Sektion bzw. mitgelieferter Knoten
  (Beispiele: [[Commit-Prozedur]],
  [[Git-Bestandsaufnahme]], die Bootstrap-Dateien).
  Fällt eine Tätigkeit zum zweiten Mal an und hat sie
  noch keine Anweisung, legt der Agent sie als Entwurf
  vor (Aktion-Block) und verweist künftig darauf,
  statt die Schritte erneut zu erklären.

**Begriffe.** „Werkstatt“ und „Schleuse“ werden nur
im Zwei-Repo-Kontext verwendet
([[Two-Repo-Submodul-Muster]]); allgemein heißt es
„Wiki (Quelle der Wahrheit)“ und „abgeleitete
Dokumente“. „Produkt“ ist der allgemeine Begriff für
das Ergebnis der Ausarbeitung (P9) jedes Projekts
([[Glossar]]); im Zwei-Repo-Fall ist das Produkt-Repo
das Repo, das es trägt. Die Grade heißen selbsttragend und
wiki-verweisend; die Abgrenzung zu „eingefroren“ und
„abgeschlossen“ steht im Glossar-Eintrag
„selbsttragend“ ([[Glossar]]).
