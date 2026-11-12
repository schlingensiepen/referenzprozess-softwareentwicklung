---
type: process-procedure
process: SP-2
extends: []
---

# SP-2 — Vorgehen

**Bearbeitungsstand:** 2026-11-11 (Ausarbeitung:
Phasentabelle, Fristen, Prüfen, Stränge, Versand,
Posteingang, Wächter-Tabelle, Vertraulichkeit,
Normtexte, Nachlauf, Rückzug, Abspaltung und Mandat,
Rolle und Interessen)

## 1. Erbschaft

SP-2 übernimmt den Basis-Vorgehensrahmen unverändert
(Phasen-als-Angebot-Grundhaltung, Ergebnis-Artefakt-
Regel, Zweck-Freigaben, Wächter-Trigger T4,
Rekursions-Muster). Regel-Details siehe `Vorgehen.md`
§1–§7.

SP-2 belegt die fünfzehn generischen Basis-Phasen mit
**juristischen Tätigkeitsnamen** und Pflicht-Ständen je
Ausbaustufe. Kein Weglassen, kein Hinzufügen von Phasen
— die Nummern sind die der Basis, das Prüfprogramm
liest die Nummer (`Vorgehen.md` §3); die Namen dieser
Datei trägt die Freigabe-Formel („Stand
`klageerwiderung-1.0` von Schriftsatz, freigegeben für
P10 Prüfen vor Versand“, `Vorgehen.md` §4). Ein
Referenzprozess auf SP-2 darf eine Phase umbenennen,
die Nummern bleiben. **Phasen ordnen Freigaben, nicht
Arbeit:** ein Element jedes Registers darf jederzeit
entstehen, nur die Pflicht-Stände werden in Phasenfolge
freigegeben ([[Kettenpruefung]] §Kette).

## 2. Phasen mit SP-2-Artefakten

| # | Phase | Pflicht-Stand (Dokumenttyp) | Zweck der Freigabe | Grad | Pflicht ab Stufe | Vorbedingungen |
|---|---|---|---|---|---|---|
| P1 | Lage erfassen und Strategie setzen | Strategie-Stand ([[Katalog-Strategie-Stand]]) aus [[Strategie]] (`STR`, `EVP`) und [[Verfahren]] | „für P4 Argumentation aufbauen“; zugleich Pflicht-Eingabe jedes Prüfauftrags vor Tag und Versandstand | wiki-verweisend; `vertraulich: streng-intern` als Standard | 2 | Prüfbericht der Gegenperspektive ohne offenen Befund (§4); **Freigabe nur durch den Anwender** |
| P2 | Rechtslage recherchieren | Bericht, kein Stand (wie SP-1 P2); Rechercheartefakte, Normen-Paket, Wegweiser der Ordnung | — | — | — | Regel „Primärquelle vor Zitat“ (§4) |
| P3 | Sachverhalt sammeln | Sachverhalts-Stand ([[Katalog-Sachverhalt-Stand]]) aus [[Sachverhalt]] (`TAT`), Belegen über `evidence`, [[Anlagen]], [[Eingangsdokumente]], [[Chronologie]] | „für P4 Argumentation aufbauen“ — die Argumentation darf die Tatsachen als belegt nehmen | wiki-verweisend | 2 | jede fremde Tatsachenbehauptung mit Stellung (§4) |
| P4 | Argumentation aufbauen | Argumentations-Stand ([[Katalog-Argumentation-Stand]]) aus [[Argumente]] (`ARG`, nur angenommene mit Pflicht-Gegeneinwand) | „für P8/P9“ | wiki-verweisend | 2 | Strategie- und Sachverhalts-Stand freigegeben |
| P5 | Verfahren schneiden | Verfahrens-Stand ([[Katalog-Verfahrens-Stand]]) aus [[Verfahren]] und den Strang-Entscheidungen; darf dünn sein | „für P6/P7“ | wiki-verweisend | 1 | Pflicht-Prüfpunkte „Gilt ein Fachgesetz mit eigener Frist?“ (dann Projekt-REC nachladen, §10) und „Auslandsbezug?“ (bei Ja Wegweiser Auslands- und EU-Bezug laden, Abspalten prüfen); Gegenperspektive ohne offenen Befund |
| P6 | Strang starten / Mandat erteilen | **kein Dokumenttyp** — freigegeben wird die Auftragsliste als Entscheidung (§13); nur bei Abspaltung oder Mandat, sonst abgeleitet entfallen | „für den Start des Strangs bzw. der Vertretung“ | — | — | Gegenperspektive ohne offenen Befund; Rückfrage-Pflicht ([[Zuschnitt-aendern]]) |
| P7 | Rechtsbehelf, Verteidigung und Weg wählen | Verfahrens-Entscheidungen ([[Katalog-Verfahrens-Entscheidungen]]) aus den DEC mit `decision_type: verfahren` (Rechtsbehelf, Gericht bzw. Stelle, Vertretung, Kanal) in [[Entscheidungen]] | „für P8 Schriftsatz gliedern“ | wiki-verweisend | 1 dünn mit **Pflichtabschnitt Begleitanträge**, voll ab 2 | Gegenperspektive ohne offenen Befund; Begleitanträge erwogen (§4) |
| P8 | Schriftsatz gliedern | Gliederungs-Stand ([[Katalog-Gliederung-Stand]]); bei einer Serie mit Manifest je Einheit ([[Serien]]) | „für P9 Schriftsatz ausformulieren“ | wiki-verweisend | 1 (Verzicht bei kurzen Schreiben üblich) | — |
| P9 | Schriftsatz ausformulieren | **Produkt: der Schriftsatz** ([[Katalog-Schriftsatz]]) als Versionskette in `output/`; bei der Termin-Marke die Termin-Vorbereitung ([[Katalog-Termin-Vorbereitung]]); Glied der Kette ist der **Tag** auf der freigegebenen Fassung | Tag „für P10 Prüfen vor Versand“ (Freigabe per Tag, `Vorgehen.md` §4) | selbsttragend (geht nach außen) | 1, nicht verzichtbar | **inhaltliche Prüfrunden** vor dem Tag (§4) — wie Unit- und Integrationstests in einem Entwicklungsprozess; kein `temp-` im Text, Verzeichnis oder Paket; endgültige Anlagennummern |
| P10 | Prüfen vor Versand | Prüfplan ([[Katalog-Pruefplan]]) mit Prüfbericht (`review-report`, [[Katalog-review-report]]): **Versandprüfung des eingefrorenen Pakets** nach dem Tag (Formalia, Anlagen, Kanal, Vertraulichkeit, Paketprüfung) | „für P13 Einreichen“ | wiki-verweisend | 1 | Tag gesetzt; ein inhaltlicher Fehler in P10 führt zu einer neuen Fassung mit neuem Tag |
| P11 | Übergabe-Dossier schreiben | Dossier-Stand ([[Katalog-Dossier-Stand]]) — für Vertretung oder Nachfolger | „für P13 Einreichen“ | selbsttragend | 2, nach Doku-Abfrage | Strategie-Abschnitt: Gegenperspektive ohne offenen Befund; Vertraulichkeit gegen den Empfänger |
| P12 | Betroffene unterrichten | Erläuterungs-Stand ([[Katalog-Erlaeuterung-Stand]]) — für Personen ohne Wiki-Zugang | „für P13 Einreichen“ | selbsttragend | 1, nach Doku-Abfrage | Strategie-Abschnitt: Gegenperspektive ohne offenen Befund; Vertraulichkeit gegen den Empfänger |
| P13 | Einreichen | Einreichungs-Stand je Empfänger ([[Katalog-Einreichung-Stand]]) aus [[Einreichungen]] (`filing`), dem Versandstand-Ordner (`Outgoing.md`) und dem Anlagenverzeichnis des Schriftsatzes | „für den Marken-Abschluss“ | wiki-verweisend | 1 | Prüfplan mit Prüfbericht freigegeben; Paketprüfung bestanden; `review` gefüllt; Nachweis und Zugang gebucht (§6) |
| P14 | Serie fertigen | Serien-Stand ([[Katalog-Serien-Stand]]) aus [[Serien]] (`series-unit`), nur bei einer Serie | „für P13 Einreichen“ | wiki-verweisend | 1 (nur Serie) | Manifest je Einheit; Freigabevermerk je Einheit |
| P15 | Verfahren führen | Akten-Führungsplan je Stelle bzw. Verfahren ([[Katalog-Akten-Fuehrungsplan]]): Abrufturnus je Kanal mit Bereitstellung zum Abruf ab der Stufe, in der er eröffnet ist; Fristenblick; Wiedervorlagen | „für den Betrieb des Verfahrens“ | selbsttragend | 1, nach Doku-Abfrage | Einreichungs-Stand freigegeben |
| — | Termin auswerten (nur Termin-Marke) | Termin-Ergebnis ([[Katalog-Termin-Ergebnis]]): Termins- bzw. Vertretungsbericht, Protokoll geprüft, Vergleich, Beschlüsse, Fristen und Erwartungen aus dem Termin, Abgleich mit Strategie und Eventualplänen — **Glied ohne Phasennummer** nach P13 | „für den Marken-Abschluss“ | selbsttragend | 1 (nur Termin-Marke), **nicht verzichtbar** | Protokoll als Eingangsdokument eingelesen |
| — | Marken-Abschluss | Abschluss-Stand (Basis, [[Katalog-Abschluss-Stand]]) **oder Entfall-Vermerk** (`entfallen`, [[Zielmarken]] §Meta) | Marken-Wechsel | — | — | — |
| — | Ablauf je Stand | vom ersten `offen`en Element über Lese-Klammer, Bildung, Prüfung, Vorlage und Korrektur bis zur Freigabe: [[Lebenslauf-eines-Stands]] | | | | |

