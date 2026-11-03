---
type: internal-pattern
---

# Init-Choreografie

Vollständige Init-Choreografie des Sessionstarts:
Phase A0 (Setup lebende Dokumente) und der
mehrstufige Phase-D-Ablauf mit allen Init-Bausteinen
(Turn-Sequenz, Init-Fragen, Prozess-Angebot,
Ein-/Zwei-Repo-Frage, Init mit Startprompt,
Fassaden-Auswahl, Konzept-Angebot,
Mission-Statement-Setup). Wortlaut aus MasterPrompt
§5.3 hierher verlagert; die Kurzformen im
MasterPrompt zeigen auf diesen Knoten. Moment: genau
einmal pro Projekt (Init); die täglichen
Sessionstart-Phasen A–C, das
Erledigt/Aktion/Frage-Raster und Phase E bleiben im
MasterPrompt §5.3.

**Bootstrap-Hinweis:** Beim allerersten Init
existiert das Anwender-`wiki/` noch nicht — dieser
Knoten ist dann über die Template-Quelle lesbar:
`_template/referenzprozesse/base/wiki/` — in beiden
Modi, sobald die Modus-Wahl `_template/` angelegt
hat; davor über den übergebenen Template-Pfad
(Anbindungs-Modi: MasterPrompt §1 und Phase A0
unten). Phase A0 kopiert ihn mit dem Basis-Wiki
ins Anwender-`wiki/`.

## Phase A0 — Setup lebende Dokumente (nur Init mit Template-Quelle)

**Einstieg (Normalweg):** Der Anwender startet den
Agenten im Projektordner (leer oder mit ersten
Originalen in `raw/`, MasterPrompt §5.3 Phase A1 und
„Init-Zusatz“) mit „Lies
`<Pfad zur Vorlage>/MasterPrompt.md` und setze das
Projekt entsprechend auf.“ (Bootstrap-Init-Frage,
MasterPrompt §5.3 Phase A). Der Agent liest den Pfad
als Zeiger auf die Template-Quelle, stellt die
Modus-Frage und richtet die Anbindung selbst ein; der
Anwender legt `_template/` nicht vorab an. Die
Modus-Wahl legt die Template-Quelle unter
`_template/` an. Es gibt zwei zulässige
Anbindungs-Modi und nur diese zwei — keine dritte
Bauform, keine Mischform:

- **Modus A — Einmal-Kopie:** der Agent kopiert die
  komplette Template-Quelle aus dem übergebenen Pfad
  einmalig nach `_template/` (bei einem git-Klon ohne
  dessen `.git`) und committet sie mit dem Projekt —
  als **Ur-Versions-Archiv**, gegen das der Anwender
  jederzeit diffen kann. Die Herkunft (Quelle und
  Stand, z.B. Commit/Tag) vermerkt er im
  Herkunfts-Vermerk von [[Aktivierter-Prozess]]
  (Format unten).
  Keine Update-Verbindung: ein Update ist der bewusste
  Austausch von `_template/` gegen einen neueren Stand
  (eigener Commit), danach der Delta-Nachzug der
  lebenden Dokumente wie bei Modus B.
- **Modus B — git-Submodul:** der Agent bindet das
  Template-Repo als git-Submodul unter `_template/`
  ein. Version-Pinning per Submodul-Commit-Hash;
  Template-Updates sind aktiv abrufbar per
  `git submodule update --remote`; danach folgt der
  Delta-Nachzug der lebenden Dokumente.

**Delta-Nachzug nach einem Update** (beide Modi): der
Agent vergleicht die neue Template-Quelle unter
`_template/` mit den lebenden Kopien im
Anwender-Projekt und legt Übernahmen als Vorschlag
vor. Ein Update ändert die lebenden Dokumente nie
automatisch; die Übernahme ist immer ein sichtbarer,
geprüfter Schritt. Dateien, die der neue Stand
enthält und die im Projekt fehlen (neue Regel-Knoten,
Fassaden, Kataloge, Vorlagen), sind keine Übernahmen:
das Update legt sie ohne Rückfrage an und meldet sie
dem Anwender gesammelt — Fassaden, die der aktive
Prozess voraussetzt, aktiv, optionale deaktiviert
(`active: false`) mit Hinweis, dass der Anwender sie
aktivieren kann; eine bestehende Datei überschreibt
es nie. Ein Update eines bestehenden
Projekts läuft nach der Upgrade-Anleitung des
Starters (`README.md` §Template aktualisieren); die
Mechanik dieses Abschnitts — Austausch bzw.
Submodul-Update gegen den neuen Stand derselben
Vorlage, aus der das Projekt stammt (Zeile `Quelle`
unten), Delta-Nachzug, neue Dateien, neuer
Herkunfts-Vermerk — ist das, was sie ausführt.

**Herkunfts-Vermerk in [[Aktivierter-Prozess]]**
(beide Modi; dieser Absatz ist der führende Ort des
Formats): Der `internal-rule`-Knoten
`wiki/Aktivierter-Prozess.md` (angelegt in Phase D
Turn 2.2 nach `bootstrap/InterneMechanik.md`) trägt
einen Abschnitt `## Herkunft` mit festen Zeilen; der
Lint liest daraus den Stichtag und die Übernahme-Art:

```markdown
## Herkunft

- **Template-Stand:** 2.1 seit JJJJ-MM-TT
- **Quelle:** <Quelle und Stand, z.B. URL des Klons und Commit oder Tag; Modus A: der Stand der Einmal-Kopie unter `_template/`>
- **Anbindungs-Modus:** A | B
- **Prozess:** <Kennung, z.B. SP-1 oder RP-1> | Basis, ohne Prozess
- **Rolle:** Standalone | Koordinator | Komponent
- **Übernahme-Art:** selbstständig | Auftrag | — (nur bei Rolle Komponent)
```

