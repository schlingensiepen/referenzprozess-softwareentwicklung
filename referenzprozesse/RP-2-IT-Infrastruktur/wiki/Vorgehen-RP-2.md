---
type: process-procedure
process: RP-2
extends: [SP-1]
---

# RP-2 — Vorgehen (IT-Infrastruktur)

**Bearbeitungsstand:** 2026-11-11 (Ausarbeitung aus
realen Infrastruktur-Projekten)

Adaptiert das SP-1-Vorgehen ([[Vorgehen-SP-1]]) für
Vorhaben, deren Ergebnis der Zustand einer selbst
betriebenen Anlage ist.

## 1. Erbschaft und Zuschnitt

RP-2 erbt vollständig von SP-1 und präzisiert für
Infrastruktur. Die Kern-Regeln (Grundhaltung,
Ergebnis-Artefakt-Regel, Zweck-Freigaben,
Wächter-Trigger T4, Rekursions-Muster) gelten
unverändert aus der Basis-Vorgehen-Datei
(`Vorgehen.md`).

Alle fünfzehn Phasen bleiben bestehen. RP-2 **benennt
Phasen um** — P2 „Bestand und Stand der Technik
erfassen“ und P8 „Sollzustand festlegen“ —, wie es ein
Referenzprozess auf SP-1 darf ([[Vorgehen-SP-1]] §1;
`Vorgehen.md` §3): die Nummern bleiben, das
Prüfprogramm liest die Nummer, und die Freigabe-Formel
trägt die RP-2-Namen dieser Tabelle („für P8 Sollzustand
festlegen“, `Vorgehen.md` §4). Software und
Infrastruktur nennen dieselbe Phase verschieden; die
Zwecke der übrigen Phasen folgen den SP-1-Katalogen.

**Zuschnitt — Kriterium „Wer betreibt?“:**

| Fall | Prozess |
|---|---|
| Der Autor betreibt die Anlage selbst (installiert, konfiguriert, härtet, aktualisiert, zieht um, baut ab) | RP-2 |
| Der Autor baut ein Werkzeug für seine Anlage (Abgleich-Werkzeug, Verwaltungsoberfläche, Warteschlange) | RP-1 bzw. SP-1 für das Werkzeug; die Anlage ist dessen Zielumgebung, bei Bedarf ein RP-2-Projekt daneben |
| Der Autor liefert eine Umgebung an Dritte (verteiltes Image, Pakete) | RP-1 bzw. SP-1 — Verteilung an viele ist Software |
| Das Projekt betreibt ein fremd gebautes Image | RP-2; Mängel am Image gehen als Meldung an das Software-Projekt |
| Ein Software-Projekt liefert aus, und eine Umgebung soll dauerhaft betrieben werden | Überführung in ein RP-2-Projekt (§7); das Software-Projekt geht bis zur Auslieferung |
| Zugang nur über Anbieter-API oder Portal (gehosteter Dienst, DNS-Anbieter) | RP-2 mit einer Zielumgebung ohne Shell-Zugang; bei dominanter Vertragslast RP-11 |

**CI und Bauen bleiben im Software-Projekt.** Pipelines,
Build, Paketierung und Veröffentlichung in der Registry
gehören zum Software-Projekt; das RP-2-Projekt bezieht
das Ergebnis per **gepinnter Version** und hat kein
`ci/`; es prüft sein Rezept mit den Werkzeugen aus
`tests/` (RP-2-Steckbrief §Mitgebrachte Ordner).

**Das Wort „deploy“:** `deploy/` ist der Ordner des
Rezepts (Skripte, Stack-, Konfig- und Pin-Dateien); die
Phase P13 heißt „Ausliefern“ und ihr Stand
„Deploy-Stand“ — ausgeliefert wird das Rezept in eine
Umgebung, der Deploy-Stand hält fest, was dort gilt.

## 2. Phasen mit RP-2-Präzisierungen

