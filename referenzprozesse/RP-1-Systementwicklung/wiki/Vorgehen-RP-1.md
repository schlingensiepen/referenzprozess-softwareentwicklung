---
type: process-procedure
process: RP-1
extends: [SP-1]
---

# RP-1 — Vorgehen (Softwaresystem-Entwicklung)

**Bearbeitungsstand:** 2026-10-25 (Start-Tabelle nach
`Vorgehen.md` §3, Außerkraftsetzung eines CON,
Prozess-Definition als Pfad; Produkt in P9, Tag in
der Folge-Marke)

Adaptiert das SP-1-Vorgehen ([[Vorgehen-SP-1]]) für die
Entwicklung eines Softwaresystems.

## 1. Erbschaft

RP-1 erbt vollständig von SP-1 und präzisiert für
Softwaresysteme. Die Kern-Regeln (Grundhaltung,
Ergebnis-Artefakt-Regel, Zweck-Freigaben,
Wächter-Trigger T4, Rekursions-Muster) gelten
unverändert aus der Basis-Vorgehen-Datei
(`Vorgehen.md`).

Alle fünfzehn SP-1-Phasen bleiben bestehen — RP-1 belegt
sie mit Software-spezifischen Artefakten und Namen und
fügt einige Automatisierungs-Regeln hinzu, die
Software-typisch sind.

## 2. Phasen mit RP-1-Präzisierungen

| # | Phase (SP-1) | RP-1-Artefakt / Präzisierung |
|---|---|---|
| P1 | Konzipieren | Konzept-Stand ([[Katalog-Konzept-Stand]]) mit User-Stories und Use-Cases (RP-1-Typen anstelle von `need`/`scenario`, mit `rollen:`-Feld, index §3.2) |
| P2 | Stand der Technik erfassen | Stand-der-Technik-Bericht — Referenzarchitekturen (R4), verfügbare Bibliotheken/Frameworks, Standards (R5) |
| P3 | Anforderungen sammeln | Anforderungen-Stand ([[Katalog-Anforderungen-Stand]]) aus `Anforderungen.md` (SP-1-Register REQ) — User-Stories und Use-Cases fließen als Anforderungs-Quellen ein |
| P4 | Beschreiben der Funktion | Funktionsbeschreibung-Stand ([[Katalog-Funktionsbeschreibung-Stand]]) der Gesamt-Funktionsbeschreibung aus dem SP-1-Register FUNC (Funktionsbeschreibungs-Kette, index §4) |
| P5 | Zerlegen in Bausteine | Architekturdokument ([[Katalog-Architekturdokument]]) aus `Softwaresystemarchitektur.md` (RP-1-Ablösung von SP-1-`Systemarchitektur.md`) mit Komponenten-Schnitt (ARC; was der Stand filtert: Katalog-Eintrag); **Architekturmuster explizit als Sub-Wahl** (z.B. MVC, Hexagonal, Layered, Microservices — V4 der Scaffolding-Kette) |
| P6 | Starten von Teilaktivitäten | Übergabe je Komponente ([[Katalog-Uebergabe]]) + Komponenten-Repositories als Template-Instanzen mit Start-Tabelle und Startprompt (Anmerkung P6 unten, index §4); jeder Komponent durchläuft eigenes RP-1 |
| P7 | Auswählen der Technologie | Technologie-Entscheidungen ([[Katalog-Technologie-Entscheidungen]]) aus den Technologie-Stack-Entscheidungen (R6 Passende Technologien, R7 Best Practices, R8 Sicherheitslage, R11 Lizenz); **mehrere Sprachen möglich, Runtime-Version explizit** (V3); Werkzeugkette siehe Anmerkung unten (V5) |
| P8 | Spezifizieren | Spezifikation-Stand ([[Katalog-Spezifikation-Stand]]) — **Spezifikation** (Bauanleitung nach Schnitt und Technologie-Stack, umsetzbar ohne Fachkenntnis — auch durch Subagenten); entsteht dort, wo gebaut wird: in der nicht weiter zerlegten Komponente, beim Koordinator nur für eigene Bauteile; kleine Projekte: schmal oder Verzichts-DEC (`decision_type: verzicht`, [[Kettenpruefung]] §Fehlende und vertretene Glieder) |
| P9 | Ausarbeiten | **Implementierung inkl. Unit-Tests und automatisierten Integrationstests** (siehe §3 Test-Automatisierungs-Regel) — das Produkt der Marke ist hier der Code ([[Glossar]]); Glied der Kette ist der Tag der Implementierung |
| P10 | Testen | **Testplan** ([[Katalog-Testplan]]) **mit nicht-automatisierbaren Anteilen** (manuelle Integrationstests + Anwender-Tests) aus den Testfällen ([[Testfaelle]]) + Testberichte (TRES, [[Testberichte]]); Angebot Durchführungs-Instanz je Testdurchgang (§4 Anmerkung P10) |
| P11 | Dokumentieren für Entwickler | **Entwickler-Doku** ([[Katalog-Entwickler-Doku]]) als selbsttragender Stand in `output/`, Kopie in `docs/developer/`: Aufbau, Entscheidungen, Einstieg und Build in der Projektsprache; die aus Docstrings erzeugte API-Doku (Zone 1, §12) ist Teil davon, nicht ihr Ersatz; bei einer Komponente die Entwickler-Doku für ihr Bauteil — das letzte Glied ihrer Kette (§8) |
| P12 | Dokumentieren für Benutzer | **Benutzer-Doku** ([[Katalog-Benutzer-Doku]]) als selbsttragender Stand in `output/`, Kopie in `docs/user/`; Zone 3 (§12): projekt-primär Deutsch; beim Koordinator bzw. Standalone, bei einer Komponente nur mit eigener Zielumgebung (§8) |
| P13 | Ausliefern | **Deploy-Stand** je Umgebung ([[Katalog-Deploy-Stand]]) in `output/` mit `_VV_TLA` (index §4), beim Koordinator für alle Komponenten (§7 Punkt 6, §8) + Startprompts; **CI-Pipeline-Konfiguration** (V6a — Deploy-Zielumgebung ist hier verankert) |
| P14 | Produzieren | Bereitstellen und Konfigurieren der Ziel-Umgebung — bei Standard-Software oft weitgehend durch P13-Rückverweis (Deploy-Stand) abgedeckt; bei RP-11 Cloudanwendung eigener Substanz-Bereich (Vertragsaspekte, laufender Betrieb); CI-/Deploy-Feinheiten aus V6a greifen hier |
| P15 | Betreiben | **Betriebs-Anleitung** je Umgebung ([[Katalog-Betriebs-Anleitung]]) als selbsttragender Stand in `output/`, Kopie in `docs/ops/`, aus dem Deploy-Stand der Umgebung; laufende `bug-report`-Ingestion; Fehlerbilder-Recherche R10 aktiv |
| — | Ablauf je Stand | vom ersten `offen`en Element über Lese-Klammer, Bildung, Prüfung, Vorlage und Korrektur bis zur Freigabe: [[Lebenslauf-eines-Stands]] (gilt für jeden Stand dieser Tabelle) |

