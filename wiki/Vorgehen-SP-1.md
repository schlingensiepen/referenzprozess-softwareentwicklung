---
type: process-procedure
process: SP-1
extends: []
---

# SP-1 — Vorgehen

**Stand:** 2026-08-24

## 1. Erbschaft

SP-1 übernimmt den Basis-Vorgehensrahmen unverändert
(Phasen-als-Angebot-Grundhaltung, Ergebnis-Artefakt-
Regel, Zweck-Freigaben, Wächter-Trigger T4,
Rekursions-Muster). Regel-Details siehe
`Vorgehen.md` §1–§7.

SP-1 belegt die zwölf generischen Basis-Phasen mit
konkreten Artefakten und bindet R-Themen und
Prüfungen an konkrete Phasen. Kein
Weglassen, kein Umbenennen, kein Hinzufügen von
Phasen — die Standard-Belegung passt für allgemeine
Entwicklungsprojekte.

## 2. Phasen mit SP-1-Artefakten

| # | Phase | Ergebnis-Artefakt (SP-1) |
|---|---|---|
| P1 | Konzipieren | Konzept-Dokument (baut auf `Mission Statement.md` auf) |
| P2 | Stand der Technik erfassen | Stand-der-Technik-Bericht mit `rechercheartefakt`-Verweisen |
| P3 | Anforderungen sammeln | `Anforderungen.md`-Register (`requirement-log`) |
| P4 | Spezifizieren der Funktion | Gesamtspezifikation |
| P5 | Zerlegen in Bausteine | `Systemarchitektur.md` (`system-architecture-overview`) |
| P6 | Starten von Teilaktivitäten | Teil-Register in `Systemarchitektur.md` (Bausteine als Verweise) |
| P7 | Auswählen der Technologie | Technologie-DEC(s) im Basis-Entscheidungs-Register |
| P8 | Ausarbeiten | (prozess-spezifisch — RPs präzisieren; SP-1-generisch: Umsetzung) |
| P9 | Testen | `Systemtest-Setup.md` (`system-test-setup`) + Testberichte |
| P10 | Ausliefern | Auslieferungsbeschreibung (in `output/` mit `_VV_TLA`) |
| P11 | Produzieren | Produktions-Plan + Produktions-Beschreibung (prozess-spezifisch — RPs präzisieren) |
| P12 | Betreiben | Betriebs-Plan + Betriebs-Beschreibung (`bug-report`-Rückfluss ins Register) |

**Anmerkung P8:** die Ausarbeitung ist domänen-abhängig
— Software-RP-1 präzisiert zu „Implementierung inkl.
Unit-Tests und automatisierten Integrationstests";
Hardware-RP-10 zu „Prototyp bauen"; Publikations-SP-3
zu „Ausformulieren der Kapitel"; etc. SP-1 gibt hier
keinen generischen Namen jenseits von „Ausarbeiten".

**Anmerkung P6 (Rekursion):** die Bausteine im Teil-
Register sind Verweise auf Teil-Systeme, die ihrerseits
den Vorgehensrahmen anwenden — Rekursion über
Prozess-Teil-Wikis (Wiki.md §11). RP-1 präzisiert das
für Software zu Komponenten-Repositories.

## 3. Angebote an Phasen (R / M / V)

Alle phasen-gebundenen Angebote in **einer** Tabelle:
**R** = Recherche-Thema (Prüf- und Rechercheangebot,
MasterPrompt §5.6), **M** = Prüf-/Review-Muster
(`Reviewmuster.md`), **V** = Scaffolding-Vorlage (§4a).
Die Kataloge bleiben in ihren Wurzel-Dateien; diese
Tabelle ist die kanonische Phasen-Bindung.