| # | Phase (RP-2) | Ergebnis-Artefakt / Präzisierung | Zweck der Freigabe |
|---|---|---|---|
| P1 | Konzipieren | Konzept-Stand ([[Katalog-Konzept-Stand]]): Zielbild der Anlage und Ausgangsinventar | „für P2/P3“ |
| P2 | **Bestand und Stand der Technik erfassen** | **Bestandsbericht** (kein Stand): lesende Ist-Aufnahme je Zielumgebung als Kern, dazu die Recherche fertiger Lösungen (`rechercheartefakt`-Verweise wie der Stand-der-Technik-Bericht in SP-1); Ablage `overview/` mit Datum; Anmerkung P2 unten | — |
| P3 | Anforderungen sammeln | Anforderungen-Stand ([[Katalog-Anforderungen-Stand]]) aus [[Anforderungen]] (REQ) **mit Betriebsanforderungen** — Anmerkung P3 unten | „für P4 Beschreiben der Funktion“ (die Freigabe-Ordnung überspringt den Verzicht auf P4) |
| P4 | Beschreiben der Funktion | **Standard-Verzicht** — Anmerkung P4 unten | — |
| P5 | Zerlegen in Bausteine | Architekturdokument ([[Katalog-Architekturdokument]]) aus [[Systemarchitektur]] (ARC) mit **Zugriffsschnitt** (wer darf wo was: Mensch, Agent, Nachbarprojekt) und **Dienst-Tabelle** (je Dienst: Host, Rolle, Abhängigkeiten) | „für P6/P7“ |
| P6 | Starten von Teilaktivitäten | wie SP-1 ([[Katalog-Uebergabe]]); bei Bedarf — bei einer Anlage, deren Teil ein eigenes Projekt wird; nach einer Überführung führt P6 der Marke „Aufbauen“ die Lieferbeziehung zum Software-Projekt (§7) | wie SP-1 |
| P7 | Auswählen der Technologie | Technologie-Entscheidungen ([[Katalog-Technologie-Entscheidungen]]) **mit Pin der Fremd-Versionen** (Image, Paket, Betriebssystem) | „für P8 Sollzustand festlegen“ |
| P8 | **Sollzustand festlegen** | Spezifikation-Stand ([[Katalog-Spezifikation-Stand]]) aus [[Spezifikationen]] (SPEC): Konfig-Soll je Dienst, Skriptplan je Zielumgebung, Sicherungs- und Überwachungs-Soll | „für P9 Ausarbeiten“ |
| P9 | Ausarbeiten | Das **Rezept** ist das Produkt der Marke (Skripte, Stack-, Konfig- und Pin-Dateien in `deploy/`; beim Abbau die Rückbau-Skripte); Glied der Kette ist der **Tag des Rezepts** — Anmerkung P9 unten | „für P10 Testen“ |
| P10 | Testen | Testplan ([[Katalog-Testplan]]) aus [[Testfaelle]] (TEST, mit **Prüfort** je Testfall); **Testbericht** (TRES, [[Testberichte]]) als Nachweis für alles, was **vor der Freigabe des Deploy-Stands** geprüft wird — Anmerkung P10/P13 unten; Umgebung: [[Systemtest-Setup]] | „für P10 Testen“ |
| P11 | Dokumentieren für Entwickler | Entwickler-Doku ([[Katalog-Entwickler-Doku]]) wie SP-1: eigener Stand, Doku-Abfrage, Verzicht möglich (etwa wenn Betreiber und Ändernder dieselbe Person sind) | „für P13 Ausliefern“ |
| P12 | Dokumentieren für Benutzer | Benutzer-Doku ([[Katalog-Benutzer-Doku]]) in der **Gestalt eines Dienstblatts** je Umgebung mit fremden Nutzern; Doku-Abfrage empfiehlt „später“; ohne fremde Nutzer Verzicht — §5 Doku | „für P13 Ausliefern“ |
| P13 | Ausliefern | **Deploy-Stand** je Umgebung ([[Katalog-Deploy-Stand]]) aus [[Deployments]] (DEPL, **Aspekt Pflicht**); danach das **Abnahmeprotokoll** am Ziel als Nachweis ([[Abnahmeprotokolle]]); beim Abbau der Deploy-Stand „abgebaut“ mit Abschalt-Tor ([[Marken-RP-2]] §4) | „für P13 Ausliefern“ |
| P14 | Produzieren | kein Pflicht-Stand (wie SP-1); Verteilung an viele ist RP-1 — Anmerkung P14 unten | — |
| P15 | Betreiben | **Betriebs-Anleitung** je Umgebung ([[Katalog-Betriebs-Anleitung]]) — ihre Freigabe ist die **Inbetriebnahme** mit Tor (§5); laufender Betrieb markenfrei im [[Betriebsjournal]], Störungen in [[Fehlermeldungen]] (§6) | „für P15 Betreiben“ |
| — | Ablauf je Stand | vom ersten `offen`en Element bis zur Freigabe: [[Lebenslauf-eines-Stands]] (gilt für jeden Stand dieser Tabelle) | — |

Zweck, Filter und Auslöser jedes Stands stehen in
seinem Dokumenttyp-Eintrag (verlinkt in der Tabelle;
SP-1-Einträge, RP-2 präzisiert dort im Block
„RP-2-Präzisierung“). **Der Zweck-Wortlaut dieser Tabelle
ersetzt in RP-2 den SP-1-Wortlaut der
Dokumenttyp-Einträge**, wo eine Phase umbenannt ist: die
Technologie-Entscheidungen werden „für P8 Sollzustand
festlegen“ freigegeben, nicht „für P8 Spezifizieren“
([[Katalog-Technologie-Entscheidungen]] trägt den
SP-1-Wortlaut); das Prüfprogramm liest die Nummer. Welche
Phasen je Marken-Art Pflicht sind, zeigt die Matrix in
§3.

**Anmerkung P2 (Bestand und Stand der Technik
erfassen):** Der Kern ist die lesende Ist-Aufnahme je
Zielumgebung — Dienste, Versionen, Konfiguration,
Zugänge, Sicherung, Überwachung, Abhängigkeiten —, mit
Annahmen markiert und offenen Prüffragen gesammelt; sie
füllt die Einträge in [[Zielumgebungen]] (Pflichtfelder
der RP-2-Präzisierung). **Ohne Zugang des Agenten**
(Zugriffsstufe `keine`, Ausführung `mensch`) erstellt
der Agent die Liste der lesenden Befehle und Fragen,
der Mensch führt sie aus und liefert die Ausgaben als
Eingangsdokument; daraus schreibt der Agent den
Bestandsbericht. Der Bestandsbericht ist kein
Stand: kein Tag, kein Testbericht, keine Freigabe; er
liegt in `overview/` mit Datum. Dieselbe Form hat die
**Re-Inventur** vor einem Abbau und vor destruktiven
Schritten (Wächter W2, §8). Vor der ersten Marke ist er
der Einstieg „Bestand erfassen“ (§4).

