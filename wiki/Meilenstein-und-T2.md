---
type: internal-rule
---

# Meilenstein-und-T2

**Ich bin neu in SP-1** — mitgebrachter Mechanik-Knoten
(SP-1-Steckbrief §„Mitgebrachte Mechanik"; Einführung
beim Merge nach Wiki.md §11.3). Wortlaut aus der
SP-1-Prozess-Definition (`index.md` §4.2/§4.3) hierher
verlagert; dort stehen die Kurzformen.

## Wächter — SP-1-Trigger T2

Das Wächter-Grundkonzept (Meta-Hook, der zu Trigger-
Zeitpunkten Prüfungen ausführt) liegt in der Basis mit
Triggern T1 (Sessionstart) und T3 (User-Anfrage).

**SP-1 ergänzt Trigger T2 — Prozess-Meilenstein-Wechsel.**
Der Wächter läuft eine volle Runde bei jedem Meilenstein:
Abschluss eines Meilenstein-Vorgangs
(§Meilenstein-Vorgang unten), Buchung
einer zweck-gebundenen Freigabe (RP-1 präzisiert die
Freigabe-Anlässe), Abschluss eines Scaffolding-Schritts,
**Zielmarken-Wechsel** (Wechsel des `in-progress`-Zeigers
— die Wechsel-Prozedur steht in der `## Meta` der
Fassade Zielmarken; der T2-Lauf reaktiviert dabei auch
Einträge mit Marken-Trigger auf die neue Marke).
Die konkreten Meilenstein-Definitionen sind
prozess-abhängig.

**Meilenstein-Regel „agent-lokal, mit Aggregaten für
Koordinator":**

- **Komponenten-Agent:** hat die Zweck-Freigaben seiner
  eigenen Komponente als Meilensteine (T2-Trigger).
- **Koordinator-Agent:** hat die Zweck-Freigaben der
  Gesamtsystem-Phasen als Meilensteine plus **Aggregate
  über alle Komponenten** (die letzte gleichartige
  Komponenten-Freigabe aller Komponenten wird als
  Koordinator-Meilenstein gewertet — der Koordinator-
  Wächter läuft, sobald alle Komponenten den Meilenstein
  erreicht haben).
- **Ein-Komponenten-Fall / Standalone:** alle
  Zweck-Freigaben des eigenen Repos als Meilensteine
  (kein Koordinator/Komponent-Split nötig).

Die konkreten Freigabe-Anlässe liegen in RP-1
(`_template/referenzprozesse/RP-1-Systementwicklung/wiki/Vorgehen-RP-1.md`
§4).

## Meilenstein-Vorgang

Ein **Meilenstein-Vorgang** ist ein SP-1-Konstrukt: ein
zusammenhängender Vorgang mit definiertem Ergebnis, der
mit einem Meilenstein (T2) abschließt. Beispiele: ein
Scaffolding-Schritt (Anlage der Grundstruktur eines
Codeprojekts), eine Umsetzungsphase (ein REQ von
`in-umsetzung` bis `umgesetzt`), ein Freigabe-Zyklus.

**Kennzeichen:**

- Klarer Auslöser (was startet den Vorgang).
- Klares Ergebnis (was liegt am Ende vor, welche Fassaden-
  Einträge sind aktualisiert).
- T2-Meilenstein am Ende (Wächter läuft).

**Nicht jede Aufgabe ist ein Meilenstein-Vorgang** — es
geht um strukturbestimmende Vorgänge, die Meilenstein-
Charakter haben. Ad-hoc-Änderungen (Tippfehler-Fix,
kleiner Wiki-Nachtrag) sind kein Meilenstein-Vorgang.

**Verhältnis zur Zug-Terminologie:** ein
Meilenstein-Vorgang besteht typischerweise aus mehreren
Zügen (thematisch abgeschlossene Einheiten, 1 Zug =
1 Commit — Begriffs-Definitionen Arbeitsschritt und Zug
in MasterPrompt §6.1, Meilenstein-Vorgang hier);
was ein Zug in SP-1 typisch ist, steht in
`Vorgehen-SP-1.md` §7.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-1)`)
- Kern-Kurzformen: SP-1-`index.md` §4.2 und §4.3
- Zug-Terminologie: MasterPrompt §6.1;
  `Vorgehen-SP-1.md` §7