- **Template-Stand** ist die feste Zeile
  `<Version der Vorlage> seit JJJJ-MM-TT`: die Version
  der Vorlage (z.B. `2.1`) und der Tag, an dem das
  Projekt mit diesem Template-Stand angelegt oder auf
  ihn gehoben wurde — der Stichtag des
  Bestandsschutzes ([[Katalog]] §Typ-Konventionen):
  neue Pflichtfelder gelten als Fehler nur für
  Elemente mit Anlage-Datum ab diesem Tag — so das
  Pflichtfeld `zielmarke:` an Elementen, das jedes
  Element ab dem Init trägt, während Bestands-Elemente
  eines gehobenen Projekts ohne Feld bleiben
  ([[Zielmarken]] §Meta) — (Pflicht-Fassaden prüft der
  Lint unabhängig davon, Wiki.md §3a). Init, Upgrade und
  Migration schreiben `Template-Stand` neu; der
  Stichtag wandert mit. `Quelle` nennt, woher der
  Stand kommt (Klon und Commit oder Tag); der Lint
  liest sie nicht.
- **Vorher** (nur nach einem Upgrade, nicht im
  Code-Block oben, den der Init anlegt): Nach jedem
  Upgrade auf einen neuen Template-Stand steht unter
  `Template-Stand` zusätzlich je Sprung eine Zeile
  `- **Vorher:** <alte Version> (bis JJJJ-MM-TT)` —
  die alte Version der Vorlage und der Tag des
  Upgrades; frühere `Vorher`-Zeilen bleiben stehen,
  so bleibt die Versionsfolge des Projekts lesbar.
  Direkt darunter steht als Vermerk die
  Zuordnungstabelle alt → neu, die die
  Upgrade-Anleitung des Sprungs vorgibt (beim Sprung
  auf 2.0 die alten zu den neuen Phasennummern); das
  Entscheidungs-Register bekommt dazu keinen Eintrag.
  Beides schreibt das Upgrade; Init und Migration
  schreiben keine `Vorher`-Zeile. Der Lint liest die
  Zeile und den Vermerk nicht.
- **Rolle** und **Übernahme-Art** kommen aus dem
  Startprompt (§Init mit Startprompt) oder der
  Rollen-Frage des Prozesses; wird ein Repo erst durch
  den Schnitt in P6 zum Koordinator, zieht der Agent
  die Zeile `Rolle` nach. Ohne Rolle Komponent steht
  bei `Übernahme-Art` „—“ (Rollen-Namen: SP-1
  `index.md` §5).
- Der Lint liest nur diese Zeilen (den Wert hinter dem
  Namen, bei `Übernahme-Art` das erste Wort, bei
  `Template-Stand` das Datum hinter `seit`); weitere
  Zeilen oder Prosa im Abschnitt stören nicht. Ohne
  Option `--stichtag` nimmt er den Stichtag von hier;
  die Option geht vor (`Tools.md` §Projekt-Skripte).

Danach kopiert der Agent — in beiden Modi gleich —
aus `_template/` ins Anwender-Projekt:

- die **Wurzel-Dokumente** `MasterPrompt.md`,
  `Wiki.md`, `Outgoing.md`, `Vorgehen.md`,
  `Reviewmuster.md`, die Styleguides und `README.md`
  ins Anwender-Root (die README passt er an das
  Projekt an, [[Standarddateien-Katalog]] §2.14),
  dazu `.gitignore`, falls das Projekt noch keine hat
  (MasterPrompt §5.3 Phase A1),
- das **Basis-Wiki**
  (`_template/referenzprozesse/base/wiki/`) ins
  Anwender-`wiki/`, immer vollständig. Welche
  Fassaden das Projekt nutzt, wählt nicht die Kopie,
  sondern die Fassaden-Auswahl in Phase D (Feld
  `active:` und [[Fassaden]]).

Die Kopien sind **lebende Dokumente** — Drift
gegenüber der Template-Quelle ist intendiert.
`_template/` bleibt in beiden Modi Nur-Lese;
`referenzprozesse/` (Steckbriefe, `wiki/`-Skelette
als Merge-Quelle, `bootstrap/`) bleibt dort und wird
nicht ins Anwender-Root kopiert (MasterPrompt §1). Das
Projekt bleibt selbsttragend, weil die
Template-Quelle im Projekt liegt.

**Lint vor Turn 2:** Das Basis-Wiki verlinkt die
Knoten [[Commit-Sprache]] (angelegt in Phase D Turn 2.1)
und [[Aktivierter-Prozess]] (Turn 2.2). Bis dahin ruft der
Agent den Lint so auf:
`sh _template/tools/lint.sh --kennt Aktivierter-Prozess,Commit-Sprache --stichtag <Datum des Inits>`.
Der Stichtag ist das Datum der Zeile `Template-Stand`
des Herkunfts-Vermerks in [[Aktivierter-Prozess]]
(Format oben) — beim Init der Tag der Anlage, den
Turn 2.2 dort einträgt. Sobald der Knoten steht, liest
der Lint das Datum selbst von dort;
der Aufruf ohne Optionen genügt (Eintrag in `Tools.md`
§Projekt-Skripte). Ohne Stichtag — weder Option noch
Herkunfts-Vermerk — gelten neue Pflichtfelder nur als
Hinweis.

## Phase D beim Init — mehrstufiger Ablauf

**Beim Init ist Phase D ein mehrstufiger Ablauf**
(nicht ein einziger Turn) — Setup-Fragen und ihre
Umsetzung verschränken sich über mehrere Turns:

1. **Turn 0 — Init-Fahrplan:** Vor der ersten
   Einzel-Vorlage legt der Agent einen Fahrplan nach
   [[Fahrplan-Vorlage]] vor — welche
   Init-Entscheidungen in welcher Reihenfolge
   anstehen, mit Abhängigkeiten und
   Aufschub-Vorschlägen, ausdrücklich **ohne
   Optionen und Detailempfehlungen**. Der Anwender
   kann streichen, umsortieren oder freigeben; erst
   danach startet Turn 1.
2. **Turn 1:** Erledigt-Block (Ordner angelegt, git-
   Status etc., **verfügbare Prüf-/Recherche-Werkzeuge**
   — Liste oder Vermerk „keine verfügbar"; Quelle ist
   die Umgebung des Agenten, denn `Tools.md` entsteht
   erst mit der ersten Werkzeug-Wahl oder Installation
   ([[Standarddateien-Katalog]] §2.9), spätestens im
   Init — in Turn 2.1 mit dem Ersatzweg für Prüfungen,
   sonst mit dem Lint-Aufruf nach Turn 2.2, §A0 „Lint
   vor Turn 2“) + Aktion-Block (welche Setup-Dateien
   anzulegen sind; was ein Startprompt vorgibt, als
   abgeleitet) + Frage-Block mit den Init-Fragen von
   Turn 1 (Reihenfolge, Vorfestlegung je Frage und
   Briefing-Angebot: §Init-Fragen im Frage-Block).
3. **User antwortet.**
4. **Turn 2:** Agent setzt die Antworten um:
   1. **Buchungen:** TLA → `wiki/Facts.md`
      §Allgemeine Fakten (auf Anwender-Angabe);
      WM-Wahl → `internal-rule`-Knoten
      [[WorkspaceManager-Kontrakt]]; Commit-Sprache
      → `internal-rule`-Knoten [[Commit-Sprache]];
      Ersatzweg für Prüfungen (falls gefragt) →
      `Tools.md` §Prüf-Werkzeuge;
      bei „zweites Repo“ Einrichtung nach
      [[Two-Repo-Submodul-Muster]] (Bauform, Remote,
      Ableitungs-Regel mit der Standardbelegung als
      Vorgabe). Setup-Dateien anlegen.
   2. **Prozess-Merge:** Bei Prozess-Wahl führt der
      Agent den **Merge nach Wiki.md §11.3** durch —
      Fassaden-Skelette und Katalog-Einträge aus dem
      Prozess-`wiki/`-Ordner werden ins
      Anwender-`wiki/` kopiert, Aktivitäts-Regel
      Wiki.md §11.4 greift. Prozess-Wahl und
      Aktivierungs-Kontext werden im
      `internal-rule`-Knoten [[Aktivierter-Prozess]]
      festgehalten (mit dem Herkunfts-Vermerk im
      Format von §Phase A0), der Fassaden-Status in
      [[Fassaden]]. Die Freigabe-Buchung der
      mitgebrachten Ordner (Wiki.md §11.3 Schritt 2)
      bleibt hier noch aus: sie ist ein DEC-Eintrag
      mit `zielmarke:`, und die erste Marke entsteht
      erst in Turn 3 — dort folgt sie unmittelbar nach
      der Marke (Punkt 6). Deklariert der Prozess Präfixe
      oder Mechanik-Knoten, laufen zusätzlich
      Wiki.md §11.3 **Schritt 6**
      (Präfix-Verbuchung) und **Schritt 7**
      (Mechanik-Einführung: Eintragung,
      Neuverdrahtung, Kollisions-Vorlage,
      Rückbau-Kenntnis) — ein Merge ohne diese
      Schritte ist unvollständig. Commit mit Präfix
      `Prozess-Merge:` (MasterPrompt §6.2).
   3. **Prozess-spezifische Init-Fragen** aus der
      Prozess-Definition sammeln: das jeweilige
      Prozess-`index.md` bündelt sie im Abschnitt
      „Prozess-spezifische Init-Fragen“ mit Verweis
      auf die Stelle, die jede Frage regelt und einem
      Halbsatz, was sie vorfestlegt; bei einem Prozess
      mit Basis-Prozess werden die Fragen beider
      Abschnitte zusammen nach MasterPrompt §5.1.0
      geordnet (Vorfestlegungs-Stärke: die Rollen-Frage
      vor dem MADR-Angebot). Dazu kommt die Frage nach
      der Bezeichnung der ersten Marke (§Init-Fragen,
      Turn 2). Für jede Frage: erst nach
      MasterPrompt §5.1.0 Ableitbarkeit prüfen — wenn die Antwort
      aus Aufruf-Prompt, Startprompt oder
      vorhandenen Dateien ableitbar ist, direkt
      übernehmen. Sonst als Aktions-Entwurf oder
      Frage-Block präsentieren. Kaskadierte
      Anschluss-Fragen (deren Sinn erst durch die
      Antwort auf die vorherige Frage entsteht)
      werden im gleichen Turn nachgezogen, ohne
      Zwischen-Runde zurück zum User; erst wenn alle
      prozess-spezifischen Fragen aufgelöst sind,
      geht es zu Punkt 4.
   4. **Fassaden-Auswahl-Vorlage** für die
      optionalen Fassaden (siehe unten —
      mandatory-Fassaden sind bereits aktiv
      gemeldet).
5. **User antwortet.**
6. **Turn 3:** Agent setzt die Fassaden-Auswahl um
   (aktiviert/deaktiviert per Frontmatter-Feld
   `active`, Bootstrap-Abarbeitung — siehe unten; mit
   dem Bootstrap der Pflicht-Fassade [[Zielmarken]]
   entsteht die erste Marke), aktualisiert
   `wiki/Fassaden.md`. Unmittelbar nach der Anlage der
   ersten Marke bucht er die Freigabe der
   mitgebrachten Ordner des Prozess-Merge (Punkt 4.2;
   Wiki.md §11.3 Schritt 2) — der erste DEC-Eintrag
   des Projekts, mit der ersten Marke in
   `zielmarke:` und dem Tag der Anlage als
   Anlage-Datum ([[Katalog]] §Typ-Konventionen); vor
   der Marke wird kein Element gebucht.
