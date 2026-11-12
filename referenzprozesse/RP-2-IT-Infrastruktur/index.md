---
type: process-mapping
---

# RP-2 IT-Infrastruktur

**Bearbeitungsstand:** 2026-11-11

Ich bin in [[Steckbrief]] beschrieben (Prozess-Felder
samt `extends:`, Einstufung der mitgebrachten Fassaden,
Ordner, Präfixe und Mechanik — lesen beim Merge und bei
der Prozess-Wahl); konkret mache ich Folgendes:

## 1. Ich bin RP-2

Ich bin der **Referenzprozess für IT-Infrastruktur** —
aufsetzend auf [SP-1](../SP-1-Standardprozess/). Wenn du
mich wählst, gelten SP-1 und meine Zusatzregeln
zusammen — meine Regeln ergänzen und präzisieren SP-1
nur dort, wo das Ergebnis der Zustand einer selbst
betriebenen Anlage ist statt eines Software-Produkts:
Marken-Arten, Einstieg „Bestand erfassen“, zwei
Nachweise (Testbericht und Abnahmeprotokoll), Tore,
Anwender-OK je Eingriff, markenfreier Betriebsteil.

**Voraussetzung:** SP-1 ist als Standardprozess bereits
verstanden. Ohne SP-1 fehlen die Grundmuster (Kette der
Pflicht-Stände, Register, Doku-Abfrage), auf denen RP-2
aufbaut.

**Wann RP-2, wann nicht:** Kriterium „Wer betreibt?“ —
[[Steckbrief]] und [[Vorgehen-RP-2]] §1.

## 2. Rolle dieser Datei und Wie RP-2 auf SP-1 aufsetzt

**Rolle.** Diese Datei ist die **volle Definition von
RP-2** — sie beschreibt, was RP-2 an Fassaden,
Präzisierungen, Präfixen und eigenen Mechanismen
mitbringt. Der [[Steckbrief]] ist die schlanke
Selbstvorstellung für das Init-Angebot; das Vorgehen
(Phasen mit RP-2-Namen, Matrix, Einstieg, Scaffolding,
Tore, Prüfungen) steht in [[Vorgehen-RP-2]], die
Marken-Arten in [[Marken-RP-2]]. Ablage-Konvention:
Wiki.md §11.

**Wie RP-2 auf SP-1 aufsetzt.** Kategorien:

**Nutzt alles aus der Basis und aus SP-1** (nicht
dupliziert) — Kette, Freigaben, Doku-Abfrage, Register
Zielumgebungen, Deployments, Testfälle, Testberichte,
Fehlermeldungen, die Dokumenttypen Deploy-Stand,
Betriebs-Anleitung, Entwickler-Doku, Benutzer-Doku;
lesen in SP-1 `index.md` §4 und in den
SP-1-Katalog-Einträgen, wenn eine Regel hier nicht
vorkommt.

**Aktiviert als konkrete Instanzen** (§3): die
RP-2-Fassaden Abnahmeprotokolle, Betriebsjournal und
Externe Abhängigkeiten (§3.1) und die
**RP-2-Präzisierungen** an SP-1-Einträgen (§3.2) —
Blöcke „RP-2-Präzisierung (gilt bei aktivem RP-2)“ in
den SP-1-Katalog-Einträgen und `## Meta`-Sektionen, die
mit dem Merge wirksam werden. Präfixe: §3.3.

**Bringt eigene Mechanismen mit** (§4): Einstieg „Bestand
erfassen“ und leichter Init, Marken-Arten mit Matrix,
Grundsatz nach dem Zeitpunkt für die zwei Nachweise,
Inbetriebnahme-Tor und Abschalt-Tor, Anwender-OK je
Eingriff mit eigenen Entscheidungsarten, markenfreier
Betriebsteil, Scaffolding-Vorlagen I1–I6, Start aus einer
Überführung, Bausteine für Software-Projekte.

**Lazy-Loading durch selektive Aktivierung.** Ohne
RP-2-Wahl im Init passiert nichts von alldem: die
RP-2-Fassaden-Skelette, die mitgebrachten
Katalog-Einträge (`Katalog-<Name>.md`), das Vorgehen
(`Vorgehen-RP-2.md`) und die Marken (`Marken-RP-2.md`)
bleiben im RP-2-Teil-Wiki
(`referenzprozesse/RP-2-IT-Infrastruktur/wiki/`) und
werden nicht ins Anwender-`wiki/` gemerged; die
RP-2-Präzisierungen in den SP-1-Einträgen tragen ihren
Geltungs-Vorbehalt im Block-Titel. Bei RP-2-Wahl (setzt
SP-1 voraus) führt der Init-Agent den Merge nach Wiki.md
§11.3 durch — Basis zuerst, dann SP-1, dann RP-2.

