# Upgrade — ein Projekt auf den aktuellen Stand heben

> **Herkunft:** abgeleitet aus `../upgrade/UPGRADE.md`,
> `../upgrade/1.x-nach-2.0.md`, `../setup/upgrade.sh`
> (als Implementierung der Mechanik), `../INIT.md`
> (Schritt 0), `../README.md` und dem vorbereiteten
> `../wiki/` (`Aktivierter-Prozess.md`,
> `Init-Choreografie.md`, `Zielmarken.md`,
> `Kettenpruefung.md`, `Fassaden.md`, `Katalog.md`,
> `Agent-Berichte.md`). Stand der Quellen:
> Starter-Commit `959026c` (Version 2.0). Dieses
> Dokument ist aus den Quellen abgeleitet und wird bei
> Änderungen der Quellen auf deren Stand nachgezogen
> (zuletzt am 2026-10-28); eigene Inhalte bekommt es
> nicht — Änderungen gehören in die Quellen.

Zurück zur [Einführung](Einfuehrung.md).

## Wann das der richtige Weg ist

Das Upgrade gilt für jedes Projekt, das aus einer
Vorlage stammt — aus diesem Starter oder aus der
allgemeinen Vorlage, mit oder ohne Prozess, mit
**Herkunfts-Vermerk** (dem Abschnitt „Herkunft“ in
`wiki/Aktivierter-Prozess.md`) oder (Stand 1.0) ohne.
Ein Projekt aus Stand 1.0, das noch keinen Vermerk
hat, erkennst du daran, dass `MasterPrompt.md` und
`Wiki.md` im Projekt-Root neben einem `wiki/` mit
`Aktivierter-Prozess.md` liegen. Ein
Projekt ohne Herkunfts-Vermerk und ohne `_template/`,
das sein Wissen in verstreuten Dateien sammelt, ist
kein Upgrade-, sondern ein Migrations-Fall
([Migration](Migration.md)); der Agent sagt es dir.

**Versionen.** Der Starter trägt die Versionsnummer
2.0 (die `../README.md` nennt sie); frühere Stände
waren 1.0 und 1.1 — zusammen „1.x“. Welche Version
dein Projekt hat, steht in der Zeile `Template-Stand`
seines Herkunfts-Vermerks; aus derselben Zeile im
Starter liest der Agent die Zielversion. Ein Projekt
aus Version 1.1 erkennt der Agent an der älteren Form
des Vermerks, eines aus 1.0 daran, dass der Vermerk
fehlt (unten, Schritt 0); die Stände 1.0 und 1.1
tragen in der Quelle die Release-Tags `release-1.0`
und `release-1.1`, an denen er die alte Version
abliest.

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
  aus diesem Starter; wo der Agent dann liest und woher
  neue Dateien kommen, steht unten unter „Projekt aus
  der allgemeinen Vorlage“.
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
liest er von dort — bei einem Projekt aus der
allgemeinen Vorlage von Anfang an aus einem Lese-Klon
des Starters (unten).

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
  Vorschläge) und bleiben Altbestände lesbar — etwa
  historische Einträge und alte Ablöse-Vermerke
  (Bestandsschutz; die Überführung wird angeboten).
  Darum auch **kein Upgrade, solange eine Zwischenmarke
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
  eines Nachbar-Repos (die Zeile `Template-Stand` fehlt
  oder nennt 1.x; wo der Nachbar liegt, sagt die
  Komponenten-Tabelle der Architektur-Fassade), dass es
  noch nicht gehoben ist,
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

**Projekt aus der allgemeinen Vorlage.** Die Regel
„dieselbe Vorlage bleibt die Vorlage“ heißt für die
Orte:

- **Anleitung und Sprung-Datei** liest der Agent von
  Schritt 0 an aus einem vorübergehenden Klon des
  Starters außerhalb deines Projekts, nur zum Lesen
  (dem Lese-Klon, den er nach dem Upgrade löscht) —
  denn der neue Stand der allgemeinen Vorlage unter
  `_template/` enthält weder die Anleitungen noch die
  Skripte. Das Skript entfällt, der Agent geht den Weg
  von Hand.
- **Neue Dateien** kommen aus dem neuen `_template/`,
  zusammengeführt wie beim Einspielen eines Prozesses
  (erklärt in [Referenzprozesse](Referenzprozesse.md),
  „Einspielen“; den Wortlaut führt `Wiki.md`): das
  Basis-Wiki aus `referenzprozesse/base/wiki/` und dazu
  der Wiki-Ordner des aktiven Prozesses unter
  `referenzprozesse/`; welche Fassaden der Prozess
  voraussetzt, sagt sein Steckbrief. Dasselbe gilt für
  ein Projekt aus diesem Starter, das mit einem anderen
  Prozess als dem Software-Prozess arbeitet.
