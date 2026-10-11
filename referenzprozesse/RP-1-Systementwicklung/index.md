---
type: process-mapping
process: RP-1
extends: [SP-1]
---

# RP-1 Entwicklung eines Softwaresystems

**Stand:** 2026-08-24

Ich bin in [[Steckbrief]] beschrieben; konkret mache ich
Folgendes:

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

**Nutzt aus der Basis und aus SP-1** (nicht dupliziert):
Basisrahmen und Basis-Wiki-Mechanismen (Fassaden,
Detail-Knoten, Feld-Kanonizität, Ingest,
Cross-References, Lint, Snapshots, Sync-Pflicht,
Progressive Disclosure, Ableiten-und-Vorlegen,
[[Do-first-mit-Veto]], `Tools.md`,
MasterPrompt-Präfix-System) plus die SP-1-Mechanismen
(8-Zustands-Lebenszyklus, Wächter-Trigger,
Rolle-Konzept generisch, Prüf-/Recherche-Basis-
Fähigkeit). Alles im Basisrahmen und im SP-1-Teil-Wiki
verankert — hier nicht wiederholt.

**Aktiviert als konkrete Instanzen** (§3): drei
RP-1-Fassaden (`Softwaresystemarchitektur` löst
`Systemarchitektur` aus SP-1 ab,
`Softwaresystemtest-Setup` löst `Systemtest-Setup` aus
SP-1 ab, `Contract-Index` neu beim Koordinator) und die
zugehörigen RP-1-Detail-Knotentypen
(`software-system-component` löst `system-component` ab,
`user-story` spezialisiert `need`, `use-case`
spezialisiert `scenario`). Präfixe: §3.4.

**Bringt eigene Mechanismen mit** (§4): Zweck-Freigaben
an P-Phasen mit Freigabe-DEC-Format und
Meilenstein-Regel, Spezifikationsketten-Konvention,
Contract-Konzept (Provider/Consumer-Trennung,
Kanonizität), Rolle-Konzept konkret (Koordinator /
Komponent / Standalone), Ausgangs- und Analyse-
Ablage-Regeln, Init-Zusatz-Angebot als aufbauender
Prozess auf SP-1, Komponenten-Repositories-Konvention.

**Lazy-Loading durch selektive Aktivierung.** Ohne
RP-1-Wahl im Init passiert nichts von alldem: die
RP-1-Fassaden-Skelette, der Katalog-Anhang
(`Knotentypen-Anhang-RP-1.md`) und das Vorgehen
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

RP-1 aktiviert folgende Fassaden zusätzlich zu Basis
und SP-1 — teils als Ablösung von SP-1-Fassaden
(Kompositum-Konvention), teils neu.

| Fassade | Typ | Zweck | Ablösung |
|---|---|---|---|
| `wiki/Softwaresystemarchitektur.md` | `software-system-architecture-overview` | Sollzustands-Fassade Softwaresystemarchitektur mit software-spezifischen Sektionen | löst `Systemarchitektur` aus SP-1 ab (per `supersedes: system-architecture-overview`) |
| `wiki/Softwaresystemtest-Setup.md` | `software-system-test-setup` | Sollzustands-Fassade Softwaresystemtest-Setup mit software-spezifischen Sektionen | löst `Systemtest-Setup` aus SP-1 ab (per `supersedes: system-test-setup`) |
| `wiki/Spezifikationen.md` | `specification-log` | Register aller Spezifikationen dieses Repos (Koordinator: Gesamt-, Komponente: Teilspezifikation); mandatory — Kern der P4-Mechanik | neu in RP-1 |
| `wiki/Contract-Index.md` | `contract-index` | Register aller Contracts zwischen Komponenten (nur beim Koordinator) | neu in RP-1 |

**Ablage:** Die RP-1-Fassaden-Skelette liegen im
RP-1-Teil-Wiki
(`referenzprozesse/RP-1-Systementwicklung/wiki/`),
Wiki.md §11. Beim Merge (Wiki.md §11.3) kopiert der
Agent sie in das Anwender-`wiki/` — die im Folgenden
genannten Pfade `wiki/Softwaresystemarchitektur.md`
etc. beziehen sich immer auf die Anwender-Sicht nach
Merge.

**Aktivierung:** nach der Steckbrief-Sektion
§ Mitgebrachte Fassaden — die beiden ablösenden
Fassaden sind mandatory, der Contract-Index ist
optional (rollen-abhängig, Empfehlung siehe
Steckbrief). Die Ablöse-Schritte, Kanonizität,
Detail-Knoten-Konventionen und Präfixe jeder Fassade
stehen in deren Bootstrap-Dateien
(`referenzprozesse/RP-1-Systementwicklung/bootstrap/`,
DEC-217) und `## Meta`-Sektionen — hier nicht
dupliziert
([[Softwaresystemarchitektur]],
[[Softwaresystemtest-Setup]], [[Contract-Index]]).

