---
type: internal-rule
---

# Zuschnitt ändern

Wie ein Projekt seinen Zuschnitt ändert — Abspalten,
Umbauen, Zusammenführen — und wie es Einrichtungen
eines anderen Templates übernimmt (Baustein, Merge,
Join). Jeder dieser Wege ist eine Entscheidung des
Anwenders; der Agent führt keinen davon von sich aus
aus. Lesen, sobald ein Anlass auftaucht: ein Teil wird
eigenständig, eine Lage eskaliert, ein zweiter Prozess
wird gebraucht, zwei Projekte gehören zusammen, oder
ein anderes Template hat eine Einrichtung, die hier
fehlt.

## Grundsatz

Ein Projekt beginnt mit einem Zuschnitt (Prozess,
Ausbaustufe, Fassaden) und ändert ihn, wenn die Lage
es verlangt — analog zur Eskalation der Ausbaustufe
([[Katalog-process-brief]] „Pflicht ab“), auf
Projektebene. Drei Wege für Projekte, drei Reichweiten
für Einrichtungen, ein Prüfsatz, und immer die
Rückfrage-Pflicht.

## Drei Wege für Projekte

1. **Abspalten.** Ein Teil des Projekts wird ein
   eigenes Projekt mit eigenem Repo. Es startet mit
   einem **Übergabe-Punkt** (unten) und der
   Übernahme-Art `abspaltung` (`Vorgehen.md` §3) —
   etwa ein Honorarstreit, der aus einem Mietstreit
   herauswächst, oder der Betrieb einer Umgebung, den
   ein Software-Projekt an ein Infrastruktur-Projekt
   abgibt.
2. **Umbauen** im selben Repo: durch den **Wechsel
   der Ausbaustufe**, wenn der aktive Prozess Stufen
   deklariert (die Lage eskaliert — „Bescheid
   belastend, Stufe 2?“; der Agent meldet den Anlass
   als Hinweis), oder durch den **Join** eines
   zweiten Prozesses derselben Familie (unten).
3. **Zusammenführen.** Ein abgespaltenes oder
   benachbartes Projekt geht in ein anderes ein — der
   Übergabe-Punkt in Gegenrichtung: Tag im aufgehenden
   Projekt, Eintrag im Herkunfts-Vermerk des
   aufnehmenden, der Aufnehmende holt sich, was er
   braucht.

Jeder Wechsel wird als Entscheidung gebucht
([[Entscheidungen]]).

**Nicht während einer Zwischenmarke oder vorgezogenen
Marke:** Einen Prozess aktivieren, wechseln oder per
Join zuschalten geht nicht, solange eine Zwischenmarke
oder eine vorgezogene Marke (Eilsache) die laufende
Marke zurückstellt ([[Zielmarken]] §Meta); der Agent
verweist auf die Zeit nach der Rückkehr zur
zurückgestellten Marke. Der Wechsel der Ausbaustufe
bleibt auch dann möglich — er wechselt keinen Prozess,
sondern schaltet Pflicht-Fassaden zu, und gerade eine
Eilsache kann ihn verlangen (ein Eilantrag bei
Gericht); er ist wie immer die Entscheidung des
Anwenders auf den Hinweis des Agenten.

## Einrichtungen eines anderen Templates übernehmen

Welche Templates es gibt, steht in der Landkarte
[[Schwester-Templates]] — dort sucht der Agent. Drei
Reichweiten (von der einzelnen Fassade über alle
Einrichtungen bis zu den Phasen; „Stufe“ ist für die
Ausbaustufe reserviert):

- **Baustein:** das Projekt übernimmt eine einzelne
  Fassade oder Dokumentbeschreibung eines anderen
  Templates (etwa das Register der Abnahmeprotokolle
  aus dem Infrastruktur-Prozess in ein
  Software-Projekt). Die FassadenLandkarte
  [[Fassaden]] führt die Herkunft in der Kategorie
  `Prozess-mitgebracht (<Prozess>)` (Wiki.md §6.1).
  Zwischen **allen** Templates.
- **Merge:** das Projekt übernimmt die
  **Einrichtungen** eines zweiten Templates
  nachträglich als Init-Merge — Fassaden,
  Katalog-Einträge, Wächter, Styleguide-Teile,
  Begriffe (Glossar-Anhang) —, aber
  **keine fremden Phasen** ([[Init-Choreografie]]
  §Nachträglicher Init-Merge). Über **alle** Templates.
