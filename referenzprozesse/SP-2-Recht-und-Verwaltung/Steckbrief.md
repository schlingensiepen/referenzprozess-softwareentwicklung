---
type: process-brief
process: SP-2
status: ausgearbeitet
extends: []
---

# SP-2 — Recht und Verwaltung

**Bearbeitungsstand:** 2026-11-11 (Ausarbeitung:
Ausbaustufen, Fassaden mit „Pflicht ab“, Typen,
mitgebrachte Ordner, Referenzprozesse mit Join)

**Was ich bin:** Der Standardprozess für Vorgänge mit
einem oder mehreren **Gegenübern** (Gericht, Behörde,
Gegenpartei, Schlichtungs-, Mediations- oder
Schiedsstelle; private Stellen mit eigenem Verfahren
werden wie Behörden geführt) und einem **Verfahren**,
mit oder ohne Streit, in jeder Rolle des Anwenders —
angreifend, verteidigend, beteiligt, ohne Gegner, auch
als öffentliche Stelle. Zuschnitt: alle
Gerichtsbarkeiten, Vor- und Verwaltungsverfahren,
Antrag und Mitwirkung, außergerichtlicher Streit mit
Schlichtung, Mediation und Schiedsverfahren,
Vollstreckung, Bußgeld und Strafbefehl als Betroffener,
Forderungsanmeldung in der Insolvenz, Strafrecht in
Grundzügen (dünner Wegweiser zum Erkennen und zum
Abspalten), formlose Rechtsbehelfe, Auslands- und
EU-Bezug zum Erkennen.

**Leitsatz:** Ein Verfahren ist ein **Projekt im Sinne
der Basis** — je Marke geht ein Produkt nach außen
(Schriftsatz, Einspruch, Briefwelle, Erklärung im
Termin), es entsteht in einer Fassungskette und wird
vor dem Versand geprüft und freigegeben. SP-2 belegt
die Basis-Phasen juristisch ([[Vorgehen-SP-2]]) und
ergänzt nur, wo ein Verfahren strukturell anders ist:
die Gegenseite taktet (Ereignis-Marken sind der
Normalfall), eine Frist kann die Marke gegenstandslos
machen (`entfallen`), maßgeblich ist der Zugang, nicht
die Absendung, zwei Autoren am Produkt bei mandatierter
Vertretung (`auftrag` ohne Repo), Stränge laufen
parallel, Rolle und Verfahrensgrundsatz des Anwenders
steuern Stimme, Freigabeweg und Prüfung,
Vertraulichkeitsstufen in der Akte, Verfahren entstehen
aus Vorgängen (Ausbaustufen), materielle Fristen werden
aus dem Sachverhalt berechnet.

**Erbt nur von der Basis** (`extends: []`). Was ein
Verfahren trägt, liegt in der Basis: Marke, Produkt,
Tag; Kette der Pflicht-Stände mit Zweck-Freigaben und
Kettenprüfung; Versionsketten, Einfrieren und Ablösen;
Zwischenmarke, Sackgasse, Verzicht, `entfallen`;
Übernahme-Arten und Verbund; `outgoing/` mit
Versandstand-Ordner und Pflicht-Review; Fristen,
Aktenzeichen, Eingangsdokumente, Rechercheartefakte.
Die SP-1-Register passen nicht; Prüfplan und
Einreichungs-Stand übernehmen nur die **Bauform** von
Testplan und Deploy-Stand, ohne Vererbung.

## Ausbaustufen

SP-2 deklariert drei Ausbaustufen — eine Lage, die von
außen kommt ([[Katalog-process-brief]] „Ausbaustufen
und ‚Pflicht ab‘“):

| Stufe | Lage | Typischer Einstieg |
|---|---|---|
| **1 Vorgang** | Antrag, Mitwirkung, Schreiben ohne Streit | wer selbst beginnt (Antrag, Anfrage, Erklärung) |
| **2 Streit** | Rechtsbehelf bei einer Stelle, außergerichtlicher Streit, Verfahren vor einer privaten Stelle | wer gegen einen Bescheid vorgeht; wem eine Stelle oder private Stelle ein Verfahren eröffnet |
| **3 Gericht** | Verfahren bei Gericht, Vollstreckung aus einem Titel | wer klagt; wem ein gerichtliches Verfahren zugestellt wird — sofort mit Fristüberwachung |

