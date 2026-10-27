---
type: process-mapping
---

# RP-1 Entwicklung eines Softwaresystems

**Bearbeitungsstand:** 2026-10-25

Ich bin in [[Steckbrief]] beschrieben (Prozess-Felder
samt `extends:`, Einstufung der mitgebrachten
Fassaden, Präfixe und Mechanik — lesen beim Merge und
bei der Prozess-Wahl); konkret mache ich Folgendes:

## 1. Ich bin RP-1

Ich bin der **Referenzprozess für die Entwicklung eines
Softwaresystems** — aufsetzend auf
[SP-1](../SP-1-Standardprozess/). Wenn du mich wählst,
gelten SP-1 und meine Zusatzregeln zusammen — meine
Regeln ergänzen und modifizieren SP-1 nur dort, wo die
Entwicklung eines Softwaresystems mit mehreren
Komponenten besondere Anforderungen stellt (Rollen,
Zweck-Freigaben, Contracts, Prüf-/Recherche-Verankerung,
Rücklauf).

**Voraussetzung:** SP-1 ist als Standardprozess bereits
verstanden. Ohne SP-1 fehlen die Grundmuster, auf denen
RP-1 aufbaut.

## 2. Rolle dieser Datei und Wie RP-1 auf SP-1 aufsetzt

**Rolle.** Diese Datei ist die **volle Definition von
RP-1** — sie beschreibt, was RP-1 an Fassaden,
Detail-Knotentypen, Präfixen und eigenen Mechanismen
mitbringt. Der [[Steckbrief]] ist die schlanke
Selbstvorstellung für das Init-Angebot; das Vorgehen
(P-Phasen-Belegung, Angebote an Phasen, Wechsel-,
Contract- und Rücklauf-Mechanik) steht in
[[Vorgehen-RP-1]]. Ablage-Konvention: Wiki.md §11.

**Wie RP-1 auf SP-1 aufsetzt.** Drei Kategorien:

**Nutzt alles aus der Basis und aus SP-1** (nicht
dupliziert) — die Basis-Mechanismen stehen im
MasterPrompt und in Wiki.md, die SP-1-Mechanismen in
SP-1 `index.md` §4;
lesen dort, wenn eine Regel hier nicht vorkommt.

**Aktiviert als konkrete Instanzen** (§3): die
RP-1-Fassaden (`Softwaresystemarchitektur` löst
`Systemarchitektur` aus SP-1 ab,
`Softwaresystemtest-Setup` löst `Systemtest-Setup` aus
SP-1 ab; der `Contract-Index` ist SP-1-Register, aktiv
beim Koordinator) und die
zugehörigen RP-1-Detail-Knotentypen
(`software-system-component` löst `system-component` ab,
`user-story` erweitert und ersetzt `need`, `use-case`
erweitert und ersetzt `scenario` — beide Vorstufen
liegen in der Basis). Präfixe: §3.4.

**Bringt eigene Mechanismen mit** (§4): Zweck-Freigaben
an P-Phasen mit Freigabe-DEC-Format und
Meilenstein-Regel, Präzisierung der Kette der Pflicht-Stände,
Contract-Konzept (Aushandlung beim Provider,
CON-Element beim Koordinator), Rolle-Konzept konkret (Koordinator /
Komponent / Standalone), Ausgangs- und Analyse-
Ablage-Regeln, Init-Zusatz-Angebot als aufbauender
Prozess auf SP-1, Komponenten-Repositories-Konvention.

**Lazy-Loading durch selektive Aktivierung.** Ohne
RP-1-Wahl im Init passiert nichts von alldem: die
RP-1-Fassaden-Skelette, die mitgebrachten
Katalog-Einträge (`Katalog-<Name>.md`) und das Vorgehen
(`Vorgehen-RP-1.md`) bleiben im RP-1-Teil-Wiki
(`referenzprozesse/RP-1-Systementwicklung/wiki/`) und
werden nicht ins Anwender-`wiki/` gemerged. Bei
RP-1-Wahl (setzt SP-1 voraus) führt der Init-Agent den
Merge nach Wiki.md §11.3 durch — Basis zuerst, dann
SP-1, dann RP-1. Nach dem Merge liegen die
RP-1-spezifischen Artefakte im Anwender-`wiki/` (mit
RP-1-Ablösungen der SP-1-Fassaden nach Wiki.md §11.4).

