---
type: process-procedure
process: SP-1
extends: []
---

# SP-1 — Vorgehen

**Bearbeitungsstand:** 2026-11-03 (Doku-Phasen P11 und
P12, Betriebs-Anleitung als Pflicht-Stand P15,
Doku-Abfrage; Komponenten-Kette bis P11)

## 1. Erbschaft

SP-1 übernimmt den Basis-Vorgehensrahmen unverändert
(Phasen-als-Angebot-Grundhaltung, Ergebnis-Artefakt-
Regel, Zweck-Freigaben, Wächter-Trigger T4,
Rekursions-Muster). Regel-Details siehe
`Vorgehen.md` §1–§7.

SP-1 belegt die fünfzehn generischen Basis-Phasen mit
konkreten Artefakten und bindet R-Themen und
Prüfungen an konkrete Phasen. Kein
Weglassen, kein Umbenennen, kein Hinzufügen von
Phasen — die Standard-Belegung passt für allgemeine
Entwicklungsprojekte.

## 2. Phasen mit SP-1-Artefakten

| # | Phase | Ergebnis-Artefakt (SP-1) |
|---|---|---|
| P1 | Konzipieren | Konzept-Stand ([[Katalog-Konzept-Stand]]) aus [[Bedarfe]], [[Szenarien]] und dem Mission-Dokument (`Mission Statement.md`) |
| P2 | Stand der Technik erfassen | Stand-der-Technik-Bericht mit `rechercheartefakt`-Verweisen (kein Stand) |
| P3 | Anforderungen sammeln | Anforderungen-Stand ([[Katalog-Anforderungen-Stand]]) aus dem Register [[Anforderungen]] (REQ) |
| P4 | Beschreiben der Funktion | Funktionsbeschreibung-Stand ([[Katalog-Funktionsbeschreibung-Stand]]) aus dem Register [[Funktionsbeschreibungen]] (FUNC) |
| P5 | Zerlegen in Bausteine | Architekturdokument ([[Katalog-Architekturdokument]]) aus dem Register [[Systemarchitektur]] (ARC, §Komponenten) |
| P6 | Starten von Teilaktivitäten | Übergabe je Komponente ([[Katalog-Uebergabe]]); die Komponenten stehen als Zeilen in [[Systemarchitektur]] §Komponenten |
| P7 | Auswählen der Technologie | Technologie-Entscheidungen ([[Katalog-Technologie-Entscheidungen]]) aus den DEC mit `decision_type: technologie` im Basis-Register [[Entscheidungen]] |
| P8 | Spezifizieren | Spezifikation-Stand ([[Katalog-Spezifikation-Stand]]) aus dem Register [[Spezifikationen]] (SPEC; Bauanleitung nach Schnitt und Technologie-Entscheidung) |
| P9 | Ausarbeiten | Das **Produkt** der Marke (prozess-spezifisch — RPs präzisieren; Begriff: [[Glossar]]); Glied der Kette ist der Tag der Implementierung, der das Produkt markiert — in jedem Projekt, auch ohne Code |
| P10 | Testen | Testplan ([[Katalog-Testplan]]) aus dem Register [[Testfaelle]] (TEST); Testberichte (TRES) in [[Testberichte]]; Umgebung und Ausführung: [[Systemtest-Setup]] |
| P11 | Dokumentieren für Entwickler | Entwickler-Doku ([[Katalog-Entwickler-Doku]], selbsttragender Stand in `output/`, Kopie in `docs/developer/`) aus Architekturdokument, Technologie-Entscheidungen, Spezifikation und Tag |
| P12 | Dokumentieren für Benutzer | Benutzer-Doku ([[Katalog-Benutzer-Doku]], selbsttragender Stand in `output/`, Kopie in `docs/user/`) aus Konzept, Anforderungen, Funktionsbeschreibung und Tag |
| P13 | Ausliefern | Deploy-Stand je Umgebung ([[Katalog-Deploy-Stand]], in `output/` mit `_VV_TLA`) aus dem Register [[Deployments]] (DEPL) |
| P14 | Produzieren | Produktions-Plan + Produktions-Beschreibung (prozess-spezifisch — RPs präzisieren; kein Pflicht-Stand) |
| P15 | Betreiben | Betriebs-Anleitung je Umgebung ([[Katalog-Betriebs-Anleitung]], selbsttragender Stand in `output/`, Kopie in `docs/ops/`) aus dem Deploy-Stand der Umgebung; `bug-report`-Rückfluss ins Register |
| — | Ablauf je Stand | vom ersten `offen`en Element über Lese-Klammer, Bildung, Prüfung, Vorlage und Korrektur bis zur Freigabe: [[Lebenslauf-eines-Stands]] |