| Typ | Angebot | Phase | Zeitpunkt |
|---|---|---|---|
| R | **R1** Normen, Recht, Regulatorik | P3 Anforderungen sammeln · P4 Spezifizieren der Funktion | nach der Rohfassung des Anforderungs-Registers, spätestens im Spezifikations-Ausformulieren |
| R | **R2** Fachrecherche Domäne | P3 Anforderungen sammeln | während des Sammelns (Interviews, Beobachtungen) |
| R | **R3** Vergleichbare Werkzeuge / Fertiglösungen | P2 Stand der Technik erfassen | Kern-Aufgabe der Phase |
| R | **R6** Passende Technologien | P7 Auswählen der Technologie | vor der Technologie-Entscheidung |
| R | **R7** Best Practices Toolchain und Testdesign | P7 Auswählen der Technologie · P9 Testen | vor den jeweiligen Entscheidungen |
| R | **R8** Sicherheitslage und Lebenszyklus | P7 Auswählen der Technologie · P12 Betreiben | vor Technologie-Entscheidung; laufend im Betrieb |
| R | **R11** Lizenzkompatibilität | P7 Auswählen der Technologie | vor der Entscheidung |
| M | **Basis-Prüfung** (Standard-Prüfprompt, Zwei-Modelle-Regel, Selbst-Triage E/F/A, Reifekriterium — §4) | jede Phase mit Freigabe-Zweck | bevor die Freigabe „für die nachfolgende Phase" gebucht wird |
| V | **Fahrplan** (§4a; nach [[Fahrplan-Vorlage]]) | Projektstart | vor der ersten Vorlage |
| V | **V1** Git und Ablage | Projektstart | erste Vorlage, hängt von nichts ab |
| V | **V2** Zweck und Anforderungsskizze | P3 Anforderungen sammeln | Stufe-1-Skizze vor dem Scaffolding-Commit, Vollerfassung danach |
| V | **Angebot Referenzprozess** | nach V2 | entfällt, wenn im Startprompt bereits einer benannt ist |
| V | **V3** Sprache und Stack | P7 Auswählen der Technologie (Anker) | Wurzelentscheidung, allein |
| V | **V4** Struktur und Architekturmuster | P5 Zerlegen in Bausteine (Anker) | nach V3 |
| V | **V5** Werkzeugkette | P7 Auswählen der Technologie (Anker) | nach V3 |
| V | **V6** Betrieb und Rechtliches | P10 Ausliefern / P11 Produzieren (Anker) | Aufschub-Kandidaten-Bündel |
| V | **Scaffolding-Commit** (Commit-Message `Initial project scaffolding`, MasterPrompt §6) | vor der ersten Fachlogik | sobald keine Scaffolding-Entscheidung mehr aussteht |

**Nicht SP-1-Angebote** (RP-spezifisch): R4, R5, R9,
R10 sowie die V3–V6a-Präzisierungen bindet
`_template/referenzprozesse/RP-1-Systementwicklung/wiki/Vorgehen-RP-1.md`
§4 in seiner Zusatz-Tabelle.

## 4. Bindung der Prüfungen an Phasen

Die Phasen-Bindung steht in der §3-Tabelle (Typ M);
hier die Regel-Substanz. Prüfungen sind
Freigabe-vorbereitend — bevor ein
Artefakt „für Zweck Y" freigegeben wird, prüft ein
Sub-Agent oder eine Person die Freigabe-Reife nach
Standard-Prüfprompt (MasterPrompt §5.6).

**Basis-Prüfung an jeder Phase mit Freigabe-Zweck:**
Standard-Zwei-Modelle-Regel + Selbst-Triage E/F/A +
Reifekriterium (MasterPrompt §5.6). Auslöser: bevor
eine Freigabe „für nachfolgende Phase" gebucht wird.

**Prozess-spezifische Prüfungen (Zusatz-Anforderungen)
sind RP-Sache** — RP-1 präzisiert z.B. „Technologie-
agnostik als vierte Frage bei P4-Prüfung", „hochwertiger
Prüfer + mehrere Runden bei P4-Prüfung", usw.

## 4a. Scaffolding in SP-1

SP-1 belegt den Scaffolding-Baustein aus
`Vorgehen.md` §7a mit der konkreten
**Vorlagen-Kette V1–V6** (V steht für **Vorlage**).

Zuerst der **Fahrplan** (`Vorgehen.md` §7a Schritt 1,
nach [[Fahrplan-Vorlage]]), dann die Vorlagen in dieser
Reihenfolge:

