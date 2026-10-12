# Die zwei Wege: neues Projekt oder Migration

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-12; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

## Gemeinsame Mechanik

Beide Wege beginnen gleich:

1. **Ein Satz an den Agenten:** Du startest deinen
   KI-Agenten im Projektordner — einem neuen, leeren
   Ordner oder dem Ordner deines bestehenden
   Projekts — und gibst ihm einen einzigen Satz, der
   nur auf die Repo-URL verweist. Die beiden Sätze
   stehen zum Herauskopieren ganz oben in der
   README:
   - neues Projekt: „Richte dieses Verzeichnis als
     neues Projekt nach der Anleitung unter
     https://github.com/schlingensiepen/referenzprozess-softwareentwicklung
     ein."
   - Migration: „Migriere das Projekt in diesem
     Verzeichnis nach der Anleitung unter
     https://github.com/schlingensiepen/referenzprozess-softwareentwicklung."

   Alles Weitere ergibt sich aus dem Repo: Der Agent
   liest die README, findet dort den Abschnitt „Für
   KI-Agenten" und liest die passende Anleitung
   (`INIT.md` bzw. `migration/MIGRATION.md`) direkt
   von der URL — dafür muss noch nichts in deinem
   Projekt liegen.
2. **Einbindungs-Frage:** Als Erstes fragt dich der
   Agent, wie die Vorlage unter `_template/` in dein
   Projekt kommt (bei einer Migration, nachdem er
   deinen Alt-Zustand per Commit gesichert hat):
   - **verknüpfte Vorlage, die du später gezielt
     aktualisieren kannst** (empfohlen; technisch
     ein git-Submodul, auf einen festen Stand
     „gepinnt") — neue Vorlagen-Stände holst du
     später gezielt ab.
   - **eingefrorene Kopie der Vorlage, die dauerhaft
     im Projekt bleibt, damit du immer siehst, womit
     du gestartet bist** (technisch eine Einmal-Kopie
     ohne Git-Verbindung, die mit deinem Projekt
     committet wird) — einen neueren Stand
     übernimmst du später durch bewussten Austausch
     der Kopie.

   In beiden Fällen bleibt `_template/` dauerhaft
   im Projekt und wird nie verändert; den
   eingebundenen Stand vermerkt der Agent im Wiki.
   Eingebunden wird erst nach deiner Antwort — und
   gibt es in deinem Ordner noch kein git-Repo,
   fragt dich der Agent auch, bevor er eines
   anlegt.
3. **Kopier-Angebot:** Danach bietet der Agent an,
   die Startausstattung ins Projekt zu kopieren —
   Regelwerks-Dokumente, das vorbefüllte `wiki/` und
   den Arbeitsstands-Zettel `devstate_active.md`.
   Die Prozess-Vorlagen (`referenzprozesse/`)
   bleiben in `_template/` und werden nicht
   kopiert. Du wählst zwischen dem
   Kopier-Skript aus `setup/` (empfohlen —
   deterministisch; der Agent nennt dir vorher das
   exakte Kommando) und einer Kopie von Hand durch
   den Agenten nach der Kopier-Liste, die in der
   jeweiligen Anleitung steht und ohnehin führend
   ist. Auf beiden Wegen gilt: **nie wird eine
   vorhandene Datei überschrieben** — Kollisionen
   werden gelistet und dir später zur Entscheidung
   vorgelegt.
4. **Anleitung abarbeiten:** Der Agent führt dich
   durch den Rest (Fragen-Block bzw. Migration). Die
   Anleitung liest er ab der Einbindung aus
   `_template/` — sie wird nie ins Projekt kopiert.

Kein Schritt, der etwas in deinem Projekt anlegt,
läuft ungefragt. Wer lieber selbst Hand anlegt,
findet die Kommandos in der README („Oder von Hand
einrichten") und startet den Agenten danach mit
demselben Satz — die Anleitungen erkennen erledigte
Schritte.

Nie ins Projekt kopiert werden: die README des
Starters, die Anleitungen selbst, `docs/`, `setup/`,
`referenzprozesse/` und die Lizenzdatei — alles
bleibt in `_template/` dauerhaft nachlesbar.

## Weg 1: Neues Projekt (INIT.md)

Die Anleitung heißt `INIT.md`, das Kopier-Skript
`setup/init-frisch.sh`. Weil das Wiki
vorbereitet ankommt (Prozess aktiviert,
Vorfestlegungen gebucht), bleibt ein einziger
gebündelter Fragen-Block:

- **Mission/Auftrag** deines Projekts (speist
  Projekt-Überblick und Fakten),
- **erste Zielmarken** aus dem Auftrag,
- **Commit-Sprache** (Deutsch, Englisch oder
  gemischt nach Artefakt),
- **dein Bearbeiter-Kürzel** für die Versionierung,
- **Konvertierungs-Werkzeug** vorhanden oder Agent
  übernimmt,
- **Rolle:** Standalone oder Koordinator (siehe
  [04-prozesse.md](04-prozesse.md)),
- **Remote-Ziel** (dein GitHub-Repo o.ä.).

Danach bucht der Agent die Antworten ins Wiki, legt
Instruktionsdatei und Projekt-README an, committet —
und das Projekt ist arbeitsfähig. Kein
Selbst-Abbau, kein Aufräumen: Die Anleitung lag nie
in deinem Projekt.

## Weg 2: Bestehendes Projekt (migration/MIGRATION.md)

Die Anleitung heißt `migration/MIGRATION.md`, das
Kopier-Skript `setup/init-migration.sh`. Der
Unterschied zum Frisch-Fall: Dein Projekt hat schon
Wissen — verstreut in README-Dateien, Notizen,
Changelogs. Die Migration überführt es ins Wiki,
in fünf Phasen:

- **Phase 0 — Sicherung:** Alt-Zustand committen
  (das kündigt der Agent nur kurz an; Geheimnisse
  wie `.env`-Dateien oder Schlüssel nimmt er nicht
  ungeprüft auf, sondern weist dich darauf hin —
  und fehlt noch ein git-Repo, fragt er vorher),
  dann Einbindung (Einbindungs-Frage) und Kopie
  (Skript oder von Hand, du wählst), zum Schluss ein
  Aufnahme-Commit — so trennt die Historie sauber
  „vorher" von „Vorlage da". Kopiert wird dieselbe
  Ausstattung wie im Frisch-Fall, danach werden
  **einige Varianten-Dateien eingetauscht** — z.B.
  kommen die Zielmarken „0 — Alt-Bestand" /
  „1 — Migriert" vorbelegt mit, und ein
  Konvertierungs-Werkzeug ist für die Dauer der
  Migration bewusst gesperrt. Deine Bestands-Dateien
  werden nie überschrieben.
- **Phase 1 — Fragen-Block:** ein gebündelter Turn
  (welche Dateien sind Wissensträger? welches
  Gegen-Modell prüft? Rolle? Kollisionen?).
- **Phasen 2–3 — Transformation:** Der Agent
  arbeitet autonom und überführt jede Wissens-Klasse
  an ihren Zielort (Anforderungen →
  Anforderungs-Register, Beschlüsse →
  Entscheidungs-Register, Changelog → Chronologie …)
  — mit Migrations-Marker statt erfundener Daten,
  und ohne je eine Alt-Datei zu löschen: Sie bleiben
  als Nachweis-Schicht liegen.
- **Phase 4 — Absicherung:** Ein frischer Agent
  eines anderen Modells prüft Vollständigkeit und
  Treue der Migration; nachgearbeitet wird, bis die
  Prüfung grün ist.
- **Phase 5 — Abschluss:** Restfragen (Glossar,
  Sprache, Instruktionsdatei), dann der erste
  Zielmarken-Wechsel auf „1 — Migriert".

## Was danach anders ist

Nichts mehr — das ist der Punkt. Nach INIT-Abschluss
bzw. Migrations-Abschluss sind beide Projekte
gleich: ein lebendes Wiki als Quelle der Wahrheit,
der normale Sitzungs-Ablauf, dieselben Regeln. Der
Starter bleibt als `_template/` liegen (verknüpfte
Vorlage oder eingefrorene Kopie) — als
Nachschlagewerk, Reaktivierungs-Quelle, Nachweis des
Start-Stands und Update-Weg; ein Migrations-Projekt behält zusätzlich
seine Alt-Dateien als eingefrorenen Nachweis.