- **Join:** ein zweiter Prozess **mit eigenen
  Phasen** wird zugeschaltet. **Nur innerhalb einer
  Prozess-Familie** (desselben Standardprozesses;
  welcher, steht im Steckbrief).

Das Upgrade zieht übernommene Bausteine und gemergte
Einrichtungen mit; die Herkunft steht im
Herkunfts-Vermerk oder in der FassadenLandkarte.

## Prüfsatz

**„Braucht es eigene Phasen?“**

- **Nein** → Merge oder Baustein.
- **Ja**, und beide Prozesse gehören derselben
  Familie an → Join.
- **Ja**, andere Familie → Abspalten (Weg 1) mit
  Übergabe-Punkt und Rückverweis.

**Beispiel mit beiden Ausgängen** (Software-Projekt
`shop`): `shop` braucht Abnahmeprotokolle für den
Betrieb seiner Server — keine eigenen Phasen,
also Baustein oder Merge aus dem
Infrastruktur-Prozess. `shop` gerät in einen
Rechtsstreit mit einem Lieferanten — ein Verfahren
braucht eigene Phasen und gehört nicht zur Familie
der Entwicklungsprozesse, also Abspalten eines
Verfahrens-Projekts nach dem Starter aus
[[Schwester-Templates]].

**Beispiel aus einem Verfahren** (Begehren in einem
Projekt ohne Verfahrens-Prozess): Will ein Dritter
etwas von `shop` — eine Abmahnung, eine Mahnung, ein
Bescheid —, ist das Begehren ein Anlass für diesen
Prüfsatz. Ob es berechtigt ist, prüft man mit den
Phasen eines Verfahrens, also Abspalten eines
Verfahrens-Projekts; braucht `shop` nur dessen Typen
und Register, ohne eigene Phasen, ist es ein Merge.
Der Agent fragt nach (§Rückfrage-Pflicht), er leistet
und sagt nichts zu, bevor der Anwender entschieden hat.

## Join

- **Im selben Projekt, per Entscheidung.** Ein
  laufendes Projekt schaltet einen zweiten Prozess
  derselben Familie zu; die Zuschaltung ist eine
  Entscheidung, gebucht als DEC.
  [[Aktivierter-Prozess]] führt beide Prozesse mit dem
  Datum der Zuschaltung.
- **Nur neue Start-Fragen.** Der Init stellt beim
  Join nur die Fragen, die der zweite Prozess
  zusätzlich hat; Antworten des ersten gelten weiter
  ([[Init-Choreografie]] §Join).
- **Widerspruch.** Widersprechen sich die beiden
  Prozesse in einer Regel, gilt der **zuerst aktive**;
  der Agent nennt den Widerspruch beim Join.
- **Upgrade** zieht beide Prozesse (beide
  Herkunfts-Zeilen, beide Prozess-Ordner).
- **Prüfungen:** das Prüfprogramm schaltet die
  Prüfungen beider Prozesse zu ([[Kettenpruefung]]
  §Lint-Anteil).
- Welche Prozesse einen Join anbieten, sagt der
  jeweilige Standardprozess in seinem Steckbrief; ein
  Prozess, der den Bedarf des anderen erkennt, bietet
  den Join an — im laufenden Projekt und schon beim
  Init.

## Übergabe-Punkt

Startet ein Projekt ein anderes durch Abspalten, ist
die Übergabe ein **Zeitpunkt**, kein Dokument:

1. Der Abgebende setzt einen **Tag** im eigenen Repo.
2. Das neue Projekt trägt `<repo>/<tag>` mit Hash in
   den Herkunfts-Vermerk von [[Aktivierter-Prozess]]
   ein (Zeile „Abgespalten von … bei …“;
   [[Init-Choreografie]] §Phase A0).
3. Der andere Agent **holt sich, was er braucht**,
   über den Einstieg `devstate_active.md` des
   Abgebenden ([[Standarddateien-Katalog]]).
4. Was nach dem Übergabe-Punkt noch dazukommt, wird
   per **Folge-Tag** nachgeholt (neue Zeile im
   Herkunfts-Vermerk).