Zweck, Filter und Auslöser jedes Stands stehen in
seinem Dokumenttyp-Eintrag (verlinkt in der Tabelle);
die Namen dieser Tabelle — Dokumenttyp und Tätigkeit —
trägt die Freigabe-Formel (`Vorgehen.md` §4); die
Ordnung der Freigaben steht in [[Kettenpruefung]]
(dort auch das Beispiel eines Verfahrens).

**Pflicht ab Stufe.** Die Spalte „Pflicht ab Stufe“ gilt
gegen die Zeile `Ausbaustufe` in
[[Aktivierter-Prozess]] (`Steckbrief.md` §Pflicht ab).
Unterhalb der Stufe entfallen die Glieder **abgeleitet**
— keine Verzichts-Entscheidung nötig ([[Kettenpruefung]]
§Fehlende und vertretene Glieder); jeder Katalog-Eintrag
trägt die Zeile „Entfällt abgeleitet, wenn“. Steigt die
Stufe, werden die neuen Pflicht-Stände in der nächsten
Marke gebildet; laufende Marken schließen nach der
Kette ihrer Stufe ab.

**Doku-Abfrage.** Sobald der Tag gesetzt ist, legt der
Agent einmal je Marke die Doku-Abfrage vor
([[Kettenpruefung]] §Kette, Doku-Glieder) mit den
Zeilen P11 Dossier, P12 Erläuterung und P15
Akten-Führungsplan **je Stelle**: die Stelle
(Organisation mit `authority` und geprüftem Versandweg)
**vertritt die Zielumgebung**. Je Zeile Zeitpunkt
(jetzt / später / gar nicht) und Form, mit Empfehlung;
der Verständnis-Check M6 (`Reviewmuster.md`) gilt für
P11, P12 und P15. Bei den meisten Schriftsatz-Marken
entfallen P11 und P12; P15 entsteht einmal je Stelle
und wird in Folge-Marken als Folge-Version fortgeführt.

**Fassungs-Freigabe ≠ Versand-Freigabe.** Der Tag (P9)
gibt die **Fassung** frei; das Paket wird erst danach
gebaut (Anlagenverzeichnis → `attachments`,
Versandstand-Ordner) und in P13 freigegeben. Versendet
wird immer durch einen Menschen; der Agent prüft
Sendebericht bzw. Eingangsbestätigung gegen das Paket
und bucht Nachweis und Zugang (§6). Ein Prüfbefund
gegen die Sperrliste oder eine gebuchte Linie ist ein
Vorschlag an den Anwender, kein Änderungsauftrag.

**Folge-Version und Folge-Marken.** Prüfplan,
Einreichungs-Stand und Akten-Führungsplan hängen am Tag
und werden in einer Folge-Marke mit neuem Tag als
**Folge-Version** derselben Ketten-ID gebildet
([[Einfrieren-und-Abloesen]] §Stand); ein weiterer
Empfänger desselben Schriftsatzes ist ein **Nachtrag**
am Marken-Eintrag ([[Zielmarken]] §Meta). In einer
Folge-Marke (Replik, Berufungsbegründung, Einspruch
gegen den nächsten Bescheid) gelten Strategie-,
Sachverhalts- und Verfahrens-Stand meist als
**übernommene Stände**; neu gebildet werden
Argumentation (als Delta), Gliederung, Schriftsatz,
Prüfung und Einreichung. Ändert sich die Lage
(Strategiewechsel, neue Tatsachen), ist der übernommene
Stand überholt und wird mit eigener Freigabe neu
gebildet (`Vorgehen.md` §4 „Änderung nach der
Freigabe“).

**Kleine Fälle** (Stufe 1, ein Schreiben): die Kette
besteht aus P5 (dünn), P7 (dünn, Begleitanträge), P9
(Tag), P10, P13, P15 und dem Marken-Abschluss; P1–P4
entfallen abgeleitet (Stufe 1), P8, P11 und P12 per
Verzicht bzw. Doku-Abfrage. Eine Datei zum
Wiederaufnehmen (`devstate_active.md`,
[[devstate-SP-2]]) ist Pflicht.

**Anmerkung P9:** das Produkt der Marke ist der
Schriftsatz, die Erklärung im Termin
(Termin-Vorbereitung) oder die Briefwelle (Serie); das
Glied ist in jeder Domäne der Tag auf dem Produkt
([[Kettenpruefung]] §Kette). Die Tag-Freigabe nennt
den Dokumenttyp dieser Phasentabelle: „Stand
<Tag-Name> von Schriftsatz, freigegeben für P10
Prüfen vor Versand zu Marke M“ (bei der Termin-Marke
„von Termin-Vorbereitung“); „Implementierung“ ist der
SP-1-Fachname desselben Glieds und als Altform
weiter gültig (`Vorgehen.md` §4 „Freigabe per Tag“).
Ein Verzicht auf P9 ist nicht
möglich, solange die Marke ein Produkt nach außen hat;
die einzige Marke ohne Produkt ist der Nachlauf, wenn
nichts nach außen geht ([[Marken-SP-2]] §8).

**Anmerkung P6:** siehe §13. Die Start-Tabelle vor dem
Start einer Teilaktivität (`Vorgehen.md` §3) gilt für
Abspaltung und Mandat.

## 3. Fristen

Die Fassade [[Fristen]] ist in SP-2 Pflicht ab Stufe 1
und führt. Jede Frist trägt neben `richtung` die Felder
`entstehung`, `wirkung` (mit `verlaengerbar` und
`wiedereinsetzung`) und `zeitbudget` — Wertelisten,
Bezeichnungen, Entstehen beim Einlesen, maschinelle
Berechnung, unbestimmte und materielle Fristen:
**[[Katalog-Fristen]], SP-2-Präzisierung** (führender
Ort der Felder; lesen, bevor die erste Frist angelegt
wird). Die Berechnungsregeln je Ordnung,
Bekanntgabe-Fiktion und Abrufpflicht stehen in den
Wegweisern und den Fristenkatalogen der
Referenzprozesse. Dieser Abschnitt ist der führende Ort
dafür, was der Agent mit einer Frist **tut**: Wecker,
Eskalation vor und nach dem Ablauf, Fristwahrung und
die fristwahrenden Optionen.

**Immer ein Wecker.** Jeder aktive Fall — ein `case`
mit Status ungleich `abgeschlossen` und nicht ruhend
auf Anwender-Wort — hat in jeder Ausbaustufe
**mindestens eine offene Frist**: gleich welcher
Entstehung, auch eine Erwartung oder eine selbst
gesetzte Wiedervorlage. Der Wächter meldet einen
aktiven Fall ohne offene Frist als „Kein Wecker
gestellt“ (HINWEIS, §8). Erledigt der Agent die letzte
offene Frist eines Falls, fragt er **im selben Zug**
nach der nächsten; gibt es keinen fachlichen Anlass,
schlägt er die Wiedervorlage „Sachstand prüfen“ vor
(Standard vier Wochen, änderbar).

_Warum so:_ Ein Fall ohne laufende Frist fällt aus dem
Blick. Der häufigste Stillstand in Verfahren ist nicht
die versäumte Frist, sondern die Zeit dazwischen —
Monate ohne Reaktion, Anträge ohne Antwort. Was dann
droht, ist nicht nur Verzögerung, sondern
Rechtsverlust: Ablauf von Fristen, die niemand mehr im
Blick hat, Verjährung, verlorene Beweislage.

**Ruhend auf Anwender-Wort.** Ein Verfahren, das ohne
Anwender-Entscheidung ruht, ausgesetzt oder
unterbrochen ist, **bleibt mit Wecker** — die Fristen
bleiben unter Wache, die Marke ruht mit Wiedervorlage
(§5). „Ruhend auf Anwender-Wort“ ist der Status
`ruhend` am `case` **mit** dem Kann-Feld `ruht_auf:`
(Verweis auf die Entscheidung, in der der Anwender das
Ruhen festgelegt hat);
ohne dieses Feld gilt die Wecker-Pflicht, und der
Wächter meldet. Kein eigener Statuswert.

**Erwartung je Einreichung.** Jede Einreichung legt
automatisch eine Erwartung an (Frist mit
`richtung: für-uns`, `entstehung: erwartung`) mit einem
Standard je Stelle aus dem geprüften Versandweg, vom
Anwender änderbar; der Eingang setzt sie auf
`erfuellt` (`erfuellt_durch`); bei Ablauf schlägt der
Agent Sachstandsanfrage oder Erinnerung vor, als
Eventualplan oder neue Marke. Der häufigste Wecker ist
damit „Wir erwarten Rückmeldung vom Gericht“.