| Vorlage | Inhalt | Entscheidung Nr. |
|---|---|---|
| **V1 Git und Ablage** | Bestandsaufnahme nach der Checkliste [[Git-Bestandsaufnahme]] | 2 |
| **V2 Zweck und Anforderungsskizze** | Projektzweck und Abgrenzung, Anforderungsskizze Stufe 1 (schmale Skizze vor dem Scaffolding-Commit; Vollerfassung der Anforderungen folgt danach als Stufe 2) | 1 |
| **Angebot Referenzprozess** | passt einer, und was würde er ändern — entfällt, wenn im Startprompt bereits einer benannt ist | — |
| **V3 Sprache und Stack** | die Wurzelentscheidung, allein (inkl. Runtime-Version) | 3 |
| **V4 Struktur und Architekturmuster** | Verzeichnisse, Zuständigkeiten, Muster | 4 |
| **V5 Werkzeugkette** | Linter/Formatter, Test-Framework, Dependency-Management, Build/Packaging, stackpassende `.gitignore` | 5, 6, 7 |
| **V6 Betrieb und Rechtliches** | CI-Pipeline, Deployment/Zielumgebung, Lizenz und Repo-Sichtbarkeit (nach [[Projekt-Sichtbarkeit-und-Lizenz]]) | 8, 9, 10 |

V1 steht vorn, weil es von nichts abhängt und klärt,
wohin überhaupt geschrieben wird. V3 und V4 stehen
allein, weil sie den größten Abwägungsbedarf haben. V6
bündelt die üblichen Aufschub-Kandidaten.

**Entscheidungs-Abhängigkeiten:**

| Nr. | Entscheidung | hängt ab von |
|---|---|---|
| 1 | Projektzweck und Abgrenzung | — (entsteht gemeinsam mit der Anforderungsskizze in V2) |
| 2 | Git-Setup | — |
| 3 | Sprache(n) und Technologie-Stack inkl. Runtime-Version | 1 |
| 4 | Verzeichnisstruktur und Architekturmuster | 3 |
| 5 | Linter, Formatter und Stilkonvention | 3 |
| 6 | Test-Framework (Unit und Integration) | 3 |
| 7 | Dependency-Management, Build und Packaging | 3 |
| 8 | CI-Pipeline | 5, 6, 7 |
| 9 | Deployment und Zielumgebung | 3, 7 |
| 10 | Lizenz und Urheberrechtsvermerk | 1 |

**Register-Entstehung:** die Register entstehen,
**sobald der erste Eintrag zu buchen ist** — in der
Regel mit der ersten Vorlage, bei pauschalem Aufschub
bereits im Fahrplan. Nicht erst mit dem Scaffolding.

Die Nummern 1–10 bezeichnen die **Scaffolding-
Entscheidungen**, nicht die Register-Einträge: aus
einer Nummer können mehrere Einträge entstehen, und
ein Eintrag kann später vorgelegt werden, als die
Nummer vermuten lässt (die `.gitignore` entsteht unter
Entscheidung 2, kommt aber erst in V5 dran, weil sie
vom Stack abhängt).

**Abschluss:** Scaffolding-Commit mit der verbindlichen
Commit-Message `Initial project scaffolding`
(MasterPrompt §6 — strikt einer pro Repo, markiert die
Grenze für zweistufige Prozess-Regeln), sobald keine
Scaffolding-Entscheidung mehr aussteht. Danach beginnt
die Fachlogik und Stufe 2 der Anforderungs-Erfassung
(Vollerfassung).

**Phasen-Anker:** die V-Kette liegt am Projekt-Anfang —
V1 beim Projektstart, V2 als P3-Anker
(Anforderungsskizze Stufe 1), V3–V6 in den frühen
Auswahl-Phasen. Die prozess-spezifische Zeilen-
Präzisierung der V-Themen (V3–V6a) liegt in
`_template/referenzprozesse/RP-1-Systementwicklung/wiki/Vorgehen-RP-1.md`
§2.

## 5. Freigabe-Rücknahme

Bei Artefakt-Iteration verlieren bestehende Freigaben
für den geänderten Teil ihre Gültigkeit. SP-1-Regel:

- **Grundsatz:** Bei substantieller Änderung an einem
  Artefakt wird die Freigabe „für Zweck X" **implizit
  zurückgenommen** und muss neu erteilt werden.
- **Meldung:** Der Agent warnt beim Iterieren an einem
  freigegebenen Artefakt: „Änderung berührt Freigabe
  für Zweck X — bitte Freigabe-Zustand prüfen."