### 3.2 RP-1-Detail-Knotentypen

RP-1 bringt folgende Detail-Knotentypen mit
(Katalog-Blöcke in `Knotentypen-Anhang-RP-1.md`, beim
Merge in die Anwender-`wiki/Knotentypen.md`
eingespielt):

- **`user-story`** — User-Story im Agile-Sinne;
  spezialisiert `need` aus SP-1.
- **`use-case`** — Use Case mit Akteuren und Abläufen;
  spezialisiert `scenario` aus SP-1.
- **`software-system-component`** — löst
  `system-component` aus SP-1 ab
  (Kompositum-Konvention); Struktur-Konventionen in
  der `## Meta`-Sektion der Fassade
  [[Softwaresystemarchitektur]].

**`rollen:`-Pflichtfeld (für `user-story`, `use-case`,
`scenario` und ihre Vorstufen):**
Frontmatter-Pflichtfeld **`rollen:`** als String-Liste,
die auf die betroffenen Verwendungs-Rollen im
SP-1-Register `wiki/Verwendungs-Rollen.md` (Detail-Typ
`role`) zeigt. Führender Ort für Rollen-Definitionen
ist das Verwendungs-Rollen-Register; `user-story`- und
`use-case`-Knoten dürfen Rollen nur referenzieren,
nicht inline neu definieren. Wenn beim Ausformulieren
eines Use-Cases eine Rolle auftaucht, die es im
Register noch nicht gibt, wird die Rolle zuerst im
Register angelegt (`role`-Knoten in
`Verwendungs-Rollen.md`) und dann per `rollen:`-Feld
referenziert.

**Rückverlinkung:** der `role`-Knoten trägt sein
`verwendet_in:`-Feld, das die referenzierenden
`user-story`-/`use-case`-/`scenario`-Knoten sammelt
(Standardaufgabe im selben Vorgang nach MasterPrompt
§5.1.2 — der Agent pflegt Vor- und Rückverweise
gemeinsam).

**Typen-Lage der §4-Mechanismen:** Spezifikationen
(`specification`), Contracts (`contract`), Testpläne
(`testplan`) und Deploy-Wissen (`deployment`) haben
eigene Wiki-Knoten-Typen (Katalog:
`Knotentypen-Anhang-RP-1.md`; lebende Fassung im
wiki/, Übergabe-Stände in `output/` — MasterPrompt
§1.5). Startprompts sind bewusst reine
`output/`-Artefakte (einmalige Übergabe ohne eigenen
Wissens-Kern); Testergebnisse laufen als REP-Knoten
nach der Nachweis-Regel (dreistufig, siehe `## Meta`
der Fassade Softwaresystemtest-Setup) — kein eigener
Typ.

### 3.3 Ablöse-Ketten-Kanonizität

RP-1 nutzt die `supersedes:`-Mechanik (Wiki.md §11.4)
für die Ablösung der SP-1-Fassaden `Systemarchitektur`
und `Systemtest-Setup` und des Detail-Typs
`system-component`. Nach dem Merge ist nur die
hochwertigste Ausprägung jedes Elements aktiv; die
abgelösten SP-1-Elemente bleiben als Hintergrund im
Anwender-Wiki mit „abgelöst durch"-Marker. Neuer
Content geht an die aktive Ausprägung.

### 3.4 RP-1-Präfixe

