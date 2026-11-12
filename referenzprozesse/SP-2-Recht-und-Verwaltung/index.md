---
type: process-mapping
---

# SP-2 Recht und Verwaltung

**Bearbeitungsstand:** 2026-11-11

Ich bin in [[Steckbrief]] beschrieben (Prozess-Felder,
Ausbaustufen, Einstufung der mitgebrachten Fassaden und
Dokumenttypen, Ordner, Präfixe, Mechanik,
Referenzprozesse — lesen beim Merge und bei der
Prozess-Wahl); diese Datei ist meine **volle
Prozess-Definition**. Konkret mache ich Folgendes:

## 1. Ich bin SP-2

Ich bin der **Standardprozess für Vorgänge mit einem oder
mehreren Gegenübern und einem Verfahren** — mit oder
ohne Streit, vor Gericht, bei einer Behörde oder einer
privaten Stelle, in jeder Rolle des Anwenders. Du kannst
mich **allein instanziieren** — für einen Antrag, eine
Mitwirkung, einen außergerichtlichen Streit reicht das
aus. Für Verfahren vor Gerichten und Behörden außerhalb
des Abgabenrechts gibt es
[RP-20 Rechtsfall](../RP-20-Rechtsfall/), für Steuern
und Abgaben
[RP-21 Steuer- und Abgabenfall](../RP-21-Steuer-und-Abgabenfall/)
obendrauf; beide setzen SP-2 voraus und bringen die
Fristenkataloge, typischen Marken und
Fassaden-Präzisierungen ihrer Ordnungen. Das Verfahren
beginnt in dem Referenzprozess, in dem es beginnt; den
anderen bietet der Agent bei Bedarf als Join an (§4.9).

**Wichtig:** SP-2 ist **kein Fristenkatalog und keine
Rechtsberatung**. Er **nutzt die Basis-Mechanismen**
(Fassaden, Detail-Knoten, Marken, Kette der
Pflicht-Stände, Versandpipeline, Fristen) und
**ergänzt konkrete Instanzen** (die Register des
Verfahrens wie `Verfahren`, `Beteiligte`, `Strategie`,
`Schriftsaetze`, `Anlagen`, `Einreichungen`) plus
**eigene Mechanismen** (Ausbaustufen, Posteingang,
„Immer ein Wecker“, Prüfen vor jedem Versand,
Gegenperspektive, Stränge, Vertraulichkeit, Normtexte
mit Wegweisern). Die Rechtskenntnis des Verfahrens kommt
aus den Wegweisern des Templates und den
Fristenkatalogen der Referenzprozesse; was dort nicht
steht, recherchiert der Agent als Rechercheartefakt und
prüft es an der Primärquelle. **Der Anwender
entscheidet; der Agent handelt nie selbst nach außen.**

## 2. Rolle dieser Datei und wie SP-2 auf die Basis aufsetzt

**Rolle.** Diese Datei ist die **volle Prozess-Definition
von SP-2** — der [[Steckbrief]] ist ihre Kurzform. Die
SP-2-Fassaden-Skelette liegen im Prozess-Teil-Wiki unter
`referenzprozesse/SP-2-Recht-und-Verwaltung/wiki/` und
landen beim Merge (Wiki.md §11.3) im Anwender-`wiki/`;
ihre Bootstrap-Dateien liegen in `bootstrap/`. Was ein
SP-2-Typ ist (Zweck, Datei, Pflichtfelder, Schlüssel),
steht in seinem mitgebrachten Katalog-Eintrag
`wiki/Katalog-<Name>.md` (beim Merge als Datei kopiert
und im [[Katalog]] verankert); Aufbau, Eintragsformat
und Sektionen der Detail-Knoten stehen in den
`## Meta`-Sektionen der Fassaden. Die Wegweiser liegen
mit ihren Teilaufsätzen ebenfalls im `wiki/` des
Prozess-Ordners; das Normen-Paket in `research/`, die
Werkzeuge in `tools/` ([[Steckbrief]] §Mitgebrachte
Ordner). Das Init-Prompt-Fragment für die SP-2-Wahl
steht in der [[Init-Choreografie]] (SP-2-Teil) und
verweist auf §4.6 hier.

