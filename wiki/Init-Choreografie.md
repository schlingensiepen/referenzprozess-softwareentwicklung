---
type: internal-pattern
---

# Init-Choreografie

Vollständige Init-Choreografie des Sessionstarts:
Phase A0 (Setup lebende Dokumente) und der
mehrstufige Phase-D-Ablauf mit allen Init-Bausteinen
(Turn-Sequenz, Init-Fragen, Prozess-Angebot,
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
(DEC-223). Phase A0 kopiert ihn mit dem Basis-Wiki
ins Anwender-`wiki/`.

## Phase A0 — Setup lebende Dokumente (nur Init mit Template-Quelle)

Die Modus-Wahl legt die Template-Quelle unter
`_template/` an (DEC-223):

- **Modus A:** der Agent kopiert die komplette
  Template-Quelle aus dem übergebenen Pfad einmalig
  nach `_template/` (bei einem git-Klon ohne dessen
  `.git`) und committet sie mit dem Projekt — als
  **Ur-Versions-Archiv**, gegen das der Anwender
  jederzeit diffen kann. Die Herkunft (Quelle und
  Stand, z.B. Commit/Tag) vermerkt er im
  `internal-rule`-Knoten [[Aktivierter-Prozess]].
- **Modus B:** der Agent bindet das Template-Repo
  als git-Submodul unter `_template/` ein.

Danach kopiert der Agent — in beiden Modi gleich —
aus `_template/` ins Anwender-Projekt:

- die **Wurzel-Dokumente** `MasterPrompt.md`,
  `Wiki.md`, `Outgoing.md`, `Vorgehen.md`,
  `Reviewmuster.md`, die Styleguides und `README.md`
  ins Anwender-Root,
- das **Basis-Wiki**
  (`_template/referenzprozesse/base/wiki/`) ins
  Anwender-`wiki/`.

Die Kopien sind **lebende Dokumente** — Drift
gegenüber der Template-Quelle ist intendiert.
`_template/` bleibt in beiden Modi Nur-Lese;
`referenzprozesse/` (Steckbriefe, `wiki/`-Skelette
als Merge-Quelle, `bootstrap/`) bleibt dort und wird
nicht ins Anwender-Root kopiert (DEC-223). Das
Projekt bleibt selbsttragend, weil die
Template-Quelle im Projekt liegt.

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
   Status etc., **verfügbare Prüf-/Recherche-Werkzeuge
   aus `Tools.md`** — Liste oder Vermerk „keine
   verfügbar") + Aktion-Block (welche Setup-Dateien
   anzulegen sind) + Frage-Block mit den Init-Fragen
   in fester Reihenfolge:
   - TLA,
   - WM-Verfügbarkeit,
   - **Prozess-Angebot** (aus Aggregat der
     `_template/referenzprozesse/*/Steckbrief.md`, falls
     vorhanden — siehe unten),
   - **Commit-Sprache** (A/B/C-Menü, Vorauswahl
     abhängig vom Prozess — siehe unten).
3. **User antwortet.**
4. **Turn 2:** Agent setzt die Antworten um:
   1. **Buchungen:** TLA → `wiki/Facts.md`
      §Allgemeine Fakten (auf Anwender-Angabe);
      WM-Wahl → `internal-rule`-Knoten
      [[WorkspaceManager-Kontrakt]]; Commit-Sprache
      → `internal-rule`-Knoten [[Commit-Sprache]].
      Setup-Dateien anlegen.
   2. **Prozess-Merge:** Bei Prozess-Wahl führt der
      Agent den **Merge nach Wiki.md §11.3** durch —
      Fassaden-Skelette und Katalog-Anhang aus dem
      Prozess-`wiki/`-Ordner werden ins
      Anwender-`wiki/` kopiert, Aktivitäts-Regel
      Wiki.md §11.4 greift. Prozess-Wahl und
      Aktivierungs-Kontext werden im
      `internal-rule`-Knoten [[Aktivierter-Prozess]]
      festgehalten, der Fassaden-Status in
      [[Fassaden]]. Deklariert der Prozess Präfixe
      oder Mechanik-Knoten, laufen zusätzlich
      Wiki.md §11.3 **Schritt 6**
      (Präfix-Verbuchung) und **Schritt 7**
      (Mechanik-Einführung: Eintragung,
      Neuverdrahtung, Kollisions-Vorlage,
      Rückbau-Kenntnis) — ein Merge ohne diese
      Schritte ist unvollständig. Commit mit Präfix
      `Prozess-Merge:` (§6.2).
   3. **Prozess-spezifische Init-Fragen** aus der
      Prozess-Definition sammeln (siehe jeweiliges
      Prozess-`index.md` §„Prozess-spezifische
      Init-Fragen"). Für jede Frage: erst nach
      §5.1.0 Ableitbarkeit prüfen — wenn die Antwort
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
   `active`, Bootstrap-Abarbeitung — siehe unten),
   aktualisiert `wiki/Fassaden.md`.
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
- **`wiki/Facts.md` und `wiki/Knotentypen.md`**:
  Skelette sind mit dem Basis-Wiki bereits
  vorhanden (Phase A0);
  Agent füllt sie aus User-Angaben und Kontext
  (Knotentypen aus vorausgefülltem Standardkatalog
  plus ggf. projektspezifische Ergänzungen). Die
  inhaltliche Befüllung ist Aktion; das Vorhanden-
  sein der Datei wird im Erledigt-Block gemeldet.
- **Initiale Wiki-Knoten** aus ingestierten
  Dokumenten als Entwürfe anlegen und dem User zur
  Review vorlegen.

## Init-Fragen im Frage-Block

