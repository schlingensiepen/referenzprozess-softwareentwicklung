---
type: requirement-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Anforderungen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `requirement-log` — Register aller
  Anforderungen des Projekts (setzt ein
  Entwicklungsvorhaben voraus). Singleton, ID-Präfix
  `REQ-NNN`. Die Fassade [[Fehlermeldungen]] setzt
  dieses Register voraus: die Behebung einer
  Fehlermeldung läuft hier als Fix-Anforderung (unten).
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei
  Anforderungs-Status liegt in dieser Fassade —
  Detail-Knoten (Typ `requirement`) spiegeln
  (Wiki.md §1.1a). Kanonisch an der Fassade ist auch
  die Sektions-Zuordnung (Funktional vs.
  Nicht-funktional); der Ablöseverweis steht kanonisch
  im Feldpaar `supersedes:`/`superseded_by:` der
  Elemente ([[Register-Lebenszyklus]]).
- **Gliederung:** `## Funktional`,
  `## Nicht-funktional` und `## Fehlerbehebungen`,
  alle chronologisch nach ID; die Sektion entspricht
  `requirement_type` (`functional` | `non-functional`
  | `fix`, [[Katalog-Anforderungen]]).
- **Lese-Klammer:** bis zur Bildung des
  Anforderungen-Stands ([[Katalog-Anforderungen-Stand]])
  ist **diese Fassade die Lese-Klammer** der Phase P3
  — sie listet jede Anforderung mit Link und Status,
  und der Agent benennt sie dem Anwender so; Ablauf bis
  zur Freigabe: [[Lebenslauf-eines-Stands]].