**Wie SP-2 auf die Basis aufsetzt.** Drei Kategorien:

**Nutzt alles aus der Basis** (nicht dupliziert, nicht
neu definiert): Marke, Produkt, Tag; Kette der
Pflicht-Stände mit Zweck-Freigaben und Kettenprüfung
([[Kettenpruefung]]); Versionsketten, Einfrieren und
Ablösen; Zwischenmarke, Sackgasse, Verzicht,
`entfallen`; Übernahme-Arten und Verbund (`Vorgehen.md`
§3, §3a); `outgoing/` mit Versandstand-Ordner,
Pflicht-Review, `pruefsumme` und `nachweis/`
(`Outgoing.md`); Fristen mit `richtung`, Erwartung als
Frist `für-uns`; Eingangsdokumente mit Eingangsorten
und Wächter C9; Rechercheartefakte; Zuschnitt ändern
(Abspalten, Umbauen per Stufe oder Join,
Zusammenführen; [[Zuschnitt-aendern]]); Rückzug eines
verteilten Stands ([[Lebenslauf-eines-Stands]]
§Rückzug); `devstate_active.md` als Einstieg.

**Aktiviert als konkrete Instanzen** (§3): die
SP-2-Fassaden und Typen (§3.1, §3.2), die Dokumenttypen
der Kette (§3.2), die Basis-Fassaden, die SP-2 Pflicht
macht ([[Steckbrief]]), und die Präfixe (§3.3). SP-2
**nutzt** die Werkzeug-Kategorien der `Tools.md` und
bringt die Werkzeuge des Normen-Pakets dort ein.

**Bringt eigene Mechanismen mit** (§4): Ausbaustufen,
Wächter-T2-Trigger mit Prüf-Tabelle, Füllung von
`devstate_active.md`, Stränge nach der
Entscheidungsmatrix, den prozess-eigenen Einstieg
„bestehende Akten zuerst“, die Init-Fragen, den Hinweis
zur Vertrauenszone, den Verzicht auf Scaffolding, den
Join der Referenzprozesse.

**Lazy-Loading durch selektive Aktivierung.** Ohne
SP-2-Wahl im Init passiert nichts von alldem: die
Skelette, Katalog-Einträge, Wegweiser, das Normen-Paket
und der Mechanik-Knoten bleiben im SP-2-Teil-Wiki und
werden nicht gemerged; die Typen `case`, `argument` und
`evidence` bleiben in den SP-2-Katalog-Einträgen — ein
Projekt ohne SP-2 trägt keine Normtexte und keinen
Verfahrens-Typ. Bei SP-2-Wahl führt der Init-Agent den
Merge nach Wiki.md §11.3 durch (Artefakte kopieren,
Aktivitäts-Regel §11.4, Aktivierungs-Kontext mit
`Ausbaustufe` in [[Aktivierter-Prozess]]) — danach läuft
SP-2 durch die normalen Basis-Mechanismen. Begegnet ein
Projekt **ohne** SP-2 einem Verfahren oder einem
Begehren, gilt der Basis-Grundsatz „Zuschnitt ändern“:
Abspalten eines Verfahrens-Projekts nach dem Starter aus
[[Schwester-Templates]] ([[Zuschnitt-aendern]] §Prüfsatz).

## 3. Konkrete Instanzen der Basis

### 3.1 SP-2-Fassaden

Die Tabelle der mitgebrachten Fassaden mit Typ,
Katalog-Eintrag, Gegenstand und „Pflicht ab“ steht im
[[Steckbrief]] §Mitgebrachte Fassaden (führender Ort —
lesen beim Merge und vor dem Einschalten einer
Fassade); dort auch die Basis-Fassaden, die SP-2 zur
Pflicht macht, und die bewusst fassadenlosen Begriffe.
Unterhalb der Ausbaustufe liegen Fassaden mit
`active: false` bereit; welche aktiv sind, führt
[[Fassaden]]. Vier Rollen-Fassaden grenzen sich so ab:
[[Ansprechpartner]] = Rolle einer Person im Projekt;
Geschäftsbeziehungen (SP-1) = Organisation zum Projekt;
[[Beteiligte]] = Rolle im Verfahren mit Vertretung;
[[Mitgliedschaften]] = Zugehörigkeit unabhängig vom
Projekt (die Abgrenzung steht in den Katalog-Einträgen).