## 3. Konkrete Instanzen der Basis + SP-1

### 3.1 RP-1-Fassaden

RP-1 bringt zwei Fassaden mit, die SP-1-Fassaden
ablösen (Kompositum-Konvention): welche es sind und
wie sie eingestuft sind, steht im [[Steckbrief]]
§Mitgebrachte Fassaden, dort mit dem Katalog-Eintrag
je Fassade (Typ, Zweck, Datei, `replaces_type:`) —
lesen beim Merge. Die SP-1-Register
[[Funktionsbeschreibungen]] (FUNC, P4) und
[[Spezifikationen]] (SPEC, P8) bleiben SP-1-Fassaden;
RP-1 präzisiert sie im Vorgehen ([[Vorgehen-RP-1]]
§2 und §8) und in diesem `index` (§4) und legt
keinen eigenen Typ an.

**Ablage:** Die RP-1-Fassaden-Skelette liegen im
RP-1-Teil-Wiki
(`referenzprozesse/RP-1-Systementwicklung/wiki/`),
Wiki.md §11. Beim Merge (Wiki.md §11.3) kopiert der
Agent sie in das Anwender-`wiki/` — die im Folgenden
genannten Pfade `wiki/Softwaresystemarchitektur.md`
etc. beziehen sich immer auf die Anwender-Sicht nach
Merge.

**Aktivierung:** nach der Steckbrief-Sektion
§ Mitgebrachte Fassaden; das SP-1-Register
[[Contract-Index]] ist optional und rollen-abhängig
(Einstufung im SP-1-Steckbrief, Ausstattung je Rolle
§6). Die Ablöse-Schritte, Kanonizität,
Detail-Knoten-Konventionen und Präfixe jeder Fassade
stehen in deren Bootstrap-Dateien
(`referenzprozesse/RP-1-Systementwicklung/bootstrap/`,
Wiki.md §11 „`bootstrap/`“) und `## Meta`-Sektionen —
hier nicht
dupliziert
([[Softwaresystemarchitektur]],
[[Softwaresystemtest-Setup]]).

### 3.2 RP-1-Detail-Knotentypen

RP-1 bringt folgende Detail-Knotentypen mit
(Katalog-Einträge [[Katalog-user-story]],
[[Katalog-use-case]], [[Katalog-Softwaresystemarchitektur]];
beim Merge als Dateien ins Anwender-`wiki/` kopiert und
im [[Katalog]] verankert):

- **`user-story`** — Bedarf in der Form der User-Story;
  erweitert und ersetzt `need` aus der Basis
  (`replaces_type: need`, Register [[Bedarfe]],
  Präfix NEED).
- **`use-case`** — Szenario in der Form des Use Case;
  erweitert und ersetzt `scenario` aus der Basis
  (`replaces_type: scenario`, Register [[Szenarien]],
  Präfix SCEN).
- **`software-system-component`** — löst
  `system-component` aus SP-1 ab
  (Kompositum-Konvention); Struktur-Konventionen in
  der `## Meta`-Sektion der Fassade
  [[Softwaresystemarchitektur]].

**`rollen:` an `user-story` und `use-case`:** das
Pflichtfeld erben beide von `need` bzw. `scenario`; es
zeigt auf Verwendungs-Rollen (`rolle_art:
verwendungsrolle`) im Basis-Register [[Rollen]].
Register-First-Regel und Rückverlinkung
(`verwendet_in:`) stehen in dessen `## Meta`; lesen,
bevor beim Ausformulieren einer User-Story oder eines
Use-Cases eine Rolle referenziert oder neu angelegt
wird.