Zweck, Filter und Auslöser jedes Stands stehen in
seinem Dokumenttyp-Eintrag (verlinkt in der Tabelle;
SP-1-Einträge, RP-1 präzisiert hier nur die Artefakte).
**Contracts in der Kette:** welche Rolle ein CON in
P4, P5/P6, P7 und P8 spielt —
[[Katalog-Contract-Index#Rollen eines CON in der Kette]],
lesen bei einem Schnitt in Komponenten.

**Anmerkung P3 Anforderungs-Zweistufigkeit:**
Anforderungen werden in RP-1 **zweistufig** erhoben.
**Stufe 1** ist eine schmale Anforderungsskizze vor dem
Scaffolding-Commit (Marker-Message
`Initial project scaffolding`, Vorgehen.md §7a und
MasterPrompt §6.1): nur Anforderungen, die eine
anstehende Scaffolding-Entscheidung (Sprache,
Framework, Persistenz-Klasse, Architektur,
Werkzeugkette, Deploy-Ziel, Lizenz, Sichtbarkeit)
tatsächlich beeinflussen; bewusst kurz gehalten.
**Stufe 2** ist die systematische Vollerfassung nach
dem Scaffolding-Commit: Detail-Anforderungen,
Grenzfälle, nicht-funktionale Anforderungen,
UI-Details. Bei Verzicht auf Stufe 2 wird eine
Negativ-Entscheidung im Projekt-Repo gebucht
(„Verzicht auf Anforderungs-Vollerfassung (Stufe 2)"
mit Kurzbegründung). Zweistufigkeit greift pro Repo
(Koordinator und jedes Komponenten-Repo eigenständig).

**Anmerkung P6 Komponenten-Repositories:** Bevor ein
Komponenten-Repo entsteht, legt der Koordinator in P6
die **Start-Tabelle** zur Freigabe vor — Spalten,
Vorschlagswerte und die Wahl der Übernahme-Art samt
Start und Transport stehen prozess-unabhängig in
`Vorgehen.md` §3 „Start einer Teilaktivität“ (Kette je
Art: [[Kettenpruefung]] §Komponenten-Kette nach
Übernahme-Art). RP-1 präzisiert nur den Ort der Lage:
Repo-Name, Pfad und Remote stehen in §Komponenten der
[[Softwaresystemarchitektur]]; der Repo-Name ist der
Qualifizierer in Verweisen über Repo-Grenzen
(`<repo>/FUNC-012`).

Nach der Freigabe der Tabelle und des Übergabe-Stands
an die Komponente erzeugt der Koordinator ihren
**Startprompt**: den Einstieg des Koordinators (den
Start-Satz seiner eigenen Vorlage, mit dem Satz, dass
es andere Referenzprozesse gibt und der Agent im
Zweifel den Anwender fragt) mit den Angaben der
Tabelle und dem Verweis auf den freigegebenen
Übergabe-Stand; den Referenzprozess der Komponente
gibt der Startprompt nicht vor. Woher der Einstieg
kommt, welche Angaben der Startprompt im Einzelnen
trägt (auch: keine CON-IDs) und wie die Komponente
ihn im Init liest: [[Init-Choreografie]] §Init mit
Startprompt (Komponente) — lesen, bevor der
Startprompt erzeugt wird.

**Anmerkung P7 Werkzeugkette (V5 der
Scaffolding-Kette):** Die Werkzeugketten-Entscheidung
umfasst mindestens: Linter, Formatter, Type-Checker,
Übersetzungs-Kette (Compiler/Transpiler/Bundler),
Test-Framework, Package-Manager (getrennt für Dev und
Deploy), Build-Tool, stackpassende `.gitignore`,
Migrations-Werkzeug — erweiterbare Liste, nicht
erschöpfend. Vorgelegt als V5-Vorlage der
Scaffolding-Kette ([[Vorgehen-SP-1]] §4a), gebucht als
Technologie-Stack-Entscheidungen an P7.

## 3. Test-Automatisierungs-Regel

**Kern-Verschiebung:** In der Software-Entwicklung sind
weite Teile des Testens automatisierbar. Die
automatisierbaren Anteile wandern aus P10 Testen in P9
Ausarbeiten.

**Zwei Bezugspunkte:** Unit- und automatisierte
Integrationstests prüfen gegen die **Spezifikation**
(P8-Artefakt, Bauanleitung — „richtig gebaut");
System- und Anwender-Tests prüfen gegen die
**Funktionsbeschreibung** (P4-Artefakt, Außensicht —
„das Richtige gebaut"). Die Freigabe-Kette unten
trägt beide Bezugspunkte. Fehlt ein Bezugspunkt
(Verzicht auf P8; P4 bei Übernahme-Art Auftrag durch
den Übergabe-Stand vertreten), gilt das, was das
Glied vertritt — [[Kettenpruefung]] §Fehlende und
vertretene Glieder.

**Konkret:**

- **Unit-Tests:** entstehen in P9 als Teil der
  Implementierung. Bleiben nicht als eigenständige
  P10-Artefakte in der Test-Doku, weil sie mit dem Code
  leben.
- **Automatisierte Integrationstests:** entstehen in P9
  als Teil der Implementierung. Ergebnis: automatische
  Test-Suite mit Test-Report als P9-Beiwerk.
- **Nicht-automatisierbare Integrationstests:** landen
  im P10-Testplan (manuelle Prüfungen, Cross-Component-
  Szenarien, die Instrumentierung außerhalb der
  Software-Umgebung erfordern).
- **Anwender-Tests / Akzeptanztests:** landen im
  P10-Testplan.

**Folge:** Der P10-Testplan ist kein „umfassender
Testkatalog", sondern der **Rest** nach Automatisierung.
Er enthält typischerweise:

- Manuelle Integrations- oder System-Tests
- Anwender-Akzeptanztests
- Performance-/Last-Tests (falls nicht automatisiert)
- Sicherheits-Tests (falls nicht automatisiert)

**Freigabe-Kette:** Die Code-Glieder der Kette und
ihre Vorbedingungen stehen in [[Kettenpruefung]]
§Code-Glieder — lesen vor dem Tag und vor der
Freigabe des Deploy-Stands. RP-1 präzisiert:

**P9 → P10.** Die Implementierung wird **per Tag**
freigegeben (der Tag der Implementierung ist das Glied
P9). Vorbedingung sind **beide** Nachweise:

- **(a) Tests grün (Regressions-Sicherheit)** —
  Unit-Tests und automatisierte Integrationstests grün.
  Automatisch prüfbare Vorbedingung — der Agent kann
  die Prüfung nach der Delegations-Regel (Vorgehen.md
  §4) an sich selbst delegieren, wenn der Anwender die
  Standing-Freigabe erteilt hat oder pro Freigabe
  zustimmt.
- **(b) Code-Review als Kettenprüfung des Glieds P9**
  — ein anderes Modell als das implementierende oder
  ein spezialisiertes Werkzeug (z.B. Codex) prüft den
  Code gegen **alle freigegebenen Vorgänger der
  Marke** ([[Kettenpruefung]] §Regel), darunter die
  Spezifikation (P8), wenn es sie gibt; eine eigene
  Regel für das Code-Review gibt es nicht. Welche
  Vorgänger fehlen dürfen und was dann an ihre Stelle
  tritt: [[Kettenpruefung]] §Fehlende und vertretene
  Glieder — lesen, bevor der Prüfauftrag formuliert
  wird. Das Review ist **Vorbedingung, kein Angebot**:
  angeboten wird nur die Werkzeug-Wahl (`Vorgehen.md`
  §7b; Wahl in `Tools.md`, Kategorie
  „Code-Review-Werkzeuge“); steht kein zweites Modell
  zur Verfügung, gilt der beim Init gewählte Ersatzweg
  aus `Tools.md` (`Reviewmuster.md` §Schleife 2).
  Anregungen aus dem Review stimmt der Agent mit dem
  Anwender ab. Ein Verzicht ist nur als
  Anwender-Entscheidung mit benanntem Impact möglich.
  Substantielle Prüfung mit inhaltlichem Urteil —
  nicht automatisch delegierbar.

Der Freigabe-Eintrag nennt den Tag und beide Nachweise
(Aufbau: `## Meta` von [[Entscheidungen]]
„Freigabe-Einträge“ — lesen vor der Buchung).
Automatische Tests allein reichen nicht — sie prüfen
„läuft der Code" (Regressions-Sicherheit), nicht „tut
der Code, was die freigegebenen Vorgänger verlangen".

**Tag setzen.** Der Tag ist die Freigabe des Codes,
und Freigaben sind Anwender-Entscheidungen
(`_template/referenzprozesse/RP-1-Systementwicklung/index.md`
§4). Ablauf:

1. Beide Nachweise liegen vor: (a) Tests grün,
   (b) Code-Review als Kettenprüfung des Glieds P9.
2. Der Anwender gibt frei.
3. **Der Agent setzt den Tag** nach dem OK, im Repo,
   das den Code führt (bei Werkstatt und Produkt in
   zwei Repos: im Produkt, [[Two-Repo-Submodul-Muster]]
   §Standardbelegung). Der **Tag-Name** folgt der
   Konvention des Projekts in `Facts.md`; er ist nicht
   die Marken-Bezeichnung. Bei einer Zwischenmarke
   sitzt der Tag auf ihrem eigenen Zweig ab dem Tag
   der Vormarke (Zweig-Konvention in `Facts.md` neben
   der Tag-Konvention; [[Zielmarken]] §Meta,
   Zwischenmarke — Tag und Produkt-Repo).
4. Die Freigabe wird als DEC gebucht, mit dem
   Tag-Namen an Stelle der Version (Wortlaut des
   Tag-Eintrags samt Marken-Zusatz: `Vorgehen.md` §4
   „Freigabe per Tag“; Aufbau des Eintrags: oben).
   In `herkunft` späterer Stände steht der Tag-Name,
   bei Werkstatt und Produkt in zwei Repos als
   `<produkt-repo>/<tag>` ([[Einfrieren-und-Abloesen]]
   §Stand).

**Ein gesetzter Tag wird nie verschoben oder
gelöscht.** Eine Korrektur ist ein neuer Tag mit neuer
Freigabe; vor dem Marken-Wechsel löst der
Freigabe-Eintrag des neuen Tags den alten per
`supersedes:` ab; nach dem Wechsel bei unverändertem
Code steht die neue Tag-Freigabe im Nachtrag „Tag
korrigiert“ am Marken-Eintrag, und die alte bleibt
stehen ([[Zielmarken]] §Meta, Nachtrag;
[[Kettenpruefung]] §Kette). Gepusht wird der Tag wie
jeder Commit nur auf Anfrage (MasterPrompt §6.4). Bei
einer Komponente ist der Tag zugleich ihre Lieferung
an den Koordinator (§8); bleibt der Code in der
Folge-Marke unverändert, gelten Tag und Lieferung
dort weiter ([[Kettenpruefung]] §Kette, Übernahme des
Tags und der Lieferung).

**P10 → P11, P12, P13.** Glied ist der Testbericht
(TRES, [[Testberichte]]) zu einem Durchgang nach dem
freigegebenen Testplan-Stand; er ist Vorbedingung der
Entwickler-Doku (P11), der Benutzer-Doku (P12) und des
Deploy-Stands (P13); Nicht-Bestandenes erzeugt
einen BUG ([[Kettenpruefung]] §Code-Glieder).

**Rollen bei Integrationstest-Befunden (P10):**

- **Reproduziert wird beim Koordinator.** Nur er hat
  den lauffähigen Gesamtaufbau (Integrationstests,
  Deployment-Automatisierung des Gesamtsystems). Ein
  Komponenten-Agent hat nur seine eigene Komponente und
  kann einen Integrationstest-Befund nicht selbst
  nachvollziehen.
- Der Koordinator schickt der betroffenen Komponente
  eine Nachricht ([[Katalog-message]]) mit dem, was sie
  zur Eingrenzung braucht: **Testfall, Protokolle,
  beobachtetes gegen erwartetes Verhalten.** Die
  Komponente bucht den Befund als BUG mit `quelle:` auf
  die Nachricht (`Vorgehen.md` §3a); erst damit ist er
  im Komponenten-Repository bearbeitbar.
- **Ein Contract-Bruch geht als Nachricht an den
  Provider** und wird dort als BUG gebucht, nicht
  zusätzlich beim Consumer — den
  Contract verantwortet der Provider (siehe §9
  Contract-Aushandlung und -Eskalation). Betrifft der
  Befund beide Seiten zugleich, ist es kein
  Contract-Bruch mehr, sondern ein Rücklauf nach P4 der
  Komponente (§10 Rücklauf-Mechanik).

**Werkzeug-Kadenz-Bericht bei Quelltext-Commits
(RP-1-Präzisierung der Basis-Regel aus MasterPrompt
§6.1):**

- **Prozess-relevante Änderung = Quelltext-Änderung.**
  Erkennung anhand der Datei-Endungen des
  V3-Technologie-Stacks aus dem Scaffolding-Baustein
  (Vorgehen.md §7a), typisch
  `.js/.ts/.py/.rs/.go/.java/.rb/.c/.h/.cpp/…` je nach
  Projekt. Doku-only-Commits (nur `.md/.txt/docs/`)
  triggern keine Kadenz.
- **Werkzeug-Kadenz = Test-Kommando + Linter/Formatter-
  Kommando** aus der V5-Werkzeugkette (§2 Anmerkung
  P7), in Kategorie „Kadenz-Werkzeuge" der `Tools.md`
  registriert. Ist ein Werkzeug nicht registriert (etwa
  weil im V3/V5-Scaffolding aufgeschoben), entfällt die
  entsprechende Bericht-Zeile mit einmaligem Hinweis.
- **Test-Umfang:** projekt-spezifisch, Konfiguration
  über `Tools.md`. Kleine Projekte: volle Suite bei
  jedem Commit. Große Projekte: Standing-Freigabe legt
  fest, ob Fast-Test-Suite (Unit-Only) bei jedem Commit
  oder volle Suite (inkl. Slow-Integrationstests) —
  Wahl liegt beim Anwender.
- **Ergebnis in Commit-Message** als Info-Zeilen
  (Format siehe MasterPrompt §6.1). Beispiel:
  ```
  Feature: Login-Handler ergänzt

  Tests: 42/45 grün, 3 rot (Ursache: Login-Race-Condition, wip)
  Lint: sauber
  ```
- **Rote Tests / Lint-Verstöße blockieren den Commit
  nicht** ([[Berichten-statt-Blockieren]]) —
  Zwischenspeicher-Commits mit rotem Zustand sind
  explizit erlaubt und im späteren `git log` erkennbar.
  Trennung zur Freigabe-Frage: der **Tag der
  Implementierung** (P9 → P10) verlangt weiterhin grüne
  Tests als Vorbedingung nach der Freigabe-Kette oben
  (a) — das ist Freigabe-Frage, nicht Kadenz-Frage.
- **Standing-Freigabe im Init** — der Agent führt die
  Kadenz still bei jedem Quelltext-Commit aus (kein
  Nachfragen), Ergebnis erscheint in Commit-Message.
  Anwender kann pro Commit ausschalten („commit ohne
  Testlauf, ich weiß was ich tue" — landet dann als
  `Tests: nicht ausgeführt (auf Anwender-Anweisung)`
  in der Commit-Message).

## 4. Angebote an Phasen (RP-1-Zusätze — R / M / V)

Zusätzlich zur SP-1-Tabelle ([[Vorgehen-SP-1]] §3)
bindet RP-1 seine software-spezifischen Angebote in
**einer** Zusatz-Tabelle: **R** = Recherche-Thema,
**M** = Zusatz-Prüfanforderung vor Freigabe, **V** =
Scaffolding-Vorlagen-Präzisierung (Vorgehen.md §7a,
[[Vorgehen-SP-1]] §4a).

| Typ | Angebot | Phase | Zeitpunkt / Inhalt |
|---|---|---|---|
| R | **R4** Referenzarchitekturen | P5 Zerlegen in Bausteine | vor Architektur-Entscheidung |
| R | **R5** Standards und Austauschformate | P5 Zerlegen in Bausteine · P7 Auswählen der Technologie | vor Contract-Definition; vor Technologie-Wahl |
| R | **R9** Betriebs- und Deploypraxis der Zielumgebung | P13 Ausliefern | vor Deploy-Erstellung |
| R | **R10** Fehlerbilder der eingesetzten Version | P15 Betreiben | laufend, insbesondere nach neuen Releases |
| M | **Vierte Frage: Technologieagnostik** — Funktionsbeschreibung frei von Technologie-Vorannahmen? | P4 Beschreiben der Funktion | vor Freigabe |
| M | **Hochwertiger Prüfer, mehrere Runden** — Fehler der Funktionsbeschreibung kaskadieren | P4 Beschreiben der Funktion | vor Freigabe |
| M | **UI-Entwürfe** (bei Systemen mit Benutzungs-Schnittstelle) — alle Fälle der Funktionsbeschreibung abgebildet? (Anmerkung P4 unten) | P4 Beschreiben der Funktion | vor Freigabe für P5 |
| M | **Querprüfung:** jede Anforderung mindestens einer Komponente zugeordnet? | P5 Zerlegen in Bausteine | vor Freigabe |
| M | Prüfung, dass **Startprompts der Komponenten-Repositories** ohne Rückfrage ausreichen (§2 Anmerkung P6) | P6 Starten von Teilaktivitäten | vor Freigabe |
| M | Prüfung gegen Teil- und Gesamt-Funktionsbeschreibung (kein Widerspruch, kein ungewollter Lock-in) | P7 Auswählen der Technologie | vor Freigabe |
| M | **Anforderungs-Vollerfassung Stufe 2 vollständig** (§2 Anmerkung P3) — oder Negativ-Entscheidung „Verzicht auf Stufe 2" im Projekt-Repo vorhanden; Warnung nach [[Berichten-statt-Blockieren]], keine harte Blockade | Übergang P8 → P9 | vor Fachlogik-Start |
| M | **Code-Review als Kettenprüfung des Glieds P9** ([[Kettenpruefung]] §Regel) durch ein anderes Modell als das implementierende oder ein spezialisiertes Werkzeug — Vorbedingung, angeboten wird nur die Werkzeug-Wahl (§3 Nachweis (b)) | Übergang P9 → P10 | vor dem Tag der Implementierung |
| M | **Verständnis-Check M6** (`Reviewmuster.md`), **Pflicht** vor der Vorlage der drei Doku-Stände — Entwickler-Doku „Kann ein Fremder das Produkt ohne Rückfrage ändern?“, Benutzer-Doku „Kann ein Fremder das Produkt ohne Hilfe benutzen?“, Betriebs-Anleitung „Kann ein Fremder das Produkt ausführen?“ | P11 Dokumentieren für Entwickler · P12 Dokumentieren für Benutzer · P15 Betreiben | vor der Vorlage an den Anwender, über das ganze Dokument; Betriebs-Anleitung nach der Freigabe des Deploy-Stands ihrer Umgebung ([[Katalog-Betriebs-Anleitung]]) |
| M | **„Kann ein Fremder ausführen?"** — Startprompts als selbsttragende Anleitung | P13 Ausliefern | Startprompts vor Freigabe |
| V | **V2**-Präzisierung: Anforderungsskizze Stufe 1, nur setup-relevant (§2 Anmerkung P3) | P3 Anforderungen sammeln | vor Scaffolding-Commit |
| V | **V3**-Präzisierung: mehrere Sprachen möglich, Runtime-Version explizit | P7 Auswählen der Technologie | Wurzelentscheidung |
| V | **V4**-Präzisierung: Architekturmuster explizit als Sub-Wahl (MVC, Hexagonal, Layered, Microservices) | P5 Zerlegen in Bausteine | mit Architektur-Entscheidung |
| V | **V5**-Präzisierung: Werkzeugketten-Liste (§2 Anmerkung P7) | P7 Auswählen der Technologie | nach V3 |
| V | **V6a**-Präzisierung: CI-Pipeline-Konfiguration, Deploy-Zielumgebung | P13 Ausliefern · P14 Produzieren | mit Deploy-Entscheidungen |

(V1 und V6b sind Basis-Angelegenheit — siehe
Vorgehen.md §7a.)

Zeilen, die ein Glied nennen (die P4-Prüfungen, die
Anforderungs-Vollerfassung am Übergang P8 → P9, die
Spezifikation als Bezugspunkt), gelten für das, was
das Glied vertritt, und entfallen, wo es fehlt: bei
Übernahme-Art Auftrag vertritt der Übergabe-Stand
P1–P4 der Komponente, beim Koordinator ohne eigene
Bauteile fehlen P7–P9 ([[Kettenpruefung]] §Fehlende
und vertretene Glieder).

Die Stimmigkeit zwischen den Teil-Funktionsbeschreibungen
der Komponenten tragen die Contracts (Rollen je Phase:
[[Katalog-Contract-Index#Rollen eines CON in der Kette]])
und der Integrationstest des Koordinators (§8); eine
eigene Querprüfung des Koordinators in P4 der
Komponenten gibt es nicht.

**Anmerkung P4 UI-Entwürfe:** Bei Systemen mit
Benutzungs-Schnittstelle bietet der Agent in P4
UI-Entwürfe an. Ablauf: Werkzeug-Wahl durch den
Anwender (`Vorgehen.md` §7b; Wahl in `Tools.md`,
Kategorie „UI-Entwurfs-Werkzeuge“;
z.B. Stitch, ohne Werkzeug Markdown-Wireframes oder
HTML-Mockups) → Entwürfe →
Prüfung „alle Fälle der Funktionsbeschreibung
abgebildet?“ vor der Freigabe für P5. Ändert sich dabei
die Funktionsbeschreibung, greift das Review nach einer
Änderung (`Reviewmuster.md`).

**Anmerkung P10 Durchführungs-Instanz:** In P10 bietet
der Agent je Testdurchgang eine Durchführungs-Instanz
an — Plan und Protokoll in einem ausfüllbaren
Dokument, selbsttragend abgeleitet aus dem
freigegebenen Testplan-Stand, für Ausführende ohne
Wiki-Zugang. Das Format wählt der Anwender
(Werkzeug-Wahl nach `Vorgehen.md` §7b, z.B.
Tabellenkalkulation). Auslöser, Marke, Feld
Zielgruppe, Vorlage der Struktur und der Weg von der
ausgefüllten Instanz zum Testbericht:
[[Katalog-Durchfuehrungs-Instanz]] — lesen, bevor die
Struktur vorgelegt wird.

## 5. Prüfungs-Präzisierungen

**In der §4-Tabelle konsolidiert (Typ M)** — dort die
Software-typischen Zusatz-Anforderungen zur
SP-1-Basis-Prüfung (Prüflauf nach `Reviewmuster.md`
§2, [[Vorgehen-SP-1]] §4).

## 6. Änderung nach der Freigabe (RP-1-Präzisierung)

Wie eine Änderung nach einer Freigabe beantwortet wird
(Freigabe des eingefrorenen Stands bleibt, überholter
Stand, neuer Stand mit eigener Freigabe):
`Vorgehen.md` §4 „Änderung nach der Freigabe“ und
[[Vorgehen-SP-1]] §5 — lesen, wenn sich nach einer
Freigabe etwas ändert. RP-1 präzisiert für kritische
Artefakte und für Contracts:

- **Contracts:** ein angenommener CON ist eingefroren;
  eine Rücknahme gibt es nicht. Jede Änderung ist ein
  **Nachfolge-CON** — ein neues Element mit
  `supersedes:` (ersetzt den Vorgänger) oder
  `vorgaenger:` (Vorgänger bleibt parallel gültig).
  Freigegeben wird er vom Provider, bei Berührung einer
  freigegebenen Grundlage vom Anwender; gemeldet und
  gebucht wird er wie jede CON-Freigabe (§9). Die
  Nachricht an die registrierten Consumer meldet die
  Ablösung und, falls ein parallel gültiger Vorgänger
  später außer Kraft gesetzt wird, auch diese — was
  die Außerkraftsetzung an beiden Elementen bucht und
  warum erst sie die Consumer-Stände überholt:
  [[Contract-Index]] §Meta „Identität und Nachfolge“.
  Grund:
  Contract-Änderungen betreffen andere Komponenten, die
  den Contract als Grundlage genommen haben; wann ihre
  Stände überholt sind: [[Einfrieren-und-Abloesen]]
  §Überholt-Regel.
- **Gesamt-Funktionsbeschreibung nach P4-Freigabe:**
  ist der freigegebene Stand überholt (Auslöser:
  [[Einfrieren-und-Abloesen]] §Überholt-Regel), ist
  **sofort** — nicht erst im nächsten Zyklus — ein neuer
  Stand mit eigener Freigabe-DEC Pflicht, die die alte
  per `supersedes:` ablöst, weil die Komponenten auf ihm
  aufsetzen.
- **Andere Artefakte:** die SP-1-Präzisierung (Meldung,
  neuer Stand im nächsten Zyklus) reicht.

## 7. Wechsel-Semantik SP-1 → RP-1

Beschreibt, was beim Wechsel von SP-1 zu RP-1 mit dem
bisherigen Repository und den dort bereits laufenden
Scaffolding-Entscheidungen passiert.

**Zeitpunkt des Wechsels.** Der Agent bietet RP-1 an,
sobald Zweck und Anforderungsskizze stehen und
**bevor** Technik entschieden wird — vor den
technischen Scaffolding-Entscheidungen des
SP-1-Vorgehens.

**Was beim Wechsel gilt:**

1. **Das Startverzeichnis wird das Koordinator-
   Repository.** Es entsteht kein neues Verzeichnis;
   der startende Agent bleibt zu Hause und wird
   Koordinator.
2. **Bereits gebuchte Einträge bleiben gültig.**
   Git-Entscheidung und Anforderungsskizze betreffen
   genau dieses Repository und gelten unverändert
   weiter.
3. **Technikentscheidungen ruhen bis zum Schnitt.**
   Das sind die technischen Scaffolding-Entscheidungen
   des SP-1-Vorgehens (Vorlagen-Kette nach Vorgehen.md
   §7a / [[Vorgehen-SP-1]] §4a): Sprache/Technologie-
   Stack, Verzeichnisstruktur und Architekturmuster,
   Linter/Formatter, Test-Framework,
   Dependency-Management/Build. Diese gehen bei
   RP-1-Wahl auf `aufgeschoben`, mit dem Auslöser
   **„sobald der Schnitt entschieden ist"** — das
   entspricht der Freigabe des **P5-Artefakts**
   (Zerlegen in Bausteine).
4. **Mit P5 verteilt der Koordinator.** Sobald P5
   (Zerlegen in Bausteine) freigegeben ist, nimmt der
   Koordinator jeden aufgeschobenen Eintrag durch:
   - Braucht er ihn für **seine eigene Arbeit**
     (Integrationstests, System-CI, Deployment-
     Automatisierung des Gesamtsystems), bekommt der
     Eintrag einen Auslöser, den sein eigener Weg auch
     erreicht.
   - Gehört der Gegenstand zur **Komponentenebene**,
     wird der Eintrag `verworfen` mit dem Grund
     „Zuständigkeit an `<Komponente>` übergegangen" —
     der zuständige Komponenten-Agent trifft die
     Entscheidung in **P7 Auswählen der Technologie**
     seines eigenen (rekursiven) Vorgehens neu.
5. **Die CI-Pipeline-Entscheidung** fällt
   **je Komponente** in deren P7 Auswählen der
   Technologie; zusätzlich richtet der Koordinator eine
   **System-CI** ein, die die Integrationstests fährt.
   Die System-CI entsteht dort, wo der Koordinator
   seine Integrationstests baut (P10+P13-Aggregat, siehe
   §8); ein früherer Aufbau zusammen mit den übrigen
   beim Koordinator verbleibenden
   Technikentscheidungen aus Schritt 4 ist zulässig.
6. **Die Deployment- und Zielumgebungs-Entscheidung**
   bleibt beim **Koordinator** — er baut die
   Deployment-Automatisierung des Gesamtsystems und
   führt P13 Ausliefern: Deploy-Stände je Zielumgebung
   in `output/` und die DEPL-Elemente für alle
   Komponenten seiner §Komponenten-Zeilen; die
   Komponenten liefern ihre Teile zu. Wann eine
   Komponente P13 und ihre DEPL selbst führt (eigene
   Zielumgebung): [[Kettenpruefung]] §Fehlende und
   vertretene Glieder.
7. **Die Lizenz-Entscheidung** wird **einmal global**
   beim Koordinator getroffen und gilt für alle
   Komponenten. Braucht eine Komponente eine
   abweichende Lizenz, entsteht dafür ein eigener
   Eintrag in ihrem Register, mit Begründung.

**Projektzweck- und Git-Setup-Entscheidungen** bleiben
beim Koordinator und wandern nicht — sie betreffen sein
Repository unabhängig vom späteren Schnitt.

Der Scaffolding-Commit des Koordinator-Repositories
wird davon nicht aufgehalten: `aufgeschoben` zählt wie
`verworfen` als nicht mehr ausstehend (SP-1-Grundregel).

## 8. Zweck-Freigaben in RP-1

RP-1 nutzt das Zweck-Freigabe-Modell des Basisrahmens
(Vorgehen.md §4) ohne Ausnahmen — keine blockierenden
Tore; Verlässlichkeit tragen die zweck-gebundenen
Freigaben und der Wächter-Trigger T4 (Warnung nach
[[Berichten-statt-Blockieren]]). Typische
Zweck-Freigaben in RP-1 (führend für den Zweck eines
Stands ist sein Dokumenttyp-Eintrag im [[Katalog]];
die Tabelle wendet ihn auf Koordinator und
Komponente an):

| Phase-Artefakt | Freigabe-Zweck | Zuschnitt |
|---|---|---|
| P3-Artefakt (Anforderungen-Stand) | „P4 Beschreiben der Funktion" | global |
| P4-Artefakt (Funktionsbeschreibung-Stand der Gesamt-Funktionsbeschreibung) | „P5 Zerlegen in Bausteine" | global |
| P5-Artefakt (Architekturdokument aus der Softwaresystemarchitektur mit Schnitt) | „P6/P7" | global |
| P6-Artefakt (Übergabe an Komponente K) | „für den Start von K" | je Komponente |
| P3-Artefakt der Komponente (Anforderungen-Stand mit den eigenen REQ) | „P4 Beschreiben der Funktion der Komponente" | je Komponente |
| P4-Artefakt der Komponente (Funktionsbeschreibung-Stand: Teil-Funktionsbeschreibung, als Provider mit Verweisen auf die CON) | „P5 Zerlegen in Bausteine der Komponente" | je Komponente |
| P5-Artefakt der Komponente (Architekturdokument, darf dünn sein) | „P6/P7" | je Komponente |
| P7-Artefakt der Komponente (Technologie-Entscheidungen) | „P8 Spezifizieren der Komponente" | je Komponente |
| P8-Artefakt der Komponente (Spezifikation-Stand) | „P9 Ausarbeiten der Komponente" | je Komponente |
| Tag der Implementierung der Komponente (Glied P9) | „P10 Testen der Komponente" (Vorbedingung: Tests grün + Code-Review als Kettenprüfung P9, §3); zugleich die **Lieferung** an den Koordinator, gemeldet per Nachricht (`Vorgehen.md` §3a) | je Komponente |
| P10-Artefakt der Komponente (Testplan-Stand der Komponenten-Tests, nach ihrem Tag; der Durchgang wird mit einem Testbericht belegt) | „P10 Testen der Komponente" | je Komponente |
| P11-Artefakt der Komponente (Entwickler-Doku für ihr Bauteil, Vorbedingung ihr Testbericht — damit endet die Kette der Komponente; die Gesamtsicht des Koordinators nimmt sie auf) | „P13 Ausliefern" | je Komponente |
| P10+P13-Aggregat, Teil P10 (Testplan-Stand des Integrationstests; Vorbedingung: alle Lieferungen der Marke gebucht, bei eigenen Bauteilen dazu der eigene Tag — [[Kettenpruefung]] §Freigabe-Ordnung des Koordinators) | „P10 Testen" | global |
| P11-Artefakt (Gesamtsicht der Entwickler-Doku; Vorbedingung der Testbericht des Integrationstests, §3) | „P13 Ausliefern" | global |
| P12-Artefakt (Benutzer-Doku; Vorbedingung der Testbericht des Integrationstests, §3) | „P13 Ausliefern" | global |
| P10+P13-Aggregat, Teil P13 (Deploy-Stand für alle Komponenten seiner §Komponenten-Zeilen; Glied davor ist der Testbericht des Integrationstests, §3; Entwickler-Doku und Benutzer-Doku stehen in der Freigabe-Ordnung vor ihm — fehlt eines, Einschränkung „Doku folgt“) | „P13 Ausliefern" | je Zielumgebung |
| P15-Artefakt (Betriebs-Anleitung; Quell-Stand und Vorbedingung der freigegebene Deploy-Stand der Umgebung) | „P15 Betreiben" | je Zielumgebung |

Das Koordinator-Aggregat P10+P13 benennt nur, welche
Phasen der Koordinator für das Gesamtsystem führt; es
bündelt keine Meilensteine — die Doku-Glieder P11 und
P12 des Koordinators liegen dazwischen und sind wie
jeder Pflicht-Stand eigene Meilenstein-Anlässe
([[Meilenstein-und-T2]]). Zeitpunkt und Form der drei
Doku-Stände entscheidet die Doku-Abfrage je Marke
([[Kettenpruefung]] §Kette, Doku-Abfrage; Einbindung
[[Vorgehen-SP-1]] §2).

Welche dieser Glieder bei einer Komponente der
Übergabe-Stand vertritt (Übernahme-Art Auftrag: P1–P4,
selbstständig: P1) und wann eine Komponente
Benutzer-Doku (P12), P13 mit
eigenem Deploy-Stand und eigenen DEPL und
Betriebs-Anleitung (P15) selbst führt (eigene
Zielumgebung): [[Kettenpruefung]] §Fehlende und
vertretene Glieder — lesen, bevor die Kette einer
Komponente geplant wird. Ihr Abschluss-Stand listet
die Glieder, die sie führt, und geht mit dem
Marken-Abschluss an den Koordinator
([[Katalog-Abschluss-Stand]]).

**P14 „Produzieren"** trägt keine eigene
Standard-Freigabe — bei Standard-Software ist es
weitgehend durch den P13-Deploy-Stand abgedeckt
(§2); RP-11 Cloudanwendung präzisiert P14/P15 später
(dominante Vertragsaspekte, laufender Betrieb).

**Anmerkung Split P3/P4:** Anforderungen sammeln (P3)
und Beschreiben der Funktion (P4) sind zwei getrennte
Phasen mit zwei eigenständigen Freigaben: das
P3-Artefakt „Anforderungs-Register" wird für Zweck „P4
Beschreiben der Funktion" freigegeben, das
P4-Artefakt „Gesamt-Funktionsbeschreibung" für Zweck „P5
Zerlegen in Bausteine" — die Beschreibungs-Arbeit
startet nicht implizit mit der letzten gesammelten
Anforderung, sondern mit der P3-Freigabe.

## 9. Contract-Aushandlung und -Eskalation

**Wo Contracts entstehen.** Dass es eine Schnittstelle
gibt, folgt aus dem Schnitt (Zuschnitt im
Architekturdokument, P5 des Koordinators). Ihren
Inhalt verhandelt die **Provider-Komponente** in ihrer
rekursiven **P4 Beschreiben der Funktion** — Teil
ihrer eigenen Teil-Funktionsbeschreibungs-Arbeit
(index §4, Komponenten-Repositories). Das CON-Element
liegt im **[[Contract-Index]]** des Koordinators; die
Übergabe an eine Komponente (P6) enthält die
angenommenen CON, an denen sie beteiligt ist. Welche
Rolle ein CON je Phase hat und was gilt, wenn der
Übergabe-Stand das P4-Glied der Provider-Komponente
vertritt (Übernahme-Art Auftrag):
[[Katalog-Contract-Index#Rollen eines CON in der Kette]]
— lesen, bevor eine Komponente einen CON verhandelt.

**Verantwortung.** Der **Provider** verantwortet den
Contract und implementiert ihn; welche Komponente
Provider ist, gibt der Anwender frei. Änderungswünsche
gehen dem Provider als Nachricht zu ([[Katalog-message]];
Schreibgrundsatz: `Vorgehen.md` §3a); **er entscheidet**
— ohne Anwender, solange die Aushandlung innerhalb der
freigegebenen Grundlagen bleibt (Delegations-Grenze
unten).

**Freigabe, Meldung, Buchung.**

- Die **Erst-CON** eines Contracts und jede Änderung,
  die eine freigegebene Grundlage berührt, gibt nach
  Empfehlung der **Anwender** frei.
- Einen **Nachfolge-CON** innerhalb der
  Delegations-Grenze gibt der **Provider** selbst frei.
- Jede Freigabe meldet der Provider dem Koordinator
  per Nachricht mit `erwartet: buchung`
  ([[Katalog-message]]); eine Anwender-Freigabe steht
  in dieser Meldung. Der Koordinator bucht das
  CON-Element aus der Meldung mit
  `quelle: <provider>/MSG-NNN` (Buchung, Status,
  Feld `provider:`: `## Meta` von [[Contract-Index]] —
  lesen vor jeder CON-Buchung). Die registrierten
  Consumer werden per Nachricht informiert.
- **CON-ID beim Provider:** Die CON-ID vergibt der
  Koordinator bei der Buchung; der Provider erfährt
  sie aus der Quittung (gebuchter Knoten in `bezug`,
  [[Katalog-message]], Zeile Quittung) und verweist erst
  danach in seinem P4-Stand auf
  `<koordinator>/CON-NNN`.
- **Neuer Nutzer:** Wann eine weitere Komponente oder
  ein externer Nutzer nur als Consumer registriert
  wird, wer zustimmt und bucht, und wann stattdessen
  ein Nachfolge-CON entsteht: `## Meta` von
  [[Contract-Index]], Consumer-Registrierungen — lesen,
  wenn ein weiterer Nutzer dazukommt.

**Eskalation bei Streit — Bericht statt Blockade.**
Akzeptiert ein Consumer die Ablehnung durch den
Provider nicht, entscheidet **der Anwender**; der
Koordinator entscheidet nichts, sondern bereitet vor:

1. Der Koordinator prüft, ob **Gesamt-Funktionsbeschreibung
   (P4)** oder **Schnitt (P5)** die Frage bereits
   beantworten.
2. **Tun sie das:** Er benennt die Stelle als
   Vorschlag; der Anwender bestätigt die Lesart oder
   korrigiert sie.
3. **Tun sie das nicht:** Dann ist der Streit selbst
   Beleg für eine Lücke im Freigegebenen. Der
   Koordinator legt einen **Rücklauf-Vorschlag** vor —
   nach P4, wenn die Funktionsbeschreibung schweigt, nach P5,
   wenn eine Zuständigkeit falsch geschnitten ist
   (siehe §10 Rücklauf-Mechanik).

Nach [[Berichten-statt-Blockieren]] ist das eine
**Warnung mit Entscheidungsoptionen**, keine
Prozess-Blockade: Der Koordinator legt vor, der
Anwender entscheidet über die Weiterarbeit.

**Contract-Wegfall.** Entfällt die Komponente, die
Provider eines Contracts ist, fällt der Contract an den
**Koordinator** zurück: Er setzt den CON außer Kraft
(Status `abgeschlossen`), oder ein neuer Provider
handelt einen Nachfolge-CON aus, der den bisherigen
per `supersedes:` ablöst und den neuen Provider im
Feld `provider:` trägt (`provider:` ändert sich nur
per Nachfolge-CON). Beides ist zugleich ein
Rücklauf nach **P5 Zerlegen in Bausteine**, weil sich
der Schnitt geändert hat.

**Delegations-Grenze zum Anwender.** Nicht jede
Contract-Änderung braucht Anwender-Freigabe. Klar
getrennt:

- **Der Provider entscheidet allein**, solange die
  Aushandlung sich innerhalb der bereits freigegebenen
  Gesamt-Funktionsbeschreibung (P4-Artefakt) und des
  bereits freigegebenen Schnitts (P5-Artefakt)
  bewegt. Typische Fälle: Feld-Namen, Feld-Typen,
  Fehler-Codes, Timeout-Werte, Reihenfolge-Garantien,
  Pagination, Idempotenz-Header sowie
  Contract-Präzisierungen und -Erweiterungen, die die
  Gesamt-Funktionsbeschreibung nicht widersprüchlich
  berühren. Ergebnis ist ein Nachfolge-CON, den der
  Provider freigibt und meldet; der Koordinator bucht
  ihn (oben). Kommt nur ein Nutzer hinzu: oben,
  Neuer Nutzer.
- **Anwender-Freigabe wird nötig**, sobald die
  Aushandlung eine bereits freigegebene Grundlage
  (Gesamt-Funktionsbeschreibung oder Schnitt) verändern müsste. Dann
  greift die Rücklauf-Mechanik in §10 (Rücklauf nach
  P4 bzw. P5, neue Freigabe erforderlich) — nicht mehr
  Aushandlung, sondern Grundlagen-Iteration.
- **Ein Consumer akzeptiert die Ablehnung durch den
  Provider nicht:** Eskalation nach der dreistufigen
  Mechanik oben in diesem §9 (Anwender-Entscheidung →
  Koordinator-Vorprüfung → Rücklauf-Belegfall).

Die Grenze ist automatisch prüfbar (berührt der
Aushandlungs-Vorschlag Text im freigegebenen
Funktionsbeschreibung-Stand oder Architekturdokument?) und damit ein
sauberer Delegations-Fall nach Vorgehen.md §4.
Wächter-Trigger T4 warnt, wenn Aushandlungs-Bezüge auf
nicht-freigegebene Grundlagen zeigen.

## 10. Rücklauf-Mechanik

Ein Rücklauf beginnt **nicht am Anfang**, sondern dort,
wo die Ursache liegt; der Prozess bleibt derselbe, nur
der Eintrittspunkt unterscheidet sich.

### Befund → Eintrittspunkt

Von spät nach früh gelesen — je weiter unten, desto
teurer.

| Befund | Eintrittspunkt (P-Phase) | Wer arbeitet danach |
|---|---|---|
| Zusammengefasster Deploy-Stand oder Testplan fehlerhaft; Code und Spezifikation sind in Ordnung | **P10+P13-Aggregat** des Koordinators | Koordinator |
| Implementierungsfehler; Contract und Spezifikation bleiben gültig | **P9 der Komponente** | betroffene Komponente |
| Testlücke — das Verhalten war nie geprüft; die Spezifikation (automatisierbarer Anteil) bzw. die Funktionsbeschreibung (nicht-automatisierbarer Anteil) ist korrekt | **P9 der Komponente** (automatisierbarer Testfall) bzw. **P10-Testplan** (nicht-automatisierbarer Anteil), siehe §3 Test-Automatisierungs-Regel | betroffene Komponente |
| Contract-Bruch — der Provider hält seinen eigenen Contract nicht ein | **P9 der Komponente**, beim Provider | der Provider |
| Spezifikationsfehler — die Bauanleitung ist lückenhaft oder falsch; Funktionsbeschreibung, Contract und Stack bleiben gültig | **P8 der Komponente** | die betroffene Komponente, mit erneuter Freigabe des P8-Artefakts für Zweck „P9 Ausarbeiten der Komponente" |
| Technischer Fehlgriff — Stack, Bibliothek oder Konfiguration ungeeignet | **P7 der Komponente** | die Komponente, mit erneuter Freigabe des P7-Artefakts für Zweck „P8 Spezifizieren der Komponente" |
| Teil-Funktionsbeschreibung weicht von der Gesamt-Funktionsbeschreibung ab | **P4 der Komponente** | die betroffene Komponente |
| Contract-Lücke — ein Consumer braucht etwas, das nicht im Contract steht | **P4 der Komponente** (Provider verhandelt) | Consumer stellt die Anforderung per Nachricht, Provider handelt einen Nachfolge-CON aus und implementiert ihn |
| Contract inhaltlich falsch — weder Lücke noch Bruch, sondern falsch beschrieben | **P4 der Komponente** | der Provider (Nachfolge-CON) |
| Startprompt fehlerhaft — falsche Rolle, Übernahme-Art oder Lage, falscher Verweis auf den Übergabe-Stand | **P6 Starten von Teilaktivitäten** | Koordinator |
| Komponentenschnitt falsch — eine Zuständigkeit liegt an der falschen Stelle | **P5 Zerlegen in Bausteine** | Koordinator; es entstehen neue Startprompts (erneut P6) |
| Gesamt-Funktionsbeschreibung lückenhaft, widersprüchlich oder von außen überholt; Anforderungen und Teil-Funktionsbeschreibungen sind korrekt | **P4** (Gesamt-Funktionsbeschreibung des Koordinators) | Koordinator; danach erneute Freigabe des P4-Artefakts für Zweck P5, für betroffene Komponenten erneut ab deren P4 |
| Anforderung fehlt oder ist falsch | **P3 Anforderungen sammeln** | Koordinator, danach die volle Kette |

„P4 der Komponente“ und „P9 der Komponente“ meinen
das Glied, das die Komponente selbst führt. Vertritt
der Übergabe-Stand das Glied (Übernahme-Art Auftrag),
liegt der Eintrittspunkt beim Koordinator: Ein neuer
CON oder eine Änderung über den Übergabe-Stand hinaus
ist ein Rücklauf an ihn ([[Kettenpruefung]] §Fehlende
und vertretene Glieder;
[[Katalog-Contract-Index#Rollen eines CON in der Kette]]).

### Vier Rücklauf-Regeln

- **Der Koordinator schlägt den Eintrittspunkt vor**,
  begründet ihn und legt ihn dem Anwender vor. Die Wahl
  ist eine Umfangsentscheidung und gehört dem Anwender.
- **Alle Freigaben ab dem Eintrittspunkt sind erneut
  einzuholen** — nur für die betroffenen Komponenten
  und nur, soweit sie inhaltlich berührt sind. Eine
  Lücke in der Gesamt-Funktionsbeschreibung muss den Schnitt
  nicht berühren; dann bleibt die P5-Freigabe
  unangetastet.
- **Ein Rücklauf springt nie hinter seinen
  Eintrittspunkt zurück.** Wer bei P9 wieder einsetzt,
  öffnet nicht die Spezifikation.
- **Betrifft ein Rücklauf mehrere Komponenten**,
  meldet der Koordinator ihn allen betroffenen per
  Nachricht (Lese-Hinweis `art: ruecklauf`; Wirkung
  auf ihre Stände: [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art). Den
  Gesamtstand pflegt er nicht nach; er ist eine
  abgeleitete Sicht ([[devstate-Skelett]]).

**Im Zweifel gilt der frühere Eintrittspunkt.** Ein
Implementierungsfehler, der sich als
Spezifikationslücke entpuppt, kostet an P9 doppelt:
einmal die Reparatur, einmal die spätere Wiederholung.

### Wann der Rücklaufapparat greift

Maßgeblich ist die **Freigabe**: Vor der Freigabe eines
Artefakts ist die Aushandlung normaler Verkehr — die
Beteiligten klären das untereinander (§9
Contract-Aushandlung und -Eskalation), ohne
Eintrittspunkt und ohne Vorlage. Nach der Freigabe ist
jede Änderung daran ein Rücklauf mit Eintrittspunkt und
erneuter Freigabe.

**[[Berichten-statt-Blockieren]].** Der
Rücklauf-Mechanismus ist eine **Warnung mit
Entscheidungsoptionen**, keine Prozess-Blockade. Der
Koordinator legt den vorgeschlagenen Eintrittspunkt mit
Begründung und den Folgen (welche Freigaben erneut
fällig werden, welche Komponenten betroffen sind) vor;
der Anwender entscheidet, ob sofort zum Eintrittspunkt
zurückgegangen wird, ob explorativ weitergearbeitet
wird, oder ob der Befund anders eingeordnet gehört.

## 11. Zug in RP-1

Ein **Zug** ist eine thematisch abgeschlossene Einheit
aus mehreren Arbeitsschritten (Commit-Kadenz:
MasterPrompt §6.1); jeder Prozess präzisiert, was ein
Zug in ihm typisch ist. Für RP-1
(Software-System-Entwicklung) umfasst ein Zug
typischerweise:

- **Feature implementiert** — eine User-Story / ein
  Use-Case ist in Code umgesetzt, Unit-Tests dafür sind
  geschrieben, alles committet.
- **Bug gefixt** — ein `bug-report`-Register-Eintrag
  ist behoben (Fix implementiert, Regressionstest
  ergänzt, Status auf `umgesetzt`).
- **Komponenten-Init durchgeführt** — für eine neue
  Komponente ist die Start-Tabelle freigegeben, das
  Template-Instanz-Repository aufgesetzt, der
  Startprompt in `output/` abgelegt und die erste Runde
  im Komponenten-Repo gelaufen (§2 Anmerkung P6).
- **Contract-Update umgesetzt** — ein Nachfolge-CON ist
  gebucht (nach §9 Contract-Aushandlung), der Provider
  hat die Implementierung angepasst, die registrierten
  Consumer haben die Nachricht erhalten.
- **Lieferung gemeldet bzw. gebucht** — die Komponente
  hat ihren Tag (P9) oder ihren Marken-Abschluss per
  Nachricht gemeldet; beim Koordinator ist die Meldung
  am Marken-Eintrag gebucht und quittiert
  (`Vorgehen.md` §3a).
- **Testrunde abgeschlossen** — eine automatisierte
  Test-Suite läuft (Ergebnis in Commit-Message nach
  MasterPrompt §6.1), oder ein Testdurchgang nach dem
  freigegebenen Testplan-Stand ist als Testbericht
  (TRES, [[Testberichte]]) gebucht.
- **Freigabe erwirkt** — ein zweck-gebundener
  Freigabe-DEC-Eintrag ist gebucht (typisch nach einer
  P-Phase mit Freigabe-Zweck an die nächste, §8).
- **Rücklauf-Iteration** — ein Rücklauf nach §10
  Rücklauf-Mechanik ist mit einer neuen Freigabe des
  betroffenen P-Phase-Artefakts abgeschlossen.
- **Contract-Streit-Entscheidung** — eine Eskalation
  nach §9 ist mit Anwender-Entscheidung und ggf.
  Rücklauf abgeschlossen.

Nicht erschöpfend — was ein Zug in einem konkreten
Projekt heißt, ergibt sich aus der Praxis. Regel
bleibt: ein Zug ist eine **thematisch abgeschlossene
Einheit**, kein einzelner Arbeitsschritt.

## 12. Sprach-Regel für Software-Artefakte

Für RP-1 gilt eine **Drei-Zonen-Sprach-Regel**:
Englisch intern, i18n an der Endanwender-Schnittstelle,
Benutzer-Doku projekt-primär Deutsch.

**Zone 1 — Software-intern immer Englisch**, unabhängig
von der Projekt-Doku-Sprache: Quellcode (Variablen-,
Funktions-, Klassen-, Datei- und Modul-Namen),
Kommentare im Code, Docstrings/Doku-Kommentare (und die
daraus generierte API-Doku), Log-, Debug- und interne
Fehler-Ausgaben, automatisierte Test-Namen und
-Beschreibungen, Namensräume für Code-Konstrukte
(Datenbank-Schema, Config-Schlüssel,
Environment-Variablen, API-Feldnamen,
Message-Queue-Topics, CI-Job-Namen) sowie
CLI-Parameter-Namen (`--config`, nicht
`--konfiguration`). **Zur Zone 1 gehören
ausdrücklich auch Schemata und maschinenlesbare
Definitionen** — JSON-, DB- und API-Schemata,
Konfigurationsdateien, Migrations-Skripte,
Infrastruktur-Definitionen: alles, was von
Werkzeugen gelesen wird, ist Code, keine Doku.

**Zone 2 — Endanwender-Schnittstelle mit i18n:**
nutzersichtbare Programmtexte (UI-Beschriftungen,
Nutzer-Fehlermeldungen, System-Benachrichtigungen,
E-Mail-Templates, Report-Ausgaben) werden
i18n-vorbereitet mit **Deutsch und Englisch** als
Standard-Locales; weitere Zielsprachen nur mit
expliziter Anwender-Freigabe je Sprache. Interne Fehler
werden per Exception mit englischer technischer Meldung
geworfen; eine **i18n-Fehler-Schicht** (zentraler
Exception-Handler / Message-Mapper) erzeugt daraus die
nutzersichtbare Meldung in der Sprache des Anwenders —
Log-Meldung (Englisch) und User-Meldung (i18n) bleiben
getrennt. Ist i18n technisch nicht möglich
(Legacy-Bibliothek, Umgebungs-Einschränkung):
Rückfrage beim Anwender, welche eine Sprache verwendet
wird. CLI-Ausgabe primär Englisch; `--help`/`--usage`
und andere User-adressierte Texte auf Deutsch oder
anderer Locale nach Aufforderung.

**Zone 3 — Benutzer-Doku projekt-primär Deutsch:**
die Benutzer-Doku ([[Katalog-Benutzer-Doku]]; vormals
„Anwender-Doku“ — „Anwender“ ist im Template die
Person, die mit dem Agenten arbeitet, [[Glossar]]),
README-für-Endnutzer erstmal Deutsch (bei DE-primärem
Projekt); weitere Sprachen auf explizite Aufforderung.
Auch der **Testplan** (für menschliche Tester) gehört
zu dieser Zone und ist damit Deutsch — kein
automatisierter Testcode. Die **Entwickler-Doku**
([[Katalog-Entwickler-Doku]]) liegt zwischen den Zonen:
ihr erklärender Text (Aufbau, Entscheidungen,
Einstieg, Build) steht in der Projektsprache, die aus
Docstrings erzeugte API-Doku ist Zone 1 und Teil der
Entwickler-Doku.

**Abgrenzung:** die Commit-Message-Sprache regelt
MasterPrompt §6.2 (Optionen A/B/C, beim Init
festgelegt) — die Sprach-Regel hier betrifft Code und
Artefakte, nicht Commits.

## 13. Bezüge

- Basis-Grundlage: `Vorgehen.md` (Basisrahmen-Root —
  Grundhaltung, Freigabe-Regel §4, Wächter-Trigger T4
  §5, Scaffolding-Baustein §7a).
- SP-1-Vorgehen (direkte Erbschaft):
  [[Vorgehen-SP-1]].
- Prozess-Definition:
  `_template/referenzprozesse/RP-1-Systementwicklung/Steckbrief.md`
  und `index.md` (ebenda; beide bleiben in der
  Template-Quelle und werden nicht ins Wiki gemergt).
- Commit-Kadenz, Werkzeug-Kadenz-Bericht,
  Präfix-Tabelle: MasterPrompt §6.
- Basis-Knoten: [[Berichten-statt-Blockieren]].
