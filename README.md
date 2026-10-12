# referenzprozess-softwareentwicklung

Eine **Projektvorlage für Softwareprojekte, in denen
ein Mensch und ein KI-Agent strukturiert
zusammenarbeiten** — das Projektwissen lebt in einem
Wiki aus Markdown-Dateien, der Agent arbeitet nach
einem mitgelieferten Regelwerk.

## Schnellstart

Starte deinen KI-Agenten (z.B. Claude Code, Cursor,
Windsurf) **im jeweiligen Projektordner** und gib
ihm einen dieser Sätze — mehr braucht es nicht:

**Neues Projekt** — Agent im neuen, leeren
Projektordner starten:

```text
Richte dieses Verzeichnis als neues Projekt nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung ein.
```

**Bestehendes Projekt migrieren** — Agent im Ordner
des bestehenden Projekts starten:

```text
Migriere das Projekt in diesem Verzeichnis nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.
```

Der Agent fragt dich zuerst, wie diese Vorlage in
dein Projekt eingebunden wird, und bietet dir jeden
weiteren Schritt an — nichts läuft ungefragt.

## Für KI-Agenten

Du bist mit einem der beiden Sätze oben hierher
geschickt worden. So geht es weiter:

1. **Auftrag → Anleitung:** neues Projekt aufsetzen
   → `INIT.md`; bestehendes Projekt migrieren →
   `migration/MIGRATION.md`. Lies die Anleitung
   **direkt von dieser URL** — vor jeder Einbindung,
   lokal muss noch nichts liegen. Raw-Pfad-Muster:
   `https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`
   (gilt auch für jede Datei, auf die die Anleitung
   verweist).
2. **Erster Schritt dort ist die Einbindungs-Frage**
   an den Anwender (verknüpfte Vorlage als
   git-Submodul oder eingefrorene, dauerhaft
   mitcommittete Kopie — beides unter `_template/`)
   — bei einer Migration erst nach dem
   Sicherungs-Commit des Alt-Zustands. `git init`
   wird nur nach Zustimmung ausgeführt.
3. **Setup-Skripte in `setup/` werden nur
   angeboten, nie ungefragt ausgeführt:** exaktes
   Kommando nennen, Zustimmung abwarten; die
   Alternative ist das Kopieren von Hand nach der
   Kopier-Liste der Anleitung.

Alle Details stehen in der jeweiligen Anleitung.

## Worum es geht

Das Projektwissen lebt in einem Wiki aus
Markdown-Dateien — nicht im Chatverlauf; der Agent
arbeitet nach einem festen Regelwerk, das diese
Vorlage mitbringt. Für Softwareprojekte ist der
passende Prozess (Anforderungen, Architektur,
Spezifikation, Test) bereits voraktiviert: nach dem
Start beantwortest du wenige Fragen zu deinem
Vorhaben und arbeitest sofort los.

**Wie das funktioniert und warum, erklärt
[`docs/index.md`](docs/index.md) — lesbar ohne
Vorkenntnisse.**

## Was beim Start passiert

Dieses Repo wird nicht selbst zum Projekt — es wird
in dein Projekt **eingebunden**, und seine
Startausstattung wird hineinkopiert. Beides klärt
dein Agent mit dir, bevor etwas passiert:

1. **Einbindungs-Frage** (immer zuerst; bei einer
   Migration direkt nach einem Sicherungs-Commit
   deines Alt-Zustands): Die Vorlage kommt unter
   `_template/` in dein Projekt und wird dort nie
   verändert — entweder als **verknüpfte Vorlage,
   die du später gezielt aktualisieren kannst**
   (empfohlen; technisch ein git-Submodul) oder als
   **eingefrorene Kopie, die dauerhaft im Projekt
   bleibt, damit du immer siehst, womit du
   gestartet bist** (technisch eine Einmal-Kopie,
   die mit deinem Projekt committet wird).
2. **Kopier-Angebot:** Die Startausstattung
   (Regelwerk und vorbefülltes `wiki/`; die
   Prozess-Vorlagen bleiben in `_template/`) kommt
   in dein Projekt — per
   Kopier-Skript (empfohlen: deterministisch,
   überschreibt nichts, listet Kollisionen; der
   Agent nennt dir vorher das exakte Kommando) oder
   von Hand nach der Kopier-Liste. Du wählst.
3. **Fragen-Block und erster Commit** (neues
   Projekt) bzw. **Überführung deines vorhandenen
   Wissens** ins Wiki, ohne je eine Bestands-Datei
   zu überschreiben (Migration).

## Oder von Hand einrichten

Wer Einbindung und Kopie lieber selbst macht, führt
im Projektordner aus:

```sh
git init      # entfällt, wenn schon ein Repo da ist
# nur bei Migration: Alt-Zustand sichern (vorher mit
# `git status` prüfen, dass keine Geheimnisse wie
# .env-Dateien oder Schlüssel mit hineingeraten)
git add -A && git commit -m "Sicherung vor Wissens-Migration"
# Einbindung als verknüpfte Vorlage (Submodul, empfohlen) …
git submodule add https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template
# … oder als eingefrorene Kopie, die dauerhaft im Projekt bleibt:
#   git clone --depth 1 https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template
#   git -C _template rev-parse HEAD   # Stand notieren (Herkunft)
#   rm -rf _template/.git
# Kopie der Startausstattung: neues Projekt …
sh _template/setup/init-frisch.sh
# … bzw. Migration
sh _template/setup/init-migration.sh
# Aufnahme-Commit (bei der Kopie samt _template/)
git add -A && git commit -m "Starter aufgenommen"
```

