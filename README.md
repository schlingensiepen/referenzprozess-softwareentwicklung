# referenzprozess-softwareentwicklung

**Version 2.2** — die Versionsnummer ist der
Template-Stand, den jedes Projekt aus diesem Starter
in seinem Herkunfts-Vermerk trägt
(frühere Stände: 1.0, 1.1, 2.0 und 2.1).
**Bearbeitungsstand:** 2026-11-12
(Tag der letzten Änderung dieser Datei).

Ein Starter für Softwareprojekte, in denen ein Mensch
und ein KI-Agent strukturiert zusammenarbeiten: das
Projektwissen lebt in einem Wiki aus Markdown-Dateien,
der Agent arbeitet nach einem mitgelieferten Regelwerk,
und der Prozess für Softwareentwicklung ist schon an
Bord.
Diese Datei erklärt den Starter nicht, sie
verzweigt — je nachdem, was du vorhast.

Der Starter ist deutschsprachig — Regelwerk,
Anleitungen und die Fragen des Agenten; die
Projektsprache ist mit Deutsch vorbelegt (eine andere
legst du in `Styleguide-project.md` fest). Du brauchst
git, einen KI-Agenten mit Lese-Zugriff auf diese
Repo-URL (z.B. Claude Code, Cursor, Windsurf) und beim
Einrichten Internet.

## Loslegen: ein Satz für deinen Agenten

Starte den Agenten **im Projektordner** und gib ihm
einen der drei Sätze unten — mehr braucht es nicht.
Der Agent liest die zugehörige Anleitung direkt von
der Repo-URL, bevor lokal etwas liegt (Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`,
auch für jede Datei, auf die eine Anleitung verweist),
legt dir seine Fragen gesammelt vor — bei einem neuen
Projekt und bei der Migration zuerst, wie der Starter
als `_template/` eingebunden wird: **B** als
verknüpfte Vorlage (git-Submodul, empfohlen) oder
**A** als eingefrorene Kopie — und bietet jeden
weiteren Schritt an: Einbindung und die Skripte in
`setup/` laufen nur nach deiner Zustimmung; Commits
kündigt er an, statt zu fragen.

### Neues Projekt

Im leeren oder fast leeren Projektordner — ohne
gewachsene Wissensbasis, die gehört in den
Migrations-Weg; Anleitung `INIT.md`:

```text
Richte dieses Verzeichnis als neues Projekt nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung ein.
```

### Bestehendes Projekt migrieren

Im Ordner eines Projekts, das bisher ohne diese
Vorlage arbeitet und sein Wissen in verstreuten
Dateien sammelt (README, Changelog, Aufgabenlisten,
Notizen); Anleitung `migration/MIGRATION.md`.
Der Weg ist für Softwareprojekte gedacht; findet der
Agent keinen Software-Bezug, fragt er dich, ob das der
richtige Prozess ist oder ob du einen anderen nennst:

```text
Migriere das Projekt in diesem Verzeichnis nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.
```

### Template aktualisieren

Im Ordner eines Projekts, das schon mit dieser Vorlage
arbeitet; Anleitung `upgrade/UPGRADE.md`.
Der Weg gilt auch für Projekte aus der allgemeinen
Vorlage, aus der dieser Starter abgeleitet ist — mit
oder ohne Prozess (dem Vorgehens-Paket einer
Projektart, hier dem für Softwareentwicklung); ein
Projekt aus Stand 1.0 hat noch keinen
Herkunfts-Vermerk, dann fragt der Agent.
Der Agent ersetzt den Inhalt von `_template/` durch
den neuen Stand **derselben Vorlage**, aus der das
Projekt stammt; welche das ist und welche Version das
Projekt hat, liest er aus dem Herkunfts-Vermerk — dem
Abschnitt „Herkunft“ in `wiki/Aktivierter-Prozess.md`.
Das Projekt behält seinen Prozess:

```text
Hebe das Projekt in diesem Verzeichnis auf den aktuellen Stand nach der Anleitung unter https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.
```

**Rückmeldung an die Vorlage:** Findet der Agent etwas,
das die Vorlage selbst verbessern würde, hält er es im
Projekt als Ideen-Eintrag fest. Gemeldet wird es als
Issue im GitHub-Repo dieses Starters:
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung/issues

## Die Starter der Familie

Dieser Starter ist einer von mehreren, die aus
derselben Vorlage abgeleitet sind — je Projektart
einer. Die vollständige Landkarte mit Repository,
Prozess und Kurzbeschreibung steht in
[`wiki/Schwester-Templates.md`](wiki/Schwester-Templates.md);
in dieser Version:

| Starter | Wofür |
|---|---|
| `referenzprozess-softwareentwicklung` | Softwareprojekte (RP-1 auf SP-1) |
| `referenzprozess-infrastruktur` | selbst betriebene Anlagen: aufbauen, ändern, betreiben, abbauen (RP-2 auf SP-1) |
| `referenzprozess-rechtsfall` | Verfahren bei Behörden und Gerichten außerhalb des Abgabenrechts (RP-20 auf SP-2) |
| `referenzprozess-abgabenfall` | Steuern und Abgaben (RP-21 auf SP-2) |

Die Starter für Infrastruktur, Rechtsfall und
Abgabenfall sind zunächst privat. Passt dieser Starter
nicht zu deinem Vorhaben, fragt der Agent nach und
nennt den passenden.

## Verstehen: die Erklärung für Menschen

Was der Starter ist, warum ein Projekt damit ein
`wiki/` führt, wie ein neues Projekt beginnt, wie ein
bestehendes Projekt hereinkommt und wie es auf einen
neuen Stand gehoben wird — ohne Vorwissen lesbar, mit
Verweisen auf die Detail-Dokumente:
[`docs/Einfuehrung.md`](docs/Einfuehrung.md).

## Was dieses Repo enthält

- Das **Regelwerk** (`MasterPrompt.md` mit seinen
  Teildateien und Styleguides) — wird ins Projekt
  kopiert und lebt dort; der Agent liest es nur auf
  Anweisung, die Anleitungen oben sind eine solche.
- Ein **vorbereitetes `wiki/`** als Kopier-Quelle:
  der Prozess für Softwareentwicklung (RP-1 auf SP-1) ist aktiviert, die
  Vorauswahlen sind gebucht.
- **`referenzprozesse/`** — alle Prozess-Vorlagen als
  Nur-Lese-Quelle; bleiben in `_template/`.
- **`INIT.md`**, **`migration/MIGRATION.md`**,
  **`upgrade/UPGRADE.md`** — die drei Anleitungen;
  werden aus `_template/` oder von der Repo-URL
  gelesen, nie kopiert.
- **`setup/`** — die Kopier-Skripte, die der Agent
  anbietet; **`tools/`** — das Prüfprogramm, das der
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
der Quelltext in `setup/` und `tools/` und die
Werkzeuge unter `referenzprozesse/*/tools/` stehen
unter **Apache-2.0**. Die mitgelieferten Normtexte
(die Gesetzes-Dateien unter
`referenzprozesse/SP-2-Recht-und-Verwaltung/research/`)
sind amtliche Werke und gemeinfrei; sie stehen nicht
unter CC BY 4.0. Details: [`LICENSE`](LICENSE).
