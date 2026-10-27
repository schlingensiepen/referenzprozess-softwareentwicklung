---
type: internal-rule
---

# Einfrieren und Ablösen

Mechanismus, mit dem Register-Elemente eingefroren,
abgelöst und zu Ständen zusammengeführt werden. Dieser
Knoten beschreibt den Mechanismus einmal für alle
Register; welche Typen es gibt, welche Klasse und
welchen Freeze-Zeitpunkt sie tragen, steht je Typ im
[[Katalog]] (Katalog-Einträge, lint-lesbare Zeilen);
welche Glieder in welcher Reihenfolge freigegeben
werden, steht in [[Kettenpruefung]]. Lesen vor der
Bildung eines Stands, vor jeder Ablösung und beim
Anlegen eines Register-Elements.

## Zweck

**Kernsatz:** Ein Stand wird nur aus Eingefrorenem
gebildet. Elemente sind ab ihrem Freeze-Zeitpunkt
eingefroren und werden nur vollständig unter neuer ID
abgelöst — ausdrücklich auch Entscheidungen (DEC). Was
nicht von selbst eingefroren ist (nicht abgenommene
Elemente, lebende Quellen), wird für den Stand kopiert
oder vom Stand als nicht berücksichtigt ausgewiesen
(§Ableitungsprüfung, §Kopien).

**Phasen ordnen Freigaben, nicht Arbeit.** Ein Element
jedes Registers darf jederzeit entstehen und
angenommen werden; geordnet ist allein die Freigabe
der Stände ([[Kettenpruefung]]).

## Klassen

Die Klasse eines Typs steht in seinem Katalog-Eintrag;
welche Typ-Abschnitte eine Klassen-Zeile tragen, sagt
die Grammatik im [[Katalog]] (Klassen-Zeile) — lesen,
wenn ein Typ angelegt wird. Dieser Abschnitt nennt
Kriterium und Bedeutung; die Liste nennt Beispiele.
Das Kriterium ist der Freeze, nicht die Bauform:

- **Element** — ablösbar und geht in Stände ein (z.B.
  DEC, REQ, FUNC, ARC, SPEC, CON, TEST, DEPL, BUG, NEED,
  SCEN, IDEA, Marken-Eintrag).
- **Nachweis** — wird nie abgelöst, hat keinen eigenen
  Stand; es werden nur Vermerke angehängt (z.B. REP,
  REC, TRES, MSG, `document`, selbsttragende
  Ableitungen).
- **außerhalb** — lebend, ohne Freeze-Zeile, im Stand
  kopiert (Glossar, Rollen, Konzepte mit
  `concept`-Knoten, Mission kurz/lang, Entitäten wie
  Komponenten, Zielumgebungen, Personen und Mitglieder,
  Quellen, Verweise, Ereignisse und Fristen; die
  Mechanik einschließlich der Katalog-Einträge).

Verlangt eine Entität eine Wahl, wird diese als DEC
gebucht; die Entität hält nur die Fakten. Weitere
Klassen gibt es nicht. Eine selbsttragende Ableitung
ist ein Nachweis; ihr Dokumenttyp-Eintrag trägt
dennoch keine Klasse, weil er den Dokumenttyp
beschreibt, nicht ein Element.

## Freeze und Ausnahmen

- **Freeze-Zeitpunkt** ist eine eigene Zeile
  `Freeze ab:` im Katalog-Eintrag mit den Werten
  `Anlage` | `angenommen` | `Abschluss`. Welche Klasse
  die Zeile trägt, sagt die Grammatik im [[Katalog]];
  welchen Wert ein Typ trägt, sagt seine Zeile. Die
  Regel dahinter: Elemente frieren mit der Annahme ein
  (`angenommen`); Meldungen, deren Kern ab der Meldung
  feststeht, mit der Anlage (BUG `Anlage`); der
  Marken-Eintrag mit dem Abschluss der Marke
  (`Abschluss`); Nachweise immer ab Anlage.
- **Freeze betrifft den Inhalt, nicht die
  Status-Achse:** ein eingefrorenes Element darf weiter
  seinen Status wechseln (z.B. `in-umsetzung` →
  `umgesetzt` → `abgeschlossen`), erhält
  Ablösungsfelder (§Ablösung) und angehängte Vermerke.
  Die Status-Achse der Ketten-Register beschreibt mit
  SP-1 der Mechanik-Knoten `Register-Lebenszyklus`.
- **Vermerke** werden angehängt, nicht eingearbeitet.
  Was ein Vermerk darf und wann statt dessen eine neue
  DEC entsteht (Ablösung oder `extends:`):
  Vermerk-Praxis in der `## Meta` von [[Entscheidungen]]
  — lesen, bevor ein Vermerk angehängt wird.