- **Fehlerbehebungen:** Eine Fehlermeldung (BUG,
  [[Fehlermeldungen]]) wird über eine
  **Fix-Anforderung** behoben — ein REQ mit
  `requirement_type: fix` in dieser Sektion; seine
  `zielmarke:` ist die Marke der Behebung (sie liegt
  nicht vor der Marke der Meldung — der Marke des
  Produkt-Stands, an dem der Fehler beobachtet wurde,
  [[Fehlermeldungen]] §Meta „Zielmarke“ —, ohne
  Ausnahme; sonst Lint-Fehler, soweit die Marken
  vergleichbar sind — eine Sackgasse ist nur für sich
  eine frühere Marke; eine Behebung in einer
  Zwischenmarke ist der Regelfall, wenn der BUG am Stand
  ihrer Vormarke beobachtet wurde, [[Zielmarken]] §Meta
  „Zwischenmarke“).
  **`behebt:` und `fix_requirement:`:** Jede
  Anforderung, die einen BUG behebt — die
  Fix-Anforderung wie die ablösende oder neue REQ
  (unten) —, nennt ihn in `behebt: [BUG-NNN]` (Liste),
  und der BUG nennt jede solche Anforderung in
  `fix_requirement: [REQ-NNN, …]` (Liste; ein einzelner
  Wert `fix_requirement: REQ-NNN` aus dem Bestand liest
  sich als Liste mit einem Eintrag). Beide Verweise
  gehören zusammen, an jeder Anforderung und für jeden
  Eintrag der Liste; der Lint meldet eine
  Fix-Anforderung ohne `behebt:` und eine fehlende
  Gegenseite — gleich welchen Typs die Anforderung
  trägt — als Hinweis. In der Regel nennt die Liste eine
  Anforderung; mehrere, wenn ein Workaround in einer
  Sackgasse und später ein echter Fix in der regulären
  Linie denselben BUG beheben ([[Zielmarken]] §Meta
  „Fehlerbehebung in der Zwischenmarke“).
  Die Fix-Anforderung läuft durch die Kette wie jede
  Anforderung — FUNC, SPEC und TEST decken sie, Stände
  filtern sie, die Kettenprüfung prüft sie
  ([[Kettenpruefung]]); ihre Begründung ist der BUG,
  `behebt:` tritt an die Stelle von `abgeleitet_von:`.
  **Behoben** ist ein BUG über die Anforderung seiner
  Linie: umgesetzt, wenn eine Anforderung in
  `fix_requirement:` umgesetzt ist, die für die Marke
  der Meldung gilt. Für einen BUG der regulären Linie
  ist das die Anforderung der regulären Linie, die für
  seine Marke und ihre Folge-Marken gilt — eine
  Anforderung in einer Sackgasse gilt nur dort
  ([[Zielmarken]] §Meta „Zwischenmarke“) und macht ihn
  allein nicht behoben (sie ist ein Workaround); die
  Status-Achse des BUG bleibt. Einen BUG mit der Marke
  einer Sackgasse behebt die Anforderung mit der Marke
  dieser Sackgasse — mit ihrer Umsetzung ist er behoben
  ([[Fehlermeldungen]] §Meta „Zielmarke“). Zeigt ein
  Fehler,
  dass eine Anforderung falsch war oder fehlte, ist das
  keine Fix-Anforderung, sondern eine Ablösung der
  Anforderung bzw. eine neue `functional`- oder
  `non-functional`-Anforderung
  ([[Einfrieren-und-Abloesen]] §Ablösung); der BUG
  nennt diese REQ trotzdem in `fix_requirement:`, und
  sie trägt `behebt: [BUG-NNN]` — der Rückverweis ist
  nicht auf `requirement_type: fix` beschränkt; ihre
  Begründung im Sinn der Kettenprüfung bleibt die einer
  REQ (`abgeleitet_von:` auf NEED oder SCEN), `behebt:`
  kommt hinzu. Behoben ist der BUG über diese REQ wie
  über eine Fix-Anforderung. Release-Notes führen die
  Fehlerbehebungen unter der Marke jeder Anforderung in
  `fix_requirement:`, getrennt von den neuen
  Funktionen — in einer Sackgasse als Workaround, in
  der regulären Marke als Behebung
  ([[Katalog-Release-Notes]]).
  **Fix-Anforderung auf einen Deploy** (dieser Absatz
  ist der führende Ort der Regel im Prozess): Liegt der
  Fehler in der Auslieferung, nicht im Produkt — ein
  BUG aus dem Betrieb einer Umgebung, dessen Ursache im
  Ausrollen liegt (Konfiguration, Zielsystem, Ablauf —
  das, was die DEPL der Umgebung und der Deploy-Stand
  beschreiben), während das Produkt bis zum Tag in
  Ordnung ist —, bleibt der Auftrag eine
  Fix-Anforderung in dieser Sektion; sie darf sich auf
  einen Deploy beziehen. Ihre **Umsetzung** ist ein
  weiterer Deploy-Stand derselben Umgebung mit eigener
  Freigabe — ist die Marke abgeschlossen, als Nachtrag
  am Marken-Eintrag, sonst als neue Version mit eigenem
  Freigabe-Eintrag ([[Zielmarken]] §Meta, Nachtrag) —,
  keine neue Marke: Eine Patch-Marke gibt es nur, wenn
  die Behebung Produkt oder Spezifikation ändert; dann
  ist sie eine gewöhnliche Fix-Anforderung in der
  nächsten Marke der Kette. Ihre **`zielmarke:`** ist
  die Marke des ausgelieferten Produkt-Stands — die
  Marke der Behebung, weil der weitere Deploy-Stand das
  Produkt dieser Marke ausrollt, und zugleich die Marke
  der Meldung; sie gehört zum nachgetragenen Stand wie
  dessen DEPL und ist eine Ausnahme vom Satz „beim
  Anlegen die `in-progress`-Marke“ ([[Zielmarken]]
  §Meta, Pflichtfeld `zielmarke:`); ist die Marke nicht
  eindeutig, fragt der Agent beim Anlegen (Frage-Block).
  Sie nennt die **Umgebung** im Feld `umgebung:` (Name
  aus [[Zielumgebungen]], wie das DEPL) — beim Anlegen;
  das Feld friert mit der Annahme ein. Den
  freigegebenen weiteren Deploy-Stand nennt sie als
  **angehängten Vermerk**, nicht im Feld Verweise: Sie
  ist ab `angenommen` eingefroren
  ([[Katalog-Anforderungen]]), und nach dem Freeze
  ändern sich nur Status-Achse, Ablösungsfelder und
  angehängte Vermerke ([[Einfrieren-und-Abloesen]]
  §Freeze und Ausnahmen) — das Feld Verweise bleibt,
  wie es bei der Annahme war. **Form des Vermerks**
  (dieser Absatz ist der führende Ort des Formats;
  Formel wörtlich, der Lint liest sie):
  `- **Vermerk <Datum>:** Umgesetzt mit Stand <Datei mit
  Version> von Deploy-Stand, freigegeben zu Marke <M>`
  — in der Sektion Vermerke ihres Detail-Knotens (mit
  dem Vermerk greift die Detail-Knoten-Pflicht, unten);
  `<Datei mit Version>` ist die Stand-Datei des weiteren
  Deploy-Stands in derselben Form wie im Feld Verweise
  eines Freigabe-Eintrags ([[Entscheidungen]] Meta
  „Freigabe-Einträge“: Dateiname mit Endung `.md`, als
  Text — der Lint liest sie auch ohne Endung, als
  Wikilink oder als Pfad unter `output/`), `<M>` die
  `zielmarke:` der Fix-Anforderung, `<Datum>` der Tag
  der Freigabe. Der Vermerk dokumentiert die Umsetzung
  am Element; die Freigabe selbst steht in der
  Nachtragszeile bzw. im Freigabe-Eintrag, der Vermerk
  ersetzt sie nicht. Der Lint meldet als Hinweis
  `FIX-DEPLOY` eine Fix-Anforderung auf einen Deploy mit
  Status `umgesetzt` oder `abgeschlossen` ohne Vermerk,
  einen Vermerk, dessen Stand-Datei in `output/` fehlt
  oder kein Deploy-Stand ist, und eine Marke im Vermerk,
  die nicht die `zielmarke:` der Anforderung ist; ob der
  Stand freigegeben ist, liest er an der Nachtragszeile
  bzw. am Freigabe-Eintrag — nennt keine von beiden die
  Stand-Datei des Vermerks, meldet er das ebenfalls als
  Hinweis `FIX-DEPLOY`. **Umgesetzt**
  ist sie mit der Freigabe des weiteren Deploy-Stands
  (Freigabe-Eintrag oder Nachtragszeile) — an die Stelle
  von „hängt am Tag“ ([[Register-Lebenszyklus]]) tritt
  diese Freigabe; FUNC, SPEC und TEST decken sie nicht,
  weil sich am Produkt nichts ändert, und die
  Kettenprüfung erwartet dafür keine Deckung
  ([[Kettenpruefung]] §Lint-Anteil; der Lint erkennt sie
  an `requirement_type: fix` mit `umgebung:`). Danach
  wechselt der BUG auf `umgesetzt` (oben).
  **Abgeschlossen** (dieser Absatz ist der führende Ort
  der Regel im Prozess) werden ein BUG, den allein
  Fix-Anforderungen auf einen Deploy beheben, und diese
  Fix-Anforderungen mit der Bestätigung des Anwenders,
  dass der Fehler in der Umgebung nicht mehr auftritt —
  im selben Zug, mit demselben `status_date`, und im
  selben Zug erledigt der Agent die Wiedervorlage in
  `TODO.md` (unten); einen
  Testbericht gibt es für sie nicht. Nennt
  `fix_requirement:` auch eine Produkt-Anforderung,
  bleibt es beim Weg der Status-Achse (oben). Weil der
  Agent vom Ausrollen nicht erfährt, fragt er bei der
  Freigabe des weiteren Deploy-Stands im Frage-Block,
  **wann** er nach der Bestätigung fragen soll — ein
  Datum oder ein Anlass —, trägt sie auf die Antwort
  hin, ohne weitere Anweisung, als
  Wiedervorlage in `TODO.md` ein (BUG, Fix-Anforderung,
  Umgebung, Zeitpunkt; die Datei prüft er beim
  Sessionstart, [[Standarddateien-Katalog]] §2.11, dort
  die Ausnahme von „nur auf Anweisung“) und fragt
  zum genannten Zeitpunkt; meldet der Anwender das
  Ausrollen früher, fragt er bei der nächsten
  Gelegenheit. Bis dahin bleiben beide `umgesetzt`.
  Bestätigt der Anwender nicht, weil der Fehler weiter
  auftritt, folgt eine weitere Fix-Anforderung auf einen
  Deploy am selben BUG (`fix_requirement:` ist eine
  Liste; dieselbe Marke, dieselbe Umgebung, `behebt:`
  zurück) mit einem weiteren Deploy-Stand; der Status
  geht nicht zurück, abgeschlossen werden alle mit der
  Bestätigung. Der Eintrag in `TODO.md` gilt für den
  BUG und nennt seine Fix-Anforderungen auf einen
  Deploy. Folgt, weil der Fehler weiter auftritt, eine
  weitere Fix-Anforderung auf einen Deploy, führt der
  Agent denselben Eintrag fort: Er ergänzt die neue
  Fix-Anforderung, vermerkt, dass die Nachfrage auf die
  Freigabe des weiteren Stands wartet, und trägt den
  neuen Zeitpunkt ein, sobald der Anwender ihn bei
  dieser Freigabe nennt; ein zweiter Eintrag zum selben
  BUG entsteht nicht. Antwortet der Anwender auf die
  Nachfrage oder auf die Vorlage beim Marken-Wechsel
  „noch nicht“, fragt der Agent im selben Zug, wann er
  erneut fragen soll (Datum oder Anlass), und ändert
  den Zeitpunkt im bestehenden Eintrag; fehlt der
  Eintrag, legt er ihn auf diese Antwort hin an. BUG
  und Fix-Anforderungen bleiben `umgesetzt`. Erledigt
  wird der eine Eintrag mit der Bestätigung (oben).
  Zusätzlich legt der Vollständigkeits-Scan
  jedes Marken-Wechsels einen solchen BUG, der noch
  `umgesetzt` ist, zur Bestätigung vor ([[Zielmarken]]
  §Meta, Wechsel-Prozedur Schritt 1). Der Status eines
  BUG wird vom Lint nicht gegen seine Fix-Anforderungen
  gelesen. Die Marke der
  Behebung liegt nicht vor der Marke der Meldung — es
  ist dieselbe. In **Release-Notes** erscheint der BUG
  nicht — weder in denen dieser Marke noch in denen
  einer Folge-Marke: Release-Notes beschreiben das
  Produkt, und am Produkt hat sich nichts geändert; der
  Nachtrag ist kein Auslöser ([[Katalog-Release-Notes]]).
  Dokumentiert ist die Behebung im Nachtrag am
  Marken-Eintrag — der weitere Deploy-Stand mit seiner
  Freigabe — und am BUG (`fix_requirement:`, hier der
  angehängte Vermerk mit der Stand-Datei); der Fehlerstand führt
  den BUG mit seinem Status ([[Katalog-Fehlerstand]]).