7. **Turn — Konzept-Angebot** (Register-gestützt;
   siehe unten), danach — falls Mission Statement
   aktiv geblieben ist — der
   **Mission-Statement-Setup-Dialog**.
8. **User antwortet.** _(nur bei aktivem Mission
   Statement)_
9. **Folge-Turn (ggf.):** Agent legt Mission-
   Statement-Entwurf vor bzw. Fallback
   (minimalistisch aus Facts §Projekteinstieg);
   ggf. Konzept-Nach-Angebot (siehe unten).
10. **Abschluss-Turn:** Phase E "Bereit für den
    ersten Auftrag". Bei einem Prozess mit
    Scaffolding (SP-1+) weist der Agent zusätzlich
    auf die Scaffolding-Vorlagen-Kette als nächsten
    Prozess-Schritt hin.

## Init-Aktionen im Aktion-Block

Typische Init-Einträge im Aktion-Block (ohne
Rückfrage, Widerspruch möglich):

Bei Init:
- **Instruktionsdatei** (z.B. `CLAUDE.md`) neu
  anlegen bzw. Pflichtabschnitte ergänzen — als
  Entwurf zur Review.
- **`Styleguide-project.md`** anlegen (leer bzw.
  mit gesammelten Terminologie-Hinweisen aus dem
  Init-Dialog).
- **`Styleguide-chat.md`** aus dem Standard-
  Textbaustein anlegen (Kopiervorlage
  `wiki/templates/Styleguide-chat-Vorlage.md`,
  [[Standarddateien-Katalog]] §2.7a). Der User kann
  sie anschließend anpassen.
- **`wiki/Facts.md` und `wiki/Katalog.md`**:
  Skelette sind mit dem Basis-Wiki bereits
  vorhanden (Phase A0), die Basis-Katalog-Einträge
  ebenso; Agent füllt sie aus User-Angaben und Kontext
  (Katalog: Bearbeitungsstand-Zeile, mitgebrachte Einträge des
  gewählten Prozesses als Zeilen verankern, ggf.
  projektspezifische Einträge). Die
  inhaltliche Befüllung ist Aktion; das Vorhanden-
  sein der Datei wird im Erledigt-Block gemeldet.
- **Initiale Wiki-Knoten** aus ingestierten
  Dokumenten als Entwürfe anlegen und dem User zur
  Review vorlegen.

## Init-Fragen im Frage-Block

**Beim Init** kommen fixe Setup-Fragen dazu. Ihre
Reihenfolge folgt der Regel „Fragen-Reihenfolge nach
Vorfestlegungs-Stärke“ (MasterPrompt §5.1.0): die
Frage, deren Antwort am meisten anderes festlegt,
zuerst. Damit eine spätere Änderung die Regel nicht
unbemerkt bricht, steht bei jeder Frage, was sie
vorab festlegt. Vor jeder Frage prüft der Agent die
Ableitbarkeit (MasterPrompt §5.1.0), insbesondere aus einem
Startprompt (§Init mit Startprompt); eine abgeleitete
Antwort steht als Entwurf im Aktion-Block, die Frage
entfällt. Präsentiert wird nach `Styleguide-chat.md`
Regel 2.

**Übersicht und Briefing-Modus:** Der Init-Fahrplan
(Turn 0) ist die Übersicht nach MasterPrompt §5.1.0 —
die Init-Entscheidungen in der Reihenfolge dieses
Abschnitts, je Punkt eine Zeile. Mit ihm bietet der
Agent den Briefing-Modus an (Erläuterung, Schwelle und
Wechsel: MasterPrompt §5.1.0). Wählt der Anwender ihn, stellt der
Agent die Fragen der folgenden Turns einzeln; sonst
als Frage-Block je Turn.

**Turn 1 — Basis-Setup und Prozess-Wahl:**

1. **Prozess-Angebot** (Auswahlmenü, siehe unten) —
   nur wenn `_template/referenzprozesse/*/Steckbrief.md`
   gefunden werden. _Legt vorab fest:_ Fassaden und
   Katalog-Einträge des Merge, die prozess-spezifischen
   Init-Fragen von Turn 2 (darunter ggf. die Rollen-Frage
   eines Entwicklungsprojekts), die Vorauswahl der
   Commit-Sprache.
2. **Ein-/Zwei-Repo-Frage** (siehe unten). _Legt vorab
   fest:_ ob ein Produkt-Repo entsteht, wo die
   selbsttragenden Dokumente liegen und ob eine
   Ableitungs-Regel eingerichtet wird.
3. **WorkspaceManager verfügbar?** (siehe unten).
   _Legt vorab fest:_ ob der Agent Konvertierung und
   Outgoing-Erzeugung selbst übernimmt.
4. **Bearbeiter-TLA** (dreistellig). _Legt vorab
   fest:_ nur das Kürzel der Versionskette in
   `output/`/`overview/`.
5. **Commit-Sprache** (Auswahlmenü, siehe unten) —
   Vorauswahl abhängig von der Prozess-Wahl. _Legt
   vorab fest:_ nur die Sprache der Commit-Messages.
6. **Ersatzweg für Prüfungen ohne zweites Modell** —
   nur, wenn der Erledigt-Block von Turn 1 kein
   Werkzeug nennt, über das ein zweites Modell prüfen
   kann (Peer-Agent, externes Modell): (a)
   Ein-Modell-Weg (dasselbe Modell prüft in frischem
   Kontext, Einschränkung „Prüf-Modell = Bau-Modell“
   im Freigabe-Eintrag) oder (b) Anwender als Prüfer
   (`Reviewmuster.md` §2 Schleife 2, Fallback). _Legt
   vorab fest:_ wie jede Prüfung läuft, die
   Prüf-Modell ≠ Bau-Modell verlangt (Kettenprüfung,
   Code-Review, Prüfer-Schleife), bis ein Werkzeug
   dazukommt; Eintrag in `Tools.md` §Prüf-Werkzeuge.