_(Die führende Deklaration steht im [[Steckbrief]]
§„Mitgebrachte Präfixe" — dort liest der Agent beim
Prozess-Merge (Wiki.md §11.3 Schritt 6, DEC-208);
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
- Die neu in RP-1 mitgebrachte Fassade `Contract-Index`
  läuft unter Basis-Präfix `Wiki:` (redaktionelle
  Wiki-Änderung). Kein eigener `Contract-Index:`-Präfix
  nötig — Änderungen sind selten und werden über den
  allgemeinen Wiki-Präfix ausreichend gekennzeichnet.
- RP-1-Artefakte ohne eigenen Typ (§3.2) laufen
  ebenfalls unter Basis-Präfixen: `Wiki:` bei
  redaktionellen Änderungen des Detail-Knotens,
  `Output:` wenn eine neue `_VV_TLA`-Version in
  `output/` entsteht (typisch bei
  Freigabestand-Ablage, §4), `Overview:` bei
  Analysen/Testberichten in `overview/`,
  `Prozess-Merge:`/`Prozess-Upgrade:` bei Prozess-Wahl
  bzw. -Wechsel.

Bezug: Basis-Präfix-Tabelle in MasterPrompt §6.2;
SP-1-Präfixe siehe SP-1-Steckbrief
§„Mitgebrachte Präfixe" (DEC-208).

## 4. RP-1-eigene Mechanismen

**Zweck-Freigaben an P-Phasen.** RP-1 nutzt das
Zweck-Freigabe-Modell des Basisrahmens (Vorgehen.md §4)
ohne Ausnahmen: keine blockierende Freigabe-Mechanik.
Jedes Ergebnis-Artefakt einer Phase kann null, eine
oder mehrere zweck-gebundene Freigaben tragen; der
Wächter-Trigger T4 „Freigabe-Bezugsprüfung"
(Vorgehen.md §5) warnt beim Beziehen auf
nicht-passend freigegebene Grundlagen — er blockiert
nicht ([[Berichten-statt-Blockieren]]). Welche
Phase-Artefakte in RP-1 typisch welche Freigabe-Zwecke
tragen, steht in [[Vorgehen-RP-1]] §Zweck-Freigaben
in RP-1.

- **Format je Freigabe: DEC-Eintrag** im
  Entscheidungsregister. Keine eigene Fassade, kein
  eigener Detail-Typ — Freigaben sind
  Anwender-Entscheidungen über den Reifezustand.
  Erneute Freigabe = neuer DEC-Eintrag, der den alten
  „abgelöst durch" verweist. Commit-Präfix `Freigabe:`
  (§3.4). **Feld-Set:** Betroffenes Artefakt (mit
  Version), Prüfer (mindestens zwei unabhängige),
  Reife-Kriterium erfüllt (ja/nein), Wirkung (welcher
  Zweck freigegeben wird).
- **Meilenstein-Regel — agent-lokal, entlang der
  Phasen-Übergänge:** eigene Freigaben sind
  Meilensteine des jeweiligen Agenten und lösen einen
  vollen Wächter-Lauf aus (Zuschnitt je Rolle siehe
  §6); einzelne Komponenten-Freigaben, die den
  Koordinator nicht in eine neue Phase entlassen, sind
  für ihn Nachzug im `devstate_active.md` §Gesamtstand,
  kein Wächter-Lauf.
- Freigaben sind DEC-Einträge — die Basis-Fassade
  [[Entscheidungen]] ist bei RP-1 deshalb nicht
  abwählbar.

**Spezifikationsketten.** Gesamt- und
Teilspezifikationen (auch technische Spezifikationen)
leben zweigleisig: die **lebende Fassung** als
Wiki-Knoten, **Freigabestände** als versionierte Datei
in `output/` mit `_VV_TLA`. Der Freigabe-DEC-Eintrag
verweist auf die exakte Version.

**Contracts.** Der **Contract-Index**
(`wiki/Contract-Index.md`, §3.1) liegt nur beim
Koordinator und hält Provider/Consumer/Fassung je
Contract. **Individuelle Contracts** liegen beim
Provider (nicht beim Koordinator) als Wiki-Knoten plus
Fassungen in dessen `output/`. **Kanonizität geteilt:**
Contract-Inhalt beim Provider, Index-Zeile beim
Koordinator. Aushandlung, Delegations-Grenze und
Eskalation: [[Vorgehen-RP-1]] §Contract-Aushandlung
und -Eskalation.

**Übergabe-Stände an andere Agenten/Repos.**
Deploy-Dokument, Testplan-Stände und Startprompts
gehen nach `output/` mit `_VV_TLA` — Agent-zu-Agent-
bzw. Agent-zu-Ops-Übergabe, kein `outgoing/` (das ist
für den Versand an Menschen reserviert). Für
Deploy-Wissen und Testpläne gilt die
Zweigleisigkeit (MasterPrompt §1.5): die lebende
Fassung ist der Wiki-Knoten (`deployment` bzw.
`testplan`), `output/` friert die Übergabe-Stände
ein. Startprompts sind eingleisig `output/` (kein
eigener Wissens-Kern).

**Analysen und Testberichte.** Analysen gehen nach
`overview/` mit `_VV_TLA`. **Testergebnisse** folgen
der dreistufigen Nachweis-Regel (`## Meta` der
Fassade Softwaresystemtest-Setup): normaler Lauf →
Kadenz-Zeile im Commit; beleg-würdiger Lauf →
REP-Detail-Knoten mit kuratierten Auszügen und
Reproduzierbarkeits-Angabe; nicht reproduzierbares
Voll-Material → Ausnahme-Kopie in `overview/` mit
REP-Verweis. Rechercheartefakte werden als
REC-Detail-Knoten in der Basis-Fassade
[[Rechercheartefakte]] verankert (MasterPrompt §5.6).

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
Komponente). Der **Startprompt** verweist auf eine
frische Template-Instanz und trägt Prozess-Wahl,
Single-Source-of-Truth-Ort, Contracts und Rolle.
**Cross-Repo-Adressierung:** Verweist ein Agent auf
einen Register-Eintrag in einem anderen Repository
dieses Systems, trägt der Verweis den Komponentennamen
vor der ID (`terminal/REQ-014`); innerhalb eines
Repositorys bleibt die bloße ID gültig.