### 3.2 SP-2-Typen und Dokumenttypen

**Detail-Typen** (je Fassade einer; Einzelheiten im
Katalog-Eintrag): `case` ([[Katalog-Verfahren]]),
`party` ([[Katalog-Beteiligte]]), `strategy` und
`contingency` ([[Katalog-Strategie]]), `assertion`
([[Katalog-Sachverhalt]]), `argument`
([[Katalog-Argumente]]), `submission`
([[Katalog-Schriftsaetze]]; `extends: document`),
`exhibit` ([[Katalog-Anlagen]]), `filing`
([[Katalog-Einreichungen]]), `cost-item`
([[Katalog-Kosten]]), `evidence`
([[Katalog-Beweisangebote]]; Relation), `series-unit`
([[Katalog-Serien]]), `receivable`
([[Katalog-Forderungskonto]]), `flurstueck`
([[Katalog-Flurstuecke]]; Entity), `guide`
([[Katalog-Wegweiser]]). Die Relation `authority`
(Organisation ↔ Zuständigkeit) steht als
SP-2-Präzisierung in [[Katalog-Organisationen]]. Das
Basis-`thing` bleibt unverändert; ein Gegenstand wird
erst über `evidence` zum Beweismittel.

**Dokumenttypen der Kette** (Phase in Klammern; Zweck,
Filter, Pflichtfelder und „Pflicht ab“ im Eintrag):
[[Katalog-Strategie-Stand]] (P1),
[[Katalog-Sachverhalt-Stand]] (P3),
[[Katalog-Argumentation-Stand]] (P4),
[[Katalog-Verfahrens-Stand]] (P5),
[[Katalog-Verfahrens-Entscheidungen]] (P7),
[[Katalog-Gliederung-Stand]] (P8), [[Katalog-Schriftsatz]]
(P9, das Produkt mit Tag), [[Katalog-Pruefplan]] (P10,
mit `review-report` als Prüfbericht),
[[Katalog-Dossier-Stand]] (P11),
[[Katalog-Erlaeuterung-Stand]] (P12),
[[Katalog-Einreichung-Stand]] (P13),
[[Katalog-Serien-Stand]] (P14),
[[Katalog-Akten-Fuehrungsplan]] (P15),
[[Katalog-Termin-Vorbereitung]] (P9 der Termin-Marke),
[[Katalog-Termin-Ergebnis]] (Glied „Termin auswerten“).
Welche Phase welchen Stand trägt: [[Vorgehen-SP-2]] §2.
Der Abschluss-Stand ist Basis
([[Katalog-Abschluss-Stand]]). **Keinen eigenen
Übergabe-Dokumenttyp:** Abspaltung läuft über den
Übergabe-Punkt, das Mandat über Startprompt und
Dossier ([[Vorgehen-SP-2]] §Abspaltung und Mandat).

**Register-Status als Kanonizität:** Für die Element-
Register mit Sammelzustand `offen` (Strategie,
Sachverhalt, Argumente, Anlagen, Serien) gilt: ein
Element wird mit der Freigabe des ersten verweisenden
Stands angenommen und friert ein; danach nur Ablösung
([[Einfrieren-und-Abloesen]]). Den Status des
Verfahrens führt das Register [[Verfahren]] — er führt
auch den Abschluss ([[Marken-SP-2]] §4).

### 3.3 SP-2-Präfixe

`Freigabe:` und `devstate:` (gleichlautend mit SP-1);
alles andere unter den Basis-Präfixen
([[Steckbrief]] §Mitgebrachte Präfixe).

## 4. SP-2-eigene Mechanismen

### 4.1 Ausbaustufen

Drei Stufen — 1 Vorgang, 2 Streit, 3 Gericht —, der
Einstieg dort, wo das Verfahren beginnt, die volle
Fassung immer ausgeliefert, Inaktives mit
`active: false`, kein automatischer Rückbau
([[Steckbrief]] §Ausbaustufen, §Pflicht ab). Der
Wechsel ist eine Entscheidung nach [[Zuschnitt-aendern]]
(Weg „Umbauen“); der Wächter meldet den Anlass
([[Vorgehen-SP-2]] §Wächter, Zeile Stufe).