Zweck, Filter und Auslöser jedes Stands stehen in
seinem Dokumenttyp-Eintrag (verlinkt in der Tabelle);
die Ordnung der Freigaben in [[Kettenpruefung]] —
**Phasen ordnen Freigaben, nicht Arbeit:** ein Element
jedes Registers darf jederzeit entstehen, nur die
Pflicht-Stände werden in Phasenfolge freigegeben
([[Kettenpruefung]] §Kette).
**Doku-Phasen und Doku-Abfrage:** Die drei Doku-Stände
(P11, P12, P15) sind selbsttragend und entstehen aus
den freigegebenen Quell-Ständen ihrer Marke; sobald der
Tag der Implementierung gesetzt ist, legt der Agent
einmal je Marke die Doku-Abfrage vor — je Doku-Art und
je Zielumgebung Zeitpunkt (jetzt / später / gar nicht)
und Form (Änderungsdokument / Einarbeitung / komplett
neu), mit Empfehlung. Mechanismus, Ordnung der
Doku-Glieder, Heuristik, Buchung und Nachtrag:
[[Kettenpruefung]] §Kette (Doku-Glieder, Doku-Abfrage)
— lesen, sobald der Tag gesetzt ist.
**Contracts in der Kette:** welche Rolle ein CON in
P4, P5/P6, P7 und P8 spielt —
[[Katalog-Contract-Index#Rollen eines CON in der Kette]],
lesen bei einem Schnitt in Komponenten.

**Anmerkung P9:** die Ausarbeitung ist domänen-abhängig,
ihr Ergebnis ist in jeder Domäne das **Produkt** der
Marke ([[Glossar]]) — Software-RP-1 präzisiert zu
„Implementierung inkl. Unit-Tests und automatisierten
Integrationstests" (Produkt: der Code); Hardware-RP-10
zu „Prototyp bauen" (Produkt: der Prototyp);
Publikations-SP-3 zu „Ausformulieren der Kapitel"
(Produkt: die Kapitel); Rechtsfall-RP-3: je Marke ein
Schriftsatz oder eine Kommentierung; etc. SP-1 gibt
hier keinen generischen Namen jenseits von
„Ausarbeiten". Das Glied P9 heißt in der
Freigabe-Ordnung in jeder Domäne „Implementierung“;
dass der Tag das Produkt auch ohne Code markiert und
ein Verzicht auf P9 nicht möglich ist, steht in
[[Kettenpruefung]] §Kette und §Fehlende und
vertretene Glieder (Tag-Freigabe: `Vorgehen.md` §4
„Freigabe per Tag“).

**Anmerkung P6 (Rekursion):** die Komponenten in
§Komponenten der Architektur-Fassade sind Teil-Systeme,
die ihrerseits den Vorgehensrahmen anwenden
(`Vorgehen.md` §3, Rekursion in P6). Jede Komponente
entsteht über denselben Init-Weg wie das Hauptprojekt
— der Einstieg der Vorlage des Koordinators ist das
Werkzeug der Rekursion; den Referenzprozess der
Komponente gibt der Startprompt nicht vor; ihr
Startprompt verweist auf den freigegebenen
Übergabe-Stand an sie ([[Katalog-Uebergabe]]). Inhalt
des Startprompts und Ablauf: [[Init-Choreografie]]
§Init mit Startprompt (Komponente); wo die Kette der
Komponente beginnt: [[Kettenpruefung]]
§Komponenten-Kette nach Übernahme-Art; wie Koordinator
und Komponenten schreiben, melden und buchen
(Nachrichten, Meldepflicht, Rekursion): `Vorgehen.md`
§3a. Die Start-Tabelle vor dem Start einer
Teilaktivität gilt in jedem Prozess mit P6, auch mit
SP-1 allein (`Vorgehen.md` §3); RP-1 präzisiert sie für
Komponenten-Repositories in `Vorgehen-RP-1.md` §2
Anmerkung P6.

## 3. Angebote an Phasen (R / M / V)

Alle phasen-gebundenen Angebote in **einer** Tabelle:
**R** = Recherche-Thema (Angebot nach
[[Angebots-und-Beauftragungs-Muster]]), **M** = Prüf-/Review-Muster
(`Reviewmuster.md`), **V** = Scaffolding-Vorlage (§4a).
Die Kataloge bleiben in ihren Wurzel-Dateien; diese
Tabelle ist die kanonische Phasen-Bindung.

| Typ | Angebot | Phase | Zeitpunkt |
|---|---|---|---|
| R | **R1** Normen, Recht, Regulatorik | P3 Anforderungen sammeln · P4 Beschreiben der Funktion | nach der Rohfassung des Anforderungs-Registers, spätestens im Ausformulieren der Funktionsbeschreibung |
| R | **R2** Fachrecherche Domäne | P3 Anforderungen sammeln | während des Sammelns (Interviews, Beobachtungen) |
| R | **R3** Vergleichbare Werkzeuge / Fertiglösungen | P2 Stand der Technik erfassen | Kern-Aufgabe der Phase |
| R | **R6** Passende Technologien | P7 Auswählen der Technologie | vor der Technologie-Entscheidung |
| R | **R7** Best Practices Toolchain und Testdesign | P7 Auswählen der Technologie · P10 Testen | vor den jeweiligen Entscheidungen |
| R | **R8** Sicherheitslage und Lebenszyklus | P7 Auswählen der Technologie · P15 Betreiben | vor Technologie-Entscheidung; laufend im Betrieb |
| R | **R11** Lizenzkompatibilität | P7 Auswählen der Technologie | vor der Entscheidung |
| M | **Basis-Prüfung** (Prüflauf nach `Reviewmuster.md` §2 — §4) | jede Phase mit Freigabe-Zweck | bevor die Freigabe „für die nachfolgende Phase" gebucht wird |
| V | **Fahrplan** (§4a; nach [[Fahrplan-Vorlage]]) | Projektstart | vor der ersten Vorlage |
| V | **V1** Git und Ablage | Projektstart | erste Vorlage, hängt von nichts ab |
| V | **V2** Zweck und Anforderungsskizze | P3 Anforderungen sammeln | Stufe-1-Skizze vor dem Scaffolding-Commit, Vollerfassung danach |
| V | **Angebot Referenzprozess** | nach V2 | entfällt, wenn im Startprompt bereits einer benannt ist |
| V | **V3** Sprache und Stack | P7 Auswählen der Technologie (Anker) | Wurzelentscheidung, allein |
| V | **V4** Struktur und Architekturmuster | P5 Zerlegen in Bausteine (Anker) | nach V3 |
| V | **V5** Werkzeugkette | P7 Auswählen der Technologie (Anker) | nach V3 |
| V | **V6** Betrieb und Rechtliches | P13 Ausliefern / P14 Produzieren (Anker) | Aufschub-Kandidaten-Bündel |
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
Sub-Agent oder eine Person die Freigabe-Reife.

**Basis-Prüfung an jeder Phase mit Freigabe-Zweck:**
ein Prüflauf nach `Reviewmuster.md` §2
(Standard-Prüfprompt, Zwei-Modelle-Regel,
Selbst-Triage, Reifekriterium) — lesen vor der
Prüf-Beauftragung; Angebot und Auftrag nach
[[Angebots-und-Beauftragungs-Muster]]. Auslöser: bevor
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

## 5. Änderung nach der Freigabe

Wie eine Änderung nach einer Freigabe beantwortet wird
(Freigabe des eingefrorenen Stands bleibt, überholter
Stand, neuer Stand mit eigener Freigabe):
`Vorgehen.md` §4 „Änderung nach der Freigabe“ und
[[Einfrieren-und-Abloesen]] §Überholt-Regel — lesen,
wenn sich nach einer Freigabe etwas ändert. SP-1
präzisiert die Anwendung:

- **Meldung:** Der Agent warnt beim Iterieren an einem
  freigegebenen Artefakt: „Änderung berührt Freigabe
  für Zweck X — bitte Freigabe-Zustand prüfen."
  Wird ein verwiesenes Element abgelöst, meldet der
  Lint-Lauf nach der Ablösung die überholten Stände
  ([[Einfrieren-und-Abloesen]] §Ablösung).
- **Kein eigener DEC für die Änderung:** Meldung und
  neuer Stand mit neuer Freigabe im nächsten Zyklus
  reichen.

**Verhältnis zum Zielmarken-Wechsel:** der Wechsel
der `in-progress`-Marke prüft gebündelt, ob Stände
der abzuschließenden Marke überholt sind
(Wechsel-Prozedur, `## Meta` der Fassade
[[Zielmarken]]). Anderer Auslöser, gleiche Antwort:
ein neuer Stand.

**Feinabstimmung an RPs:** RP-1 kann für kritische
Artefakte (z.B. die Gesamt-Funktionsbeschreibung) den
neuen Stand samt Freigabe-DEC zur Pflicht machen,
sobald der freigegebene Stand überholt ist
([[Einfrieren-und-Abloesen]] §Überholt-Regel).
Contracts werden nicht zurückgenommen, sondern durch einen Nachfolge-CON
abgelöst ([[Contract-Index]]).

## 6. Verhältnis zur Entwicklungs-Projekt-Rolle

Die drei Entwicklungs-Projekt-Rollen (Koordinator /
Komponent / Standalone — Ebene A₀, siehe `index.md` §5)
beeinflussen, welche Phasen im Vordergrund stehen:

- **Koordinator:** P5 Zerlegen in Bausteine und P6
  Starten von Teilaktivitäten sind Schwerpunkte
  (Cross-Coordination der Teil-Systeme). Er
  verantwortet den Gesamt-Deploy: P13 mit Deploy-Stand
  je Zielumgebung und die DEPL-Elemente für alle
  Komponenten seiner §Komponenten-Zeilen
  ([[Katalog-Deploy-Stand]], [[Deployments]]); dazu
  führt er die Gesamtsicht der Entwickler-Doku (P11,
  sie nimmt die Entwickler-Doku der Komponenten auf),
  die Benutzer-Doku (P12) und die Betriebs-Anleitung je
  Zielumgebung (P15) — jede Freigabe eines dieser
  Pflicht-Stände ist ein eigener Meilenstein-Anlass
  ([[Meilenstein-und-T2]]; [[Kettenpruefung]]
  §Freigabe-Ordnung des Koordinators).
- **Komponent:** führt ihre Kette **bis P11** — nach
  ihrem Tag der Implementierung (P9) bildet sie einen
  Testplan-Stand, belegt den Durchgang mit einem
  Testbericht und bildet die Entwickler-Doku für ihr
  Bauteil ([[Katalog-Entwickler-Doku]]); den
  Integrationstest des Gesamtsystems
  führt der Koordinator. Ihr Tag ist zugleich ihre
  **Lieferung** an den Koordinator, gemeldet per
  Nachricht (übernommene Lieferung bei unverändertem
  Produkt und Lieferung eines Zwischen-Koordinators:
  [[Kettenpruefung]] §Kette und §Komponenten-Kette
  nach Übernahme-Art); dazu meldet sie den Abschluss
  ihrer Marke
  mit dem Abschluss-Stand, der die Glieder listet, die
  sie führt (Meldepflicht: `Vorgehen.md` §3a). Wo ihre
  Kette beginnt (was der Übergabe-Stand je
  Übernahme-Art vertritt) und wann sie Benutzer-Doku
  (P12), P13 mit eigenem Deploy-Stand und eigenen DEPL
  und Betriebs-Anleitung (P15) selbst führt (eigene
  Zielumgebung): [[Kettenpruefung]] §Fehlende und
  vertretene Glieder — lesen, bevor die Kette einer
  Komponente geplant wird.
- **Standalone:** durchläuft alle Phasen selbst
  (kein Delegieren an Teil-Systeme möglich) — auch die
  drei Doku-Glieder wie der Koordinator.

## 7. Zug in SP-1

Jeder Prozess präzisiert, was ein **Zug** in ihm typisch
ist (Zug-Terminologie: Arbeitsschritt und Zug in
MasterPrompt §6.1, Meilenstein-Vorgang in
[[Meilenstein-und-T2]]). Für SP-1
(allgemeines Entwicklungs-Vorgehen) umfasst ein Zug
typischerweise:

- **Konzept-Beitrag fertig** — ein Element des
  Konzept-Stands (P1: ein Bedarf, ein Szenario) oder
  ein Abschnitt seiner lebenden Quellen (Konzept,
  Mission-Dokument; [[Katalog-Konzept-Stand]]) inkl.
  eventueller Rückfragen-Klärung.
- **Anforderung geklärt** — eine `requirement`-Instanz
  im Register (P3) hat einen abschließenden Zustand
  erreicht (`umgesetzt`/`verworfen`/`aufgeschoben` mit
  Auslöser).
- **Freigabe erwirkt** — ein zweck-gebundener Freigabe-
  DEC-Eintrag ist gebucht (typisch nach
  einer P-Phase mit Freigabe-Zweck an die nächste
  P-Phase).
- **Zielmarken-Wechsel vollzogen** — die
  Wechsel-Prozedur (Vollständigkeits-Scan — mit der
  Vorlage offener BUG früherer Marken der Kette, den
  Rückfragen einer Sackgasse, der Vorlage doppelter
  Nachfolger bei der Rückkehr aus einem Vorgänger und
  der Frage, wenn keine künftige Marke vorliegt —,
  Freigabe des Abschluss-Stands, Prüfung auf überholte
  Stände, Zeiger-Nachführung auf die nächste Marke der
  Abfolge — nach einer Zwischenmarke eine folgende
  Zwischenmarke oder die zurückgestellte Marke, ohne
  künftige Marke die angelegte Folge-Marke oder keine
  mit der Ruhe-Zeile —; `## Meta`
  der Fassade Zielmarken) ist als ein Zug
  abgeschlossen und gebucht; das Weitermachen nach
  einer Ruhe holt mit der neuen Marke den zweiten Teil
  des Wechsels nach (Übernahme-Vorlage) und ist ebenso
  ein Zug.
- **Prüfrunde abgeschlossen** — ein Prüfmuster nach
  `Reviewmuster.md` (M1–M6) ist bis zur Reife
  (`Reviewmuster.md` §2) durchgelaufen und der
  Prüfbericht ist gebucht (Ablage nach
  [[Angebots-und-Beauftragungs-Muster]]).
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
- Marken-Dokument: [[Marken-SP-1]]
- Prüf-/Review-Muster: `Reviewmuster.md`
- Volle Prozess-Definition: `index.md`
- Kurzform: `Steckbrief.md`
- RP-1-Präzisierungen:
  `_template/referenzprozesse/RP-1-Systementwicklung/wiki/Vorgehen-RP-1.md`
