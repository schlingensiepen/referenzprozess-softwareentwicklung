# Upgrade — ein Projekt auf den aktuellen Stand heben

> **Herkunft:** abgeleitet aus `../upgrade/UPGRADE.md`,
> `../upgrade/1.x-nach-2.0.md`, `../setup/upgrade.sh`
> (als Implementierung der Mechanik), `../INIT.md`
> (Schritt 0), `../README.md` und dem vorbereiteten
> `../wiki/` (`Aktivierter-Prozess.md`,
> `Init-Choreografie.md`, `Zielmarken.md`,
> `Kettenpruefung.md`, `Fassaden.md`, `Katalog.md`,
> `Agent-Berichte.md`); erzeugt am 2026-10-28 aus dem
> Starter in Version 2.0. Dieses Dokument wird nicht
> von Hand nachgepflegt, sondern zu festen Anlässen neu
> aus den Quellen erzeugt.

Zurück zur [Einführung](Einfuehrung.md).

## Wann das der richtige Weg ist

Das Upgrade gilt für jedes Projekt, das schon mit einer
Vorlage arbeitet und einen **Herkunfts-Vermerk** trägt
— aus diesem Starter oder aus der allgemeinen Vorlage,
mit oder ohne Prozess. Ein Projekt ohne
Herkunfts-Vermerk und ohne `_template/`, das sein
Wissen in verstreuten Dateien sammelt, ist kein
Upgrade-, sondern ein Migrations-Fall
([Migration](Migration.md)); der Agent sagt es dir.

Zwei Dinge stehen fest, bevor etwas geschieht:

- **Was in `_template/` landet, ist der neue Stand
  derselben Vorlage, aus der dein Projekt stammt.** Ein
  Projekt aus diesem Starter bekommt den neuen Stand
  des Starters; ein Projekt aus der allgemeinen Vorlage
  bekommt deren neuen Stand, nicht den Starter. Woher
  dein Projekt stammt, liest der Agent aus der Zeile
  `Quelle` des Herkunfts-Vermerks. Für ein Projekt aus
  der allgemeinen Vorlage ist die Anleitung des
  Starters nur Anleitung — das Skript gilt für Projekte
  aus diesem Starter.
- **Das Projekt behält seinen Prozess.** Projekte ohne
  Software-Prozess gehen denselben Weg; Schritte, die
  Phasen oder RP-1 voraussetzen, entfallen dort.

Du startest den Agenten im Projektordner mit dem Satz
aus der `../README.md`:

> Hebe das Projekt in diesem Verzeichnis auf den
> aktuellen Stand nach der Anleitung unter
> https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.

Der Agent liest `upgrade/UPGRADE.md` direkt von der
Repo-URL; sobald `_template/` den neuen Stand trägt,
liest er von dort.

## Die Grundsätze

Alles Weitere folgt aus drei Grundsätzen; wo ein Fall
in der Anleitung nicht ausdrücklich steht, entscheiden
sie:

- **Nichts geht verloren.** Nichts überschreiben,
  nichts löschen ohne deinen ausdrücklichen Wunsch.
  Darum steht der Sicherungs-Commit vor allem anderen,
  bleibt der alte Stand von `_template/` in der
  Git-Geschichte, überschreibt das Upgrade keine
  bestehende Datei des Projekts (Änderungen daran sind
  Vorschläge), bleiben Altbestände lesbar
  (Bestandsschutz; die Überführung wird angeboten) und
  bleiben historische Einträge, alte Ablöse-Vermerke
  und alte Ideen-Einträge unverändert stehen. Darum
  auch **kein Upgrade, solange eine Zwischenmarke
  läuft**: zwei Arbeitslinien auf einer Struktur, die
  sich unter beiden ändert — der Agent verweist auf die
  Zeit nach der Rückkehr, wenn die zurückgestellte
  Marke wieder `in-progress` ist (siehe
  [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
  „Zwischenmarke“).
- **Alles wird einsortiert.** Was der neue Stand
  verlangt, überträgt der Agent in die Struktur der
  Vorlage oder verlinkt es; die Herkunft bleibt
  erkennbar. Darum legt das Upgrade neue Dateien des
  neuen Stands an, trägt der Herkunfts-Vermerk die
  Versionsfolge, bekommen umbenannte Elemente ihre alte
  Kennung als Alias, und was nicht mechanisch
  überführbar ist, steht als Angebot in seinem Bericht
  an dich — nie wird etwas verworfen.
- **Im Zweifel fragt er dich.** Gesammelt in der
  Übersicht zu Beginn und mit den Vorschlägen des
  Delta-Nachzugs; danach arbeitet er autonom. Ist die
  Quelle deiner Vorlage nicht erreichbar (privates Git,
  kein Netz), meldet er das und hält an — du nennst
  eine andere Quelle (etwa einen lokalen Klon derselben
  Vorlage), stellst den Zugang her oder lässt das
  Upgrade; der Agent wechselt nicht von sich aus auf
  eine andere Vorlage. Erkennt er am Herkunfts-Vermerk
  eines Nachbar-Repos, dass es noch nicht gehoben ist,
  schreibt er ihm keine Nachricht (es könnte sie weder
  lesen noch quittieren), sondern bittet dich, die Sache
  wie bisher weiterzugeben, und empfiehlt, den Nachbarn
  bald zu heben.

Feste Regeln gibt es nur dort, wo eine Maschine liest
(Lint und Skript: die Zeilen `Template-Stand` und
`Vorher` mit der Zuordnungstabelle darunter, Marke und
Anlage-Datum neuer Elemente, die Umbenennungen und
Formalien, die das Skript umstellt) oder wo du bewusst
vom vernünftigen Standard abweichst (dieselbe Vorlage
bleibt die Vorlage; neue Dateien ohne Rückfrage).

**Keine Ausführung ohne Zustimmung.** Der Tausch von
`_template/` und das Skript sind Angebote — der Agent
nennt, was er tun will, und handelt erst nach deiner
Antwort. Ausgenommen sind die Commits, die er in einem
Satz ankündigt: der Sicherungs-Commit und die Commits
je Schritt.

## Schritt 0 — den Ausgangsstand erkennen

Bevor der Agent etwas tut, liest er und legt dir das
Ergebnis als Übersicht vor, je Punkt eine Zeile: alte
und neue Version, Anbindungs-Modus, Vorlage, Prozess,
Rolle, laufende Marke, offene Zwischenmarke, sein
Vorschlag für den Weg (Skript oder von Hand).

- **Herkunfts-Vermerk** in `wiki/Aktivierter-Prozess.md`
  — in der 2.0-Form ein Abschnitt `## Herkunft` mit den
  Zeilen `Template-Stand`, `Quelle`, `Anbindungs-Modus`,
  `Prozess`, `Rolle`, `Übernahme-Art`; in der 1.x-Form
  ein Feld „Template-Herkunft“ im Knoten.
- **Anbindungs-Modus:** verknüpfte Vorlage (Submodul),
  wenn `.gitmodules` einen Eintrag für `_template`
  trägt; eingefrorene Kopie, wenn `_template/` ein
  gewöhnlicher Ordner ohne eigenes `.git` ist.
- **Vorlage:** aus der Zeile `Quelle` bzw. dem Feld
  „Template-Herkunft“, beim Submodul zusätzlich aus
  dessen URL. Nennt sie diesen Starter, ist das Skript
  nutzbar; nennt sie die allgemeine Vorlage, geht der
  Agent den Weg von Hand mit deren neuem Stand.
- **Fallback:** Ist die Version nicht ablesbar
  (ungefülltes Feld, kein `_template/`), fragt der
  Agent dich nach dem Stand, mit dem das Projekt
  angelegt wurde; Anhaltspunkt ist ein Diff der
  Regelwerks-Dateien gegen den ersten Release-Tag der
  Vorlage. **Fehlt `_template/`** (ein 1.0-Projekt
  direkt aus der allgemeinen Vorlage), fragt er nach
  Vorlage und Einbindung wie beim Projektstart und legt
  `_template/` in Schritt 2 an. Ist die Herkunft auch
  dann nicht erkennbar, fragt er.
- **Laufende Marke und Zwischenmarke** aus dem
  Register Zielmarken; hat das Projekt keine
  `in-progress`-Marke, benennst du sie jetzt
  (Schritt 4).
- **Angebot der zwei Wege** (Projekt aus diesem
  Starter): das Skript `setup/upgrade.sh` für die
  Mechanik (empfohlen: deterministisch, ändert Inhalte
  nicht, listet Treffer) oder dieselben Schritte von
  Hand; von Hand ist zugleich der Rückfall, wenn das
  Skript nicht lauffähig ist. Du wählst.

## Schritt 1 — die Sicherung

Der Agent committet den unveränderten Ausgangszustand,
**vor** dem Tausch — angekündigt, nicht erfragt:
„Sicherung vor Upgrade auf Template-Stand 2.0“. Es
gelten dieselben Schutzregeln wie bei der Migration:
kein leerer Commit, ignorierte Dateien bleiben
ignoriert, offensichtlich sensible oder sehr große
Dateien lässt er aus und nennt sie, eine fehlende
git-Identität erfragt er, bei laufendem Merge oder
Rebase, abweisendem Hook oder verlangter Signatur hält
er an und beschreibt die Lage.

## Schritt 2 — `_template/` durch den neuen Stand ersetzen

Der neue Stand ist der aktuelle Stand derselben
Vorlage. Der Agent nennt das exakte Kommando vorher:

- **Verknüpfte Vorlage:** das Submodul wird auf den
  neuen Stand gesetzt. Schlägt das fehl, meldet er und
  hält an.
- **Eingefrorene Kopie:** der Agent klont den neuen
  Stand außerhalb des Projekts, liest Commit und Tag
  ab und ersetzt `_template/` durch die Kopie ohne
  `.git`. Die alte Kopie bleibt in der Git-Geschichte
  des Sicherungs-Commits — das Archiv des Ur-Stands
  geht nicht verloren. Bei einem Projekt aus diesem
  Starter übernimmt das Skript den Tausch.
- **Ohne `_template/`:** Einbindung nach deiner
  Antwort wie beim Projektstart, mit dem neuen Stand.

Danach ein eigener Commit „Vorlage auf Stand 2.0
gesetzt“ (bei der Kopie einschließlich der kompletten
Kopie). Ab hier liest der Agent Anleitung und
Regelwerk aus `_template/`.

## Schritt 3 — die Mechanik: Skript oder von Hand

Die folgenden Schritte sind reine Mechanik — Inhalte
ändern sie nicht. Für ein Projekt aus diesem Starter
führt sie das Skript aus:
`sh <neuer Stand>/setup/upgrade.sh --vorher <alte Version>`
aus dem Projektordner, wobei `<neuer Stand>` der Klon
aus Schritt 2 ist oder `_template`, wenn es den neuen
Stand schon trägt; `--nur-pruefen` zeigt vorher, was
es täte. Von Hand geht der Agent dieselbe Liste durch;
sie ist der führende Ort, das Skript ihre
Implementierung.

| Schritt | Was geschieht |
|---|---|
| Vorprüfung | Sicherungs-Commit vorhanden, kein laufender Merge; `_template/` und Modus erkannt; Vorlage ist dieser Starter |
| Tausch | Submodul neu setzen bzw. Kopie ersetzen (Schritt 2); nicht erreichbare Quelle → Abbruch mit Meldung |
| Umbenennungen | `wiki/Verwendungs-Rollen.md` → `wiki/Rollen.md`; `wiki/Knotentypen.md` → `wiki/Katalog.md` (nur der Dateiwechsel; der Inhalt kommt in Schritt 5 und 6); Dateinamen mit Umlaut oder ß in die ae/oe/ue/ss-Form — per `git mv`, nie über eine vorhandene Datei |
| Neue Dateien | jede Datei des neuen Stands, die im Projekt fehlt (Root-Regelwerk, `wiki/` samt Katalog-Einträgen, Mechanik-Knoten, Fassaden, Vorlagen), wird angelegt und gesammelt gemeldet — Fassaden, die der aktive Prozess voraussetzt, aktiv, optionale deaktiviert mit Hinweis an dich; eine bestehende Datei wird nie überschrieben |
| Formalien | Feld-Umbenennungen im Kopf der Knoten, ein abgeschaffter Status-Wert wird umgestellt, Rollen-Knoten bekommen ihre Rollen-Art (Einzelheiten unten, „Der Sprung von 1.x auf 2.0“) |
| Herkunft | die Zeile `Template-Stand: 2.0 seit <Tag des Upgrades>` neu, darunter `Vorher: <alte Version> (bis <Tag des Upgrades>)`; die 1.x-Form wird zur 2.0-Form (Schritt 7 füllt die übrigen Zeilen) |
| Trefferliste | alles, was der Agent danach kontext-bewusst nachzieht (Schritt 6): Wikilinks auf umbenannte Dateien, alte Kennungen, Pflegezeilen, Altknoten, alte Ablöse-Vermerke, die Liste der bestehenden Dateien mit Unterschieden |
| Lint | als Trefferliste; maßgeblich ist der Durchgang in Schritt 8 |

Danach Commit „Upgrade: Mechanik“.

## Schritt 4 — Pflicht-Fassaden und laufende Marke

Die Register Zielmarken und Entscheidungen sind in
jedem Projekt Pflicht; fehlten sie, hat Schritt 3 sie
als neue Dateien angelegt. Trägt keine Marke
`in-progress`, legt der Agent die von dir benannte
laufende Marke jetzt an — vor jeder Buchung, weil
jedes neue Element sie trägt. Fassaden, die der aktive
Prozess voraussetzt, sind aktiv; die
Fassaden-Landkarte wird nachgeführt. Ohne Prozess gilt
nur die Pflicht der Basis.

## Schritt 5 — der Delta-Nachzug der lebenden Dokumente

Für jede Datei, die es im Projekt **und** im neuen
Stand gibt — das Regelwerk im Root, die Styleguides,
der Abschnitt `## Meta` jeder Fassade, die
Mechanik-Knoten, die Vorlagen —, vergleicht der Agent
die Fassung unter `_template/` mit der lebenden Kopie
und legt dir Übernahmen **als Vorschlag** vor:
gesammelt, je Datei mit dem, was sich ändert und was
projekt-eigen bleibt. Eine bestehende Datei ändert
sich nie automatisch; projekt-eigene Einträge bleiben,
Regelwerks-Text wird übernommen. Neue Dateien sind
keine Übernahmen — die hat Schritt 3 angelegt. Dazu:

- die **Instruktionsdatei** des Agenten wird nach dem
  MasterPrompt nachgezogen;
- bei **Rolle Koordinator** ergänzt der Agent in der
  Komponenten-Tabelle der Architektur-Fassade die
  Spalten Pfad und Remote als Vorschlag (Werte aus den
  Nachbarverzeichnissen); bestehende Inhalte bleiben.
  Bei **Rolle Komponente** leitet er die Übernahme-Art
  aus der früher gebuchten Modus-Wahl ab und legt sie
  dir zur Bestätigung vor; ist nichts gebucht, fragt
  er;
- `Tools.md` bekommt den Lint als Template-Werkzeug und
  die Prüf-Werkzeuge mit Ersatzweg, falls noch nicht
  gebucht — Schritt 8 braucht sie.

Nach deiner Antwort setzt er um und committet
„Upgrade: Delta-Nachzug“.

## Schritt 6 — der Sprung von 1.x auf 2.0

Je Versions-Sprung liegt eine eigene Datei
`upgrade/<alt>-nach-<neu>.md` im Starter; für ein
Projekt aus Version 1.0 oder 1.1 ist das
`upgrade/1.x-nach-2.0.md`. Sie nennt, was der Sprung am
Bestand ändert — mechanisch durch das Skript und
kontext-bewusst durch den Agenten, jede Stelle einzeln
mit Blick auf den Kontext, kein pauschales
Suchen-und-Ersetzen — und was unter Bestandsschutz
bleibt.

**Was das Skript umstellt** (Formalien, Inhalt
unverändert):

- Im Kopf der Anforderungs-Knoten heißt das Feld für
  die Art der Anforderung jetzt `requirement_type:`
  statt `subtype:`; im Kopf aller Detail-Knoten
  `superseded_by:` statt `superseded-by:`.
- Der Status „umgesetzt, wartet auf Prüfung“ entfällt:
  umgesetzt ist, was am Tag hängt, geprüft, was ein
  Testbericht belegt. Einträge mit dem alten Status
  werden „umgesetzt“ mit dem Vermerk „Prüfung offen“;
  die zugehörige Auslöser-Zeile streicht der Agent.
- `wiki/Verwendungs-Rollen.md` wird `wiki/Rollen.md`;
  jeder Rollen-Knoten trägt die Rollen-Art
  „Verwendungsrolle“.
- `wiki/Knotentypen.md` wird `wiki/Katalog.md`
  (Dateiwechsel); die Katalog-Einträge des neuen Stands
  kommen als neue Dateien.
- Dateinamen mit Umlaut oder ß bekommen die
  ae/oe/ue/ss-Form.
- Das Feld „Template-Herkunft“ wird zum Abschnitt
  `## Herkunft` mit den Zeilen `Template-Stand` und
  `Vorher`.

**Was der Agent kontext-bewusst nachzieht:**

- **Wikilinks** auf umbenannte Dateien — in Fassaden,
  Mechanik-Knoten, der Landkarte, dem Index, der
  Instruktionsdatei. Eingefrorene Einträge
  (Freigaben, abgeschlossene Elemente) bleiben
  unverändert; ein toter Link dort ist ein Lint-Hinweis
  am Bestand, kein Fehler.
- **Katalog statt Knotentypen:** Für jeden
  projekt-eigenen Typ entsteht ein eigener
  Katalog-Eintrag; dann ersetzt der Agent den Inhalt
  von `Katalog.md` durch den des neuen Stands
  (Delta-Vorschlag) und verankert die projekt-eigenen
  Einträge darin.
- **Spezifikation wird Funktionsbeschreibung:**
  Einträge im Register Spezifikationen aus 1.x sind
  Funktionsbeschreibungen (Außensicht). Jeder
  `SPEC`-Eintrag wandert mit gleicher Nummer als
  `FUNC`-Eintrag ins Register Funktionsbeschreibungen;
  der Detail-Knoten trägt die alte Kennung als Alias.
  Laufende Freigaben gelten weiter und beziehen sich
  auf den entsprechenden Stand der
  Funktionsbeschreibung — der Freigabe-Eintrag bleibt
  unverändert, der Lint löst die alte Kennung über den
  Alias auf. Das Register Spezifikationen startet leer
  für die neue Phase P8.
- **Fehlerbericht wird Fehlermeldung:** jeder
  `BR`-Eintrag wird mit gleicher Nummer ein
  `BUG`-Eintrag mit Alias; Verweise wie bei `SPEC`.
- **Pflegezeile** „Stand:“ der Fassaden wird
  „Bearbeitungsstand:“ — nur die Pflegezeile; „Stand“
  als eingefrorenes Dokument in `output/` bleibt.
- **Phasen-Zuordnung.** Die Phasen des
  Software-Prozesses sind in 2.0 neu nummeriert: P1 bis
  P3 unverändert; P4 „Spezifizieren der Funktion“ heißt
  jetzt P4 „Beschreiben der Funktion“; P5 bis P7
  unverändert; **P8 „Spezifizieren“ ist neu**, ohne
  Vorgänger, mit der Spezifikation als Bauanleitung;
  alt P8 „Ausarbeiten“ → P9, P9 „Testen“ → P10,
  P10 „Ausliefern“ → P11, P11 „Produzieren“ → P12,
  P12 „Betreiben“ → P13. Historische Einträge bleiben
  unverändert; Freigaben wie „freigegeben für P8
  Ausarbeiten“ lesen sich über die Tabelle, die als
  Vermerk im Herkunfts-Vermerk direkt unter der Zeile
  `Vorher` steht — ins Entscheidungs-Register kommt
  kein Eintrag. Neue Freigaben nennen Nummer **und**
  Tätigkeitsname.
- **Landkarte und Steuerungs-Übersicht:** neue
  Fassaden des neuen Stands eintragen, neue
  Mechanik-Knoten ergänzen; die RP-1-Fassaden
  Softwaresystemarchitektur und
  Softwaresystemtest-Setup erhalten im Delta-Vorschlag
  die Marker, dass sie die SP-1-Fassaden
  Systemarchitektur und Systemtest-Setup ablösen.

**Was bleibt (Bestandsschutz):**

- Altknoten vom Typ Testplan oder Deployment unter
  `wiki/` bleiben unverändert lesbar; der Lint meldet
  sie als Hinweis. Der Agent bietet die Überführung an:
  Testpläne in Testfall-Elemente, der nächste Testplan
  entsteht als Stand in `output/`; Deployments in
  Deployment-Elemente und Zielumgebungen.
- Contract-Einträge alter Form bleiben lesbar; die
  Überführung in die neue Form wird beim Upgrade des
  Providers angeboten und per Nachricht an den
  Koordinator nachgezogen — bis dahin ein Lint-Hinweis.
- Die alte Sektion „Nachweis“ bleibt in alten
  Anforderungen; neue erhalten sie nicht (Nachweis ist
  der Testbericht).
- Elemente ohne Anlage-Datum und ohne Marke sind
  Bestand: sie gelten ab ihrer Annahme für jede Marke,
  der Lint meldet das fehlende Feld als Hinweis,
  nachgetragen wird nichts. Was ab dem Stichtag
  entsteht, trägt beides.
- Abgeschlossene 1.x-Marken ohne Abschluss-Stand gelten
  als abgeschlossen und eingefroren; ein
  Abschluss-Stand wird nicht nachgebaut. Für die
  laufende Marke gilt ab jetzt die normale Kette.
- Alte Ablöse-Vermerke bleiben stehen (Text eines
  eingefrorenen Knotens); der Lint meldet den toten
  Link dort als Hinweis und nennt die Alias-Form.
- Alte Ideen-Einträge „Fassaden-Kandidat …, vertagt“
  bleiben; legt der Agent den Kandidaten später erneut
  vor, gelten die üblichen Antworten Ja, Nein, Später.
- Aktive Fehlermeldungen ohne aktive Anforderungen
  meldet der Lint als Fehler mit Heilweg (Anforderungen
  aktivieren oder Fehlermeldungen deaktivieren); der
  Agent legt dir die Wahl vor.
- Das neue Format für Agent-Berichte gilt nur für neue
  Berichte.
- Zwischenmarke und Sackgasse, Tag-Konvention,
  Fix-Anforderung, Nachtrag und Wiedervorlage hatten in
  1.x keine Vorläufer — nichts zu überführen; die
  Konventionen in `wiki/Facts.md` werden vor dem ersten
  Tag bzw. der ersten Zwischenmarke abgefragt.

**Projekte ohne Software-Prozess** gehen denselben Weg;
die Punkte zu Spezifikation, Fehlerbericht, Rollen,
Phasen und Contracts entfallen, soweit die Fassaden
fehlen. Katalog, Formalien, Herkunft, Marken und
Bestandsschutz gelten unverändert.

Danach Commit.

## Schritt 7 — die Herkunft nachführen

Im Abschnitt `## Herkunft` von
`wiki/Aktivierter-Prozess.md` steht danach:

- `Template-Stand: 2.0 seit JJJJ-MM-TT` — der Tag des
  Upgrades; er ist der Stichtag, den der Lint liest:
  neue Pflichtfelder gelten als Fehler nur für
  Elemente ab diesem Tag;
- `Vorher: <alte Version> (bis JJJJ-MM-TT)` — direkt
  darunter; frühere `Vorher`-Zeilen bleiben stehen,
  ein Projekt sammelt so seine Versionsfolge. Direkt
  unter der Zeile steht als Vermerk die
  Zuordnungstabelle alt → neu, die die Sprung-Datei
  vorgibt (für 1.x → 2.0 die Phasennummern);
- `Quelle` (Repo-URL und Stand des neuen Stands),
  `Anbindungs-Modus`, `Prozess`, `Rolle`,
  `Übernahme-Art`; bei der 1.x-Form wird das Feld
  „Template-Herkunft“ zur Zeile `Quelle`.

Commit „Upgrade: Herkunft“.

## Schritt 8 — die Absicherung

1. **Lint** ohne Fehler; Hinweise zum Bestand
   (Altknoten, abgeschlossene Marken ohne
   Abschluss-Stand, alte Ablöse-Vermerke, Elemente ohne
   Feld) sind erwartet — jeden anderen Hinweis
   begründet der Bericht des Agenten.
2. **Maschinelle Vorprüfung** durch zwei Prüfer
   verschiedener Modelle als frische Agenten,
   unabhängig voneinander (aus `Tools.md`; gibt es nur
   ein Modell: frische Agenten desselben Modells,
   ausdrücklich als schwächere Absicherung benannt):
   Vollständigkeit (jede Position der Anleitung und der
   Sprung-Datei umgesetzt oder als Angebot berichtet?),
   Treue (Inhalte unverändert, nur Formalien und
   Kennungen umgestellt, Altbestände lesbar?), Links
   (Wikilinks heil, Aliase gesetzt?), Herkunft und
   Marken (`Template-Stand`, `Vorher`,
   Zuordnungstabelle, laufende Marke, neue Elemente
   mit Marke und Datum, Bestand ohne beides?). Je ein
   Bericht mit Ampel und nummerierten Befunden, zuerst
   abgelegt, dann zusammengefasst. **Beide grün →
   weiter.** Sonst: nacharbeiten, Commit,
   Kurz-Re-Check beider Prüfer — höchstens drei Runden;
   danach ein Konvergenz-Bericht an dich statt Grün; ein
   Befund, der in gleicher Form wiederkehrt, geht sofort
   an dich.
3. **Du als Prüfer.** Hat das Projekt den Ersatzweg
   „Anwender als Prüfer“ gebucht, prüfst du jetzt das
   Ergebnis der Vorprüfung; dein Urteil hält ein
   eigener Bericht fest.
4. Dasselbe Review läuft bei einem **Prozess-Upgrade**
   (Hinzufügen oder Wechsel eines Prozesses), wenn es
   bestehende Einträge migriert.
5. Abschluss-Commit „Upgrade auf Template-Stand 2.0
   abgeschlossen“; `devstate_active.md` wird
   nachgeführt.

## Im Verbund

Jedes Repo hebt sich selbst; es gibt keine feste
Reihenfolge, und gemischter Betrieb mit noch nicht
gehobenen Nachbarn ist zulässig — an einen nicht
gehobenen Nachbarn schreibt der Agent keine Nachricht
(Grundsätze oben). Übergabe-Stände für bereits laufende
Komponenten entstehen nur auf deinen Zuruf, nicht
automatisch. Was mit alten Contract-Einträgen geschieht,
steht oben unter „Bestandsschutz“.

## Danach

Ab dem Upgrade gilt für die laufende Marke die normale
Kette: fehlende Pflicht-Stände meldet die Kettenprüfung
vor der nächsten Freigabe, der Agent bietet sie an.
Jedes neue Element trägt seine Marke und sein
Anlage-Datum; der Bestand bleibt ohne beides. Die
Upgrade-Anleitung liegt nur in `_template/upgrade/` und
wird nicht kopiert. Ab hier gilt der normale Betrieb
(siehe [Arbeitsweise](Arbeitsweise.md)).

Unabhängig vom Upgrade kannst du einen Referenzprozess
jederzeit ergänzen oder wechseln — außer während einer
Zwischenmarke; Quelle ist `_template/referenzprozesse/`,
bestehende Einträge migriert der Agent (siehe
[Referenzprozesse](Referenzprozesse.md)). Enthält der
angebundene Stand den gewünschten Prozess noch nicht,
hebst du zuerst die Vorlage.