**Einstieg:** Die Stufe beginnt dort, wo das Verfahren
beginnt. Wer selbst angreift, beginnt in der Regel auf
Stufe 1 oder 2; ein vom Gegenüber eingeleitetes
Verfahren beginnt auf der **Stufe seiner Form**. Die
Zuordnung der Formen ist eine offene Liste mit
Grundbestand:

- **Stufe 2:** Bescheid oder Maßnahme einer Stelle mit
  Rechtsbehelf bei ihr (belastender Verwaltungsakt,
  Bußgeldbescheid, Verwaltungs- oder
  Abgabenvollstreckung); Verfahren vor einer privaten
  Stelle (auch Schiedsverfahren, Forderungsanmeldung
  beim Insolvenzverwalter).
- **Stufe 3:** Verfahren bei Gericht (Klage, Mahn- oder
  Vollstreckungsbescheid, Eilantrag, Strafbefehl,
  Verfahren nach Einspruch gegen einen Bußgeldbescheid,
  Zwangsvollstreckung aus einem Titel, gerichtliche
  Verfahren zum Schiedsspruch, Feststellungsklage in
  der Insolvenz).

Der Init setzt die Einstiegsstufe aus der Antwort auf
die zweite Init-Frage (`index.md` §4.6) in die Zeile
`Ausbaustufe` des Herkunfts-Vermerks
([[Aktivierter-Prozess]]). **Ausgeliefert wird immer die
volle Fassung;** Fassaden und Dokumenttypen unterhalb
der Stufe liegen mit `active: false` bereit, ihre
Glieder entfallen abgeleitet ([[Kettenpruefung]]
§Fehlende und vertretene Glieder). Der Wächter erkennt
den Eskalationsanlass im Posteingang (ablehnender
Bescheid, Mahnung, Vollstreckungsankündigung, Klage,
Eilantrag, Rechtsmittel) und schlägt die nächste Stufe
vor ([[Vorgehen-SP-2]] §Wächter); der Wechsel ist eine
Entscheidung des Anwenders nach [[Zuschnitt-aendern]]
(Weg „Umbauen“). **Kein automatischer Rückbau nach
Deeskalation:** Was einmal aktiv ist, bleibt aktiv, bis
der Anwender es abwählt. Produkt-Satz: Stufen bilden
eine Lage ab, die von außen kommt; wo der Anwender die
Strenge selbst wählt, gilt der Verzicht.

## Mitgebrachte Fassaden

Was ein Typ ist (Zweck, Datei, Pflichtfelder,
Schlüssel), steht nur in seinem Katalog-Eintrag — lesen
bei Anlage oder Pflege der Fassade; die Spalte
„Gegenstand“ ist die Link-Beschreibung. Die Einstufung
(„Pflicht ab“) steht hier; ob eine Fassade aktiv ist,
führt [[Fassaden]]. Namenskonvention: Fassaden deutsch,
Typen englisch (Ausnahme `flurstueck`); Präfixe nur für
intern nummerierte Register (`STR`, `EVP`, `TAT`,
`ARG`; `VF` für das Verfahren bis zum Aktenzeichen);
Anlagen mit Schlüssel Verfahren + externe Nummer;
Schriftsätze und Einreichungen mit sprechendem Slug.

