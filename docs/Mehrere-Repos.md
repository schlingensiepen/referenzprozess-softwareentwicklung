# Zusammenarbeit mehrerer Repos

> **Herkunft:** abgeleitet aus `../Vorgehen.md`
> (Abschnitte 3, 3a und 7b), `../MasterPrompt.md`
> (Abschnitte 1.5, 5.3, 5.4, 6.4 und 9.6), `../INIT.md`
> (Fragen-Block Nr. 2 und 7, „Mit Startprompt“),
> `../upgrade/UPGRADE.md` (Abschnitt „Verbund“) und dem
> vorbereiteten `../wiki/`
> (`Two-Repo-Submodul-Muster.md`,
> `Init-Choreografie.md`, `Kettenpruefung.md`,
> `Zielmarken.md`, `Katalog-message.md`,
> `Contract-Index.md`, `Vorgehen-RP-1.md`,
> `Vorgehen-SP-1.md` Abschnitt 6,
> `Katalog-Entwickler-Doku.md`, `Glossar.md`). Stand der Quellen: Starter-Commit
> `2017c75` (Version 2.1). Dieses Dokument ist aus den
> Quellen abgeleitet und wird bei Änderungen der
> Quellen auf deren Stand nachgezogen (zuletzt am
> 2026-11-03); eigene Inhalte bekommt es nicht —
> Änderungen gehören in die Quellen.

Zurück zur [Einführung](Einfuehrung.md).

Verschiedene Anlässe führen zu mehr als einem
Repository: die Trennung von **Arbeits-Repo und
Produkt** und die Zerlegung eines Systems in
**Komponenten** mit eigenen Projekten. Der Starter
regelt beide.

## Werkstatt und Produkt

**Die Frage beim Start.** „Ein Repo mit allem oder ein
zweites Repo für das Produkt?“ — Punkt 2 des
Fragen-Blocks beim Projektstart, bei der Migration eine
der Restfragen. Beim zweiten Repo bleibt das Wiki die
Quelle der Wahrheit im Arbeits-Repo; das **Produkt**
der Marke (Code, Tests, Build) liegt zusammen mit der
daraus abgeleiteten selbsttragenden Doku in einem
eigenen Repo mit vorzeigbarer Historie. Typische
Gründe: Die Arbeits-Historie (Entscheidungen,
verworfene Wege, Sitzungsstände) ist wertvoll, aber
nicht für Außen bestimmt; das Produkt soll öffentlich
sein, die Arbeit privat. Das Muster ist eine Option,
keine Pflicht.

**Bauform.** Wo die Werkzeuge es hergeben, wird das
Produkt-Repo als git-Submodul in das Arbeits-Repo
eingebettet; sonst liegen zwei Repos nebeneinander mit
einer Ignorier-Regel. Für das Remote bietet der Agent
die ihm bekannten Hoster an und legt es bei Zustimmung
an. Das Regelwerk nennt das Arbeits-Repo mit Wiki,
Registern und voller Historie die **Werkstatt** und
den geregelten Übergang von dort ins Produkt mit
Auslöser, Transformation und Freigabe die
**Schleuse** (die Ableitungs-Regel unten); beide
Wörter gelten nur in diesem Zwei-Repo-Kontext,
allgemein heißt es „Wiki“ und „abgeleitete Dokumente“.
Das **Produkt** dagegen gibt es in jedem Projekt (siehe
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
„Der Tag der Implementierung“) — hier liegt es im
eigenen Produkt-Repo.

**Die Ableitungs-Regel.** Jedes Produkt-Repo ist ein
Übergang von Wahrheit zu Artefakt: das Arbeits-Repo ist
die Wahrheit, das Produkt die Ableitung. Je Produkt-Repo
legt der Agent eine Ableitungs-Regel als Regel-Knoten an
und klärt mit dir folgende Felder:

1. **Quelle** — welcher Teil des Arbeits-Repos ist die
   Wahrheit?
2. **Ziel** — welches Repo, welcher Ordner wird
   abgeleitet?
