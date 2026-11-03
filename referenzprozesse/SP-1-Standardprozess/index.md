---
type: process-mapping
---

# SP-1 Standardprozess Entwicklungsprojekt

**Bearbeitungsstand:** 2026-10-25

Ich bin in [[Steckbrief]] beschrieben (Prozess-Felder,
Einstufung der mitgebrachten Fassaden, Ordner,
Präfixe und Mechanik — lesen beim Merge und bei der
Prozess-Wahl); diese Datei ist meine **volle
Prozess-Definition**. Konkret mache ich Folgendes:

## 1. Ich bin SP-1

Ich bin der **Standardprozess für Entwicklungsprojekte** im
Template-Umfeld — allgemein für alle Entwicklungsdomänen
(Software, Hardware, System …). Du kannst mich **allein
instanziieren** — für ein Entwicklungsprojekt ohne
besondere Domänen-Anforderungen reicht das aus, auch
wenn es in P6 in Komponenten mit eigenen Repos zerlegt
wird (Koordinator, Komponenten, Contracts und
Zweck-Freigaben sind SP-1-Mechanik, §5). Für die
Entwicklung eines Softwaresystems gibt es
[RP-1 Entwicklung eines Softwaresystems](../RP-1-Systementwicklung/)
obendrauf, der SP-1 voraussetzt und die
Software-spezifischen Präzisierungen bringt
(Softwarearchitektur, Tag und Code-Review, Scaffolding,
Test-Automatisierung).

**Wichtig:** SP-1 ist **kein kompletter domänenspezifischer
Prozess**. Er **nutzt die Basis-Mechanismen** (Fassaden,
Detail-Knoten, Register-Muster, Ableiten-und-Vorlegen) und
**ergänzt konkrete Instanzen** (die SP-1-Register der
Kette wie `Anforderungen`, `Fehlermeldungen`,
`Testfaelle` und `Deployments`, die Fassaden
`Systemarchitektur` und `Systemtest-Setup`) plus
**eigene Mechanismen**
(Status-Achse der Register, Wächter-T2-Trigger, zweck-gebundene
Freigaben, Scaffolding-Vorlagen). Die Entscheidungen-Fassade
ist **Basis** (universeller Mechanismus) und nicht
SP-1-spezifisch. Domänen-Regeln bringt SP-1 nicht mit. Wer
SP-1 wählt und keinen darauf basierenden Referenzprozess,
sollte das wissen — der Agent verrät es dem Anwender bei
der Wahl.

## 2. Rolle dieser Datei und Wie SP-1 auf die Basis aufsetzt

