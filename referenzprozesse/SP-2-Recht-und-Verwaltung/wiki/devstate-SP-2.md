---
type: internal-pattern
---

# devstate-SP-2

Mitgebrachter Mechanik-Knoten von SP-2
(`Steckbrief.md` §„Mitgebrachte Mechanik“; Einführung
beim Merge nach Wiki.md §11.3). Dieser Knoten sagt,
**wie SP-2 die Datei `devstate_active.md` füllt**. Die
Datei selbst kommt nicht aus SP-2, sondern als Rumpf mit
der Basis (Einstieg jedes Projekts; Zweck, Abschnitte,
Verweise und Kopf-Füllung durch den Init:
[[Standarddateien-Katalog]] §2.15).

**Was SP-2 beiträgt:** den Blick auf das **Verfahren** —
wo es steht, welche Frist als nächste läuft, was als
Nächstes zu tun ist —, gefüllt nach den Phasen und
Pflicht-Ständen dieses Prozesses ([[Vorgehen-SP-2]]).
Wer das Projekt erschließen will (ein anderer Agent nach
einer Abspaltung, eine Vertretung, der Anwender nach
Monaten ohne Bewegung), beginnt hier. Bei kleinen
Fällen (Stufe 1, ein Schreiben) ist die Datei das
Mittel zum Wiederaufnehmen und deshalb Pflicht
([[Vorgehen-SP-2]] §2, Kleine Fälle).

## Füllung unter SP-2

- **Zeitpunkt:** der Init füllt den Kopf (Projekt,
  Prozess mit Referenzprozess und Ausbaustufe, erste
  Marke); die erste SP-2-Füllung entsteht mit dem
  Einlesen der bestehenden Akte (Init-Frage 8,
  `index.md` §4.5) — spätestens, wenn die erste Frist
  gezogen ist. Danach laufend gepflegt: bei jedem Zug
  ([[Vorgehen-SP-2]] §15), mindestens bei jedem
  Eingang mit Frist, jeder Freigabe, jedem
  Marken-Wechsel (Commit-Präfix `devstate:`,
  `Steckbrief.md` §„Mitgebrachte Präfixe“).
- **Vertraulichkeit:** die Datei ist der Einstieg für
  Dritte; sie **verweist** auf die Strategie, kopiert
  sie aber nie — Inhalte mit `vertraulich:
  streng-intern` stehen hier nicht, `intern` nur als
  Verweis. Die Datei selbst gilt als `intern`.

### Abschnitt „Verfahren“ (SP-2-Ergänzung)

Der Rumpf sieht vor, dass Prozesse Abschnitte ergänzen;
SP-2 fügt nach dem Kopf den Abschnitt **„Verfahren“**
ein — je Verfahren des Projekts eine Zeile oder ein
kurzer Block:

- **Stelle** (Gericht, Behörde, private Stelle; mit
  Instanz) und **Aktenzeichen** (Verweis auf das
  Register [[Verfahren]], das führt; `VF`-Nummer, bis
  ein Aktenzeichen vorliegt),
- **Ausbaustufe** (aus der Zeile `Ausbaustufe` in
  [[Aktivierter-Prozess]]; die Datei verweist nur),
- **Rolle des Anwenders** und **Vertretung** (Verweis
  auf [[Beteiligte]]),
- **Status des Verfahrens** (laufend, ruhend — mit
  `ruht_auf:`, wenn auf Anwender-Wort —, ausgesetzt,
  unterbrochen, abgeschlossen mit Abschlussform).

Bei mehreren Strängen je Strang eine Zeile mit der
Strang-Form; abgespaltene Projekte mit Übergabe-Punkt
und Repo.

### Aktueller Stand

Erste Zeile ist die Zielmarken-Zeile des Rumpfs
(„Zielmarke: <Bezeichnung der in-progress-Marke>“ — die
Fassade [[Zielmarken]] führt den Zeiger, die Datei
verweist nur; während einer Eilsache mit der
zurückgestellten Marke, bei ruhendem Verfahren mit der
Ruhe-Zeile nach `## Meta` der Fassade). Darunter in
drei bis fünf Sätzen: welche Marke läuft und ob sie
eine Ereignis-Marke, ein Schriftsatz oder ein Termin
ist; in welcher Phase sie steht; welcher Pflicht-Stand
zuletzt freigegeben wurde („Stand x von <Dokumenttyp>,
freigegeben für Pn <Tätigkeit>“); ob der Tag gesetzt
und ob eingereicht ist (Zugang gebucht?); was das
Gegenüber zuletzt getan hat (letzter Eingang mit
Datum).