| Fassade | Typ(en) | Katalog-Eintrag | Gegenstand | Pflicht ab |
|---|---|---|---|---|
| [[Verfahren]] | `case` (Register-Typ `case-log`) | [[Katalog-Verfahren]] | je Verfahren Stelle, Aktenzeichen, Instanz, Gegenüber, Rolle, Vertretung und Vertretungszwang, Verfahrensgrundsatz, Nummerierungsschema der Anlagen, Status (führt den Abschluss), Strang-Form | **Stufe 1** |
| [[Beteiligte]] | `party` (Relation Person/Organisation ↔ Verfahren) | [[Katalog-Beteiligte]] | Rolle je Verfahren und Instanz, Vertretung und Vollmacht, Interessen, Kostenträger, Dritte mit eigener Frist; kanonisch für Absender, Stimme und Unterschrift | **Stufe 1** |
| [[Strategie]] | `strategy`, `contingency` (`STR`, `EVP`) | [[Katalog-Strategie]] | Ziel, Grundlinie, Sperrliste, Haltung; Eventualpläne mit Auslöser und vorbereitetem Zug; Pflicht-Eingabe jedes Prüfauftrags | Stufe 2 |
| [[Sachverhalt]] | `assertion` (`TAT`) | [[Katalog-Sachverhalt]] | Tatsachen mit Herkunft und Stellung (nach dem Verfahrensgrundsatz), Beleg über die `evidence`-Relation | Stufe 2 |
| [[Argumente]] | `argument` (`ARG`) | [[Katalog-Argumente]] | Linien mit Pflicht-Gegeneinwand; Element, Freeze mit dem Argumentations-Stand | Stufe 2 |
| [[Schriftsaetze]] | `submission` (`extends: document`) | [[Katalog-Schriftsaetze]] | Kette je Verfahren in beide Richtungen; `## Anlagen` als Sammler und Nachweis; Knoten erst mit Einreichung bzw. Eingang | **Stufe 1** |
| [[Anlagen]] | `exhibit` (Verfahren + externe Nummer) | [[Katalog-Anlagen]] | Nummernvergabe nur hier, im Entwurf `temp-`, endgültig beim Tag; Quelle mit Prüfsumme, Beweisthema, Form, Status | **Stufe 1** |
| [[Einreichungen]] | `filing` | [[Katalog-Einreichungen]] | Register über die Versandstand-Ordner: Fassung (Tag), Empfänger, Kanal, Zeitpunkt, Nachweis, Zugang, Prüfsumme, Erwartung | **Stufe 1** |
| [[Kosten]] | `cost-item` | [[Katalog-Kosten]] | Streitwert, Gerichtskosten, PKH, Beratungshilfe, Erstattung, Honorare, Kostenrisiko; Feld Träger | Stufe 1 aktivierbar — Pflicht, sobald Kostenantrag, PKH, Beratungshilfe, Erstattung im Vorverfahren oder Vorschuss ins Spiel kommt |
| [[Beweisangebote]] | `evidence` (Relation, mit Beweisart) | [[Katalog-Beweisangebote]] | Beweisangebote, Beweisanregung, Beweissicherung je Beweisthema; Beweisart offene Liste | optional ab Stufe 2 |
| [[Serien]] | `series-unit` | [[Katalog-Serien]] | Massenverfahren: Manifest, Freigabevermerk, Signatur- und Versandstatus je Einheit | optional |
| [[Forderungskonto]] | `receivable` | [[Katalog-Forderungskonto]] | Forderung, Zahlungen, Tilgungsbestimmung, Anrechnung, Saldo | optional ab Stufe 2 |
| [[Flurstuecke]] | `flurstueck` | [[Katalog-Flurstuecke]] | Beispiel einer Einheit mit eigenem Typ | optional |
| [[Wegweiser]] | `guide` (template-eigen) | [[Katalog-Wegweiser]] | je Verfahrensordnung und Querschnittsthema ein Knoten mit Teilaufsätzen: Rechtsbehelfe und Fristen, Eilrechtsschutz, Kosten, Begleitanträge, Prüfraster, Heilung, Erledigung; das Upgrade ersetzt, das Projekt ändert nicht | **Stufe 1** |

**Basis-Fassaden, die SP-2 zur Pflicht macht und
schärft:** Eine optionale Basis-Fassade wird Pflicht,
wenn der aktive Prozess sie voraussetzt; der Merge
aktiviert sie ohne Anwender-Frage (Wiki.md §3a). Was
SP-2 je Fassade ergänzt, steht als Block
„SP-2-Präzisierung“ im jeweiligen Basis-Katalog-Eintrag.