**Turn 2 — prozess-spezifische Init-Fragen, erste
Marke und Fassaden-Auswahl-Vorlage** (nach Umsetzung
der Turn-1-Antworten inkl. Prozess-Merge, mit
prozess-spezifischer Vorauswahl; siehe unten):

1. **Prozess-spezifische Init-Fragen** in der Ordnung
   nach MasterPrompt §5.1.0 (§Phase D, Punkt 3). _Legt
   vorab fest:_ was der gewählte Prozess je Frage in
   seinem `index.md` nennt (SP-1 `index.md` §4.12,
   RP-1 `index.md` §6.1).
2. **Bezeichnung der ersten Marke** — Vorschlag die
   typische Marke des gewählten Prozesses aus dessen
   `Marken-<P>.md`, ohne Prozess „1.0“; ableitbar aus
   Aufruf-Prompt oder Startprompt (Bootstrap
   `Zielmarken.md` Schritt 1). _Legt vorab fest:_ die
   Bezeichnung der `in-progress`-Marke, die danach
   fest bleibt ([[Zielmarken]] §Meta); Turn 3 legt die
   Marke mit ihr an.
3. **Fassaden-Auswahl-Vorlage.** _Legt vorab fest:_
   die aktiven Register und damit das Konzept-Angebot
   und den Mission-Statement-Dialog.

Ggf. weitere projektspezifische Fragen aus dem
Ingest der ersten Dokumente.

## Baustein: Ein-/Zwei-Repo-Frage

**Ein Repo oder zwei?** Der Agent fragt: „Ein Repo
mit allem oder ein zweites Repo für das Produkt?“ und
erklärt die zweite Möglichkeit in einem Satz: das
Wiki bleibt die Quelle der Wahrheit in diesem Repo,
das Produkt der Marke ([[Glossar]]; bei Software
Code, Tests, Build und die selbsttragende Doku) liegt
in einem eigenen Repo —
z.B. wenn das Produkt öffentlich, die Arbeits-Historie
privat bleiben soll.

```
Ein Repo mit allem oder ein zweites Repo für das Produkt?

- (1) ein Repo mit allem
- (2) zweites Repo für das Produkt (getrennte
  Historie, z.B. Produkt öffentlich, Arbeit privat)
```

**Ableitbar** ist die Antwort, wenn der Aufruf- oder
Startprompt sie nennt oder das Projekt schon ein
Produkt-Submodul bzw. ein Produkt-Repo daneben führt.
Umsetzung in Turn 2 (Buchungen); was „zweites Repo“
einrichtet und was im Ein-Repo-Fall gilt:
[[Two-Repo-Submodul-Muster]] — lesen, bevor die
Einrichtung vorgelegt wird.

## Init mit Startprompt (Komponente)

Ein Komponenten-Projekt entsteht über denselben Init
wie das Hauptprojekt: sein Koordinator erzeugt in der
Phase P6 „Starten von Teilaktivitäten“ einen
Startprompt (mit RP-1: `Vorgehen-RP-1.md`), der Anwender
gibt ihn dem Agenten des neuen Projekts. Der
Startprompt enthält:

| Angabe | Was der Agent daraus ableitet |
|---|---|
| Einstieg des Koordinators: der Start-Satz für ein neues Projekt aus der Vorlage, aus der der Koordinator selbst stammt (Zeile `Quelle` seines Herkunfts-Vermerks, §Phase A0; Wortlaut aus dem Agenten-Einstieg dieser Vorlage, README — aus einem Starter dessen Einzeiler für ein neues Projekt, aus der allgemeinen Vorlage deren Start-Satz), dazu ein Satz, dass es andere Referenzprozesse gibt und der Agent im Zweifel den Anwender fragt | den Init-Weg „neu“ mit der Vorlage des Koordinators — Ablauf wie in diesem Knoten; den Referenzprozess der Komponente gibt der Startprompt **nicht** vor: der Agent prägt den aus, der zum Auftrag der Komponente (Übergabe-Stand) passt — aus der allgemeinen Vorlage über das Prozess-Angebot (§Baustein Prozess-Angebot), aus einer Vorlage mit vorbefülltem Prozess nach deren Init-Anleitung —, und fragt den Anwender, welchen Referenzprozess er ausprägen soll, wenn er sich nicht sicher ist |
| Rolle **Komponent** | die Entwicklungs-Projekt-Rolle ist vorab festgelegt; die Rollen-Frage entfällt (mit SP-1: `index.md` §5.2), Zeile `Rolle` im Herkunfts-Vermerk von [[Aktivierter-Prozess]] (§Phase A0) |
| eigener Repo-Name, Pfad und Remote der Komponente (aus der Start-Tabelle des Koordinators, `Vorgehen.md` §3) | die eigene Zeile in §Komponenten der Architektur-Fassade mit Lage im eigenen Repo (das eigene Bauteil, [[Kettenpruefung]] §Freigabe-Ordnung des Koordinators); der eigene Repo-Name ist zugleich der Absender `von:` jeder Nachricht ([[Katalog-message]]) und der Qualifizierer, unter dem andere Repos auf diese Komponente verweisen |
| Koordinator: Repo-Name und Pfad | der Repo-Name ist der Qualifizierer in Verweisen auf den Koordinator (`<koordinator>/FUNC-012`); Name und Pfad stehen als Lage des Koordinators in §Komponenten der Architektur-Fassade (mit SP-1: `Systemarchitektur.md`) |
| Übernahme-Art (selbstständig oder Auftrag) | die Kette der Komponente — [[Kettenpruefung]] §Komponenten-Kette nach Übernahme-Art, lesen vor dem ersten eigenen Stand; Zeile `Übernahme-Art` neben der Rolle im Herkunfts-Vermerk von [[Aktivierter-Prozess]] (§Phase A0) — daraus liest der Lint, ab welchem Glied die Kette der Komponente Pflicht-Stände verlangt (selbstständig: ab P3, Auftrag: ab P5) |
| Verweis auf den freigegebenen Übergabe-Stand (keine CON-IDs: die angenommenen CON mit Beteiligung der Komponente enthält der Übergabe-Stand) | die Wurzel der eigenen Kette und die Grundlage, auf die die Komponente qualifiziert verweist (mit SP-1: Dokumenttyp Übergabe); dazu den Wert `fuer_marke:` der ersten Marke ([[Zielmarken]] §Meta „Zuliefernde Komponenten“) |
| bekannte Nachbarn: Repo-Name und Pfad (falls genannt) | weitere Zeilen in §Komponenten der Architektur-Fassade — die Repos, mit denen die Komponente Nachrichten tauscht |
| Start und Transport: (a) Peer-Werkzeug oder (b) Datei-Variante | wie Nachrichten zwischen Komponente und Koordinator laufen (`Vorgehen.md` §3); keine Frage — der Agent trägt die Wahl aus dem Startprompt in `Tools.md` ein, Kategorie „Peer-Agenten: Start und Transport“ |