- **Ausgangsstand ohne Herkunfts-Vermerk oder ohne
  `_template/`** (Stand 1.0): siehe Schritt 0.

**Zustimmung.** Die Übersicht in Schritt 0 mit dem
Vorschlag des Agenten für den Weg ist die eine Frage
vor der Arbeit; mit deiner Antwort führt er Tausch,
Skript und Schritte aus — du stößt nur an. Das Skript
bleibt ein Angebot (Schritt 0, zwei Wege). Jedes
Kommando nennt er vorher exakt; Commits kündigt er in
einem Satz an: den Sicherungs-Commit und die Commits
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
  ein Feld „Template-Herkunft“ im Knoten (fehlt dort
  die Rolle, fragt er); ohne Vermerk (Stand 1.0 kannte
  ihn nicht) fragt er dich nach Vorlage und Version —
  Anhaltspunkt ist ein Vergleich der Regelwerks-Dateien
  deines Projekts mit den Ständen der Vorlage.
- **Anbindungs-Modus:** verknüpfte Vorlage (Submodul,
  **B**), wenn `.gitmodules` einen Eintrag für
  `_template` trägt; eingefrorene Kopie (**A**), wenn
  `_template/` ein gewöhnlicher Ordner ohne eigenes
  `.git` ist.
- **Alte Version:** aus der Zeile `Template-Stand`.
  Ein 1.x-Stand nennt sie nicht; dann ist der Commit
  der Herkunft der Anker — das Feld „Template-Herkunft“
  bzw. bei der verknüpften Vorlage der Stand, auf den
  das Submodul **vor** dem Tausch gepinnt war: liegt er
  genau auf einem Release-Tag der Quelle, ist das die
  alte Version; bei der verknüpften Vorlage liest das
  Skript sie so selbst. Sonst fragt der Agent dich, mit
  welchem Stand das Projekt angelegt wurde (etwa
  `1.1`), und gibt deine Angabe dem Skript mit; weißt du
  es nicht genau, gilt deine Angabe (etwa `1.x`) — das
  Skript schreibt keine geratene Version.
- **Projekt schon auf dem aktuellen Stand:** Nennt
  `Template-Stand` schon die Zielversion, gibt es keinen
  Sprung — ohne Zeile `Vorher` trägt dein Projekt den
  Stand seit seiner Anlage, mit `Vorher` ist der Sprung
  vollzogen. Der Agent fragt dich, ob er einen neueren
  Commit derselben Version nachziehen soll: dann
  tauscht er `_template/` (Schritt 2) und legt dir den
  Delta-Nachzug vor (Schritt 5), mehr nicht. Das Skript
  hält ohne `Vorher` an und legt mit `Vorher` nur neue
  Dateien an.
- **Vorlage:** aus der Zeile `Quelle` bzw. dem Feld
  „Template-Herkunft“, beim Submodul zusätzlich aus
  dessen URL. Nennt sie diesen Starter, ist das Skript
  nutzbar; nennt sie die allgemeine Vorlage, geht der
  Agent den Weg von Hand mit deren neuem Stand.
- **Fehlt `_template/`** (ein 1.0-Projekt direkt aus
  der allgemeinen Vorlage), fragt er nach Vorlage und
  Einbindung wie beim Projektstart — mit deiner Vorlage
  als Quelle — und legt `_template/` in Schritt 2 an.
  Ist die Herkunft auch dann nicht erkennbar, fragt er.
- **Laufende Marke und Zwischenmarke** aus dem
  Register Zielmarken; findet das Skript dort keine
  `in-progress`-Zustandszeile, liest der Agent das
  Register selbst, und hat das Projekt keine laufende
  Marke, benennst du sie jetzt (Schritt 4).
- **Angebot der zwei Wege** (Projekt aus diesem
  Starter mit dessen Software-Prozess): das Skript
  `setup/upgrade.sh` für die Mechanik (empfohlen:
  deterministisch, ändert Inhalte nicht, listet
  Treffer; aufgerufen nach dem Tausch aus
  `_template/setup/`, eine Vorschau davor aus einem
  Klon) oder dieselben Schritte von Hand; von Hand ist
  zugleich der Rückfall, wenn das Skript nicht
  lauffähig ist. Du wählst. Arbeitet das Projekt mit
  einem anderen Prozess, hält das Skript an, und der
  Agent geht den Weg von Hand — neue Dateien kommen
  dann aus `_template/referenzprozesse/`, wie oben für
  die allgemeine Vorlage beschrieben.