| Basis-Fassade | Pflicht ab | Warum SP-2 sie voraussetzt |
|---|---|---|
| [[Fristen]] | Stufe 1 | führt alle Fristen des Verfahrens; Felder `entstehung`, `wirkung` mit `verlaengerbar` und `wiedereinsetzung`, `zeitbudget` ([[Katalog-Fristen]]); „Immer ein Wecker“ ([[Vorgehen-SP-2]] §Fristen) |
| [[Eingangsdokumente]] | Stufe 1 | der Posteingang: Zugangsdatum, Zustellart, ausgelöste Frist / Marke / Eventualplan, Status `eingelesen`; `document_type` um `schriftsatz`, `beschluss`, `verfuegung`, `einspruchsentscheidung`, `bescheid`, `vermerk` erweitert ([[Katalog-Eingangsdokumente]]) |
| [[Aktenzeichen]] | Stufe 1 | Umbenennung, Verbindung, Zuordnung zum `case` ([[Katalog-Aktenzeichen]]) |
| [[Chronologie]] | Stufe 1 | Zeitleiste des Verfahrens ([[Katalog-Chronologie]]) |
| [[Organisationen]] mit `authority` | Stufe 1 | je Stelle der **geprüfte Versandweg** (Kanal, Nummer, Postfach, Seiten- und Anlagengrenze); auch Schlichtungs-, Güte-, Mediations- und Schiedsstellen; die Stelle vertritt die Zielumgebung der Doku-Abfrage ([[Katalog-Organisationen]]) |
| [[Ansprechpartner]] | Stufe 1 | Sachbearbeiter je Stelle und Vertretung, mit Wechseln ([[Katalog-Ansprechpartner]]) |
| [[Rechercheartefakte]] | Stufe 1 | Grundbefüllung aus dem Normen-Paket: die Register-Zeile REC-9001 trägt der Agent beim Merge ein, Wortlaut in der Bootstrap-Datei `bootstrap/Wegweiser.md` §Verankerungen (§Mitgebrachte Ordner; [[Katalog-Rechercheartefakte]]) |
| [[Mission Statement]] | Stufe 1 | Pflichtteil „Rolle und Interessen“ ([[Katalog-Mission-Statement]]) |

[[Agent-Berichte]], [[Entscheidungen]] und
[[Zielmarken]] sind in SP-2 Pflicht (Entscheidungen und
Zielmarken wie in jedem Projekt; Agent-Berichte, die die
Basis nur vorauswählt, macht SP-2 zur Pflicht);
SP-2 nutzt sie für die Prüfberichte, die
Entscheidungsarten `verfahren` und `strang`
([[Katalog-Entscheidungen]]) und die Marken
([[Marken-SP-2]]). [[Mitgliedschaften]] bleibt auch in
SP-2 `active: false`: Beteiligte und Mitgliedschaften
teilen nur die Bauform, nicht den Gegenstand; der Agent
schlägt das Einschalten vor, wenn eine Zugehörigkeit
über Verfahren oder Zeit hinweg erheblich wird
([[Katalog-Mitgliedschaften]]). Die Basis-Fassade
Rollen (`role`) wird in SP-2 nicht verwendet.

**Bewusst ohne eigene Fassade:** Fassungen
(Versionsketten, Tag, Einreichungen), gegnerische
Schriftsätze und Entscheidungen (Schriftsätze plus
Eingangsdokumente mit `document_type`), Anträge,
Mandat, Rolle und Vertraulichkeit (Felder),
Fristenkataloge (Wissensknoten je Referenzprozess).

Dazu bringt SP-2 Dokumenttyp-Einträge mit: die
Pflicht-Stände der Kette und die selbsttragenden
Dokumenttypen. Welche es sind und welche Phase sie
tragen, steht in [[Vorgehen-SP-2]] §2 (lesen beim Merge
und vor der Bildung eines Stands); sie werden beim Merge
wie die Register-Einträge als Dateien kopiert und im
Katalog verankert.

## Pflicht ab

Der Herkunfts-Vermerk in [[Aktivierter-Prozess]] trägt
die Zeile `Ausbaustufe: <n> seit JJJJ-MM-TT`; das
Prüfprogramm liest „Stufe n“ je Fassade und Dokumenttyp
gegen diese Zeile. Für die Fassaden steht die Stufe in
der Tabelle oben; für die Dokumenttypen hier
(Einzelheiten je Typ in [[Vorgehen-SP-2]] §2 und im
Katalog-Eintrag):

