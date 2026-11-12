---
type: process-mapping
---

# RP-21 Steuer- und Abgabenfall

**Bearbeitungsstand:** 2026-11-11 (Ausarbeitung; löst den
Platzhalter ab)

Ich bin die **volle Definition** des Referenzprozesses
RP-21 — Template-Quelle, nie ins Anwender-`wiki/`
kopiert. Die Kurzform mit den Deklarationen steht im
[[Steckbrief]]; was beim Merge ins Projekt kommt, steht
in §6.

## 1. Ich bin RP-21

Ich bin der Referenzprozess für **Steuern und Abgaben** —
Steuern des Bundes und der Länder, Zölle, kommunale
Abgaben, Gebühren und Beiträge — von der Mitwirkung ohne
Streit über das Einspruchs- bzw. Widerspruchsverfahren
bis zum Finanz- bzw. Verwaltungsgericht durch alle
Instanzen, einschließlich der Abgabenvollstreckung und
ihrer Abwehr; für eine oder mehrere Personen und
Gesellschaften, mehrere Abgabenarten und Zeiträume, auch
als Massenverfahren; in jeder Rolle einschließlich der
abgabenerhebenden Stelle ([[Steckbrief]] „Was ich bin“).

Was den Steuer- und Abgabenfall vom Rechtsfall
unterscheidet, ist die **Kette**: Bescheide ergehen je
Subjekt, Abgabenart und Zeitraum, ändern einander,
stehen unter Vorbehalt oder sind vorläufig, und jeder
löst beim Zugang eine Frist aus — meist ohne dass ein
Verfahren im Sinne eines Streits läuft. RP-21 bringt
deshalb Fassaden mit, die SP-2 nicht kennt:
[[Bescheidketten]] und [[Steuersubjekte]]; dazu den
[[Fristenkatalog-RP-21]] mit den Bekanntgabe-Fiktionen
je Ordnung, die Posteingangs-Pflichten je Bescheid, die
Serie als Normalform des Massenverfahrens und die
Abgabenvollstreckung über das Forderungskonto
([[Vorgehen-RP-21]]). Verfahren außerhalb des
Abgabenrechts führt [RP-20](../RP-20-Rechtsfall/index.md);
beide sind Join-Partner (§4.9).

**Wichtig:** RP-21 ist **keine Steuerberatung und kein
Steuerprogramm**. Er führt die Akte, die Ketten, die
Fristen und die Verfahren; die Steuerberechnung selbst,
die Erklärung in der Form der Verwaltung und die
Übermittlung über das Portal bleiben beim Anwender oder
seiner Vertretung. Die Rechtskenntnis kommt aus den
Wegweisern, dem Fristenkatalog und dem Normen-Paket; was
dort nicht steht (Einzelsteuergesetze, Landesrecht,
Satzungen, Zollrecht), recherchiert der Agent als
Rechercheartefakt und prüft es an der Primärquelle.
**Der Anwender entscheidet; der Agent handelt nie
selbst nach außen.**

## 2. Rolle dieser Datei und wie RP-21 auf SP-2 aufsetzt

RP-21 erbt vollständig von SP-2 (`extends: [SP-2]`) und
**nicht von RP-20**: gerichtliche Marken, Enden und
Fristen benennt RP-21 selbst je Ordnung, nach dem Muster
von RP-20. Alles, was ein Verfahren trägt, kommt aus
SP-2 (`../SP-2-Recht-und-Verwaltung/index.md`) und der
Basis. RP-21 **präzisiert**, **benennt keine Phase um**
und bringt **Fassaden mit eigenen Typen** mit (§3.1);
Präfixe und Mechanik-Knoten bringt es nicht mit.

Die Präzisierungen stehen an einem Ort:
[[Vorgehen-RP-21]] §3 ist der führende Ort der
Fassaden-Präzisierungen; die SP-2- und
Basis-Katalog-Einträge der betroffenen Fassaden
verweisen dorthin (Block „RP-21-Präzisierung“). Diese
Datei (`index.md`) erklärt Architektur und Init-Fragen
und wird nicht kopiert.

Bei einem Join gilt zwischen RP-20 und RP-21 der zuerst
aktive Prozess ([[Zuschnitt-aendern]] §Join).

## 3. Konkrete Instanzen der Basis + SP-2

### 3.1 RP-21-Fassaden

| Fassade | Typ(en) | Katalog-Eintrag | Einstufung |
|---|---|---|---|
| [[Bescheidketten]] | `notice-log`, `notice` (`extends: document`, `document_type: bescheid`) | [[Katalog-Bescheidketten]] | neu; Pflicht ab Stufe 1; der Bescheid-Knoten ist zugleich das Eingangsdokument — ein Knoten, zwei Register |
| [[Steuersubjekte]] | `taxpayer-log`, `taxpayer` (Entität) | [[Katalog-Steuersubjekte]] | neu; Pflicht ab dem zweiten Subjekt (Auslöser), davor optional |