## 3. Konkrete Instanzen der Basis + SP-1

### 3.1 RP-2-Fassaden

RP-2 bringt Fassaden mit, die keine SP-1-Fassade
ablösen: welche es sind und wie sie eingestuft sind,
steht im [[Steckbrief]] §Mitgebrachte Fassaden, dort
mit dem Katalog-Eintrag je Fassade (Typ, Zweck, Datei,
Präfix) — lesen beim Merge.

- [[Abnahmeprotokolle]] (`acceptance-protocol-log`,
  `ABN`): Nachweis-Register der Abnahmen am Ziel nach dem
  Ausrollen; Vorbedingung der Freigabe der
  Betriebs-Anleitung ([[Katalog-Abnahmeprotokolle]]).
- [[Betriebsjournal]] (`operations-journal-log`, `JNL`):
  markenfreies Register je Zielumgebung — jeder Lauf,
  jede Prüfung, Störung und Beobachtung
  ([[Katalog-Betriebsjournal]]).
- [[Externe-Abhaengigkeiten]] (`external-dependency-log`,
  Namen statt IDs): Anbieter, Limits, Guthaben, Fristen,
  Annahmen mit Prüfdatum
  ([[Katalog-Externe-Abhaengigkeiten]]).

**Ablage:** Die RP-2-Fassaden-Skelette liegen im
RP-2-Teil-Wiki; beim Merge (Wiki.md §11.3) kopiert der
Agent sie in das Anwender-`wiki/`. Die Merge-Schritte
jeder Fassade stehen in ihrer Bootstrap-Datei
(`referenzprozesse/RP-2-IT-Infrastruktur/bootstrap/`,
Wiki.md §11 „`bootstrap/`“) und ihrem `## Meta` — hier
nicht dupliziert.

### 3.2 RP-2-Präzisierungen an SP-1-Einträgen

RP-2 legt für die folgenden SP-1-Typen keinen eigenen
Typ an, sondern präzisiert sie im Block
**„RP-2-Präzisierung (gilt bei aktivem RP-2)“** am Ende
des jeweiligen Abschnitts bzw. als Zeile im `## Meta`
der Fassade — lesen beim Merge und beim ersten Eintrag
des Typs:

| SP-1-Eintrag | RP-2-Präzisierung |
|---|---|
| [[Katalog-Zielumgebungen]], [[Zielumgebungen]] §Meta | Pflichtfelder der Anlage: Rolle, Zustand mit Datum (geplant / aktiv / entkernt / abgebaut), Zugriffsstufe des Agenten (Werteliste), Erreichbarkeit aus der Sitzung, wer führt aus, Sicherung und Überwachung, geteilt mit, frühere Kennungen; Hardware optional |
| [[Katalog-Deployments]] | Feld `aspekt` ist Pflicht; der Deploy-Stand führt je Aspekt seine Einträge; fehlt ein Aspekt, meldet das Inbetriebnahme-Tor |
| [[Katalog-Testfaelle]] | Pflichtfelder Prüfort (Attrappe, Wegwerf, Ziel) und Ausführender; Grundsatz nach dem Zeitpunkt |
| [[Testberichte]] §Meta | Testbericht für alles vor der Freigabe des Deploy-Stands, gleich wo; Abnahmeprotokoll als zweiter Nachweis |
| [[Katalog-Deploy-Stand]] | Deploy-Einträge je Aspekt; Gestalt „abgebaut“ ohne Einträge mit Abschalt-Tor; Abnahmeprotokoll als Nachweis daneben; erster Stand nach Überführung |
| [[Katalog-Betriebs-Anleitung]] | Vorbedingung Abnahmeprotokoll; Inbetriebnahme-Tor mit Bedingungen (a)–(e), Beleg Probe-Rücksicherung, Einschränkung mit Frist |
| [[Katalog-Benutzer-Doku]] | Gestalt Dienstblatt je Umgebung mit fremden Nutzern (Definition), „später“, fällig am Tor |
| [[Katalog-Fehlermeldungen]], [[Fehlermeldungen]] §Meta | Störungen: Ursache (Produkt / Umwelt / Anbieter), Klärungsstand (beobachtet / Workaround / ungeklärt), bei Bedarf Vorkommen als Liste (Kann-Feld), Kurzstörung im Journal |
| [[Katalog-Entscheidungen]] (Basis) | Entscheidungsarten `eingriff-ok` und `stehendes-ok` — die Arten selbst stehen in [[Vorgehen-RP-2]] §5 |