| Dokumenttyp (Phase) | Pflicht ab |
|---|---|
| [[Katalog-Strategie-Stand]] (P1) | Stufe 2 |
| [[Katalog-Sachverhalt-Stand]] (P3) | Stufe 2 |
| [[Katalog-Argumentation-Stand]] (P4) | Stufe 2 |
| [[Katalog-Verfahrens-Stand]] (P5) | Stufe 1 (darf dünn sein) |
| [[Katalog-Verfahrens-Entscheidungen]] (P7) | Stufe 1 dünn mit Pflichtabschnitt Begleitanträge, voll ab Stufe 2 |
| [[Katalog-Gliederung-Stand]] (P8) | Stufe 1 (Verzicht bei kurzen Schreiben üblich) |
| [[Katalog-Schriftsatz]] (P9, Produkt mit Tag) | Stufe 1, nicht verzichtbar |
| [[Katalog-Pruefplan]] (P10) | Stufe 1 |
| [[Katalog-Dossier-Stand]] (P11) | Stufe 2, nach Doku-Abfrage |
| [[Katalog-Erlaeuterung-Stand]] (P12) | Stufe 1, nach Doku-Abfrage |
| [[Katalog-Einreichung-Stand]] (P13) | Stufe 1 |
| [[Katalog-Serien-Stand]] (P14) | Stufe 1, nur bei einer Serie |
| [[Katalog-Akten-Fuehrungsplan]] (P15) | Stufe 1, nach Doku-Abfrage |
| [[Katalog-Termin-Vorbereitung]] (P9 der Termin-Marke) | Stufe 1 (nur Termin-Marke) |
| [[Katalog-Termin-Ergebnis]] (Glied „Termin auswerten“) | Stufe 1 (nur Termin-Marke), nicht verzichtbar |

Unterhalb der Stufe entfallen die Glieder abgeleitet
([[Kettenpruefung]] §Fehlende und vertretene Glieder);
P6 „Strang starten / Mandat erteilen“ hat keinen
Dokumenttyp und entfällt abgeleitet, solange keine
Abspaltung und kein Mandat ansteht.

## Mitgebrachte Ordner

SP-2 deklariert keine neuen Root-Ordner; `research/`,
`tools/` und `output/` sind Basis-Ordner. SP-2 bringt
**Inhalte** für Basis-Ordner mit, die der Merge ins
Projekt kopiert (Wiki.md §11.3):

| Ordner im Prozess-Ordner | Inhalt | Beim Merge |
|---|---|---|
| `research/REC-9001 - Normen-Paket Stand 2026-11-05/` | das Normen-Paket als Rechercheartefakt je Paket-Stand: `yyyy-mm-dd <kuerzel>.xml`, `.pdf`, `.md` je Gesetz und `manifest.tsv`; Detail-Knoten [[REC-9001 — Normen-Paket Stand 2026-11-05]] mit Kennzeichen `mitgeliefert: template` (fehlt das Feld, ist ein REC projekt-eigen) und Abschnitt „Auffälligkeiten der Quelle“ | nach `research/` des Projekts; eingefroren ab Anlage; die Übernahme des Paket-Stands ist eine Entscheidung je Stand (Feld „Übernommen als DEC“); ein neuer Stand liegt neben dem alten; `raw/` und `input/raw/` bleiben frei, der Wächter C1 vergleicht Normtexte nicht ([[Vorgehen-SP-2]] §Normtexte) |
| `tools/` | `normen-holen.py` (holt Bundesgesetze aus dem amtlichen XML, wandelt ohne Sprachmodell in Markdown mit Ankern, schreibt `manifest.tsv` und Hinweise; ein Lauf legt einen neuen Stand an, ein bestehender ist eingefroren), `wegweiser-quellen.py` (`--pruefen`: prüft die Links der Wegweiser), `frist-rechnen.py` (Fristende mit Wochentag aus Ereignisdatum und Fristangabe, Verschiebung bei Wochenende und bundeseinheitlichem Feiertag, `--heute`; Landesfeiertage je Projekt als Datei über `--feiertage`), `normen-liste.tsv` (Liste der Gesetze des Pakets), `README.md` | in das Projekt-`tools/` mit Eintrag in `Tools.md` (Kategorie „Projekt-Skripte“, je Skript ein Eintrag; Zweck: Holen auf Zuruf als Projekt-REC, Nachladen von Bundesrecht außerhalb des Pakets, Link-Prüfung, Datum und Wochentag maschinell) |

