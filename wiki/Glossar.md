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
Template-Stand 2.1)_

Vorschläge und Diskussion siehe [[Glossar Review]].

_(Einträge werden aus `Glossar Review.md` durch den
Agenten nach User-Freigabe verschoben.)_

## Einträge

### Abschluss-Stand

**English:** closing baseline

Der Stand, mit dem eine Marke abschließt — die
Inhaltsliste der Marke: die freigegebenen Stände der
Marke mit Version und Freigabe, der Tag, der ihr
Produkt markiert, und was unverändert aus der Vormarke
übernommen ist. Der Anwender gibt ihn in der
Marken-Wechsel-Prozedur frei (abgeschlossen und
eingefroren ist die Marke erst mit dem Wechsel), eine
Komponente gibt ihn an den Koordinator, und der Vorgang
heißt Marken-Abschluss.

**Verankert in:** [[Katalog-Abschluss-Stand]]
(Dokumenttyp-Eintrag); Freigabe in der
Marken-Wechsel-Prozedur: [[Zielmarken]] §Meta

### Auftragsliste

**English:** job list

Liste geplanter Aufträge an ein Werkzeug oder einen
Dienst, die der Anwender vor dem Start als Ganzes
freigibt. Welche Aufträge sie brauchen, regelt
[[Do-first-mit-Veto]] (Grenzen).

**Verankert in:** [[Angebots-und-Beauftragungs-Muster]]
§Auftragsliste zur Freigabe

### Auslöser

**English:** trigger

Bedingung, unter der etwas fällig wird. Das Feld
`Auslöser:` (im Frontmatter `trigger`, Datum oder
Marke) steht nur an aufgeschobenen Einträgen eines
Sammel-Registers, etwa an einer zurückgestellten
Entscheidung als IDEA; die Zeile **Auslöser** eines
Dokumenttyp-Eintrags sagt dagegen, wann ein Stand
gebildet oder angeboten wird.

**Verankert in:** [[Einfrieren-und-Abloesen]]
§Eintrittsregel (Feld) und [[Katalog]]
§Typ-Konventionen (Zeile im Dokumenttyp-Block)

### Bearbeitungsstand

**English:** last edited

Pflegezeile einer Fassade, eines Bootstraps oder einer
Vorlage (`**Bearbeitungsstand:**`): Datum und Umfang
der letzten Pflege; der Stale-Fassaden-Check des
Wächters C6 liest ihr Alter. Auch die Datumszeile der
Root-Dokumente (README, MasterPrompt, Wiki, Vorgehen,
Reviewmuster, Styleguides, Outgoing) und der
Kopiervorlagen heißt so, dort in der Form
`**Bearbeitungsstand: <Datum>**`. Nicht zu verwechseln mit
dem **Stand** (eingefrorenes, freigabefähiges Dokument
in `output/`) — deshalb trägt die Zeile nicht dessen
Namen.

**Verankert in:** MasterPrompt §5.3 Phase C (C6
Stale-Fassaden-Check); Wortlaut je Fassaden-Art in der
Prozess-`index.md` (mit SP-1 §3 „Bearbeitungsstand-Zeile“)

### Bedarf

**English:** need

Was jemand will und warum, aus Sicht einer oder
mehrerer Rollen — Vorstufe der Anforderungen, Element
im Register NEED.

**Verankert in:** [[Bedarfe]]

### Benutzer-Doku

**English:** user documentation

Selbsttragender Pflicht-Stand der Phase P12
Dokumentieren für Benutzer, freigegeben „für P13
Ausliefern“: aus Konzept, Anforderungen,
Funktionsbeschreibung und Tag ausformuliert, so dass
ein Fremder das Produkt ohne Hilfe benutzen kann. Die
Benutzer sind die Leser des Produkts — nicht der
Anwender, der mit dem Agenten arbeitet.

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
Auslieferung in diese Umgebung; zu einer Marke kann es
mehrere geben, je Umgebung gilt der jüngste. Sein
freigegebener Stand ist Quell-Stand und Vorbedingung
der Betriebs-Anleitung seiner Umgebung. In der
Phasentabelle der Basis (`Vorgehen.md` §3) heißt das
Artefakt generisch Auslieferungsbeschreibung.

**Nicht verwenden:** Deploy-Dokument
**Verankert in:** mit SP-1 der Dokumenttyp-Eintrag
`Katalog-Deploy-Stand`

### Doku-Abfrage

**English:** documentation query

