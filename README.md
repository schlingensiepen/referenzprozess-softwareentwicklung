# referenzprozess-softwareentwicklung

Eine **Projektvorlage für Softwareprojekte, in denen
ein Mensch und ein KI-Agent strukturiert
zusammenarbeiten**. Das Projektwissen lebt in einem
Wiki aus Markdown-Dateien — nicht im Chatverlauf;
der Agent arbeitet nach einem festen Regelwerk, das
diese Vorlage mitbringt. Für Softwareprojekte ist
der passende Prozess (Anforderungen, Architektur,
Spezifikation, Test) bereits voraktiviert: nach dem
Start beantwortest du wenige Fragen zu deinem
Vorhaben und arbeitest sofort los.

**Wie das funktioniert und warum, erklärt
[`docs/index.md`](docs/index.md) — lesbar ohne
Vorkenntnisse.**

## Loslegen

Dieses Repo wird nicht selbst zum Projekt — es wird
in dein Projekt **eingebunden** (empfohlen: als
git-Submodul `_template/`), und ein kurzes Skript
kopiert die Startausstattung hinein.

### Neues Projekt starten

Entweder: starte deinen KI-Agenten im (leeren)
Projektordner und gib ihm:

> Binde
> `https://github.com/schlingensiepen/referenzprozess-softwareentwicklung`
> als Submodul `_template/` ein, führe
> `_template/setup/init-frisch.sh` aus und arbeite
> dann `_template/INIT.md` ab.

Oder selbst:

```sh
mkdir mein-projekt && cd mein-projekt
git init
git submodule add https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template
_template/setup/init-frisch.sh
```

…und dann den Agenten mit „Arbeite
`_template/INIT.md` ab" starten.

### Bestehendes Projekt migrieren

Entweder: starte deinen KI-Agenten im Projektordner
und gib ihm:

> Binde
> `https://github.com/schlingensiepen/referenzprozess-softwareentwicklung`
> als Submodul `_template/` ein, führe
> `_template/setup/init-migration.sh` aus und
> arbeite dann `_template/migration/MIGRATION.md`
> ab.

Oder selbst:

```sh
cd mein-projekt
git submodule add https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template
_template/setup/init-migration.sh
```

…und dann den Agenten mit „Arbeite
`_template/migration/MIGRATION.md` ab" starten.

### Ohne Submodul

Wer kein Submodul will, kopiert dieses Repo
stattdessen einmalig an einen Ort seiner Wahl und
ruft die Skripte von dort aus dem Projektordner auf
— die Skripte finden ihre Quelle über ihre eigene
Lage. Dein Projekt trägt danach alles selbst, ohne
Update-Verbindung.

## Regelwerks-Einstieg

**`MasterPrompt.md`** — das zentrale Regelwerk. Wird
nur auf ausdrückliche Anweisung des Users gelesen
(beim Sessionstart lädt der Agent stattdessen seine
agent-spezifische Instruktionsdatei, z.B.
`CLAUDE.md`). Der Agenten-Einstieg in dein Projekt
ist `_template/INIT.md` (neu) bzw.
`_template/migration/MIGRATION.md` (Migration); die
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
  als Nur-Lese-Nachschlage- und Upgrade-Quelle,
  vollständig mitkopiert.
- **`INIT.md`** und **`migration/MIGRATION.md`** —
  die beiden Choreografien; werden aus `_template/`
  gelesen, nie kopiert.
- **`setup/`** — die zwei Kopier-Skripte; werden nie
  ins Projekt kopiert.
- **`docs/`** — die Erklär-Doku für Menschen; bleibt
  im Starter, dein Projekt-`docs/` gehört dir.

## Template aktualisieren

- **Submodul (Modus B):** `git submodule update
  --remote _template` holt den neuen Template-Stand;
  danach prüft der Agent die Unterschiede zur
  lebenden Kopie und legt Übernahmen als Vorschlag
  vor.
- **Einmal-Kopie (Modus A):** bewusste Neu-Kopie aus
  der Template-Quelle mit anschließendem Abgleich.

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
