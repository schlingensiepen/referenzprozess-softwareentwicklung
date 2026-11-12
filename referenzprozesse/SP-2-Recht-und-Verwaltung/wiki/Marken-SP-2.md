---
type: process-procedure
process: SP-2
extends: []
---

# SP-2 — Marken

**Bearbeitungsstand:** 2026-11-11

## 1. Erbschaft

Was eine Marke ist, was sie abschließt und wann eine
neue beginnt, steht in der Basis: [[Marken]] (Begriff:
[[Glossar]] „Marke“; Register, Zustände, Zeiger,
Zwischenmarke, `entfallen` und Wechsel-Prozedur:
[[Zielmarken]] §Meta). Dieses Dokument schärft das für
Verfahren.

## 2. Typische Marke

Die Marke eines Verfahrens ist **ein Produkt nach
außen**: je Schriftsatz, Einspruch oder Briefwelle eine
Marke; ihr Produkt ist das Ergebnis von P9 „Schriftsatz
ausformulieren“ ([[Vorgehen-SP-2]] §2) — der
Schriftsatz, bei der Termin-Marke die Vorbereitung des
Termins (§7), bei einer Serie die Briefwelle. Beispiele
(Benennung nach dem Produkt): „Einspruch“,
„Widerspruch“, „Klageerwiderung“, „Berufungsbegründung“,
„Antrag auf Akteneinsicht“, „Stellungnahme zur
Anhörung“. Welche Marken in einer Ordnung typisch sind
und in welcher Folge, sagt der Referenzprozess
(`Marken-RP-20.md`, `Marken-RP-21.md`) und der
Wegweiser der Ordnung.

## 3. Ereignis-Marken

Im Verfahren taktet das Gegenüber. Eine
**Ereignis-Marke** entsteht, wenn das Gegenüber
entscheidet oder schreibt („Nach dem Urteil“, „Nach der
Einspruchsentscheidung“, „Nach dem Beweisbeschluss“) —
ausgelöst aus dem Posteingang oder einem ausgelösten
Eventualplan; sie ist im Verfahren der Normalfall.
**Auslösende Ereignisse** (Zustellung von Klage,
Mahnbescheid, Antrag, Bescheid, Strafbefehl, Ladung)
sind Ereignis-Marken und oft die **erste Marke** eines
Projekts; die Antwort darauf (Verteidigungsanzeige,
Klageerwiderung, Widerspruch, Einspruch,
Anschlussrechtsmittel, Schutzschrift) ist das Produkt
dieser Marke ([[Marken]]: das Produkt einer
Ereignis-Marke ist die Antwort des Projekts) — keine
zweite Marke daneben. Beim Init entsteht genau eine
Marke (Bootstrap der Fassade [[Zielmarken]]); der
Agent schlägt als erste
Marke die auslösende Zustellung oder das erste Produkt
vor, je nachdem, wer das Verfahren begonnen hat
(`index.md` §4.6, Frage 2). Ist ein eigener Antrag
beim Init schon gestellt und der Bescheid darauf
liegt vor, ist der Bescheid das auslösende Ereignis
und damit die Ereignis-Marke („Nach dem Bescheid“),
der Widerspruch oder Einspruch dagegen ihr Produkt;
die Bezeichnung nennt der Anwender, er darf die Marke
auch nach dem Produkt benennen („Widerspruch“). Beginnt das
Projekt dagegen mit dem Antrag, ist der Antrag das
erste Produkt und damit die erste Marke.

## 4. Enden und Abschlussformen

Enden sind Ereignis-Marken bzw. Marken (offene Liste):
Vergleichsvorschlag, Vergleich (Widerrufsfrist als
Frist, Richtung je nach Seite), Güte-, Schlichtungs-
oder Mediationstermin, Schiedsspruch, Rücknahme,
Anerkenntnis, Erledigung, Rechtskraft, Bestandskraft,
Kostenfestsetzung, Streitwertfestsetzung, Abhilfe,
Einstellung, Verzicht, Erfüllung, Verjährungseintritt,
Rücknahmefiktion nach Betreibensaufforderung,
Nichtannahme, Anwaltsvergleich; Wiederaufnahme als neue
Marke. **Der Status am `case` führt den Abschluss**
([[Verfahren]]); nach dem Ende folgt die Marke
„Nachlauf“ (§8). Rechtskraft und Bestandskraft stehen
als Status am Eingangsdokument mit Tenor in Kurzform
und Reichweite ([[Vorgehen-SP-2]] §11).

