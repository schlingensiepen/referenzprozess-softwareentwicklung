---
type: glossary
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Glossar

## Meta

- **Typ:** `glossary` — freigegebene Terminologie des
  Projekts. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Nur inhaltliche Felder:** Definition-Text, English,
  Vormals, Nicht verwenden, Verankert in, Siehe auch.
  Prozess-Felder (Freigabe, Kommentar, Rückmeldung AIG)
  bleiben in [[Glossar Review]] als Audit-Trail.
- **Anwender-Terrain:** Einträge kommen ausschließlich
  über den Review-Prozess (Wiki.md §3a.1) — der Agent
  verschiebt aus [[Glossar Review]] nach User-Freigabe,
  schreibt hier nicht direkt. Die mitgelieferten
  Einträge unter `## Einträge` sind Begriffe des
  Regelwerks und gelten als freigegeben mit dem
  Template-Stand.
- **Prozess-Beiträge:** Die Basis liefert nur die
  Begriffe mit, die sie selbst benutzt. Begriffe, die
  nur ein Prozess benutzt, bringt er als
  `Glossar-Anhang-<Prozess-Kennung>.md` in seinem
  Teil-Wiki mit; der Prozess-Merge übernimmt die
  Einträge hierher — alphabetisch einsortiert,
  freigegeben mit dem Template-Stand wie die
  mitgelieferten Einträge. Einen vorhandenen Eintrag
  gleichen Namens überschreibt der Merge nicht, er
  legt ihn dem Anwender vor. Die
  **Präzisierungs-Blöcke** eines Prozesses in
  Basis-Einträgen („gilt bei aktivem ⟨Prozess⟩“)
  benutzen dessen Begriffe; sie gelten nur mit dem
  Prozess, und dann stehen seine Begriffe hier. Der
  Anhang selbst wird
  nicht ins Anwender-`wiki/` kopiert. Führender Ort
  (Übernahme, Kollision, Update, Deaktivierung):
  Wiki.md §11.3 „Glossar-Anhang“.
- **Eintragsformat:** `### <Begriff>` mit
  `**English:**`, Definition in **ein bis zwei
  Sätzen**, `**Vormals:**` (frühere Benennungen) und
  `**Nicht verwenden:**` (verworfene Synonyme) nur, wo
  sie anfallen, `**Verankert in:**` (führender Ort des
  Begriffs: Regel, Fassade oder Dokument-Knoten),
  `**Siehe auch:**` (Link auf den `concept`-Knoten mit
  Link-Beschreibung, falls vorhanden). Der Eintrag
  benennt, definiert und verweist; er zählt keine
  Ausprägungen auf — die stehen am führenden Ort.
- **Verhältnis zu `concept`-Knoten:** **das Glossar
  führt die Definition.** Der `concept`-Knoten
  (registriert in [[Konzepte]]) erklärt — Kontext,
  Anwendung, Herleitung, Bezüge — und verweist für die
  Definition auf den Glossar-Eintrag; er definiert
  nicht noch einmal. Der Glossar-Eintrag endet dann mit
  dem Link auf den `concept`-Knoten (Wiki.md §3a.1).
- **Begriffs-Pflege:** ab Freigabe gilt ein Begriff für
  alles Neue; bei Berührung eines lebenden Knotens
  werden die Begriffe dort mitgezogen; eine
  Bedeutungs-Änderung bekommt einen neuen Namen, der
  alte wird `Vormals:` — keine stille Umdeutung
  (Wiki.md §3a.1).

---

**Bearbeitungsstand:** _(vom Agenten beim ersten freigegebenen
Eintrag und laufend gepflegt; mitgelieferte Einträge:
Template-Stand 2.2)_

Vorschläge und Diskussion siehe [[Glossar Review]].

_(Einträge werden aus `Glossar Review.md` durch den
Agenten nach User-Freigabe verschoben.)_

## Einträge

### abgeleitet entfallen

**English:** lapsed by derivation (chain link)

Ein Pflicht-Glied der Kette entfällt ohne eigene
Entscheidung, weil die Ausbaustufe, die Rolle des Repos,
eine inaktive Fassade oder ein Register-Inhalt es
ergibt; der
Katalog-Eintrag kann die Bedingung in der Zeile
„Entfällt abgeleitet, wenn …“ nennen. Nicht zu
verwechseln mit dem **Verzicht**, der eine Entscheidung
des Anwenders ist.

**Verankert in:** [[Kettenpruefung]] §Fehlende und
vertretene Glieder (Fälle und Träger); unterhalb der
Ausbaustufe: [[Katalog-process-brief]] „Ausbaustufen
und ‚Pflicht ab‘“

### Abrufturnus

**English:** polling interval

Turnus, in dem ein manuell abzurufender Eingangsort
nachgesehen wird; registriert am Ort, der Wächter
meldet den überschrittenen Turnus.

**Verankert in:** [[Eingangsdokumente]] §Meta
„Eingangsorte“ und Wächter C9; mit SP-2
`Vorgehen-SP-2.md` §7 und der Dokumenttyp-Eintrag
`Katalog-Akten-Fuehrungsplan`

### Abschluss-Stand

**English:** closing baseline

Der Stand, mit dem eine Marke abschließt — ihre
Inhaltsliste aus den freigegebenen Ständen, dem Tag
ihres Produkts und dem, was unverändert aus der
Vormarke übernommen ist. Der Anwender gibt ihn in der
Marken-Wechsel-Prozedur frei; abgeschlossen und
eingefroren ist die Marke erst mit dem Wechsel
(Marken-Abschluss).

**Verankert in:** [[Katalog-Abschluss-Stand]]
(Dokumenttyp-Eintrag); Freigabe in der
Marken-Wechsel-Prozedur: [[Zielmarken]] §Meta

### Abspalten

**English:** split off

Der Weg des Zuschnitts, auf dem ein Teil des Projekts
ein eigenes Projekt mit eigenem Repo wird, gestartet
mit einem **Übergabe-Punkt** und der Übernahme-Art
**Abspaltung** — unter anderem, wenn der Teil eigene
Phasen braucht und nicht zur Prozess-Familie des
Projekts gehört. Nie ohne Anwender-Wort.

**Verankert in:** [[Zuschnitt-aendern]] — Wege,
Prüfsatz, Übergabe-Punkt, Rückfrage-Pflicht

### Abspaltung

**English:** spin-off

Die Übernahme-Art eines Teilprojekts, das als eigenes
Projekt mit eigenem Prozess ab dem Übergabe-Punkt
startet und dessen Kette von Anfang an führt. Bei der
Mutter entsteht kein Kettenglied; das abgespaltene
Projekt meldet nur per Nachricht zurück.