- Ausgenommen vom Freeze bleiben Tippfehler- und
  tote-Verweis-Korrekturen, der YAML-Header (Status,
  Ablösungsfelder — nicht `zielmarke:` und nicht das
  Anlage-Datum `datum:`, beide frieren mit dem Element
  ein, [[Zielmarken]] §Meta; ein vergessenes
  `zielmarke:` heilt nach der Annahme ein angehängter
  Vermerk „Zielmarke <M> (nachgetragen)“, den der Lint
  wie das Feld liest — das Feld selbst bleibt leer,
  [[Zielmarken]] §Meta „Heilweg“; an einem BUG darf
  `fix_requirement:` nach der Anlage ergänzt werden, wie
  die Ablösungsfelder — sobald eine Anforderung
  angelegt ist, die ihn behebt, SP-1
  `Katalog-Fehlermeldungen`; eine Fix-Anforderung auf
  einen Deploy hat keine solche Ausnahme — den
  freigegebenen weiteren Deploy-Stand nennt sie als
  angehängten Vermerk, nicht im Feld Verweise, SP-1
  `Anforderungen.md` „Fehlerbehebungen“),
  der sichtbare Ablöse-Vermerk nach
  dem Titel (§Ablösung) und die
  `## Vermerke`-Sektion (append-only; dort auch der
  Vermerk, der die Marke einer Bestands-Ablösung nennt,
  §Ablösung). Alles andere
  ist ein neues Element — nur so bleibt datierbar, was
  wann galt.

## Ablösung

- Eine Ablösung ersetzt **vollständig**: der Nachfolger
  beantwortet die Frage komplett neu, auch die
  unverändert bleibenden Teile. „Teilweise überholt“
  oder „gilt weiter außer Absatz X“ ist unzulässig.
- `supersedes:` und `superseded_by:` sind **Listen und
  beidseitig Pflicht** (ein Nachfolger kann mehrere
  Vorgänger zusammenführen, ein Vorgänger in mehrere
  Nachfolger zerfallen). Sie werden sofort gesetzt.
- **Ablösung wirkt ab der Marke des Nachfolgers**
  (dieser Punkt ist der führende Ort der Regel):
  Löst ein Element B mit `zielmarke: M` ein Element A
  ab, gilt A für alle Marken vor M weiter und B ab M.
  „Vor M“ und „ab M“ folgen der Vormarken-Kette der
  Abfolge: eine Sackgasse ist keine Vormarke der
  zurückgestellten Marke, eine Ablösung mit der
  `zielmarke:` einer Sackgasse gilt nur dort, und über
  die Sackgassen-Grenze wird nicht abgelöst, sondern
  überlagert (unten). Die Marke des Nachfolgers steht
  immer im Feld ([[Zielmarken]] §Meta, Pflichtfeld
  `zielmarke:`); gelesen wird der Wert, nicht die
  laufende Marke zum Prüfzeitpunkt. Ein Nachfolger ohne
  Feld aus dem Bestand wirkt wie bisher ab seiner
  Annahme; wie der Lint ihn wertet: §Stand,
  Marken-Regel; bei einer vorgezogenen Zwischenmarke:
  unten, Bestands-Nachfolger bei einer Zwischenmarke.
  `supersedes:`/`superseded_by:` werden
  sofort gesetzt. Der Status von A wechselt auf
  `abgelöst`, sobald die Marke von B `in-progress` ist:
  ist sie es bei der Ablösung schon — B gilt ab der
  laufenden Marke oder einer ihrer Vormarken —, setzt
  der Agent den Status von A im selben Zug wie die
  Ablösungsfelder; gilt B erst ab einer späteren Marke
  (auch ab der zurückgestellten Marke während einer
  Zwischenmarke), erledigt den Wechsel die
  Marken-Wechsel-Prozedur mit dem Wechsel auf diese
  Marke ([[Zielmarken]]). Der Status `abgelöst` ist
  damit eine Anzeige der Ablösung ab der Marke des
  Nachfolgers (der Marke, die beim Setzen lief) und
  ihrer Folge-Marken, kein Filter für Stände:
  ob A in einen Stand zu einer Marke M darf,
  entscheidet allein, ob ein Nachfolger für M gilt
  (§Stand, Marken-Regel) — ein Stand zu einer früheren
  Marke oder zu einer vorgezogenen Zwischenmarke führt
  A trotz des Status weiter.
- `abgelöst` ist ein Status-Wert; der Verweis steht
  nur im Feldpaar `supersedes:`/`superseded_by:`.
  Abgelöste Elemente tragen einen sichtbaren
  Ablöse-Vermerk direkt nach dem Titel, für jedes
  Element in derselben Form:
  `> **⚠ Abgelöst durch [[<Dateiname des Nachfolgers>|<ID>]]** (YYYY-MM-DD)`
  — Ziel des Wikilinks ist der Detail-Knoten des
  Nachfolgers (Dateiname ohne Endung, z.B.
  `[[REQ-002 Kurzsatz|REQ-002]]`), angezeigt wird die
  ID; so löst der Lint den Link auf. Hat der Nachfolger
  keinen Detail-Knoten, steht die ID ohne Wikilink.
  Dieser Abschnitt ist der führende Ort der Form.