Der Unterordner `pruefungen/` des Prozess-Ordners trägt
die Prüf-Definitionen der SP-2-Wächter für das
gemeinsame Prüfprogramm ([[Kettenpruefung]]
§Lint-Anteil); er bleibt in der Template-Quelle und
wird nicht kopiert. Die Freigabe-Buchung mitgebrachter
Ordner (MasterPrompt §1.1) entfällt, weil keine neuen
Root-Ordner entstehen.

## Mitgebrachte Präfixe

_(Führender Deklarations-Ort — beim Prozess-Merge
liest der Agent diese Sektion und verbucht die aktiven
Prozess-Präfixe in [[Aktivierter-Prozess]], Wiki.md
§11.3 Schritt 6.)_

SP-2 bringt zu den Basis-Präfixen (MasterPrompt §6.2)
nur die mit SP-1 gleichlautenden Präfixe dazu:

- `Freigabe:` — Buchung eines zweck-gebundenen
  Freigabe-Eintrags (`Vorgehen.md` §4)
- `devstate:` — Aktualisierung `devstate_active.md`

Änderungen an den Fassaden und Detail-Knoten des
Verfahrens laufen unter dem Basis-Präfix `Wiki:`,
Schriftsätze und Stände unter `Output:`, Eingänge
unter `Ingest:`. Die Commit-Sprache folgt der
Aktensprache (`index.md` §4.8).

## Mitgebrachte Mechanik

_(Führender Deklarations-Ort — beim Prozess-Merge
liest der Agent diese Sektion und führt die
Einführungs-Anweisungen je Knoten aus, Wiki.md §11.3
Schritt 7. Ein Merge ohne diese Schritte ist ein
Befund, kein Erfolg.)_

SP-2 bringt folgende `internal-*`-Knoten mit (Ablage im
SP-2-Teil-Wiki
`referenzprozesse/SP-2-Recht-und-Verwaltung/wiki/`, beim
Merge ins Anwender-`wiki/` kopiert):

| Knoten | Typ | Zweck |
|---|---|---|
| [[devstate-SP-2]] | `internal-pattern` | Füllung von `devstate_active.md` unter SP-2 (die Datei selbst kommt als Rumpf mit der Basis): Verfahren mit Stelle, Aktenzeichen und Stufe, laufende Marke, offene Fristen mit dem nächsten Wecker, nächste Züge, offene Fragen |

Der T2-Trigger und die Prüf-Tabelle der SP-2-Wächter
stehen in [[Vorgehen-SP-2]] §Wächter (kein eigener
Mechanik-Knoten); die Wegweiser sind eine Fassade
(oben), keine Mechanik.

**Einführungs-Anweisungen (beim Merge):**

1. **Eintragung:** Aufnahme in die
   Anwender-[[InterneMechanik]] als Register-Eintrag
   in der Typ-Sektion (Wikilink + Kurzform) mit
   Herkunfts-Zusatz „(Prozess-mitgebracht, SP-2)“.
2. **Neuverdrahtung:** der Rumpf `devstate_active.md`
   und die devstate-Zeile der Fassade [[Zielmarken]]
   kommen aus der Basis ([[Standarddateien-Katalog]]
   §2.15) und werden nicht neu verdrahtet; SP-2
   ergänzt die Füllung und den Abschnitt „Verfahren“
   ([[devstate-SP-2]]).
3. **Kollisions-Regel:** existiert im Anwender-`wiki/`
   ein gleichnamiger oder funktions-gleicher
   `internal-*`-Knoten, legt der Agent die Kollision
   vor dem Kopieren vor (Ablösung per Vermerk /
   Umbenennung / Verzicht auf den mitgebrachten
   Knoten; Wiki.md §5.2a sinngemäß).