## Schritt 1 — die Sicherung

Der Agent committet den unveränderten Ausgangszustand,
**vor** dem Tausch — angekündigt, nicht erfragt:
„Sicherung vor Upgrade auf Template-Stand 2.0“. Es
gelten dieselben Schutzregeln wie bei der Migration:
kein leerer Commit, ignorierte Dateien bleiben
ignoriert, offensichtlich sensible oder sehr große
Dateien lässt er aus und nennt sie (sie bleiben
ungetrackt liegen; auch das Skript nennt sie und lässt
sie unberührt), eine fehlende git-Identität erfragt er,
bei laufendem Merge oder Rebase, abweisendem Hook oder
verlangter Signatur hält er an und beschreibt die
Lage.

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
  geht nicht verloren.
- **Ohne `_template/`:** Einbindung nach deiner
  Antwort wie beim Projektstart, mit dem neuen Stand
  und der Quelle aus Schritt 0.

Danach ein eigener Commit „Vorlage auf Stand 2.0
gesetzt“ (bei der Kopie einschließlich der kompletten
Kopie). Ab hier liest der Agent Regelwerk und neue
Dateien aus `_template/` und die Anleitung aus
`_template/upgrade/` (allgemeine Vorlage: Lese-Klon).

## Schritt 3 — die Mechanik: Skript oder von Hand

Die folgenden Schritte sind reine Mechanik — Inhalte
ändern sie nicht. Für ein Projekt aus diesem Starter
führt sie das Skript aus:
`sh _template/setup/upgrade.sh` aus dem Projektordner,
nach dem Tausch und seinem Commit (mit `--vorher
<alte Version>`, wenn der Agent sie in Schritt 0
erfragt hat). `--nur-pruefen` zeigt vorher, was es
täte, auch vor der Sicherung — vor dem Tausch aus
einem Klon des Starters außerhalb des Projekts, weil
das alte `_template/` eines 1.x-Projekts das Skript
noch nicht hat. Aus dem Klon ohne diese Option führt
es nur den Tausch aus und hält für den Commit aus
Schritt 2 an. Ein zweiter Lauf ändert nichts mehr und
sagt das; einen Commit schlägt er dann nicht vor. Von
Hand geht der Agent dieselbe Liste durch; sie ist der
führende Ort, das Skript ihre Implementierung.

| Schritt | Was geschieht |
|---|---|
| Vorprüfung | Sicherungs-Commit vorhanden (keine Änderung an getrackten Dateien; ungetrackte Dateien, die Schritt 1 ausgelassen hat, bleiben unberührt und werden genannt), kein laufender Merge; `_template/` trägt den neuen Stand, Modus erkannt; Vorlage ist dieser Starter, Prozess ist der Software-Prozess; alte Version bekannt |
| Tausch | geschehen in Schritt 2 — das Skript stellt nur fest, dass `_template/` den neuen Stand trägt |
| Umbenennungen | Dateinamen nach der Tabelle der Sprung-Datei (`Rollen.md`, `Katalog.md`, Umlaute in die ae/oe/ue/ss-Form) — per `git mv`, nie über eine vorhandene Datei |
| Neue Dateien | jede Datei des neuen Stands, die im Projekt fehlt (Root-Regelwerk, `wiki/` samt Katalog-Einträgen, Mechanik-Knoten, Fassaden, Vorlagen; eine `.gitignore` nur, falls keine da ist), wird angelegt und gesammelt gemeldet — Fassaden, die der aktive Prozess voraussetzt, aktiv, optionale deaktiviert mit Hinweis an dich, abgelöste nur als Hintergrund; eine bestehende Datei wird nie überschrieben; eine so angelegte Fassade trägt im Kopf den Vermerk „beim Upgrade angelegt“ |
| Formalien | Feld-Umbenennungen im Kopf der Knoten, ein abgeschaffter Status-Wert wird umgestellt, Rollen-Knoten bekommen ihre Rollen-Art, der Nachfolger einer Ablösung bekommt den Rückverweis (Einzelheiten unten, „Der Sprung von 1.x auf 2.0“) |
| Herkunft | die Zeile `Template-Stand: 2.0 seit <Tag des Upgrades>` neu, darunter `Vorher: <alte Version> (bis <Tag des Upgrades>)`; die 1.x-Form wird zur 2.0-Form (Schritt 7 füllt die übrigen Zeilen) |
| Trefferliste | alles, was der Agent danach kontext-bewusst nachzieht (Schritt 6): Wikilinks auf umbenannte Dateien, alte Kennungen, Pflegezeilen, Marken-Zeiger, Altknoten, Contract-Einträge alter Form, alte Ablöse-Vermerke; dazu die Liste der bestehenden Dateien mit Unterschieden, eingeteilt wie in Schritt 5 |
| Lint | als Trefferliste; maßgeblich ist der Durchgang in Schritt 8 |