- **Bestands-Nachfolger bei einer Zwischenmarke**
  (dieser Punkt ist der führende Ort der Regel und des
  Vermerk-Formats): Ist ein Element E durch einen
  Bestands-Nachfolger N ohne `zielmarke:` abgelöst
  (Bestand nach dem Upgrade von 1.x, [[Zielmarken]]
  §Meta „Bestand“) und wird danach eine Zwischenmarke Z
  vorgezogen, die laufende Marke B zurückgestellt
  ([[Zielmarken]] §Meta „Zwischenmarke“), wertet der
  Lint N ab der laufenden Marke (§Stand) — jetzt Z —
  und kann nicht wissen, ob die Ablösung zu Z gehört
  (dann gilt N für Z) oder erst zu B (dann gilt für Z
  noch E). Solange die `in-progress`-Marke eine
  Zwischenmarke ist, meldet er zu jedem
  Bestands-Nachfolger ohne Feld mit `supersedes:` den
  Hinweis `ABLOESUNG-BESTAND` („Marke der Ablösung
  unbekannt“) mit Element, Nachfolger und der laufenden
  Zwischenmarke — Hinweis, kein Fehler: der Bestand
  sperrt keine Arbeit. **Rückfrage:** Der Agent legt die
  gemeldeten Ablösungen dem Anwender vor und fragt, zu
  welcher Marke jede gehört — **bei der ersten Meldung,
  spätestens bevor er einen Stand zu Z bildet**
  (§Ableitungsprüfung); Frage-Block (MasterPrompt
  §5.4), bei vielen Punkten Briefing-Modus.
  **Vermerk:** Die Antwort steht als Vermerk am
  Nachfolger N, append-only (§Freeze und Ausnahmen):
  `- **Vermerk <Datum>:** Ablösung von <E> gilt ab Marke <M> (Anwender <Datum>)`
  — E das abgelöste Element, M die Marke des Anwenders.
  Der Lint liest ihn: mit Vermerk wirkt die Ablösung ab
  M entlang der Vormarken-Kette, wie mit `zielmarke: M`
  am Nachfolger (Marken-Regel, Überholt-Regel,
  Ablösungs-Drift, doppelte Nachfolger — dort zählt N
  dann mit) — nennt M die zurückgestellte Marke B, gilt
  E für Z weiter —, und der Hinweis entfällt. Ohne
  Vermerk bleibt die Näherung „ab der laufenden Marke“.
  Der Vermerk ist kein Nachtragen von `zielmarke:` (das
  Feld bleibt leer) und ändert N nicht; er gilt für
  alle späteren Zwischenmarken mit. Der Fall betrifft
  nur Altbestand und läuft mit ihm aus: neue Nachfolger
  tragen `zielmarke:`.
- Nach jeder Ablösung ruft der Agent im selben Zug den
  Lint auf und meldet überholte Stände
  (§Überholt-Regel).
- **Doppelte Nachfolger:** Ein Element hat für eine
  Marke genau einen gültigen Nachfolger. Zwei
  Nachfolger aus verschiedenen Marken (`zielmarke:`
  verschieden), die beide für dieselbe Marke gelten,
  entstehen, wenn eine Zwischenmarke, die Vorgänger
  ist, ein Element ablöst, das die zurückgestellte Marke
  schon durch einen eigenen Nachfolger abgelöst hat —
  oder wenn der Nachfolger-DEPL eines Nachtrags ein DEPL
  ablöst, das die laufende Folge-Marke schon durch ein
  eigenes DEPL abgelöst hat ([[Zielmarken]] §Meta,
  Nachtrag); in beiden Fällen gilt dasselbe Verfahren:
  der Lint meldet das als Fehler `NACHFOLGER-DOPPELT`,
  bis der Anwender gewählt hat — der Stand der Marke,
  die schon abgelöst hat, der andere Nachfolger oder die
  Zusammenführung —, gebucht als gewöhnliche Ablösung
  (Vorlage, Wahl und Buchung: [[Zielmarken]] §Meta
  „Zwischenmarke“, doppelte Nachfolger, und „Nachtrag“).
  **Abgrenzung zur Teilung:** Die
  Teilung eines Elements in mehrere Nachfolger derselben
  Marke (ein Vorgänger zerfällt in mehrere Nachfolger,
  oben) ist kein Doppel-Nachfolger — ihre Nachfolger
  tragen dieselbe `zielmarke:`; ebenso wenig zwei
  Nachfolger, die für verschiedene Marken gelten (etwa
  einer in einer Sackgasse, einer in der
  zurückgestellten Marke).
- In einer Zwischenmarke, die Sackgasse ist, wird ein
  Element, das außerhalb der Sackgasse gilt (mit der
  `zielmarke:` einer anderen Marke oder als
  Bestands-Element ohne Feld), **nicht abgelöst,
  sondern überlagert**: ein neues Element mit der
  `zielmarke:` der Sackgasse und `ueberlagert:
  [<ID>]`; das überlagerte Element bleibt unverändert
  `aktiv`, für die Sackgasse gilt das überlagernde, für
  alle anderen Marken das überlagerte (führender Ort:
  [[Zielmarken]] §Meta „Zwischenmarke“). „In der
  Sackgasse“ heißt mit ihrer `zielmarke:`; eine
  Ablösung während der Sackgasse durch ein Element mit
  der `zielmarke:` der zurückgestellten oder einer
  späteren Marke ist Arbeit an dieser Marke oder
  Übernahme und wirkt ab ihr (oben). Eine Ablösung
  über die Sackgassen-Grenze meldet der Lint als
  Hinweis.