**Anmerkung P3 (Betriebsanforderungen):** Die
Anforderungen einer Anlage enthalten als Mindestmenge
die Betriebsanforderungen — Sicherung,
Wiederherstellung, Überwachung, Zugänge,
Aktualisierung —, formuliert vom Projekt für seine
Anlage; sie speisen später das Inbetriebnahme-Tor (§5).
Das Template gibt keine Anforderung vor und verlangt
keinen Pflicht-Testfall „Wiederherstellung“: den
geprüften Rückweg belegt am Tor die durchgeführte
Probe-Rücksicherung. **Der Agent schlägt vor, der
Anwender wählt:** Für **Überwachung** und **zweiten
Zugang** legt der Agent bei den Betriebsanforderungen
je Zielumgebung eine Mindestform vor, passend zur
Anlage — für die Überwachung etwa eine regelmäßige
Prüfung der Erreichbarkeit und des letzten
Sicherungslaufs mit Meldung an den Anwender, für den
zweiten Zugang einen vom ersten unabhängigen Weg auf
die Anlage (Konsole des Anbieters oder des Hosts, ein
zweiter Schlüssel an einem anderen Ort). Eine
verbindliche Mindestform gibt es nicht: **Was der
Anwender bewusst nicht will, wird nicht gemacht.** Die
Wahl — auch die Ablehnung — steht als Entscheidung in
[[Entscheidungen]] und in den Betriebsanforderungen der
Zielumgebung. **Ablauf:** Der Agent legt die
Vorschläge zu Sicherung, Überwachung und zweitem
Zugang als Aktion vor und führt sie bis zur Wahl als
Eintrag in `Offene Fragen.md`; nach der Wahl des
Anwenders bucht er die Entscheidung und formuliert
die Betriebsanforderung (REQ) — vor der Wahl entsteht
keine REQ aus einem Vorschlag. Das Tor (§5) prüft nur,
ob der Aspekt im Deploy-Stand belegt ist. Der **zweite
Zugang** ist dabei ein **eigener** Deployment-Eintrag
mit `aspekt: zugang` — eingerichtet oder „bewusst
nicht eingerichtet“ —, neben dem Eintrag des ersten
Zugangs; der Agent benennt ihn am Tor. **Eine bewusste
Ablehnung ist
keine Einschränkung mit Frist** — es gibt nichts
nachzuholen: Der Aspekt ist dann durch einen
Deployment-Eintrag belegt, der statt einer Einrichtung
auf die Entscheidung verweist („bewusst nicht
eingerichtet“), und das Feld `ueberwachung` der
Zielumgebung nennt die Kennung dieses
Deployment-Eintrags statt „keine“. Die Einschränkung mit Frist bleibt der Weg
für das, was noch fehlt und kommen soll.

**Anmerkung P4 (Standard-Verzicht):** In
Infrastruktur-Vorhaben bleibt die Funktionsbeschreibung
leer — was ein Dienst leistet, steht in der
Dienst-Tabelle des Architekturdokuments (P5). Der
Verzicht ist **ausdrücklich**: der Agent schlägt je
Marke eine Verzichts-Entscheidung auf P4 vor
(`decision_type: verzicht`, `zielmarke`, `phase: P4`;
Form: [[Kettenpruefung]] §Fehlende und vertretene
Glieder), der Anwender entscheidet; Grund-Text:
„Funktionsbeschreibungen bleiben in Infrastruktur-Vorhaben leer;
was ein Dienst leistet, steht in der Dienst-Tabelle von
P5“. Kein vertretenes Glied, kein Ersatz-Mechanismus;
die Freigabe-Ordnung überspringt den Verzicht, der
Zweck-Wortlaut der Anforderungen „für P4 Beschreiben
der Funktion“ bleibt. Will ein Projekt die
Funktionsbeschreibung führen, entfällt der Vorschlag.

**Anmerkung P9 (Tag des Rezepts):** Der Tag bleibt
Pflicht-Glied (kein Verzicht auf P9, [[Kettenpruefung]]
§Kette) — er markiert das **Rezept**, nicht die Anlage.
Ein Betreiber-Projekt ohne eigene Skripte hat als
Rezept die Pin-Datei und die Parameter seiner
Zielumgebungen; auch das wird getaggt. Die
Tag-Freigabe lautet „Stand <Tag-Name> von
Implementierung, freigegeben für P10 Testen zu Marke
M“: das Rezept hat keinen Katalog-Eintrag als
Dokumenttyp, ⟨Artefakt⟩ ist der SP-1-Fachname
(Rückfall, `Vorgehen.md` §4 „Freigabe per Tag“); „von
Rezept“ liest der Lint nicht als Tag-Freigabe.
Rezept-Konvention
(Nummernplan, Kopf, Rückbau-Skripte, Pin-Datei): §4a,
Vorlage I4.

**Anmerkung P10/P13 (Testbericht und Abnahmeprotokoll
— Grundsatz nach dem Zeitpunkt):** Zwei Nachweise mit
eigenem Namen. Was **vor der Freigabe des Deploy-Stands**
geprüft wird, gehört in den **Testbericht** — gleich
wo: an Attrappen, in einer Wegwerf-Instanz oder am Ziel
(etwa Pre-Flight-Prüfungen vor dem Abschalten: Dienste,
Ports, Zeitpläne, Namensauflösung; Prüfsumme gegen das
Ziel). Was **erst nach dem Ausrollen am Ziel** prüfbar
ist, gehört ins **Abnahmeprotokoll** ([[Abnahmeprotokolle]];
Nachweis wie der Testbericht, eingefroren ab Anlage, je
Abnahme ein Eintrag zu einem freigegebenen Deploy-Stand).
Ein Testfall, der ins Abnahmeprotokoll gehört, gilt im
Testbericht weder als „blockiert“ noch als fehlend. Der
**Prüfort** je Testfall (Attrappe, Wegwerf, Ziel) sagt
nur, **wo** geprüft wird, nicht in welchen Nachweis das
Ergebnis gehört ([[Katalog-Testfaelle]]
RP-2-Präzisierung); eine Ausnahme für den Abbau gibt es
nicht — die Verifikations-Testfälle des Abbaus sind vor
der Freigabe prüfbar und stehen im Testbericht. Der
Testbericht ist Vorbedingung der Freigabe des
Deploy-Stands, das Abnahmeprotokoll Vorbedingung der
Freigabe der Betriebs-Anleitung ([[Kettenpruefung]]
§Code-Glieder). Welcher Testbericht-Durchgang
Vorbedingung ist, sagt der Deploy-Stand in `herkunft`;
ein Pre-Flight am Ziel vor der Freigabe ist ein weiterer
Durchgang zum selben Tag und damit ein weiterer
Testbericht.