Vorlage des Agenten einmal je Marke, sobald der Tag der
Implementierung gesetzt ist: je Doku-Art
(Entwickler-Doku, Benutzer-Doku, Betriebs-Anleitung je
Umgebung) Zeitpunkt — jetzt, später, gar nicht als
Übernahme oder Verzicht — und Form — Änderungsdokument,
Einarbeitung, komplett neu — mit Empfehlung; je Zeile
eine Entscheidung.

**Verankert in:** [[Kettenpruefung]] §Kette
(Doku-Abfrage); Einbindung mit SP-1 in
`Vorgehen-SP-1.md` §2

### Entwickler-Doku

**English:** developer documentation

Selbsttragender Pflicht-Stand der Phase P11
Dokumentieren für Entwickler, freigegeben „für P13
Ausliefern“: aus Architekturdokument,
Technologie-Entscheidungen, Spezifikation und Tag
ausformuliert, so dass ein Fremder das Produkt ohne
Rückfrage ändern kann; eine Komponente bildet sie für
ihr Bauteil, der Koordinator die Gesamtsicht.

**Verankert in:** mit SP-1 der Dokumenttyp-Eintrag
`Katalog-Entwickler-Doku`; Zeitpunkt und Form:
[[Kettenpruefung]] §Kette (Doku-Abfrage)

### Ersatzweg

**English:** fallback path

Weg einer Prüfung, die ein zweites Modell verlangt
(Kettenprüfung, Code-Review, Prüfer-Schleife), wenn kein
Werkzeug ein zweites Modell bereitstellt; der Anwender
wählt ihn beim Init, die Wahl steht in `Tools.md`. Der
Ersatzweg ersetzt nicht den ersten Weg über ein
Werkzeug, er folgt ihm nach.

**Verankert in:** `Reviewmuster.md` §2 Schleife 2
(„Fallback ohne zweites Modell“); Wahl beim Init:
[[Init-Choreografie]] §Init-Fragen

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
Anforderung mit `requirement_type: fix` im Abschnitt
„Fehlerbehebungen“, getrennt von der Meldung, mit der
Marke der Behebung, die nicht vor der Marke der Meldung
liegt. Liegt der Fehler in der Auslieferung statt im
Produkt, ist sie eine Fix-Anforderung auf einen Deploy:
Ihre Umsetzung ist ein weiterer Deploy-Stand derselben
Umgebung ohne neue Marke, und sie trägt die Marke des
ausgelieferten Produkts.

**Verankert in:** mit SP-1 `Anforderungen.md` §Meta
„Fehlerbehebungen“; Marke der Meldung:
`Fehlermeldungen.md` §Meta „Zielmarke“

### Folge-Version

**English:** successor version

Neue Version derselben Ketten-ID in einer Folge-Marke
mit eigenem Tag — bei Testplan-Stand, Deploy-Stand und
Betriebs-Anleitung, die für die Folge-Marke nicht als
übernommen gelten, weil sie am Tag der Vormarke hängen;
der einzige Fall einer neuen Version über die
Marken-Grenze, mit `marke:` der Folge-Marke, dem neuen
Tag in `herkunft` und eigener Freigabe, bei
unverändertem Inhalt mit unverändertem Text.

**Verankert in:** [[Kettenpruefung]] §Kette
(Folge-Marke mit eigenem Tag); Ketten-ID und Marke:
[[Einfrieren-und-Abloesen]] §Stand

### Implementierung

**English:** implementation

Name des Glieds P9 in der Freigabe-Ordnung — in jeder
Domäne, auch wenn das Produkt kein Code ist; in der
Tag-Freigabe-Formel steht das Wort fest. Was das Glied
hervorbringt, ist das **Produkt** der Marke; der Tag
der Implementierung markiert es.

**Verankert in:** `Vorgehen.md` §4 „Freigabe per Tag“
(Formel); Glied in der Ordnung: [[Kettenpruefung]]
§Kette

### Katalog

**English:** catalog

Die Fassade [[Katalog]] mit ihren Katalog-Einträgen:
welche Typen es im Projekt gibt — je Eintrag ein
Register (Fassaden-Typ mit Element-Typ), ein
Dokumenttyp oder ein Einzeltyp, jeweils mit
Pflichtfeldern. Die Komposita Zweck-Katalog (die
Freigabe-Zwecke des Vorgehens), Phasen-Katalog (die
Phasen eines Prozess-Vorgehens) und
Altbestand-Katalog (die Altknoten eines Upgrades)
meinen nicht diesen Katalog.

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
**Zielmarke** und ist das Scharnier zwischen Außen-
und Innendarstellung des Projekts; nicht gemeint sind
der Meilenstein-Vorgang (mit SP-1 eine abgeschlossene
Arbeits-Einheit) und die Produkt-Version („1.1“ ist
die Marke, „v1.1.0“ die Version).