## 5. Zustände: Ruhen, Aussetzung, Unterbrechung

Ruhen, Aussetzung und Unterbrechung sind Zustände des
**Verfahrens** (Status am `case`: laufend, ruhend,
ausgesetzt, unterbrochen) und der **Marke** — nie der
Frist. Die Marke ruht mit Wiedervorlage
(`zurückgestellt`), die Fristen bleiben unter Wache
([[Vorgehen-SP-2]] §3); ruht das Verfahren **auf
Anwender-Wort**, trägt der `case` das Feld `ruht_auf:`
mit der Entscheidung, sonst gilt die Wecker-Pflicht.
Bei der **Unterbrechung** (Tod, Insolvenz, Verlust der
Prozessfähigkeit, Anwaltsverlust) entstehen die
Ereignis-Marken „Unterbrechung“ und „Aufnahme“; Fristen
beginnen nach der Aufnahme neu, der Wächter rechnet sie
neu; Rechtsnachfolge ist ein Rollenwechsel mit Prüfung
([[Vorgehen-SP-2]] §14).

## 6. Frist und Marke sind zwei Dinge

Die Frist hat Verfall, die Marke nicht von selbst. Sie
kann auf Entscheidung des Anwenders **entfallen**
([[Zielmarken]] §Meta, Zustand `entfallen` mit Grund:
Frist versäumt, Verfahren erledigt); bei Erledigung
durch ein Ereignis (Zahlung, Erledigungsbeschluss)
schlägt der Agent den Entfall vor. Offene Elemente einer
entfallenen Marke zeigt der Vollständigkeits-Scan. Eine
**Eilsache** (Eilantrag, Schutzschrift) ist eine
**vorgezogene Marke** vor der laufenden
([[Zielmarken]] §Meta, Zwischenmarke): die laufende
Marke wird zurückgestellt, nach der Eilsache wieder
aufgenommen; kein eigener Zweig.

## 7. Termin als Marke

Ein **Termin** ist eine Marke mit zwei Pflicht-Ständen;
die Ladung bleibt Ereignis-Marke. Termine (offene
Liste): mündliche Verhandlung, Erörterungs-, Beweis-,
Orts-, Anhörungs-, Güte-, Schlichtungs- und
Mediationstermin, Schlussbesprechung einer Außenprüfung,
Prüfungstermin und Gläubigerversammlung in der
Insolvenz, Vernehmung als Zeuge oder Beschuldigter.

- **Vorbereitungs-Stand = Produkt der Marke**
  (`termin-vorbereitung` in `output/`,
  [[Katalog-Termin-Vorbereitung]]; Fassungen in der
  Versionskette, **Tag in P9**; eine Gliederung davor ist
  der Gliederungs-Stand in P8, Verzicht üblich) — ein
  Glied, kein zweiter Wiki-Stand daneben: Anträge in
  der Fassung, die zu Protokoll gegeben wird,
  Erklärungen, Fragen, Vergleichsrahmen (vom Anwender
  freigegeben), Unterlagen. Prüfung wie jedes
  ausgehende Produkt und Gegenperspektive
  ([[Vorgehen-SP-2]] §4). **Einreichung** ist die
  Erklärung im Termin (P13, Kanal `muendlich-termin`),
  das **Protokoll** ihr Nachweis.