- **Formales Rücknahme-DEC** nur wenn die Iteration
  substantiell ist und die Rücknahme bewusst
  dokumentiert werden soll. Sonst reicht Meldung und
  Neu-Freigabe im nächsten Zyklus.

**Verhältnis zum Zielmarken-Wechsel:** der Wechsel
der `in-progress`-Marke prüft dieselbe Frage
gebündelt für eine abgeschlossene Marke
(Wechsel-Prozedur, `## Meta` der Fassade
[[Zielmarken]]) — gleiche Regelfall-Logik: kein
formales Rücknahme-DEC als Regelfall; die Fixierung
nutzt dafür den append-only-Vermerk im
Freigabe-Eintrag. Anderer Auslöser, gleiche
Grundhaltung.

**Feinabstimmung an RPs:** RP-1 kann für kritische
Artefakte (z.B. Contracts) eine formale Rücknahme-DEC
zur Pflicht machen.

## 6. Verhältnis zur Entwicklungs-Projekt-Rolle

Die drei Entwicklungs-Projekt-Rollen (Koordinator /
Komponent / Standalone — Ebene A₀, siehe `index.md` §5)
beeinflussen, welche Phasen im Vordergrund stehen:

- **Koordinator:** P5 Zerlegen in Bausteine und P6
  Starten von Teilaktivitäten sind Schwerpunkte
  (Cross-Coordination der Teil-Systeme).
- **Komponent:** P3–P9 als Kern-Ausarbeitung des
  eigenen Bausteins, P10 als Deploy an den Koordinator.
- **Standalone:** durchläuft alle Phasen selbst
  (kein Delegieren an Teil-Systeme möglich).

## 7. Zug in SP-1

Jeder Prozess präzisiert, was ein **Zug** in ihm typisch
ist (Zug-Terminologie: Arbeitsschritt und Zug in
MasterPrompt §6.1, Meilenstein-Vorgang in
[[Meilenstein-und-T2]]). Für SP-1
(allgemeines Entwicklungs-Vorgehen) umfasst ein Zug
typischerweise:

- **Konzept-Abschnitt fertig** — ein Absatz oder Kapitel
  des Konzept-Dokuments (P1) inkl. eventueller Rück-
  fragen-Klärung.
- **Anforderung geklärt** — eine `requirement`-Instanz
  im Register (P3) hat einen abschließenden Zustand
  erreicht (`umgesetzt`/`verworfen`/`aufgeschoben` mit
  Auslöser).
- **Freigabe erwirkt** — ein zweck-gebundener Freigabe-
  DEC-Eintrag ist gebucht (typisch nach
  einer P-Phase mit Freigabe-Zweck an die nächste
  P-Phase).
- **Zielmarken-Wechsel vollzogen** — die
  Wechsel-Prozedur (Vollständigkeits-Scan,
  Freigabe-Fixierung, Zeiger-Nachführung; `## Meta`
  der Fassade Zielmarken) ist als ein Zug
  abgeschlossen und gebucht.
- **Prüfrunde abgeschlossen** — ein Prüfmuster nach
  `Reviewmuster.md` (M1–M5) ist mit Reifekriterium-
  Grün durchgelaufen und der Prüfbericht ist gebucht
  (Ablage nach MasterPrompt §5.6).
- **Design-Diskussions-Zug** — eine Klärungs-Runde mit
  einer Entscheidung samt Verankerung im
  Entscheidungs-Register (typisch neuer DEC-Eintrag
  oder Vermerk).

Nicht erschöpfend — was ein Zug in einem konkreten
Projekt heißt, ergibt sich aus der Praxis. Regel bleibt:
ein Zug ist eine **thematisch abgeschlossene Einheit**,
kein einzelner Arbeitsschritt.

## 8. Bezüge

- Basis-Vorgehensrahmen: `Vorgehen.md`
- Prüf-/Review-Muster: `Reviewmuster.md`
- Volle Prozess-Definition: `index.md`
- Kurzform: `Steckbrief.md`
- RP-1-Präzisierungen:
  `_template/referenzprozesse/RP-1-Systementwicklung/wiki/Vorgehen-RP-1.md`