**Verankert in:** [[Marken]] (was eine Marke
abschließt, wann eine neue beginnt, Frist, Beispiele
je Projektart); Registerformat, Zustände, Zeiger,
Pflichtfeld `zielmarke:` und Marken-Wechsel:
[[Zielmarken]] §Meta

### Nachricht

**English:** message

Datei, mit der ein Repo im Verbund einem anderen etwas
mitteilt (Lieferung, Befund, Änderungswunsch,
Rücklauf, Meldung eines Contracts, Quittung). Sie
liegt nur beim Absender; der Empfänger bucht daraus in
seine eigenen Register. Nicht zu verwechseln mit einem
Versand an Menschen (`outgoing/`) und mit einer
Commit-Nachricht.

**Verankert in:** [[Katalog-message]] — Felder,
Quittung und Buchung mit `quelle:`

### Nachtrag

**English:** addendum

Vermerk am Eintrag einer abgeschlossenen Marke, der an
der Marke nichts ändert: Er bucht, was nach dem
Marken-Wechsel bei unverändertem Produkt und
unveränderter Spezifikation hinzukommt — ein weiterer
Deploy-Stand mit seiner Freigabe, ein Doku-Stand mit
„später“ aus der Doku-Abfrage oder die Korrektur des
Tags. Ändern sich Produkt oder Spezifikation, entsteht
dagegen eine neue Marke; erneutes Ausrollen ohne
Änderung ist Betrieb und kein Nachtrag.

**Verankert in:** [[Zielmarken]] §Meta (Nachtrag; Format
der Nachtragszeile eines Deploy-Stands und eines
Doku-Stands; Nachtrag „Tag korrigiert“)

### Patch-Marke

**English:** patch mark

Eine gewöhnliche Folge-Marke (z.B. „2.0.1“) mit eigener
Bezeichnung, eigenem Tag und eigenem Abschluss-Stand,
die Produkt oder Spezifikation einer abgeschlossenen
Marke korrigiert; ein anderes Ausrollen bei
unverändertem Produkt ist keine Patch-Marke, sondern
ein Nachtrag. Läuft die Folge-Marke schon, wird die
Patch-Marke als Zwischenmarke vorgezogen.

**Verankert in:** [[Zielmarken]] §Meta (Pflichtfeld
`zielmarke:`, Nachtrag, Zwischenmarke); [[Marken]]

### Produkt

**English:** product

Ergebnis der Ausarbeitung (P9) je Marke, das jedes
Projekt hervorbringt — Code nur in Software-Projekten,
sonst z.B. in einem Rechtsfall je Marke ein Schriftsatz
(was es je Prozess ist, benennt dessen Phasentabelle,
unten). Der Tag der Implementierung
markiert es in dem Repo, das es trägt (im
[[Two-Repo-Submodul-Muster]] das Repo „Produkt“).

**Verankert in:** [[Kettenpruefung]] §Kette (Tag als
Glied P9); Benennung je Prozess in der Phasentabelle
(mit SP-1 `Vorgehen-SP-1.md` §2, Anmerkung P9)

### Sackgasse

**English:** dead-end mark

Eine Zwischenmarke, die der Anwender nicht als
Vorgänger der zurückgestellten Marke einordnet: Ihr
Inhalt geht nicht von selbst in die zurückgestellte
Marke ein, ihr Zweig wird nicht zurückgeführt, und sie
überlagert Elemente anderer Marken, statt sie
abzulösen. Behebungen und Fehlermeldungen der Sackgasse
gelten nur dort; was daraus in die zurückgestellte
Marke soll, wählt der Anwender auf die Rückfrage zur
Übernahme.

**Verankert in:** [[Zielmarken]] §Meta (Zwischenmarke:
Vorgänger oder Sackgasse, Überlagern statt Ablösen,
Rückfrage zur Übernahme)

### selbsttragend

**English:** self-contained

Grad eines Dokuments, das am Stück an einen Empfänger
ohne Wiki-Zugang weitergegeben werden muss: keine
Wikilinks, keine Register-IDs, Begründungen
ausgeschrieben. Gegenstück ist **wiki-verweisend**
(nur mit dem Wiki lesbar, verlinkt statt wiederholt);
nicht zu verwechseln mit **eingefroren** (ein Stand,
der nicht mehr geändert wird) und **abgeschlossen**
(Status einer Zielmarke oder eines Vorgangs).

