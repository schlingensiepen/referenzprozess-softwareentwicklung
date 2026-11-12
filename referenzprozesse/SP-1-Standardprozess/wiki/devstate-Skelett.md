---
type: internal-pattern
---

# devstate-Skelett

**Ich bin neu in SP-1** — mitgebrachter Mechanik-Knoten
(SP-1-Steckbrief §„Mitgebrachte Mechanik"; Einführung
beim Merge nach Wiki.md §11.3). Dieser Knoten sagt,
**wie SP-1 die Datei `devstate_active.md` füllt**. Die
Datei selbst kommt nicht aus SP-1, sondern als Rumpf
mit der Basis (Einstieg jedes Projekts; Zweck,
Abschnitte, Verweise und Kopf-Füllung durch den Init:
[[Standarddateien-Katalog]] §2.15).

**Was SP-1 beiträgt:** den **Gesamtstand** — den
ausführlichen Zustandsbericht nach außen (Marken,
Komponenten, Stände) —, gefüllt nach den Phasen und
Pflicht-Ständen dieses Prozesses. Andere Prozesse
füllen die Datei nach ihrer eigenen
`Vorgehen-<Prozess>.md`; der Rumpf trägt den Platz
dafür.

## Füllung unter SP-1

- **Zeitpunkt:** der Init füllt den Kopf; die erste
  SP-1-Füllung von „Aktueller Stand“ und „Nächste
  Schritte“ entsteht beim ersten Scaffolding-Schritt,
  spätestens mit dem Scaffolding-Commit
  ([[Vorgehen-SP-1]] §4a). Danach laufend gepflegt
  (Commit-Präfix `devstate:`, Steckbrief
  §„Mitgebrachte Präfixe“).
- **Aktueller Stand:** erste Zeile ist die
  Zielmarken-Zeile des Rumpfs („Zielmarke: <Bezeichnung
  der in-progress-Marke>“ — die Fassade [[Zielmarken]]
  führt den Zeiger, die Datei verweist nur; wie die
  Zeile während einer Zwischenmarke und bei ruhendem
  Projekt lautet, steht in `## Meta` der Fassade
  [[Zielmarken]], Ruhe-Zeile und Zwischenmarke).
  Darunter in drei bis fünf Sätzen: in welcher Phase
  die Marke steht, welcher Pflicht-Stand zuletzt
  freigegeben wurde („Stand x von <Dokumenttyp>,
  freigegeben für Pn <Tätigkeit>“) und welches Glied
  als nächstes gebildet wird; bei einer Komponente
  dazu, ob die Lieferung (Tag) schon gemeldet ist.
- **Nächste Schritte:** die nächsten Züge
  ([[Vorgehen-SP-1]] §7) als Liste — das nächste
  Glied der Kette, offene Vorlagen, anstehende
  Prüfläufe.
- **Blockaden und Risiken:** was den Fortgang hemmt
  (fehlende Freigabe, offener Contract, blockierter
  Testfall); offene Fragen an den Anwender stehen in
  `Offene Fragen.md`, hier nur der Verweis.
- **Einstieg für Dritte:** die Verweisliste des Rumpfs
  bleibt; SP-1 ergänzt die Register der Kette, die im
  Projekt aktiv sind (etwa [[Anforderungen]],
  [[Systemarchitektur]], [[Deployments]]), und das
  Produkt der laufenden Marke (Tag).
- **Gesamtstand** (nur Koordinator-Rolle, unten).

## Gesamtstand des Koordinators

Eine abgeleitete Sicht, keine Wahrheit — der Abschnitt
„Gesamtstand“ verweist auf die Orte, an denen der Stand
der Komponenten gebucht ist, und hält selbst keine
gepflegten Zahlen oder Listen:

- den Marken-Eintrag der `in-progress`-Marke in
  [[Zielmarken]] — Abschnitt „Zuliefernde
  Komponenten“, lesen, um zu sehen, welche Komponente
  geliefert oder ihre Marke abgeschlossen hat;
- den [[Contract-Index]] — lesen, um zu sehen, welche
  Schnittstellen gelten und wer sie nutzt;
- §Komponenten der Architektur-Fassade — lesen, um
  Lage und Zuschnitt der Komponenten zu finden.

Jeder Verweis trägt eine Link-Beschreibung
(Gegenstand, Zweck, Lese-Moment).

**Kein separates `devstate_system.md`:** Eine eigene
Gesamtstands-Datei des Koordinators gibt es nicht;
diese Stelle ist der führende Ort der Regel. Der
Gesamtstand entsteht nur als Sicht in
`devstate_active.md` §Gesamtstand.

**Überführter Betrieb:** Hat das Projekt den Betrieb
einer Zielumgebung an ein Infrastruktur-Projekt
abgegeben ([[Vorgehen-SP-1]] §2 Anmerkung P13), nennt
„Einstieg für Dritte“ das Betriebs-Projekt mit dem
Übergabe-Punkt; den Betriebsstand führt jenes Projekt
in seiner eigenen `devstate_active.md`.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-1)`)
- Rumpf und Basis-Beschreibung der Datei:
  [[Standarddateien-Katalog]] §2.15
- Kern-Kurzform: SP-1-`index.md` §4.5
- Zielmarken-Zeile: `## Meta` der Fassade [[Zielmarken]]