**Anmerkung P14:** P14 trägt keinen Pflicht-Stand und
braucht keinen Verzicht; es entfällt bei einer eigenen
Anlage von selbst. Verteilung an viele (Image, Pakete)
ist RP-1.

## 3. Marken-Arten und Phasen-Matrix

Eine RP-2-Marke hat eine **Art** — Aufbauen, Ändern,
Aktualisieren, Abbauen; die Art steht im Namen oder in
der Begründung der Marke, nicht in einem Feld
([[Marken-RP-2]] §2). Welche Phasen je Art Pflicht sind,
sagt diese Matrix; der Agent schlägt je Art Verzichte
und Übernahmen vor, der Anwender entscheidet.

„P“ = Pflicht, „V“ = Standard-Verzicht (Verzichts-DEC je
Marke, [[Kettenpruefung]] §Fehlende und vertretene
Glieder), „Ü“ = aus der Vormarke übernommen, sofern
nicht überholt, „Abfrage“ = Doku-Abfrage, „—“ = nicht
vorgesehen.

| # | Phase (RP-2) | Aufbauen | Ändern | Aktualisieren | Abbauen |
|---|---|---|---|---|---|
| P1 | Konzipieren | P | Ü | Ü | Ü |
| P2 | Bestand und Stand der Technik erfassen | P | — | — | P (Re-Inventur) |
| P3 | Anforderungen sammeln | P | P | Ü | Ü |
| P4 | Beschreiben der Funktion | V | V | V | V |
| P5 | Zerlegen in Bausteine | P | Ü | Ü | Ü |
| P6 | Starten von Teilaktivitäten | bei Bedarf | — | — | — |
| P7 | Auswählen der Technologie | P | bei neuer Technologie | P (neuer Pin) | Ü |
| P8 | Sollzustand festlegen | P | P | Ü | Ü |
| P9 | Ausarbeiten (Tag des Rezepts) | P | P | P | P (Rückbau-Skripte) |
| P10 | Testen | P | P | P | P (Verifikation) |
| P11 | Dokumentieren für Entwickler | Abfrage | Abfrage | Abfrage | V |
| P12 | Dokumentieren für Benutzer (Dienstblatt) | Abfrage | Abfrage | Abfrage | V |
| P13 | Ausliefern | P | P | P | P (Deploy-Stand „abgebaut“) |
| P14 | Produzieren | — | — | — | — |
| P15 | Betreiben | P | P (Folge-Version) | P (Folge-Version) | V (je abgebauter Umgebung) |

Die Matrix ist Grundbestand aus realen
Infrastruktur-Projekten; jedes
Projekt kann davon abweichen — über die Verzichts- und
Übernahme-Vorschläge des Agenten, nie still. „Ü, sofern
nicht überholt“ heißt: ein übernommener Stand gilt
weiter, solange die Marke nichts ändert, was er
beschreibt; bei Aktualisieren ist eine Spezifikation,
die die Fremd-Version nennt, nach dem Pin-Wechsel
überholt und wird Folge-Version ([[Marken-RP-2]] §3).
Was eine Marke je Art im Kern tut, der Abbau-Ablauf und
das Abschalt-Tor: [[Marken-RP-2]].

## 4. Einstieg „Bestand erfassen“ und leichter Init

Läuft eine Anlage schon, beginnt das Projekt **vor der
ersten Marke** mit dem Einstieg **„Bestand erfassen“**:
die lesende Ist-Aufnahme je Zielumgebung als
**Bestandsbericht ohne Stand** (Form wie P2, Anmerkung
P2), Annahmen markiert, offene Prüffragen gesammelt; er
füllt die Einträge in [[Zielumgebungen]] mit den
RP-2-Pflichtfeldern. Der erste Deploy-Stand entsteht
erst mit dem ersten getaggten Rezept — der Bestand
selbst ist kein Stand, kein Tag, keine Freigabe.

**Leichter Init:** Bestand zuerst, die Init-Fragen
nebenbei, die volle Init-Choreografie vor der ersten
Freigabe ([[Init-Choreografie]]; das Angebot des
Einstiegs steht in `index.md` §5). Der
Scaffolding-Commit folgt der Vorlage „Zweck und
Bestand“ (I2, §4a); der Konzept-Stand darf auf ihm
aufbauen. Ein voller Init vor jeder Sacharbeit
verbrauchte in realen Projekten eine Sitzung ohne einen
Sach-Eintrag — deshalb diese Reihenfolge.

Nach dem Bestand wählt der Anwender die erste Marke —
in der Regel „Aufbauen“ (neuer Dienst) oder „Ändern“
(Härtung des Vorgefundenen); der Agent schlägt die Art
vor ([[Marken-RP-2]] §2).

## 4a. Scaffolding in RP-2

RP-2 belegt den Scaffolding-Baustein aus `Vorgehen.md`
§7a mit der **Vorlagen-Kette I1–I6** (I steht für
**Infrastruktur**) — eigene Kennungen, damit sie nicht
mit den SP-1-Vorlagen V1–V6 verwechselt werden; die
SP-1-Vorlagen V3–V6 (Sprache, Build, CI) entfallen in
RP-2. Zuerst der Fahrplan (`Vorgehen.md` §7a Schritt 1,
nach [[Fahrplan-Vorlage]]), dann die Vorlagen in dieser
Reihenfolge:

| Vorlage | Inhalt |
|---|---|
| **I1 Git und Ablage** | wie SP-1 V1: Bestandsaufnahme nach der Checkliste [[Git-Bestandsaufnahme]] |
| **I2 Zweck und Bestand** | Zweck in wenigen Sätzen; Liste der Zielumgebungen mit Rolle; erste lesende Ist-Aufnahme (§4) — der Scaffolding-Commit folgt dieser Vorlage |
| **Angebot Referenzprozess** | entfällt, wenn RP-2 schon gewählt ist (wie SP-1) |
| **I3 Zielumgebungen und Zugriffsschnitt** | je Zielumgebung Zugriffsstufe des Agenten, Ausführungsrolle, Erreichbarkeit aus der Sitzung; stehende OKs mit Rahmen (§5 Anwender-OK) |
| **I4 Rezept-Konvention** | Skript-Nummernplan je Ziel (`NN-<ziel>-<zweck>`), Kopf jedes Skripts „läuft wo / wiederholbar / Rückbau“, Rückbau-Skripte, Pin-Datei der Fremd-Versionen |
| **I5 Prüfwerkzeuge** | Syntaxprüfung der Skripte, Attrappen, Wegwerf-Instanz, Smoke-Test als Datei in `tests/` |
| **I6 Betrieb und Geheimnisse** | Ablage der Geheimnisse außerhalb des Repos (im Wiki nur der Ablageort), Sicherung, Überwachung, Lizenz und Repo-Sichtbarkeit (nach [[Projekt-Sichtbarkeit-und-Lizenz]]) |

Die Register entstehen, sobald der erste Eintrag zu
buchen ist (wie SP-1 §4a). Abschluss: Scaffolding-Commit
`Initial project scaffolding` (MasterPrompt §6) nach
I2; die übrigen Vorlagen dürfen nebenbei laufen (§4).

## 5. Kette, Tore und Anwender-OK

**Freigabe-Ordnung RP-2:** Konzept → Anforderungen →
Architektur → Technologie → Sollzustand → Tag des
Rezepts → Testplan (Testbericht als Nachweis) →
Entwickler-Doku → Benutzer-Doku/Dienstblatt („später“
möglich) → Deploy-Stand je Umgebung → (Abnahmeprotokoll
als Nachweis) → Betriebs-Anleitung je Umgebung (=
Inbetriebnahme) → Abschluss ([[Kettenpruefung]] §Kette).
Gegenüber SP-1 neu ist allein die zusätzliche
Vorbedingung der Betriebs-Anleitung. Jedes Tor ist die
Bedingung **einer Stand-Freigabe**, keine eigene
Freigabe — der Kernsatz „Eine Freigabe hängt immer an
einem Stand“ bleibt.

### Inbetriebnahme-Tor

Die Freigabe der Betriebs-Anleitung je Umgebung **ist**
die Inbetriebnahme. Bedingungen:

- (a) ein **Abnahmeprotokoll** zum geltenden
  Deploy-Stand dieser Umgebung ([[Abnahmeprotokolle]]);
- (b) **Sicherung mit geprüftem Rückweg** — Beleg ist
  eine **durchgeführte Probe-Rücksicherung am Ziel**,
  eingetragen im Abnahmeprotokoll; kein Pflicht-Testfall
  „Wiederherstellung“. Das gilt **bei jeder Freigabe
  der Betriebs-Anleitung**, auch bei jeder
  Folge-Version (Ändern, Aktualisieren): das
  Abnahmeprotokoll zum neuen Deploy-Stand trägt eine
  neue Probe-Rücksicherung, kein Verweis auf eine
  frühere (Mindestform unten);
- (c) **Überwachung**;
- (d) **zweiter Zugang** — ein eigener
  Deployment-Eintrag mit `aspekt: zugang` neben dem
  des ersten Zugangs (eingerichtet oder „bewusst nicht
  eingerichtet“, Anmerkung P3); der erste Zugang allein
  belegt die Bedingung nicht, der Agent nennt am Tor
  den Eintrag des zweiten;
- (e) bei Umgebungen mit **fremden Nutzern** das
  **Dienstblatt** (Benutzer-Doku, unten „Doku“).

(b), (c) und (d) sind als **Aspekte** im Deploy-Stand
belegt (Deployment-Einträge mit `aspekt`
`sicherung-wiederherstellung`, `ueberwachung`, `zugang`;
[[Katalog-Deployments]] RP-2-Präzisierung); **fehlt ein
Aspekt, meldet das Tor.** Fehlt eine Bedingung, steht
sie als **Einschränkung im Freigabe-Eintrag mit Frist**
(Wiedervorlage) — nie still übergangen. Die Frist ist
eine Frist der Fassade [[Fristen]] mit `richtung:
gegen-uns`, dem Feld `einschraenkung:` (was fehlt) und
`umgebung:` (die Zielumgebung); der Freigabe-Eintrag
nennt sie in der Feldzeile `- **Frist:** [[…]]`
(Aufbau: `Entscheidungen.md` §Meta
„Freigabe-Einträge“ der Basis). Als Einschränkung
zählt nur eine solche Frist — eine, die ein gültiger
Freigabe-Eintrag mit `Frist:` nennt oder die
`einschraenkung:` trägt; `umgebung:` allein genügt
nicht, denn auch ein Prüfdatum einer Annahme oder der
Ablauf eines Zertifikats ([[Externe-Abhaengigkeiten]]
§Meta) hängt an einer Umgebung, ohne eine
Einschränkung zu sein. Das
Prüfprogramm meldet eine abgelaufene Frist als FEHLER
(L6, §8). Eine Umgebung `aktiv` ohne Sicherung oder
Überwachung und ohne eine solche befristete Ausnahme
an derselben Umgebung
ist FEHLER (L2). **Dieser Abschnitt ist der führende Ort
beider Tore**; der Dokumenttyp-Eintrag der
Betriebs-Anleitung ([[Katalog-Betriebs-Anleitung]]
RP-2-Präzisierung) nennt die Bedingungen nur in Kurzform
und verweist hierher.

**Mindestform der Probe-Rücksicherung.** Damit kleine
Eingriffe leicht bleiben, genügt als Beleg eine
Mindestform, die der Agent **selbständig durchführt
und verbucht** — soweit seine Zugriffsstufe an der
Zielumgebung reicht; sonst legt er die Schritte dem
Ausführenden vor und verifiziert danach
(„Ausführungsrolle“, unten):