### 4.2 Wächter — SP-2-Trigger T2 und Prüf-Tabelle

SP-2 ergänzt den Basis-Wächter um den **T2-Trigger**
(volle Runde C4–C9) bei Eingang eines Dokuments mit
Frist, Freigabe-Buchung, Marken-Wechsel und
Strang-Entscheidung, und um die **Prüf-Tabelle** mit
Codes `SP2-…` und Stufe je Zeile — führender Ort
[[Vorgehen-SP-2]] §Wächter; das gemeinsame Prüfprogramm
liest sie je aktiver Prozesskette ([[Kettenpruefung]]
§Lint-Anteil). Der Wächter meldet; Tag und
Versandstand sperren allein die FEHLER-Zeilen.

### 4.3 `devstate_active.md` im Repo-Root

Die Datei kommt als Rumpf mit der Basis; SP-2 füllt sie
nach [[devstate-SP-2]]: Verfahren mit Stelle,
Aktenzeichen und Stufe, laufende Marke, offene Fristen
mit dem nächsten Wecker, nächste Züge, offene Fragen
mit Verweis auf `Offene Fragen.md`. Bei kleinen Fällen
(Stufe 1, ein Schreiben) ist sie das Mittel zum
Wiederaufnehmen und deshalb Pflicht.

### 4.4 Stränge

Neue Stränge (Instanz, Eilverfahren, Nebenstreit,
Serie, Honorarstreit) entscheidet der Anwender nach der
Entscheidungsmatrix F1 Serie, F2 Bündel, F3 Folge,
F4 Vorziehen, F5 Abspaltung — Buchung als DEC mit
`decision_type: strang` ([[Marken-SP-2]] §9;
[[Vorgehen-SP-2]] §Stränge und Marken).

### 4.5 Prozess-eigener Einstieg: bestehende Akten zuerst

Die Migration ist im Verfahren der Normalfall: Liegen
beim Init schon Akten vor (Ordner, Postfach, Datenraum,
ein Verzeichnis aus einem anderen Projekt), **liest der
Agent sie zuerst ein** — bevor umstrukturiert wird —,
zieht die Fristen und **meldet laufende Fristen
sofort**, noch vor dem Ende der Init-Fragen. Mehrere
Verzeichnisse einer Sache fasst er nach der
Entscheidungsmatrix zusammen oder verknüpft sie als
Abspaltung; der Anwender entscheidet. Die Basis bietet
diesen Einstieg an, weil dieses `index.md` ihn nennt
([[Init-Choreografie]] §Phase D, Turn 2.2). Ablauf:
Init-Frage 8 (§4.6); jedes Eingangsdokument wird nach
[[Vorgehen-SP-2]] §Posteingang eingelesen.

### 4.6 Prozess-spezifische Init-Fragen

Dieser Abschnitt bündelt die Init-Fragen, die SP-2
mitbringt; die Init-Choreografie sammelt sie in Phase D
Turn 2 von hier ([[Init-Choreografie]] §Phase D,
Punkt 3; SP-2-Teil). Die Reihenfolge ist fest — die
Frage, deren Antwort am meisten anderes festlegt,
zuerst; vor jeder Frage gilt die
Ableitbarkeits-Prüfung (MasterPrompt §5.1.0), etwa aus
einem Startprompt der Abspaltung oder aus vorhandenen
Akten. Ein Referenzprozess auf SP-2 stellt seine
Fragen zusätzlich, geordnet nach Vorfestlegungs-Stärke.