3. **Auslöser** — wann wird abgeleitet (dein Zuruf,
   ein Prozess-Schritt, eine Freigabe)?
4. **Transformations-Regel** — was fließt wie von
   Quelle nach Ziel?
5. **Ausschlüsse** — was darf nicht ins Ziel (Interna,
   Verweise ins Arbeits-Repo, Entwurfs-Marker)?
6. **Freigabe** — wer gibt die Ableitung frei?
7. **Rück-Sync-Verbot** — das Ziel wird nie in die
   Quelle zurückgespielt; Änderungen laufen immer über
   das Arbeits-Repo.

Die **Standardbelegung**, die der Agent als Vorgabe
vorlegt: Quelle sind Wiki, Register und die
wiki-verweisenden Stände in `output/`, darunter die
Deploy-Stände; Ziel ist das
Produkt-Repo, in dem der Tag der Implementierung
gesetzt wird — Code, Tests und Build entstehen dort
direkt, ihre Festlegungen werden im Wiki gebucht; dazu
die selbsttragenden Dokumente: die Kopien der drei
Doku-Stände in `docs/developer/` (Entwickler-Doku),
`docs/user/` (Benutzer-Doku) und `docs/ops/`
(Betriebs-Anleitungen) — der freigegebene Stand selbst
bleibt versioniert in `output/` der Werkstatt — und
selbsttragende Ableitungen wie Release-Notes.
Auslöser ist je Dokumenttyp die Auslöser-Zeile seines
Katalog-Eintrags: für die drei Doku-Stände die
Doku-Abfrage, für andere Dokumente, die das Produkt
beschreiben, die Freigabe eines Stands „für P13
Ausliefern“ oder dein Zuruf (siehe
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
„Dokumentation“). Die
Transformation ist vollständige Neu-Erzeugung aus dem
Wiki bzw. den Quell-Ständen — Wikilinks und
Register-Kennungen heraus, Begründungen ausgeschrieben
— nie Nachpflegen. Die
Freigabe läuft über die Review-Kette, beim Übertrag ins
Produkt mit verschärftem Review-Angebot.

**Ein Repo.** Bei „ein Repo“ gelten dieselben Regeln
ohne Repo-Grenze: selbsttragende Dokumente liegen im
selben Repo (die Kopien der Doku-Stände in `docs/`,
die Stände selbst in `output/`) und werden zu
denselben Auslösern vollständig neu erzeugt; Submodul
und Ableitungs-Regel entfallen. Das `docs/` deines
Projekts gehört dem Projekt; diese Erklärung bleibt
unter `_template/docs/`.

**Ankündigungspflicht.** Arbeiten mehrere Beteiligte
(Mensch und Agenten, mehrere Agenten) an denselben
Repos, ist jedes Repo genau einem Bearbeiter
zugewiesen, der dort ohne Ankündigung schreiben darf;
in jedes andere Repo wird nur mit vorheriger
Ankündigung geschrieben. Das Muster ist rekursiv: ein
Produkt-Repo kann selbst Arbeits-Repo für ein eigenes
Teil-Produkt sein.

## Koordinator und Komponenten

**Teilaktivitäten starten.** In der Phase P6 „Starten
von Teilaktivitäten“ verweist das Teil-Register auf
Teil-Systeme, die selbst wieder das ganze Vorgehen
anwenden — bei Software sind das
Komponenten-Repositories als eigene Projekte aus
diesem Starter. Das Projekt, das zerlegt, ist der
**Koordinator**; jede Teilaktivität eine
**Komponente**. Die Rolle deines Repos fragt der Agent
beim Projektstart (Punkt 7 des Fragen-Blocks) bzw. bei
der Migration; Standalone ist der Standardfall, und
ein Repo wird auch später Koordinator, wenn es
Teilaktivitäten mit eigenen Repos startet. Bevor eine
Komponente startet, legt dir der Agent folgende
Entscheidungen vor und beginnt nicht von selbst:

1. **Start-Tabelle.** Je Komponente Name, Repo-Name
   (Vorgabe `<projekt>-<komponente>`), lokaler Pfad,
   Remote und Übernahme-Art — zur Freigabe; der
   Repo-Name ist die Kennung, unter der andere Repos
   auf die Komponente verweisen.