1. aus der **jüngsten Sicherung** der Zielumgebung ein
   benanntes, kleines Stück zurückholen — eine Datei,
   ein Verzeichnis, eine Tabelle, ein
   Konfigurations-Abbild, bei einer Marke das Stück, das
   sie berührt;
2. **an einen Prüfort neben dem Betrieb** (temporäres
   Verzeichnis, Prüf-Datenbank), nie über die
   produktiven Daten;
3. das Zurückgeholte **gegen das Original prüfen**
   (Prüfsumme, Zeilenzahl, lesbarer Inhalt) und das
   Alter der Sicherung festhalten;
4. den Prüfort aufräumen;
5. **verbuchen:** ein Eintrag im [[Betriebsjournal]]
   mit der Art `pruefung` (mit `ergebnis`; kein `lauf`
   — die Probe ändert den Stand nicht, die Frage nach
   dem Anwender-OK stellt sich nicht) und die Zeile
   „Probe-Rücksicherung“ im Abnahmeprotokoll (was, aus
   welcher Sicherung, wohin, Ergebnis, Datum, Form).

**Reihenfolge:** Die Probe läuft **vor** der Anlage des
Abnahmeprotokolls — das Protokoll ist ein Nachweis und
ab Anlage eingefroren. Eine Probe, die nach einem
gescheiterten Versuch nachgeholt wird, steht in einem
neuen Abnahmeprotokoll.

Die Mindestform schreibt nichts in den Betrieb; sie
ist kein Eingriff im Sinne von „Anwender-OK je
Eingriff“. Scheitert sie, ist das ein Befund (Eintrag
in [[Fehlermeldungen]]) und die Bedingung (b) fehlt —
Einschränkung mit Frist. Bei der ersten Inbetriebnahme
und immer, wenn eine Marke den Aspekt
`sicherung-wiederherstellung` berührt, schlägt der
Agent statt der Mindestform eine vollständige
Rücksicherung vor; der Anwender entscheidet.

### Abschalt-Tor

Bedingung der Freigabe des Deploy-Stands „abgebaut“
(Marken-Art Abbauen; keine eigene Freigabe): (a)
**Testbericht der Verifikation** ohne nicht bestandene
Fälle — nicht bestandene nur mit Anwender-Entscheidung
([[Testberichte]] §Meta „Nicht Bestandenes“); (b)
**Re-Inventur vom selben Tag** (Bestandsbericht, §2
Anmerkung P2); (c) **Vorab-Sicherung benannt** — in der
Re-Inventur vom selben Tag steht, was vor dem Abschalten
wohin gesichert ist und dass die Sicherung geprüft wurde;
der Deploy-Stand „abgebaut“ nennt sie in seinem Kopf. Der
Beleg liegt damit **vor der Freigabe**; der
Journal-Eintrag des Abschalt-Laufs nennt dieselbe
Sicherung später im Feld `vorab_sicherung`
([[Betriebsjournal]]). Ablauf des Abbaus: [[Marken-RP-2]]
§4.

### Anwender-OK je Eingriff

Jeder **schreibende Lauf an einer produktiven
Zielumgebung** hat ein OK des Anwenders, festgehalten
als **Entscheidungseintrag mit Wortlaut** in
[[Entscheidungen]] — eine Entscheidung, keine
Zweck-Freigabe —, oder fällt unter ein **stehendes OK**
mit festem Rahmen: Zielumgebung, erlaubte Aktionen,
Ablauf (etwa „im Gast ohne Rückfrage, am Host nur mit
Einzel-OK“). **Zugangs- und Sicherheitsänderungen nie
per stehendem OK.** Begründungen stehen im Eintrag,
nicht nur im Gespräch — gelöschte Sitzungen nahmen sie
in realen Projekten mit.

**Entscheidungsarten** (RP-2 ergänzt die offene Liste
der Basis, [[Katalog-Entscheidungen]]):

- `eingriff-ok` — das OK je Eingriff: Zielumgebung,
  Skript oder Aktion, Wortlaut des Anwenders, Bezug auf
  den Journal-Eintrag des Laufs ([[Betriebsjournal]]);
- `stehendes-ok` — das stehende OK: Zielumgebung,
  erlaubte Aktionen, Ablauf (Bedingungen, Ende); ein
  Lauf unter stehendem OK nennt den Eintrag im Journal.

Das OK ist Voraussetzung des Laufs, nicht einer
Stand-Freigabe; es ersetzt keine Freigabe der Kette.

**Ausführungsrolle.** Führt der Mensch aus (etwa ohne
Hypervisor-Zugang des Agenten), legt der Agent den
Befehl **vorher zur Prüfung vor** und **verifiziert
danach**; der Journal-Eintrag des Laufs nennt, wer
ausgeführt hat. Wer an einer Umgebung ausführt und was
der Agent dort darf, steht am Eintrag der Zielumgebung
(`ausfuehrung`, `zugriffsstufe`;
[[Katalog-Zielumgebungen]] RP-2-Präzisierung) und wird
bei I3 bzw. beim Einstieg erhoben.

### Kleine Eingriffe (Ändern, Aktualisieren)

Der **Prüfbericht** nach `Reviewmuster.md` ist vor
jeder Freigabe eines Pflicht-Stands Pflicht — in RP-2
**bei jeder Marken-Art**, auch bei Ändern und
Aktualisieren; keine Ausnahme, kein stehender Verzicht.
**Bei kleinen Eingriffen kann der Prüfbericht ein
einziger Satz sein** — die Prüfung ist bei
unverändertem Text klein. Der schlanke Ablauf: ein
Entscheidungseintrag (`eingriff-ok`), ein Lauf
([[Betriebsjournal]]), ein Abnahmeprotokoll mit der
Probe-Rücksicherung in ihrer Mindestform
(„Inbetriebnahme-Tor“, oben), ein
Änderungsdokument der Betriebs-Anleitung; Testplan,
Deploy-Stand und Betriebs-Anleitung dürfen **gemeinsam
vorgelegt** werden, mit einem gemeinsamen Prüfbericht —
**je Stand eine Freigabe**, in der Ordnung der Kette.