4. **Rückbau bei Prozess-Deaktivierung:** den Knoten
   auf `active: false` setzen (nicht löschen), den
   Eintrag in [[InterneMechanik]] als deaktiviert
   markieren; Buchung in [[Aktivierter-Prozess]].

## Mitgebrachte Begriffe

_(Führender Deklarations-Ort — beim Prozess-Merge
übernimmt der Agent die Einträge des Glossar-Anhangs
in `wiki/Glossar.md` des Projekts, Wiki.md §11.3
Schritt 2, „Glossar-Anhang“.)_

SP-2 bringt den Glossar-Anhang `Glossar-Anhang-SP-2.md`
(`wiki/` des Prozess-Ordners) mit — die Begriffe des
Verfahrens, die die Basis nicht selbst benutzt, von
„Akten-Führungsplan“ bis „Zugang“, darunter „Fassung“
(die getaggte Version eines Schriftsatzes). Der Anhang
gilt auch für die Referenzprozesse, die auf SP-2
aufbauen. Die Einträge gelten als freigegeben mit dem
Template-Stand; der Anhang selbst wird nicht ins Projekt
kopiert. Ein vorhandener Eintrag gleichen Namens wird
nicht überschrieben, sondern dem Anwender vorgelegt.

**Was ich kann:**

- Ein Verfahren als Projekt führen: je Marke ein
  Schriftsatz, eine Erklärung im Termin oder eine
  Briefwelle als Produkt mit Tag, davor die Kette der
  Pflicht-Stände mit juristischen Namen
  ([[Vorgehen-SP-2]] §2), danach Einreichung je
  Empfänger mit Nachweis und Zugang.
- Den Posteingang als Register führen, jedes
  Eingangsdokument beim Einlesen auf Fristen,
  Eventualpläne und — bei Entscheidungen — nach dem
  Prüfraster der Ordnung prüfen ([[Vorgehen-SP-2]]
  §Posteingang, §Prüfen).
- „Immer ein Wecker“: jeder aktive Fall hat mindestens
  eine offene Frist ([[Vorgehen-SP-2]] §Fristen).
- Jedes ausgehende Dokument vor dem Versand prüfen,
  Strategisches zusätzlich aus der Gegenperspektive
  ([[Vorgehen-SP-2]] §Prüfen); jedes Begehren an uns
  nach dem Raster prüfen ([[Wegweiser-Pruefraster]]).
- Den Wächter der Basis um den T2-Trigger und die
  SP-2-Prüfungen mit Codes `SP2-…` ergänzen
  ([[Vorgehen-SP-2]] §Wächter) — er meldet; Tag und
  Versandstand sperren nur die FEHLER-Zeilen.
- Eskalation über Ausbaustufen im selben Projekt,
  Stränge nach der Entscheidungsmatrix, Join des
  anderen Referenzprozesses ([[Marken-SP-2]],
  [[Zuschnitt-aendern]]).
- Normtexte als eingefrorene Rechercheartefakte je
  Paket-Stand mit Wegweisern je Verfahrensordnung
  ([[Vorgehen-SP-2]] §Normtexte).

**Was ich mitbringe:**

- **Fassaden** für Verfahren, Beteiligte, Strategie,
  Sachverhalt, Argumente, Schriftsätze, Anlagen,
  Einreichungen, Kosten, Beweisangebote, Serien,
  Forderungskonto, Flurstücke und Wegweiser —
  Deklaration oben, §„Mitgebrachte Fassaden“.
- **Typen:** Entity `flurstueck` (kein
  `extends: place`); Relations `authority`
  (Organisation ↔ Zuständigkeit) und `evidence`
  (Beweismittel als Relation: `source:` Pflicht —
  beliebiger Wikilink auf das Beweismittel-Element,
  `target:` optional — die belegte Aussage, sonst im
  `source` enthalten; Beweisthema, Beweisart und
  Bewertung führen die Fassaden Sachverhalt, Anlagen
  und Beweisangebote); das Basis-`thing` bleibt und
  wird erst über `evidence` zum Beweismittel; dazu
  `case` (Verfahren) und `argument` (Argument, in SP-2
  Element) — ihre Katalog-Einträge liegen hier
  ([[Katalog-Verfahren]], [[Katalog-Argumente]],
  [[Katalog-Beweisangebote]]) — sowie die Typen der
  übrigen Fassaden (`party`, `strategy`, `contingency`,
  `assertion`, `submission`, `exhibit`, `filing`,
  `cost-item`, `series-unit`, `receivable`, `guide`).