2. **Übernahme-Art.** Das Regelwerk nennt den
   Koordinator aus Sicht seiner Komponente die
   **Mutter**. *Selbstständig* (Standard): Die
   Komponente beginnt ihre eigene Kette, legt eigene
   Anforderungen an, die auf die Funktionsbeschreibung
   der Mutter verweisen, und schreibt ihre eigene
   Funktionsbeschreibung — geeignet für komplexe
   Teilaktivitäten mit eigenem inhaltlichen Anteil.
   *Auftrag*: Die Mutter beschreibt die Funktion und
   übergibt sie; die Komponente beginnt mit dem
   Zerlegen — geeignet für klar umrissene
   Ausführungs-Aufträge. Der Agent schlägt eine Art vor
   und nennt Vor- und Nachteile; die Wahl wird als
   Entscheidung gebucht.
3. **Start und Transport.** Wie der Agent der Komponente
   gestartet wird und wie Nachrichten zwischen den Repos
   laufen: (a) mit einem **Peer-Werkzeug** — einem
   Werkzeug, mit dem ein Agent einen anderen Agenten
   startet, und einem, das ihm den unveränderten
   Inhalt der Nachrichten-Datei zustellt; welche
   Werkzeuge dafür in Frage kommen, nennt dir der
   Agent — das Regelwerk empfiehlt in `../Vorgehen.md`,
   Abschnitt 3 „Start und Transport“, konkrete
   Produkte, die einzige Stelle, an der es das tut, und
   du musst dafür nicht selbst nachlesen) oder (b)
   **ohne Werkzeug**: der Empfänger liest die Nachricht
   beim Absender; den Anstoß gibst du oder der
   Nachrichten-Wächter. Der Agent nennt die Trade-offs
   (persistent oder flüchtig, synchron oder asynchron,
   Sichtbarkeit für dich); die Wahl steht in `Tools.md`.

**Startprompt.** Der Koordinator erzeugt in `output/`
einen Startprompt, den du dem Agenten des neuen Projekts
gibst — eine einmalige Übergabe, die nicht gepflegt
wird. Er beginnt mit dem Einstieg der Vorlage, aus der
der Koordinator selbst stammt — bei einem Koordinator
aus diesem Starter also mit dessen Satz für ein neues
Projekt („Richte dieses Verzeichnis als neues Projekt
nach der Anleitung unter … ein.“) —, sagt in einem
Satz, dass es andere Referenzprozesse gibt und der
Agent im Zweifel fragt, und gibt den Prozess der
Komponente **nicht** vor. Dazu nennt er die Rolle
„Komponent“ (so heißt die Komponente in der
Rollen-Frage und im Herkunfts-Vermerk), Name, Pfad und
Remote des neuen Repos, Name und Pfad des
Koordinators, die Übernahme-Art, den Verweis auf den
freigegebenen **Übergabe-Stand** (die Wurzel der
eigenen Kette), die bekannten Nachbarn und die Wahl
für Start und Transport — als Markdown-Datei, je
Angabe eine Zeile nach dem Start-Satz. Was der Startprompt
vorgibt, legt der Agent der Komponente als abgeleitet
vor und fragt es nicht mehr; der Start läuft sonst wie
bei jedem Projekt (siehe
[Projektstart](Projektstart.md)).