### Doku

Die Doku-Glieder bleiben wie in SP-1 mit der
Doku-Abfrage ([[Kettenpruefung]] §Kette, Doku-Abfrage).
Die **Entwickler-Doku** (P11) ist ein eigener Stand;
Verzicht über die Abfrage, etwa wenn Betreiber und
Ändernder dieselbe Person sind. Die **Benutzer-Doku**
(P12) hat bei Infrastruktur die Gestalt eines
**Dienstblatts** je Umgebung mit fremden Nutzern
(Nachbarprojekte, Nutzer eines Dienstes) — Verbindung,
Grenzen, Ansprechpartner, Änderungen; Verbindungsdaten
aus Deploy-Stand und Zielumgebung, ohne Geheimnisse;
ein Kapitel je Umgebung im Benutzer-Doku-Stand der Marke
([[Katalog-Benutzer-Doku]] RP-2-Präzisierung, dort die
Definition). Die Doku-Abfrage empfiehlt für das
Dienstblatt **„später“**, weil die Verbindungsdaten
erst nach dem Ausrollen feststehen; ohne fremde Nutzer
Verzicht. Bei fremden Nutzern ist das Dienstblatt
Bedingung (e) des Inbetriebnahme-Tors und damit
**spätestens dort fällig** — vor dem Marken-Abschluss;
Ausweg Einschränkung mit Frist wie oben.

## 6. Markenfreier Betriebsteil

Betriebsjournal und Störungen hängen an der
Zielumgebung, nicht an einer Marke.

- **Betriebsjournal** ([[Betriebsjournal]]): jeder
  Skriptlauf an einer Anlage — auch der
  Wiederholungslauf ohne Änderung — ist ein Eintrag
  (Rezept-Tag, Skript, Ausführender, Vorab-Sicherung,
  Ergebnis, **Abweichung vom Stand: ja/nein**); dazu
  Prüfungen, Störungen, Beobachtungen, Leichtform
  Kurzstörung. Kein neues DEPL je Lauf; erneutes
  Ausrollen ohne Änderung ist Betrieb und steht nur
  hier.
- **Störungen** ([[Fehlermeldungen]] RP-2-Präzisierung):
  Fehlermeldungen tragen die **Ursache** (Produkt,
  Umwelt, Anbieter) und den **Klärungsstand**
  (beobachtet, Workaround, ungeklärt) ausdrücklich,
  bei Bedarf die Vorkommen als Liste (Kann-Feld
  `vorkommen`). Der Übergang Störung →
  Fix-Anforderung → Marke der Art „Ändern“ bleibt wie
  in SP-1; eine Störung mit Ursache im Produkt eines
  Software-Projekts wird dort als Fehlermeldung
  gebucht (§7 Rückweg).
- **Externe Abhängigkeiten** ([[Externe-Abhaengigkeiten]]):
  Anbieter, Limits, Guthaben, Fristen und **Annahmen
  mit Prüfdatum**. Das Prüfdatum ist eine Frist der
  Fassade [[Fristen]] (`richtung: gegen-uns`), auf die
  der Eintrag verweist; zum Prüfdatum prüft der Agent
  die Annahme und schlägt die Erneuerung vor.
- **Offene Rückfragen** an den Anwender laufen über
  `Offene Fragen.md` (Basis); RP-2 bringt dazu keinen
  eigenen Satz.

## 7. Überführung aus einem Software-Projekt und Rückzug

Ein Software-Projekt (SP-1, RP-1) fragt beim ersten
Deploy-Stand je Zielumgebung, ob der Betrieb an ein
RP-2-Projekt geht ([[Vorgehen-SP-1]] §2 Anmerkung P13).
Entscheidet der Anwender „überführen“, **startet das
RP-2-Projekt wie eine Abspaltung**: mit dem
Übergabe-Punkt (`<repo>/<tag>`) und dem Startprompt
nach [[Zuschnitt-aendern]] — ein neues Projekt, oder ein
bestehendes RP-2-Projekt erhält eine Nachricht mit dem
Übergabe-Punkt. Das RP-2-Projekt **übernimmt aus dem
Startprompt die Zielumgebung und die Lieferbeziehung**
(welches Software-Projekt welches Produkt in welcher
Version liefert) und beginnt mit dem Einstieg „Bestand
erfassen“ (wenn die Umgebung schon läuft) oder mit einer
Marke „Aufbauen“, deren P6 die Lieferbeziehung zum
Software-Projekt führt. Seine Kette beginnt von Anfang
an, kein Glied ist vertreten.

**Was danach wo liegt:** Software-Projekt — Code, Tag,
Image, CI, Build, Paketierung, Registry; Fehlermeldung →
Fix → neuer Tag; Nachricht an den Betrieb bei neuer
Version. RP-2-Projekt — Aufbau-Rezept mit gepinnter
Version, Deploy-Stand je Umgebung, Journal-Eintrag je
Lauf, Abnahmeprotokoll, Betriebs-Anleitung (Pflicht),
Marke „Aktualisieren“ bei neuer Version, Testumgebung
für Software-Tests auf Anforderung mit Dienstblatt.

**Rückweg:** Der Betrieb **meldet nur** (Nachricht über
den Verbund, `Vorgehen.md` §3a): Produktfehler als
Fehlermeldung ins Software-Projekt, neue Versionen vom
Software-Projekt an den Betrieb; kein Kettenglied bei
der Mutter.

**Rückzug eines verteilten Stands:** kein RP-2-eigener
Ablauf — der Basis-Ablauf gilt
([[Lebenslauf-eines-Stands]] §Rückzug eines verteilten
Stands) mit dem SP-1-Kann-Feld `ausgeliefert_an` am
Deploy-Stand ([[Katalog-Deploy-Stand]]).

## 8. Prüfungen und Wächter-Anlässe