Beide kommen mit Skelett, Bootstrap-Datei und
Katalog-Eintrag (§6). `notice` erweitert den Basis-Typ
`document` um die Felder der Kette; der Katalog-Eintrag
der Eingangsdokumente bleibt unverändert. `taxpayer`
ist eine Entität neben Personen und Organisationen: die
Person bleibt dort, ihre steuerliche Rolle mit
Kennzeichen steht hier.

### 3.2 RP-21-Präzisierungen an SP-2- und Basis-Fassaden

Tabelle im [[Steckbrief]] §Mitgebrachte Fassaden
(zweite Tabelle); führender Ort [[Vorgehen-RP-21]] §3.
Merge-Regel: der Agent liest die Präzisierungen und
schreibt die Voreinstellungen (Rollen, Anlagen-Schema,
Vertretungszwang, Kanäle, Kostenregime, Einheitstyp der
Serie) als Vorschlag mit Quelle in die Fassaden des
Projekts; der Anwender bestätigt oder ändert.

### 3.3 RP-21-Wissensknoten

[[Fristenkatalog-RP-21]] (Typ `guide`, Teilaufsätze):
Grundbestand der Fristen je Abgabenart und Ordnung mit
Bekanntgabe-Fiktion in der Berechnungsregel.
Wissensknoten des Templates wie die Wegweiser: das
Upgrade ersetzt ihn mit dem Normen-Stand, das Projekt
ändert ihn nicht. „Offene Liste“ heißt: das Template
erweitert den Katalog mit jedem Release; projekt-eigene
Fristenregeln (Einzelsteuergesetz, Kommunalabgabengesetz,
Satzung) stehen in eigenen Knoten —
Projekt-Rechercheartefakt oder Konzept — und als
`source` an der Frist. Beim Merge kopiert der Agent
Übersicht und Teilaufsätze nach `wiki/` und trägt die
Zeile im Index [[Wegweiser]] ein ([[Steckbrief]]
§Mitgebrachte Wissensknoten, Merge-Anweisung).

### 3.4 RP-21-Präfixe

Keine neuen (Steckbrief §Mitgebrachte Präfixe).

## 4. RP-21-eigene Mechanismen

Die Mechanismen im Einzelnen stehen in
[[Vorgehen-RP-21]] (führender Ort); hier die Landkarte:

### 4.1 Stufe

Mitwirkung ohne Streit ist Stufe 1 im selben Projekt; ein
ablehnender oder belastender Bescheid oder eine
Vollstreckungsmaßnahme beginnt auf Stufe 2, ein
Gerichtsverfahren auf Stufe 3 ([[Steckbrief]] §Einstieg
nach Stufe). Der Wächter erkennt den Eskalationsanlass
im Posteingang (SP-2).

### 4.2 Bescheidkette und Posteingangs-Pflichten

Beim Einlesen jedes Bescheids: Kette fortschreiben,
Frist ziehen, Rechtsbehelfsfähigkeit prüfen; Behördenpost
aus Portalen zählt als Eingang mit der
Bekanntgabe-Fiktion der Bereitstellung zum Abruf
([[Vorgehen-RP-21]] §4; [[Bescheidketten]]).

### 4.3 Steuersubjekte

Eine Akte je Familie oder Gesellschaftskreis; Kennzeichen
mit Historie; Zuordnung eines Eingangs über Kennzeichen
und Schreibweise ([[Steuersubjekte]]).

### 4.4 Serien und Strategiewechsel

Massenverfahren als Serie mit Vorlage je Gruppe,
Datensatz je Einheit, Freigabe, Unterschrift und Versand
je Einheit mit Bestätigungsstopp und Dublettenprüfung;
Strategiewechsel als Ablösung der Strategie mit
Änderungskatalog und Freigabevermerk je Einheit
([[Vorgehen-RP-21]] §6).

### 4.5 Eilrechtsschutz und Ruhen

Einspruch und Klage hemmen die Vollziehung nicht;
Aussetzung zuerst bei der Stelle, bei Gericht erst nach
Ablehnung, Untätigkeit oder drohender Vollstreckung —
Pflichtabschnitt Begleitanträge; Ruhen des Einspruchs
im Hinblick auf ein Musterverfahren als Zustand mit
Wiedervorlage ([[Vorgehen-RP-21]] §7).

### 4.6 Abgabenvollstreckung und Abwehr

Forderungskonto mit Tilgungsbestimmung je Zahlung,
Kassenzeichen und Nachweis aus Buchungsdaten; Mahnung
und Vollstreckungsankündigung als Ereignis-Marken;
Einwendungen, einstweilige Einstellung, Stundung, Erlass
als Marken ([[Vorgehen-RP-21]] §8).