**Keine fachliche Vorauswahl:** Der Abgebende
schreibt nicht, welche Unterlagen fachlich zählen —
sonst schreibt ein Softwerker die Übergabe für einen
Juristen. Er schreibt nur auf, **wofür** das neue
Projekt eingeschaltet wird, und öffnet den
Aktenschrank; die erste Aufgabe leitet das neue
Projekt nach seinem Prozess selbst ab.

Hat das neue Projekt **keinen Lesezugriff** auf das
abgebende Repo, legt der Abgebende einen
selbsttragenden Stand zum Tag ([[Einfrieren-und-Abloesen]]
§Stand, Grad selbsttragend) und nennt ihn im
Startprompt. Der Übergabe-Stand je Komponente
(Phase P6 eines Entwicklungsprozesses) bleibt
Komponenten-Sache; die Abspaltung braucht kein
Übergabe-Dokument.

### Startprompt-Vorlage (Abspaltung und Zusammenführen)

Nach dem Muster des Komponenten-Startprompts
([[Init-Choreografie]] §Init mit Startprompt); der
Agent legt ihn in `output/` des Abgebenden ab:

```
Du startest ein Projekt nach dem Starter <Name, URL aus
Schwester-Templates>. Dabei spaltest du dich von
<abgebendes Repo: Name, Pfad oder Remote> ab.
Übergabe-Punkt: <repo>/<tag> (<Hash>).
Einstieg beim Abgebenden: devstate_active.md
[ohne Lesezugriff: selbsttragender Stand <Pfad>].
Deine erste Aufgabe nach der Initialisierung ist:
<Anlass in den Worten des Abgebenden — wofür das neue
Projekt eingeschaltet wird>.
```

Beim Zusammenführen dieselbe Vorlage in Gegenrichtung
(„… nimmst du <Repo> bei <repo>/<tag> auf …“).

## Rückfrage-Pflicht — nie von sich aus

Erkennt der Agent einen Anlass, gilt:

1. Er **spricht den Anlass an**.
2. Er legt eine **Empfehlung** vor — mit dem Prüfsatz
   („braucht es eigene Phasen?“), den Gründen und den
   Folgen (neues Repo, Übergabe, Upgrade-Verhalten) —
   als Aktions-Entwurf mit Gegen-Option
   ([[Angebots-und-Beauftragungs-Muster]]); bei
   mehreren zusammenhängenden Punkten vorher der
   Fahrplan ([[Fahrplan-Vorlage]]).
3. Er **führt erst auf das Wort des Anwenders aus**;
   die Buchung ist die Entscheidung. Bei Abspalten und
   Zusammenführen legt er zuvor eine
   **Auftragsliste zur Freigabe** vor: Repo,
   Übergabe-Punkt, Startprompt, Nachrichten
   ([[Angebots-und-Beauftragungs-Muster]]
   §Auftragsliste zur Freigabe).
4. Sagt der Anwender **Nein**, vermerkt er es im
   Entscheidungs-Register (wie bei der
   Fassaden-Promotion, Wiki.md §3a) und fragt erst bei
   einem neuen Anlass wieder.

Kein Weg und keine Reichweite dieses Knotens wird ohne
Anwender-Wort ausgeführt — das steht als Grenze in
[[Do-first-mit-Veto]].

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Grenze in [[Do-first-mit-Veto]]; Form der Vorlage und
  der Auftragsliste: [[Angebots-und-Beauftragungs-Muster]]
- Übernahme-Arten und Start-Tabelle: `Vorgehen.md` §3;
  Kette je Art: [[Kettenpruefung]] §Komponenten-Kette
  nach Übernahme-Art
- Landkarte der Templates: [[Schwester-Templates]]
- Herkunfts-Vermerk, Startprompt, Join-Fragen,
  nachträglicher Init-Merge: [[Init-Choreografie]]
- Ausbaustufen und „Pflicht ab“: [[Katalog-process-brief]];
  Wirkung in der Kette: [[Kettenpruefung]] §Fehlende
  und vertretene Glieder
- Begriffe: [[Glossar]] (Abspalten, Umbauen,
  Zusammenführen, Baustein, Merge, Join,
  Übergabe-Punkt, Abspaltung)
