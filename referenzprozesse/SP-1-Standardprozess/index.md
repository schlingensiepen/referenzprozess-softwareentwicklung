---
type: process-mapping
process: SP-1
extends: []
---

# SP-1 Standardprozess Entwicklungsprojekt

**Stand:** 2026-08-24

Ich bin in [[Steckbrief]] beschrieben; diese Datei ist
meine **volle Prozess-Definition**. Konkret mache ich
Folgendes:

## 1. Ich bin SP-1

Ich bin der **Standardprozess für Entwicklungsprojekte** im
Template-Umfeld — allgemein für alle Entwicklungsdomänen
(Software, Hardware, System …). Du kannst mich **allein
instanziieren** — für ein einzelnes Entwicklungsprojekt
ohne besondere Domänen-Anforderungen reicht das aus. Für die
Entwicklung eines Softwaresystems mit mehreren Komponenten,
Contracts und Zweck-Freigaben gibt es
[RP-1 Entwicklung eines Softwaresystems](../RP-1-Systementwicklung/)
obendrauf, der SP-1 voraussetzt.

**Wichtig:** SP-1 ist **kein kompletter domänenspezifischer
Prozess**. Er **nutzt die Basis-Mechanismen** (Fassaden,
Detail-Knoten, Register-Muster, Ableiten-und-Vorlegen) und
**ergänzt konkrete Instanzen** (SP-1-Register `Anforderungen`
und `Fehlermeldungen`, SP-1-Sollzustands-Fassaden
`Systemarchitektur` und `Systemtest-Setup`, das
Verwendungs-Rollen-Register) plus **eigene Mechanismen**
(8-Zustands-Lebenszyklus, Wächter-T2-Trigger, zweck-gebundene
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
beim Merge (Wiki.md §11.3) im Anwender-`wiki/`. Die
Konventionen der SP-1-Detail-Knotentypen stehen in den
`## Meta`-Sektionen der jeweiligen Fassaden; der
Katalog-Anhang `wiki/Knotentypen-Anhang-SP-1.md` wird beim
Merge in die Anwender-`wiki/Knotentypen.md` eingespielt.
Die SP-1-Betriebs-Mechanik liegt als mitgebrachte
`internal-*`-Knoten ebenfalls im Prozess-Teil-Wiki
(Deklaration samt Einführungs-Anweisungen:
[[Steckbrief]] §„Mitgebrachte Mechanik").
Das Init-Prompt-Fragment für die SP-1-Wahl steht in
der [[Init-Choreografie]] (Kern-Kurzform MasterPrompt
§5.3 Phase D).

**Wie SP-1 auf die Basis aufsetzt.** Drei Kategorien:

**Nutzt aus der Basis** (nicht dupliziert, nicht neu
definiert): Fassaden- und Detail-Knoten-Mechanismus,
Feld-Kanonizität (Wiki.md §1.1a), Ingest, Cross-References,
Lint, Snapshots, Sync-Pflicht (Wiki.md §10b), Progressive
Disclosure,
Ableiten-und-Vorlegen, Do-first-mit-Veto, `Tools.md`,
MasterPrompt-Präfix-System, Frist-Lebenszyklus (wenn
`Fristen.md` aktiv). Alles im MasterPrompt und in Wiki.md
verankert — hier nicht wiederholt.

**Aktiviert als konkrete Instanzen** (§3): die
SP-1-Fassaden (`Anforderungen`, `Fehlermeldungen`,
`Systemarchitektur`, `Systemtest-Setup`,
`Verwendungs-Rollen`) und die zugehörigen
SP-1-Detail-Knotentypen (`requirement`, `bug-report`,
`system-component`, `system`, `role`),
Register-Status-Kanonizität als konkrete
§1.1a-Ausnahme und SP-1-typische Präfixe (§3.4).
SP-1 **nutzt** die Basis-Werkzeug-Kategorien der
`Tools.md` (Prüf-, Recherche-, Kadenz-Werkzeuge,
MasterPrompt §7.5), bringt aber keine eigenen
`Tools.md`-Inhalte mit. `Entscheidungen` ist
Basis-Fassade (universeller Mechanismus);
`Systemarchitektur` und `Systemtest-Setup` sind generische
SP-1-Fassaden, die RP-1 mit Softwaresystem-Kompositum
überschreibt.

**Bringt eigene Mechanismen mit** (§4): 8-Zustands-
Lebenszyklus, Wächter mit Meilenstein-Regel, zweck-gebundene
Freigaben, Prüf- und Rechercheangebot in prozess-typischer
Anwendung, Init-Verzahnung mit Prozess-Angebot,
Rolle-Konzept (§5).

**Lazy-Loading durch selektive Aktivierung.** Ohne SP-1-Wahl
im Init passiert nichts von alldem: die SP-1-Fassaden-
Skelette und die mitgebrachten Mechanik-Knoten bleiben
im SP-1-Teil-Wiki
(`referenzprozesse/SP-1-Standardprozess/wiki/`) und werden
nicht ins Anwender-`wiki/` gemerged; die SP-1-Detail-Typen
bleiben im SP-1-Katalog-Anhang und werden nicht in das
Anwender-`wiki/Knotentypen.md` eingespielt; das Init-Prompt-
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

SP-1 aktiviert folgende Fassaden zusätzlich zur Basis.
Alle folgen dem Fassaden-Mechanismus aus Wiki.md §3a —
hier nur die SP-1-typischen Zusätze.

| Fassade | Typ | Zweck | ID-Präfix |
|---|---|---|---|
| `wiki/Anforderungen.md` | `requirement-log` | Register aller Anforderungen (setzt Entwicklungsvorhaben voraus) | REQ-NNN |
| `wiki/Fehlermeldungen.md` | `bug-report-log` | Register aller Fehlermeldungen (setzt gebautes Ding + Nutzung voraus) | BR-NNN |
| `wiki/Systemarchitektur.md` | `system-architecture-overview` | Sollzustands-Fassade Systemarchitektur (generisch); RP-1 löst mit `Softwaresystemarchitektur` ab | — |
| `wiki/Systemtest-Setup.md` | `system-test-setup` | Sollzustands-Fassade Systemtest-Setup (generisch); RP-1 löst mit `Softwaresystemtest-Setup` ab | — |
| `wiki/Verwendungs-Rollen.md` | `role-log` | Register aller Verwendungs-Rollen (Nutzer-Prozess-Ebene B, siehe §5 — Sachbearbeiter, Antragsteller, Endnutzer etc.); referenziert von `need`, `scenario` und ihren RP-1-Spezialisierungen `user-story`/`use-case`. Mandatory — beim Merge automatisch aktiv; spätere Deaktivierung über die allgemeine Mechanik (Wiki.md §3a/§11.3) möglich | — |
| `wiki/Geschäftsbeziehungen.md` | `business-relation-log` | Register der Beziehungen zu externen Organisationen über die Relations `customer`/`competitor`/`partner` (Organisation↔Projektaspekt). Optional, Vorauswahl deaktiviert — bei Produktentwicklung Empfehlung aktivieren | — |

**Zur Abgrenzung:** `wiki/Entscheidungen.md`
(`decision-log`) ist keine SP-1-Fassade, sondern
**Basis-Fassade** — universeller Mechanismus, jedes
Projekt dokumentiert Entscheidungen.

**Ablage:** Die SP-1-Fassaden-Skelette liegen im SP-1-
Teil-Wiki (`referenzprozesse/SP-1-Standardprozess/wiki/`),
Wiki.md §11. Beim Merge (Wiki.md §11.3) kopiert der Agent
sie in das Anwender-`wiki/` — die im Folgenden genannten
Pfade `wiki/Anforderungen.md` etc. beziehen sich immer auf
die Anwender-Sicht nach Merge.

**Gemeinsame Design-Regeln** (gelten für alle
SP-1-Fassaden):

- **Frontmatter:** `type: <log-typ>` gemäß Tabelle;
  `active` auskommentiert (Default `active: true`, siehe
  Wiki.md §3a). Nach Merge greift die Aktivierungs-Regel
  aus Wiki.md §11.3: alle SP-1-Fassaden sind mandatory
  (Steckbrief § Mitgebrachte Fassaden) und werden ohne
  Anwender-Frage aktiv.
- **Kanonizitäts-Marker im Fassaden-Text:** Standardsatz
  „Die Wahrheit bei <Status-Feld> liegt in dieser Fassade —
  Detail-Knoten spiegeln (Wiki.md §1.1a)".
  Formalisierung als konkrete §1.1a-Ausnahme in §3.3.
- **Stand-Zeile:** „_(vom Agenten beim Ingest und laufend
  gepflegt)_".
- **Statuswerte:** kommen aus dem 8-Zustands-Lebenszyklus
  (§4.1); Register-Fassaden benennen sie am Eintragsformat.
- **Detail-Knoten-Pflicht** einheitlich: sobald Nachweis,
  Vermerke, Umsetzungs-Notizen, längere Beschreibung oder
  zitierpflichtige Bezüge anfallen. Kein Detail-Knoten für
  Register-Einträge, die eine Zeile bleiben.
- **Eintragsformat der Register-Fassaden:** `### <ID> —
  <Kurzsatz>` als H3-Überschrift, danach Feldliste als
  Bullet-Points: `Status:` (Pflicht), `Datum:` (Pflicht,
  letzter Statuswechsel), `Auslöser:` (nur bei `aufgeschoben`
  oder `umgesetzt-wartet-auf-Prüfung`), `Verweise:`,
  `Detail:` (Wikilink, nur wenn Detail-Knoten existiert),
  typspezifische Zusatzfelder.

**Fassaden-typische Zusätze** (nur Nicht-Ableitbares):

- **`Anforderungen.md`:** Gliederung in `## Funktional` und
  `## Nicht-funktional`. Beide Sektionen chronologisch nach
  ID sortiert.
- **`Fehlermeldungen.md`:** eine Sektion `## Einträge`,
  chronologisch. Klare Abgrenzung: Register führt
  **Meldungen**, nicht Arbeit — die Reparatur läuft als
  Anforderung im REQ-Register (Zusatzfeld
  `Fix-Anforderung: [[REQ-XXX]]`). Zusatzfeld `Original:
  [[BR-XXX]]` nur bei Duplikat-Ablösung.
- **`Systemarchitektur.md`:** generische Sektionen
  Zweck+Abgrenzung / Bausteine / Beziehungen /
  Verantwortungen / Design-Prinzipien. Sollzustand — nicht
  fortgeschrieben, bei Änderungen überschrieben. Detail-
  Knoten `system-component` optional für einzelne Bausteine
  (die Übersicht behält die Fassade). RP-1 löst diese
  Fassade mit `Softwaresystemarchitektur.md` ab.
- **`Systemtest-Setup.md`:** generische Sektionen
  Testarten / Testumgebung / Ausführung / Ausnahmen (z.B.
  „keine externen Dienste"). Sollzustand — analog
  Systemarchitektur. RP-1 löst mit
  `Softwaresystemtest-Setup.md` ab.
- **`Verwendungs-Rollen.md`:** eine Sektion `## Einträge`,
  Rollen alphabetisch sortiert. Register-Grundmuster nach
  §3.3 ([[Register-Grundmuster]]; Fassade kanonisch
  für Status; Detail-Knoten
  spiegelt). Eintragsformat der Rollen-Zeilen enthält
  zusätzlich das Feld `Verwendet in: [[…]]` als
  Rückverweis-Sammler auf die referenzierenden `need`-,
  `scenario`-, `user-story`- und `use-case`-Knoten. Der
  Detail-Typ `role` selbst ist in §3.2 beschrieben.

### 3.2 SP-1-Detail-Knotentypen

SP-1 bringt folgende Detail-Knotentypen mit (konkrete
Frontmatter-Definitionen im Katalog-Anhang
`wiki/Knotentypen-Anhang-SP-1.md`, nach Merge in der
Anwender-`wiki/Knotentypen.md`): `requirement`,
`bug-report`, `system-component`, `system`, `role` —
dazu die MADR-Präzisierung des Basis-Typs `decision`
(§4.10) und die Relations-Typen `customer`,
`competitor`, `partner` (geführt in
`wiki/Geschäftsbeziehungen.md`, beim Merge in den
Relations-Katalog eingespielt).

#### `requirement`

**Zweck:** eine einzelne Anforderung als Detail-Knoten zum
REQ-Eintrag im `wiki/Anforderungen.md`-Register.

**Verhältnis zur Fassade:** die Fassade
`wiki/Anforderungen.md` ist **kanonisch für den
8-Zustands-Status** (nach §3.3); der Detail-Knoten
spiegelt den Status und trägt den Body-Inhalt (Nachweis,
Vermerke, ausformulierte Beschreibung, zitierpflichtige
Bezüge).

**Detail-Knoten-Pflicht:** sobald mindestens eines
auftritt: Nachweis, Vermerke, Umsetzungs-Notizen,
ausformulierte Beschreibung länger als ein Satz,
zitierpflichtige Bezüge. Sonst reicht die Fassaden-Zeile.

**Frontmatter-Kern:** `type: requirement`, `id`
(Format `REQ-NNN`), `status` (8-Zustand), `status_date`,
optional `trigger` (Datum oder
Zielmarken-Bezeichnung) / `zielmarke`
(Marken-Bezeichnung; nur wenn verschoben oder für
eine Marke geplant) / `superseded_by`.

**Struktur-Konventionen:** `## Meta` der Fassade
`wiki/Anforderungen.md`.

#### `bug-report`

**Zweck:** eine einzelne Fehlermeldung als Detail-Knoten
zum BR-Eintrag im `wiki/Fehlermeldungen.md`-Register.

**Verhältnis zur Fassade:** analog `requirement` — Fassade
kanonisch für Status; Detail-Knoten trägt
Reproduktionsschritte, Umgebung, Analyse, Vermerke.

**Detail-Knoten-Pflicht:** wie bei `requirement`.
Insbesondere bei komplexen Fehlern mit Reproduktions-
Setup fast immer Pflicht.

**Frontmatter-Kern:** `type: bug-report`, `id`
(Format `BR-NNN`), `status`, `status_date`, optional
`trigger` (Datum oder Zielmarken-Bezeichnung) /
`zielmarke` (Marken-Bezeichnung; nur wenn verschoben
oder für eine Marke geplant) / `superseded_by` /
`original` (bei Duplikat-
Ablösung, verweist auf ursprünglichen Bericht) /
`fix_requirement` (Verweis auf REQ-Eintrag, sobald
angelegt).

**Struktur-Konventionen:** `## Meta` der Fassade
`wiki/Fehlermeldungen.md`.

**Abgrenzung zum REQ-Register:** ein `bug-report`
dokumentiert die **Meldung** (was wurde beobachtet, wo,
wie reproduzierbar); die eigentliche Reparaturarbeit läuft
als `requirement` im REQ-Register (mit `Fix-Anforderung:
[[REQ-XXX]]`-Verweis). Damit bleibt die BR-Fassade eine
saubere Meldungsliste, nicht eine Aufgabenliste.

#### `system-component`

**Zweck:** ein einzelner Baustein des Systems (Komponente,
Modul, Baugruppe) als Detail-Knoten. **Kein Register**
(keine Fassade `wiki/Systemkomponenten.md` — die Übersicht
liegt in der `Systemarchitektur`-Fassade selbst).

**Verhältnis zur Systemarchitektur-Fassade:** die Fassade
`wiki/Systemarchitektur.md` ist **kanonisch für alle
Sollzustands-Aspekte** (Zweck+Abgrenzung, Bausteine,
Beziehungen, Verantwortungen). Der `system-component`-
Detail-Knoten wird angelegt, wenn ein Baustein
eigenständige Behandlung braucht: eigene Schnittstellen-
Beschreibung, Verantwortlichkeiten, Abhängigkeiten,
Zitat-Referenzen.

**Detail-Knoten-Anlage:** nach der Anlage-Schwelle in
der `## Meta` der Fassade `wiki/Systemarchitektur.md`
(führender Ort): **Pflicht**, sobald ein Baustein einen
eigenen Bearbeiter oder Peer-Agenten, einen Contract
oder ein eigenes Repository hat; darunter Kann —
Faustregel: sobald ein Baustein mehrfach referenziert
wird, eigene Schnittstellen hat oder als
Argumentations-Anker in weiteren Dokumenten dient.

**Frontmatter-Kern:** `type: system-component`,
Beispielname im Title-Case (`Auth Modul.md`,
`Sensorik Baugruppe.md`); optional
`system_component_type` (Enum: `service` | `library` |
`component` | `module` | `baugruppe`, erweiterbar).

**Struktur-Konventionen:** `## Meta` der Fassade
`wiki/Systemarchitektur.md`.

**RP-1-Ablösung:** RP-1 löst diesen Typ ab durch
`software-system-component` (Softwaresystemkomponente) mit
software-spezifischen Feldern (API, Abhängigkeiten,
Test-Coverage) — siehe das RP-1-Teil-Wiki
(`referenzprozesse/RP-1-Systementwicklung/`).

#### `role`

**Zweck:** eine einzelne Verwendungs-Rolle im
Nutzer-Prozess, den das Entwicklungs-Ergebnis
unterstützt (Ebene B, siehe §5). Beispiele:
„Sachbearbeiter", „Antragsteller", „Freigeber",
„Werkstattleiter", „Endnutzer" — domänen-agnostisch,
gehört deshalb in SP-1, nicht in RP-1.

**Verhältnis zur Fassade:** die Fassade
`wiki/Verwendungs-Rollen.md` ist kanonisch für Status
und Kurzbeschreibung (nach §3.3). Der Detail-Knoten
`role` spiegelt und trägt ausformulierte Beschreibung
(Verantwortlichkeiten, Verhaltens-Muster, typische
Aufgaben, Abgrenzungen zu ähnlichen Rollen).

**Frontmatter (Basis-Felder):** `type: role`, `id:
<slug>` (sprechender Slug wie `sachbearbeiter`,
`freigeber`), `status`, `status_date`, `verwendet_in:`
(Liste von Knoten-Slugs als Strings, keine Wikilinks im
Frontmatter — Wiki.md §4.1) auf die referenzierenden
`need`-/`scenario`-/`user-story`-/`use-case`-Knoten.

**RP-1-Ergänzung:** in RP-1-aktivierten Projekten
bekommt `role` zusätzlich das Feld `system_abbildung:`
(String-Notation), das auf die technische Umsetzung der
Rolle im Ziel-System verweist (Ebene C — Nutzer-Konten,
Zugriffsrechte, Berechtigungsprofile). Details im
RP-1-Teil-Wiki
(`referenzprozesse/RP-1-Systementwicklung/index.md` §5).

**Führender Ort:** `role` in `wiki/Verwendungs-Rollen.md`
ist der führende Ort für Rollen-Definitionen.
`use-case`-, `anwendungsfall`-, `user-story`- und
`scenario`-Detail-Knoten dürfen Rollen nur
**referenzieren** (per `rollen:`-Frontmatter-Feld),
nicht inline neu definieren. Wenn beim Ausformulieren
eine neue Rolle auftaucht, wird sie zuerst im
Verwendungs-Rollen-Register angelegt und dann
referenziert.

**Struktur-Konventionen:** `## Meta` der Fassade
`wiki/Verwendungs-Rollen.md`.

#### Abgrenzung zu Basis-Kern-Detail-Typen und zu SP-1-Vorstufen

- **Basis-Kern-Detail-Typen** (`document`, `entity`,
  `concept`, `event`, `deadline`, `idea`, `decision`)
  bleiben aktiv unter SP-1 — SP-1 ergänzt nur.
- **Generische SP-1-Vorstufen `need` und `scenario`**
  sind eigenständige SP-1-Detail-Typen und liegen als
  Vorstufe für `requirement`: `need` (rollen-basierter
  Bedarf — die referenzierten Rollen leben führend in
  `wiki/Verwendungs-Rollen.md`, Detail-Typ `role`),
  `scenario` (Ablauf/Interaktion; referenziert ebenfalls
  Verwendungs-Rollen). RP-1 spezialisiert sie zu
  `user-story` bzw. `use-case`. Konzeptuelle Ausarbeitung
  von `need`/`scenario` folgt bei einer eigenen
  SP-1-Ergänzung (aktuell nur im Katalog-Anhang benannt).
- **Einen Typ `structure` gibt es nicht:** redundant zu
  Systemarchitektur-Fassade + `system-component`
  (IEEE 42010: Architektur ⊃ Struktur).

### 3.3 Register-Status-Kanonizität als §1.1a-Ausnahme

Die Register-Fassaden `wiki/Anforderungen.md` und
`wiki/Fehlermeldungen.md` sind **kanonisch für den
8-Zustands-Status**; die Detail-Knoten (`requirement`,
`bug-report`) **spiegeln** (Wiki.md §1.1a). Das
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
Prozess-Merge (Wiki.md §11.3 Schritt 6, DEC-208);
einheitlich mit den übrigen
Mitbringsel-Deklarationen.

## 4. SP-1-eigene Mechanismen

SP-1 bringt eigene Mechanismen mit, die über die Basis-
Fähigkeiten hinausgehen. Hier die konsolidierte Übersicht.

### 4.1 8-Zustands-Lebenszyklus für Register

Register-Einträge (REQ, BR — und auf gleichem Muster:
DEC in der Basis) folgen einem festen
8-Zustands-Lebenszyklus von `offen` bis `abgelöst
durch <ID>`. Die vollständige Zustandsfolge samt
Feld-Regeln (`status_date`, `Auslöser:`,
Ablöseverweis): [[Register-Lebenszyklus]] —
Nachschlag bei Statuswechseln.

### 4.2 Wächter — SP-1-Trigger T2

Das Wächter-Grundkonzept liegt in der Basis mit den
Triggern T1 (Sessionstart) und T3 (User-Anfrage).
**SP-1 ergänzt Trigger T2 — Prozess-Meilenstein-
Wechsel** (Meilenstein-Vorgänge, Freigabe-Buchungen,
Scaffolding-Schritte, Zielmarken-Wechsel). Die volle
Trigger-Liste und die Meilenstein-Regel „agent-lokal,
mit Aggregaten für Koordinator": [[Meilenstein-und-T2]]
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
automatisch (MasterPrompt §1.1, Wiki.md §11.3).
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
(Sektionen, Zielmarken-Zeile) und die
Koordinator-Regel (kein separates
`devstate_system.md`): [[devstate-Skelett]] — beim
Scaffolding und bei devstate-Pflege lesen.

### 4.6 Init-Aktivierung der Mitgebrachten Fassaden

Bei SP-1-Wahl im Init aktiviert der Agent alle
SP-1-Fassaden (`Anforderungen`, `Fehlermeldungen`,
`Systemarchitektur`, `Systemtest-Setup`,
`Verwendungs-Rollen`) automatisch — sie sind laut
Steckbrief-Sektion `§ Mitgebrachte Fassaden` durchgängig
**mandatory** und damit keine Init-Fassaden-Auswahl-Option
(Merge-Ablauf: Wiki.md §11.3). Basis-Fassaden folgen der
mandatory/optional-Nomenklatur aus Wiki.md §3a und werden
— soweit optional — per Init-Fassaden-Auswahl gewählt
(MasterPrompt §5.3 Phase D).

**Vorauswahl-Empfehlungen für optionale Basis-Fassaden
unter SP-1:**

- **Fristen-Fassade:** aktiv empfohlen — bei
  termingebundenen Entwicklungsprojekten typisch.
- **Glossar-Fassade:** aktiv empfohlen —
  Entwicklungsprojekte bauen früh eigenes Vokabular auf.

### 4.7 Prüf- und Rechercheangebot — SP-1-R-Themen an P-Phasen

Die Prüf- und Recherche-Fähigkeit ist Basis
(MasterPrompt §5.6). SP-1 verankert konkrete **R-Themen
an P-Phasen** des Vorgehens-Rahmens. Die vollständige
Bindungstabelle mit Zeitpunkt je Phase ist die kanonische
Quelle in `Vorgehen-SP-1.md` §3; hier nur die
SP-1-Themenmenge als Umfangs-Angabe:

- **R1** Normen, Recht, Regulatorik
- **R2** Fachrecherche Domäne
- **R3** Vergleichbare Werkzeuge / Fertiglösungen
- **R6** Passende Technologien
- **R7** Best Practices Toolchain und Testdesign
- **R8** Sicherheitslage und Lebenszyklus
- **R11** Lizenzkompatibilität

Der Agent bietet zu diesen Themen die passende Recherche
im Standard-Angebotsformat (MasterPrompt §5.6) an. Die
weiteren R-Themen R4/R5/R9/R10 sind RP-1-spezifisch
(siehe
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
  wurde). Ein Zielmarken-Wechsel ist ein
  T2-Ereignis (§4.2), aber kein
  Meilenstein-Vorgang; beide Ebenen bleiben.

### 4.10 MADR-Angebot für das DEC-Template (Init-Frage)

SP-1 bietet beim Init an, das DEC-Template **streng
MADR-kompatibel** zu führen (prozess-spezifische
Init-Frage, gestellt über die Init-Kaskade MasterPrompt
§5.3 Turn 2):

- **Frage-Form:** Ja/Nein mit Voreinstellung **Nein**.
  Die lockere Variante gilt immer: die
  MADR-Kann-Frontmatter-Felder und die empfohlene
  Abschnitts-Folge stehen im `decision`-Block des
  `Knotentypen-Anhang-SP-1.md` und sind ohne weiteres
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
nach außen gerichtete Projekt-Doku — User-Doku,
Developer-Doku, Betriebs-Anleitungen, Handbücher —
**abgeleitet aus dem wiki/**, dort liegt die Wahrheit
(MasterPrompt §1.1-Grenzregel: solche Ordner sind nie
Wahrheits-Orte).

- **Struktur:** Unterordner je Bedarf (`docs/user/`,
  `docs/developer/`, `docs/ops/`) — Zuschnitt im
  Instanz-Projekt.
- **Herkunfts-Kopf:** jedes `docs/`-Dokument beginnt
  mit „abgeleitet aus dem wiki, Stand <Datum>" —
  Drift ist damit deklariert; bei Regel-Konflikt
  gilt das wiki.
- **Pflege-Trigger:** Freigaben/Releases und Zuruf;
  kein Lint-Zwang.
- **Handbücher** (Anwender, Entwickler) sind
  Dokumente in `docs/` — gepflegte Ableitungen;
  geschlossene Release-Fassungen gehen zweigleisig
  als `_VV_TLA`-Stand nach `output/`
  (MasterPrompt §1.5).
- **Zweck-Freigabe (DEC-214):** `docs/`-Stände
  werden nach der kanonischen Formel freigegeben
  („Stand x von ⟨Handbuch⟩, freigegeben für Zweck
  Z") — typische Zwecke: P10 Ausliefern, Versand;
  Handbücher sind **selbsttragend**
  (MasterPrompt §9.6).
- **Vierfach-Abgrenzung Deploy-Umfeld:**
  Deploy-Skripte/IaC → `deploy/` (Code-Bereich) ·
  Pipeline-Definition → `ci/` bzw.
  Plattform-Konventions-Pfad (MasterPrompt §1.1) ·
  Doku für Menschen → `docs/ops/` ·
  Übergabe-Stände an Agenten/Ops → `output/`.
- **RP-1-Spezialisierung (KANN):** RP-1 darf die
  Developer-Doku-Ableitung automatisieren (z.B.
  API-Doku aus Code-Kommentaren) — eigene
  Ausgestaltung dort.

## 5. Entwicklungs-Projekt-Rolle (Koordinator / Komponent / Standalone)

Die **Entwicklungs-Projekt-Rolle** (Ebene A₀ der
Rollen-Ebenen: A₀ Entwicklungs-Projekt, B Rollen im
Nutzer-Prozess, C System-Abbildung) — Koordinator /
Komponent / Standalone — unterscheidet, welche Position
ein SP-1-Agent im Kontext eines mehr-Repos-Projekts
einnimmt. Terminologische Abgrenzung:
**Entwicklungs-Projekt-Rolle** ist die Rolle des
Entwicklungs-Repos selbst (nicht zu verwechseln mit der
Verwendungs-Rolle `role` aus §3.2 in
`wiki/Verwendungs-Rollen.md`, das ist Ebene B — Rollen im
Nutzer-Prozess). Das Konzept selbst ist eng mit RP-1
verzahnt (mehrere Komponenten-Repositories aus einem
Softwaresystem); SP-1 nutzt es abhängig von der
aktivierten Konstellation.

### 5.1 Ausprägungen

- **Standalone:** ein einzelnes Repo, kein
  Koordinator/Komponent-Split, keine Contract-Kette. Das
  ist der **Standardfall bei SP-1 ohne RP-1** —
  einzelnes Entwicklungsprojekt ohne Softwaresystem-
  Aufteilung.
- **Koordinator:** das führende Repo eines
  Softwaresystems (RP-1). Hält Contract-Index,
  Aggregate über Komponenten-Freigaben, Gesamtstands-
  Übersicht.
- **Komponent:** ein einzelnes Komponenten-Repo eines
  Softwaresystems (RP-1). Hält die eigene Komponente,
  ihre Contracts als Provider, ihre lokalen Freigaben.

### 5.2 Erkennung der Entwicklungs-Projekt-Rolle

**Bei SP-1 ohne RP-1 (Standalone):** keine Rolle-
Zuordnung nötig. Der Agent verhält sich als einzelner
Agent auf einem einzelnen Repo.

**Bei aktiviertem RP-1 in Mehr-Repo-Setup:** die Rolle
wird per Startprompt gesetzt. Das Startprompt-Format
(siehe `referenzprozesse/RP-1-Systementwicklung/index.md`
§5) enthält einen expliziten Rolle-Vermerk. Der
Anwender-Agent liest den Startprompt beim ersten
Sessionstart und setzt die Rolle im
`internal-rule`-Knoten [[Aktivierter-Prozess]]
persistent.

**Bei aktiviertem RP-1 im Erst-Init eines einzelnen
neuen Repos** (kein Startprompt vorhanden, kein
existierendes Mehr-Repo-Setup): der Anwender-Agent
fragt den User explizit im Init-Frage-Block —
Vorauswahl **Standalone**, mit Umschalt-Option auf
Koordinator, falls der User bereits mehrere
Komponenten-Repos plant. Dokumentation der Wahl im
`internal-rule`-Knoten [[Aktivierter-Prozess]].

### 5.3 Rolle-abhängige Ausstattung

Die konkreten Konsequenzen der Rolle-Wahl liegen in RP-1
(dessen Ausstattung ist rollen-differenziert):

- **Koordinator:** Contract-Index-Fassade aktiv;
  `devstate_active.md` §Gesamtstand aggregiert alle
  Komponenten; Zweck-Freigaben der Gesamtsystem-Phasen
  plus Aggregate über die Komponenten als eigene
  Meilensteine.
- **Komponent:** Contract-Index deaktiviert (`active:
  false` — liegt beim Koordinator);
  `devstate_active.md` beschreibt nur die eigene
  Komponente; Zweck-Freigaben der eigenen Komponente
  als Meilensteine.
- **Standalone:** keine Rolle-Ausstattung (SP-1 ohne
  RP-1); alle Zweck-Freigaben des eigenen Repos als
  Meilensteine (kein Split; Wächter läuft agent-lokal).

Details siehe
`referenzprozesse/RP-1-Systementwicklung/index.md` §5.

### 5.4 Warum in SP-1 dokumentiert

SP-1 beschreibt das Rolle-Konzept auf konzeptioneller
Ebene (drei Rollen, Standardfall Standalone), weil das
Konzept auch bei SP-1-ohne-RP-1 relevant ist als
Nicht-Verwendung („Standalone ist der Default"). RP-1
konkretisiert die Rolle-Ausstattung; SP-1 sagt nur, dass
das Konzept existiert.
