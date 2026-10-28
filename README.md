# referenzprozess-softwareentwicklung

**Bearbeitungsstand: 2026-10-28**

Ein Starter für Softwareprojekte, in denen ein Mensch
und ein KI-Agent strukturiert zusammenarbeiten: das
Projektwissen lebt in einem Wiki aus Markdown-Dateien,
der Agent arbeitet nach einem mitgelieferten Regelwerk,
und der Prozess für Softwareentwicklung ist schon an
Bord. Diese Datei erklärt den Starter nicht, sie
verzweigt — je nachdem, wer liest.

## Als Mensch: die vollständige Erklärung

Was der Starter ist, warum ein Projekt damit ein
`wiki/` führt, wie ein neues Projekt beginnt, wie ein
bestehendes Projekt hereinkommt und wie es auf einen
neuen Stand gehoben wird — ohne Vorwissen lesbar, mit
Verweisen auf die Detail-Dokumente:
[`docs/Einfuehrung.md`](docs/Einfuehrung.md).

## Als Agent: der Einstieg

Starte den Agenten (z.B. Claude Code, Cursor,
Windsurf) **im Projektordner** und gib ihm einen der
drei Sätze — mehr braucht es nicht. Der Agent liest
die zugehörige Anleitung direkt von der Repo-URL,
bevor lokal etwas liegt (Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`,
auch für jede Datei, auf die eine Anleitung verweist),
fragt zuerst, wie der Starter als `_template/` in das
Projekt eingebunden wird, und bietet jeden weiteren
Schritt an — nichts läuft ungefragt, die Skripte in
`setup/` werden nur angeboten.

**Neues Projekt** — im leeren Projektordner; Anleitung
`INIT.md`:

```text
Richte dieses Verzeichnis als neues Projekt nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung ein.
```

**Bestehendes Projekt migrieren** — im Ordner eines
Projekts, das bisher ohne diese Vorlage arbeitet;
Anleitung `migration/MIGRATION.md`. Der Weg ist für
Softwareprojekte gedacht; findet der Agent keinen
Software-Bezug, fragt er dich, ob das der richtige
Prozess ist oder ob du einen anderen nennst:

```text
Migriere das Projekt in diesem Verzeichnis nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.
```

**Projekt auf den aktuellen Stand heben** — im Ordner
eines Projekts, das schon mit dieser Vorlage oder mit
der allgemeinen Vorlage arbeitet, mit oder ohne
Prozess; Anleitung `upgrade/UPGRADE.md`. Der Agent
ersetzt den Inhalt von `_template/` durch den neuen
Stand **derselben Vorlage**, aus der das Projekt
stammt (er liest sie aus dem Herkunfts-Vermerk des
Projekts), das Projekt behält seinen Prozess:

```text
Hebe das Projekt in diesem Verzeichnis auf den aktuellen Stand nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.
```

## Was dieses Repo enthält

- Das **Regelwerk** (`MasterPrompt.md` mit seinen
  Teildateien und Styleguides) — wird ins Projekt
  kopiert und lebt dort; der Agent liest es nur auf
  Anweisung, die Anleitungen oben sind eine solche.
- Ein **vorbereitetes `wiki/`** als Kopier-Quelle: der
  Prozess für Softwareentwicklung (RP-1 auf SP-1) ist
  aktiviert, die Vorfestlegungen sind gebucht.
- **`referenzprozesse/`** — alle Prozess-Vorlagen als
  Nur-Lese-Quelle; bleiben in `_template/`.
- **`INIT.md`**, **`migration/MIGRATION.md`**,
  **`upgrade/UPGRADE.md`** — die drei Anleitungen;
  werden aus `_template/` oder von der Repo-URL
  gelesen, nie kopiert.
- **`setup/`** — die Kopier-Skripte, die der Agent
  anbietet; **`tools/`** — der Lint-Kern, den der
  Agent aus `_template/tools/` aufruft. Beides bleibt
  in `_template/`.
- **`docs/`** — die Erklärung für Menschen; bleibt im
  Starter, das Projekt-`docs/` gehört dem Projekt.

`_template/` bleibt dauerhaft im Projekt und wird dort
nie verändert — als Nachschlage- und Upgrade-Quelle,
bei der Einmal-Kopie zugleich als Archiv des Stands,
mit dem das Projekt begonnen hat.

## Lizenz

Inhalt unter **CC BY 4.0** (Attribution: Jörn
Schlingensiepen,
`https://github.com/schlingensiepen/referenzprozess-softwareentwicklung`);
der Quelltext in `setup/` und `tools/` steht unter
**Apache-2.0**. Details: [`LICENSE`](LICENSE).