- IDs werden nie wiederverwendet; Lücken bleiben. Eine
  vergebene ID bleibt beim Element, auch wenn es
  verworfen wurde; zitierte IDs werden nie still
  umgedeutet. Umbenennung oder Präfixwechsel mit
  gleichem Inhalt ist keine Ablösung, sondern ein
  `alias:`.
  `vorgaenger:` ist ein Vorgänger ohne Ablösung
  (Definition im [[Katalog]]).

## Eintrittsregel

- Ein Element kommt erst mit Anwender-OK ins Register,
  direkt als `angenommen`. **Entwürfe liegen nie unter
  `wiki/`;** der Ort ist frei (Session, Scratch).
- Ausnahme sind Register mit **Sammelzustand** (die
  Sammelzustand-Zeile im [[Katalog]] sagt `ja`; z.B.
  REQ, BUG, IDEA): dort darf ein Eintrag `offen` oder
  `aufgeschoben` sein. Register-Wächter und
  Marken-Trigger arbeiten nur auf diesen
  Sammel-Registern; `trigger` ist dort Kann-Feld (nur
  bei `aufgeschoben`). Register ohne Sammelzustand
  sind Eintritts-Register: Einträge beginnen bei
  `angenommen`, kein `trigger`.
- **Eine nicht getroffene Entscheidung ist keine DEC,
  sondern eine IDEA.** DEC bleibt Eintritts-Register
  ohne `offen`/`aufgeschoben`. Eine zurückgestellte
  Entscheidung — auch ein zurückgestellter Teil einer
  angenommenen DEC — wird ein IDEA-Eintrag mit
  `Auslöser:` (Datum oder Marke) in [[Ideen]].
- Bei Delegation an ein Komponenten-Repo gibt die
  dortige zuständige Stelle frei; eine Dauerfreigabe in
  [[InterneMechanik]] ist das OK.
- Das Glossar erfüllt die Eintrittsregel über den
  Review-Prozess (Einträge nur nach Freigabe aus
  [[Glossar Review]]).

## Stand

- Der **Dreiklang** je Register: Fassade → Element
  (Freeze, Ablösung, `zielmarke:`) → **Stand je
  Dokumenttyp**. Ein Stand ist ein wiki-verweisendes
  abgeleitetes Dokument in `output/` und Träger der
  Freigabe; Glied der Kette ist der Dokumenttyp, nicht
  das Register. Register und Dokumenttypen stehen n:m
  (ein Stand filtert mehrere Register, ein Register
  speist mehrere Stände).
- Stände sind immer gleich gebaut, mit Merkmal
  **pflicht** (der Prozess braucht sie; Zweck = Phase)
  oder **optional** (der Anwender beauftragt; freier
  Zweck; Angebots-Auslöser). Was ein Dokumenttyp
  filtert, steht in seinem Katalog-Eintrag.
- **Dateiname:** ein Stand folgt dem Namensschema für
  `output/` (MasterPrompt §3.1 mit der Weglassregel
  §3.2); Dokumentname ist der Name des Dokumenttyps
  (`Katalog-<Name>.md`, z.B. `Anforderungen-Stand`).
  Gibt es innerhalb einer Marke mehrere Stände eines
  Dokumenttyps (z.B. Deploy-Stand je Umgebung,
  Übergabe je Komponente), steht ihr Gegenstand — der
  Name der Umgebung bzw. der Komponente — als
  `<Gegenstand>` im Namen (`<Datum> - Deploy-Stand -
  Produktion_01_ABC.md`, `<Datum> - Uebergabe -
  Terminal_01_ABC.md`); so hat jeder dieser Stände
  seine eigene Ketten-ID. Derselbe Gegenstand ist
  dieselbe Ketten-ID: ein weiterer Deploy-Stand
  derselben Umgebung zu derselben Marke ist eine neue
  Version (`VV` zählt hoch), auch nach dem
  Marken-Abschluss als Nachtrag ([[Zielmarken]] §Meta,
  Nachtrag).
  Der Teil vor `_VV_TLA` ist die Ketten-ID und bleibt
  über alle Versionen gleich, auch das Datum
  (MasterPrompt §3.8); ein Neu-Stand zählt nur `VV`
  hoch.
- **Stand je Marke:** Ein Stand gehört zu genau einer
  Marke. Für eine neue Marke entsteht ein neues
  Dokument mit neuer Ketten-ID (eigenes Anfangsdatum);
  neue Versionen derselben Ketten-ID (`VV`) gibt es nur
  innerhalb einer Marke — als Neu-Stand nach der
  Überholt-Regel, ohne Prozess beim Abschluss-Stand
  nach einer Tag-Korrektur (vor wie nach seiner
  Freigabe, [[Kettenpruefung]] §Kette) und auf
  Anwender-Entscheidung nach einer Überlagerung, die
  einen freigegebenen Stand der Sackgasse trifft
  ([[Zielmarken]] §Meta „Zwischenmarke“); versionierte
  Dokumente in `output/` werden nie überschrieben, auch
  nicht vor ihrer Freigabe ([[Versionsketten]]). Sonst
  hielten Lint und
  Register-Wächter („jüngste Version je Ketten-ID“)
  den Stand der Vormarke für verdrängt, obwohl er für
  seine Marke gültig bleibt. Gilt ein Stand der
  Vormarke für die Folge-Marke weiter, wird er
  übernommen, nicht neu gebildet; ebenso der Tag,
  wenn das Produkt seit ihm unverändert ist
  ([[Kettenpruefung]] §Kette, Übernahme aus der
  Vormarke; Übernahme des Tags und der Lieferung).
