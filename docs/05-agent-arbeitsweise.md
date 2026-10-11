# Wie der Agent arbeitet

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-11; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

## Der Sessionstart

Jede Sitzung beginnt mit einem festen Ablauf, den
der Agent selbstständig durchläuft:

1. **Orientierung** — git-Zustand prüfen,
   Ordnerstruktur prüfen, Instruktionsdatei laden.
2. **Kontext laden** — die wichtigsten Fassaden
   lesen: zuerst die Landkarte `wiki/Fassaden.md`
   (was ist aktiv?), dann `wiki/Facts.md` (deine
   Fakten und Stolpersteine), offene Fragen,
   Fristen, Werkzeuge, TODO.
3. **Abgleiche** — sind alle Eingangsdokumente
   konvertiert und ingestiert? Sind Fristen
   abgelaufen? Passen Register-Stände und
   Instruktionsdatei zusammen?

Erst danach meldet er sich — mit den Befunden, nicht
mit Innenleben.

## Erledigt / Aktion / Frage

Strukturierte Meldungen des Agenten trennen immer
drei Dinge:

- **Erledigt:** was tatsächlich passiert ist — reine
  Statusmeldung.
- **Aktion:** was er als Nächstes tut, sofern du
  nicht widersprichst — hierhin gehört alles, was er
  selbst ableiten kann, als fertiger Entwurf.
- **Frage:** was er wirklich von dir braucht — und
  nur das. Vor jeder Frage prüft er, ob die Antwort
  aus den vorhandenen Dateien ableitbar ist;
  Ableitbares wird vorgeschlagen, nicht abgefragt.

Für mechanisch geregelte Standardaufgaben (Ingest,
Index-Pflege, Commits, Berichte ablegen) fragt der
Agent nicht, sondern führt aus und meldet —
**Widerspruch jederzeit möglich**, dann wird
zurückgerollt. Bei großen Stapeln schlägt er einen
Arbeitsmodus vor: durcharbeiten, Unklarheiten in
`Offene Fragen.md` sammeln, am Ende gebündelt
vorlegen.

## Commit-Disziplin

Der Agent committet **je Zug** — eine thematisch
abgeschlossene Einheit, ein Commit, mit festem
Präfix (`Ingest:`, `Wiki:`, `Output:`, `Report:` …).
Die Commit-Sprache legst du beim Start fest. So
erzählt die git-Historie die Projektgeschichte in
kleinen, nachvollziehbaren Schritten; am
Sitzungsende bleibt kein unaufgeräumter Arbeitsbaum
zurück. Gepusht wird nie eigenmächtig, neue Remotes
nur auf deine ausdrückliche Anweisung.

## Subagenten, Prüfungen, Berichte

Für Prüfungen und Recherchen kann der Agent
**Unter-Agenten** starten. Zwei Grundsätze:

- **Zwei-Modelle-Regel:** Substanzielle Prüfungen
  (stimmt die Migration? deckt die Spezifikation die
  Anforderungen?) macht möglichst ein **anderes**
  KI-Modell als das, das die Arbeit gemacht hat —
  ein unabhängiger Blick statt Selbstkontrolle.
- **Berichte sind Nachweise:** Jedes
  Prüf-/Recherche-Ergebnis wird als Bericht im Wiki
  abgelegt (Register `wiki/Agent-Berichte.md`,
  Nummern `REP-…`; Recherchen in
  `wiki/Rechercheartefakte.md`, `REC-…`) — **bevor**
  es im Chat zusammengefasst wird. Die Regel bei
  Prüfungen: grün → weiter; sonst nacharbeiten und
  erneut prüfen, bis grün.

## Berichten statt Blockieren

Ein durchgängiges Prinzip: Werkzeug- und
Prüf-Ergebnisse (auch rote Tests) werden
**berichtet**, halten die Arbeit aber nicht
automatisch an — du entscheidest über den Umgang.
Der Agent arbeitet weiter, wo es geht, und macht
Lücken sichtbar, statt stillzustehen.

## Werkzeug-Agnostik

Das Regelwerk ist bewusst unabhängig vom konkreten
KI-Produkt. Jeder Agent erzeugt sich seine native
Instruktionsdatei (Claude Code: `CLAUDE.md`, Cursor:
`.cursorrules`, …) und adaptiert die beschriebenen
Mechanismen auf seine eigenen Werkzeuge — gleiches
Verhalten, eigene Mittel. Mehrere Agenten
verschiedener Hersteller können im selben Projekt
koexistieren: Sie teilen sich dieselbe Wahrheit im
`wiki/`.