- **Ergebnis-Stand** (`termin-ergebnis`,
  [[Katalog-Termin-Ergebnis]]) am Glied **„Termin
  auswerten“** nach P13, ohne Phasennummer, **nicht
  verzichtbar**, Freigabe „für den Marken-Abschluss“:
  Termins- bzw. Vertretungsbericht an den Anwender
  (selbsttragend); Protokoll als Eingangsdokument und
  Nachweis, auf Richtigkeit geprüft, bei Bedarf Antrag
  auf Berichtigung; Vergleich (Widerrufsfrist als
  Frist), verkündete Beschlüsse und Hinweise; Fristen
  und Erwartungen aus dem Termin (nachgelassene
  Schriftsatzfrist, Stellungnahmefristen,
  Verkündungstermin als Erwartung, Auflagen); Abgleich
  mit Strategie und Eventualplänen (ausgelöste Pläne,
  Linie ändern?). **Fristen sofort, nicht erst mit dem
  Protokoll:** Die Fristen und Erwartungen aus dem
  Termin laufen ab dem Termin bzw. der Verkündung;
  der Agent legt sie **im selben Zug** aus dem
  Termins- bzw. Vertretungsbericht in [[Fristen]] an,
  mit dem Fristenkatalog als Berechnungsregel. Das
  Protokoll kommt oft Wochen später: Fehlt es, legt
  der Agent eine Erwartung „Protokoll“ (Frist
  `für-uns`) an; der Ergebnis-Stand wird gebildet,
  sobald das Protokoll eingelesen und geprüft ist —
  die Vorbedingung Protokoll gilt für den Stand, nicht
  für die Fristen. Der Wächter meldet einen Termin ohne
  Terminsbericht oder ohne die Fristen aus dem Termin
  ab dem Termintag ([[Vorgehen-SP-2]] §8, `SP2-TERMIN`).
- Terminsverlegung ist ein Begleitantrag
  ([[Vorgehen-SP-2]] §4).

## 8. Nachlauf

Nach dem Ende des Verfahrens (§4) folgt die Marke
**„Nachlauf“** auf Stufe 1: Titel aufbewahren mit
Wiedervorlage vor der Verjährung, Kostenerstattung als
Erwartung, PKH-Nachverfahren, Rückgabe von Sicherheiten
und Löschung einstweiliger Eintragungen, Aufbewahrungs-
und Löschfristen der Akte, Projektabschluss im Repo —
Grundbestand und die Prüfung von Forderungen gegen
rechts- und bestandskräftige Entscheidungen:
[[Vorgehen-SP-2]] §11. Die Marke führt die
Pflicht-Kette ihrer Stufe ([[Vorgehen-SP-2]] §2
„Kleine Fälle“: P5 dünn, P7 dünn, P9, P10, P13, P15,
Marken-Abschluss). Geht etwas nach außen — ein
Schreiben, ein Antrag wie der
Kostenfestsetzungsantrag —, ist es das Produkt der
Marke und durchläuft Prüfen und Freigabe wie jeder
Schriftsatz: P9 mit Tag, P10 als Versandprüfung, P13
je Empfänger. Geht nichts nach außen, ist der Nachlauf
eine **Marke ohne Produkt**: die Glieder P8, P9, P10
und P13 entfallen **per Verzicht je Phase**
(Verzichts-Entscheidung, [[Kettenpruefung]] §Fehlende
und vertretene Glieder) — die einzige Marke, in der
SP-2 einen Verzicht auf P9 kennt, weil kein Produkt zu
markieren ist; P5, P7, P15 und der Abschluss-Stand
bleiben, der Abschluss-Stand trägt die erledigten
Erwartungen und die offenen Wiedervorlagen.

## 9. Stränge: Entscheidungsmatrix

Das Template legt nicht fest, wie ein neuer Strang
geführt wird. Bei jedem Anlass (neues Aktenzeichen,
neues Gegenüber, neuer Antrag, Rechtsmittel, Konflikt
mit einem Beteiligten, neue Sache in der Akte) legt der
Agent die Matrix mit Vorschlag vor; der Anwender
entscheidet; Buchung als DEC mit
`decision_type: strang` ([[Katalog-Entscheidungen]]
SP-2-Präzisierung); Eintrag im Register [[Verfahren]]
(Strang-Form). Formen:

