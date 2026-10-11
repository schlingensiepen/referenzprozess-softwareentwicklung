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
„Aktueller Stand" (drei bis fünf Sätze; erste Zeile
bei aktiver Zielmarken-Fassade:
„Zielmarke: <Bezeichnung der in-progress-Marke>" —
die Fassade führt den Zeiger, devstate referenziert
nur), „Nächste
Schritte" und „Blockaden/Risiken"; bei Koordinator-Rolle
zusätzlich „Gesamtstand" (aggregiert aus den kanonischen
Wiki-Fassaden).

**Kein separates `devstate_system.md`** in RP-1 —
der Koordinator-`devstate_active.md` §Gesamtstand
aggregiert stattdessen aus den kanonischen Wiki-Fassaden
(im RP-1-Kontext: Softwaresystemarchitektur,
Entscheidungen, Contract-Index).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-1)`)
- Kern-Kurzform: SP-1-`index.md` §4.5
- Zielmarken-Zeile: `## Meta` der Fassade [[Zielmarken]]