- **Eintragsformat:** `### REQ-NNN — <Kurzsatz>` mit
  Feldern Status (8-Zustand, Werte und Ablöseverweis:
  [[Register-Lebenszyklus]]) / Datum (letzter
  Statuswechsel) / Angelegt (Anlage-Datum
  `JJJJ-MM-TT`, Pflichtfeld seit 2.0 am Eintrag ohne
  Detail-Knoten, sonst `datum:` im Detail-Knoten; nie
  geändert — [[Katalog]] §Typ-Konventionen) / Zielmarke
  ([[Zielmarken]]; Pflichtfeld, kanonisch hier — mit
  Detail-Knoten ebenfalls als Feldzeile im Eintrag,
  [[Zielmarken]] §Meta „Sitz“; ein
  vergessenes Feld heilt der Vermerk „Zielmarke <M>
  (nachgetragen)“, [[Zielmarken]] §Meta „Heilweg“) /
  Auslöser (nur bei aufgeschoben) / Behebt (BUG-IDs,
  an jeder Anforderung, die einen BUG behebt) /
  Umgebung (nur bei einer Fix-Anforderung auf einen
  Deploy: Name aus [[Zielumgebungen]]) /
  Verweise (BUG- / REQ- / Contracts; eingefroren mit der
  Annahme — die Stand-Datei des weiteren Deploy-Stands
  nennt eine Fix-Anforderung auf einen Deploy nicht
  hier, sondern als angehängten Vermerk, oben) / Grund (bei
  verworfen) / Detail (Wikilink, nur wenn Detail-Knoten
  existiert).
- **Detail-Knoten-Pflicht:** sobald Vermerke,
  Umsetzungs-Notizen, längere Beschreibung oder
  zitierpflichtige Bezüge anfallen. Einen
  Nachweis-Abschnitt hat der REQ nicht; woran
  „geprüft“ hängt, sagt [[Register-Lebenszyklus]].
- **`requirement`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Anforderungen]] —
  lesen beim Anlegen eines `requirement`-Knotens.
  Sektionen: Anforderung (Ausformulierung) / Verweise
  (auslösende Meldung BUG-NNN, betroffene
  Requirements, Contracts/Komponenten) / Vermerke
  (append-only) / Bezüge
  (Fassaden-Eintrag [[Anforderungen]]). Dateiname
  `REQ-NNN <Kurzsatz>.md`.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Funktional

_(Einträge nach ID sortiert, chronologisch angelegt)_

## Nicht-funktional

_(Einträge nach ID sortiert, chronologisch angelegt)_

## Fehlerbehebungen

_(Fix-Anforderungen zu Fehlermeldungen, nach ID
sortiert, chronologisch angelegt)_