### 4.7 Kanäle

Fax mit Anlagen- und Seitengrenze der Stelle
(Teilsendungen); Steuer- und Behördenportal mit Quittung
als Nachweis und Abrufturnus ab der Stufe, in der es
eröffnet ist ([[Vorgehen-RP-21]] §5).

### 4.8 Vertretung und Prüfperspektiven

Vertretungszwang je Instanz und Handlung (vor dem
Bundesfinanzhof), Mandat als `auftrag` wie in RP-20;
Prüfperspektiven der Stelle, „Adressat“, wenn der
Anwender die Stelle ist, Gegenperspektive
([[Vorgehen-RP-21]] §9).

### 4.9 Join mit RP-20

[[Steckbrief]] §Join. Anlass im laufenden Projekt: ein
Streit um eine Leistung oder einen Status aus derselben
Sache (Sozialrecht, Zivilrecht), eine
Verfassungsbeschwerde, eine zivilrechtliche
Vollstreckung. Der Agent bietet an, der Anwender
entscheidet, Buchung als Entscheidung; nur die neuen
Start-Fragen von RP-20 werden gestellt.

### 4.10 Abgrenzungen ähnlicher Strukturen

- **Bescheid ≠ Eingangsdokument ≠ Kette:** der Bescheid
  ist ein Eingangsdokument (Nachweis) und zugleich Glied
  einer Kette; die Kette ist der Register-Eintrag, der
  sagt, was noch angreifbar ist.
- **Steuersubjekt ≠ Beteiligter ≠ Person:** die Person
  steht in Personen oder Organisationen; der Beteiligte
  ist ihre Rolle im Verfahren; das Steuersubjekt ihre
  steuerliche Rolle mit Kennzeichen.
- **Kette ≠ Verfahren:** die Kette läuft auch ohne
  Streit (Stufe 1); ein Verfahren (`case`) entsteht mit
  dem Rechtsbehelf und nennt die Kette. Bis dahin
  tragen die Bescheide kein Feld `case`; der Agent legt
  für einen Bescheid ohne Rechtsbehelf kein Verfahren
  an und trägt das Feld mit dem Rechtsbehelf nach
  ([[Katalog-Eingangsdokumente]] SP-2-Präzisierung).
- **Serie ≠ Bündel:** die Serie ist eine Marke mit
  Einheiten (gleichartige Rechtsbehelfe je Grundstück
  oder Bescheid); das Bündel eine Marke mit mehreren
  Produkten ([[Marken-SP-2]] §Stränge).
- **Abgabenvollstreckung (RP-21) ≠ Vollstreckung aus
  einem Titel (RP-20).**

## 5. Prozess-spezifische Init-Fragen

RP-21 stellt seine Fragen **zusätzlich** zu den
SP-2-Init-Fragen (`../SP-2-Recht-und-Verwaltung/index.md`
§4.6), geordnet nach Vorfestlegungs-Stärke; vor jeder
Frage gilt die Ableitbarkeits-Prüfung (MasterPrompt
§5.1.0) — aus den vorhandenen Bescheiden lässt sich das
meiste ablesen. Beim Join nach RP-20 werden nur diese
Fragen gestellt.

1. **Subjekte und Kreis** — für wen die Akte geführt wird
   (eine Person, Ehegatten, Familie, Gesellschaft mit
   Gesellschaftern, Haftungsschuldner); bei mehr als
   einem Subjekt wird [[Steuersubjekte]] Pflicht. _Legt
   vorab fest:_ Aktivierung der Fassade, Rollen in
   [[Beteiligte]], Vertraulichkeit der Kennzeichen.
2. **Abgabenarten, Zeiträume und Stellen** — welche
   Abgabenarten und Zeiträume im Streit oder in der
   Mitwirkung stehen und welche Stellen zuständig sind
   (Finanzamt, Hauptzollamt, Gemeinde, Zweckverband);
   daraus die **Ordnung** (Abgabenordnung und
   Finanzgerichtsordnung; Landesrecht und
   Verwaltungsgerichtsordnung für Kommunalabgaben) und
   der Teilaufsatz des [[Fristenkatalog-RP-21]]. _Legt
   vorab fest:_ Ketten-Schlüssel, Wegweiser, geprüfte
   Versandwege der Stellen mit Seiten- und
   Anlagengrenze, Portal-Kanäle mit Abrufturnus.
3. **Vorhandene Bescheide** — welche Bescheide bereits
   vorliegen (Akte, Portal-Postfach, Papier); die
   Bescheidketten werden **zuerst** aus dem Bestand
   aufgebaut, laufende Fristen sofort gemeldet
   ([[Bescheidketten]] Bootstrap). _Legt vorab fest:_
   Stufe (ein belastender Bescheid → Stufe 2), erste
   Marke ([[Marken-RP-21]]), Angreifbarkeit je Kette.