**Eskalation, Ablauf und Fristwahrung.** Bei der
Wirkung „Rechtsverlust bei Versäumung, nicht
verlängerbar“ (in der ZPO die Notfrist, sonst etwa die
gesetzliche Ausschlussfrist eines Rechtsbehelfs)
eskaliert der Wächter **gestuft vor dem Ablauf** — an
der Wirkung, nicht am Wort (`SP2-FRIST-RV`, §8; die
Eskalation ist Meldung, keine Sperre). Nach dem Ablauf
meldet der Wächter die offene Marke, und der Agent legt
dem Anwender einen der drei Wege vor: **Heilung** —
Wiedereinsetzung, wo die Wirkung sie zulässt, als
Eventualplan schon vor dem Ablauf angelegt; **Entfall**
der Marke ([[Marken-SP-2]] §6); oder einen **neuen
Angriff gegen die bestands- bzw. rechtskräftige
Entscheidung** — Wiederaufgreifen des Verfahrens,
Überprüfungsantrag, Änderung von Steuerbescheiden,
Anregung der Rücknahme von Amts wegen, Nichtigkeits-
und Restitutionsklage, Abänderung; jeder dieser Wege
ist eine neue Marke mit eigenen Fristen aus dem
Wegweiser der Ordnung. Bei einer Frist
`richtung: für-uns` gibt der Wächter vor dem Ablauf nur
einen Hinweis und legt zum Ablauf eine **Wiedervorlage
mit den möglichen Schritten** an: Untätigkeitsklage,
Einrede, Vollstreckung, Fiktion bescheinigen lassen,
Rechtskraftzeugnis. Ist eine Frist „für uns“
Voraussetzung einer Frist „gegen uns“ (etwa der
Eingang der Entscheidung für die Begründungsfrist),
legt der Agent die **Folgefrist** an, sobald die erste
erfüllt ist.

**Zeitbudget und Fristwahrung als generelle
Anweisung.** Der Wächter prüft das `zeitbudget` jeder
Frist unabhängig vom Grund der Verzögerung — offene
Prüfrunde, ausstehendes Dokument, ausstehende Antwort
eines Dritten, fehlende Unterlagen, Abstimmung mit der
Vertretung —, nicht nur beim Review (`SP2-ZEITBUDGET`,
§8). Ist das Budget erreicht, legt der Agent dem
Anwender **sofort** die fristwahrenden Optionen je
Frist-Wirkung vor und nennt nur die zulässigen.
Grundbestand der Optionen (offene Liste):
- fristwahrend einreichen mit dem Verifizierten und
  „Begründung folgt“;
- Fristverlängerung beantragen, wo die Wirkung
  „verlängerbar“ trägt;
- fristwahrende Handlung ohne Begründung (etwa
  Rechtsbehelf einlegen, Antrag stellen);
- Rückfrage beim Dritten bzw. Erinnerung, wenn die
  Handlung an einem ausstehenden Eingang hängt;
- Notfall-Freigabe durch den Anwender — nur nach
  durchgeführter Prüfung, die nicht konvergiert ist
  (§4; einen Verzicht auf die Prüfung gibt es nicht);
- bewusstes Verstreichen-Lassen, gebucht als
  Entscheidung mit Grund.

Die Runden-Obergrenze der Prüfungen ist an das
Zeitbudget gebunden (§4). **Der Agent handelt nie
selbst nach außen, weil die Frist drängt.** Vor jedem
Versand läuft der Fristen-Blick.

**Frist und Marke sind zwei Dinge** (§5): die Frist
hat Verfall, die Marke nicht von selbst.

## 4. Prüfen

**Jedes ausgehende Dokument** wird vor dem Versand
inhaltlich geprüft — nicht nur der Marken-Schriftsatz,
auch Begleitschreiben, Nachrichten, kurze Anträge. Beim
**Marken-Schriftsatz** sind die Prüfrunden
**Vorbedingung des Tags** (P9); P10 prüft danach das
eingefrorene Paket (Formalia, Anlagen, Kanal,
Vertraulichkeit, Paketprüfung); ein inhaltlicher Fehler
in P10 führt zu einer neuen Fassung mit neuem Tag. Bei
**jedem anderen ausgehenden Dokument** ist die Prüfung
Vorbedingung des Versandstands; das Ergebnis steht im
Pflichtfeld `review` des Versandstands (`Outgoing.md`
§3.2); ohne Eintrag kein Versandstand (FEHLER, §8).
**Kein Verzicht auf die Prüfung:** Der Basis-Satz
„ohne Review versenden“ (`Outgoing.md` §6 Schritt 3)
gilt in SP-2 nicht; `review: verzichtet` zählt nicht
als Eintrag und sperrt den Versandstand wie das leere
Feld. Drängt die Frist, greifen die fristwahrenden
Optionen (§3), nicht der Verzicht.
Mechanik der Prüfung (Schleifen, Zwei-Modelle-Regel,
Muster, Reife): `Reviewmuster.md` §2–§4 und die
SP-2-Erweiterung in §6 dort; Beauftragung nach
[[Angebots-und-Beauftragungs-Muster]]; Ergebnis als
`review-report` in [[Agent-Berichte]].

**Pflicht-Eingaben jedes Prüfauftrags:** der
Strategie-Stand mit Sperrliste und gebuchten Linien (ab
Stufe 2), der Sachverhalts-Stand, die Rolle des
Anwenders und die bekannten Positionen der Gegenseite.
Ein Befund gegen Sperrliste oder gebuchte Linie ist ein
Vorschlag an den Anwender, kein Änderungsauftrag.

**Perspektiven** (Vorschlag des Agenten, Voreinstellung
je Rolle, §14):

- **Gegenseite und andere Beteiligte** — was sie aus
  dem Dokument machen; bei mehreren Gegenübern je
  Gegenüber.
- **Entscheidende oder vermittelnde Stelle** (Richter,
  Sachbearbeiter, Widerspruchsbehörde, Schlichter,
  Mediator, Schiedsgericht) — sie liest nur das
  zustellbare Paket.
- **Öffentliche Stelle gegen ihre eigenen Pflichten**
  (Amtsermittlung, Anhörung, Ermessen, Begründung,
  Bestimmtheit, Rechtsbehelfsbelehrung, Bindung an
  Verwaltungsvorschriften, Zuständigkeit; was die
  Stelle mit dem Dokument tun muss), wenn sie
  entscheidet oder Gegner ist — ist der Anwender die
  Stelle, tritt die Perspektive „Adressat“ an ihre
  Stelle.
- **Faktenabgleich** gegen den Sachverhalt.
- **Vertraulichkeit** gegenüber dem Empfänger (§9).
- **Unwidersprochener Vortrag:** jede fremde
  Tatsachenbehauptung in [[Sachverhalt]] hat eine
  Stellung; vor jedem Schriftsatz listet der Agent die
  offenen — „offen“ ist ein Befund, keine Liste bleibt
  liegen; im Amtsermittlungsverfahren zusätzlich die
  eigenen Mitwirkungspflichten. Die Prüfung gilt für
  den Vortrag aller anderen Beteiligten.

**Umfang nach Gewicht, Untergrenze immer:**
Faktenabgleich und Vertraulichkeit bei jedem Dokument,
unwidersprochener Vortrag bei jedem Schriftsatz ab
Stufe 2; Weglassen begründet der Agent.

**Gegenperspektive bei allem Strategischen.** Leitfrage:
„Was tut die Gegenseite (bzw. die entscheidende Stelle)
als Nächstes, und wo trifft sie uns?“ Pflicht bei jedem
strategischen Stand und jeder strategischen
Entscheidung: Strategie-Stand und jede Änderung von
Ziel, Linie oder Sperrliste; Eventualpläne;
Verfahrens-Schnitt und Strang-Start (P5, P6), auch
Abspaltung und Mandat; Verfahrens-Entscheidungen (P7)
einschließlich Begleitanträge und „Heilung abwarten
oder angreifen“; Vergleich, Rücknahme, Erledigung,
Anerkenntnis, Ruhen; die Strategie-Abschnitte von
Dossier und Erläuterung. **Unabhängig:** ein eigener
Prüfauftrag (eigener Agent oder eigene Runde) mit
Sachverhalt und bekannten Positionen der Gegenseite.
**Sperrliste:** die Perspektive bekommt sie immer,
**befolgt sie aber nicht** — jeder Punkt wird als
möglicher Eintritt bewertet. **Ergebnis:** Befundliste;
jeder Befund wird verworfen (mit Grund), als
Eventualplan aufgenommen oder ändert die Linie; die
Freigabe in P1, P5, P6, P7 und der Strategie-Abschnitte
von P11/P12 setzt voraus, dass **kein Befund offen**
ist.