### 3.3 RP-2-Präfixe

ID-Präfixe `ABN` und `JNL` (Katalog-Einträge der
Fassaden). Keine eigenen Commit-Präfixe
([[Steckbrief]] §Mitgebrachte Präfixe): Rezept und
Prüfwerkzeuge laufen unter `Code:`, die RP-2-Register
unter `Wiki:`, Freigaben unter `Freigabe:`.

## 4. RP-2-eigene Mechanismen

### 4.1 Einstieg „Bestand erfassen“ und leichter Init

Läuft eine Anlage schon, beginnt das Projekt vor der
ersten Marke mit der lesenden Ist-Aufnahme je
Zielumgebung als Bestandsbericht ohne Stand; sie füllt
die Zielumgebungen, die Init-Fragen laufen nebenbei, die
volle Init-Choreografie kommt vor der ersten Freigabe
([[Vorgehen-RP-2]] §4). Die Basis bietet diesen Einstieg
an, weil dieses `index.md` ihn nennt (§5;
[[Init-Choreografie]]).

### 4.2 Marken-Arten

Aufbauen, Ändern, Aktualisieren, Abbauen — Leitfaden,
kein Feld; Pflicht je Phase nach der Matrix; der Agent
schlägt Verzichte und Übernahmen vor ([[Vorgehen-RP-2]]
§3, [[Marken-RP-2]]). Abbauen mit Deploy-Stand
„abgebaut“, Zustand `abgebaut` und Abschalt-Tor
([[Marken-RP-2]] §4).

### 4.3 Zwei Nachweise, Grundsatz nach dem Zeitpunkt

Testbericht für alles vor der Freigabe des Deploy-Stands
(gleich wo), Abnahmeprotokoll für alles, was erst nach
dem Ausrollen am Ziel prüfbar ist; Prüfort je Testfall
sagt nur „wo“ ([[Vorgehen-RP-2]] §2 Anmerkung P10/P13).

### 4.4 Tore

Inbetriebnahme-Tor an der Freigabe der
Betriebs-Anleitung je Umgebung (Abnahmeprotokoll,
Sicherung mit Probe-Rücksicherung, Überwachung, zweiter
Zugang, Dienstblatt bei fremden Nutzern; Einschränkung
mit Frist als Ausweg) und Abschalt-Tor an der Freigabe
des Deploy-Stands „abgebaut“ ([[Vorgehen-RP-2]] §5,
[[Marken-RP-2]] §4). Beide sind Bedingungen einer
Stand-Freigabe, keine eigenen Freigaben.

### 4.5 Anwender-OK je Eingriff

Entscheidungseintrag mit Wortlaut (`eingriff-ok`) oder
stehendes OK mit Rahmen (`stehendes-ok`); Zugangs-
und Sicherheitsänderungen nie per stehendem OK;
Ausführungsrolle Mensch oder Agent ([[Vorgehen-RP-2]]
§5). Der Prüfbericht vor jeder Freigabe bleibt bei jeder
Marken-Art Pflicht, bei kleinen Eingriffen ein Satz.

### 4.6 Markenfreier Betriebsteil

Betriebsjournal je Zielumgebung, Störungen mit Ursache
und Klärungsstand, Externe Abhängigkeiten mit Prüfdatum
als Frist ([[Vorgehen-RP-2]] §6).

### 4.7 Scaffolding-Vorlagen I1–I6

Git und Ablage, Zweck und Bestand, Zielumgebungen und
Zugriffsschnitt, Rezept-Konvention, Prüfwerkzeuge,
Betrieb und Geheimnisse ([[Vorgehen-RP-2]] §4a) — statt
der SP-1-Vorlagen V3–V6.

### 4.8 Start aus einer Überführung

Ein Software-Projekt gibt den Betrieb einer Umgebung ab:
das RP-2-Projekt startet mit Übergabe-Punkt und
Startprompt, übernimmt Zielumgebung und Lieferbeziehung
daraus und beginnt mit „Bestand erfassen“ oder einer
Marke „Aufbauen“; der Betrieb meldet nur zurück
([[Vorgehen-RP-2]] §7).

### 4.9 Bausteine für Software-Projekte

Ein Software-Projekt, das den Betrieb behält, kann
RP-2-Bausteine einzeln übernehmen (erweiterte Felder der
Zielumgebung, Betriebsjournal, Prüfort und
Abnahmeprotokoll, Inbetriebnahme-Tor) — Baustein-Übernahme nach
[[Zuschnitt-aendern]]; Liste im [[Steckbrief]] „Was ich
mitbringe“.

