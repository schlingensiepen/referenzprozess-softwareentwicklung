# Die zwei Wege: neues Projekt oder Migration

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-11; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

## Gemeinsame Mechanik

Beide Wege funktionieren gleich (die genauen
Kommandos stehen in der README):

1. **Einbinden:** Der Starter kommt als git-Submodul
   `_template/` in deinen Projektordner (empfohlen —
   so bleibt er nur-lese und auf einen festen Stand
   gepinnt, Updates sind später gezielt abrufbar).
   Alternativ: einmalige Kopie an einen Ort deiner
   Wahl, ohne Update-Verbindung.
2. **Kopieren:** Ein kurzes Skript aus `setup/`
   kopiert die Startausstattung ins Projekt —
   Regelwerks-Dokumente, `referenzprozesse/`, das
   vorbefüllte `wiki/` und den Arbeitsstands-Zettel
   `devstate_active.md`. Eiserne Regel der Skripte:
   **nie eine vorhandene Datei überschreiben** —
   Kollisionen werden gelistet und dir vorgelegt.
   Läuft das Skript in deiner Umgebung nicht,
   kopiert der Agent von Hand nach der
   Kopier-Liste, die in der jeweiligen Choreografie
   steht.
3. **Choreografie abarbeiten:** Der Agent liest die
   passende Anleitung **aus `_template/`** (sie wird
   nie ins Projekt kopiert) und führt dich durch den
   Rest.

Nie ins Projekt kopiert werden: die README des
Starters, die Choreografien selbst, `docs/`,
`setup/` und die Lizenzdatei — alles bleibt in
`_template/` dauerhaft nachlesbar.

## Weg 1: Neues Projekt (INIT.md)

Das Skript heißt `setup/init-frisch.sh`, die
Choreografie `_template/INIT.md`. Weil das Wiki
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

Das Skript heißt `setup/init-migration.sh`, die
Choreografie `_template/migration/MIGRATION.md`. Der
Unterschied zum Frisch-Fall: Dein Projekt hat schon
Wissen — verstreut in README-Dateien, Notizen,
Changelogs. Die Migration überführt es ins Wiki,
in fünf Phasen:

- **Phase 0 — Sicherung:** Alt-Zustand committen,
  dann Skript-Lauf. Das Skript kopiert dieselbe
  Ausstattung wie im Frisch-Fall und **tauscht
  danach einige Varianten-Dateien ein** — z.B.
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
Starter bleibt als `_template/` (oder Kopie) liegen
— als Nachschlagewerk, Reaktivierungs-Quelle und
Update-Weg; ein Migrations-Projekt behält zusätzlich
seine Alt-Dateien als eingefrorenen Nachweis.