**Verankert in:** `Vorgehen.md` §3; Kette:
[[Kettenpruefung]] §Komponenten-Kette nach
Übernahme-Art; Weg: [[Zuschnitt-aendern]]

### Anwender-OK

**English:** operator approval

Die ausdrückliche Zustimmung des Anwenders, mit der
etwas erst gilt — eine Entscheidung oder ein Contract
kommt erst mit dem Anwender-OK ins Register. Mit RP-2
zusätzlich die Zustimmung zu einem schreibenden Lauf an
einer produktiven Zielumgebung, gebucht als
Entscheidung mit Wortlaut — je Eingriff
(Entscheidungsart `eingriff-ok`) oder als
**stehendes OK** mit festem Rahmen (Entscheidungsart
`stehendes-ok`: Zielumgebung, erlaubte Aktionen,
Ablauf). Es ist
Voraussetzung des Laufs, keine Zweck-Freigabe, und
ersetzt keine Freigabe der Kette; deshalb trägt auch
die Art des stehenden OK das Wort „Freigabe“ nicht —
eine Freigabe hängt immer an einem Stand.

**Verankert in:** [[Einfrieren-und-Abloesen]]
(Eintritts-Register); mit RP-2 `Vorgehen-RP-2.md` §5
„Anwender-OK je Eingriff“; Entscheidungsarten:
[[Katalog-Entscheidungen]]

### Aspekt

**English:** aspect (of a deployment)

Die Seite eines Deployments, für die ein
Deployment-Eintrag gilt, aus einer festen Liste; der
Deploy-Stand führt seine Einträge je Aspekt, damit
jedes Kapitel der Betriebs-Anleitung eine Quelle hat.
Im Standardprozess ein Kann-Feld, in einem
Infrastruktur-Prozess Pflicht.

**Verankert in:** mit SP-1 die Fassade `Deployments.md`
§Meta „Aspekt“ und der Katalog-Eintrag
`Katalog-Deployments`

### Auftragsliste

**English:** job list

Liste geplanter Aufträge an ein Werkzeug oder einen
Dienst, die der Anwender vor dem Start als Ganzes
freigibt. Welche Aufträge sie brauchen, regelt
[[Do-first-mit-Veto]] (Grenzen).

**Verankert in:** [[Angebots-und-Beauftragungs-Muster]]
§Auftragsliste zur Freigabe

### Ausbaustufe

**English:** escalation level

Eine Lage, die von außen kommt und das Projekt
eskaliert, deklariert von einem Prozess in seinem
Steckbrief; je Fassade und Dokumenttyp sagt „Pflicht ab
Stufe n“, ab wann die Pflicht gilt, darunter entfällt
sie abgeleitet. Die aktuelle Stufe steht im
Herkunfts-Vermerk, ihr Wechsel ist eine Entscheidung
des Anwenders (Umbauen).

**Verankert in:** [[Katalog-process-brief]]
„Ausbaustufen und ‚Pflicht ab‘“; Zeile im
Herkunfts-Vermerk: [[Aktivierter-Prozess]]; Wechsel:
[[Zuschnitt-aendern]] §Drei Wege

### Auslöser

**English:** trigger

Bedingung, unter der etwas fällig wird — als Feld
`Auslöser:` (Frontmatter `trigger`, Datum oder Marke)
an aufgeschobenen Einträgen eines Sammel-Registers, als
Zeile **Auslöser** eines Dokumenttyp-Eintrags (wann ein
Stand gebildet oder angeboten wird) und im Steckbrief
als „Pflicht ab: <Auslöser>“ statt einer Stufe. Den
Auslöser im Steckbrief liest das Prüfprogramm nicht;
der Agent meldet ihn, wenn das Ereignis eintritt.

**Verankert in:** [[Einfrieren-und-Abloesen]]
§Eintrittsregel (Feld), [[Katalog]]
§Typ-Konventionen (Zeile im Dokumenttyp-Block) und
[[Katalog-process-brief]] „Ausbaustufen und ‚Pflicht
ab‘“ (Steckbrief)

### Baustein

**English:** building block

Die erste Reichweite, Einrichtungen eines anderen
Templates zu übernehmen: eine einzelne Fassade oder
Dokumentbeschreibung, zwischen allen Templates, mit
der Quelle in der Landkarte [[Schwester-Templates]]
und der Herkunft in der FassadenLandkarte. Nicht zu
verwechseln mit dem Scaffolding-Baustein
(`Vorgehen.md` §7a).

**Verankert in:** [[Zuschnitt-aendern]] §Einrichtungen
eines anderen Templates übernehmen

### Bearbeitungsstand

**English:** last edited

Pflegezeile einer Fassade, eines Bootstraps, einer
Vorlage oder eines Root-Dokuments
(`**Bearbeitungsstand:**`) mit Datum und Umfang der
letzten Pflege; der Stale-Fassaden-Check des Wächters
C6 liest ihr Alter. Nicht zu verwechseln mit dem
**Stand** — deshalb trägt die Zeile nicht dessen Namen.

**Verankert in:** MasterPrompt §5.3 Phase C (C6
Stale-Fassaden-Check); Wortlaut je Fassaden-Art in der
Prozess-`index.md` (mit SP-1 §3 „Bearbeitungsstand-Zeile“)

### Bedarf

**English:** need

Was jemand will und warum, aus Sicht einer oder
mehrerer Rollen — Vorstufe der Anforderungen, Element
im Register NEED.

**Verankert in:** [[Bedarfe]]

### Begehren

**English:** demand

Alles, was jemand von uns will, auf jedem Weg und in
jeder Phase; der Agent prüft jedes Begehren nach dem
Prüfraster, der Anwender entscheidet. Keine Leistung
und keine Zusage ohne Freigabe.

**Verankert in:** mit SP-2 `Vorgehen-SP-2.md` §4
„Prüfung jedes Begehrens“; Raster: der Knoten
`Wegweiser-Pruefraster.md`

### Benutzer-Doku

**English:** user documentation

Selbsttragender Pflicht-Stand der Phase P12
Dokumentieren für Benutzer, freigegeben „für P13
Ausliefern“, so dass ein Fremder das Produkt ohne Hilfe
benutzen kann. Die Benutzer sind die Leser des
Produkts — nicht der Anwender, der mit dem Agenten
arbeitet.

**Nicht verwenden:** Anwender-Doku, Anwenderhandbuch
**Verankert in:** mit SP-1 der Dokumenttyp-Eintrag
`Katalog-Benutzer-Doku`; Zeitpunkt und Form:
[[Kettenpruefung]] §Kette (Doku-Abfrage)

### Betriebs-Anleitung

**English:** operations guide