- **Herkunftszeile im Kopf jedes Stands:** Marke,
  Datum, Zweck und die Vorgänger-Stände mit Version. Die
  verwiesenen Elemente stehen im Text, als ID (ein
  Wikilink ist zulässig), nicht im Volltext: der Stand
  ist wiki-verweisend, eingefrorene Elemente werden
  verwiesen, nicht kopiert (§Kopien). **Jede ID im Text
  eines Stands ist ein Verweis** — so liest sie der
  Lint. Ein Stand nennt deshalb keine ID, die für seine
  Marke abgelöst ist (Marken-Regel unten), auch nicht
  in einem Erklärsatz; warum ein Neu-Stand
  entstand, steht in seiner Freigabe-DEC. Die
  Herkunftszeile steht als Frontmatter-Felder neben
  `type: <kennung>` (dieser Abschnitt ist der führende
  Ort der Felder; die Pflichtfeld-Zeile des
  Dokumenttyp-Eintrags im [[Katalog]] nennt sie nur):
  - `marke` — die Marke, zu der der Stand gebildet
    ist; in Anführungszeichen (`marke: "1.10"`, sonst
    liest YAML die Zahl 1.1), ebenso jeder Eintrag mit
    Leerzeichen;
  - `datum` — der Tag, an dem der Stand gebildet
    wurde (`YYYY-MM-DD`); das „Datum des Stands“ für
    die Leseregel (§Leseregel) und der Stichtag der
    Kopien (§Kopien). Bei Version 01 stimmt es mit dem
    Datum der Ketten-ID überein; ein Neu-Stand trägt
    den Tag seiner Bildung, während das Datum im
    Dateinamen bleibt (MasterPrompt §3.8);
  - `zweck` — der Freigabe-Zweck, bei Pflicht-Ständen
    die Phase (z.B. „für P4 Beschreiben der
    Funktion“), bei optionalen Ständen der Zweck, den
    der Anwender nennt;
  - `herkunft` — Liste der Bezüge, je mit Version:
    die Vorgänger-Stände — das sind alle freigegebenen
    Pflicht-Stände früherer Phasen derselben Marke,
    gegen die die Kettenprüfung prüft
    ([[Kettenpruefung]] §Regel), nicht nur der direkte,
    einschließlich der aus der Vormarke übernommenen
    Stände (sie stehen mit ihrer eigenen Ketten-ID und
    Version, [[Kettenpruefung]] §Kette) —, und, wo die
    Kette es verlangt, der Tag der
    Implementierung und der Testbericht (TRES); leer,
    wenn der Stand keinen Vorgänger hat.

  **Eintragsformat von `herkunft`:** je Bezug ein
  Listen-Eintrag — ein Stand als Dateiname mit
  `_VV_TLA` (z.B. `2026-03-02 - Testplan_02_ABC.md`),
  ein Tag als
  Tag-Name (z.B. `v1.0.0`; ein aus der Vormarke
  übernommener Tag mit seinem alten Namen,
  [[Kettenpruefung]] §Kette; liegen Werkstatt und Produkt
  in zwei Repos, qualifiziert als
  `<produkt-repo>/<tag>`; beim Koordinator die
  Lieferungs-Tags als `<repo>/<tag>`, bei der
  Lieferung eines Zwischen-Koordinators ohne eigene
  Bauteile die Tags seiner Unter-Komponenten, deren Lage in
  seinem §Komponenten steht — mit eigenen Bauteilen
  ist sein Tag die Lieferung ([[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art) — ein bloßer
  Tag-Name ist über Repo-Grenzen nicht eindeutig),
  ein Testbericht als ID (`TRES-NNN`). Liegt der Bezug
  in einem anderen Repo des Verbunds (z.B. der
  Übergabe-Stand des Koordinators bei einer
  Komponente), steht der Repo-Name als Qualifizierer
  davor (`<koordinator>/<Dateiname>`), wie bei jedem
  Verweis über Repo-Grenzen. Welche Bezüge
  über die Vorgänger-Stände hinaus ein Stand trägt,
  nennt sein Dokumenttyp-Eintrag. Eine frühere Version
  desselben Stands steht nicht in `herkunft`: sie ist
  kein Vorgänger-Stand, sondern wird über die
  Freigabe-DEC abgelöst (§Überholt-Regel); der Lint
  meldet sie als Fehler.

  `herkunft` ist nicht `vorgaenger:` (Vorgänger eines
  Elements ohne Ablösung, Definition im [[Katalog]]).
- **Herkunftszeile einer selbsttragenden Ableitung:**
  `marke` (geerbt aus der Herkunftszeile des
  Quell-Stands, ab Anlage fest) und `quell_stand` (der
  Quell-Stand mit Version). Braucht ein Dokumenttyp
  ein weiteres Kopf-Feld (z.B. `zielgruppe` an der
  Durchführungs-Instanz), nennt es sein Katalog-Eintrag.
- **Herkunftszeile des Testberichts (TRES):** der
  Testbericht ist ein Nachweis, kein Stand; er trägt
  `marke` (geerbt aus dem Testplan-Stand) und
  `herkunft` mit dem Testplan-Stand, dem Tag der
  Implementierung (beim Koordinator den Lieferungs-Tags
  der geprüften Komponenten) und der Setup-Kopie, je
  mit Version.
- **Stände sind Voll-Stände:** ein Stand zu Marke M
  beschreibt das ganze Produkt zu M, einschließlich
  weiter gültiger Elemente früherer Marken. Den Zuwachs
  zeigen die optionalen Release-Notes.
- **Marken-Regel:** Ein Element darf in einen Stand zu
  Marke M, wenn es **für M nicht abgelöst** ist — kein
  Nachfolger gilt für M (§Ablösung); der Status
  `abgelöst` ist dafür kein Filter: ein Element mit
  diesem Status gehört in einen Stand zu M, solange
  sein Nachfolger für M nicht gilt, etwa im Stand einer
  vorgezogenen Zwischenmarke, wenn der Nachfolger die
  `zielmarke:` der zurückgestellten Marke trägt; ein
  Stand zu M sieht die Elemente so, wie sie für M
  gelten, und löst sie nicht über die Ablösekette zur
  jüngsten Version auf (§Leseregel) —,
  nicht verworfen ist, für M nicht
  überlagert ist (in einer Sackgasse gilt statt des
  überlagerten das überlagernde Element, §Ablösung) und
  seine `zielmarke:` M oder eine frühere Marke nennt —
  frühere Marke nach der Vormarken-Kette der Abfolge;
  eine Sackgasse ist nur für sich selbst eine Marke,
  für die ihre Elemente gelten ([[Zielmarken]] §Meta).
  Ein Bestands-Element ohne Feld ([[Zielmarken]] §Meta,
  Pflichtfeld `zielmarke:`) gilt ab seiner Annahme;
  weil der Lint die Marke der Annahme nicht lesen kann,
  wertet er es wie bisher als gültig für jede Marke,
  und einen Bestands-Nachfolger ohne Feld ab der
  laufenden (`in-progress`) Marke — Bestandsschutz, der
  mit dem Bestand ausläuft. Läuft eine Zwischenmarke,
  ist die laufende Marke die Zwischenmarke, die Ablösung
  kann aber zur zurückgestellten Marke gehören: der Lint
  meldet einen Bestands-Nachfolger ohne Feld dann als
  Hinweis `ABLOESUNG-BESTAND`, der Agent fragt den
  Anwender, und die Antwort steht als Vermerk „Ablösung
  von <E> gilt ab Marke <M>“ am Nachfolger — mit dem
  Vermerk gilt er ab M wie mit `zielmarke: M`, auch für
  die Überholt-Regel (§Ablösung, Bestands-Nachfolger
  bei einer Zwischenmarke — der führende Ort). Der Lint meldet den Fehler
  `MARKEN-REGEL` bei einer späteren Marke oder der
  Marke einer Sackgasse, die nicht M ist, bei einer
  Ablösung, deren Nachfolger für die Marke des Stands
  gilt (§Ablösung), und bei einem Element, das für M
  überlagert ist. Ausnahme: Ist der Stand schon
  freigegeben oder aus der Vormarke übernommen und das
  Element erst danach für M überlagert worden, meldet
  er den Hinweis `UEBERLAGERUNG`, und der Agent fragt
  den Anwender ([[Zielmarken]] §Meta „Zwischenmarke“,
  Überlagerung nach einer Freigabe).
- Nach außen entsteht aus einem Stand bei Bedarf eine
  **selbsttragende Ableitung** (z.B. Testplan →
  Durchführungs-Instanz, Deploy-Stand →
  Betriebs-Anleitung, Abschluss-Stand → Release-Notes);
  Grade und Link-Regel: MasterPrompt §9.6.

## Ableitungsprüfung

Vor der Bildung eines Stands filtert der Agent nach
Marke und Status — nach der Marken-Regel (§Stand):
nicht verworfen, für die Marke des Stands nicht
abgelöst (der Status `abgelöst` allein schließt nicht
aus), für sie nicht überlagert, `zielmarke:` diese
oder eine frühere Marke — und legt vor, was dazugehört, aber
nicht abgenommen ist, und was der Dokumenttyp-Eintrag
zusätzlich vorzulegen verlangt (z.B. beim
Technologie-Stand jede DEC ohne `decision_type:`; mit
den Möglichkeiten, die der Eintrag dafür nennt) — je
nicht abgenommenem Punkt:

- **annehmen** (Eintrittsregel, dann eingefroren),
- **weglassen** (im Kopf des Stands ausgewiesen) oder
- **trotzdem alles** (Momentaufnahme, nicht
  freigabefähig).

Form im Kopf des Stands: eine Zeile direkt unter dem
Titel, `Nicht berücksichtigt (offen): <ID>, …`; eine
Momentaufnahme trägt dort die Zeile
`Momentaufnahme (trotzdem alles), nicht freigabefähig`.

Festgehalten wird die Wahl im Register (annehmen) bzw.
im Stand (weglassen, trotzdem alles). Ein
weggelassener Punkt wird nur ausgewiesen, nicht
kopiert; kopiert wird ein nicht abgenommener Punkt nur
bei „trotzdem alles“ (§Kopien). Bei vielen Punkten
Übersicht und Briefing-Modus ([[Fahrplan-Vorlage]]); eine Sammel-Annahme nur auf
ausdrücklichen Zuruf. Die Prüfung meldet auch
Begriffe, auf die der Stand verweist, die aber erst in
[[Glossar Review]] stehen — mit denselben drei
Möglichkeiten.

## Kopien

- Das Stand-Dokument liegt direkt in `output/`; Kopien
  der nicht eingefrorenen Knoten **und der lebenden
  Quellen** (Glossar, Rollen, Architektur-Abschnitte,
  Lage) liegen in `output/<Ketten-ID>_VV_TLA/`, das
  Dokument verweist auf die Kopien. Der Ordnername ist
  der Dateiname des Stands ohne Endung — die Ketten-ID
  (Datum, Dokumentname, ggf. Gegenstand; MasterPrompt
  §3.1) mit Version; so haben zwei Stände eines
  Dokumenttyps (z.B. Deploy-Stand je Umgebung) eigene
  Ordner.
- **Format:** je kopiertem Knoten oder
  Fassaden-Eintrag eine Datei, benannt wie die Quelle;
  Frontmatter `kopie_von: <Knoten>`, bei einem Eintrag
  ohne Detail-Knoten `kopie_von: <Fassade>#<Eintrag>`;
  Inhalt unverändert; Stichtag der Kopie ist das Datum
  des Stands (Feld `datum`, §Stand).
- Kopien liegen außerhalb
  `wiki/` (keine Register-Duplikate). Sie sind
  unveränderlich wie ein Versandstand und anerkannte
  Redundanz mit eigenem Mechanismus (eingefroren,
  `kopie_von:`, Leseregel).
- Lebende Quellen werden je Bauform kopiert:
  referenzierte `concept`-Knoten, referenzierte
  Glossar-Einträge, das Mission-Dokument.
  **Referenziert** ist eine lebende Quelle, die der
  Stand oder ein verwiesenes Element per Wikilink oder
  Feld (z.B. `rollen:`) nennt.
- **Eingefrorene Elemente werden verwiesen, nicht
  kopiert** — auch über Repo-Grenzen.

## Leseregel

Wer einen Stand liest, folgt Verweisen auf den
**verwiesenen Knoten**, nicht zum Nachfolger —
„abgelöst durch“ ist Warnung, keine Umleitung; sie
gilt unabhängig vom Datum. Vermerke gelten bis zum
Datum des Stands (Feld `datum` im Kopf, §Stand), den
Tag des Stands eingeschlossen.
Es gibt
keinen git-Pin: die Ablösung ist der Mechanismus ohne
git.

## Überholt-Regel

Ein Stand ist überholt, wenn ein verwiesenes Element
abgelöst ist (trägt `superseded_by:`) **und der
Nachfolger für die Marke des Stands gilt** (Lesart der
Marken-Regel: ein Nachfolger mit `zielmarke: N` gilt
ab N entlang der Vormarken-Kette, ein N einer Sackgasse
nur für N; einen Bestands-Nachfolger ohne Feld wertet
der Lint ab der laufenden Marke — §Ablösung, §Stand),
oder wenn ein Vorgänger-Stand überholt
ist. Eine Ablösung, deren Nachfolger erst ab einer
späteren Marke gilt, überholt den Stand nicht; eine
Überlagerung in einer Sackgasse ist kein
Überholt-Grund (§Stand, Marken-Regel). **Tag in
`herkunft`:** Ein Tag-Name in `herkunft` (Testplan-Stand,
Testbericht, Deploy-Stand) gilt als Verweis auf seine
Freigabe; wird sie durch eine Tag-Korrektur abgelöst
(`Vorgehen.md` §4 „Freigabe per Tag“) und gilt die
ablösende Freigabe für die Marke des Stands, ist der
Stand überholt — der Tag vertritt das Glied P9
([[Kettenpruefung]] §Fehlende und vertretene Glieder).
Nach dem Marken-Wechsel bleibt die alte Tag-Freigabe
stehen (Nachtrag „Tag korrigiert“, [[Zielmarken]]
§Meta); ein Stand mit dem alten Tag-Namen ist dadurch
nicht überholt.
Der Lint liest das nicht (er kennt die Freigabe eines
Tags nicht als Element); der Agent prüft es bei der
Buchung der Korrektur und beim Marken-Wechsel.
**Ältere Version in `herkunft` nach dem Nachtrag:**
Nennt ein Stand einer abgeschlossenen Marke — der
Abschluss-Stand — in `herkunft` eine ältere Version
eines Deploy-Stands, zu der im Nachtrag eine jüngere
Version derselben Ketten-ID freigegeben ist (ein
weiterer Deploy-Stand derselben Umgebung, [[Zielmarken]]
§Meta, Nachtrag), ist er dadurch nicht überholt — auch
wenn ein Nachfolger-DEPL mit der Marke des Stands die
ältere Version für die Marke überholt: Die Antwort auf
die überholte ältere Version ist die jüngere Version
selbst, der Abschluss-Stand bleibt eingefroren und wird
nicht neu gebildet. Lint und Vollständigkeits-Scan lesen
Abschluss-Stand und Nachtrag zusammen; der Verweis liest
sich auf den Deploy-Stand der Umgebung, dessen jüngste
Version die im Nachtrag freigegebene ist — wie beim
Tag-Namen oben. Der Lint liest bei einem Stand einer
abgeschlossenen Marke einen Vorgänger in `herkunft`,
dessen Ketten-ID eine jüngere Version derselben Marke
hat, als diese jüngste Version. Vor dem Abschluss gilt
das nicht: Dort ist die neue Version der Neu-Stand mit
ablösender Freigabe, und ein Stand, der die überholte
ältere Version nennt, wird neu gebildet.
**Marken-Bezug bei der Übernahme:** Für die Übernahme
in eine Folge-Marke ([[Kettenpruefung]] §Kette) wird
gegen die Folge-Marke geprüft — ein Stand kann für
seine Marke gültig und für die Folge-Marke überholt
sein; dann wird er nicht übernommen, sondern für die
Folge-Marke neu gebildet (neues Dokument, neue
Ketten-ID, §Stand). **„Überholt“
wird abgeleitet, nicht gebucht:** der Lint berechnet
es, der Register-Wächter C5 meldet es laufend
(MasterPrompt §5.3), nicht erst beim Marken-Wechsel.
Die Antwort ist ein neuer Stand, dessen Freigabe-DEC
die alte per `supersedes:` ablöst (Neu-Ableitung;
innerhalb der Marke als neue Version `VV` derselben
Ketten-ID). Der Neu-Stand ist ein Stand wie jeder
andere: eigene
Ableitungsprüfung, eigene Kopien, bei einem
Pflicht-Stand eigene Kettenprüfung mit eigenem
`review-report` ([[Kettenpruefung]]) und eigene
Freigabe-DEC. Ändert sich in der Kette bis zum Tag
nichts, ist ein Nachtrag am Marken-Eintrag möglich
([[Zielmarken]]).

- **Lint:** Er beurteilt je Stand die jüngste Version
  (höchste `VV` derselben Ketten-ID), freigegeben oder
  nicht; für die Überholt-Berechnung liest er keine
  Freigabe (wofür er Freigabe-Einträge liest:
  [[Kettenpruefung]] §Lint-Anteil). Gilt der
  Nachfolger eines verwiesenen Elements für die Marke
  des Stands, meldet er dieselbe Lage zweimal: als
  Fehler `MARKEN-REGEL` (der Stand verweist auf ein
  Element, das für seine Marke nicht mehr gilt,
  §Stand) und als Hinweis `UEBERHOLT` (Meldung für
  C5). Beide verschwinden mit dem Neu-Stand; der alte
  Stand wird nicht geändert.
- **Kein Hinweis am alten Stand:** Er bleibt
  unverändert, und „überholt“ wird nirgends gebucht.
  Wer in `output/` liest, erkennt einen überholten
  Stand an seiner abgelösten Freigabe-DEC, an der
  höheren Version derselben Ketten-ID oder am Lint.

## Abgrenzungen

- **Version** ist der `_VV_TLA`-Dateistand
  ([[Versionsketten]]), **Stand** das abgeleitete
  Dokument; in der Freigabe-Formel (`Vorgehen.md` §4)
  ist x die Version. „Fassung“ wird nicht verwendet.
- **Versandstände** (Kopien in `outgoing/`) sind
  unveränderlich, aber keine Stände im Sinn dieses
  Knotens — sie tragen keine Freigabe.
- **Marken-Bezeichnung** („1.1“) ist weder Version
  noch Stand ([[Zielmarken]]).
- **eingefroren** (Inhalt wird nicht mehr geändert) ist
  nicht **abgeschlossen** (Status einer Zielmarke oder
  eines Vorgangs) und nicht **selbsttragend** (Grad
  eines abgeleiteten Dokuments, [[Glossar]]).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Typen, Klassen-Zeile, `Freeze ab:`, Dokumenttypen:
  [[Katalog]]
- Reihenfolge und Prüfung der Freigaben:
  [[Kettenpruefung]]
- Marken, Zeiger, Wechsel-Prozedur, Nachtrag:
  [[Zielmarken]]
- Freigabe-Buchung: [[Entscheidungen]] (Meta);
  zurückgestellte Entscheidungen: [[Ideen]]
- Versionen: [[Versionsketten]]; Grade und Link-Regel:
  MasterPrompt §9.6
- Frontmatter-Felder (`supersedes:`, `superseded_by:`,
  `alias:`, `kopie_von:`, `zielmarke:`): Wiki.md §4.1