Danach Commit „Upgrade: Mechanik“ (entfällt, wenn der
Lauf nichts geändert hat). Bricht das Skript mitten im
Lauf ab, etwa weil eine Datei nicht beschreibbar ist,
bleibt das schon Geänderte im Arbeitsbaum; der Agent
committet es als Zwischenstand oder nimmt es zurück,
bevor er das Skript erneut aufruft — das sagt ihm die
Meldung.

## Schritt 4 — Pflicht-Fassaden und laufende Marke

Die Register Zielmarken und Entscheidungen sind in
jedem Projekt Pflicht; fehlten sie, hat Schritt 3 sie
als neue Dateien angelegt; waren sie deaktiviert (in
1.1 war das Register Zielmarken abwählbar), aktiviert
der Agent sie. Trägt nach der Umstellung der
Zustand-Zeilen (unten, „Der Sprung von 1.x auf 2.0“)
keine Marke `in-progress`, legt der Agent die von dir
benannte laufende Marke jetzt an — vor jeder Buchung,
weil jedes neue Element sie trägt. Fassaden, die der aktive
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
Regelwerks-Text wird übernommen — bei einer Fassade
also der Kopf (`## Meta`, Regeltext) aus der Vorlage,
die Einträge aus dem Projekt; getrennt wird an der
Überschrift des Eintrags-Abschnitts am Zeilenanfang
(in den Zielmarken `## Marken`), nicht an ihrer ersten
Erwähnung, denn `## Meta` nennt sie schon im Text.
Neue Dateien sind keine
Übernahmen — die hat Schritt 3 angelegt.

Gleicht eine lebende Kopie dem **alten Stand der
Vorlage**, hat das Projekt sie nie verändert — solche
Dateien schlägt der Agent als eine Gruppe zur Übernahme
vor; nur Dateien mit projekt-eigenen Änderungen
einzeln (das Skript teilt seine Liste so ein). Den
alten Stand findet er je Anbindung: bei der
eingefrorenen Kopie im `_template/` des
Sicherungs-Commits, bei der verknüpften Vorlage im
Stand, auf den das Submodul vor dem Tausch gepinnt war;
gab es kein altes `_template/`, holt er den alten Stand
der Quelle über ihr Release-Tag. Dazu:

- die **Instruktionsdatei** des Agenten wird nach dem
  MasterPrompt nachgezogen;
- die **Komponenten-Tabelle** der Architektur-Fassade
  bekommt die Form von 2.0, bei Rolle Komponente dazu
  die Übernahme-Art — beides unten, „Der Sprung von
  1.x auf 2.0“;
- `Tools.md` bekommt den Lint als Template-Werkzeug und
  die Prüf-Werkzeuge mit Ersatzweg, falls noch nicht
  gebucht — Schritt 8 braucht sie; ein 1.x-Projekt hat
  die Datei noch nicht, der Agent legt sie aus der
  Kopiervorlage an.

Nach deiner Antwort setzt er um und committet
„Upgrade: Delta-Nachzug“.

## Schritt 6 — der Sprung von 1.x auf 2.0

Diesen Abschnitt brauchst du nur, wenn dein Projekt
aus Version 1.0 oder 1.1 stammt; ein Projekt, das
schon mit 2.0 angelegt wurde, überspringt ihn.

Je Versions-Sprung liegt eine eigene Datei
`upgrade/<alt>-nach-<neu>.md` im Starter; für ein
Projekt aus Version 1.0 oder 1.1 ist das
`upgrade/1.x-nach-2.0.md`. Sie nennt, was der Sprung am
Bestand ändert — mechanisch durch das Skript und
kontext-bewusst durch den Agenten, jede Stelle einzeln
mit Blick auf den Kontext, kein pauschales
Suchen-und-Ersetzen — und was unter Bestandsschutz
bleibt.