Selbsttragender Pflicht-Stand der Phase P15 Betreiben
je Zielumgebung, freigegeben „für P15 Betreiben“: aus
dem freigegebenen Deploy-Stand der Umgebung
ausformuliert, so dass ein Fremder das Produkt dort
ausführen kann; wird erst nach dem Deploy-Stand ihrer
Umgebung freigegeben.

**Nicht verwenden:** Betriebs-Handbuch, Betriebs-Plan,
Betriebs-Beschreibung
**Verankert in:** mit SP-1 der Dokumenttyp-Eintrag
`Katalog-Betriebs-Anleitung`; Zeitpunkt und Form:
[[Kettenpruefung]] §Kette (Doku-Abfrage)

### Deploy-Stand

**English:** deployment baseline

Stand der Phase P13 je Zielumgebung, gebildet aus den
Deployment-Festlegungen (DEPL) und freigegeben für die
Auslieferung in diese Umgebung; je Umgebung gilt der
jüngste. Er ist Quell-Stand und Vorbedingung der
Betriebs-Anleitung seiner Umgebung und hat beim Abbau
die Gestalt **„abgebaut“**.

**Nicht verwenden:** Deploy-Dokument
**Verankert in:** mit SP-1 der Dokumenttyp-Eintrag
`Katalog-Deploy-Stand`

### Doku-Abfrage

**English:** documentation query

Vorlage des Agenten einmal je Marke, sobald der Tag der
Implementierung gesetzt ist: je Doku-Art Zeitpunkt und
Form des Doku-Stands mit Empfehlung, je Zeile eine
Entscheidung.

**Verankert in:** [[Kettenpruefung]] §Kette
(Doku-Abfrage); Einbindung mit SP-1 in
`Vorgehen-SP-1.md` §2

### Dreiklang

**English:** triad (facade, element, state)

Die drei Ebenen des Register-Wissens: die lebende
**Fassade** und ihre **Elemente** (eingefroren ab ihrem
Freeze-Zeitpunkt) im `wiki/` sowie der **Stand**, das
daraus abgeleitete, versionierte Dokument in
`output/`, an dem jede Freigabe hängt. Nicht zu
verwechseln mit dem **Marken-Dreiklang** Bezeichnung /
Benennung / Beschreibung eines Marken-Eintrags
([[Zielmarken]] §Meta).

**Verankert in:** MasterPrompt §1.5; `Vorgehen.md` §3
(„Stand aus den Elementen“); [[Einfrieren-und-Abloesen]]
§Stand

### Eilsache

**English:** urgent matter

Ein Ergebnis mit Außenwirkung, das nicht warten kann,
etwa ein Eilantrag oder Hotfix: Es tritt als
**vorgezogene Marke** mit eigenem Tag oder Versand und
eigenem Abschluss vor die laufende Marke, die so lange
zurückgestellt wird. Das geht wie bei der Zwischenmarke,
aber ohne eigenen Git-Zweig.

**Verankert in:** [[Zielmarken]] §Meta „Eilsache als
vorgezogene Marke“

### Eingangsort

**English:** intake location

Ort, von dem Eingänge kommen — die Projektordner,
weitere Orte mit Zugriffsweg, Modus und Prüfvermerk
und schon vorhandene aktive Lesewege —, erfragt beim
Init und registriert in der Sektion `## Eingangsorte`.
Der Posteingangs-Wächter vergleicht maschinell lesbare
Orte mit dem Register, nur als Dateivergleich.

**Verankert in:** [[Eingangsdokumente]] §Meta
„Eingangsorte“; Init-Baustein: [[Init-Choreografie]]
§Init-Fragen

### Einreichung

**English:** filing

Die Übergabe eines getaggten Schriftsatzes an einen
Empfänger über einen Kanal, als Nachweis gebucht;
„eingereicht“ ist er nur mit Einreichungsnachweis.
Maßgeblich ist, wann er dem Empfänger zugeht, nicht
die Absendung, und jede Einreichung legt eine
Erwartung an. Die getaggte Version des Schriftsatzes
und ihr Zugang haben mit SP-2 eigene Einträge
(„Fassung“, „Zugang“).

**Verankert in:** mit SP-2 die Fassade
`Einreichungen.md` §Meta und der Katalog-Eintrag
`Katalog-Einreichungen` (Pflichtfelder); Ablauf
`Vorgehen-SP-2.md` §6

### Einschränkung

**English:** qualification (of an approval)

Vermerk in einem Freigabe-Eintrag, dass eine Bedingung
der Freigabe noch fehlt, mit einer Frist `gegen-uns`,
auf die der Eintrag verweist — nie still übergangen;
das Prüfprogramm meldet die abgelaufene Frist. Auch der
Ersatzweg einer Prüfung ohne zweites Modell steht als
Einschränkung in der Freigabe.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §5
„Inbetriebnahme-Tor“ (Einschränkung mit Frist);
Ersatzweg: `Reviewmuster.md` §2

### Element

**English:** element

Ein Eintrag eines Registers im `wiki/`, als
Detail-Knoten oder Inline-Eintrag der Fassade; Elemente
sind **ablösbar**, gehen in **Stände** ein und frieren
mit ihrem Freeze-Zeitpunkt ein, danach ändert sie nur
eine Ablösung unter neuer ID. Klasse „Element“ im
Katalog-Eintrag des Typs, neben Nachweis und
außerhalb.

**Verankert in:** [[Einfrieren-und-Abloesen]]
§Klassen, §Freeze und Ausnahmen, §Ablösung;
[[Lebenslauf-eines-Stands]] Schritt 1

### entfallen

**English:** lapsed (target mark)

Zustand einer Zielmarke, die ihr Ergebnis nicht mehr
erreicht, nur per Entscheidung mit Grund; sie hat
keinen Abschluss-Stand und keinen Tag, wird nicht
`current` und ist eingefroren wie eine abgeschlossene.
Der Entfall einer Marke ist etwas anderes als der
Verzicht auf eine Phase und als ein Glied, das
**abgeleitet entfällt**.

**Verankert in:** [[Zielmarken]] §Meta „Marke kann
entfallen“

### Entscheidungsart

**English:** decision type

Das Feld `decision_type` eines Entscheidungs-Eintrags,
das seine Art nennt. Die Werteliste ist offen: Die
Basis nennt ihre Arten, jeder Prozess ergänzt eigene in
seinem Katalog-Eintrag.

**Verankert in:** [[Katalog-Entscheidungen]] (Feld
`decision_type`, Prozess-Präzisierungen); Form der
Freigabe-, Marken- und Verzichts-Einträge:
[[Entscheidungen]] Meta

### Entwickler-Doku

**English:** developer documentation

Selbsttragender Pflicht-Stand der Phase P11
Dokumentieren für Entwickler, freigegeben „für P13
Ausliefern“, so dass ein Fremder das Produkt ohne
Rückfrage ändern kann. Eine Komponente bildet sie für
ihr Bauteil, der Koordinator die Gesamtsicht.