`_template/` bleibt in beiden Fällen dauerhaft im
Projekt — nicht löschen. Danach den Agenten mit
demselben Satz aus dem Schnellstart starten — die
Anleitungen erkennen erledigte Schritte
(vorhandenes `_template/`, kopierte
Startausstattung) und machen dort weiter; den
notierten Stand trägt der Agent als
Template-Herkunft ins Wiki ein.
Die Skripte überschreiben nie eine vorhandene Datei;
Kollisionen listen sie auf, der Agent legt sie dir
später zur Entscheidung vor.

## Regelwerks-Einstieg

**`MasterPrompt.md`** — das zentrale Regelwerk. Du
als Mensch musst es nicht lesen — die Erklär-Doku in
`docs/` genügt. Für den Agenten gilt: Im regulären
Betrieb lädt er beim Sessionstart seine
agent-spezifische Instruktionsdatei (z.B.
`CLAUDE.md`) und liest den MasterPrompt nur auf
Anweisung — **die Choreografien `INIT.md` und
`migration/MIGRATION.md` samt ihren
Abschnitts-Verweisen sind eine solche Anweisung**:
die dort referenzierten Regelwerks-Abschnitte liest
der Agent selbstverständlich. Der Agenten-Einstieg
in dein Projekt ist `INIT.md` (neu) bzw.
`migration/MIGRATION.md` (Migration) — von der
Repo-URL oder aus `_template/` gelesen; die
Erklär-Doku in `docs/` ist für Menschen gedacht und
für Agenten nie Pflichtlektüre.

## Teildateien

Umfangreichere Regelwerke sind eigenständig und werden
bei Bedarf konsultiert:

- **`Wiki.md`** — vollständige Wiki-Logik: Ingest,
  Knotentypen, Aufbau, Index, Log, Cross-References,
  Lint, Snapshots, Fassaden, Progressive Disclosure.
- **`Vorgehen.md`** — Vorgehensrahmen: Phasen mit
  Ergebnis-Artefakten, zweck-gebundene Freigaben,
  Scaffolding-Baustein.
- **`Reviewmuster.md`** — Multi-Agent-Reviews:
  Muster-Katalog, Modell-Klassen, Reifekriterien.
- **`Outgoing.md`** — Versandpipeline mit YAML-
  Frontmatter, Pandoc-Templates, DIN-5008-Briefen.
- **`Styleguide.md`** — allgemeine Schreibanweisungen.
- **`Styleguide-md.md`** — Markdown-Konventionen für
  User-Facing Root-Dateien.
- **`Styleguide-wiki.md`** — Stilkonventionen für
  Wiki-Knoten (Struktur regelt `Wiki.md`).

Beim Init vom Agent angelegt (analog Instruktions-
datei): **`Styleguide-project.md`** (projektspezifische
Schreibanweisungen) und **`Styleguide-chat.md`**
(Chat-Interaktion mit dem User, aus der Kopiervorlage
`wiki/templates/Styleguide-chat-Vorlage.md`).

## Was dieses Repo enthält

- Die **Regelwerks-Dokumente** (MasterPrompt und
  Teildateien, siehe oben) — werden ins Projekt
  kopiert und leben dort.
- Ein **vorbefülltes `wiki/`** als Kopier-Quelle:
  der Softwareentwicklungs-Prozess (RP-1 auf SP-1)
  ist fertig aktiviert, die Vorfestlegungen sind
  gebucht — du baust kein Wiki, du füllst eines.
- **`referenzprozesse/`** — alle Prozess-Vorlagen
  als Nur-Lese-Nachschlage- und Upgrade-Quelle;
  bleiben in `_template/referenzprozesse/` und
  werden nicht ins Projekt kopiert.
- **`INIT.md`** und **`migration/MIGRATION.md`** —
  die beiden Choreografien; werden aus `_template/`
  oder direkt von der Repo-URL gelesen, nie kopiert.
- **`setup/`** — die zwei Kopier-Skripte (das
  Angebot des Agenten bzw. zum Selbst-Ausführen);
  werden nie ins Projekt kopiert.
- **`docs/`** — die Erklär-Doku für Menschen; bleibt
  im Starter, dein Projekt-`docs/` gehört dir.

## Template aktualisieren

- **Submodul (Modus B):** `git submodule update
  --remote _template` holt den neuen Template-Stand;
  danach prüft der Agent die Unterschiede zur
  lebenden Kopie und legt Übernahmen als Vorschlag
  vor.
- **Eingefrorene Kopie (Modus A):** bewusster
  Austausch von `_template/` gegen einen neueren
  Stand (eigener Commit, neue Herkunft im Wiki
  vermerken), danach Abgleich wie beim Submodul;
  der alte Stand bleibt in der git-Historie
  nachvollziehbar.

Updates ändern **nie automatisch** die lebenden
Dokumente im Projekt — die Übernahme ist immer ein
sichtbarer, geprüfter Schritt.

## KI-Agnostik

Das Regelwerk ist unabhängig von einer bestimmten
KI. Jeder Agent erzeugt daraus seine eigene native
Instruktionsdatei:

- Claude Code → `CLAUDE.md`
- Cursor → `.cursorrules`
- Windsurf → `.windsurfrules` bzw. `.windsurf/rules`

Mehrere solche Dateien dürfen im selben Projekt
koexistieren.

## Lizenz

Inhalt unter **CC BY 4.0** (Attribution: Jörn
Schlingensiepen,
`https://github.com/schlingensiepen/referenzprozess-softwareentwicklung`);
der Quelltext in `setup/` steht unter
**Apache-2.0**. Details: [`LICENSE`](LICENSE).