**Primärquelle vor Zitat.** Jede Fundstelle (Norm,
Urteil, Kommentarstelle) gilt als **unverifiziert**, bis
sie an der Primärquelle geprüft ist — Fundstellen aus
Recherche-Subagenten und Modell-Ausgaben eingeschlossen.
Bundesrecht wird am Normen-REC des verwendeten Stands
geprüft (§10), mit Anker in der Lesefassung;
Landesrecht und Rechtsprechung projektbezogen
nachgeladen; Bundesrecht außerhalb des Pakets als
Projekt-REC. Eine unverifizierte Fundstelle in einem
ausgehenden Dokument ist ein **Befund** in den
Prüfrunden vor Tag bzw. Versandstand; der Agent
kennzeichnet sie **schon im Entwurf** („unverifiziert“),
damit nichts unbemerkt in einen Versandstand wandert.

**Begleitanträge.** Anlass: jede eingehende belastende
Entscheidung **und** jeder eigene verfahrensgestaltende
Schriftsatz (Klageschrift, Antrag, Widerspruch,
Einspruch, Rechtsmittel), auch auf der
Verteidigungsseite (Verteidigungsanzeige,
Klageerwiderung, Widerspruch gegen Mahnbescheid,
Einspruch gegen Versäumnisurteil oder
Vollstreckungsbescheid, Erwiderung im Eilverfahren).
Form: **Pflichtabschnitt im Stand zu P7**
([[Katalog-Verfahrens-Entscheidungen]]), offene Liste,
zu jedem Punkt „erwogen: ja/nein, Begründung“.
Grundbestand: Eilrechtsschutz; Zwischenregelung bzw.
Hängebeschluss; vorsorgliche Kostenanträge;
Akteneinsicht; Ruhen bzw. Aussetzung; PKH; Schutzschrift;
Frist-Rettung (Wiedereinsetzung, Fristverlängerung);
Vollstreckungsschutz und Sicherheitsleistung;
Beteiligung Dritter (Beiladung, Streitverkündung,
Hinzuziehung); Widerklage bzw. Aufrechnung; Rechtsweg
und Zuständigkeit; Gehörs- bzw. Anhörungsrüge;
Ablehnungsgesuch, Verbindung und Trennung,
Anschlussrechtsmittel, Beweissicherung; Geheimnisschutz
im Verfahren; Terminsverlegung; Antrag auf Zulassung
der Berufung; Vollziehung des eigenen Arrests bzw. der
einstweiligen Verfügung nach gewonnenem Eilverfahren;
„entgegenstehende Rechtskraft bzw. Bestandskraft“ als
Verteidigungsmittel. Maßgeblich ist die **Checkliste
„Begleitanträge“ im Wegweiser der jeweiligen Ordnung**;
der Agent ergänzt daraus und aus dem Verfahren; die
Voreinstellung je Rolle setzt die Schwerpunkte. Bei
drohender Vollstreckung legt er einen Eventualplan
„Eilrechtsschutz“ bzw. „Vollstreckungsschutz“ an.

**Eingehende Entscheidungen — Prüfraster je Art**, beim
Einlesen (§7), nach dem Wegweiser der Ordnung:
**Verwaltungsakt und Vorverfahrensentscheidung**
(Auseinandersetzung mit dem Vorbringen? richtiger
Gegenstand? Begründung tragend? Ermessen ausgeübt?
Rechtsbehelfsbelehrung?); **gerichtliche Entscheidung**
(Rechtsmittelbelehrung, Zustellung, Zulassung des
Rechtsmittels, Gehörsverstoß, Berichtigung bzw.
Ergänzung, Anhörungsrüge); **sonstige Entscheidung**
(Bußgeldbescheid, Schiedsspruch, Schlichtungsvorschlag);
**eingehender Schriftsatz oder prozessleitende
Verfügung** (neue Anträge, Klageänderung, Widerklage,
Verspätung rügen, gesetzte Erwiderungsfrist,
Streitverkündung an uns, Beweisbeschluss, Gutachten mit
Einwendungsfrist, Auslagenvorschuss,
Betreibensaufforderung, Hinweis auf Verböserung; jede
fremde Tatsachenbehauptung bekommt eine Stellung);
**eingehender Rechtsbehelf oder Antrag aus Sicht der
Stelle**, wenn der Anwender öffentliche Stelle ist
(Zulässigkeit, Frist und Form, Vertretung, Abhilfe oder
Vorlage, Kostenfolge, Aussetzung der Vollziehung durch
die Stelle). **Heilbares benennen:** jeder Mangel wird
als heilbar oder nicht heilbar eingestuft, mit Norm aus
dem Wegweiser; das Ergebnis geht als **Option in die
Strategie** — etwa „Klage als Weg zu einer ordentlichen
Grundlage, mit Kostenhebel“ oder „Heilung abwarten und
prüfen, dann entscheiden, ob wir dagegen vorgehen“; ob
ein Kostenhebel besteht, hängt vom Kostenregime der
Ordnung ab (Wegweiser Kosten). **Eventualplan bei jeder
Lageänderung durch das Gegenüber** (Nachbesserung der
Begründung, Abhilfe, Anerkenntnis, Erfüllung,
Rücknahme, Änderungsbescheid, Erledigterklärung):
Wirkung auf Frist, Zulässigkeit und Kosten prüfen;
trägt die Änderung, unverzüglich Rücknahme bzw.
Erledigung mit Kostenantrag prüfen (zeitkritisch).

**Prüfung jedes Begehrens.** Immer, wenn jemand etwas
von uns will — Geld, Sachen, Grundstücke, Akten, Daten,
Handlung, Unterlassung, Auskunft —, auf jedem Weg
(Rechnung, Mahnung, Bescheid, Klage, Anmeldung,
Schreiben, Anruf als Vermerk) und in jeder Phase
(Vorgang, Streit, Gericht, Nachlauf), prüft der Agent
nach dem Raster in [[Wegweiser-Pruefraster]]: (a) wer
will was und darf er das — Anspruchsgrundlage oder
Ermächtigung, Berechtigung des Fordernden, Vollmacht
des Vertreters; (b) schon entschieden? — Rechts- oder
Bestandskraft, auch teilweise (§11); (c) erledigt? —
erfüllt, festgesetzt, aufgerechnet, abgewiesen; (d)
steht etwas entgegen? — Verjährung, Ausschlussfrist,
Zurückbehaltung, Fälligkeit; (e) Reaktionsfrist als
Frist `richtung: gegen-uns` mit Entstehung und Wirkung.
Ergebnis: Befund mit Fundstellen und Vorschlag
(leisten, zurückweisen, Einrede, Rechtsbehelf,
Rückfrage); **der Anwender entscheidet; keine Leistung
und keine Zusage ohne Freigabe.** Die Wegweiser der
Ordnungen ergänzen das Raster.

**Runden-Obergrenze und Frist.** Die Runden-Obergrenze
der Review-Kette (`Reviewmuster.md` §2, Schleife 4) ist
in SP-2 zusätzlich an das **Zeitbudget der Frist**
gebunden: Würde die nächste Runde das Budget
überschreiten, geht der Konvergenz-Bericht **sofort**
an den Anwender, auch vor der dritten Runde, mit den
fristwahrenden Optionen (§3). Die Notfall-Freigabe
bleibt Anwender-Entscheidung — sie setzt eine
durchgeführte Prüfung mit Konvergenz-Bericht voraus
(das Feld `review` nennt ihn) und ist kein Verzicht auf
die Prüfung; der Agent versendet nie
von sich aus, weil die Frist drängt.

**Maschinelle Paketprüfung** vor dem Versandstand: §6.

## 5. Stränge und Marken

Typische Marke, Ereignis-Marken, Enden und
Abschlussformen, Zustände, Termin, Nachlauf, formlose
Rechtsbehelfe und die Entscheidungsmatrix der Stränge
stehen in [[Marken-SP-2]] (führender Ort). Für das
Vorgehen gilt:

- **Eine laufende Marke je Projekt.** Eine Eilsache
  (Eilantrag, Schutzschrift) tritt als vorgezogene
  Marke vor die laufende ([[Zielmarken]] §Meta,
  Zwischenmarke); die laufende Marke wird zurückgestellt
  und danach wieder aufgenommen.
- **Neue Stränge** (neues Aktenzeichen, neues
  Gegenüber, neuer Antrag, Rechtsmittel, Konflikt mit
  einem Beteiligten, neue Sache in der Akte) legt der
  Agent dem Anwender mit der Entscheidungsmatrix und
  einem Vorschlag vor (F1 Serie, F2 Bündel, F3 Folge,
  F4 Vorziehen, F5 Abspaltung); der Anwender
  entscheidet; Buchung als DEC mit
  `decision_type: strang` ([[Katalog-Entscheidungen]]
  SP-2-Präzisierung), Eintrag im Register [[Verfahren]]
  (Strang-Form). Die Rückfrage-Pflicht gilt
  ([[Zuschnitt-aendern]]); die Abspaltung läuft nach
  §13.
