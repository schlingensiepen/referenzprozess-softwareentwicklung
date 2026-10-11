# Die Ordnerstruktur: was wo liegt — und warum

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-11; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

Ein Projekt aus diesem Starter hat eine feste
Grundstruktur. Die Logik dahinter: **jede Art von
Inhalt hat genau einen Ort**, und für jeden Ort ist
klar, ob er lebt (wird gepflegt), eingefroren ist
(Nachweis) oder nur-lese ist (Vorlage).

## Das Root: Regelwerk und Steuerdateien

Im Projekt-Root liegen die Regelwerks-Dokumente —
`MasterPrompt.md` als Zentrale, dazu die Teildateien
`Wiki.md`, `Vorgehen.md`, `Reviewmuster.md`,
`Outgoing.md` und die Styleguides — sowie
Steuerdateien wie `TODO.md` (deine offenen Punkte),
`Offene Fragen.md` (gesammelte Rückfragen des
Agenten), `Tools.md` (installierte Werkzeuge),
`devstate_active.md` (aktueller Arbeitsstand und
nächste Schritte) und die Instruktionsdatei deines
Agenten (z.B. `CLAUDE.md`), die er beim Start
automatisch lädt. Das Regelwerk selbst liest der
Agent nur auf deine ausdrückliche Anweisung — im
Alltag genügt ihm die daraus abgeleitete
Instruktionsdatei.

## Eingang: raw/ und input/ (unveränderlich)

- **`raw/`** — Originale, wie sie eingegangen sind:
  gescannte PDFs, empfangene Briefe, Formulare. Der
  Agent verändert hier **nie** etwas; die Dateien
  behalten ihre Originalnamen. `raw/` ist das
  Archiv.
- **`input/`** — die Volltext-Konvertierungen der
  Originale als Markdown (z.B.
  `raw/scan_2025_03.pdf` → `input/raw/scan_2025_03.md`),
  ebenfalls unveränderlich. Gearbeitet wird nie
  direkt mit `input/`, sondern mit den daraus
  erzeugten Wiki-Knoten — jeder Knoten verweist auf
  seine Quelle zurück (Provenienz).

Die Konvertierung übernimmt ein externes Werkzeug
(„WorkspaceManager"), falls vorhanden — sonst der
Agent selbst, bei Bedarf statt auf Vorrat.

## Das wiki/: lebender Sachstand

Das Herzstück — siehe
[01-wiki-prinzip.md](01-wiki-prinzip.md) und
[02-fassaden-und-knoten.md](02-fassaden-und-knoten.md).
Flach organisiert (keine Unterordner außer
`wiki/templates/` mit Kopiervorlagen), unversioniert
im fachlichen Sinn: Es gilt immer der aktuelle
Stand; die Historie liefert git.

## Ausgang: output/, overview/, outgoing/

- **`output/`** — eingefrorene **Übergabe-Stände**:
  Dokumente, die jemand anderes bekommt
  (Stellungnahmen, Angebote, Spezifikations-Stände,
  Übergaben an andere Repos). Versioniert nach einem
  festen Namensschema mit Versionsnummer und
  Bearbeiter-Kürzel (`…_01_AIG.md` = Version 01 vom
  KI-Agenten); einmal geschrieben, nie verändert —
  jede Änderung ist eine neue Version.
- **`overview/`** — eingefrorene
  **Selbst-Auswertungen**: Analysen, Vergleiche,
  Wiki-Snapshots. Gleiche Versionierung; Zielgruppe
  bist du selbst.
- **`outgoing/`** — **Versandstände**: pro Versand
  ein Ordner mit Anschreiben und den tatsächlich
  versandten Artefakten (PDF, DOCX, EML), erzeugt
  über eine Pandoc-Pipeline.

Faustregel: Was lebt, lebt im `wiki/` — `output/`
und `overview/` frieren ein, `outgoing/` verpackt.

## referenzprozesse/: die Nur-Lese-Vorlage

Der mitkopierte Ordner `referenzprozesse/` enthält
alle Prozess-Pakete der Vorlage (siehe
[04-prozesse.md](04-prozesse.md)) — vollständig,
auch die hier nicht aktivierten. Er ist **nur-lese**:
Der Agent bedient sich daraus (z.B. beim
Reaktivieren einer Fassade oder beim Aktivieren
einer Prozess-Option), schreibt dort aber nie. So
bleibt das Projekt selbsttragend, auch wenn die
Template-Quelle später nicht mehr erreichbar ist.

## Weitere Ordner

`research/` archiviert vom Agenten beschaffte
Quellen (das Gegenstück zu `raw/` für
Agent-Recherchen), `tools/` trägt Projekt-Skripte
des Agenten. Eigene Ordner (z.B. `src/`, `tests/`
für Code) sind vorgesehen: Entweder deklariert sie
der aktive Prozess, oder du gibst sie frei — die
Freigabe wird als Entscheidung im Wiki gebucht,
damit die Struktur nachvollziehbar bleibt.

## Und bei eingebundener Vorlage: _template/

Wurde der Starter als git-Submodul eingebunden,
liegt er unter `_template/` im Projekt — nur-lese,
auf einen festen Stand „gepinnt". Dort bleiben auch
diese Erklär-Doku (`_template/docs/`), die
Start-Choreografien (`_template/INIT.md`,
`_template/migration/MIGRATION.md`) und die
Kopier-Skripte dauerhaft nachlesbar. Dein
Projekt-`docs/` gehört dagegen ganz dir bzw. deiner
Projekt-Dokumentation.