**Vormals:** geschlossen (als Grad-Wort)
**Verankert in:** MasterPrompt §9.6 — Grade, Link-Regel
und Prüfregel für selbsttragende Dokumente

### Stand

**English:** baseline

Abgeleitetes Dokument in
`output/`, das zu einer Marke aus den Elementen
gebildet wird und Träger einer Freigabe ist — mit
einem von zwei Graden: wiki-verweisend (die Regel) oder
selbsttragend (die Doku-Stände: aus eingefrorenen
Quell-Ständen ausformuliert). Eine
Zweck-Freigabe hängt immer an einem Stand —
freigegeben wird „Stand X für Zweck Y“, nie ein
Element und nie die Fassade; mit der Freigabe frieren
die verwiesenen Elemente ein, bis dahin leben sie im
`wiki/`; ein selbsttragender Stand friert nichts Neues
ein. Einzige Zweck-Freigabe ohne Stand ist der Tag.
Nicht zu verwechseln mit **Version** (dem
`_VV_TLA`-Dateistand; in „Stand x“ ist x die Version),
mit der Marken-Bezeichnung und mit dem
**Bearbeitungsstand** (der Pflegezeile einer Fassade,
die kein Stand ist).

**Nicht verwenden:** Fassung
**Verankert in:** [[Einfrieren-und-Abloesen]] §Stand
und §Abgrenzungen; Kernsatz der Freigabe:
`Vorgehen.md` §4; Ablauf: [[Lebenslauf-eines-Stands]]

### Szenario

**English:** scenario

Wie ein Ablauf vor sich geht, aus Sicht der
beteiligten Rollen — Vorstufe der Anforderungen,
Element im Register SCEN.

**Verankert in:** [[Szenarien]]

### Testbericht

**English:** test report

Ergebnis eines Testdurchgangs nach einem freigegebenen
Testplan-Stand, je Testfall; ein Nachweis (TRES), der
nie abgelöst wird.

**Verankert in:** mit SP-1 die Fassade
`Testberichte.md`

### Testfall

**English:** test case

Einzelner Test mit Ablauf und Erwartung, der
Anforderungen, Funktionsbeschreibungen oder
Spezifikationen prüft — Element im Register TEST, aus
dem der Testplan gebildet wird.

**Verankert in:** mit SP-1 die Fassade `Testfaelle.md`

### Übernahme-Art

**English:** takeover mode

Wie eine Teilaktivität (Komponente) die Vorarbeit der
Mutter übernimmt: **selbstständig** (eigene Kette mit
eigenen Anforderungen) oder **Auftrag** (die Mutter
hat die Funktion beschrieben). Nicht zu verwechseln
mit dem Anbindungs-Modus A/B des Templates (Kopie
oder Submodul) und mit der Übernahme eines Stands oder
Tags aus der Vormarke (**übernommener Stand**).

**Vormals:** Übernahme-Modus, Modus A/B (in
`Vorgehen.md` §3)
**Verankert in:** `Vorgehen.md` §3; Kette je Art:
[[Kettenpruefung]] §Komponenten-Kette nach
Übernahme-Art

### übernommener Stand

**English:** carried-over baseline

Freigegebener Pflicht-Stand einer Vormarke, der für die
Folge-Marke weitergilt, solange er nicht überholt ist:
er wird nicht neu gebildet und nicht neu freigegeben
und zählt in der Freigabe-Ordnung als Pflicht-Stand der
Folge-Marke. Der Abschluss-Stand der Folge-Marke weist
ihn mit „übernommen aus <Vormarke>“ aus. Hat die
Folge-Marke einen eigenen Tag, werden Testplan-Stand,
Deploy-Stand und Betriebs-Anleitung nicht übernommen,
sondern als Folge-Version fortgeführt.

**Verankert in:** [[Einfrieren-und-Abloesen]] §Stand
(„Stand je Marke“) und [[Zielmarken]] §Meta
„Marken-Wechsel-Prozedur“ (Übernahme in die neue
Marke); Wirkung in der Freigabe-Ordnung:
[[Kettenpruefung]] §Kette — dort auch Tag und
Lieferung einer unveränderten Komponente (Übernahme
des Tags und der Lieferung)

### Verzicht

**English:** waiver

Bewusstes Auslassen einer Phase mit Pflicht-Stand für
eine Marke, gebucht als Verzichts-DEC mit
`decision_type: verzicht`, `zielmarke:` und
`phase: Pn` (genau eine Phase; bei `phase: P15`
zusätzlich `umgebung:`, der Verzicht auf die
Betriebs-Anleitung gilt je Umgebung), wodurch für
diese Marke der Pflicht-Stand
der Phase und seine Lint-Pflichten entfallen — nicht zu
verwechseln mit einem Glied, das abgeleitet entfällt
oder vertreten wird (dafür ist kein Verzicht nötig).
Ohne Prozess gibt es nur den Verzicht auf „Tests grün“
als Vorbedingung des Tags (ohne `phase:`).