Was der Startprompt vorgibt, legt der Agent im
Aktion-Block als abgeleitet vor; die zugehörigen
Fragen stellt er nicht. Nennt der Startprompt weitere
Antworten (z.B. das Kürzel oder die Commit-Sprache), gilt
dasselbe. Die Prozess-Frage gehört nicht dazu: Der
Referenzprozess der Komponente ist nicht abgeleitet
(Tabelle oben), auch wenn der Koordinator selbst
einen bestimmten Prozess fährt — ein Vorhaben kann
einen Partner mit anderem Prozess brauchen. Der
Startprompt ist eine Einmal-Instanz in `output/` des
Koordinators, kein Wiki-Knoten.

## Baustein: WorkspaceManager-Frage

**WorkspaceManager verfügbar?** Der
  Agent fragt einmal explizit nach **beiden Rollen**
  eines WorkspaceManagers, weil sie unabhängig
  vorhanden sein können:

  1. **Konvertierung** — Umwandlung von
     Originaldokumenten aus `raw/` bzw. externen
     Quellen nach `input/` (MasterPrompt §1.3.1).
  2. **Outgoing-Erzeugung** — Erzeugung von
     PDF/EML/DOCX aus `outgoing/`-`.md`-Dateien via
     Pandoc (MasterPrompt §1.7, `Outgoing.md`).

  Antwort-Optionen (Auswahlmenü nach
  `Styleguide-chat.md`): "beides vorhanden", "nur
  Konvertierung", "nur Outgoing-Erzeugung", "keins".

  - **Vorhanden:** Agent bittet den User künftig,
    ihn bei Bedarf zu starten.
  - **Nicht vorhanden:** Agent übernimmt die
    Aufgabe selbst mit seinen Tools und APIs
    (MasterPrompt §1.3.1 Fallback für Konvertierung; `Outgoing.md`
    Fallback für Erzeugung).

  Die Antworten werden im `internal-rule`-Knoten
  [[WorkspaceManager-Kontrakt]] persistent vermerkt
  (getrennt pro Rolle).

## Baustein: Prozess-Angebot

**Prozess-Angebot:** Der Agent scannt bei Init alle
Prozess-Steckbriefe (`_template/referenzprozesse/*/Steckbrief.md`)
und führt den **Vererbungs-Konsistenz-Lint** (Wiki.md
§11.2) über die gesammelten Steckbriefe aus. Bei
Lint-Fehlern (Zyklen, fehlende Basen,
Doppel-Definition, Element-Sackgassen/-Zyklen)
**blockiert die Auswahl** — der Agent meldet die
Befunde und bittet um Bereinigung des Templates,
bevor er fortfährt.

Aus dem Lint-Lauf ergibt sich das **konsolidierte
Aggregat** (alle Steckbriefe zusammengefasst +
resultierender Vererbungsbaum). Aus dem Aggregat
generiert der Agent das Auswahl-Menü. Format je
Eintrag: Kennung, Kurzname, „Was ich bin"-Satz aus
dem Steckbrief, Basis-Prozess falls vorhanden.
Referenzprozesse (RP-*) werden nur angeboten, wenn ihr
Basis-Prozess ebenfalls angeboten wird. Zusätzliche
Standardoption „ohne Prozess frei starten" als letzte
Wahl.

Beispiel:

```
Welchen Prozess soll ich als Grundlage nehmen?

- (1) SP-1 Standardprozess Entwicklungsprojekt
  (eigenständig, keine Basis)
- (2) RP-1 Entwicklung eines Softwaresystems
  (Basis: SP-1)
- (3) ohne Prozess frei starten
```

**Geplante Prozesse:** Wählt der Anwender einen
Prozess mit `status: geplant` im Steckbrief, gibt
der Agent die Ansage: „Dieser Prozess ist geplant,
aber noch nicht ausgearbeitet. Du musst erst einmal
mit der Basis arbeiten." Danach läuft der Init im
**Basis-Only-Modus** weiter — kein Merge, kein
Zusatz-Angebot. Dasselbe gilt für
`extends:`-Verweise auf geplante Prozesse.

Falls keine `_template/referenzprozesse/*/Steckbrief.md`
gefunden wird: die Frage entfällt, Agent arbeitet
ohne Prozess. Die Wahl wird im
`internal-rule`-Knoten [[Aktivierter-Prozess]]
persistent vermerkt. Steckbriefe pro Prozess
ersetzen einen zentralen Prozess-Katalog — jeder
Prozess bringt seine Selbstbeschreibung mit.