Ein paar Wörter, die dabei fallen: Register-Einträge
tragen Kennungen mit Präfix — in 1.x hießen
Spezifikationen `SPEC-` und Fehlerberichte `BR-`, in
2.0 heißen Funktionsbeschreibungen `FUNC-` und
Fehlermeldungen `BUG-`. Ein **Alias** ist die alte
Kennung, die ein umbenannter Eintrag behält, damit
alte Verweise weiter auflösen. Die **Pflegezeile** ist
die Datumszeile im Kopf einer Fassade. Die
**Knotentypen** waren in 1.x das Verzeichnis der
zulässigen Typen; in 2.0 heißt es Katalog.

**Was das Skript umstellt** (Formalien, Inhalt
unverändert):

- Im Kopf der Anforderungs-Knoten heißt das Feld für
  die Art der Anforderung jetzt `requirement_type:`
  statt `subtype:`; im Kopf aller Detail-Knoten
  `superseded_by:` statt `superseded-by:`, als Liste.
  Eine Ablösung ist in 2.0 beidseitig: der Nachfolger
  bekommt `supersedes:` mit dem abgelösten Eintrag
  (1.x kannte nur den Verweis am abgelösten Knoten).
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
  Instruktionsdatei und auch in eingefrorenen
  Einträgen (Freigaben, abgeschlossene Elemente): dort
  ist es eine Korrektur toter Verweise, die das
  Einfrieren ausdrücklich erlaubt; sonst meldet der
  Lint den toten Link als Fehler. Stehen bleiben nur
  die alten Ablöse-Vermerke (unten, „Was bleibt“). Ein
  Wikilink, der nur eine Kennung nennt (etwa
  `[[REQ-001]]`), löst in 2.0 nur noch über einen
  Alias auf; der Agent schreibt ihn als Link auf die
  Datei mit der Kennung als Anzeigetext — ein Alias
  auf die eigene Kennung ist kein Ausweg.
- **Katalog statt Knotentypen:** Für jeden
  projekt-eigenen Typ entsteht ein eigener
  Katalog-Eintrag (Muster ist ein mitgelieferter
  Eintrag); dann ersetzt der Agent den Inhalt von
  `Katalog.md` durch den des neuen Stands
  (Delta-Vorschlag) und verankert darin die
  projekt-eigenen Einträge und die Einträge, die der
  Prozess mitbringt.
- **Spezifikation wird Funktionsbeschreibung:**
  Einträge im Register Spezifikationen aus 1.x sind
  Funktionsbeschreibungen (Außensicht). Jeder
  `SPEC`-Eintrag wandert mit gleicher Nummer als
  `FUNC`-Eintrag ins Register Funktionsbeschreibungen;
  der Detail-Knoten bekommt Dateiname, Kennung und
  Überschrift der neuen Form und trägt die alte
  Kennung als Alias. Laufende Freigaben gelten weiter
  und beziehen sich auf den entsprechenden Stand der
  Funktionsbeschreibung — der Freigabe-Eintrag bleibt
  unverändert, der Lint löst die alte Kennung über den
  Alias auf. Das Register Spezifikationen startet leer
  für die neue Phase P8 „Spezifizieren“.
- **Fehlerbericht wird Fehlermeldung:** jeder
  `BR`-Eintrag wird mit gleicher Nummer ein
  `BUG`-Eintrag mit Alias; Verweise wie bei `SPEC`.
- **Pflegezeile** „Stand:“ der Fassaden wird
  „Bearbeitungsstand:“ — nur die Pflegezeile; „Stand“
  als eingefrorenes Dokument in `output/` bleibt.
- **Marken-Einträge:** Der Zeiger der 1.x-Form wird zur
  Zustand-Zeile, die der Lint liest — die laufende
  Marke `in-progress`, frühere `abgeschlossen`,
  geplante `künftig`; der Text der Einträge bleibt.
  Erst danach ist entscheidbar, ob eine laufende Marke
  fehlt (Schritt 4).