**Prüfungen (statisch, Module des gemeinsamen
Prüfprogramms):** RP-2 bringt seine Prüf-Definitionen im
Prozess-Ordner mit; das Prüfprogramm liest sie, sobald
RP-2 in [[Aktivierter-Prozess]] steht ([[Kettenpruefung]]
§Lint-Anteil). Diese Tabelle ist der **führende Ort**
der RP-2-Prüfungen; die Stufe folgt der Schwere-Tabelle
der Basis ([[Kettenpruefung]] §Lint-Anteil: FEHLER
sperrt die Freigabe des betroffenen Stands, nie die
Arbeit; HINWEIS meldet).

| Code | Befund | Stufe |
|---|---|---|
| `RP2-L1` | Zielumgebung `aktiv` ohne freigegebene Betriebs-Anleitung | HINWEIS |
| `RP2-L2` | Zielumgebung `aktiv` ohne Sicherung oder Überwachung (`sicherung`/`ueberwachung` leer oder `keine`) und ohne offene Einschränkung mit Frist an dieser Umgebung (Frist mit `umgebung:` der Zielumgebung, die ein Freigabe-Eintrag mit `Frist:` nennt oder die `einschraenkung:` trägt; `umgebung:` allein genügt nicht, §5). Gelesen wird nur, ob die Felder gefüllt sind, nicht ob die genannte DEPL im geltenden Deploy-Stand steht — das prüft das Tor bei der Freigabe; ein danach veralteter Verweis bleibt ein Fall für den Reviewer | FEHLER |
| `RP2-L3` | Betriebs-Anleitung ohne Abnahmeprotokoll zum geltenden Deploy-Stand ihrer Umgebung | HINWEIS |
| `RP2-L4` | geltender Deploy-Stand älter als ein Journal-Eintrag **mit Abweichung vom Stand** derselben Zielumgebung | HINWEIS |
| `RP2-L6` | abgelaufene, noch offene Frist einer Einschränkung oder eines Aufschubs (ein gültiger Freigabe-Eintrag nennt sie mit `Frist:` als Link, oder sie trägt `einschraenkung:`; `umgebung:` allein macht keine Frist zur Einschränkung — ein fälliges Prüfdatum meldet die Basis über den Fristen-Lebenszyklus) | FEHLER |
| `RP2-L7A` | Zielumgebung `abgebaut` mit einem Deployment-Eintrag, der weder abgelöst noch abgeschlossen ist | FEHLER |
| `RP2-L7B` | Deploy-Stand „abgebaut“ ohne Zustand `abgebaut` an der Zielumgebung, oder umgekehrt | HINWEIS |

Die Prüfung auf Muster von Geheimnissen in verfolgten
Dateien ist Basis-Prüfung, kein RP-2-Modul
([[Kettenpruefung]] §Lint-Anteil). Keine Prüfung
„Testfall im richtigen Nachweis“ allein am Prüfort — den
Zeitpunkt trägt kein Feld (§2 Anmerkung P10/P13). Der
Zustand der Zielumgebung steuert die Prüfungen: L1 und
L2 bei `aktiv`, L7A und L7B bei `abgebaut`.

**Wächter-Anlässe (der Agent meldet):**

- **W1 Wiederaufnahme** an einer laufenden Zielumgebung
  → Ist-Prüfung lesend gegen den letzten Deploy-Stand;
  dazu der Abgleich geteilter Anlagen (Feld „geteilt
  mit“ der Zielumgebung): trägt ein anderes Projekt
  andere Tatsachen zu derselben Anlage, meldet der Agent.
- **W2 vor destruktiven Schritten** (Abschalten,
  Löschen, Umbau mit Datenverlust) → Re-Inventur
  (Bestandsbericht, §2 Anmerkung P2) und Vorab-Sicherung
  benannt.
- **W4 Element „umgesetzt“ mit offenem Folgeschritt**
  (etwa Rotation eines Geheimnisses, Rückzug eines
  Stands) → melden; Reviewer-Anteil der Kettenprüfung.

Eine Prüfung am Sitzungsende (uncommittete Änderungen,
offene Rückfragen) bringt RP-2 nicht mit — die Basis
prüft beim Sitzungsstart (MasterPrompt §5.3,
Start-Prüfung des Arbeitsbaums) und hält offene Fragen
in `Offene Fragen.md`. Die Agenten-Regeln „keine
Geheimnisdateien in die Sitzung ausgeben“ und
„‚Prüfprogramm grün‘ nur ohne Fehler“ sind Basis-Regeln
jedes Projekts (Geheimnisse: MasterPrompt §6.3; „grün
nur ohne Fehler“: MasterPrompt §5 und [[Kettenpruefung]]
§Lint-Anteil); RP-2 verweist, bringt keine eigene
Fassung.

## 9. Bezüge

- SP-1-Vorgehen (direkte Erbschaft): [[Vorgehen-SP-1]];
  Basis: `Vorgehen.md`
- Marken-Arten, Abbau, Abschalt-Tor: [[Marken-RP-2]]
- Fassaden: [[Abnahmeprotokolle]], [[Betriebsjournal]],
  [[Externe-Abhaengigkeiten]]; SP-1-Fassaden mit
  RP-2-Präzisierung: [[Zielumgebungen]], [[Deployments]],
  [[Testfaelle]], [[Testberichte]], [[Fehlermeldungen]]
- Dokumenttypen mit RP-2-Präzisierung:
  [[Katalog-Deploy-Stand]], [[Katalog-Betriebs-Anleitung]],
  [[Katalog-Benutzer-Doku]]
- Kette, Vorbedingungen, Stufen: [[Kettenpruefung]]
- Überführung und Abspaltung: [[Vorgehen-SP-1]] §2
  Anmerkung P13, [[Zuschnitt-aendern]]
- Volle Definition: RP-2 `index.md`; Selbstvorstellung:
  RP-2-Steckbrief