1. **Rolle und Interessen** — der Pflichtteil des
   Mission Statements ([[Katalog-Mission-Statement]]
   SP-2-Präzisierung): in wessen Namen der Anwender
   handelt, eigenes Interesse und das der vertretenen
   Person, Beziehung zum Gegenüber, Ziel; **aktiv
   abgefragt und detailliert** (Vollmacht, übrige
   Beteiligte, bekannter und gewollter Konflikt). Rolle
   je Verfahren aus dem Grundbestand der Fassade
   [[Beteiligte]]; der Anwender ist immer ein Eintrag;
   auch die Rolle „öffentliche Stelle“ für den Anwender
   selbst (dann kehren sich die Voreinstellungen um).
   _Legt vorab fest:_ Stimme, Absender, Freigabeweg,
   Prüfperspektiven, Voreinstellungen der Marken und
   Begleitanträge ([[Vorgehen-SP-2]] §Rolle und
   Interessen).
2. **Gegenüber und erstes Verfahren** — eines oder
   mehrere Gegenüber, je mit Stellung; das erste
   Verfahren und **wer es begonnen hat**. Daraus leitet
   der Agent ab: die **Ausbaustufe** nach der Stufe der
   Form ([[Steckbrief]] §Ausbaustufen; Zeile
   `Ausbaustufe` in [[Aktivierter-Prozess]]), die
   **erste Marke** aus [[Marken-SP-2]] (der Init
   legt genau eine Marke an: hat das Gegenüber
   begonnen, die Ereignis-Marke des auslösenden
   Ereignisses, deren Produkt die Antwort ist; sonst
   die Marke des ersten Produkts), am `case` den **Verfahrensgrundsatz**
   (Beibringung / Amtsermittlung / gemischt) und das
   **Nummerierungsschema der Anlagen**. **Referenzprozess:**
   Das Verfahren beginnt in dem Referenzprozess, in dem
   es beginnt. Der Agent **schlägt vor** — als
   Voreinstellung, der Anwender wählt: eine Kette von
   Bescheiden je Zeitraum und Abgabenart spricht für
   RP-21, ein Streit um eine Leistung oder einen Status
   für RP-20. Ist der Bedarf des anderen
   Referenzprozesses schon sichtbar (etwa ein Steuer-
   und ein Sozialrechtsstreit aus derselben Sache),
   bietet er ihn als **Join** an (§4.9; Init-Fragen
   nur für das Neue). _Legt vorab fest:_ Stufe, erste
   Marke, aktive Fassaden, Referenzprozess, Stellung des
   Vortrags, Anlagen-Schema.
3. **Vertretung und Kostenträger** — Vertretungszwang
   je Instanz und Handlung (Feld am `case`, aus dem
   Wegweiser der Ordnung); ein **Mandat** an eine
   Vertretung ist eine Teilaktivität `auftrag` ohne
   Repo (`Vorgehen.md` §3; die Vertretung arbeitet
   außerhalb des Templates, ihre Lieferungen kommen als
   Eingangsdokument mit ihrer Kennung); dazu der
   **Kostenträger** (Rechtsschutzversicherung mit
   Deckungsanfrage als Erwartung, Prozessfinanzierer,
   Verband, Staatskasse) als Eintrag in [[Beteiligte]].
   _Legt vorab fest:_ wer unterschreibt und einreicht,
   ob P6 „Mandat erteilen“ ansteht, ob [[Kosten]] aktiv
   wird.
4. **Eingangsorte und vorhandene Lesewege** — in drei
   Schichten nach [[Init-Choreografie]] §Baustein
   Eingangsorte: Projektordner immer; weitere Orte
   (Postfach, Portal, Datenraum) registriert mit Modus
   und Abrufturnus — ein elektronisches Gerichts- oder
   Behördenpostfach ist ab der Stufe Pflicht, in der es
   eröffnet ist; aktive Lesewege erfragt und genutzt.
   _Legt vorab fest:_ was der Wächter C9 vergleicht und
   woran der Abrufturnus hängt.
5. **Kanäle und geprüfte Versandwege der Stellen** —
   die Kanäle des Projekts wählt der Anwender in der
   Kanal-Frage der Basis (Turn 1,
   [[Init-Choreografie]] §Baustein Kanal-Frage;
   Kanal-Liste `Outgoing.md` §3.2); SP-2 stellt sie
   **nicht noch einmal**, sondern liefert den
   Vorschlag dafür (aus Rolle und Stellen: beA oder
   Behördenpostfach bei Berufsträgern und Behörden,
   ELSTER bei Finanzbehörden, sonst `post`,
   `einschreiben`, `fax`) und ergänzt ihn hier, wenn
   erst die Fragen 1 bis 3 einen weiteren Kanal
   ergeben. Gefragt wird an dieser Stelle nur der
   geprüfte Versandweg: je Stelle Kanal,
   Nummer, Postfach, Seiten- und Anlagengrenze als
   geprüfter Versandweg in [[Organisationen]]
   (`authority`). _Legt vorab fest:_ was der Agent beim
   Versand vorschlägt und wogegen die Paketprüfung
   misst.