- **Komponenten-Tabelle** der Architektur-Fassade: Die
  Spalten der 1.x-Form werden zu Rolle, Repo-Name,
  Pfad, Remote und Detail; die Rolle ist Koordinator,
  Komponente oder eigenes Bauteil — ein
  Standalone-Projekt trägt sich selbst als eigenes
  Bauteil mit Pfad `.` ein, ein Koordinator seine
  Komponenten mit Pfad und Remote aus den
  Nachbarverzeichnissen. Bei **Rolle Komponente**
  leitet der Agent die Übernahme-Art aus dem
  Übernahme-Modus ab, den das Projekt unter der
  1.x-Vorlage gebucht hat („Modus A, rekursiv
  selbstständig“ → selbstständig, „Modus B, Delegation
  mit Auftrag“ → Auftrag; das ist nicht der
  Anbindungs-Modus A/B von `_template/`), und legt sie
  dir zur Bestätigung vor; ist nichts gebucht, fragt er.
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
  Mechanik-Knoten und neu hinzugekommene
  Prozess-Präfixe verbuchen wie beim Einspielen eines
  Prozesses; die RP-1-Fassaden
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
- Contract-Einträge alter Form bleiben lesbar (ein
  Lint-Hinweis). Die Überführung bietet der Agent beim
  Upgrade des Providers an (der Komponente, die die
  Schnittstelle bereitstellt): er schreibt dem
  Koordinator eine Nachricht, der Koordinator bucht
  einen neuen Contract-Eintrag mit Verweis auf den
  alten — ist er selbst Provider, bucht er direkt.
  Beide Einträge sind Bestand, ohne Marke und
  Anlage-Datum.
- Ein `referenzprozesse/` im Projekt-Root (Stand 1.0,
  eingefrorene Kopie) ist durch
  `_template/referenzprozesse/` ersetzt; es bleibt
  liegen, bis du es entfernen lässt.
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
  laufende Marke gilt ab jetzt die normale Kette; dass
  Bestands-Elemente keinen Nachfolger in der Kette
  haben (eine Anforderung ohne Funktionsbeschreibung,
  ein Element ohne Testfall), meldet der Lint als
  Hinweis — der Bestand wird nicht nachgebaut.
- Alte Ablöse-Vermerke bleiben stehen (Text eines
  eingefrorenen Knotens); der Lint meldet den toten
  Link dort als Hinweis und nennt die Alias-Form.

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
  „Template-Herkunft“ zur Zeile `Quelle`; ohne Vermerk
  (Stand 1.0) legt der Agent den Abschnitt mit deinen
  Antworten aus Schritt 0 an.

Commit „Upgrade: Herkunft“.

## Schritt 8 — die Absicherung

1. **Lint** ohne Fehler; Hinweise zum Bestand
   (Altknoten, abgeschlossene Marken ohne
   Abschluss-Stand, alte Ablöse-Vermerke, aufgelöste
   alte Kennungen, alte Freigabe-Formen, Elemente ohne
   Feld, Bestands-Elemente ohne Nachfolger in der
   Kette) sind erwartet — jeden anderen Hinweis
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
   danach ein Konvergenz-Bericht an dich statt Grün
   (wiederkehrende Befunde, Ursache,
   Handlungsoptionen); ein Befund, der in gleicher Form
   wiederkehrt, geht sofort an dich.
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

Jedes Repo hebt sich selbst auf den neuen Stand seiner
Vorlage; es gibt keine feste Reihenfolge, und
gemischter Betrieb mit noch nicht gehobenen Nachbarn
ist zulässig — an einen nicht gehobenen Nachbarn
schreibt der Agent keine Nachricht (Grundsätze oben).
Übergabe-Stände für bereits laufende Komponenten
entstehen nur auf deinen Zuruf, nicht automatisch. Was
mit alten Contract-Einträgen geschieht, steht oben
unter „Bestandsschutz“.

## Danach

Ab dem Upgrade gilt für die laufende Marke die normale
Kette: fehlende Pflicht-Stände meldet die Kettenprüfung
vor der nächsten Freigabe, der Agent bietet sie an.
Jedes neue Element trägt seine Marke und sein
Anlage-Datum; der Bestand bleibt ohne beides. Die
Upgrade-Anleitung liegt nur im Starter
(`_template/upgrade/` bzw. Lese-Klon) und wird nicht
kopiert. Ab hier gilt der normale Betrieb
(siehe [Arbeitsweise](Arbeitsweise.md)).

Unabhängig vom Upgrade kannst du einen Referenzprozess
jederzeit ergänzen oder wechseln — außer während einer
Zwischenmarke; Quelle ist `_template/referenzprozesse/`,
bestehende Einträge migriert der Agent (siehe
[Referenzprozesse](Referenzprozesse.md)). Enthält der
angebundene Stand den gewünschten Prozess noch nicht,
hebst du zuerst die Vorlage.