**Die Kette der Komponente.** Ihre Wurzel ist der
Übergabe-Stand des Koordinators. Bei *selbstständig*
vertritt er das Konzept, die Komponente führt
Pflicht-Stände ab den Anforderungen; bei *Auftrag*
vertritt er auch Anforderungen und
Funktionsbeschreibung, die Komponente beginnt mit der
Architektur. In beiden Arten vertritt der
Übergabe-Stand die Architektur nicht: die Komponente
führt sie selbst (sie darf dünn sein) oder verzichtet je
Marke per Verzicht darauf wie auf jede andere Phase mit
Pflicht-Stand. Die Komponente führt
ihre Kette bis zur Entwickler-Doku: Nach ihrem Tag (der
**Lieferung**) bildet sie einen Testplan-Stand, belegt
den Durchgang mit einem Testbericht und bildet die
**Entwickler-Doku für ihr Bauteil** — freigegeben „für
P13 Ausliefern“, die Lieferung an den, der ausliefert;
offene Fehler aus ihrem Testbericht stehen als
Einschränkung in der Freigabe. In ihrer Doku-Abfrage
steht deshalb nur diese eine Zeile. Benutzer-Doku,
Auslieferung mit den Deployments und
Betriebs-Anleitungen liegen beim Koordinator — außer
die Komponente hat eine eigene Zielumgebung (wird
unabhängig ausgeliefert): Dann führt sie wie ein
Standalone-Projekt Benutzer-Doku, Auslieferung und
Betriebs-Anleitung selbst, und ihre Doku-Abfrage hat
alle Zeilen. Ihr Abschluss-Stand listet die Glieder,
die sie führt, und geht mit dem Marken-Abschluss an den
Koordinator.

**Der Koordinator.** Ohne eigene Bauteile hat er keine
eigene Technologie-Wahl, Spezifikation und keinen
eigenen Tag — an die Stelle des Tags treten die
gebuchten Lieferungen aller Komponenten der Marke; die
Doku-Abfrage legt er dann vor, sobald die letzte
erwartete Lieferung gebucht ist.
Vorbedingung seines Testplan-Stands sind der eigene
Tag (falls eigene Bauteile) **und** alle Lieferungen;
den Integrationstest des Gesamtsystems führt er. Die
Auslieferung mit den Deploy-Ständen je Zielumgebung
liegt bei ihm für alle Komponenten, ebenso die
**Gesamtsicht der Entwickler-Doku**, die
**Benutzer-Doku** und die **Betriebs-Anleitungen** je
Zielumgebung — Vorbedingung der beiden Doku-Stände ist
sein Testbericht über die Lieferungen, und jede dieser
Freigaben ist ein eigener Meilenstein. Die Gesamtsicht
nimmt die Entwickler-Doku jeder Komponente auf — als
Kopie der ausgelieferten Datei oder als Anhang, nie als
Verweis auf eine Datei im Komponenten-Repo —, und die
Teil-Dokus sind ihre Quell-Stände. Fehlt die
Entwickler-Doku einer Komponente („später“ oder Verzicht
in deren Doku-Abfrage), legt der Koordinator die
Gesamtsicht trotzdem vor und weist die Lücke aus; die
Freigabe nennt sie als Einschränkung „Teil-Doku fehlt“.
Kommt die Teil-Doku später, legt er in seiner
Doku-Abfrage eine Zeile für eine neue Version oder ein
Änderungsdokument der Gesamtsicht vor.
Beim Koordinator ist der Contract-Index aktiv; dort
führt er die vereinbarten Schnittstellen.

## Nachrichten im Verbund

**Schreibgrundsatz.** Jedes Repo schreibt nur sein
eigener Agent; Lesen beim Nachbarn ist in beide
Richtungen erlaubt. Alles, was ein Repo einem anderen
mitteilt — Lieferung, Marken-Abschluss, vereinbarter
Contract, Befund, Änderungswunsch, Rücklauf, Quittung
—, ist eine **Nachricht**: eine Datei in
`output/nachrichten/` des **Absenders**, mit Nummer,
Absender, Empfängern, Datum, Art und dem, was sie
erwartet (Buchung, Antwort oder nichts). Nachrichten
sind ab Anlage eingefroren, nicht versioniert und
werden nicht kopiert; eine Korrektur ist eine neue
Nachricht mit Verweis auf die alte.

**Buchen.** Der Empfänger bucht aus einer Nachricht in
seine **eigenen** Register und vermerkt die Quelle: ein
vereinbarter Contract in den Contract-Index des
Koordinators, eine Lieferung oder ein Marken-Abschluss
als Zeile am Marken-Eintrag („Zuliefernde
Komponenten“), ein Befund oder Änderungswunsch ins
passende Sammel-Register. **Leitsatz des
Koordinators:** Er bucht nur, was er für einen eigenen
Stand oder seine Freigabe-Ordnung braucht; alles andere
liest er beim Nachbarn. Zwischenstände, Entscheidungen,
Spezifikationen, Testpläne und Fehlermeldungen der
Komponenten gehören nicht in sein Wiki.