6. **Externer Fristensammler** — dringend empfohlen
   (Zugriffstest, Eintrag in `Tools.md`, Blockade
   sichtbar); ohne Sammler führt die Fassade [[Fristen]]
   allein. _Legt vorab fest:_ ob Fristen zusätzlich
   nach außen gemeldet werden.
7. **Vertraulichkeitskreise mit dem Hinweis zur
   Vertrauenszone** — je Stufe `offen`, `intern`,
   `streng-intern` benennt der Anwender, wer Inhalte
   erhält (Voreinstellungs-Vorschlag:
   [[Vorgehen-SP-2]] §Vertraulichkeit); dazu der
   Hinweis zur Vertrauenszone (§4.7). _Legt vorab
   fest:_ die Prüfung gegen den Empfänger bei
   Versandstand, Nachricht, Dossier und Abspaltung; die
   Zeile „Zugangsdaten als Akteninhalt“ im
   Herkunfts-Vermerk.
8. **Bestehende Akte zuerst einlesen und Fristen
   ziehen** — §4.5; **laufende Fristen sofort melden**.
   _Legt vorab fest:_ den Posteingang, die ersten
   Fristen, oft die erste Marke (die auslösende
   Zustellung) — deshalb beginnt der Agent damit, sobald
   die Akte erreichbar ist, auch wenn frühere Fragen
   noch offen sind.
9. **Normen-Paket übernehmen** — der mitgelieferte
   Paket-Stand als Arbeitsgrundlage („Normen-Paket
   Stand ⟨Datum⟩ übernehmen?“; Voreinstellung: ja).
   Gebucht in Turn 3 nach der ersten Marke als
   Entscheidung, Feld „Übernommen als DEC“ der
   Register-Zeile in [[Rechercheartefakte]]
   (Bootstrap der Fassade [[Wegweiser]]). _Legt vorab
   fest:_ auf welchen Stand der Normtexte sich
   Wegweiser, Fristenkataloge und Fundstellen stützen.
10. **Turnus der Wiedervorlage „Rolle prüfen“** — in
    welchem Abstand der Agent Rolle und Interessen
    wieder vorlegt (Voreinstellung: drei Monate;
    Bootstrap der Fassade [[Beteiligte]]). _Legt vorab
    fest:_ die selbst gesetzte Frist in [[Fristen]].

**Vorauswahlen ohne eigene Frage:** die Commit-Sprache
folgt der Aktensprache (§4.8); die Fassaden sind nach
der gewählten Stufe vorbelegt ([[Steckbrief]]);
[[Aktenzeichen]] aktiv, [[Mitgliedschaften]] nicht
aktiv; keine MADR-Frage (die SP-1-Form der
Entscheidungen gilt nicht).

### 4.7 Hinweis zur Vertrauenszone

SP-2 legt fest, wie mit **Zugangsdaten als Akteninhalt**
umgegangen wird (MasterPrompt §6.3): Das Original wird
im Standard **unmaskiert committet** — das Verfahren
muss aus dem Repo rekonstruierbar sein, ein Dokument
muss im Original vorliegen. Deshalb gibt der Agent in
Turn 2.2 nach dem Merge den Hinweis zur
**Vertrauenszone** ([[Init-Choreografie]] §Hinweis zur
Vertrauenszone): Arbeitsverzeichnis, Git-Server und
Anbieter des Sprachmodells sehen alles, was der Agent
liest; alles wird committet; das Repo dient der
Rekonstruktion, nicht der Weitergabe. Der Anwender
bestätigt oder weicht ab (anderer Server, lokales
Modell, Auswahl der eingelesenen Akten, abweichende
Regeln); die Festlegung steht als Zeile „Zugangsdaten
als Akteninhalt“ im Herkunfts-Vermerk. Im Standard
prüft der Agent nicht, wo Inhalte liegen dürfen, und
führt keine Ignore-Listen aus Vertraulichkeitsgründen.
Betriebs-Zugangsdaten des Agenten (API-Schlüssel,
Versand-Zertifikate) bleiben in jedem Projekt draußen.
Einzelheiten: [[Vorgehen-SP-2]] §Vertraulichkeit.

