---
type: internal-pattern
---

# devstate-Skelett

**Ich bin neu in SP-1** — mitgebrachter Mechanik-Knoten
(SP-1-Steckbrief §„Mitgebrachte Mechanik"; Einführung
beim Merge nach Wiki.md §11.3). Wortlaut aus der
SP-1-Prozess-Definition (`index.md` §4.5
„`devstate_active.md` im Repo-Root") hierher verlagert;
dort steht die Kurzform.

SP-1 legt eine spezielle Datei `devstate_active.md` im
Repo-Root an (nicht im `wiki/`), die den **aktuellen
Zustandsbericht** trägt. Zweck: externer Einstiegspunkt
für Dritte (z.B. andere Agenten, Ops-Teams,
Projektmanagement), die den Stand des Projekts brauchen
ohne das gesamte Wiki lesen zu müssen.

**Anlage-Zeitpunkt und Minimal-Skelett:** Anlage beim
ersten Scaffolding-Schritt, spätestens mit dem
Scaffolding-Commit. Minimal-Skelett mit den Sektionen
„Aktueller Stand" (drei bis fünf Sätze; erste Zeile:
„Zielmarke: <Bezeichnung der in-progress-Marke>" —
die Fassade führt den Zeiger, devstate referenziert
nur; läuft eine Zwischenmarke, nennt die Zeile dahinter
die zurückgestellte Marke: „2.0.1 (Zwischenmarke; 2.1
zurückgestellt, kehrt nach Abschluss von 2.0.1
zurück)" — folgt eine weitere Zwischenmarke, nennt die
Zeile die laufende („2.0.2 (Zwischenmarke; 2.1
zurückgestellt, kehrt nach Abschluss von 2.0.2
zurück)"); ruht das Projekt, nennt sie statt einer
Marke den Ruhezustand: „Zielmarke: — (Projekt ruht seit
JJJJ-MM-TT)"; [[Zielmarken]] §Meta), „Nächste
Schritte" und „Blockaden/Risiken"; bei Koordinator-Rolle
zusätzlich „Gesamtstand" (unten).

**Gesamtstand des Koordinators:** eine abgeleitete
Sicht, keine Wahrheit — der Abschnitt verweist auf die
Orte, an denen der Stand der Komponenten gebucht ist,
und hält selbst keine gepflegten Zahlen oder Listen:

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

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-1)`)
- Kern-Kurzform: SP-1-`index.md` §4.5
- Zielmarken-Zeile: `## Meta` der Fassade [[Zielmarken]]