**Meldepflicht der Komponente.** Je Marke meldet sie
dem Koordinator, jeweils mit der Erwartung einer
Buchung: die **Lieferung** (ihr Tag, mit Verweisen auf
die freigegebenen Stände, die der Koordinator zum
Einbau braucht) und den **Marken-Abschluss** (ihr
Abschluss-Stand). Ist ihr Produkt seit dem Tag der
Vormarke unverändert, entfällt eine neue Lieferung: Sie
meldet die Übernahme mit dem Marken-Abschluss, und der
Koordinator bucht den alten Tag als übernommene
Lieferung seiner Folge-Marke.

**Änderungswünsche** gehen als Nachricht an das Repo,
das den Gegenstand verantwortet; dort wird entschieden.
Für einen Contract ist das der **Provider** — die
Komponente, die die Schnittstelle bereitstellt; für
die Grundlagen der Mutter (Funktionsbeschreibung,
Zuschnitt, Übergabe) der Koordinator. Ändert er sie,
schickt er den betroffenen Komponenten einen
**Rücklauf**; die Stände der Komponente, die auf den
alten Übergabe-Stand verweisen, sind damit überholt.

**Nachrichten-Wächter.** Sobald die Architektur-Fassade
mindestens einen Nachbarn führt, prüft der Agent beim
Sessionstart, täglich und bei einer eingegangenen
Nachricht: eigene Nachrichten ohne Quittung, Nachrichten
an das eigene Repo ohne Buchung. Er meldet, blockiert
nicht, und schlägt Buchen und Quittieren im Aktion-Block
vor. Nachrichten empfängt nur ein laufender Agent; es
gibt keinen Weck-Modus.

**Rekursion.** Zerlegt eine Komponente weiter, ist sie
für ihre Unter-Komponenten Koordinator und bleibt nach
oben Komponente (**Zwischen-Koordinator**). Nach oben
liefert sie ihren Tag, wenn sie eigene Bauteile hat;
sonst den Verweis auf ihre Zielmarken-Fassade, deren
Tabelle die Lieferungs-Tags ihrer Unter-Komponenten
trägt. Ihre Kette endet wie bei jeder Komponente mit
der Entwickler-Doku — für ihren Teilbaum, die
Entwickler-Doku ihrer Unter-Komponenten aufgenommen.
Eine Schnittstelle zwischen zwei Zweigen liegt
bei der Ebene, die beide kennt.

**Upgrade im Verbund.** Jedes Repo hebt sich selbst auf
den neuen Stand seiner Vorlage; es gibt keine feste
Reihenfolge, und gemischter Betrieb mit noch nicht
gehobenen Nachbarn ist zulässig. An ein Repo, das noch
nicht gehoben ist, schreibt der Agent keine Nachricht;
er bittet dich, die Sache wie bisher weiterzugeben
(siehe [Upgrade](Upgrade.md), „Im Verbund“).

Was eine Komponente je Übernahme-Art führt und was der
Übergabe-Stand vertritt, steht oben in Kurzform („Die
Kette der Komponente“); für eine Komponenten-Wahl
reicht das. Die Einzelheiten — die Glieder je Fall, wie
der Lint die Rolle eines Repos erkennt, das Format der
Lieferungs-Tabelle — stehen in
`../wiki/Kettenpruefung.md`, `../wiki/Zielmarken.md` und
`../wiki/Katalog-message.md`; Koordinator, Komponenten,
Start-Tabelle und Contracts gibt es schon mit dem
Prozess SP-1 (`../Vorgehen.md` Abschnitte 3 und 3a),
die Software-Präzisierung (Lage in der
Softwarearchitektur, Rücklauf-Mechanik) steht in
`../wiki/Vorgehen-RP-1.md`.