4. **Massenverfahren?** — ob gleichartige Rechtsbehelfe
   je Einheit anstehen (je Grundstück, Bescheid,
   Zeitraum, Person); dann [[Serien]] aktiv mit
   Einheitstyp, bei Grundbesitz [[Flurstuecke]]. _Legt
   vorab fest:_ Strang-Form Serie, Einheitstyp,
   Freigabe je Einheit.
5. **Vertretung und Vertretungszwang** — Steuerberater,
   Rechtsanwalt oder gesetzlicher Vertreter als Eintrag
   in [[Beteiligte]]; Vertretungszwang je Instanz (vor
   dem Bundesfinanzhof, [[Wegweiser-FGO]]). _Legt vorab
   fest:_ Feld `vertretungszwang`, ob P6 „Mandat
   erteilen“ ansteht, wer über das Portal übermittelt.
6. **Vollstreckung im Raum?** — Mahnung,
   Vollstreckungsankündigung, Pfändung, Stundungs- oder
   Erlassantrag; dann [[Forderungskonto]] aktiv mit
   Kassenzeichen und Buchungsdaten. _Legt vorab fest:_
   Stufe 2, Begleitanträge Aussetzung der Vollziehung
   und einstweilige Einstellung.

Weitere RP-21-Fragen entstehen aus dem Verlauf
(Instanzwechsel, neues Subjekt im Posteingang) und
werden als Rückfrage in der Marke gestellt.

## 6. Rollen und Dateien

### 6.1 Rolle des Anwenders

Wie SP-2 (`../SP-2-Recht-und-Verwaltung/index.md` §5.1);
RP-21 liefert den Rollen-Grundbestand des Abgabenrechts
und je Rolle die Voreinstellungen ([[Vorgehen-RP-21]]
§3, §9; [[Marken-RP-21]] §6). Als **abgabenerhebende
Stelle** kehren sich die Voreinstellungen um; der Erlass
von Bescheiden als Massengeschäft ist kein eigener
Ablauf des Templates ([[Wegweiser-Bescheid-erlassen]]).

### 6.2 Dateien des Prozess-Ordners

| Datei / Ordner | Zweck | Beim Merge |
|---|---|---|
| `Steckbrief.md` | Kurzform, Deklarationen, Stufen, Wegweiser-Zuordnung, Join | Template-Quelle, nicht kopiert |
| `index.md` | diese volle Definition mit den Init-Fragen | Template-Quelle, nicht kopiert |
| `wiki/Vorgehen-RP-21.md`, `wiki/Marken-RP-21.md` | Präzisierungen je Phase und Fassade, Posteingang, Kanäle, Serien, Eilrechtsschutz, Vollstreckung, Vertretung; Marken, Ereignis-Marken, Enden und Folgen je Ordnung | kopiert (`process-procedure`) |
| `wiki/Bescheidketten.md`, `wiki/Steuersubjekte.md` | Fassaden-Skelette ([[Steckbrief]] §Mitgebrachte Fassaden) | kopiert |
| `bootstrap/Bescheidketten.md`, `bootstrap/Steuersubjekte.md` | Erst-Anlage je Fassade beim Merge | abgearbeitet in Turn 3 |
| `wiki/Katalog-Bescheidketten.md`, `wiki/Katalog-Steuersubjekte.md` | Katalog-Einträge der Typen `notice-log`/`notice` und `taxpayer-log`/`taxpayer` | kopiert und im Katalog verankert |
| `wiki/Fristenkatalog-RP-21.md` mit `wiki/Fristenkatalog-RP-21/` | Fristenkatalog mit Teilaufsätzen je Ordnung | kopiert; template-eigen, das Upgrade ersetzt; Zeile in [[Wegweiser]] |

## 7. Bezüge

- Kurzform: [[Steckbrief]]
- Vorgehen: [[Vorgehen-RP-21]]; Marken: [[Marken-RP-21]];
  Fristen: [[Fristenkatalog-RP-21]]
- Fassaden: [[Bescheidketten]], [[Steuersubjekte]];
  Kataloge: [[Katalog-Bescheidketten]],
  [[Katalog-Steuersubjekte]]
- Elternprozess: `../SP-2-Recht-und-Verwaltung/index.md`,
  [[Vorgehen-SP-2]], [[Marken-SP-2]]
- Basis: `Vorgehen.md`, `Outgoing.md`, [[Kettenpruefung]],
  [[Init-Choreografie]], [[Zuschnitt-aendern]]
- Join-Partner: `../RP-20-Rechtsfall/index.md`