### 4.10 Externe Doku-Ableitungen

Wie SP-1 `index.md` §4.11: Kopien der freigegebenen
Doku-Stände in `docs/developer/` (Entwickler-Doku),
`docs/user/` (Dienstblatt) und `docs/ops/`
(Betriebs-Anleitung); Ist-Aufnahmen und Prüfprotokolle
in `overview/` ([[Steckbrief]] §Mitgebrachte Ordner).

## 5. Prozess-spezifische Init-Fragen und Einstieg

Die Init-Choreografie sammelt die Fragen des Prozesses
in Phase D Turn 2 aus diesem Abschnitt
([[Init-Choreografie]] §Phase D, Punkt 3). RP-2 erbt
die Fragen von SP-1 (SP-1 `index.md` §4.12) und bringt
folgende eigene mit:

- **Einstieg „Bestand erfassen“** — wird vor den
  Init-Fragen angeboten, wenn eine Anlage schon läuft
  (Frage: „Läuft der Dienst, um den es geht, schon —
  oder steht bisher nur der Server oder noch gar
  nichts? Läuft er schon, nehme ich zuerst den Bestand
  auf und stelle die Init-Fragen nebenbei.“
  Voreinstellung: läuft noch nicht). Gemeint ist der
  **Dienst** des Projekts, nicht der Host: Ein
  vorhandener Server ohne den Dienst ist kein
  laufender Bestand; er wird als Zielumgebung
  aufgenommen. Bei „ja“ beginnt der Agent mit der
  lesenden Ist-Aufnahme ([[Vorgehen-RP-2]] §4), die
  volle Choreografie folgt vor der ersten Freigabe. Bei
  einem Start mit Startprompt aus einer Überführung
  ist die Umgebung in der Regel schon in Betrieb.
- **Zugriffsstufe des Agenten und Ausführungsrolle je
  Zielumgebung** — was der Agent dort darf
  (Werteliste: [[Katalog-Zielumgebungen]]
  RP-2-Präzisierung) und wer Änderungen ausführt
  (Mensch oder Agent); dazu, ob ein stehendes OK gelten
  soll und in welchem Rahmen ([[Vorgehen-RP-2]] §5).
  Fragesatz: „Was darf ich an der Zielumgebung ⟨Name⟩
  — nichts, nur lesen, Skripte des Rezepts ausführen
  oder auch ändern? Wer führt Änderungen aus, du oder
  ich? Und soll ein stehendes OK gelten, in welchem
  Rahmen?“ Voreinstellung: Zugriffsstufe `keine`,
  Ausführung `mensch`, kein stehendes OK.
  Gebucht am Eintrag der Zielumgebung bzw. als
  Entscheidung `stehendes-ok`. Mit Startprompt aus
  einer Überführung kommen Zielumgebung und
  Lieferbeziehung aus dem Startprompt; die Zugriffsstufe
  wird trotzdem gefragt.

Weitere Init-Fragen stellt RP-2 nicht; der
Scaffolding-Fahrplan I1–I6 folgt nach `Vorgehen.md`
§7a.

## 6. Bezüge

- [[Steckbrief]] — schlanke Selbstvorstellung, einziger
  Ort der Prozess-Felder, §Mitgebrachte Fassaden,
  Ordner, Präfixe, Mechanik.
- [[Vorgehen-RP-2]] — Zuschnitt, Phasen mit RP-2-Namen,
  Matrix, Einstieg, Scaffolding, Tore, Anwender-OK,
  Betriebsteil, Überführung, Prüfungen und
  Wächter-Anlässe.
- [[Marken-RP-2]] — Marken-Arten, Rezept oder Umgebung,
  Abbau mit Abschalt-Tor; lesen beim Init (erste Marke)
  und vor einem Marken-Wechsel.
- Fassaden: [[Abnahmeprotokolle]], [[Betriebsjournal]],
  [[Externe-Abhaengigkeiten]] mit ihren
  Katalog-Einträgen.
- SP-1 (übergeordneter Basisprozess):
  [Steckbrief](../SP-1-Standardprozess/Steckbrief.md)
  und [index](../SP-1-Standardprozess/index.md);
  Vorgehens-Erbschaft aus [[Vorgehen-SP-1]];
  Überführungs-Frage in [[Vorgehen-SP-1]] §2 Anmerkung
  P13.
- Wiki.md §11 — Prozess-Teil-Wikis, Merge-Semantik,
  Aktivitäts-Regel.