### Offene Fristen und nächster Wecker (SP-2-Ergänzung)

Nach „Aktueller Stand“ der Abschnitt **„Offene Fristen“**:
die nächsten offenen Fristen aus [[Fristen]] in der
Reihenfolge ihrer Fälligkeit — je Zeile Datum,
Bezeichnung, `richtung`, `wirkung` mit `verlaengerbar`
in Kurzform (verlängerbar? Rechtsverlust?) und `zeitbudget` —, als
erste Zeile der **nächste Wecker** (die früheste offene
Frist, gleich welcher Entstehung). Fehlt eine offene
Frist, steht hier „kein Wecker gestellt“ — das ist ein
Befund ([[Vorgehen-SP-2]] §3, §8), nicht ein zulässiger
Zustand. Die Fassade Fristen führt; die Datei verweist
und nennt höchstens die nächsten fünf Fristen.

### Nächste Schritte

Die nächsten Züge ([[Vorgehen-SP-2]] §15) als Liste —
das nächste Glied der Kette, der nächste Schriftsatz
oder Termin, offene Vorlagen an den Anwender, anstehende
Prüfrunden, ausgelöste Eventualpläne, angebotene
Strang- oder Stufen-Entscheidungen.

### Blockaden und Risiken

Was den Fortgang hemmt: fehlende Freigabe (etwa die
Strategie wartet auf den Anwender), ausstehende
Lieferung der Vertretung, fehlende Vollmacht, fehlende
Unterlagen, drohende Frist mit erreichtem Zeitbudget,
offener Befund der Gegenperspektive. **Offene Fragen an
den Anwender stehen in `Offene Fragen.md`** — hier nur
der Verweis mit der Anzahl der offenen Fragen und dem
Datum der ältesten.

### Einstieg für Dritte

Die Verweisliste des Rumpfs bleibt; SP-2 ergänzt die
Register des Verfahrens, die im Projekt aktiv sind —
[[Verfahren]], [[Beteiligte]], [[Eingangsdokumente]]
(Posteingang), [[Schriftsaetze]], [[Einreichungen]],
[[Anlagen]], ab Stufe 2 [[Strategie]] (nur als Verweis,
`streng-intern`), [[Sachverhalt]], [[Argumente]] —, das
Produkt der laufenden Marke (Tag, Versionskette in
`output/`), den geltenden Akten-Führungsplan je Stelle
und die Wegweiser der Ordnung ([[Wegweiser]]). Jeder
Verweis trägt eine Link-Beschreibung (Gegenstand,
Zweck, Lese-Moment).

**Abgespaltenes oder aufnehmendes Projekt:** Hat das
Projekt einen Strang abgespalten, nennt „Einstieg für
Dritte“ das neue Projekt mit Übergabe-Punkt; ist es
selbst abgespalten, den Abgebenden mit Übergabe-Punkt
([[Zuschnitt-aendern]] §Übergabe-Punkt). Ein Mandat
(Vertretung ohne Repo) steht im Abschnitt „Verfahren“
bei der Vertretung.

## Beispiel (erfunden)

```
**Projekt:** Beitragsstreit Musterverband
**Prozess:** SP-2 / RP-21 — Ausbaustufe 2 seit 2026-03-04
**Bearbeitungsstand:** 2026-03-18

## Verfahren
- Stelle: Beitragsstelle des Musterverbands, Widerspruchsverfahren
  — Aktenzeichen VF-001 (noch keines der Stelle); Rolle: Mitglied
  (Widerspruchsführer), ohne Vertretung; Status: laufend

## Aktueller Stand
Zielmarke: Widerspruch
Die Marke „Widerspruch“ steht in P7; der Verfahrens-Stand ist
freigegeben für P6/P7, die Verfahrens-Entscheidungen liegen zur
Prüfung (Gegenperspektive läuft). Letzter Eingang: Beitragsbescheid
vom 2026-03-02, zugegangen 2026-03-04.

## Offene Fristen
- Nächster Wecker: 2026-04-04 Widerspruchsfrist (gegen-uns,
  nicht verlängerbar, Rechtsverlust; Zeitbudget 2026-03-28)
- 2026-04-18 Erwartung: Eingangsbestätigung der Stelle (für-uns)
```

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-2)`)
- Rumpf und Basis-Beschreibung der Datei:
  [[Standarddateien-Katalog]] §2.15
- Kern-Kurzform: SP-2-`index.md` §4.3
- Zielmarken-Zeile: `## Meta` der Fassade [[Zielmarken]]
- Fristen und Wecker: [[Vorgehen-SP-2]] §3
