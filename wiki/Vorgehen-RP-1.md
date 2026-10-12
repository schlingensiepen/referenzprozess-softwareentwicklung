---
type: process-procedure
process: RP-1
extends: [SP-1]
---

# RP-1 — Vorgehen (Softwaresystem-Entwicklung)

**Stand:** 2026-08-24

Adaptiert das SP-1-Vorgehen ([[Vorgehen-SP-1]]) für die
Entwicklung eines Softwaresystems.

## 1. Erbschaft

RP-1 erbt vollständig von SP-1 und präzisiert für
Softwaresysteme. Die Kern-Regeln (Grundhaltung,
Ergebnis-Artefakt-Regel, Zweck-Freigaben,
Wächter-Trigger T4, Rekursions-Muster) gelten
unverändert aus der Basis-Vorgehen-Datei
(`Vorgehen.md`).

Alle zwölf SP-1-Phasen bleiben bestehen — RP-1 belegt
sie mit Software-spezifischen Artefakten und Namen und
fügt einige Automatisierungs-Regeln hinzu, die
Software-typisch sind.

## 2. Phasen mit RP-1-Präzisierungen

| # | Phase (SP-1) | RP-1-Artefakt / Präzisierung |
|---|---|---|
| P1 | Konzipieren | Konzept plus User-Stories und Use-Cases (RP-1-Detail-Typen mit `rollen:`-Feld, index §3.2) |
| P2 | Stand der Technik erfassen | Stand-der-Technik-Bericht — Referenzarchitekturen (R4), verfügbare Bibliotheken/Frameworks, Standards (R5) |
| P3 | Anforderungen sammeln | `Anforderungen.md` (SP-1-Fassade `requirement-log`) — User-Stories und Use-Cases fließen als Anforderungs-Quellen ein |
| P4 | Spezifizieren der Funktion | Gesamtspezifikation als Wiki-Knoten mit `output/`-Freigabeständen (Spezifikationskette, index §4) |
| P5 | Zerlegen in Bausteine | `Softwaresystemarchitektur.md` (RP-1-Ablösung von SP-1-`Systemarchitektur.md`) mit Komponenten-Schnitt und Contract-Übersicht; **Architekturmuster explizit als Sub-Wahl** (z.B. MVC, Hexagonal, Layered, Microservices — V4 der Scaffolding-Kette) |
| P6 | Starten von Teilaktivitäten | Contract-Index + Komponenten-Repositories als Template-Instanzen (index §4); jeder Komponent durchläuft eigenes RP-1 |
| P7 | Auswählen der Technologie | Technologie-Stack-Entscheidungen (R6 Passende Technologien, R7 Best Practices, R8 Sicherheitslage, R11 Lizenz); **mehrere Sprachen möglich, Runtime-Version explizit** (V3); Werkzeugkette siehe Anmerkung unten (V5) |
| P8 | Ausarbeiten | **Implementierung inkl. Unit-Tests und automatisierten Integrationstests** (siehe §3 Test-Automatisierungs-Regel) |
| P9 | Testen | **Testplan mit nicht-automatisierbaren Anteilen** (manuelle Integrationstests + Anwender-Tests) + Testberichte |
| P10 | Ausliefern | **Deploy-Dokument** in `output/` mit `_VV_TLA` (index §4) + Startprompts; **CI-Pipeline-Konfiguration** (V6a — Deploy-Zielumgebung ist hier verankert) |
| P11 | Produzieren | Bereitstellen und Konfigurieren der Ziel-Umgebung — bei Standard-Software oft weitgehend durch P10-Rückverweis (Deploy-Dokument) abgedeckt; bei RP-11 Cloudanwendung eigener Substanz-Bereich (Vertragsaspekte, laufender Betrieb); CI-/Deploy-Feinheiten aus V6a greifen hier |
| P12 | Betreiben | Betriebs-Handbuch + laufende `bug-report`-Ingestion; Fehlerbilder-Recherche R10 aktiv |

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
automatisierbaren Anteile wandern aus P9 Testen in P8
Ausarbeiten.