**Rolle.** Diese Datei ist die **volle Prozess-Definition
von SP-1** — der [[Steckbrief]] ist ihre Kurzform. Die
SP-1-Fassaden-Skelette liegen im Prozess-Teil-Wiki unter
`referenzprozesse/SP-1-Standardprozess/wiki/` und landen
beim Merge (Wiki.md §11.3) im Anwender-`wiki/`. Was ein
SP-1-Typ ist (Zweck, Datei, Pflichtfelder, Präfix),
steht in seinem mitgebrachten Katalog-Eintrag
`wiki/Katalog-<Name>.md` (beim Merge als Datei ins
Anwender-`wiki/` kopiert und im [[Katalog]]
verankert); Aufbau, Eintragsformat und Sektionen der
Detail-Knoten stehen in den `## Meta`-Sektionen der
jeweiligen Fassaden.
Die SP-1-Betriebs-Mechanik liegt als mitgebrachte
`internal-*`-Knoten ebenfalls im Prozess-Teil-Wiki
(Deklaration samt Einführungs-Anweisungen:
[[Steckbrief]] §„Mitgebrachte Mechanik").
Das Init-Prompt-Fragment für die SP-1-Wahl steht in
der [[Init-Choreografie]] (Kern-Kurzform MasterPrompt
§5.3 Phase D).

**Wie SP-1 auf die Basis aufsetzt.** Drei Kategorien:

**Nutzt alles aus der Basis** (nicht dupliziert, nicht
neu definiert) — die Basis-Mechanismen stehen im
MasterPrompt und in Wiki.md; lesen dort, wenn eine
Regel hier nicht vorkommt.

**Aktiviert als konkrete Instanzen** (§3): die
SP-1-Fassaden (§3.1) und die zugehörigen
SP-1-Detail-Knotentypen (§3.2),
Register-Status-Kanonizität als konkrete Ausnahme von
Wiki.md §1.1a (§3.3) und SP-1-typische Präfixe (§3.4).
SP-1 **nutzt** die Basis-Werkzeug-Kategorien der
`Tools.md` (MasterPrompt §7.5) und bringt keine eigenen
`Tools.md`-Inhalte mit. `Entscheidungen` ist
Basis-Fassade (universeller Mechanismus);
`Systemarchitektur` und `Systemtest-Setup` sind generische
SP-1-Fassaden, die RP-1 mit Softwaresystem-Kompositum
überschreibt.

**Bringt eigene Mechanismen mit** (§4): Status-Achse
der Register, Wächter mit Meilenstein-Regel, zweck-gebundene
Freigaben, Prüf- und Rechercheangebot in prozess-typischer
Anwendung, Init-Verzahnung mit Prozess-Angebot,
Rolle-Konzept (§5).

**Lazy-Loading durch selektive Aktivierung.** Ohne SP-1-Wahl
im Init passiert nichts von alldem: die SP-1-Fassaden-
Skelette und die mitgebrachten Mechanik-Knoten bleiben
im SP-1-Teil-Wiki
(`referenzprozesse/SP-1-Standardprozess/wiki/`) und werden
nicht ins Anwender-`wiki/` gemerged; die SP-1-Detail-Typen
bleiben in den SP-1-Katalog-Einträgen und werden nicht in
den Anwender-Katalog aufgenommen; das Init-Prompt-
Fragment wird nicht abgearbeitet. Bei SP-1-Wahl führt der
Init-Agent den Merge nach Wiki.md §11.3 durch (Artefakte
kopieren, Aktivitäts-Regel Wiki.md §11.4 anwenden, Aktivierungs-
Kontext im `internal-rule`-Knoten [[Aktivierter-Prozess]])
— danach läuft SP-1 durch die normalen Basis-Mechanismen.
Nicht diese Prozess-Definition wird selektiv geladen,
sondern die mitgebrachten Artefakte werden selektiv
aktiviert.

## 3. Konkrete Instanzen der Basis

### 3.1 SP-1-Fassaden

Welche Fassaden SP-1 zusätzlich zur Basis mitbringt
und wie sie eingestuft sind (mandatory/optional,
Vorauswahl, Ablösung durch RP-1): [[Steckbrief]]
§Mitgebrachte Fassaden, dort mit dem Katalog-Eintrag
je Fassade (Typ, Zweck, Datei, Präfix) — lesen beim
Merge und bei der Anlage einer Fassade. Alle folgen
dem Fassaden-Mechanismus aus Wiki.md §3a (lesen, wenn
eine Regel hier nicht vorkommt); hier nur die
SP-1-typischen Design-Regeln.

**Zur Abgrenzung:** `wiki/Entscheidungen.md`
(`decision-log`) ist keine SP-1-Fassade, sondern
**Basis-Fassade** — universeller Mechanismus, jedes
Projekt dokumentiert Entscheidungen. Ebenso liegen
[[Rollen]], [[Bedarfe]] und [[Szenarien]] in der
Basis; unter SP-1 sind sie Pflicht, weil der
Konzept-Stand (P1) sie filtert bzw. kopiert
([[Steckbrief]] §Mitgebrachte Fassaden).

**Ablage:** Die SP-1-Fassaden-Skelette liegen im SP-1-
Teil-Wiki (`referenzprozesse/SP-1-Standardprozess/wiki/`),
Wiki.md §11. Beim Merge (Wiki.md §11.3) kopiert der Agent
sie in das Anwender-`wiki/` — die im Folgenden genannten
Pfade `wiki/Anforderungen.md` etc. beziehen sich immer auf
die Anwender-Sicht nach Merge.

**Gemeinsame Design-Regeln** (gelten für alle
SP-1-Fassaden):

- **Frontmatter:** `type: <log-typ>` gemäß
  Katalog-Eintrag;
  `active` auskommentiert (Default `active: true`, siehe
  Wiki.md §3a). Nach Merge greift die Aktivierungs-Regel
  aus Wiki.md §11.3: die mandatory-Fassaden
  (Steckbrief § Mitgebrachte Fassaden) werden ohne
  Anwender-Frage aktiv, die optionalen nach ihrem
  Bootstrap.
- **Kanonizitäts-Marker im Fassaden-Text:** Standardsatz
  „Die Wahrheit bei <Status-Feld> liegt in dieser Fassade —
  Detail-Knoten spiegeln (Wiki.md §1.1a)".
  Formalisierung als konkrete Ausnahme von Wiki.md §1.1a in §3.3.
- **Bearbeitungsstand-Zeile:** „_(vom Agenten beim Ingest
  und laufend gepflegt)_".
- **Statuswerte:** kommen aus der Status-Achse der
  jeweiligen Register-Art (§4.1); Register-Fassaden
  benennen sie am Eintragsformat.
- **Detail-Knoten-Pflicht** einheitlich: sobald
  Vermerke, Umsetzungs-Notizen, längere Beschreibung oder
  zitierpflichtige Bezüge anfallen. Kein Detail-Knoten für
  Register-Einträge, die eine Zeile bleiben.
- **Eintragsformat der Register-Fassaden:** `### <ID> —
  <Kurzsatz>` als H3-Überschrift, danach Feldliste als
  Bullet-Points: `Status:` (Pflicht), `Datum:` (Pflicht,
  letzter Statuswechsel), `Auslöser:` (nur bei
  `aufgeschoben`), `Verweise:`,
  `Detail:` (Wikilink, nur wenn Detail-Knoten existiert),
  typspezifische Zusatzfelder.

**Fassaden-typische Zusätze:** Gliederung,
Eintragsformat, Abgrenzungen und Detail-Knoten-Regeln
jeder SP-1-Fassade stehen in ihrer `## Meta`
([[Anforderungen]], [[Funktionsbeschreibungen]],
[[Spezifikationen]], [[Fehlermeldungen]],
[[Systemarchitektur]], [[Systemtest-Setup]],
[[Testfaelle]], [[Testberichte]], [[Deployments]],
[[Zielumgebungen]], [[Contract-Index]],
[[Geschaeftsbeziehungen]]) — lesen bei Anlage oder
Pflege der Fassade.

### 3.2 SP-1-Detail-Knotentypen

SP-1 bringt folgende Detail-Knotentypen mit (Zweck und
Frontmatter-Felder nur in den mitgebrachten
Katalog-Einträgen — lesen beim Anlegen eines Knotens:
[[Katalog-Anforderungen]],
[[Katalog-Funktionsbeschreibungen]],
[[Katalog-Spezifikationen]],
[[Katalog-Fehlermeldungen]], [[Katalog-Systemarchitektur]],
[[Katalog-Systemtest-Setup]], [[Katalog-Testfaelle]],
[[Katalog-Testberichte]], [[Katalog-Deployments]],
[[Katalog-Zielumgebungen]], [[Katalog-Contract-Index]],
nach Merge im Anwender-Katalog): `requirement`,
`function-description`, `specification`,
`architecture-description`, `test-case`,
`test-report`, `deployment-description`, `contract`,
`bug-report`, `system-component`, `system`,
`target-environment` — dazu die
MADR-Präzisierung des Basis-Typs `decision` (§4.10;
als Ergänzung im Basis-Eintrag
[[Katalog-Entscheidungen]]) und die Relations-Typen
`customer`, `competitor`, `partner` (geführt in
`wiki/Geschaeftsbeziehungen.md`, Katalog-Eintrag
[[Katalog-Geschaeftsbeziehungen]]).

**Dokumenttyp-Einträge unter SP-1:** SP-1 bringt die
Glieder der Kette P1–P15 als Dokumenttyp-Einträge mit
— je Glied ein Stand mit Zweck, Phase, Auslöser und
Filter: [[Katalog-Konzept-Stand]] (P1),
[[Katalog-Anforderungen-Stand]] (P3),
[[Katalog-Funktionsbeschreibung-Stand]] (P4),
[[Katalog-Architekturdokument]] (P5),
[[Katalog-Uebergabe]] (P6, beim Koordinator je
Komponente), [[Katalog-Technologie-Entscheidungen]]
(P7), [[Katalog-Spezifikation-Stand]] (P8),
[[Katalog-Testplan]] (P10),
[[Katalog-Entwickler-Doku]] (P11),
[[Katalog-Benutzer-Doku]] (P12),
[[Katalog-Deploy-Stand]] (P13, je Umgebung),
[[Katalog-Betriebs-Anleitung]] (P15, je Umgebung).
P2 und P14 haben keinen Stand; das Glied P9
ist der Tag der Implementierung ([[Kettenpruefung]]
§Kette). Die drei Doku-Glieder P11, P12 und P15 sind
selbsttragende Stände (§4.11; Auslöser ist die
Doku-Abfrage, [[Kettenpruefung]] §Kette). Nicht
Glieder der Kette sind das
selbsttragende [[Katalog-Uebergabe-Dokument]] und der
optionale [[Katalog-Fehlerstand]]. Die Marken-Typen
(Abschluss-Stand, Release-Notes, Übersicht gültiger
DECs) liegen in der Basis. Was ein Stand ist und wie
Freigaben geordnet sind: [[Einfrieren-und-Abloesen]],
[[Kettenpruefung]].

**Register-Detail-Knoten unter SP-1:** SP-1 bringt die
Register-Detail-Typen der Kette mit (hier ausgeführt:
`requirement` und `bug-report`; die übrigen in ihren
Katalog-Einträgen) — der Typ `decision` liegt in der Basis
(universeller Mechanismus); SP-1 präzisiert ihn nur.
Die Register-Typen teilen einheitliche Register-Felder
im Frontmatter (je Typ im Katalog-Eintrag) und folgen
der **Status-Achse** ihrer Register-Art; welche Zustände und
Felder je Register-Art gelten und dass der
Ablöseverweis nur im Feldpaar
`supersedes:`/`superseded_by:` steht:
[[Register-Lebenszyklus]] — lesen bei Statuswechseln.
Die Fassaden sind kanonisch für den Status; die
Detail-Knoten spiegeln (§3.3). Wann ein Detail-Knoten
Pflicht wird: Design-Regeln in §3.1 und die
`## Meta` der Fassade.

#### `requirement`

Eine einzelne Anforderung als Detail-Knoten zum
REQ-Eintrag in [[Anforderungen]]. Frontmatter-Felder:
[[Katalog-Anforderungen]] — lesen beim Anlegen eines
REQ-Knotens; Detail-Knoten-Pflicht, Sektionen und
Dateiname: `## Meta` von [[Anforderungen]].

#### `bug-report`

Eine einzelne Fehlermeldung als Detail-Knoten zum
BUG-Eintrag in [[Fehlermeldungen]] — die Meldung, nicht
die Reparatur (die läuft als Fix-Anforderung:
`requirement` mit `requirement_type: fix` im Abschnitt
„Fehlerbehebungen“ von [[Anforderungen]], das
Fehlermeldungen deshalb voraussetzt — oder, wenn die
Lösung eine geänderte oder neue Anforderung ist, als
diese REQ, auf die der BUG dann verweist).
Frontmatter-Felder, Freeze ab Anlage und
Sammelzustand: [[Katalog-Fehlermeldungen]] — lesen
beim Anlegen eines BUG-Knotens; Abgrenzung zum
REQ-Register, Duplikate, Detail-Knoten-Pflicht und
Sektionen: `## Meta` von [[Fehlermeldungen]].

#### `system-component`

Eine einzelne Komponente des Systems (Modul,
Baugruppe, Dienst) als Detail-Knoten. **Kein eigenes
Register** — Übersicht und Lage stehen in §Komponenten
der Fassade [[Systemarchitektur]], die für alle
Sollzustands-Aspekte kanonisch ist. Frontmatter-Felder
und Beispielname: [[Katalog-Systemarchitektur]];
Anlage-Schwelle (wann der Knoten Pflicht ist) und
Sektionen: `## Meta` von [[Systemarchitektur]] — lesen,
bevor ein Komponenten-Knoten angelegt wird.

**RP-1-Ablösung:** RP-1 löst diesen Typ ab durch
`software-system-component` (Softwaresystemkomponente) mit
software-spezifischen Feldern (API, Abhängigkeiten,
Test-Coverage) — siehe das RP-1-Teil-Wiki
(`referenzprozesse/RP-1-Systementwicklung/`).

#### `role` (Basis)

Die Rollen-Definitionen liegen seit 2.0 in der Basis
([[Rollen]], Typ `role`, Katalog-Eintrag
[[Katalog-Rollen]]). SP-1 nutzt sie mit
`rolle_art: verwendungsrolle` — die Rolle im
Nutzer-Prozess, den das Entwicklungs-Ergebnis
unterstützt (Ebene B, siehe §5; z.B. „Sachbearbeiter",
„Antragsteller", „Freigeber", „Endnutzer"). Bedarfe,
Szenarien und ihre RP-1-Spezialisierungen
referenzieren Rollen per `rollen:` und definieren sie
nicht inline; führender Ort ist das Rollen-Register.
Mit RP-1 erhält `role` zusätzlich das Feld
`system_abbildung:` (Ebene C; Details im
RP-1-Teil-Wiki, `referenzprozesse/RP-1-Systementwicklung/index.md`
§5).

#### Abgrenzung zu Basis-Kern-Detail-Typen und zu SP-1-Vorstufen

- **Basis-Kern-Detail-Typen** (`document`, `entity`,
  `concept`, `event`, `deadline`, `idea`, `decision`)
  bleiben aktiv unter SP-1 — SP-1 ergänzt nur.
- **Vorstufen `need` und `scenario`** liegen in der
  Basis ([[Bedarfe]], NEED; [[Szenarien]], SCEN) als
  Vorstufe für `requirement`; beide referenzieren
  Rollen per `rollen:`. Unter SP-1 filtert sie der
  Konzept-Stand der Phase P1
  ([[Katalog-Konzept-Stand]]); RP-1 ersetzt sie durch
  `user-story` bzw. `use-case`.
- **Einen Typ `structure` gibt es nicht:** redundant zu
  Systemarchitektur-Fassade + `system-component`
  (IEEE 42010: Architektur ⊃ Struktur).

### 3.3 Register-Status-Kanonizität als Ausnahme von Wiki.md §1.1a

Die Fassaden der Ketten-Register (z.B.
`wiki/Anforderungen.md`, `wiki/Fehlermeldungen.md`)
sind **kanonisch für den Status** ihrer Einträge; die
Detail-Knoten **spiegeln** (Wiki.md §1.1a). Das
vollständige Grundmuster (Vier-Schichten-Absicherung
bei Statuswechseln, Feldliste kanonisch vs.
gespiegelt, Abgrenzung zur Basis-Fassade
`Entscheidungen`): [[Register-Grundmuster]] — bei
Register-/Typ-Anlage und bei Statuswechsel-Fragen
lesen.

### 3.4 SP-1-Präfixe

Die **führende Deklaration** (vollständige
Präfix-Liste) steht im [[Steckbrief]]
§„Mitgebrachte Präfixe" — dort liest der Agent beim
Prozess-Merge (Wiki.md §11.3 Schritt 6);
einheitlich mit den übrigen
Mitbringsel-Deklarationen.

## 4. SP-1-eigene Mechanismen

SP-1 bringt eigene Mechanismen mit, die über die Basis-
Fähigkeiten hinausgehen. Hier die konsolidierte Übersicht.

### 4.1 Status-Achse der Register

Register-Einträge haben eine Status-Achse; welche
Zustände gelten, hängt von der Register-Art ab
(Sammel-, Eintritts-, Nachweis-Register). Die
Zustände je Register-Art samt Feld-Regeln
(`status_date`, `Auslöser:`, Ablöseverweis im
Feldpaar `supersedes:`/`superseded_by:`):
[[Register-Lebenszyklus]] — Nachschlag bei
Statuswechseln.

### 4.2 Wächter — SP-1-Trigger T2

Das Wächter-Grundkonzept und die Basis-Anlässe liegen
in der Basis (MasterPrompt §5.4 „Wächter-Trigger“).
**SP-1 ergänzt Trigger T2 — Prozess-Meilenstein-
Wechsel.** Die Anlass-Liste, der Umfang der Runde, die
Meilenstein-Regel „agent-lokal" und der
Koordinator-Meilenstein: [[Meilenstein-und-T2]]
— an Meilensteinen lesen.

### 4.3 Meilenstein-Vorgang

Ein **Meilenstein-Vorgang** ist ein SP-1-Konstrukt: ein
zusammenhängender Vorgang mit definiertem Ergebnis, der
mit einem Meilenstein (T2) abschließt — nicht jede
Aufgabe ist einer. Kennzeichen, Beispiele und das
Verhältnis zur Zug-Terminologie (MasterPrompt §6.1,
`Vorgehen-SP-1.md` §7): [[Meilenstein-und-T2]]
§Meilenstein-Vorgang — an Meilensteinen lesen.

### 4.4 Freigabe-Ausnahme für Code-Bereiche

MasterPrompt §1.1 legt fest, dass der Agent im Repo-Root
nur die Standard-Ordner verwaltet
(`raw/`, `input/`, `research/`, `tools/`, `wiki/`,
`output/`, `overview/`, `outgoing/`). Zusätzliche Ordner brauchen
eine **gebuchte Freigabe** — vom User oder von einem
Prozess. SP-1 deklariert die für Codeprojekte üblichen
**Code-Bereiche** (`src/`, `tests/`, `ci/`, weitere je
nach Scaffolding) in seiner Steckbrief-Sektion
„Mitgebrachte Ordner"; der Merge bucht die Freigabe
automatisch (MasterPrompt §1.1, Wiki.md §11.3 — beim
Init erst nach der Anlage der ersten Marke).
**Projekt-Werkzeuge** (keine Produkt-Artefakte)
gehören nicht in die Code-Bereiche, sondern in den
Basis-Standard-Ordner `tools/` (MasterPrompt §1.9).

Der konkrete Zuschnitt der Code-Bereiche steht in einer
Scaffolding-Vorlage (siehe `Vorgehen-SP-1.md` §4a,
Vorlage V4 „Struktur und Architekturmuster"). SP-1
liefert das Prinzip; die konkreten Ordner-Namen entstehen
im Instanz-Projekt.

### 4.5 `devstate_active.md` im Repo-Root

SP-1 legt eine spezielle Datei `devstate_active.md` im
Repo-Root an (nicht im `wiki/`): den **aktuellen
Zustandsbericht** als externen Einstiegspunkt für
Dritte, die den Stand brauchen, ohne das Wiki zu
lesen. Anlage-Zeitpunkt, Minimal-Skelett
(Sektionen, Zielmarken-Zeile) und der Gesamtstand des
Koordinators: [[devstate-Skelett]] — beim
Scaffolding und bei devstate-Pflege lesen.

### 4.6 Init-Aktivierung der Mitgebrachten Fassaden

Welche mitgebrachten Fassaden bei SP-1-Wahl ohne
Anwender-Frage aktiv werden und welche optional sind
(dazu die unter SP-1 verpflichtenden Basis-Fassaden):
[[Steckbrief]] §Mitgebrachte Fassaden; der
Merge-Ablauf: Wiki.md §11.3 — lesen beim Merge.
Optionale Basis-Fassaden wählt der Anwender in der
Init-Fassaden-Auswahl (MasterPrompt §5.3 Phase D).

**Vorauswahl-Empfehlungen für optionale Basis-Fassaden
unter SP-1:**

- **Fristen-Fassade:** aktiv empfohlen — bei
  termingebundenen Entwicklungsprojekten typisch.
- **Glossar-Fassade:** aktiv empfohlen —
  Entwicklungsprojekte bauen früh eigenes Vokabular auf.

### 4.7 Prüf- und Rechercheangebot — SP-1-R-Themen an P-Phasen

Die Prüf- und Recherche-Fähigkeit ist Basis
(MasterPrompt §5.6). SP-1 verankert konkrete **R-Themen
an P-Phasen** des Vorgehens-Rahmens (R1–R3, R6–R8,
R11). Welches Thema an welcher Phase zu welchem
Zeitpunkt angeboten wird: `Vorgehen-SP-1.md` §3, die
kanonische Bindungstabelle — lesen beim Eintritt in
eine Phase. Wie ein Angebot gebaut ist:
[[Angebots-und-Beauftragungs-Muster]]. Die weiteren
R-Themen R4/R5/R9/R10 sind RP-1-spezifisch (siehe
`referenzprozesse/RP-1-Systementwicklung/wiki/Vorgehen-RP-1.md`
§4).

### 4.8 Commit-Sprache-Vorauswahl

SP-1 empfiehlt beim Init die Commit-Sprache-Option **(B)**
(Sprache folgt Artefakt: Wiki/Dokumente Projektsprache,
Code englisch), passend zu Codeprojekt-Prozessen
(MasterPrompt §6.2). Der Anwender kann A oder C wählen;
SP-1 gibt nur die Vor-Empfehlung.

### 4.9 Abgrenzungen ähnlicher Strukturen

Als Pflichtabschnitt der SP-1-Instanz werden drei
Struktur-Abgrenzungen dokumentiert (kein Doppelstruktur-
Konflikt, beide Ebenen bleiben):

- `Offene Fragen.md` vs. `offen`-Registerstatus.
- `TODO.md` vs. `devstate_active.md`.
- `wiki/Chronologie.md` vs. Register-`status_date`.
- **Zielmarke vs. Meilenstein-Vorgang:** die
  Zielmarke ([[Zielmarken]]) ist ein geplanter
  **Horizont** (wohin gearbeitet wird); der
  Meilenstein-Vorgang (§4.3) ist eine
  abgeschlossene **Arbeits-Einheit** (was getan
  wurde). Mit dem gebuchten Zielmarken-Wechsel ist
  der Meilenstein „Marken-Abschluss“ erreicht (T2,
  §4.2); beide Ebenen bleiben.
  Vollform und typische Marke unter SP-1:
  [[Marken-SP-1]] §5 bzw. §2.

### 4.10 MADR-Angebot für das DEC-Template (Init-Frage)

SP-1 bietet beim Init an, das DEC-Template **streng
MADR-kompatibel** zu führen (prozess-spezifische
Init-Frage, gestellt über die Init-Kaskade MasterPrompt
§5.3 Turn 2):

- **Frage-Form:** Ja/Nein mit Voreinstellung **Nein**.
  Die lockere Variante gilt immer: die
  MADR-Kann-Frontmatter-Felder und die empfohlene
  Abschnitts-Folge stehen als SP-1-Präzisierung im
  `decision`-Abschnitt des Katalog-Eintrags
  [[Katalog-Entscheidungen]] und sind ohne weiteres
  nutzbar.
- **Bei Ja:** `document-format: madr` wird
  Projekt-Standard für neue DEC-Detail-Dateien
  (Abschnitte Pflicht, englische Kopfschlüssel, Kopf
  reine Buchhaltung). Der Agent vermerkt den Standard
  in der `## Meta` der Fassade [[Entscheidungen]];
  Bestands-DECs bleiben unangetastet (append-only).
- **Ableitbarkeit:** erwähnt der Startprompt bereits
  MADR-/ADR-Kompatibilität als Anforderung, wird die
  Frage abgeleitet statt gestellt und im
  Erledigt-Block ausgewiesen.
- **Unverändert:** Dateinamen und Fließtext-Sprache
  folgen der Projekt-Konvention; Register-Mechanik
  und Fassaden-Kanonizität gelten weiter.

### 4.11 Externe Doku-Ableitungen (`docs/`)

SP-1 deklariert den Ordner `docs/` (Steckbrief
§ Mitgebrachte Ordner) als **Ableitungs-Schicht**:
nach außen gerichtete Projekt-Doku — Benutzer-Doku,
Entwickler-Doku, Betriebs-Anleitungen, Handbücher —
**abgeleitet aus dem wiki/**, dort liegt die Wahrheit
(MasterPrompt §1.1-Grenzregel: solche Ordner sind nie
Wahrheits-Orte). Alle `docs/`-Dokumente sind
**selbsttragend** (Grade: MasterPrompt §9.6). Die drei
Doku-Glieder der Kette — Entwickler-Doku
([[Katalog-Entwickler-Doku]], P11), Benutzer-Doku
([[Katalog-Benutzer-Doku]], P12) und Betriebs-Anleitung
je Umgebung ([[Katalog-Betriebs-Anleitung]], P15) —
sind **selbsttragende Pflicht-Stände**: Der Stand, den
der Anwender freigibt, ist das Dokument, das
ausgeliefert wird; die freigegebene Version liegt als
`_VV_TLA` in `output/`, ihre Kopie in `docs/`. In der
Zwei-Repo-Standardbelegung liegt `docs/` im Produkt,
`output/` in der Werkstatt
([[Two-Repo-Submodul-Muster]] §Standardbelegung): Der
freigegebene Stand bleibt in `output/` der Werkstatt,
die Kopie des selbsttragenden Stands (z.B. die
Betriebs-Anleitung in `docs/ops/`) liegt in `docs/`
des Produkts. Im Ein-Repo-Fall liegen beide im selben
Repo. **Name der Kopie:** der Dateiname des Stands mit
Version (`<Datum> - Betriebs-Anleitung -
<Umgebung>_VV_TLA.md`); jede freigegebene Version hat
so ihre eigene Kopie, nichts wird überschrieben. Eine
**vorgefundene Ableitung** in `docs/` (außerhalb der
Kette entstanden, etwa vor einem Upgrade) bleibt
unverändert als Nachweis liegen — weder überschrieben
noch umbenannt; die Kopie des Stands liegt daneben.

- **Struktur:** Unterordner je Bedarf —
  `docs/developer/` (Entwickler-Doku), `docs/user/`
  (Benutzer-Doku), `docs/ops/` (Betriebs-Anleitungen)
  — weiterer Zuschnitt im Instanz-Projekt.
- **Herkunfts-Kopf:** jedes `docs/`-Dokument beginnt
  mit „abgeleitet aus dem wiki, Stand <Datum>" —
  Drift ist damit deklariert; bei Regel-Konflikt
  gilt das wiki. Hat sein Dokumenttyp einen
  Katalog-Eintrag (die drei Doku-Stände), trägt es
  zusätzlich dessen Herkunftszeile
  ([[Einfrieren-und-Abloesen]] §Stand). Die Kopie
  eines Doku-Stands ist deshalb inhaltsgleich, nicht
  byte-gleich mit dem Stand in `output/`: Frontmatter
  (mit der Herkunftszeile) und Text bleiben
  unverändert, der Herkunfts-Kopf steht als erste
  Zeile nach dem Frontmatter.
- **Neu-Ableitung statt Pflege:** `docs/`-Dokumente
  werden nicht von Hand nachgezogen, sondern zu ihrem
  Auslöser aus dem wiki bzw. aus ihren Quell-Ständen
  erzeugt (MasterPrompt §9.6, „Neu ableiten statt
  nachpflegen“) — für die drei Doku-Stände in der Form,
  die die Doku-Abfrage festlegt (komplett neu /
  Einarbeitung / Änderungsdokument; [[Kettenpruefung]]
  §Kette, Doku-Abfrage): auch bei Einarbeitung und
  Änderungsdokument stammt jeder Text aus dem Wiki,
  übernommene Kapitel kommen unverändert aus der
  Vollfassung, und die Prüfung geht über das ganze
  Dokument. Der Auslöser steht in der
  Auslöser-Zeile des Dokumenttyp-Eintrags (bei den drei
  Doku-Ständen die Doku-Abfrage); ohne
  eigenen Eintrag gilt der Standard-Auslöser
  ([[Katalog]], Auslöser-Zeile Standard) — lesen,
  bevor eine Neu-Ableitung angestoßen wird. Kein
  Lint-Zwang.
- **Zweck-Freigabe:** die drei Doku-Stände werden wie
  jeder Pflicht-Stand für den Zweck ihres
  Katalog-Eintrags freigegeben („für P13 Ausliefern“,
  „für P15 Betreiben“), nach Kettenprüfung und
  Verständnis-Check M6 (`Reviewmuster.md`); eine
  andere Neu-Ableitung wird wie jeder Stand für einen
  Zweck freigegeben — typische Zwecke: P13 Ausliefern,
  Versand. Wortlaut der
  Freigabe: `Vorgehen.md` §4 — lesen vor der Buchung.
  Die freigegebene Version geht als `_VV_TLA`-Version
  nach `output/` (MasterPrompt §1.5).
- **Vierfach-Abgrenzung Deploy-Umfeld:**
  Deploy-Skripte/IaC → `deploy/` (Code-Bereich) ·
  Pipeline-Definition → `ci/` bzw.
  Plattform-Konventions-Pfad (MasterPrompt §1.1) ·
  Betriebs-Anleitung für Menschen, selbsttragender
  Stand ([[Katalog-Betriebs-Anleitung]]) → `output/`,
  Kopie in `docs/ops/` ·
  Deploy-Stand je Umgebung, wiki-verweisend
  ([[Katalog-Deploy-Stand]]), und die übrigen
  Übergabe-Stände an Agenten/Ops → `output/`.
- **RP-1-Spezialisierung (KANN):** RP-1 darf die
  Erzeugung der API-Doku aus Code-Kommentaren
  automatisieren — sie ist Teil der Entwickler-Doku und
  ersetzt sie nicht ([[Katalog-Entwickler-Doku]];
  Sprach-Zonen: `Vorgehen-RP-1.md` §12).

### 4.12 Prozess-spezifische Init-Fragen

Dieser Abschnitt bündelt die Init-Fragen, die SP-1
mitbringt; die Init-Choreografie sammelt sie in Phase D
Turn 2 von hier ([[Init-Choreografie]] §Phase D,
Punkt 3) und ordnet sie mit denen eines erbenden
Prozesses nach Vorfestlegungs-Stärke (MasterPrompt
§5.1.0). Führend bleibt die jeweils verlinkte Stelle;
vor jeder Frage gilt die Ableitbarkeits-Prüfung
(MasterPrompt §5.1.0).

- **MADR-kompatibles DEC-Template** — Ja/Nein,
  Voreinstellung Nein; abgeleitet, wenn der Startprompt
  MADR/ADR schon verlangt: §4.10. _Legt vorab fest:_
  nur die Form neuer DEC-Einträge (die lockere Form
  gilt immer) — die schwächste Vorfestlegung, zuletzt.
- **Rolle des Repos** — keine Frage von SP-1: mit
  Startprompt ist die Rolle Komponent abgeleitet, ohne
  Startprompt gilt Standalone, bis P6 das Repo zum
  Koordinator macht (§5.2); nur RP-1 stellt ohne
  Startprompt eine Rollen-Frage (RP-1 `index.md` §6.1).
- **Vorauswahlen ohne eigene Frage:** die
  Commit-Sprache (B) für die Frage in Turn 1 (§4.8) und
  die Empfehlungen für optionale Basis-Fassaden in der
  Fassaden-Auswahl von Turn 2 (§4.6). _Legt vorab
  fest:_ nichts über die Turn-1- und
  Fassaden-Fragen hinaus.

## 5. Entwicklungs-Projekt-Rolle (Koordinator / Komponent / Standalone)

Die **Entwicklungs-Projekt-Rolle** (Ebene A₀ der
Rollen-Ebenen: A₀ Entwicklungs-Projekt, B Rollen im
Nutzer-Prozess, C System-Abbildung) — Koordinator /
Komponent / Standalone — unterscheidet, welche Position
ein Repo in einem Entwicklungsprojekt einnimmt, das in
P6 in Teilaktivitäten mit eigenen Repos zerlegt ist.
Terminologische Abgrenzung:
**Entwicklungs-Projekt-Rolle** ist die Rolle des
Entwicklungs-Repos selbst (nicht zu verwechseln mit der
Verwendungs-Rolle — `role` mit
`rolle_art: verwendungsrolle` im Basis-Register
[[Rollen]], §3.2; das ist Ebene B — Rollen im
Nutzer-Prozess). Die Rolle gehört zu SP-1: Zerlegen
(P5), Starten von Teilaktivitäten mit Start-Tabelle
(P6), Übergabe-Stand, Contract-Index und die
Meldepflicht der Komponenten sind Basis- und
SP-1-Mechanik (`Vorgehen.md` §3 und §3a,
[[Vorgehen-SP-1]] §6, [[Kettenpruefung]]); RP-1
präzisiert nur die Software-spezifische Ausstattung
(§5.3).

### 5.1 Ausprägungen

- **Standalone:** ein einzelnes Repo ohne Schnitt in
  Komponenten-Repos — der Standardfall, solange P6
  keine Teilaktivität mit eigenem Repo startet; es
  durchläuft alle Phasen selbst.
- **Koordinator:** das Repo, das in P6 Teilaktivitäten
  mit eigenen Repos startet. Hält den [[Contract-Index]]
  (CON-Elemente samt Versionskette und
  Consumer-Registrierungen), bildet je Komponente den
  Übergabe-Stand ([[Katalog-Uebergabe]]), bucht die
  Lieferungen der Komponenten am Marken-Eintrag
  ([[Zielmarken]]), führt den Gesamt-Deploy und die
  Doku-Glieder Gesamtsicht der Entwickler-Doku,
  Benutzer-Doku und Betriebs-Anleitungen
  ([[Vorgehen-SP-1]] §6); seine Pflichten in der
  Kette: [[Kettenpruefung]] §Freigabe-Ordnung des
  Koordinators. Mit RP-1 zeigt er zusätzlich den
  Gesamtstand als abgeleitete Sicht
  ([[devstate-Skelett]]).
- **Komponent:** ein Repo, das mit dem Startprompt
  seines Koordinators entstanden ist. Hält die eigene
  Kette bis P11 (Entwickler-Doku für ihr Bauteil) und
  ihre lokalen Freigaben; ihr Tag ist
  ihre Lieferung. Ist sie Provider eines Contracts,
  verhandelt sie ihn und meldet ihn per Nachricht;
  gebucht wird er beim Koordinator — ein eigenes
  CON-Register führt sie nicht. Zerlegt sie weiter, ist
  sie für ihre Unter-Komponenten Koordinator
  (Zwischen-Koordinator, [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art).

### 5.2 Erkennung der Entwicklungs-Projekt-Rolle

- **Mit Startprompt:** die Rolle **Komponent** ist
  vorab festgelegt; der Startprompt trägt einen
  expliziten Rolle-Vermerk. Was er sonst vorgibt und
  wie der Agent ihn im Init liest:
  [[Init-Choreografie]] §Init mit Startprompt
  (Komponente) — lesen beim Init mit Startprompt. Der
  Agent bucht Rolle und Übernahme-Art im
  Herkunfts-Vermerk von [[Aktivierter-Prozess]]
  ([[Init-Choreografie]] §Phase A0).
- **Ohne Startprompt:** Standalone ist die
  Voreinstellung. Mit RP-1 fragt der Init die Rolle
  ausdrücklich (Vorauswahl Standalone, Umschalt-Option
  Koordinator, falls der Anwender schon mehrere
  Komponenten-Repos plant; RP-1 `index.md` §6.1). Mit
  SP-1 allein stellt der Init keine Rollen-Frage: das
  Repo wird Koordinator, sobald P6 die erste
  Teilaktivität mit eigenem Repo startet (Start-Tabelle,
  `Vorgehen.md` §3); der Agent zieht dann die Zeile
  `Rolle` im Herkunfts-Vermerk nach.
- **Lint:** er liest die gebuchte Rolle nicht, sondern
  erkennt eine Komponente an `fuer_marke:` am
  Marken-Eintrag und einen Koordinator an §Komponenten
  der Architektur-Fassade (mit RP-1 an der Spalte
  Rolle) — [[Kettenpruefung]] §Lint-Anteil.

### 5.3 Rolle-abhängige Ausstattung

Mit SP-1: **Koordinator** — Contract-Index aktiv,
Übergabe-Stände, Lieferungs-Buchung, Gesamt-Deploy,
Gesamtsicht der Entwickler-Doku, Benutzer-Doku und
Betriebs-Anleitungen;
**Komponent** — Contract-Index deaktiviert (liegt beim
Koordinator), Kette bis P11, Lieferung und
Marken-Abschluss per Nachricht; **Standalone** — keine
Rollen-Ausstattung ([[Vorgehen-SP-1]] §6; Meilensteine
je Rolle: [[Meilenstein-und-T2]]). Was RP-1 ergänzt
(`devstate_active.md` §Gesamtstand, Spalte Rolle in
§Komponenten, Meilenstein-Zuschnitt):
`referenzprozesse/RP-1-Systementwicklung/index.md` §6
— lesen bei der Rollen-Wahl mit RP-1.

### 5.4 Warum in SP-1 dokumentiert

SP-1 trägt das Rolle-Konzept, weil Zerlegen, Starten
von Teilaktivitäten, Übergabe-Stand und Contract-Index
SP-1-Mechanik sind und ein Schnitt in Komponenten-Repos
in jeder Entwicklungsdomäne vorkommen kann; RP-1
konkretisiert nur die Software-spezifische Ausstattung.
