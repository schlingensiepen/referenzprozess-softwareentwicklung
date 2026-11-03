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
Zeitpunkten Prüfungen ausführt) und seine
Basis-Anlässe liegen in der Basis: MasterPrompt §5.4
„Wächter-Trigger“ — lesen, um T2 gegen die übrigen
Anlässe abzugrenzen.

**SP-1 ergänzt Trigger T2 — Prozess-Meilenstein-Wechsel.**
Bei T2 läuft die **volle Wächter-Runde C4 bis C8**
(Nicht-Endzustände und eingetretene Auslöser), nicht
nur C5. Meilenstein-Anlässe:

- **Freigabe eines Pflicht-Stands der Kette** (der
  Phasen P1–P15 einer Marke, die nicht abgeschlossen
  ist — einschließlich Entwickler-Doku (P11),
  Benutzer-Doku (P12) und Betriebs-Anleitung je
  Umgebung (P15): sie sind Glieder der Kette wie jedes
  andere, ihre Freigabe ein Reifezustand der laufenden
  Arbeit; der Abschluss-Stand ist ausgenommen, nächster
  Anlass) — Vorbedingung der Freigabe ist die
  [[Kettenpruefung]]; der Meilenstein ist die Freigabe
  selbst, der Wächter läuft danach. **Keine Freigabe im
  Nachtrag zu einer abgeschlossenen Marke ist ein
  Anlass** — weder die Tag-Freigabe einer Tag-Korrektur
  noch die Freigabe eines nachgetragenen Deploy-Stands
  noch die Freigabe eines Doku-Stands, der in der
  Doku-Abfrage „später“ erhielt
  ([[Zielmarken]] §Meta, Nachtrag): die Marke ist
  abgeschlossen, ihr Meilenstein Marken-Abschluss ist
  mit dem Wechsel erreicht, am Produkt ändert sich
  nichts; eine T2-Runde folgt nicht, auch kein
  agent-lokaler Freigabe-Meilenstein (unten).
- **Marken-Abschluss** — erreicht mit dem gebuchten
  Zielmarken-Wechsel (Schritt 4 der Wechsel-Prozedur,
  `## Meta` der Fassade Zielmarken): erst damit ist die
  Marke abgeschlossen; die Freigabe des
  Abschluss-Stands (Schritt 2) ist kein eigener
  Meilenstein, weil die Schleife der Prozedur sie
  wiederholen kann. Der T2-Lauf reaktiviert dabei auch
  Einträge mit Marken-Trigger auf die neue Marke (nur
  Sammel-Register) — nach einer Zwischenmarke ist die
  neue Marke eine folgende Zwischenmarke oder, bei der
  Rückkehr nach der letzten, die zurückgestellte,
  geweckt wird, was dann noch aufgeschoben ist
  ([[Zielmarken]] §Meta, Marken-Trigger).
- **Phasen-Übergang**.
- **Scaffolding-Commit** (Anlage der Grundstruktur eines
  Codeprojekts).
- Mit RP-1 die agent-lokalen Freigabe-Meilensteine der
  Rollen (RP-1 `index.md` §6).

Jeder dieser Anlässe schließt einen Meilenstein-Vorgang
ab (§Meilenstein-Vorgang unten); einen weiteren Anlass
daneben gibt es nicht — eine Freigabe im Nachtrag zu
einer abgeschlossenen Marke ist keiner (oben). Der Zielmarken-Wechsel ist damit
kein T2-Ereignis neben den Meilenstein-Vorgängen,
sondern der Moment, in dem der Meilenstein
„Marken-Abschluss“ eintritt — ein T2-Lauf je Abschluss.

**Nicht triggern:** einzelne Register-Statuswechsel
(werden gebucht und im Erledigt-Block gemeldet),
Alltags-Commits (Ingest, Wiki-Änderung,
Output-Version), jeder einzelne Zug. **Ausgabeform:**
im Erledigt/Aktion/Frage-Raster; bei leerem Befund
keine Ausgabe.

**Meilenstein-Regel „agent-lokal":**

- **Komponenten-Agent:** hat die Freigaben der
  Pflicht-Stände seiner eigenen Kette als Meilensteine
  (T2-Trigger).
- **Koordinator-Agent:** hat die Freigaben seiner
  eigenen Pflicht-Stände als Meilensteine; das
  Koordinator-Aggregat P10+P13 benennt nur, welche
  Phasen er für das Gesamtsystem führt (Testplan-Stand
  des Integrationstests, Deploy-Stände), es bündelt
  keine Meilensteine — auch seine Doku-Glieder P11 und
  P12, die dazwischen liegen, sind je ein eigener
  Anlass. **Komponenten-
  Freigaben erreichen den Koordinator immer per
  Nachricht** — Lieferung (der Tag der Komponente, P9;
  übernommene Lieferung und Zwischen-Koordinator:
  [[Kettenpruefung]] §Kette und §Komponenten-Kette
  nach Übernahme-Art) und Marken-Abschluss (ihr
  Abschluss-Stand); das Lesen der Stände der
  Komponente ist nur die Prüfung.
  Nachricht und Buchung mit `quelle:`:
  [[Katalog-message]], lesen, wenn eine Meldung
  eingeht; gebucht wird am Marken-Eintrag
  ([[Zielmarken]], Abschnitt „Zuliefernde
  Komponenten“).
  **Koordinator-Meilenstein** (T2) sind die letzte
  Lieferung und der letzte Marken-Abschluss der Marke;
  sonst löst keine Komponenten-Freigabe eine volle
  Wächter-Runde des Koordinators aus (den Eingang der
  Nachricht behandelt C8, Anlass T5 in MasterPrompt
  §5.4).
- **Standalone** (kein Schnitt in Komponenten-Repos):
  alle Freigaben der Pflicht-Stände des eigenen Repos
  als Meilensteine. Ein Koordinator mit nur einer
  Komponente bleibt Koordinator (Koordinator-Meilenstein
  oben).

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
- Freigabe-Vorbedingung und Freigabe-Ordnung:
  [[Kettenpruefung]]; Marken-Abschluss und
  Wechsel-Prozedur: [[Zielmarken]]