**Verankert in:** mit SP-1 der Dokumenttyp-Eintrag
`Katalog-Entwickler-Doku`; Zeitpunkt und Form:
[[Kettenpruefung]] §Kette (Doku-Abfrage)

### Ereignis-Marke

**English:** event mark

Marke eines Verfahrens, die entsteht, wenn das
Gegenüber entscheidet oder schreibt („Nach dem
Urteil“), ausgelöst aus dem Posteingang oder einem
ausgelösten Eventualplan. Im Verfahren ist sie der
Normalfall und oft die erste Marke eines Projekts.

**Verankert in:** mit SP-2 der Knoten `Marken-SP-2.md`
§3 „Ereignis-Marken“

### Ersatzweg

**English:** fallback path

Weg einer Prüfung, die ein zweites Modell verlangt,
wenn kein Werkzeug ein zweites Modell bereitstellt;
der Anwender wählt ihn beim Init, die Wahl steht in
`Tools.md`. Der Ersatzweg ersetzt nicht den ersten Weg
über ein Werkzeug, er folgt ihm nach.

**Verankert in:** `Reviewmuster.md` §2 Schleife 2
(„Fallback ohne zweites Modell“); Wahl beim Init:
[[Init-Choreografie]] §Init-Fragen

### Erwartung

**English:** expectation (of a third party)

Was ein Dritter uns schuldet, geführt als Frist mit
`richtung: für-uns` im Fristen-Register, nicht in
`TODO.md`. Der Eingang erfüllt sie; bei Ablauf schlägt
der Agent Sachstandsanfrage oder Erinnerung vor.

**Verankert in:** [[Katalog-Fristen]] „Erwartung an
Dritte = Frist `für-uns`“; [[Fristen]] §Meta

### Fehlermeldung

**English:** bug report

Meldung, dass ein existierender Produkt-Stand sich
falsch verhält — aus dem Betrieb oder aus einem Test
(Register BUG, mit SP-1). Über die Behebung wird
getrennt entschieden (Fix-Anforderung).

**Verankert in:** mit SP-1 die Fassade
`Fehlermeldungen.md` (`## Meta`) und der
Register-Eintrag `Katalog-Fehlermeldungen`

### Fix-Anforderung

**English:** fix requirement

Der Auftrag, eine Fehlermeldung zu beheben: eine
Anforderung mit `requirement_type: fix`, getrennt von
der Meldung, mit einer Marke der Behebung, die nicht
vor der Marke der Meldung liegt. Liegt der Fehler in
der Auslieferung statt im Produkt, ist sie eine
Fix-Anforderung auf einen Deploy, umgesetzt als
weiterer Deploy-Stand derselben Umgebung ohne neue
Marke.

**Verankert in:** mit SP-1 `Anforderungen.md` §Meta
„Fehlerbehebungen“; Marke der Meldung:
`Fehlermeldungen.md` §Meta „Zielmarke“

### Folge-Version

**English:** successor version

Neue Version derselben Ketten-ID in einer Folge-Marke
mit eigenem Tag, für die Stände, die am Tag der
Vormarke hängen und deshalb nicht als übernommen
gelten. Sie ist der einzige Fall einer neuen Version
über die Marken-Grenze, mit eigener Freigabe und bei
unverändertem Inhalt mit unverändertem Text.

**Verankert in:** [[Kettenpruefung]] §Kette
(Folge-Marke mit eigenem Tag); Ketten-ID und Marke:
[[Einfrieren-und-Abloesen]] §Stand

### Geheimnis-Prüfung

**English:** secret scan

Prüfung des Prüfprogramms, die in jedem Projekt
verfolgte Dateien auf Muster von Zugangsdaten
durchsucht und Treffer als HINWEIS meldet; der Agent
löscht, maskiert oder schreibt nichts eigenmächtig um.
Dauerhafte Fehlalarme nimmt die in `Tools.md`
registrierte Ausnahme-Datei des Anwenders aus.

**Verankert in:** MasterPrompt §6.3; [[Kettenpruefung]]
§Lint-Anteil „Geheimnis-Prüfung“

### Harness

**English:** harness

Die Umgebung, in der ein Agent läuft — das Programm,
das die Sitzung führt, dem Agenten seine Werkzeuge gibt
und beim Sessionstart bestimmte Dateien automatisch
lädt. Die Vorlage nennt keinen Harness beim Namen: Was
vom Harness abhängt (allen voran der Name der
Instruktionsdatei), stellt der Agent selbst fest und
hält es in `Tools.md` fest.

**Verankert in:** [[Standarddateien-Katalog]] §2.3;
MasterPrompt §8.1

### Herkunfts-Vermerk

**English:** provenance record

Der Abschnitt `## Herkunft` im Knoten
[[Aktivierter-Prozess]] mit festen Zeilen dazu, woher
das Projekt kommt und wie es zugeschnitten ist; der
Init legt ihn an, das Upgrade schreibt ihn fort. Das
Prüfprogramm liest daraus unter anderem den Stichtag
neuer Pflichten.

**Verankert in:** [[Init-Choreografie]] §Phase A0
„Herkunfts-Vermerk“ (führender Ort des Formats);
Knoten: [[Aktivierter-Prozess]] §Herkunft

### Implementierung

**English:** implementation

SP-1-Fachname des Glieds P9 in der Freigabe-Ordnung;
in anderen Domänen trägt das Glied den Namen des
Produkt-Dokumenttyps aus der Phasentabelle des
Prozesses (im Verfahren „Schriftsatz“). In der
Tag-Freigabe-Formel steht dieser Dokumenttyp
(„Stand <Tag-Name> von <Produkt-Dokumenttyp>,
freigegeben für P10 <Tätigkeit> zu Marke M“); nennt
die Phasentabelle für P9 keinen Dokumenttyp mit
Katalog-Eintrag (Code, Rezept), ist „Implementierung“
der Rückfall, und „Implementierung“ bleibt dort in
jedem Prozess als Altform gültig. Was das Glied
hervorbringt, ist das
**Produkt** der Marke, und der Tag der Implementierung
markiert es.

**Verankert in:** `Vorgehen.md` §4 „Freigabe per Tag“
(Formel); Glied in der Ordnung: [[Kettenpruefung]]
§Kette

### Join

**English:** join

Ein zweiter Prozess **mit eigenen Phasen** wird per
Entscheidung im selben Projekt zugeschaltet — nur
innerhalb einer Prozess-Familie; das ist die dritte
Reichweite der Übernahme von Einrichtungen und zugleich ein
Weg des Umbauens. Braucht ein Teil eigene Phasen eines
Prozesses aus einer anderen Familie, ist der Weg das
Abspalten.