**Verankert in:** [[Kettenpruefung]] §Fehlende und
vertretene Glieder (Wirkung, alle Fälle); Buchung:
[[Entscheidungen]] Meta „Verzichts-Einträge“

### Wächter

**English:** guardian

Prüflauf, der zu festen Anlässen (Wächter-Trigger,
MasterPrompt §5.4) Register und Zustände prüft und
Befunde **meldet**, nicht blockiert;
mechanische Prüfungen stehen im Lint, der Wächter ruft
sie auf. Nicht zu verwechseln mit den Handoff-Momenten
H1–H4 ([[Handoff-Prozedur]]) und mit der
[[Kettenpruefung]] (Vorbedingung einer Freigabe, kein
Wächter).

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
(Datum oder Anlass). Er legt ihn auf die Antwort des
Anwenders an, führt ihn fort, bis die Frage entschieden
ist, und erledigt ihn mit dieser Entscheidung.

**Verankert in:** [[Standarddateien-Katalog]] §2.11;
Ablauf bei der Behebung: SP-1 `Anforderungen.md` §Meta
„Fehlerbehebungen“; Ablauf beim vertagten
Fassaden-Kandidaten: `Wiki.md` §3a „Fassaden-Promotion“

### Workaround

**English:** workaround

Die Behebung eines Fehlers in einer Sackgasse, der auch
für die Marken außerhalb der Sackgasse gilt: Sie wirkt
nur in der Sackgasse, der Fehler bleibt außerhalb
offen, bis eine Anforderung dieser Marken ihn behebt —
auch wenn keine folgt. Ein Fehler, der am Stand der
Sackgasse selbst beobachtet wurde, gilt nur dort; seine
Behebung in der Sackgasse ist eine Behebung, kein
Workaround.

**Verankert in:** mit SP-1 `Fehlermeldungen.md` §Meta
„Zielmarke“; Darstellung in den Release-Notes:
[[Katalog-Release-Notes]]

### Zielumgebung

**English:** target environment

Umgebung, in die das Ergebnis ausgeliefert wird
(z.B. Test- oder Produktivumgebung), mit ihren
lebenden Fakten; je Komponente und Zielumgebung gibt
es eine Deployment-Festlegung (DEPL).

**Verankert in:** mit SP-1 die Fassade
`Zielumgebungen.md`

### Zwischen-Koordinator

**English:** intermediate coordinator

Komponente, die ihrerseits in Komponenten geschnitten
ist: Sie liefert an ihren Koordinator wie eine
Komponente (Kette bis P11) und prüft die Lieferungen
ihrer Unter-Komponenten wie ein Koordinator.
Unter-Komponente ist eine §Komponenten-Zeile, für die
ihr Repo einen Übergabe-Stand gebildet hat — nicht die
Zeile des Koordinators, nicht ein bekannter Nachbar;
das Erkennungs-Kriterium steht am führenden Ort.

**Verankert in:** [[Kettenpruefung]] §Komponenten-Kette
nach Übernahme-Art (Zwischen-Koordinator)

### Zwischenmarke

**English:** interim mark

Eine Patch-Marke (die Korrektur an Produkt oder
Spezifikation einer abgeschlossenen Marke), die
vorgezogen wird, während die Folge-Marke schon
`in-progress` ist: Sie wird
`in-progress`, die bisher laufende Marke wird so lange
zurückgestellt, und mit dem Wechsel der letzten
Zwischenmarke kehrt der Agent zu ihr zurück. Der
Anwender entscheidet, ob sie Vorgänger der
zurückgestellten Marke oder Sackgasse ist; Korrekturen
gleicher Art teilen sich eine Zwischenmarke, eine
andere Art folgt als eigene Zwischenmarke danach. Im
Repo des Produkts arbeitet sie auf einem eigenen Zweig
ab dem Tag ihrer Vormarke.

**Verankert in:** [[Zielmarken]] §Meta (Zwischenmarke:
Vorziehen, Zustand `zurückgestellt`, Fragen des
Agenten, zweite Korrektur, Zeile `Zwischenmarke:`, Tag
und Produkt-Repo, Vorgänger oder Sackgasse, Überlagern
statt Ablösen, Rückfrage zur Übernahme, doppelte
Nachfolger, Rückkehr)