## Baustein: Commit-Sprache

**Commit-Sprache:** Auswahlmenü (siehe MasterPrompt §6.2):

```
Welche Sprache für Commit-Messages?

- (A) Projektsprache für alles
  [Vorauswahl bei "ohne Prozess"]
- (B) Sprache folgt Artefakt: Wiki/Dokumente
  Projektsprache, Code englisch
  [Vorauswahl bei Codeprojekt-Prozessen wie SP-1]
- (C) Englisch für alles
```

Persistierung im `internal-rule`-Knoten
[[Commit-Sprache]].

## Baustein: Init-Fassaden-Auswahl (Turn 2)

**Init-Fassaden-Auswahl (Turn 2):** Die Fassaden-
Anlage definiert projektstrukturelle Basiskomponenten
— sie wird bewusst erfragt, nicht per
[[Do-first-mit-Veto]] gebaut. Jede Fassade (Basis
wie Prozess) trägt eine Einstufung
**mandatory/optional** — für Basis-Fassaden in
`Wiki.md` §3a, für Prozess-Fassaden in der Sektion
`§ Mitgebrachte Fassaden` des jeweiligen
Steckbriefs:

- **mandatory-Fassaden** werden ohne Frage aktiv
  und im Erledigt-Block gemeldet (Basis: Facts,
  Katalog, Fassaden, InterneMechanik, Zielmarken,
  Entscheidungen — `Wiki.md` §3a; Zielmarken und
  Entscheidungen sind auch ohne Prozess nicht
  abwählbar;
  Beispiel Prozess: „Prozess-Merge SP-1:
  Anforderungen, Fehlermeldungen aktiviert"). Eine
  Fassade kann eine andere voraussetzen (`Wiki.md`
  §3a „Abhängigkeiten“; mit SP-1: Fehlermeldungen
  setzt Anforderungen voraus) — solange die abhängige
  Fassade aktiv ist, ist die vorausgesetzte nicht
  abwählbar: der Agent lehnt die Abwahl ab und erklärt
  das bei der Auswahl und in der Rückfrage; wer die
  vorausgesetzte Fassade abwählen will, wählt zuerst
  die abhängige ab (ebenso bei einer späteren
  Deaktivierung, `Wiki.md` §3a
  „Deaktivierungs-Grenzen“). Dazu
  zählen die **optionalen Basis-Fassaden, die der
  aktive Prozess voraussetzt** (`Wiki.md` §3a,
  Pflicht durch den Prozess; welche: Steckbrief
  `§ Mitgebrachte Fassaden` bzw.
  Einstufungs-Tabelle): der Prozess-Merge aktiviert
  sie ohne Rückfrage, sie erscheinen nicht in der
  Ja/Nein-Vorlage, sondern im Erledigt-Block.
- **optional-Fassaden** werden per Ja/Nein-Frage
  vorgelegt, Voreinstellung nach der Empfehlung aus
  `Wiki.md` §3a bzw. Steckbrief; auch eine Fassade mit
  Voreinstellung „nein“ (z.B. Mission Statement Long)
  wird angeboten, nicht vorausgewählt — das Ankreuzen
  ist die Anweisung zur Aktivierung. Beispielformulierung
  (der Agent darf im Anwender-Jargon variieren; der
  Kern bleibt: Zweck nennen — er steht im
  Katalog-Eintrag der Fassade —, Empfehlung nennen,
  Ja/Nein-Frage stellen):

  > „Der Prozess bringt die Fassade `Contract-Index`
  > mit — sie ist optional. Zweck: koordiniert
  > Contracts über mehrere Komponenten. Empfehlung:
  > aktivieren, wenn du ein Multi-Komponenten-Setup
  > planst. Aktivieren? [ja/nein, empfohlen: ja]"

Der Agent **wartet auf User-Antwort**, bevor er die
Fassaden-Konfiguration umsetzt.

**Umsetzung des Auswahl-Ergebnisses:**

- **Erste Marke:** mit der Bootstrap-Abarbeitung der
  Pflicht-Fassade [[Zielmarken]] legt der Agent die
  erste Marke an (Zustand `in-progress`). Die
  Bezeichnung hat der Anwender in Turn 2 genannt
  (§Init-Fragen); der Agent hatte die typische Marke
  des gewählten Prozesses vorgeschlagen (aus dessen
  `Marken-<P>.md`, Basis: [[Marken]]), ohne Prozess
  „1.0“. Ablauf und Format: Bootstrap-Datei
  `_template/referenzprozesse/base/bootstrap/Zielmarken.md`
  (führender Ort) und [[Zielmarken]] §Meta. Die erste
  Marke steht vor dem ersten Element: erst nach ihr
  bucht der Agent die Ordner-Freigaben des
  Prozess-Merge (§Phase D Turn 3) und alles Weitere.
- **Aktivierte Fassaden:** `active: true` im
  Frontmatter; danach **Bootstrap-Abarbeitung** —
  der Agent liest die zugehörige Bootstrap-Datei
  aus der Template-Quelle
  (`_template/referenzprozesse/<P>/bootstrap/<Fassade>.md`,
  in beiden Anbindungs-Modi — Wiki.md §11
  „`bootstrap/`“) und arbeitet sie ab (insbesondere die
  `### Verankerungen`-Checkliste: anzulegende
  `internal-*`-Knoten und der Eintrag in
  `wiki/Fassaden.md`). In die Anwender-Fassade wird
  nichts davon kopiert; ihre `## Meta`-Sektion ist
  die dauerhafte Betriebs-Semantik.
- **Abgewählte optional-Fassaden:** werden **nicht
  gelöscht**, sondern per `active: false`
  deaktiviert; für eine spätere Reaktivierung läuft
  dieselbe Frage- und Bootstrap-Mechanik — die
  Bootstrap-Datei liegt dauerhaft in der
  Template-Quelle
  (`_template/referenzprozesse/.../bootstrap/`, in
  beiden Modi, MasterPrompt §1).

Anschließend vermerkt der Agent aktive und
deaktivierte Fassaden in `wiki/Fassaden.md` (inkl.
aktive Prozesse — deren Kontext im
`internal-rule`-Knoten [[Aktivierter-Prozess]];
Ersetzungen von Typen zeigen die
`Replaces type`-Zeilen der Katalog-Einträge) und
überträgt die
Konfigurations-Übersicht in seine Instruktionsdatei
(MasterPrompt §8.3).

## Baustein: Konzept-Angebot

**Konzept-Angebot** (nach der Fassaden-Auswahl, vor
dem Mission-Statement):

Der Agent liest das mitgelieferte Register
[[Konzept-Repositories]] (`internal-rule`-Knoten;
ausgeliefert mit einer ersetzbaren
Betreiber-Vorbelegung) und ermittelt die
anzubietenden Repositories: alle Einträge mit
Geltung „Basis" plus die Einträge der aktivierten
Prozesse einschließlich ihrer `extends:`-Kette
(Beispiel: bei RP-1 werden die Repositories von
Basis, SP-1 und RP-1 angeboten).

**Empfehlungs-Subagent je Repository:** für jedes
anzubietende Repository startet der Agent einen
Subagenten mit frischem Kontext (bei mehreren
Repositories parallel). Auftrag: Kurzfassung von
Projekt-Auftrag und Zweck, gewählte Prozesse und der
Repository-Zugang — der Subagent sichtet die
Konzepte und gibt je Konzept **empfohlen / neutral /
nicht relevant** mit Ein-Satz-Begründung zurück.
Regeln: keine erhoffte Antwort im Auftrag, keine
Relevanz erfinden, „keine Empfehlung" ist ein
gültiges Ergebnis.

Der Agent listet dann alle verfügbaren Konzepte
(Titel + Kurzsatz) mit den
Empfehlungs-Markierungen und stellt im selben Turn
die feste Zusatzfrage:
**„Hast du weitere solche Sammlungen
(Konzept-/Proposal-Repositories)?"** — genannte
Sammlungen nimmt er sofort mit Thema und Geltung
ins Register auf. Der Anwender wählt:

- konkrete Konzepte übernehmen (Mehrfachauswahl),
- „später" — das Angebot kommt nach dem
  Mission-Statement noch einmal (Nach-Angebot, mit
  der dann formulierten Mission als Kontext),
- „nichts übernehmen".

**Übernahme-Mechanik** pro gewähltem Konzept:

1. **DEC-Buchung** im Anwender-Register
   `wiki/Entscheidungen.md` (angenommen mit Datum,
   Zielmarke — die erste Marke, sie besteht seit
   Turn 3 — und Herkunft Repository/Konzept).
2. **Quell-Kopie** als `document`-Detail-Knoten mit
   `document_type: proposal` in `wiki/`; Frontmatter
   trägt Herkunfts-URL und Übernahme-Datum.
3. **Fassaden-Wirkung als Aktions-Entwurf** — der
   Agent liest das übernommene Konzept und schlägt
   Einträge in relevanten Fassaden vor; der Anwender
   bestätigt explizit vor Materialisierung (kein
   [[Do-first-mit-Veto]], weil Konzepte
   konzeptionell reich sind und selektive Übernahme
   wichtig ist).

Ist das Register leer (alle Einträge gestrichen),
beschränkt sich der Turn auf die Zusatzfrage nach
weiteren Sammlungen; ohne Netzzugriff entfällt das
Konzept-Listing (das Register wird trotzdem
gepflegt); ohne Sub-Agent-Fähigkeit entfällt nur die
Empfehlungs-Stufe — dann neutrale Liste (Titel +
Kurzsatz). Jeweils mit Vermerk im Erledigt-Block.

## Baustein: Mission-Statement-Setup-Dialog

**Mission-Statement-Setup-Dialog** (Abschluss von
Phase D):

Nachdem Fassaden-Auswahl, Facts- und ggf. erste
Ingest-Runde abgeschlossen sind, führt der Agent den
**Setup-Dialog für Mission Statement** durch —
sofern die Kurzform in der Init-Auswahl aktiv
geblieben ist. Der Agent fragt aktiv, was ins
Mission Statement soll, und legt einen Entwurf vor
(basierend auf Projekt-Identifikation, Facts
§Projekteinstieg und den ersten ingestierten
Dokumenten). Der User bestätigt, korrigiert oder
ergänzt. Fallback: wenn kein Vorschlag gewünscht ist,
bleibt Mission Statement minimalistisch (Projektname
+ Zweck aus Facts §Projekteinstieg).

Vollständige Prozessbeschreibung in `Wiki.md` §3a.2.
Der Dialog steht bewusst am Ende von Phase D, weil er
auf allen anderen Init-Ergebnissen aufbaut. Für die
Langform gilt derselbe Dialog, sobald sie in der
Fassaden-Auswahl angekreuzt oder später aktiviert
wird.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzformen: MasterPrompt §5.3 (Phase A0,
  Phase D)
- Fahrplan-Muster für Turn 0: [[Fahrplan-Vorlage]]
- Fragen-Reihenfolge und Briefing-Modus: MasterPrompt
  §5.1.0
- Ein-/Zwei-Repo-Einrichtung:
  [[Two-Repo-Submodul-Muster]]
- Kette einer Komponente: [[Kettenpruefung]]
- Merge-Mechanik: Wiki.md §11.3; Fassaden-Katalog:
  Wiki.md §3a