### 4.8 Kein Scaffolding, Commit-Sprache nach der Akte

Anders als SP-1 kennt SP-2 **kein Scaffolding** (keine
Vorlagen-Kette, kein Scaffolding-Commit); an seine
Stelle treten die Init-Fragen (§4.6) und das Einlesen
der Akte. Die **Commit-Sprache folgt der Aktensprache**
— keine Vorauswahl aus der Software; der Agent schlägt
in Turn 1 die Sprache der Akte vor. Die Fassaden von
SP-2 und dem Referenzprozess sind alle vorhanden
(volle Fassung), aktiv nach der gewählten Stufe. Das
Normen-Paket liegt im Template; der Init lädt nichts
nach; die Übernahme des Paket-Stands ist eine
Entscheidung je Stand ([[Vorgehen-SP-2]] §Normtexte).

### 4.9 Join der Referenzprozesse

RP-20 und RP-21 sind Join-Partner ([[Steckbrief]]
§Referenzprozesse und Join). Der Agent bietet den Join
an, wenn er den Bedarf des anderen erkennt — beim Init
(Frage 2) oder im laufenden Projekt (ein Bescheid in
einem Rechtsstreit, eine Klage in einer Abgabensache).
Ablauf nach [[Init-Choreografie]] §Join: Merge des
zweiten Teil-Wikis, nur die neuen Start-Fragen,
Eintrag in [[Aktivierter-Prozess]], Buchung als DEC;
bei Widerspruch gilt der zuerst aktive Prozess. Nie
von sich aus ([[Zuschnitt-aendern]] §Rückfrage-Pflicht).

### 4.10 Abgrenzungen ähnlicher Strukturen

- **Marke ≠ Frist:** die Frist hat Verfall, die Marke
  nicht von selbst; sie kann auf Entscheidung
  `entfallen` ([[Marken-SP-2]] §6).
- **Schriftsatz-Knoten ≠ Produkt:** das Produkt lebt bis
  zur Einreichung als Versionskette in `output/`; der
  Knoten in [[Schriftsaetze]] entsteht mit Einreichung
  bzw. Eingang.
- **Einreichung ≠ Versandstand:** der Versandstand-Ordner
  ist der Nachweis in `outgoing/`; die Einreichung ist
  der Register-Eintrag darüber mit Zugang und Erwartung.
- **Anlage ≠ Beweisangebot:** die Anlage ist das
  eingereichte Dokument mit Nummer; das Beweisangebot
  ist die Relation Beweismittel ↔ Beweisthema.
- **Beteiligte ≠ Ansprechpartner ≠ Mitgliedschaften:**
  §3.1.
- **Zusage ≠ Erwartung:** beides Fristen, `richtung`
  sagt, wer schuldet ([[Katalog-Fristen]]).

## 5. Rollen und Dateien

### 5.1 Rolle des Anwenders im Verfahren

Die Rolle (Kläger, Beklagter, Antragsteller,
Betroffener, Gläubiger, Schuldner, Beigeladener,
Vertreter, öffentliche Stelle …; eine oder mehrere
zugleich, je Verfahren und Instanz) steht in der
Fassade [[Beteiligte]] und am `case`; sie steuert
Stimme, Absender, Freigabeweg, Prüfperspektiven und
die Voreinstellungen der Marken und Begleitanträge
([[Vorgehen-SP-2]] §Rolle und Interessen). Der Agent
prüft sie bei jedem Marken- und Instanzwechsel, bei
neuen Beteiligten und sonst per Wiedervorlage.

### 5.2 Rolle des Repos