- **Zustände:** Ruhen, Aussetzung und Unterbrechung
  sind Zustände des Verfahrens (Status am `case`) und
  der Marke (`zurückgestellt` mit Wiedervorlage), nie
  der Frist (§3). Bei der Unterbrechung entstehen die
  Ereignis-Marken „Unterbrechung“ und „Aufnahme“; der
  Wächter verlangt die Neuberechnung der Fristen;
  Rechtsnachfolge ist ein Rollenwechsel mit Prüfung
  (§14).
- **Entfall:** Macht eine Frist oder ein Ereignis die
  Marke gegenstandslos (Frist versäumt, Verfahren
  erledigt, Zahlung), schlägt der Agent den Entfall
  vor; der Anwender entscheidet, die Marke erhält den
  Zustand `entfallen` mit Grund ([[Zielmarken]] §Meta).
- **Status am `case` führt den Abschluss** des
  Verfahrens; die Marke „Nachlauf“ folgt (§11).

## 6. Versand und Einreichung

**Maßgeblich ist der Zugang, nicht die Absendung.** Die
Fassade [[Einreichungen]] (`filing`) ist das Register
über die Versandstand-Ordner (`Outgoing.md` §2): je
Empfänger Fassung (Tag), Kanal, Zeitpunkt, **Nachweis**
(Datei in `nachweis/`), **Zugang** (Datum, Art),
**Prüfsumme** des Pakets, Erwartung (§3). „Eingereicht“
ist nur die Fassung mit Einreichungsnachweis;
Fassungen der Vertretung gehen als Eingangsdokument mit
ihrer Kennung ein, die Schriftsatz-Zeile verknüpft beide
Zählungen.

**Paket aus dem Anlagenverzeichnis.** `attachments` des
Versandstands werden aus dem Abschnitt `## Anlagen` des
Schriftsatz-Knotens gebaut ([[Schriftsaetze]],
[[Anlagen]]). **Maschinelle Paketprüfung** vor dem
Versandstand: Verweis ↔ Eintrag ↔ Datei, nichts
Überzähliges, Prüfsumme je Datei (Feld `pruefsumme`,
`Outgoing.md` §3.2), Inhalt ↔ Bezeichnung, Seitensumme
↔ Kanal (Seiten- und Anlagengrenze der Stelle,
Teil-Sendungen), **kein `temp-`** — ein verbliebenes
`temp-` im getaggten Schriftsatz, Verzeichnis oder
Paket blockiert Tag und Versandstand (FEHLER, §8). Mit
dem Einreichungs-Stand friert das Paket ein; nach der
Einreichung ist eine Anlagennummer unveränderlich.

**Kanäle.** Die Kanal-Liste der Basis (`Outgoing.md`
§3.2) gilt; welche Kanäle das Projekt nutzt, legt der
Anwender beim Init fest (Frage 5). SP-2 gibt den
Kanälen ihre Bedeutung: `muendlich-termin` ist die
Erklärung im Termin, ihr Nachweis das Protokoll
([[Marken-SP-2]] §7); `erklaerung-zu-protokoll` die
Erklärung bei Geschäftsstelle oder Rechtsantragsstelle;
`anwalt-zu-anwalt` die Zustellung von Anwalt zu Anwalt
mit Empfangsbekenntnis; die Justiz-, Steuer- und
Behördenpostfächer (`bea`, `mjp`, `elster`,
`behoerdenportal`, weitere sichere Übermittlungswege)
sind formgerechte Einreichung mit Quittung des Portals
als Nachweis; eingehend ist ein Telefonat oder Gespräch
ein Aktenvermerk (`document_type: vermerk`). Kanäle
ohne Artefakt-Erzeugung laufen manuell; versendet wird
immer durch einen Menschen. **Je Stelle** trägt der
geprüfte Versandweg ([[Organisationen]], `authority`)
Kanal, Nummer, Postfach sowie **Seiten- und
Anlagengrenze**; sonst kommen Anlagen nicht an. Bei
Berufsträgern, Behörden und eröffnetem Zugang besteht
die Pflicht zur Nutzung elektronischer Kanäle
([[Beteiligte]]).

**Nachweis.** Sendebericht, Eingangsbestätigung,
Empfangsbekenntnis, Quittung des Portals gehen in
`nachweis/` des Versandstands (`Outgoing.md` §2, §6
Schritt 6); der Agent prüft sie gegen das Paket und
bucht Zugang und Nachweis in der Einreichung; der
Wächter meldet eine Einreichung ohne Nachweis (§8).

**Vertraulichkeit gegen den Empfänger** ist Prüfpunkt
jedes Versandstands (§9). Der SP-2-Teil von
`Outgoing.md` (§6b dort) fasst zusammen, was der
Versandstand in SP-2 zusätzlich trägt.

## 7. Posteingang

Die Fassade [[Eingangsdokumente]] ist in SP-2 Pflicht
ab Stufe 1 und wird als **Posteingang** geführt
([[Katalog-Eingangsdokumente]] SP-2-Präzisierung): je
Eingangsdokument Zugangsdatum, Zustellart (eingehender
Kanal), ausgelöste Frist / Marke / Eventualplan, Status
`eingelesen`; `document_type: vermerk` für mündliche
Mitteilungen; das Protokoll eines Termins als Nachweis
der Erklärung im Termin.

**Beim Einlesen jedes Eingangs:** Fristen ziehen (§3,
nie aus dem Gedächtnis), Eventualpläne gegen offene
Auslöser prüfen (ein ausgelöster Plan legt die
Ereignis-Marke an), eingehende Entscheidungen nach dem
Prüfraster prüfen (§4), Begehren prüfen (§4), jede
fremde Tatsachenbehauptung mit Stellung in
[[Sachverhalt]] aufnehmen, bei einem neuen Beteiligten
die Rolle prüfen (§14), den Eskalationsanlass erkennen
(Stufe, §8), bei Rechtskraft oder Bestandskraft den
Status am Eingangsdokument mit Tenor und Reichweite
setzen (§11).

**Eingangsorte in drei Schichten** ([[Init-Choreografie]]
§Baustein Eingangsorte): Projektordner immer; weitere
Orte registriert mit Modus und Abrufturnus — ein
elektronisches Gerichts- oder Behördenpostfach ist ab
der Stufe Pflicht, in der es eröffnet ist; vorhandene
Lesewege genutzt. Der Basis-Wächter C9 vergleicht
Eingangsordner und registrierte Orte mit dem Register
(nur Dateivergleich, kein Lesen von Inhalten); die
SP-2-Zeile Posteingang (§8) meldet dasselbe im
Prozess-Kontext, dazu den Abrufturnus.

**Bestehende Akten beim Init zuerst einlesen, laufende
Fristen sofort melden** (`index.md` §4.5, Init-Frage 8).

## 8. Wächter

**T2-Trigger (volle Wächter-Runde C4–C9), analog SP-1:**
Eingang eines Dokuments mit Frist, Freigabe-Buchung,
Marken-Wechsel, Strang-Entscheidung. Die Basis-Trigger
T1 (Sitzungsstart), T3 (auf Anfrage), T4
(Freigabe-Bezugsprüfung), T5 (Nachricht) und der
tägliche Rückfall gelten unverändert (MasterPrompt
§5.4).

**Prüf-Tabelle — führender Ort der SP-2-Prüfungen.** Das
gemeinsame Prüfprogramm liest sie je aktiver
Prozesskette ([[Kettenpruefung]] §Lint-Anteil; die
Prüf-Definitionen liegen in `pruefungen/` des
Prozess-Ordners). Die Stufen folgen der
Schwere-Tabelle der Basis (FEHLER ist, was unumkehrbar
ist oder nach außen wirkt; alles andere HINWEIS); eine
Abweichung entscheidet der Anwender. Meldungen sehen in
allen Prozessen gleich aus: Code, Stufe, Fundstelle,
Text.