**Beim Init** kommen fixe Setup-Fragen dazu; sie
werden in dieser **festen Reihenfolge** als
zusammenhängender Frage-Block präsentiert (nach
`Styleguide-chat.md` Regel 2). Der Frage-Block
verteilt sich auf mehrere Turns; der Init-Fahrplan
(Turn 0) macht die Kette vorab sichtbar:

**Turn 1 — Basis-Setup und Prozess-Wahl:**

1. **Bearbeiter-TLA** (dreistellig) — für
   Versionskette in `output/`/`overview/`.
2. **WorkspaceManager verfügbar?** (siehe unten)
3. **Prozess-Angebot** (Auswahlmenü, siehe unten) —
   nur wenn `_template/referenzprozesse/*/Steckbrief.md`
   gefunden werden.
4. **Commit-Sprache** (Auswahlmenü, siehe unten) —
   Vorauswahl abhängig von der Prozess-Wahl.

**Turn 2 — prozess-spezifische Init-Fragen und
Fassaden-Auswahl-Vorlage** (nach Umsetzung der
Turn-1-Antworten inkl. Prozess-Merge, mit
prozess-spezifischer Vorauswahl; siehe unten).

Ggf. weitere projektspezifische Fragen aus dem
Ingest der ersten Dokumente.

## Baustein: WorkspaceManager-Frage

**WorkspaceManager verfügbar?** Der
  Agent fragt einmal explizit nach **beiden Rollen**
  eines WorkspaceManagers, weil sie unabhängig
  vorhanden sein können:

  1. **Konvertierung** — Umwandlung von
     Originaldokumenten aus `raw/` bzw. externen
     Quellen nach `input/` (§1.3.1).
  2. **Outgoing-Erzeugung** — Erzeugung von
     PDF/EML/DOCX aus `outgoing/`-`.md`-Dateien via
     Pandoc (§1.7, `Outgoing.md`).

  Antwort-Optionen (Auswahlmenü nach
  `Styleguide-chat.md`): "beides vorhanden", "nur
  Konvertierung", "nur Outgoing-Erzeugung", "keins".

  - **Vorhanden:** Agent bittet den User künftig,
    ihn bei Bedarf zu starten.
  - **Nicht vorhanden:** Agent übernimmt die
    Aufgabe selbst mit seinen Tools und APIs
    (§1.3.1 Fallback für Konvertierung; `Outgoing.md`
    Fallback für Erzeugung).

  Die Antworten werden im `internal-rule`-Knoten
  [[WorkspaceManager-Kontrakt]] persistent vermerkt
  (getrennt pro Rolle).

## Baustein: Prozess-Angebot

**Prozess-Angebot:** Der Agent scannt bei Init alle
Prozess-Steckbriefe (`_template/referenzprozesse/*/Steckbrief.md`)
und führt den **Vererbungs-Konsistenz-Lint** (Wiki.md
§11.2) über die gesammelten Steckbriefe aus. Bei
Lint-Fehlern (Zyklen, fehlende Basen, Steckbrief/
index-Drift, Doppel-Definition, Element-Sackgassen/
-Zyklen) **blockiert die Auswahl** — der Agent meldet
die Befunde und bittet um Bereinigung des Templates,
bevor er fortfährt. Warnungen (Drift) laufen als
Info-Zeile mit.

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

**Commit-Sprache:** Auswahlmenü (siehe §6.2):

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
  und im Erledigt-Block gemeldet (Basis: z.B.
  Facts, Knotentypen, Fassaden, InterneMechanik;
  Beispiel Prozess: „Prozess-Merge SP-1:
  Anforderungen, Fehlermeldungen aktiviert").
- **optional-Fassaden** werden per Ja/Nein-Frage
  vorgelegt, Voreinstellung nach der Empfehlung aus
  `Wiki.md` §3a bzw. Steckbrief. Beispielformulierung
  (der Agent darf im Anwender-Jargon variieren; der
  Kern bleibt: Zweck nennen, Empfehlung nennen,
  Ja/Nein-Frage stellen):

  > „Der Prozess bringt die Fassade `Contract-Index`
  > mit — sie ist optional. Zweck: koordiniert
  > Contracts über mehrere Komponenten. Empfehlung:
  > aktivieren, wenn du ein Multi-Komponenten-Setup
  > planst. Aktivieren? [ja/nein, empfohlen: ja]"

Der Agent **wartet auf User-Antwort**, bevor er die
Fassaden-Konfiguration umsetzt.

**Umsetzung des Auswahl-Ergebnisses:**

- **Aktivierte Fassaden:** `active: true` im
  Frontmatter; danach **Bootstrap-Abarbeitung** —
  der Agent liest die zugehörige Bootstrap-Datei
  aus der Template-Quelle
  (`_template/referenzprozesse/<P>/bootstrap/<Fassade>.md`,
  DEC-217, DEC-223) und arbeitet sie ab (insbesondere die
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
  beiden Modi, DEC-223).

Anschließend vermerkt der Agent aktive und
deaktivierte Fassaden in `wiki/Fassaden.md` (inkl.
aktive Prozesse und abgelöste Ausprägungen — deren
Kontext im `internal-rule`-Knoten
[[Aktivierter-Prozess]]) und überträgt die
Konfigurations-Übersicht in seine Instruktionsdatei
(§8.3).

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
   Herkunft Repository/Konzept).
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
Langform gilt derselbe Dialog, sobald der User sie
aktiviert.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzformen: MasterPrompt §5.3 (Phase A0,
  Phase D)
- Fahrplan-Muster für Turn 0: [[Fahrplan-Vorlage]]
- Merge-Mechanik: Wiki.md §11.3; Fassaden-Katalog:
  Wiki.md §3a