**Verankert in:** [[Zuschnitt-aendern]] §Join;
Init-Fragen beim Join: [[Init-Choreografie]]

### Kanal

**English:** channel

Weg, auf dem ein Versand hinausgeht oder ein Eingang
hereinkommt, aus der offenen Kanal-Liste der Basis;
welche Kanäle ein Projekt nutzt, legt der Anwender beim
Init fest (`Tools.md`), jeder andere bleibt auf Zuruf
nutzbar. Was ein Kanal fachlich bedeutet, sagt der
Prozess.

**Verankert in:** `Outgoing.md` §3.2 „Versandkanäle“;
Wahl: Kopiervorlage `wiki/templates/Tools-Vorlage.md`
§Kommunikationskanäle; eingehende Wege:
[[Eingangsdokumente]] §Meta „Eingangsorte“

### Katalog

**English:** catalog

Die Fassade [[Katalog]] mit ihren Katalog-Einträgen:
welche Typen es im Projekt gibt, jeweils mit
Pflichtfeldern. Komposita wie Zweck-Katalog,
Phasen-Katalog oder Altbestand-Katalog meinen nicht
diesen Katalog.

**Vormals:** Knotentypen (`wiki/Knotentypen.md`)
**Verankert in:** [[Katalog]] — Meta-Fassade mit
Typ-Konventionen und je Eintrag einer Zeile; zu lesen
vor dem Anlegen eines Knotens unbekannten Typs

### Marke

**English:** target mark

Der Zwischenziel-Anker jeder Projektart — ein
benanntes Ergebnis, das nach außen geht und
freigegeben wird (sein **Produkt**), kein Datum; eine
Frist ist eine Eigenschaft der Marke, nicht ihr Kern.
Als Eintrag im Register [[Zielmarken]] heißt sie
**Zielmarke**; nicht gemeint sind der
Meilenstein-Vorgang und die Produkt-Version („1.1“ ist die Marke, „v1.1.0“ die
Version).

**Verankert in:** [[Marken]] (was eine Marke
abschließt, wann eine neue beginnt, Frist, Beispiele
je Projektart); Registerformat, Zustände, Zeiger,
Pflichtfeld `zielmarke:` und Marken-Wechsel:
[[Zielmarken]] §Meta

### Meilenstein

**English:** milestone

Mit SP-1 das Ereignis, mit dem ein
Meilenstein-Vorgang — eine zusammenhängende
Arbeits-Einheit mit definiertem Ergebnis — abschließt,
etwa die Freigabe eines Pflicht-Stands der laufenden
Marke oder der Marken-Abschluss; danach läuft die volle
Wächter-Runde. Eine Freigabe im Nachtrag zu einer
abgeschlossenen Marke ist keiner, und der Meilenstein
ist weder Zwischenziel (das ist die Marke) noch Review
(das läuft vor der Freigabe, der Meilenstein danach).

**Verankert in:** mit SP-1 der Knoten
`Meilenstein-und-T2.md` (Meilenstein-Anlässe);
Basis-Anlässe des Wächters: MasterPrompt §5.4

### Merge