| Code | Prüfung | Befund | Stufe | Anlass |
|---|---|---|---|---|
| `SP2-POST` | Posteingang | Datei in Projekt- oder registrierten Eingangsorten ohne Eintrag; Eingangsdokument ohne Status `eingelesen` (Basis C9) | HINWEIS (nach Schwere-Tabelle) | T1, T2, täglich |
| `SP2-FRIST-RV` | Fristen mit Rechtsverlust | gestufte Eskalation vor dem Ablauf bei der Wirkung „Rechtsverlust bei Versäumung, nicht verlängerbar“; offene Marke nach Ablauf | HINWEIS (nach Schwere-Tabelle — die Eskalation ist Meldung, eine Sperre hilft der Fristwahrung nicht) | T1, T2, täglich |
| `SP2-ZEITBUDGET` | Zeitbudget | `zeitbudget` einer Frist erreicht, gleich aus welchem Grund | HINWEIS (nach Schwere-Tabelle; der Agent legt die fristwahrenden Optionen vor) | T1, T2, täglich |
| `SP2-ZUSAGE` | Zusagen und Erwartungen | fällig oder überfällig, in beide Richtungen | HINWEIS (nach Schwere-Tabelle) | T1, T2, täglich |
| `SP2-WECKER` | Kein Wecker gestellt | aktiver Fall ohne offene Frist (§3) | **HINWEIS** | T1, T2, täglich; beim Erledigen einer Frist |
| `SP2-EVP` | Eventualpläne | Eingangsdokument erfüllt einen offenen Auslöser; Lageänderung durch das Gegenüber ohne Eventualplan | HINWEIS (nach Schwere-Tabelle) | T2 (Eingang), T1 |
| `SP2-SCHRIFTSATZ` | Schriftsätze | angekündigt ohne Frist; eingegangen, aber nicht in der Kette | HINWEIS (nach Schwere-Tabelle) | T1, T2 |
| `SP2-VORTRAG` | Unwidersprochener Vortrag | fremde Tatsachenbehauptung ohne Stellung vor einem Schriftsatz | HINWEIS (nach Schwere-Tabelle) | vor dem Tag; T2 |
| `SP2-BEGLEIT` | Begleitanträge | verfahrensgestaltender Schritt ohne Abschnitt Begleitanträge im Stand zu P7 | HINWEIS (nach Schwere-Tabelle) | vor der Freigabe P7; T2 |
| `SP2-REVIEW` | Versandstand | ohne Eintrag im Feld `review`; `review: verzichtet` ist kein Eintrag (kein Verzicht auf die Prüfung, §Prüfen) | **FEHLER** (nach Schwere-Tabelle — wirkt nach außen, vor dem Versandstand prüfbar); sperrt den Versandstand | vor dem Versandstand; T1, T2 |
| `SP2-NACHWEIS` | Einreichungen | ohne Nachweis | HINWEIS (nach Schwere-Tabelle; nachholbar) | T1, T2, täglich |
| `SP2-PRUEFSUMME` | Einreichungen | Prüfsumme weicht vom freigegebenen Paket ab (Paketprüfung als Vorbedingung des Versandstands) | **FEHLER** (nach Schwere-Tabelle); sperrt den Versandstand — eine erst nach dem Versand erkannte Abweichung ist nicht mehr sperrbar: Meldung mit Prüfung des Rückzugs (§12) | vor dem Versandstand; T1, T2 |
| `SP2-ANLAGE` | Anlagen | Nummernlücke ohne Status; Verweis ohne Eintrag; eingeführt ohne Einreichung | HINWEIS (nach Schwere-Tabelle) | vor dem Tag; T2 |
| `SP2-TEMP` | Anlagen | `temp-` im getaggten Schriftsatz, Verzeichnis oder Paket | **FEHLER**; sperrt Tag und Versandstand | vor dem Tag; vor dem Versandstand |
| `SP2-ABRUF` | Abruf | Abrufturnus eines Kanals mit Bereitstellung zum Abruf überschritten | HINWEIS (nach Schwere-Tabelle) | T1, täglich |
| `SP2-STUFE` | Stufe | Eskalationsanlass im Posteingang (ablehnender Bescheid, Mahnung, Vollstreckungsankündigung, Klage, Eilantrag, Rechtsmittel): nächste Stufe vorschlagen | HINWEIS (nach Schwere-Tabelle) | T2 (Eingang) |
| `SP2-ROLLE` | Rolle | Rollen-Prüfung fällig (§14) | HINWEIS (nach Schwere-Tabelle) | Marken- und Instanzwechsel, neuer Beteiligter, Wiedervorlage |
| `SP2-NORMEN` | Normen-Stand | Schriftsatz, Prüfbericht oder Wegweiser zitiert ein Gesetz aus einem Normen-REC, und im `manifest.tsv` eines neueren Paket-Stands hat sich die **Stand-Zeile dieses Gesetzes** gegenüber dem zitierten REC geändert (§10); ein neuer Paket-Stand allein, bei dem das zitierte Gesetz gleich blieb, meldet nicht | HINWEIS (nach Schwere-Tabelle) | T1; vor dem Tag |
| `SP2-VERTRETUNG` | Vertretung | Wechsel oder Ende der Vertretung ohne Prüfung von Fristen und Zustellungsadressat | HINWEIS (nach Schwere-Tabelle) | T2 |
| `SP2-UNTERBRECHUNG` | Unterbrechung | Unterbrechung oder Aufnahme ohne Neuberechnung der Fristen | HINWEIS (nach Schwere-Tabelle) | T2 (Marken-Wechsel) |
| `SP2-TERMIN` | Termin | Termin ohne Terminsbericht oder ohne die Fristen aus dem Termin — die Fristen laufen ab dem Termin bzw. der Verkündung, nicht erst mit dem Protokoll ([[Marken-SP-2]] §7) | HINWEIS (nach Schwere-Tabelle) | am Termintag und T1 danach; T2 |
| `SP2-NACHLAUF` | Nachlauf | offene Erwartung nach dem Ende, etwa Kostenerstattung (§11) | HINWEIS (nach Schwere-Tabelle) | T1, T2, täglich |
| `SP2-VERTRAULICH` | Vertraulichkeit | Stufe eines Inhalts passt nicht zum Empfänger (§9) — Schriftsatz, Versandstand, Nachricht, Dossier, Abspaltung | **FEHLER** (nach Schwere-Tabelle — wirkt nach außen); sperrt Tag und Versandstand; vor Nachricht, Dossier-Freigabe (P11) und Abspaltung meldet der Wächter denselben Befund als HINWEIS, ohne Sperre | vor dem Tag; vor dem Versandstand; vor der Nachricht; vor der Freigabe P11 |
| `SP2-GEHEIMNIS` | Geheimnis-Prüfung (Ausnahme) | die Geheimnis-Prüfung der Basis läuft in SP-2 **ohne Treffer in Eingangsdokumenten** (`raw/`, `input/raw/`) und in ihren Versandstand-Kopien (Anlagen-Kopie eines Eingangs, bytegleich, unter `outgoing/`); in allen anderen Dateien HINWEIS mit dem Befund-Text der Basis | HINWEIS wie Basis; Ausnahme nur für `raw/`, `input/raw/` und die Kopien daraus im Versandstand | wie Basis |
| `SP2-PFLICHTFELD` | Fristen (Pflichtfelder) | Frist ohne die SP-2-Pflichtfelder `entstehung`, `wirkung`, `verlaengerbar`, `wiedereinsetzung`, `zeitbudget` ([[Katalog-Fristen]] SP-2-Präzisierung) | **FEHLER** (nach Schwere-Tabelle — Dokumentbeschreibung; am Bestand vor dem Stichtag HINWEIS); sperrt Tag und Versandstand | beim Anlegen einer Frist; T1, T2 |
| `SP2-PFLICHTFELD-DOKUMENT` | Eingangsdokumente (Pflichtfelder) | Eingangsdokument ohne die SP-2-Pflichtfelder `zugang`, `zustellart`, `case` ([[Katalog-Eingangsdokumente]] SP-2-Präzisierung; auch der Bescheid eines erbenden Prozesses). `case` ist erst ab Verfahrensbeginn Pflicht — bis dahin fehlt das Feld; mit dem Verfahrensbeginn trägt der Agent es an den zugehörigen Eingangsdokumenten als neues Kopf-Feld mit angehängtem Vermerk nach; solange bei bestehendem Verfahren Eingangsdokumente ohne `case` sind, ein gesammelter HINWEIS je Lauf | **FEHLER** (nach Schwere-Tabelle — Dokumentbeschreibung; am Bestand vor dem Stichtag HINWEIS, Nachtrag als neues Kopf-Feld mit angehängtem, datiertem Vermerk — der Nachweis wächst, [[Einfrieren-und-Abloesen]] §Nachweis); sperrt Tag und Versandstand | T2 (Eingang); T1 |
| `SP2-WEGWEISER` | Wegweiser und Fristenkataloge | Links, Anker und Aufbau der Wegweiser und Fristenkataloge (`tools/wegweiser-quellen.py --pruefen`, §10; ohne `python3` nicht geprüft) | HINWEIS (nach Schwere-Tabelle) | nach dem Holen eines Normen-Stands; Anheben der Vorlage |

**Berichten statt Blockieren:** Der Wächter meldet, er
blockiert nie die Arbeit ([[Berichten-statt-Blockieren]]);
**Tag und Versandstand sperren die FEHLER-Zeilen**
(`SP2-TEMP`, `SP2-REVIEW`, `SP2-PRUEFSUMME`,
`SP2-VERTRAULICH`, `SP2-PFLICHTFELD`,
`SP2-PFLICHTFELD-DOKUMENT`). Die Kettenprüfung ist kein Wächter,
sondern Vorbedingung jeder Freigabe ([[Kettenpruefung]]
§Abgrenzung zu den Wächtern). Mechanische Prüfungen
stehen einmal im Lint-Kern; Wächter rufen sie zu ihren
Anlässen auf und melden.

## 9. Vertraulichkeit

**Etikett.** Elemente, Stände und Eingangsdokumente
tragen `vertraulich: offen | intern | streng-intern`;
die Strategie ist im Standard `streng-intern`. Ein Stand
**erbt die höchste Stufe seiner Quellen**. Je Stufe ist
projektweit benannt, wer Inhalte erhalten darf — das
legt der Anwender in Init-Frage 7 fest; als
**Voreinstellung schlägt der Agent vor:** `offen` —
jeder Empfänger, auch Gegenseite und Stelle; `intern` —
der Anwender, die eigene Vertretung und die eigenen
Beteiligten (Mandant, Kostenträger auf Anfrage);
`streng-intern` — nur der Anwender und der Agent, **auch
nicht an die eigene Vertretung**. Der Anwender kann je
Stufe anders festlegen.