**Typen-Lage der §4-Mechanismen:** Funktionsbeschreibungen
(`function-description`) und Spezifikationen
(`specification`) sind SP-1-Typen (Katalog-Einträge
[[Katalog-Funktionsbeschreibungen]],
[[Katalog-Spezifikationen]] in SP-1; RP-1 präzisiert
im Vorgehen); ebenso Contracts (`contract`,
Katalog-Eintrag [[Katalog-Contract-Index]] in SP-1).
Testplan und Deploy-Stand sind keine Wiki-Knoten,
sondern Stände mit den Dokumenttyp-Kennungen
`testplan` und `deploy-stand` (Dokumenttyp-Einträge
[[Katalog-Testplan]], [[Katalog-Deploy-Stand]] in
SP-1; Mechanik: [[Einfrieren-und-Abloesen]]). Was in
den Deploy-Stand eingeht, sind SP-1-Register: die
Deployment-Festlegungen (DEPL, [[Deployments]]) je
Zielumgebung ([[Zielumgebungen]]); einen lebenden
Deploy-Knoten gibt es nicht. Startprompts sind bewusst
reine `output/`-Artefakte (einmalige Übergabe ohne
eigenen Wissens-Kern). Für Testdurchgänge bringt RP-1
die Durchführungs-Instanz mit, eine selbsttragende
Ableitung aus dem freigegebenen Testplan-Stand
([[Katalog-Durchfuehrungs-Instanz]]; Angebot in
[[Vorgehen-RP-1]] §4). Testdurchgänge nach Testplan
belegt ein Testbericht (TRES) im SP-1-Register
[[Testberichte]]; die übrigen Testergebnisse folgen
der Nachweis-Regel (dreistufig, `## Meta` der
SP-1-Fassade [[Systemtest-Setup]]) — kein weiterer Typ.
Nachrichten zwischen Koordinator und Komponenten sind
der Basis-Typ `message` ([[Katalog-message]]), kein
RP-1-Typ.

### 3.3 Ablöse-Ketten-Kanonizität

RP-1 nutzt die `replaces_type:`-Mechanik (Wiki.md §11.4;
Zeile `Replaces type` in den Katalog-Einträgen
[[Katalog-Softwaresystemarchitektur]] und
[[Katalog-Softwaresystemtest-Setup]]) für die Ablösung
der SP-1-Fassaden `Systemarchitektur` und
`Systemtest-Setup` und des Detail-Typs
`system-component`. Nach dem Merge ist nur die
hochwertigste Ausprägung jedes Elements aktiv; die
abgelösten SP-1-Elemente bleiben als Hintergrund im
Anwender-Wiki mit „abgelöst durch"-Marker. Neuer
Content geht an die aktive Ausprägung.

### 3.4 RP-1-Präfixe

_(Die führende Deklaration steht im [[Steckbrief]]
§„Mitgebrachte Präfixe" — dort liest der Agent beim
Prozess-Merge (Wiki.md §11.3 Schritt 6);
hier die Erläuterungs-Details.)_

**RP-1 führt den SP-1-mitgebrachten Präfix `Freigabe:`
fort und bringt darüber hinaus keine eigenen
Commit-Präfixe mit.** Konkret:

- **`Freigabe:`** — SP-1-mitgebrachter Präfix für
  Freigabe-DEC-Buchungen (Kurzsatz-Muster: „Freigabe:
  <Artefakt> für Zweck <X>"). RP-1 nutzt ihn unverändert
  für seine Zweck-Freigaben (§4).
- Die von RP-1 abgelösten SP-1-Fassaden
  (`Systemarchitektur` → `Softwaresystemarchitektur`,
  `Systemtest-Setup` → `Softwaresystemtest-Setup`)
  behalten die SP-1-Präfixe (`Architektur:`,
  `Test-Setup:`). Der Prozess-Kontext ergibt sich aus
  dem geänderten Dateinamen — der Präfix bleibt kompakt.
- Detail-Knoten eines ablösenden Typs
  (`software-system-component`) laufen unter denselben
  Präfixen weiter wie der abgelöste Typ (`Wiki:` bei
  redaktionellen Änderungen, `Architektur:` bei
  Fassaden-Bezug) — eine Ablösung erzeugt keine neue
  Präfix-Klasse.
- Das SP-1-Register `Contract-Index` läuft unter
  Basis-Präfix `Wiki:` (redaktionelle
  Wiki-Änderung). Kein eigener `Contract-Index:`-Präfix
  nötig — Änderungen sind selten und werden über den
  allgemeinen Wiki-Präfix ausreichend gekennzeichnet.
- RP-1-Artefakte ohne eigenen Typ (§3.2) laufen
  ebenfalls unter Basis-Präfixen: `Wiki:` bei
  redaktionellen Änderungen des Detail-Knotens,
  `Output:` wenn eine neue `_VV_TLA`-Version in
  `output/` entsteht (typisch bei
  Freigabestand-Ablage, §4), `Overview:` bei
  Analysen und Ausnahme-Kopien in `overview/`,
  `Prozess-Merge:`/`Prozess-Upgrade:` bei Prozess-Wahl
  bzw. -Wechsel.

Bezug: Basis-Präfix-Tabelle in MasterPrompt §6.2;
SP-1-Präfixe siehe SP-1-Steckbrief
§„Mitgebrachte Präfixe".

## 4. RP-1-eigene Mechanismen

**Zweck-Freigaben an P-Phasen.** RP-1 nutzt das
Zweck-Freigabe-Modell des Basisrahmens ohne Ausnahmen
(Freigabe-Regel `Vorgehen.md` §4, Wächter-Trigger T4
`Vorgehen.md` §5). Welche Phase-Artefakte in RP-1
typisch welche Freigabe-Zwecke tragen:
[[Vorgehen-RP-1]] §Zweck-Freigaben in RP-1 — lesen vor
einer Freigabe.

- **Format je Freigabe: DEC-Eintrag** im
  Entscheidungsregister. Keine eigene Fassade, kein
  eigener Detail-Typ — Freigaben sind
  Anwender-Entscheidungen über den Reifezustand.
  Wortlaut, Form des Eintrags und Ablösung einer
  Freigabe: `Vorgehen.md` §4 und `## Meta` von
  [[Entscheidungen]] — lesen vor jeder Buchung.
  Commit-Präfix `Freigabe:` (§3.4). Das Feld-Set
  (Artefakt mit Version, Wirkung als Zweck, Verweis
  auf den `review-report` mit Prüfern und Reife) führt
  der Absatz „Freigabe-Einträge“ dort; die Zahl der
  Prüfer regelt `Reviewmuster.md` §2 Schleife 2.
- **Meilenstein-Regel — agent-lokal:** die Freigabe
  eines eigenen Pflicht-Stands der Kette ist
  Meilenstein des jeweiligen Agenten und löst eine
  volle Wächter-Runde aus (Zuschnitt je Rolle siehe
  §6; eine Freigabe im Nachtrag zu einer
  abgeschlossenen Marke ist kein Meilenstein,
  [[Meilenstein-und-T2]]); Komponenten-Freigaben erreichen den Koordinator
  per Nachricht ([[Katalog-message]]; Lieferung = Tag,
  Marken-Abschluss = Abschluss-Stand). Er bucht sie am
  Marken-Eintrag ([[Zielmarken]], Zuliefernde
  Komponenten), sichtbar in der abgeleiteten Sicht
  `devstate_active.md` §Gesamtstand; eine volle
  Wächter-Runde folgt nicht — außer bei der letzten
  Lieferung und dem letzten Marken-Abschluss der Marke
  (Koordinator-Meilenstein, [[Meilenstein-und-T2]]).
- Freigaben sind DEC-Einträge in der Basis-Fassade
  [[Entscheidungen]], die wie [[Zielmarken]] in jedem
  Projekt Pflicht ist (Wiki.md §3a „mandatory“). Die
  übrigen Basis-Fassaden, die der Prozess voraussetzt
  (Agent-Berichte, Ideen; Liste und Gründe: SP-1
  [Steckbrief](../SP-1-Standardprozess/Steckbrief.md)
  §Mitgebrachte Fassaden), erbt RP-1 von SP-1. Die
  typische Marke unter RP-1: [[Marken-RP-1]].

**Kette der Pflicht-Stände.** Gesamt- und
Teil-Funktionsbeschreibungen (FUNC, P4) sowie Gesamt- und
Teilspezifikationen (SPEC, P8) sind Elemente der
SP-1-Register; freigegeben wird ein Stand, nie das
Register (Stand-Zwang und Ablage: `Vorgehen.md` §4;
Fassade, Element, Stand: [[Einfrieren-und-Abloesen]];
Reihenfolge der Freigaben: [[Kettenpruefung]] — lesen
vor der Freigabe eines Pflicht-Stands).

**Contracts.** Die CON-Elemente liegen im
SP-1-Register [[Contract-Index]] beim Koordinator,
samt Nachfolge-CON (`vorgaenger:` bzw. `supersedes:`); der
Provider verantwortet den Contract, handelt aus, gibt
frei und meldet, führt aber kein CON-Register. Wer
einen CON nutzt, steht als Consumer-Registrierung in
dessen Eintrag im [[Contract-Index]]. Verantwortung, Freigabe von Erst- und Nachfolge-CON,
Meldung und Buchung, Delegations-Grenze zum Anwender
und Eskalation: [[Vorgehen-RP-1]]
§Contract-Aushandlung und -Eskalation — lesen, bevor
ein CON ausgehandelt, freigegeben oder gebucht wird.

**Übergabe-Stände an andere Agenten/Repos.**
Deploy-Stände, Testplan-Stände und Startprompts
gehen nach `output/` mit `_VV_TLA` — Agent-zu-Agent-
bzw. Agent-zu-Ops-Übergabe, kein `outgoing/` (das ist
für den Versand an Menschen reserviert). Nachrichten
zwischen den Repos liegen in `output/nachrichten/` des
Absenders, ohne `_VV_TLA` (MasterPrompt §1.5).
Deploy-Stand
und Testplan sind Stände über SP-1-Register (§3.2),
keine lebenden Wiki-Knoten; Startprompts sind reine
`output/`-Artefakte (kein eigener Wissens-Kern).

**Analysen und Testergebnisse.** Analysen gehen nach
`overview/` mit `_VV_TLA`. **Testergebnisse** folgen
der dreistufigen Nachweis-Regel in `## Meta` der
SP-1-Fassade [[Systemtest-Setup]]; bei
Testdurchgängen nach Testplan ist der Nachweis ein
Testbericht (TRES, [[Testberichte]]). Lesen, bevor
ein Testlauf belegt wird. Rechercheartefakte werden als
REC-Detail-Knoten in der Basis-Fassade
[[Rechercheartefakte]] verankert (Ingest nach
[[Angebots-und-Beauftragungs-Muster]]).

**Init-Angebot.** RP-1 wird in schlanker Form
angeboten — kein RP-1-spezifischer Init-Extra-Ablauf.
Zwei Angebotszeitpunkte (bewusst redundant): primär im
Init über das Prozess-Angebot (MasterPrompt §5.3);
sekundär, sobald Zweck und Anforderungsskizze stehen —
wer im Init nur SP-1 gewählt hat, bekommt jetzt
informationsstark nochmals das RP-1-Angebot; wer
bereits RP-1 gewählt hat, kein zweites. Keine
RP-1-spezifischen Init-Zusatzfragen: die Rolle kommt
über den Startprompt (ohne Startprompt: Koordinator
bzw. Standalone, siehe §6), die Komponentenzahl
entscheidet sich in P5 (Schnitt).

**Komponenten-Repositories als Template-Instanzen.**
Jede Komponente ist ein eigenes Template-Repo mit
SP-1+RP-1 — volle Wiki-Struktur, Register, Fassaden,
identische Regeln wie beim Koordinator, nur mit
Komponent-Rolle (Contract-Index deaktiviert,
`devstate_active.md` beschreibt nur die eigene
Komponente). Wie ein Komponenten-Repo entsteht
(Start-Tabelle in P6): [[Vorgehen-RP-1]] §2
Anmerkung P6 — lesen vor dem Start einer Komponente.
Was der **Startprompt** trägt und wie die Komponente
ihn im Init liest: [[Init-Choreografie]] §Init mit
Startprompt (Komponente) — lesen, bevor ein
Startprompt erzeugt oder gelesen wird. Zerlegt eine
Komponente weiter, ist sie für ihre Unter-Komponenten
Koordinator und führt deren CON; wie die Repos
schreiben, melden und buchen: Vorgehen.md §3a.
**Cross-Repo-Adressierung:** Verweist ein Agent auf
einen Register-Eintrag in einem anderen Repository
dieses Systems, trägt der Verweis den Repo-Namen als
Qualifizierer vor der ID (`terminal/REQ-014`; Spalte
Repo-Name in §Komponenten der
[[Softwaresystemarchitektur]]); innerhalb eines
Repositorys bleibt die bloße ID gültig.

**Gesamtstand des Koordinators:** abgeleitete Sicht in
`devstate_active.md` §Gesamtstand mit Verweisen auf
Marken-Eintrag, Contract-Index und §Komponenten; eine
eigene Gesamtstands-Datei gibt es nicht —
[[devstate-Skelett]], lesen beim Anlegen oder Pflegen
des Abschnitts.

## 5. System-Rolle (Ebene C)

Die **System-Rolle** ist die technische Abbildung
einer Verwendungs-Rolle (Ebene B, `role`-Knoten mit
`rolle_art: verwendungsrolle` im Basis-Register
[[Rollen]]) im entwickelten Softwaresystem — konkret: welche Nutzer-Konten,
Zugriffsrechte, Berechtigungsprofile die Rolle im
Ziel-System hat.

**Verankerung:** kein eigenes Register. Ebene C hängt
direkt an Ebene B — der `role`-Detail-Knoten aus der
Basis bekommt bei RP-1-aktivierten Projekten ein
zusätzliches Frontmatter-Feld **`system_abbildung:`**
(String-Notation), das auf die technische Umsetzung
verweist:

- typischerweise auf einen
  `software-system-component`-Knoten
  (`wiki/<Systemkomponentenname>.md`, §3.2), der die
  Zugriffsschicht der Komponente beschreibt;
- alternativ auf den konkreten Ausformulierungs-Ort
  des Berechtigungsmodells (SPEC-, CON- oder
  DEPL-Element, §4);
- oder auf einen Abschnitt in der
  [[Softwaresystemarchitektur]]-Fassade, wenn die
  Rolle-System-Abbildung dort quer über mehrere
  Komponenten dokumentiert ist.

**Verhältnis zur Entwicklungs-Projekt-Rolle** (Ebene
A₀, Koordinator/Komponent/Standalone, §6): die
System-Rolle beschreibt die Nutzer-Sicht auf das
Ziel-System, die Entwicklungs-Projekt-Rolle die
Position des Entwicklungs-Repos im
Entwicklungs-Verbund — beide sind orthogonal und
dürfen nicht verwechselt werden.

**Weitere Prozesse mit „Systemen":** analoge
Präzisierungs-Felder können andere Prozesse später
ergänzen; die Feldnamen können prozess-spezifisch
sein.

## 6. Entwicklungs-Projekt-Rolle (Koordinator / Komponent / Standalone)

Die **Entwicklungs-Projekt-Rolle** (Ebene A₀) ist in
SP-1 verankert; hier nur die RP-1-spezifischen
Konsequenzen der Rolle-Wahl auf Ausstattung und
Meilenstein-Zuschnitt (Meilenstein = Freigabe, die
eine volle Wächter-Runde auslöst, §4; keine Freigabe im
Nachtrag zu einer abgeschlossenen Marke,
[[Meilenstein-und-T2]]):

- **Koordinator:** Contract-Index-Fassade aktiv;
  `devstate_active.md` §Gesamtstand als abgeleitete
  Sicht auf die Komponenten ([[devstate-Skelett]]).
  Meilensteine: die Freigaben seiner
  eigenen Pflicht-Stände (welche das sind:
  [[Vorgehen-RP-1]] §8, Zeilen „global“ und „je
  Zielumgebung“ und die Übergaben P6, und
  [[Kettenpruefung]] §Freigabe-Ordnung des
  Koordinators für eigene Bauteile);
  außerdem der **Koordinator-Meilenstein** — die letzte
  Lieferung und der letzte Marken-Abschluss der
  Komponenten zur Marke, beides per Nachricht gemeldet
  ([[Meilenstein-und-T2]]).
- **Komponent:** Contract-Index deaktiviert
  (`active: false` — liegt beim Koordinator);
  `devstate_active.md` beschreibt nur die eigene
  Komponente. Zerlegt sie weiter, ist sie für ihre
  Unter-Komponenten Koordinator (Contract-Index dort
  aktiv). Meilensteine: die rekursiven
  Freigaben der eigenen Pflicht-Stände (welche das
  sind: [[Vorgehen-RP-1]] §8, Zeilen „je Komponente“
  bis zum Testplan-Stand P10; wo die Kette je
  Übernahme-Art beginnt und wann sie P11 selbst
  führt: [[Kettenpruefung]] §Fehlende und vertretene
  Glieder).
- **Standalone:** (SP-1 ohne Komponenten-Split) —
  keine RP-1-Rollen-Ausstattung. Meilensteine: die
  Freigaben aller Pflicht-Stände der Kette
  ([[Kettenpruefung]] §Kette; kein getrenntes
  Komponenten-P4, weil kein Split; Wächter läuft
  agent-lokal).

**Rolle-Erkennung:** Im Komponenten-Repo legt der
Startprompt die Rolle **Komponent** vorab fest; die
Rollen-Frage im Init entfällt dann
([[Init-Choreografie]] §Init mit Startprompt
(Komponente); erzeugt wird der Startprompt in P6,
[[Vorgehen-RP-1]] §2 Anmerkung P6). Ohne Startprompt
fragt der Init die Rolle, Vorauswahl **Standalone**
(SP-1 `index.md` §5.2).

### 6.1 Prozess-spezifische Init-Fragen

Die Init-Choreografie sammelt die Fragen des Prozesses
in Phase D Turn 2 aus diesem Abschnitt
([[Init-Choreografie]] §Phase D, Punkt 3). RP-1 erbt
die Fragen von SP-1 (SP-1 `index.md` §4.12: MADR-Angebot,
Vorauswahlen) und bringt genau eine eigene mit:

- **Rolle des Repos** — nur ohne Startprompt gefragt,
  Vorauswahl **Standalone**, Umschalt-Option
  **Koordinator**, falls der Anwender schon mehrere
  Komponenten-Repos plant; mit Startprompt ist
  **Komponent** abgeleitet (Rolle-Erkennung oben; die
  Rolle selbst: SP-1 `index.md` §5). Gebucht in der
  Zeile `Rolle` des Herkunfts-Vermerks von
  [[Aktivierter-Prozess]] ([[Init-Choreografie]]
  §Phase A0). _Legt vorab fest:_ Contract-Index und
  `devstate_active.md`-Zuschnitt (§5.3 in SP-1
  `index.md`), ob ein Startprompt entsteht oder gelesen
  wird, und die Kette des Repos — die stärkste
  Vorfestlegung in Turn 2, deshalb vor dem
  MADR-Angebot von SP-1.

Weitere Init-Fragen stellt RP-1 nicht; Werkzeug-Wahlen
(Code-Review, Kadenz, Peer-Agenten) laufen nach
`Vorgehen.md` §7b, wenn sie anstehen.

## 7. Bezüge

- [[Steckbrief]] — schlanke Selbstvorstellung,
  einziger Ort der Prozess-Felder,
  § Mitgebrachte Fassaden.
- [[Vorgehen-RP-1]] — P-Phasen-Belegung, Angebote an
  Phasen, Test-Automatisierung, Wechsel-Semantik,
  Contract-Aushandlung, Rücklauf-Mechanik,
  Sprach-Regel.
- [[Marken-RP-1]] — typische Marke eines
  Softwaresystems, ihr Produkt, Schnitt und Benennung
  (Marke ≠ Produkt-Version); lesen beim Init (erste
  Marke) und vor einem Marken-Wechsel.
- SP-1 (übergeordneter Basisprozess):
  [Steckbrief](../SP-1-Standardprozess/Steckbrief.md)
  und [index](../SP-1-Standardprozess/index.md);
  Vorgehens-Erbschaft aus [[Vorgehen-SP-1]].
- Wiki.md §11 — Prozess-Teil-Wikis, Merge-Semantik,
  Aktivitäts-Regel.