**Konkret:**

- **Unit-Tests:** entstehen in P8 als Teil der
  Implementierung. Bleiben nicht als eigenständige
  P9-Artefakte in der Test-Doku, weil sie mit dem Code
  leben.
- **Automatisierte Integrationstests:** entstehen in P8
  als Teil der Implementierung. Ergebnis: automatische
  Test-Suite mit Test-Report als P8-Beiwerk.
- **Nicht-automatisierbare Integrationstests:** landen
  im P9-Testplan (manuelle Prüfungen, Cross-Component-
  Szenarien, die Instrumentierung außerhalb der
  Software-Umgebung erfordern).
- **Anwender-Tests / Akzeptanztests:** landen im
  P9-Testplan.

**Folge:** Der P9-Testplan ist kein „umfassender
Testkatalog", sondern der **Rest** nach Automatisierung.
Er enthält typischerweise:

- Manuelle Integrations- oder System-Tests
- Anwender-Akzeptanztests
- Performance-/Last-Tests (falls nicht automatisiert)
- Sicherheits-Tests (falls nicht automatisiert)

**Freigabe-Kette:** P8-Artefakt (Implementierung) ist
freigegeben „für P9 Testen" (Buchung in der
kanonischen Formel, Vorgehen.md §4: „Stand x von
⟨Artefakt⟩, freigegeben für Zweck Z [zu Marke M]")
wenn **beide** Nachweise vorliegen:

- **(a) Regressions-Sicherheit** — Unit-Tests grün und
  automatisierte Integrationstests grün. Automatisch
  prüfbare Vorbedingung — der Agent kann die Prüfung
  nach der Delegations-Regel (Vorgehen.md §4) an sich
  selbst delegieren, wenn der Anwender die
  Standing-Freigabe erteilt hat oder pro Freigabe
  zustimmt.
- **(b) Anforderungs-Deckung** — mindestens ein
  Prüf-Subagent nach dem Basis-Prüfangebot
  (MasterPrompt §5.6) hat die Implementierung gegen die
  Gesamtspezifikation geprüft (Standard-Prüfprompt:
  Auftrag, Vorgehen mit Beispiel, Widersprüche/Lücken/
  Mehrdeutigkeiten; Zwei-Modelle-Regel bei
  substantieller Prüfung). Substantielle Prüfung mit
  inhaltlichem Urteil — nicht automatisch delegierbar.

Beide Nachweise werden in den Freigabe-DEC-Eintrag
eingetragen (Feld „Prüfer" — automatisierte Test-Suite
als Selbst-Prüfer, Prüf-Subagent als zweiter
unabhängiger Prüfer). Automatische Tests allein reichen
nicht — sie prüfen „läuft der Code"
(Regressions-Sicherheit), nicht „tut der Code was die
Spezifikation verlangt" (Anforderungs-Deckung).

Analog P9-Artefakt (Testbericht mit manuellen
Test-Ergebnissen) ist freigegeben „für P10 Ausliefern"
wenn (a) alle nicht-automatisierten Tests aus dem
Testplan bestanden UND (b) ein Prüf-Subagent den
Testbericht gegen die Spezifikation geprüft hat.

**Rollen bei Integrationstest-Befunden (P9):**

- **Reproduziert wird beim Koordinator.** Nur er hat
  den lauffähigen Gesamtaufbau (Integrationstests,
  Deployment-Automatisierung des Gesamtsystems). Ein
  Komponenten-Agent hat nur seine eigene Komponente und
  kann einen Integrationstest-Befund nicht selbst
  nachvollziehen.
- Der Koordinator gibt der betroffenen Komponente mit,
  was sie zur Eingrenzung braucht: **Testfall,
  Protokolle, beobachtetes gegen erwartetes Verhalten.**
  Erst damit ist eine Meldung im Komponenten-Repository
  bearbeitbar.