**Kein separates `devstate_system.md`.** Die dort
denkbaren Aggregat-Informationen (Komponenten-
Freigaben, Contracts, Meilensteine) sind kanonisch in
Wiki-Fassaden verankert (Entscheidungsregister,
Contract-Index, Wächter-Mechanismus). Stattdessen
erhält der Koordinator-`devstate_active.md` einen
§Gesamtstand-Abschnitt mit **Verweisen** auf die
kanonischen Wiki-Quellen; bei Bedarf generiert der
Agent on-demand eine Zusammenfassung.

## 5. System-Rolle (Ebene C)

Die **System-Rolle** ist die technische Abbildung
einer Verwendungs-Rolle (Ebene B, SP-1-`role`-Knoten
in `wiki/Verwendungs-Rollen.md`) im entwickelten
Softwaresystem — konkret: welche Nutzer-Konten,
Zugriffsrechte, Berechtigungsprofile die Rolle im
Ziel-System hat.

**Verankerung:** kein eigenes Register. Ebene C hängt
direkt an Ebene B — der `role`-Detail-Knoten aus SP-1
bekommt bei RP-1-aktivierten Projekten ein
zusätzliches Frontmatter-Feld **`system_abbildung:`**
(String-Notation), das auf die technische Umsetzung
verweist:

- typischerweise auf einen
  `software-system-component`-Knoten
  (`wiki/<Systemkomponentenname>.md`, §3.2), der die
  Zugriffsschicht der Komponente beschreibt;
- alternativ auf den konkreten Ausformulierungs-Ort
  des Berechtigungsmodells (Spezifikations-, Contract-
  oder Deploy-Dokument, §4);
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
einen vollen Wächter-Lauf auslöst, §4):

- **Koordinator:** Contract-Index-Fassade aktiv;
  `devstate_active.md` §Gesamtstand aggregiert alle
  Komponenten. Meilensteine: die globalen
  Zweck-Freigaben seiner P3-/P4-/P5-Artefakte und des
  P9+P10-Aggregats; außerdem der Zeitpunkt, an dem die
  jeweils letzte Komponenten-Freigabe eines
  Phasen-Übergangs erteilt ist.
- **Komponent:** Contract-Index deaktiviert
  (`active: false` — liegt beim Koordinator);
  `devstate_active.md` beschreibt nur die eigene
  Komponente. Meilensteine: die rekursiven
  Zweck-Freigaben der eigenen P4-/P7-/P8-Artefakte.
- **Standalone:** (SP-1 ohne Komponenten-Split) —
  keine RP-1-Rollen-Ausstattung. Meilensteine: die
  Freigaben der P3-/P4-/P5-, P7-/P8- und
  P9+P10-Artefakte (kein getrenntes Komponenten-P4,
  weil kein Split; Wächter läuft agent-lokal).

**Rolle-Erkennung:** Startprompt-Setzung bei
bestehendem Mehr-Repo-Setup (die Rolle steht im
Startprompt); explizite Init-Frage mit Vorauswahl
**Standalone** bei Erst-Init eines einzelnen neuen
Repos. Startprompt-Format siehe §4
(Komponenten-Repositories).

## 7. Bezüge

- [[Steckbrief]] — schlanke Selbstvorstellung,
  kanonische `process:`-/`extends:`-Felder,
  § Mitgebrachte Fassaden.
- [[Vorgehen-RP-1]] — P-Phasen-Belegung, Angebote an
  Phasen, Test-Automatisierung, Wechsel-Semantik,
  Contract-Aushandlung, Rücklauf-Mechanik,
  Sprach-Regel.
- SP-1 (übergeordneter Basisprozess):
  [Steckbrief](../SP-1-Standardprozess/Steckbrief.md)
  und [index](../SP-1-Standardprozess/index.md);
  Vorgehens-Erbschaft aus [[Vorgehen-SP-1]].
- Wiki.md §11 — Prozess-Teil-Wikis, Merge-Semantik,
  Aktivitäts-Regel.