**English:** merge (of a second template's facilities)

Die zweite Reichweite, Einrichtungen eines anderen
Templates zu übernehmen: Ein Projekt übernimmt
nachträglich als Init-Merge die **Einrichtungen**
eines zweiten Templates, aber **keine fremden Phasen**,
über alle Templates. Es nutzt dieselbe Mechanik wie
der Prozess-Merge beim Init (Wiki.md §11.3), der die
Einrichtungen des gewählten Prozesses ins Projekt
bringt.

**Verankert in:** [[Zuschnitt-aendern]] §Einrichtungen
eines anderen Templates übernehmen;
[[Init-Choreografie]] §Nachträglicher Init-Merge

### Nachricht

**English:** message

Datei, mit der ein Repo im Verbund einem anderen etwas
mitteilt; sie liegt nur beim Absender, und der
Empfänger bucht daraus in seine eigenen Register.
Nicht zu verwechseln mit einem Versand an Menschen
(`outgoing/`) und mit einer Commit-Nachricht.

**Verankert in:** [[Katalog-message]] — Arten, Felder,
Quittung und Buchung mit `quelle:`

### Nachtrag

**English:** addendum

Vermerk am Eintrag einer abgeschlossenen Marke, der an
der Marke nichts ändert: Er bucht, was nach dem
Marken-Wechsel bei unverändertem Produkt und
unveränderter Spezifikation hinzukommt. Ändern sich
Produkt oder Spezifikation, entsteht dagegen eine neue
Marke; erneutes Ausrollen ohne Änderung ist Betrieb
und kein Nachtrag.

**Verankert in:** [[Zielmarken]] §Meta (Nachtrag; Format
der Nachtragszeile eines Deploy-Stands und eines
Doku-Stands; Nachtrag „Tag korrigiert“)

### Nachweis

**English:** record, evidence of fact

Ein Dokument oder Element, das belegt, was zu einem
Zeitpunkt war; es wird **nie abgelöst und nie
geändert, nur ergänzt** — durch angehängte, datierte
Vermerke oder durch Dateien im Unterordner `nachweis/`.
Klasse „Nachweis“ im Katalog-Eintrag des Typs (Freeze
ab Anlage); eingefrorene Stände folgen demselben
Grundsatz, ohne Nachweise zu sein.

**Verankert in:** [[Einfrieren-und-Abloesen]]
§Klassen, §Nachweis; Versandstand: `Outgoing.md` §2

### Normen-Paket

**English:** statute package

Der Satz amtlicher Normtexte, den ein
Verfahrens-Prozess mitbringt oder auf Zuruf neu holt —
je **Paket-Stand** ein eingefrorenes
Rechercheartefakt (Normen-REC) mit einem
`manifest.tsv`; die Übernahme eines Paket-Stands als
Arbeitsgrundlage ist eine Entscheidung je Stand. Die
Wegweiser bleiben auf dem Stand, für den sie
geschrieben sind, und der Wächter meldet einen
neueren Stand als Abweichung.

**Verankert in:** mit SP-2 `tools/README.md` §Ablage
(„ein Rechercheartefakt je Paket-Stand“),
`Vorgehen-SP-2.md` §10 und die Fassade `Wegweiser.md`
§Meta „Stand der Normtexte“; Register:
[[Rechercheartefakte]]

### Offene Frage

**English:** open question

Jede Frage an den Anwender, die nicht im selben Zug
beantwortet wird — in jedem Modus, auch eine
Briefing-Kette, aus der der Anwender ausgestiegen ist.
Sie steht in `Offene Fragen.md`, die der Agent beim
Sessionstart mit hoher Priorität liest.

**Verankert in:** [[Standarddateien-Katalog]] §2.10;
MasterPrompt §5.2

### Patch-Marke

**English:** patch mark

Eine gewöhnliche Folge-Marke (z.B. „2.0.1“) mit eigener
Bezeichnung, eigenem Tag und eigenem Abschluss-Stand,
die Produkt oder Spezifikation einer abgeschlossenen
Marke korrigiert; ein anderes Ausrollen bei
unverändertem Produkt ist ein Nachtrag. Läuft die
Folge-Marke schon, wird die Patch-Marke als
Zwischenmarke vorgezogen.

**Verankert in:** [[Zielmarken]] §Meta (Pflichtfeld
`zielmarke:`, Nachtrag, Zwischenmarke); [[Marken]]

### Produkt

**English:** product

Ergebnis der Ausarbeitung (P9) je Marke, das jedes
Projekt hervorbringt — Code nur in
Software-Projekten, sonst etwa ein Schriftsatz; was es
je Prozess ist, benennt dessen Phasentabelle. Der Tag
der Implementierung markiert es in dem Repo, das es
trägt (im [[Two-Repo-Submodul-Muster]] das Repo
„Produkt“).

**Verankert in:** [[Kettenpruefung]] §Kette (Tag als
Glied P9); Benennung je Prozess in der Phasentabelle
(mit SP-1 `Vorgehen-SP-1.md` §2, Anmerkung P9)

### Prozess-Familie

**English:** process family

Ein Standardprozess mit den Referenzprozessen, die auf
ihm aufbauen (Steckbrief). Ein Join ist nur innerhalb
einer Familie möglich; Baustein und Merge gehen
zwischen allen Templates.

**Verankert in:** [[Zuschnitt-aendern]] §Einrichtungen
eines anderen Templates übernehmen (Join) und
§Prüfsatz; Landkarte: [[Schwester-Templates]]

### Prüfprogramm

**English:** lint

Das gemeinsame Skript `tools/lint.sh` der Basis, das in
jedem Projekt die mechanischen Prüfungen ausführt und
die Prüf-Definitionen der aktiven Prozesse zuschaltet;
Prozesse bringen keine eigenen Prüf-Skripte mit.
Befunde haben eine Schwere, der Wächter ruft das
Prüfprogramm auf.

**Verankert in:** [[Kettenpruefung]] §Lint-Anteil „Ein
Prüfprogramm, Prozess-Prüfungen und Schwere“;
Prüfungen der Basis: `Wiki.md` §9

### Richtung

**English:** direction (of a deadline)

Pflichtfeld jeder Frist und jeder Zusage: `gegen-uns` —
wir müssen handeln, die Regel — oder `für-uns` — ein
anderer schuldet uns etwas, oder der Ablauf der Frist
wirkt für uns. Der Wächter meldet mit der
Richtung im Text, bei `für-uns` einen ausstehenden
Eingang, keine Pflicht.

**Verankert in:** [[Katalog-Fristen]] „Richtung“;
[[Fristen]] §Meta

### Rückzug

**English:** recall (of a distributed baseline)

Eine der Antworten auf einen verteilten Stand, der
sich als fehlerhaft herausstellt: Stand und Freigabe
bleiben, der Stand wird per Entscheidung zurückgezogen,
alle Empfänger erhalten einen Folge-Versand, und der
alte Stand trägt den angehängten Vermerk. Nie
Do-first, weil er nach außen wirkt; mit SP-2 wird eine
Prozesshandlung nie über diesen Ablauf zurückgenommen.

**Verankert in:** [[Lebenslauf-eines-Stands]] §Rückzug
eines verteilten Stands; Versandstand: `Outgoing.md` §6a;
Grenze im Verfahren: mit SP-2 `Vorgehen-SP-2.md` §12

### Rumpf

**English:** stub node

Jeder Knoten, auf den das Template verweist, liegt im
Template als Rumpf vor — fast leer, mit Frontmatter,
Titel und dem Hinweis, was der Init einträgt —, auch
Wiki-Knoten und Root-Dateien. Der Init füllt ihn, das
Upgrade legt ihn nur an, wo er fehlt, und schreibt
keinen vorhandenen Knoten um.

**Verankert in:** `Wiki.md` §3a „Platzhalter-Grundsatz“;
Root-Dateien: [[Standarddateien-Katalog]] §2.10 und
§2.15

### Sackgasse

**English:** dead-end mark

Eine Zwischenmarke, die der Anwender nicht als
Vorgänger der zurückgestellten Marke einordnet: Ihr
Inhalt geht nicht von selbst dorthin ein, ihr Zweig
wird nicht zurückgeführt, und sie überlagert Elemente
anderer Marken, statt sie abzulösen. Was daraus in die
zurückgestellte Marke soll, wählt der Anwender auf die
Rückfrage zur Übernahme.

**Verankert in:** [[Zielmarken]] §Meta (Zwischenmarke:
Vorgänger oder Sackgasse, Überlagern statt Ablösen,
Rückfrage zur Übernahme)

### Schriftsatz

**English:** written pleading

Das Produkt einer Verfahrens-Marke: ein Dokument an
eine Stelle oder ein Gegenüber, das bis zur Einreichung
als Fassungskette mit Tag in `output/` lebt. Mit der
Einreichung geht es als Nachweis in die Kette der
Schriftsätze ein, in der auch fremde Schriftsätze
stehen.

**Verankert in:** mit SP-2 die Fassade
`Schriftsaetze.md` §Meta; Dokumenttyp
`Katalog-Schriftsatz`

### Schwere

**English:** severity

Stufe eines Befunds des Prüfprogramms: **FEHLER**
sperrt die Freigabe des betroffenen Stands (nie die
Arbeit), **HINWEIS** meldet; grün ist ein Lauf nur
ohne FEHLER. Faustregel: FEHLER ist, was unumkehrbar
ist oder nach außen wirkt.

**Verankert in:** [[Kettenpruefung]] §Lint-Anteil
„Schwere der Befunde“ (Schwere-Tabelle); Grundsatz:
[[Berichten-statt-Blockieren]]

### selbsttragend

**English:** self-contained

Grad eines Dokuments, das am Stück an einen Empfänger
ohne Wiki-Zugang weitergegeben werden muss: keine
Wikilinks, keine Register-IDs, Begründungen
ausgeschrieben. Gegenstück ist **wiki-verweisend**;
nicht zu verwechseln mit **eingefroren** und
**abgeschlossen**.

**Vormals:** geschlossen (als Grad-Wort)
**Verankert in:** MasterPrompt §9.6 — Grade, Link-Regel
und Prüfregel für selbsttragende Dokumente

### Stand

**English:** baseline

Abgeleitetes Dokument in `output/`, das zu einer Marke
aus den Elementen gebildet wird und Träger einer
Freigabe ist, wiki-verweisend (die Regel) oder
selbsttragend; freigegeben wird „Stand X für Zweck Y“,
nie ein Element und nie die Fassade, und einzige
Zweck-Freigabe ohne Stand ist der Tag. Nicht zu
verwechseln mit **Version**, Marken-Bezeichnung,
**Bearbeitungsstand** und — mit SP-2 — der Fassung
eines Schriftsatzes und der Lesefassung eines
Normtexts.

**Nicht verwenden:** Fassung (als Synonym für Stand; außerhalb von SP-2 — dort Fachwort für die getaggte Version eines Schriftsatzes)
**Verankert in:** [[Einfrieren-und-Abloesen]] §Stand
und §Abgrenzungen; Kernsatz der Freigabe:
`Vorgehen.md` §4; Ablauf: [[Lebenslauf-eines-Stands]]

### Szenario

**English:** scenario

Wie ein Ablauf vor sich geht, aus Sicht der
beteiligten Rollen — Vorstufe der Anforderungen,
Element im Register SCEN.

**Verankert in:** [[Szenarien]]

### Teilaufsatz

**English:** sub-article

Datei im gleichnamigen Unterordner einer Wiki-Seite
(`wiki/<Knoten>/`), die einen Teil dieser
Übersichtsseite trägt — ohne eigenen Typ und eigene
Nummer, mit Herkunft, Eigentümer und Upgrade-Verhalten
der Übersicht. Nur die Übersicht steht im Index.

**Verankert in:** `Wiki.md` §5.4 (Unterseiten eines
Knotens); Zeile „Teilaufsätze“ im Katalog-Eintrag:
[[Katalog]] §Typ-Konventionen

### Testbericht

**English:** test report

Ergebnis eines Testdurchgangs nach einem freigegebenen
Testplan-Stand, je Testfall; ein Nachweis (TRES), der
nie abgelöst wird.

**Verankert in:** mit SP-1 die Fassade
`Testberichte.md`

### Übergabe-Punkt

**English:** handover point

Der Zeitpunkt, an dem ein Projekt ein anderes durch
Abspalten startet: ein Tag im abgebenden Repo, den das
neue Projekt in seinen Herkunfts-Vermerk einträgt;
Späteres holt es per Folge-Tag nach. Kein
Übergabe-Dokument, und nicht der SP-1-Übergabe-Stand
einer Komponente.

**Verankert in:** [[Zuschnitt-aendern]]
§Übergabe-Punkt; Herkunfts-Vermerk:
[[Init-Choreografie]] §Phase A0

### Übernahme-Art

**English:** takeover mode

Wie eine Teilaktivität die Vorarbeit der Mutter
übernimmt; sie steht in der Start-Tabelle, im
Startprompt und im Herkunfts-Vermerk des neuen
Projekts. Nicht zu verwechseln mit dem Anbindungs-Modus
des Templates und mit dem **übernommenen Stand**.

**Vormals:** Übernahme-Modus, Modus A/B (in
`Vorgehen.md` §3)
**Verankert in:** `Vorgehen.md` §3 (Werte); Kette je
Art: [[Kettenpruefung]] §Komponenten-Kette nach
Übernahme-Art

### übernommener Stand

**English:** carried-over baseline

Freigegebener Pflicht-Stand einer Vormarke, der für die
Folge-Marke weitergilt, solange er nicht überholt ist —
nicht neu gebildet und nicht neu freigegeben, im
Abschluss-Stand der Folge-Marke mit „übernommen aus
<Vormarke>“ ausgewiesen. Stände, die am Tag der
Vormarke hängen, werden bei eigenem Tag der Folge-Marke
nicht übernommen, sondern als Folge-Version
fortgeführt.

**Verankert in:** [[Einfrieren-und-Abloesen]] §Stand
(„Stand je Marke“) und [[Zielmarken]] §Meta
„Marken-Wechsel-Prozedur“ (Übernahme in die neue
Marke); Wirkung in der Freigabe-Ordnung:
[[Kettenpruefung]] §Kette — dort auch Tag und
Lieferung einer unveränderten Komponente (Übernahme
des Tags und der Lieferung)

### Umbauen

**English:** restructure

Der Weg des Zuschnitts im selben Repo, durch den
Wechsel der **Ausbaustufe** oder den **Join** eines
zweiten Prozesses derselben Familie. Jeder Wechsel ist
eine Entscheidung des Anwenders; der Agent meldet den
Anlass.

**Verankert in:** [[Zuschnitt-aendern]] §Drei Wege;
Stufen: [[Katalog-process-brief]]

### Verfahren

**English:** case, proceeding

Das, was ein Gegenüber mit uns führt oder wir mit ihm,
als Fall-Knoten, an dem Fristen, Eingangsdokumente,
Schriftsätze und Beteiligte hängen. Der Status am
Verfahren führt den Abschluss; ein Rechtsmittel in der
nächsten Instanz ist ein neues Verfahren mit
Vorgänger.

**Verankert in:** mit SP-2 die Fassade `Verfahren.md`
§Meta

### Versandstand

**English:** dispatch folder

Der Ordner in `outgoing/` je Versand an Menschen,
einmalig aus finalen Ständen erzeugt; sein versandter
Inhalt ist ab Erzeugung eingefroren und wird nie
geändert, nur ergänzt — durch Dateien in `nachweis/`
oder einen angehängten Vermerk. Ein erneuter Versand
ist ein neuer Ordner.

**Verankert in:** `Outgoing.md` §2 „Dateistruktur —
Versandstand-Ordner“; Grundsatz:
[[Einfrieren-und-Abloesen]] §Nachweis

### Vertrauenszone

**English:** trust zone

Arbeitsverzeichnis, Git-Server und Modellanbieter —
alles, was der Agent liest, geht als Kontext dorthin.
Legt ein Prozess den Umgang mit Zugangsdaten als
Akteninhalt fest, gibt der Agent beim Init den Hinweis
zur Vertrauenszone, und die bestätigte Festlegung steht
im Herkunfts-Vermerk.

**Verankert in:** [[Init-Choreografie]] §Hinweis zur
Vertrauenszone; MasterPrompt §6.3; mit SP-2
`Vorgehen-SP-2.md` §9

### Verzicht

**English:** waiver

Bewusstes Auslassen einer Phase mit Pflicht-Stand für
eine Marke, gebucht als Verzichts-Entscheidung mit
`decision_type: verzicht`, Marke und genau einer
Phase; für diese Marke entfallen der Pflicht-Stand und
seine Lint-Pflichten. Nicht zu verwechseln mit einem
Glied, das **abgeleitet entfällt** oder vertreten wird.

**Verankert in:** [[Kettenpruefung]] §Fehlende und
vertretene Glieder (Wirkung, alle Fälle); Buchung:
[[Entscheidungen]] Meta „Verzichts-Einträge“

### Wächter

**English:** guardian

Prüflauf, der zu festen Anlässen Register und Zustände
prüft und Befunde **meldet**, nicht blockiert; die
mechanischen Prüfungen ruft er im Prüfprogramm auf.
Nicht zu verwechseln mit den Handoff-Momenten
([[Handoff-Prozedur]]) und mit der [[Kettenpruefung]]
(Vorbedingung einer Freigabe).

**Verankert in:** MasterPrompt §5.3 Phase C
(Sessionstart-Wächter) und §5.4 „Wächter-Trigger“;
Vorgehen.md §5 (T4); prozess-eigene Anlässe im
Prozess-Template

### Werkzeug-Dauerfreigabe

**English:** standing tool approval

Freigabe des Anwenders, ein Werkzeug ohne vorherige
Auftragsliste zu nutzen; jederzeit widerrufbar.
Gebucht als `internal-rule`-Knoten je Werkzeug.

**Verankert in:** [[Angebots-und-Beauftragungs-Muster]]
§Auftragsliste zur Freigabe; Knoten-Form:
[[InterneMechanik]] (Meta)

### Wiedervorlage

**English:** follow-up reminder

Ein Eintrag in `TODO.md`, mit dem sich der Agent merkt,
wann er dem Anwender eine offene Frage erneut stellt
(Datum oder Anlass), angelegt auf seine Antwort und
erledigt mit der Entscheidung. Im Fristen-Register
heißt so auch eine selbst gesetzte Frist oder die Frist
einer Einschränkung — keine Erwartung an Dritte.

**Verankert in:** [[Standarddateien-Katalog]] §2.11;
Ablauf bei der Behebung: SP-1 `Anforderungen.md` §Meta
„Fehlerbehebungen“; Ablauf beim vertagten
Fassaden-Kandidaten: `Wiki.md` §3a „Fassaden-Promotion“

### Workaround

**English:** workaround

Die Behebung eines Fehlers in einer Sackgasse, der auch
für die Marken außerhalb der Sackgasse gilt: Sie wirkt
nur dort, der Fehler bleibt außerhalb offen, bis eine
Anforderung dieser Marken ihn behebt. Ein Fehler, der
am Stand der Sackgasse selbst beobachtet wurde, gilt
nur dort; seine Behebung ist kein Workaround.

**Verankert in:** mit SP-1 `Fehlermeldungen.md` §Meta
„Zielmarke“; Darstellung in den Release-Notes:
[[Katalog-Release-Notes]]

### Zeitbudget

**English:** time budget

Der späteste Tag zum Handeln an einer Frist, den ein
Prozess als Feld deklariert; der Fristen-Wächter prüft
es aus jedem Anlass, und bei Erreichen legt der Agent
sofort die fristwahrenden Optionen vor. Die
Runden-Obergrenze der Prüfungen ist an das Zeitbudget
gebunden.

**Verankert in:** [[Katalog-Fristen]] („Gleiche
Feldnamen“; Werte in der SP-2-Präzisierung); Umgang:
mit SP-2 `Vorgehen-SP-2.md` §3 „Zeitbudget und
Fristwahrung“

### Zielumgebung

**English:** target environment

Umgebung, in die das Ergebnis ausgeliefert wird, mit
ihren lebenden Fakten; je Komponente und Zielumgebung
gibt es eine Deployment-Festlegung (DEPL). Der Eintrag
darf Zugriffsstufe und Ausführungsrolle festhalten, ein
Infrastruktur-Prozess macht beides zur Pflicht und
führt je Umgebung einen Zustand.

**Verankert in:** mit SP-1 die Fassade
`Zielumgebungen.md` §Meta

### Zugangsdaten als Akteninhalt

**English:** credentials as case content

Zugangsdaten, die in einem Eingangsdokument stehen und
damit Inhalt des Projekts sind, kein Betriebs-Zugang
des Agenten. Ohne Prozess wird das Dokument im
Original committet (das Repo gehört zur
Vertrauenszone). Ein Prozess kann den Umgang beim
Start festlegen, die Wahl steht dann im
Herkunfts-Vermerk; der Software-Prozess legt nichts
fest, dort gehören Zugangsdaten in keine committete
Datei. Betriebs-Zugangsdaten bleiben in
jedem Projekt draußen.

**Verankert in:** MasterPrompt §6.3; Festlegung beim
Init: [[Init-Choreografie]] §Hinweis zur
Vertrauenszone; mit SP-2 `Vorgehen-SP-2.md` §9

### Zusammenführen

**English:** merge back (of projects)

Der Weg des Zuschnitts, auf dem ein abgespaltenes oder
benachbartes Projekt in ein anderes eingeht — der
Übergabe-Punkt in Gegenrichtung. Nicht zu verwechseln
mit dem Merge von Einrichtungen eines anderen
Templates.

**Verankert in:** [[Zuschnitt-aendern]] §Drei Wege,
§Übergabe-Punkt

### Zuschnitt

**English:** project scope

Prozess, Ausbaustufe und Fassaden eines Projekts — das,
womit es beginnt und was es auf den Wegen für Projekte
und Stufen für Einrichtungen ändert, wenn die Lage es
verlangt. Jeder Wechsel ist eine Entscheidung des
Anwenders.

**Verankert in:** [[Zuschnitt-aendern]] §Grundsatz

### Zwischen-Koordinator

**English:** intermediate coordinator

Komponente, die ihrerseits in Komponenten geschnitten
ist: Sie liefert an ihren Koordinator wie eine
Komponente und prüft die Lieferungen ihrer
Unter-Komponenten wie ein Koordinator. Das
Erkennungs-Kriterium steht am führenden Ort.

**Verankert in:** [[Kettenpruefung]] §Komponenten-Kette
nach Übernahme-Art (Zwischen-Koordinator)

### Zwischenmarke

**English:** interim mark

Eine Patch-Marke, die vorgezogen wird, während die
Folge-Marke schon `in-progress` ist; die bisher
laufende Marke wird so lange zurückgestellt, und nach
der letzten Zwischenmarke kehrt der Agent zu ihr
zurück. Der Anwender entscheidet, ob sie Vorgänger der
zurückgestellten Marke oder Sackgasse ist.

**Verankert in:** [[Zielmarken]] §Meta (Zwischenmarke:
Vorziehen, Zustand `zurückgestellt`, Fragen des
Agenten, zweite Korrektur, Zeile `Zwischenmarke:`, Tag
und Produkt-Repo, Vorgänger oder Sackgasse, Überlagern
statt Ablösen, Rückfrage zur Übernahme, doppelte
Nachfolger, Rückkehr)