Ein SP-2-Projekt ist in der Regel **Standalone**: ein
Repo, ein Verfahren oder ein Verbund von Strängen
desselben Vertraulichkeitskreises. Abweichungen:

- **Abspaltung** (Übernahme-Art `abspaltung`): ein
  Strang wird eigenes Projekt mit eigenem Repo — über
  den Übergabe-Punkt und den Startprompt der Basis
  ([[Zuschnitt-aendern]] §Übergabe-Punkt;
  [[Init-Choreografie]] §Init mit Startprompt
  (Abspaltung)); kein Übergabe-Dokument, kein Kettenglied
  bei der Mutter; Meldungen zurück als Nachricht. Auch
  ein Verfahren, das aus einem Software- oder
  Infrastruktur-Projekt heraus entsteht, kommt so.
- **Mandat** (Übernahme-Art `auftrag`, ohne Repo): die
  Vertretung arbeitet außerhalb des Templates; sie
  bekommt Startprompt und Auftrags-Dossier (P11), ihre
  Lieferungen kommen als Eingangsdokument mit ihrer
  Kennung; eingereicht ist nur die Fassung mit
  Einreichungsnachweis ([[Vorgehen-SP-2]] §Abspaltung
  und Mandat).

Koordinator und Komponente im Sinne von SP-1 gibt es in
SP-2 nicht; die Start-Tabelle vor dem Start einer
Teilaktivität (`Vorgehen.md` §3) gilt für Abspaltung und
Mandat.

### 5.3 Dateien des Prozess-Ordners

| Datei / Ordner | Zweck | Beim Merge |
|---|---|---|
| `Steckbrief.md` | Kurzform, Einstufungen, Ausbaustufen, Ordner, Präfixe, Mechanik, Referenzprozesse | Template-Quelle, nicht kopiert |
| `index.md` | diese volle Definition mit den Init-Fragen | Template-Quelle, nicht kopiert |
| `wiki/Vorgehen-SP-2.md`, `wiki/Marken-SP-2.md` | Phasentabelle, Fristen, Prüfen, Wächter, Vertraulichkeit, Normtexte; Marken und Stränge | kopiert (`process-procedure`) |
| `wiki/<Fassade>.md` | Fassaden-Skelette ([[Steckbrief]] §Mitgebrachte Fassaden) | kopiert |
| `bootstrap/<Fassade>.md` | Erst-Anlage je Fassade beim Init | abgearbeitet in Turn 3 |
| `wiki/Katalog-<Name>.md` | Katalog-Einträge der Fassaden-Typen und Dokumenttypen | kopiert und im Katalog verankert |
| `wiki/Wegweiser-<Ordnung>.md` mit `wiki/Wegweiser-<Ordnung>/` | Wegweiser je Verfahrensordnung und Querschnittsthema mit Teilaufsätzen, [[Wegweiser-Pruefraster]] | kopiert; template-eigen, das Upgrade ersetzt |
| `wiki/REC-9001 — Normen-Paket Stand 2026-11-05.md`, `research/REC-9001 - Normen-Paket Stand 2026-11-05/` | Detail-Knoten und Dateien des Normen-Pakets | kopiert nach `wiki/` und `research/` |
| `tools/` | Werkzeuge des Normen-Pakets | ins Projekt-`tools/`, Eintrag in `Tools.md` |
| `wiki/devstate-SP-2.md` | Mechanik-Knoten: Füllung von `devstate_active.md` | kopiert, in [[InterneMechanik]] eingetragen |
| `pruefungen/` | Prüf-Definitionen der SP-2-Wächter für das gemeinsame Prüfprogramm | Template-Quelle, eingelesen, nicht kopiert |

## 6. Bezüge

- Kurzform: [[Steckbrief]]
- Vorgehen: [[Vorgehen-SP-2]]; Marken: [[Marken-SP-2]]
- Basis: `Vorgehen.md`, `Outgoing.md`, `Reviewmuster.md`,
  [[Kettenpruefung]], [[Init-Choreografie]],
  [[Zuschnitt-aendern]], [[Lebenslauf-eines-Stands]]
- Referenzprozesse: `../RP-20-Rechtsfall/`,
  `../RP-21-Steuer-und-Abgabenfall/`