**Prüfung gegen den Empfänger.** Versandstand, Nachricht
an ein anderes Projekt, Dossier (P11), Erläuterung
(P12) und Abspaltung prüfen, ob die Stufe jedes
enthaltenen Inhalts zum Empfänger passt; ein Verstoß ist
ein Prüfpunkt vor dem Versand (§4) und ein
Wächter-Befund (`SP2-VERTRAULICH`, FEHLER, §8: sperrt
Tag und Versandstand; vor Nachricht, Dossier und
Abspaltung Meldung ohne Sperre). Die
Abspaltung darf Inhalte vor Beteiligten der Mutter
verbergen (Feld `vertraulich` an der Nachricht,
[[Katalog-message]]; Nachrichten im Verbund:
`Vorgehen.md` §3a).

**Vertrauenszone.** Arbeitsverzeichnis, Git-Server und
der Anbieter des Sprachmodells (alles, was der Agent
liest, geht als Kontext dorthin) bilden die
Vertrauenszone; **alles wird committet** — Git dient
der Nachvollziehbarkeit und der Vollständigkeit, das
Repo der **Rekonstruktion** des Verfahrens, seine
Weitergabe ist nicht Ziel. Der Agent teilt das beim
Init mit (`index.md` §4.7); der Anwender kann einen
anderen Server, ein lokales Modell, eine Auswahl der
eingelesenen Akten oder abweichende Regeln wählen. Im
Standard **keine Prüfung**, wo Inhalte liegen dürfen,
und **keine Ignore-Listen** aus Vertraulichkeitsgründen
— dafür werden keine Token verwendet. Repo-Sichtbarkeit
und Lizenz: [[Projekt-Sichtbarkeit-und-Lizenz]]
(SP-2-Teil).

**Zugangsdaten als Akteninhalt** werden im Standard
**unmaskiert im Original committet** — ein Dokument
muss im Original vorliegen; der Init schreibt die Zeile
„Zugangsdaten als Akteninhalt: unmaskiert“ in den
Herkunfts-Vermerk, der Anwender kann abweichen (Zeile
ändern, Entscheidung). **Betriebs-Zugangsdaten** des
Agenten (API-Schlüssel, SMTP, Zertifikate der
Versandwege) bleiben nach MasterPrompt §6.3 in jedem
Projekt draußen — die Regel wird unterschieden, nicht
aufgehoben. Die Geheimnis-Prüfung läuft deshalb ohne
Treffer in `raw/` und `input/raw/` (`SP2-GEHEIMNIS`,
§8); eine Anlagen-Kopie eines Eingangs im Versandstand
bleibt ein Eingangsdokument und ist ebenso
ausgenommen (das Prüfprogramm erkennt sie als
bytegleiche Kopie).

## 10. Normtexte

Normtexte sind **Rechercheartefakte je Paket-Stand**:
ein REC je Stand des Normen-Pakets (nicht je Gesetz),
eingefroren ab Anlage, in
`research/REC-NNN - Normen-Paket Stand yyyy-mm-dd/` mit
`manifest.tsv`; das Datum des Stands führt in den
Dateinamen (`yyyy-mm-dd <kuerzel>.xml`, `.pdf`, `.md`),
im Ordnernamen steht die Nummer vorn; ein neuer Stand
liegt neben dem alten.
SP-2 bringt den Stand
[[REC-9001 — Normen-Paket Stand 2026-11-05]] mit
(Kennzeichen `mitgeliefert: template`; `Steckbrief.md`
§Mitgebrachte Ordner); selbst geholte Stände tragen
die nächste freie Nummer. Jeder REC hat einen
Abschnitt „Auffälligkeiten der Quelle“. `raw/` und
`input/raw/` bleiben frei; der Wächter C1 vergleicht
Normtexte nicht. Die **Übernahme eines Paket-Stands ist
eine Entscheidung je Stand**, nicht je Gesetz (Feld
„Übernommen als DEC“ am REC).

**Wegweiser** ([[Wegweiser]], `guide`): je
Verfahrensordnung und je Querschnittsthema ein Knoten
mit Teilaufsätzen — Rechtsbehelfe und Fristen,
Eilrechtsschutz, Kosten, Checkliste Begleitanträge,
Prüfraster, Heilung, Erledigung; dazu
[[Wegweiser-Pruefraster]] (§4) und dünne
Querschnitts-Wegweiser Strafrecht in Grundzügen,
Bescheid erlassen, Auslands- und EU-Bezug zum Erkennen
und zum Abspalten. Die Wegweiser gehören dem Template:
das Upgrade ersetzt sie, das Projekt ändert sie nicht,
eigene Notizen stehen in eigenen Knoten; jeder
Wegweiser trägt im Kopf „Stand der Normtexte“ und
verweist auf den REC, für den er geschrieben ist.

**Erneuern.** Je Release bringt das Upgrade den neuen
Stand als neues REC mit den Wegweisern und fragt
„übernehmen?“ (eine Entscheidung); auf Zuruf im Projekt
holt der Agent den Stand selbst als REC mit
`tools/normen-holen.py`. Nach dem Holen bleiben die
Wegweiser auf ihrem Stand, zitiert wird aus dem neuen.
Der Wächter meldet ein Zitat als veraltet (`SP2-NORMEN`,
§8) nur, wenn sich die Stand-Zeile des zitierten
Gesetzes im `manifest.tsv` des neueren REC gegenüber
dem zitierten geändert hat — nicht schon, weil ein
neuer Paket-Stand vorliegt.
Bundesrecht außerhalb des Pakets (Fachgesetz mit
eigener Frist, P5) lädt der Agent als Projekt-REC
nach; Landesrecht nur als Verweis oder Projekt-REC aus
der amtlichen Quelle; gescannte Normen (etwa
Satzungen) bringt der Anwender als gewöhnliches
Eingangsdokument über `raw/` ein. `wegweiser-quellen.py
--pruefen` prüft die Links der Wegweiser; Links werden
im Projekt nie umgeschrieben.

## 11. Nachlauf

Nach Rechtskraft, Bestandskraft oder einem anderen Ende
folgt die Marke **„Nachlauf“** auf Stufe 1
([[Marken-SP-2]] §8) mit Grundbestand (offene Liste):
Titel aufbewahren mit Wiedervorlage vor der Verjährung
(rechtskräftig festgestellte Ansprüche verjähren in 30
Jahren); Kostenerstattung als **Erwartung**
(Kostenfestsetzung, Zahlungseingang; [[Forderungskonto]]);
PKH-Nachverfahren (Mitteilungspflichten, Änderung bis
vier Jahre nach dem Ende); Rückgabe von Sicherheiten,
Löschung einstweiliger Eintragungen; Aufbewahrungs- und
Löschfristen der Akte (Berufsrecht der Vertretung als
Projekt-REC); Projektabschluss im Repo (Abschluss-Stand,
offene Wiedervorlagen). _Warum:_ Nach dem Ende laufen
noch Erwartungen und Fristen; ohne Marke fehlt ihnen
der Wächter (`SP2-NACHLAUF`, §8).

**Forderungen gegen rechts- und bestandskräftige
Entscheidungen prüfen** — Rechtskraft **und**
Bestandskraft (Bescheide, Stufe 2), im Nachlauf und in
**jedem späteren oder parallelen Verfahren**: schon
entschieden (materielle Rechtskraft, Bindung,
Bestandskraft des Verwaltungsakts)? durch die
Entscheidung erfüllt, festgesetzt, aufgerechnet oder
abgewiesen? Einwendungen gegen einen Titel nur noch mit
Vollstreckungsabwehrklage? Ergebnis als Befund mit
Fundstelle; „entgegenstehende Rechtskraft bzw.
Bestandskraft“ ist ein Verteidigungsmittel in den
Begleitanträgen (§4). Die Verallgemeinerung auf jedes
Begehren: §4 und [[Wegweiser-Pruefraster]].

**Quelle:** der Status `rechtskräftig` bzw.
`bestandskräftig` am Eingangsdokument (Urteil,
Beschluss, Bescheid) mit Tenor in Kurzform und
Reichweite (Parteien, Gegenstand, Zeitraum) — **kein
eigenes Register**; [[Eingangsdokumente]] und der
Status am `case` tragen es.

## 12. Rückzug

Für ein fehlerhaft versandtes Dokument **ohne
Prozesshandlungs-Charakter** (falsche Anlage, falscher
Adressat, falscher Inhalt eines Begleitschreibens) gilt
das Basis-Grundmuster Rückzug eines verteilten Stands
([[Lebenslauf-eines-Stands]] §Rückzug; `Outgoing.md`
§6a): Fehler festhalten, Empfänger ermitteln
(Versandstand-Ordner, [[Einreichungen]]),
Anwender-Entscheidung Rückzug / Berichtigung / Ersatz,
Folge-Versand an alle Empfänger, angehängter Vermerk am
alten Stand, Erwartung „Bestätigung“ je Empfänger.