- **Ein Contract-Bruch erzeugt eine Meldung beim
  Provider**, nicht zusätzlich beim Consumer — der
  Contract gehört dem Provider (siehe §9
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
  Trennung zur Freigabe-Frage: **Freigabe „für P9
  Testen"** verlangt weiterhin grüne Tests als
  Vorbedingung nach der Freigabe-Kette oben (a) — das
  ist Freigabe-Frage, nicht Kadenz-Frage.
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
| R | **R9** Betriebs- und Deploypraxis der Zielumgebung | P10 Ausliefern | vor Deploy-Erstellung |
| R | **R10** Fehlerbilder der eingesetzten Version | P12 Betreiben | laufend, insbesondere nach neuen Releases |
| M | **Vierte Frage: Technologieagnostik** — Spezifikation frei von Technologie-Vorannahmen? | P4 Spezifizieren der Funktion | vor Freigabe |
| M | **Hochwertiger Prüfer, mehrere Runden** — Spezifikations-Fehler kaskadieren | P4 Spezifizieren der Funktion | vor Freigabe |
| M | **Querprüfung:** jede Anforderung mindestens einer Komponente zugeordnet? | P5 Zerlegen in Bausteine | vor Freigabe |
| M | Prüfung, dass **Startprompts der Komponenten-Repositories** ohne Rückfrage ausreichen | P6 Starten von Teilaktivitäten | vor Freigabe |
| M | Prüfung gegen Teil- und Gesamtspezifikation (kein Widerspruch, kein ungewollter Lock-in) | P7 Auswählen der Technologie | vor Freigabe |
| M | **Anforderungs-Vollerfassung Stufe 2 vollständig** (§2 Anmerkung P3) — oder Negativ-Entscheidung „Verzicht auf Stufe 2" im Projekt-Repo vorhanden; Warnung nach [[Berichten-statt-Blockieren]], keine harte Blockade | Übergang P7 → P8 | vor Fachlogik-Start |
| M | **Querprüfung durch Koordinator** — Konsistenz zwischen den Teilspezifikationen | P8 Ausarbeiten (Teilspezifikationen) | vor Freigabe |
| M | **Spezialisiertes Modell, nicht das implementierende** — vermeidet Selbst-Bestätigung | P8 Ausarbeiten (Implementierung) | bei der Prüfung |
| M | **„Kann ein Fremder ausführen?"** — Deploy und Startprompts als selbstständige Anleitung | P10 Ausliefern | vor Freigabe |
| V | **V2**-Präzisierung: Anforderungsskizze Stufe 1, nur setup-relevant (§2 Anmerkung P3) | P3 Anforderungen sammeln | vor Scaffolding-Commit |
| V | **V3**-Präzisierung: mehrere Sprachen möglich, Runtime-Version explizit | P7 Auswählen der Technologie | Wurzelentscheidung |
| V | **V4**-Präzisierung: Architekturmuster explizit als Sub-Wahl (MVC, Hexagonal, Layered, Microservices) | P5 Zerlegen in Bausteine | mit Architektur-Entscheidung |
| V | **V5**-Präzisierung: Werkzeugketten-Liste (§2 Anmerkung P7) | P7 Auswählen der Technologie | nach V3 |
| V | **V6a**-Präzisierung: CI-Pipeline-Konfiguration, Deploy-Zielumgebung | P10 Ausliefern · P11 Produzieren | mit Deploy-Entscheidungen |

(V1 und V6b sind Basis-Angelegenheit — siehe
Vorgehen.md §7a.)

## 5. Prüfungs-Präzisierungen

**In der §4-Tabelle konsolidiert (Typ M)** — dort die
Software-typischen Zusatz-Anforderungen zur
SP-1-Basis-Prüfung (Standard-Zwei-Modelle-Regel +
Selbst-Triage E/F/A + Reifekriterium).

## 6. Freigabe-Rücknahme (RP-1-Präzisierung)

Bei kritischen Artefakten macht RP-1 die formale
Rücknahme zur Pflicht:

- **Contracts:** jede Änderung an einem Contract nach
  Freigabe erfordert **explizites Rücknahme-DEC** und
  Neu-Freigabe. Grund: Contract-Änderungen betreffen
  andere Komponenten, die den Contract als Grundlage
  genommen haben.
- **Gesamtspezifikation nach P4-Freigabe:** analog
  Rücknahme-DEC bei substantieller Änderung.
- **Andere Artefakte:** SP-1-Grundsatz (implizite
  Rücknahme + Meldung) reicht.

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
   seine Integrationstests baut (P9+P10-Aggregat, siehe
   §8); ein früherer Aufbau zusammen mit den übrigen
   beim Koordinator verbleibenden
   Technikentscheidungen aus Schritt 4 ist zulässig.
6. **Die Deployment- und Zielumgebungs-Entscheidung**
   bleibt beim **Koordinator** — er baut die
   Deployment-Automatisierung des Gesamtsystems (P10
   Ausliefern, Deploy-Dokument in `output/`); die
   Komponenten liefern ihre Teile zu.
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
Zweck-Freigaben in RP-1:

| Phase-Artefakt | Freigabe-Zweck | Zuschnitt |
|---|---|---|
| P3-Artefakt (Anforderungs-Register) | „P4 Spezifizieren der Funktion" | global |
| P4-Artefakt (Gesamtspezifikation) | „P5 Zerlegen in Bausteine" | global |
| P5-Artefakt (Softwaresystemarchitektur mit Schnitt und Contract-Übersicht) | „P6 Starten von Teilaktivitäten" | global |
| P4-Artefakt der Komponente (rekursiv: Teilspezifikation + Contracts) | „P7 Auswählen der Technologie der Komponente" | je Komponente |
| P7-Artefakt der Komponente (technischer Stack) | „P8 Ausarbeiten der Komponente" | je Komponente |
| P8-Artefakt der Komponente (Implementierung) | „P9 Testen der Komponente" (zweistufig: Regressions-Sicherheit + Anforderungs-Deckung, §3) | je Komponente |
| P9+P10-Aggregat (Testplan/Testbericht + Deploy-Dokument) | „Integrationstest des Gesamtsystems" bzw. „P12 Betreiben" | global |

**P11 „Produzieren"** trägt keine eigene
Standard-Freigabe — bei Standard-Software ist es
weitgehend durch das P10-Deploy-Dokument abgedeckt
(§2); RP-11 Cloudanwendung präzisiert P11/P12 später
(dominante Vertragsaspekte, laufender Betrieb).

**Anmerkung Split P3/P4:** Anforderungen sammeln (P3)
und Spezifizieren der Funktion (P4) sind zwei getrennte
Phasen mit zwei eigenständigen Freigaben: das
P3-Artefakt „Anforderungs-Register" wird für Zweck „P4
Spezifizieren der Funktion" freigegeben, das
P4-Artefakt „Gesamtspezifikation" für Zweck „P5
Zerlegen in Bausteine" — die Spezifikations-Arbeit
startet nicht implizit mit der letzten gesammelten
Anforderung, sondern mit der P3-Freigabe.

## 9. Contract-Aushandlung und -Eskalation

**Wo Contracts entstehen.** Ein Contract wird im Rahmen
der rekursiven **P4 Spezifizieren der Funktion** der
jeweiligen Komponente (Provider) verhandelt — Teil
ihrer eigenen Teilspezifikations-Arbeit (index §4,
Komponenten-Repositories). Der **[[Contract-Index]]**
selbst liegt beim Koordinator in **P6 Starten von
Teilaktivitäten**.

**Aushandlung ohne Anwender.** Solange Provider und
Consumer sich innerhalb der freigegebenen
Gesamtspezifikation (P4-Artefakt des Koordinators) und
des freigegebenen Schnitts (P5-Artefakt) bewegen,
handeln sie Contract-Anforderungen selbst aus.

**Eskalation bei Streit — Bericht statt Blockade.**
Einigen sich Provider und Consumer nicht, entscheidet
**der Anwender**; der Koordinator entscheidet nichts,
sondern bereitet vor:

1. Der Koordinator prüft, ob **Gesamtspezifikation
   (P4)** oder **Schnitt (P5)** die Frage bereits
   beantworten.
2. **Tun sie das:** Er benennt die Stelle als
   Vorschlag; der Anwender bestätigt die Lesart oder
   korrigiert sie.
3. **Tun sie das nicht:** Dann ist der Streit selbst
   Beleg für eine Lücke im Freigegebenen. Der
   Koordinator legt einen **Rücklauf-Vorschlag** vor —
   nach P4, wenn die Spezifikation schweigt, nach P5,
   wenn eine Zuständigkeit falsch geschnitten ist
   (siehe §10 Rücklauf-Mechanik).

Nach [[Berichten-statt-Blockieren]] ist das eine
**Warnung mit Entscheidungsoptionen**, keine
Prozess-Blockade: Der Koordinator legt vor, der
Anwender entscheidet über die Weiterarbeit.

**Contract-Wegfall.** Entfällt die Komponente, die
Provider eines Contracts ist, fällt der Contract an den
**Koordinator** zurück: Er markiert ihn im
Contract-Index als entfallen oder weist ihn einem neuen
Provider zu. Beides ist zugleich ein Rücklauf nach
**P5 Zerlegen in Bausteine**, weil sich der Schnitt
geändert hat.

**Delegations-Grenze zum Anwender.** Nicht jede
Contract-Änderung braucht Anwender-Freigabe. Klar
getrennt:

- **Provider ↔ Consumer handeln selbst aus**, solange
  die Aushandlung sich innerhalb der bereits
  freigegebenen Gesamtspezifikation (P4-Artefakt) und
  des bereits freigegebenen Schnitts (P5-Artefakt mit
  Contract-Index) bewegt. Typische Fälle: Feld-Namen,
  Feld-Typen, Fehler-Codes, Timeout-Werte, Reihenfolge-
  Garantien, Pagination, Idempotenz-Header sowie
  Contract-Präzisierungen und -Erweiterungen, die die
  Gesamtspez nicht widersprüchlich berühren.
  Contract-Version wird gemeinsam gebucht (Provider und
  Consumer als Prüfer im Freigabe-DEC-Eintrag), der
  Koordinator wird via Contract-Index-Update
  informiert.
- **Anwender-Freigabe wird nötig**, sobald die
  Aushandlung eine bereits freigegebene Grundlage
  (Gesamtspez oder Schnitt) verändern müsste. Dann
  greift die Rücklauf-Mechanik in §10 (Rücklauf nach
  P4 bzw. P5, neue Freigabe erforderlich) — nicht mehr
  Aushandlung, sondern Grundlagen-Iteration.
- **Provider und Consumer werden sich nicht einig:**
  Eskalation nach der dreistufigen Mechanik oben in
  diesem §9 (Anwender-Entscheidung →
  Koordinator-Vorprüfung → Rücklauf-Belegfall).

Die Grenze ist automatisch prüfbar (berührt der
Aushandlungs-Vorschlag Text im freigegebenen
Gesamtspez- oder Schnitt-Artefakt?) und damit ein
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
| Zusammengefasste Deployanweisung oder Testplan fehlerhaft; Code und Spezifikation sind in Ordnung | **P9+P10-Aggregat** des Koordinators | Koordinator |
| Implementierungsfehler; Contract und Spezifikation bleiben gültig | **P8 der Komponente** | betroffene Komponente |
| Testlücke — das Verhalten war nie geprüft, die Spezifikation ist korrekt | **P8 der Komponente** (automatisierbarer Testfall) bzw. **P9-Testplan** (nicht-automatisierbarer Anteil), siehe §3 Test-Automatisierungs-Regel | betroffene Komponente |
| Contract-Bruch — der Provider hält seinen eigenen Contract nicht ein | **P8 der Komponente**, beim Provider | der Provider |
| Technischer Fehlgriff — Stack, Bibliothek oder Konfiguration ungeeignet | **P7 der Komponente** | die Komponente, mit erneuter Freigabe des P7-Artefakts für Zweck „P8 Ausarbeiten der Komponente" |
| Teilspezifikation weicht von der Gesamtspezifikation ab | **P4 der Komponente** | die betroffene Komponente |
| Contract-Lücke — ein Consumer braucht etwas, das nicht im Contract steht | **P4 der Komponente** (Provider verhandelt) | Consumer stellt die Anforderung, Provider ändert und implementiert |
| Contract inhaltlich falsch — weder Lücke noch Bruch, sondern falsch beschrieben | **P4 der Komponente** | der Provider |
| Startprompt fehlerhaft — falscher Zuständigkeitssatz oder falsche Fundorte | **P6 Starten von Teilaktivitäten** | Koordinator |
| Komponentenschnitt falsch — eine Zuständigkeit liegt an der falschen Stelle | **P5 Zerlegen in Bausteine** | Koordinator; es entstehen neue Startprompts (erneut P6) |
| Gesamtspezifikation lückenhaft, widersprüchlich oder von außen überholt; Anforderungen und Teilspezifikationen sind korrekt | **P4** (Gesamtspezifikation des Koordinators) | Koordinator; danach erneute Freigabe des P4-Artefakts für Zweck P5, für betroffene Komponenten erneut ab deren P4 |
| Anforderung fehlt oder ist falsch | **P3 Anforderungen sammeln** | Koordinator, danach die volle Kette |

### Vier Rücklauf-Regeln

- **Der Koordinator schlägt den Eintrittspunkt vor**,
  begründet ihn und legt ihn dem Anwender vor. Die Wahl
  ist eine Umfangsentscheidung und gehört dem Anwender.
- **Alle Freigaben ab dem Eintrittspunkt sind erneut
  einzuholen** — nur für die betroffenen Komponenten
  und nur, soweit sie inhaltlich berührt sind. Eine
  Lücke in der Gesamtspezifikation muss den Schnitt
  nicht berühren; dann bleibt die P5-Freigabe
  unangetastet.
- **Ein Rücklauf springt nie hinter seinen
  Eintrittspunkt zurück.** Wer bei P8 wieder einsetzt,
  öffnet nicht die Spezifikation.
- **Betrifft ein Rücklauf mehrere Komponenten**,
  benachrichtigt der Koordinator alle betroffenen und
  hält den Gesamtstand nach.

**Im Zweifel gilt der frühere Eintrittspunkt.** Ein
Implementierungsfehler, der sich als
Spezifikationslücke entpuppt, kostet an P8 doppelt:
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
  Komponente ist das Template-Instanz-Repository
  aufgesetzt, Startprompt gebucht, erste P1–P4-Runde
  im Komponenten-Repo gelaufen.
- **Contract-Update umgesetzt** — ein Contract im
  Contract-Index ist geändert (nach §9
  Contract-Aushandlung), Provider hat Implementierung
  angepasst, Consumer sind benachrichtigt.
- **Testrunde abgeschlossen** — eine automatisierte
  Test-Suite läuft (Ergebnis in Commit-Message nach
  MasterPrompt §6.1), oder eine manuelle Testrunde nach
  P9-Testplan ist mit Bericht dokumentiert.
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
Anwender-Doku projekt-primär Deutsch.

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

**Zone 3 — Anwender-Doku projekt-primär Deutsch:**
Benutzerhandbuch, Anwender-Dokumentation,
README-für-Endnutzer erstmal Deutsch (bei DE-primärem
Projekt); weitere Sprachen auf explizite Aufforderung.
Auch der **Testplan** (für menschliche Tester) ist
Anwender-Doku und damit Deutsch — kein automatisierter
Testcode.

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
- Prozess-Definition: [[Steckbrief]] und index
  (`_template/referenzprozesse/RP-1-Systementwicklung/index.md`).
- Commit-Kadenz, Werkzeug-Kadenz-Bericht,
  Präfix-Tabelle: MasterPrompt §6.
- Basis-Knoten: [[Berichten-statt-Blockieren]].