- **Dokumenttyp-Einträge** der Kette — die Liste steht
  in §„Pflicht ab“ und in [[Vorgehen-SP-2]] §2.
- **Ordner-Inhalte, Präfixe, Mechanik** — Deklarationen
  oben.
- **Entscheidungsarten** `verfahren` und `strang` sowie
  den Stufenwechsel als SP-2-Präzisierung in
  [[Katalog-Entscheidungen]]; den Pflichtteil „Rolle und
  Interessen“ als SP-2-Präzisierung in
  [[Katalog-Mission-Statement]].

**Zur Abgrenzung:** `Entscheidungen.md`, `Zielmarken.md`,
`Fristen.md`, `Eingangsdokumente.md` und
`Rechercheartefakte.md` sind Basis-Fassaden; SP-2 macht
sie Pflicht und schärft sie, bringt sie aber nicht mit.
Die Styleguide-Teile zu Behörden-Anrede,
Rechtsverweis-Notation und Steuer-Abkürzungen bleiben in
der Basis.

## Referenzprozesse und Join

Auf SP-2 bauen zwei Referenzprozesse auf, beide
`extends: [SP-2]`; RP-21 erbt nicht von RP-20:

| Referenzprozess | Zuschnitt | Join-Partner |
|---|---|---|
| **RP-20 Rechtsfall** | Verfahren vor Gerichten aller Gerichtsbarkeiten (Finanzgerichtsbarkeit über RP-21) in jeder Rolle und über alle Instanzen; Verwaltungs- und Widerspruchsverfahren, Antrag und Mitwirkung außerhalb des Abgabenrechts; außergerichtlicher Streit mit Schlichtung, Güteverfahren, Mediation und Schiedsverfahren; Zwangsvollstreckung und Vollstreckungsabwehr; Bußgeld und Strafbefehl als Betroffener; Forderungsanmeldung in der Insolvenz | RP-21 |
| **RP-21 Steuer- und Abgabenfall** | Steuern und Abgaben — von der Mitwirkung ohne Streit (Stufe 1) über Einspruchs- bzw. Widerspruchsverfahren (Stufe 2) bis zum Finanz- bzw. Verwaltungsgericht durch alle Instanzen (Stufe 3), einschließlich Abgabenvollstreckung; in jeder Rolle einschließlich der abgabenerhebenden Stelle, auch als Massenverfahren | RP-20 |

**Keine feste Abgrenzung:** Das Verfahren beginnt in dem
Referenzprozess, in dem es beginnt. Zeigt sich der
Bedarf des anderen — im laufenden Projekt oder schon
beim Init —, bietet der Agent ihn als **Join** an
([[Zuschnitt-aendern]] §Join; [[Init-Choreografie]]
§Join): Merge des zweiten Prozess-Teil-Wikis, nur die
neuen Start-Fragen, bei Widerspruch gilt der zuerst
aktive Prozess, das Upgrade zieht beide. Wie der Agent
beim Init den Referenzprozess vorschlägt: `index.md`
§4.6, Frage 2. Weitere Verwaltungs-Vorgangsarten können
als RP-2x folgen.

**Setzt voraus:** nur die Basis (Template
out-of-the-box).

**Volle Definition:** [[index]] (Architektur, Init-Fragen
und Verhältnis zur Basis) · Vorgehen: [[Vorgehen-SP-2]]
(Phasentabelle, Fristen, Prüfen, Wächter,
Vertraulichkeit, Normtexte) · Marken: [[Marken-SP-2]]
(typische Marke, Ereignis-Marken, Termin, Nachlauf,
Stränge) · Mechanik-Knoten: [[devstate-SP-2]]
(Deklaration: §„Mitgebrachte Mechanik“ oben)