**Grenze im Verfahren:** Eine **Prozesshandlung**
(Klage, Antrag, Rechtsmittel, Einspruch, Widerspruch,
Erklärung zu Protokoll, Verzicht, Anerkenntnis) wird
**nie über den Basis-Rückzugs-Ablauf zurückgenommen,
sondern nur über die Strategie und eine
Anwender-Entscheidung** — Rücknahme, Erledigterklärung
oder ein neuer Schriftsatz sind Marken mit eigener Kette
und eigenen Fristen aus dem Wegweiser der Ordnung; was
beim Gegenüber zugegangen ist, bleibt zugegangen und
wirkt. Eine erst nach dem Versand erkannte Abweichung
der Prüfsumme meldet der Wächter mit der Prüfung des
Rückzugs (§8); ob daraus ein Rückzug oder eine
Prozesshandlung folgt, entscheidet der Anwender.

## 13. Abspaltung und Mandat (P6)

P6 „Strang starten / Mandat erteilen“ hat **keinen
Dokumenttyp**: freigegeben wird die **Auftragsliste**
als Entscheidung ([[Zuschnitt-aendern]]
§Rückfrage-Pflicht; [[Angebots-und-Beauftragungs-Muster]]
§Auftragsliste zur Freigabe), Zweck „für den Start des
Strangs bzw. der Vertretung“, Vorbedingung die
Gegenperspektive ohne offenen Befund (§4). Sonst
entfällt P6 abgeleitet.

- **Abspaltung** (F5 der Entscheidungsmatrix): Repo,
  **Übergabe-Punkt** (Tag `<repo>/<tag>` mit Hash),
  Startprompt mit dem Anlass in den Worten des
  Abgebenden, Nachrichten ([[Zuschnitt-aendern]]
  §Übergabe-Punkt und §Startprompt-Vorlage;
  [[Init-Choreografie]] §Init mit Startprompt
  (Abspaltung)). Kein Übergabe-Dokument: der andere
  Agent holt sich, was er braucht, über
  `devstate_active.md` des Abgebenden. Hat das neue
  Projekt **keinen Lesezugriff** auf das abgebende
  Repo (anderer Vertraulichkeitskreis, anderer Server),
  legt der Abgebende einen **selbsttragenden Stand zum
  Übergabe-Tag** in seinem `output/` ab — ein Stand mit
  Grad selbsttragend und Herkunftszeile
  ([[Einfrieren-und-Abloesen]] §Stand), der die für den
  Anlass nötigen Eingangsdokumente, Fristen, den
  Sachverhalt und die Strang-Entscheidung kopiert, die
  Vertraulichkeitsstufen gegen den Empfänger prüft
  (§9) — und nennt ihn im Startprompt. Typische
  Abspaltungen: [[Marken-SP-2]] §9. Meldungen zurück
  laufen als Nachricht; ein Kettenglied bei der Mutter
  entsteht nicht.
- **Mandat** an eine Vertretung: Teilaktivität
  `auftrag` **ohne Repo** (Repo „—“ in der
  Start-Tabelle, `Vorgehen.md` §3) mit Startprompt und
  **Auftrags-Dossier** (P11, [[Katalog-Dossier-Stand]])
  als selbsttragendem Stand für die Vertretung; die
  Vertretung arbeitet außerhalb des Templates, ihre
  Lieferungen (Entwürfe, eingereichte Fassungen) kommen
  als Eingangsdokument mit ihrer Kennung; die
  Schriftsatz-Zeile verknüpft beide Zählungen (§6).
  Vertretungszwang je Instanz und Handlung steht am
  `case`; Wechsel oder Ende der Vertretung löst die
  Prüfung von Fristen und Zustellungsadressat aus
  (`SP2-VERTRETUNG`, §8).

## 14. Rolle und Interessen

Die **Rolle des Anwenders** (eine oder mehrere zugleich,
je Verfahren und Instanz; Grundbestand in
[[Beteiligte]]) und der **Verfahrensgrundsatz** am
`case` (Beibringung / Amtsermittlung / gemischt)
steuern **Stimme** (in wessen Namen, welche Anrede,
welche Form), **Absender und Unterschrift** (die
Fassade Beteiligte ist kanonisch; der Prüfplan liest
sie), **Freigabeweg** (wer freigibt — Anwender,
Vertretung, Mandant), **Prüfperspektiven** (§4) und die
**Voreinstellungen** typischer Marken, Begleitanträge
und Prüfraster. Der Pflichtteil „Rolle und Interessen“
im [[Mission Statement]] ([[Katalog-Mission-Statement]]
SP-2-Präzisierung) fasst zusammen und verlinkt auf die
Fassade; der Agent fragt ihn im Init aktiv ab und
detailliert nach (Init-Frage 1), erneut bei jeder
Strang-Entscheidung und wenn im Posteingang ein neuer
Beteiligter erscheint.

**Anwender als öffentliche Stelle:** die
Voreinstellungen kehren sich um — Marken,
Begleitanträge und Prüfraster aus Sicht der erlassenden
oder beklagten Stelle (Anhörung vor Erlass, Abhilfe
oder Vorlage, Klageerwiderung, Vorlage des
Verwaltungsvorgangs, Vollstreckung eigener Bescheide,
Rücknahme und Widerruf); die Prüfperspektive „Adressat
bzw. Bürger“ tritt an die Stelle der Perspektive der
Stelle. Der Erlass von Bescheiden als Massengeschäft und
die behördliche Aktenführung sind kein eigener Ablauf
des Templates; der dünne Wegweiser „Bescheid erlassen“
dient dem Erkennen und dem Abspalten.

**Rolle gelegentlich prüfen:** bei jedem Marken- und
Instanzwechsel (Kläger → Berufungsbeklagter), bei
neuen Beteiligten, bei Rechtsnachfolge und sonst per
Wiedervorlage im Turnus; Ergebnis als kurzer Vermerk,
Änderung per Entscheidung; der Wächter meldet eine
fällige Rollen-Prüfung (`SP2-ROLLE`, §8). Mehrere
Rollen zugleich: die Voreinstellungen werden vereinigt,
Widersprüche meldet der Agent.

**Konflikt-Hinweis:** Der Agent benennt einen möglichen
Interessenkonflikt **einmal**, ohne Blockade; bei
Vertretung Dritter einmal den Hinweis auf die
rechtlichen Rahmenbedingungen des Vertretens Dritter,
ohne Bewertung.

## 15. Zug in SP-2

Jeder Prozess präzisiert, was ein **Zug** in ihm typisch
ist (MasterPrompt §6.1). In SP-2 umfasst ein Zug
typischerweise:

- **Eingang eingelesen** — ein Eingangsdokument ist mit
  Fristen, Stellungen, Raster-Prüfung und Status
  `eingelesen` verbucht (§7).
- **Frist gestellt oder erledigt** — mit der Frage nach
  dem nächsten Wecker (§3).
- **Freigabe erwirkt** — ein zweck-gebundener
  Freigabe-Eintrag ist gebucht, typisch nach einer
  Phase mit Freigabe-Zweck.
- **Prüfrunde abgeschlossen** — ein Prüfbericht liegt
  vor, Befunde sind eingearbeitet oder verworfen (§4).
- **Einreichung gebucht** — Nachweis und Zugang stehen
  in der Einreichung, die Erwartung läuft (§6).
- **Strang- oder Stufen-Entscheidung gebucht** — mit
  Eintrag im Verfahren und Buchung als DEC.
- **Zielmarken-Wechsel vollzogen** — Abschluss-Stand
  oder Entfall, Zeiger auf die nächste Marke
  ([[Zielmarken]] §Meta).

Nicht erschöpfend; Regel bleibt: ein Zug ist eine
**thematisch abgeschlossene Einheit**, kein einzelner
Arbeitsschritt. Die nächsten Züge stehen in
`devstate_active.md` ([[devstate-SP-2]]).

## 16. Bezüge

- Basis-Vorgehensrahmen: `Vorgehen.md`; Versand:
  `Outgoing.md` (§6b SP-2-Teil); Prüfung:
  `Reviewmuster.md` (§6 SP-2-Erweiterung)
- Marken-Dokument: [[Marken-SP-2]]
- Kette, Schwere-Tabelle, Abgrenzung zu den Wächtern:
  [[Kettenpruefung]]
- Zuschnitt ändern, Join, Übergabe-Punkt:
  [[Zuschnitt-aendern]]; Init: [[Init-Choreografie]]
- Rückzug: [[Lebenslauf-eines-Stands]] §Rückzug
- Volle Prozess-Definition: `index.md`; Kurzform:
  `Steckbrief.md`
- Referenzprozess-Präzisierungen:
  `../RP-20-Rechtsfall/wiki/Vorgehen-RP-20.md`,
  `../RP-21-Steuer-und-Abgabenfall/wiki/Vorgehen-RP-21.md`