| Form | Was entsteht | Typisch |
|---|---|---|
| **F1 Serie** | eine gemeinsame Marke, Einheiten in [[Serien]] | Massenverfahren je Grundstück, Bescheid, Vertrag, Verbraucher, Person, Zeitraum |
| **F2 Bündel** | eine Marke, mehrere Produkte | Hauptantrag und Eilantrag in einem Zug; mehrere Empfänger desselben Begehrens |
| **F3 Folge** | Ereignis-Marke im selben Projekt | Replik, nächste Instanz, Reaktion auf eine Entscheidung |
| **F4 Vorziehen** | vorgezogene Marke (§6) | Eilsache, Schutzschrift |
| **F5 Abspaltung** | eigenes Projekt mit Übergabe-Punkt ([[Vorgehen-SP-2]] §13; [[Zuschnitt-aendern]]) | siehe unten |

**K.-o.-Kriterien für die Abspaltung:** anderes
Gegenüber, eigene oder gegenläufige Strategie, anderer
Vertraulichkeitskreis — trifft eines zu, ist F5 die
Empfehlung. **Typische Abspaltungen** (offene Liste):
Strafanzeige; Honorarstreit oder Regress gegen die
eigene Vertretung; Folgeprozess nach Streitverkündung
(die Streitverkündung selbst ist ein Schriftsatz im
Verfahren); Regress gegen Dritte;
Gesamtschuldnerausgleich; Gegenklage in anderer
Gerichtsbarkeit; Forderungsanmeldung in der Insolvenz
des Gegners; Verfassungsbeschwerde nach Erschöpfung des
Rechtswegs. Die Rückfrage-Pflicht gilt
([[Zuschnitt-aendern]] §Rückfrage-Pflicht); mehrere
laufende Marken je Projekt gibt es nicht.

## 10. Formlose Rechtsbehelfe

Petition, Dienstaufsichtsbeschwerde, Gegenvorstellung,
Gnadengesuch, Härtefallantrag gehören zum Zuschnitt:
Marken **ohne eigene Frist**, als Stufe-1-Vorgang oder
eigener Strang mit Wiedervorlage (Erwartung), oft
parallel zu einem förmlichen Rechtsbehelf, den sie
**nicht hemmen** — die förmliche Frist läuft weiter und
bleibt unter Wache. Abschnitt im Wegweiser Vorverfahren.

## 11. Benennung

Sprechend nach dem Produkt oder Ereignis („Einspruch“,
„Klageerwiderung“, „Nach dem Urteil“, „Termin
12. März“, „Nachlauf“); bei mehreren Verfahren im
Projekt mit dem Verfahren oder Aktenzeichen als Zusatz.
Die Marke ist nicht die Version des Produkts
(Versionskette in `output/`) und nicht die Fassung
(Tag); eine Folge-Marke mit neuem Tag führt die Stände
als Folge-Version fort ([[Vorgehen-SP-2]] §2,
Folge-Version).

## 12. Marke und Wächter

Der Marken-Wechsel ist ein T2-Anlass der vollen
Wächter-Runde, ebenso jede Freigabe-Buchung, jeder
Eingang mit Frist und jede Strang-Entscheidung
([[Vorgehen-SP-2]] §8). Eine Freigabe im Nachtrag zu
einer abgeschlossenen Marke (weiterer Empfänger
desselben Schriftsatzes) ist kein Marken-Wechsel.

## 13. Bezüge

- Basis: [[Marken]], [[Zielmarken]] §Meta
- Produkt und Phase P9, Kette, Fristen, Wächter:
  [[Vorgehen-SP-2]]
- Verfahren und Status: [[Verfahren]]; Serien:
  [[Serien]]
- Abspaltung, Join, Übergabe-Punkt:
  [[Zuschnitt-aendern]]
- Referenzprozess-Schärfung:
  `../RP-20-Rechtsfall/wiki/Marken-RP-20.md`,
  `../RP-21-Steuer-und-Abgabenfall/wiki/Marken-RP-21.md`
