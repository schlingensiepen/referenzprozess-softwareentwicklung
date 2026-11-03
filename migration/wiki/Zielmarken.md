---
type: target-mark-log
active: true   # kann nicht deaktiviert werden — Zielmarken ist Pflicht-Fassade (mandatory)
---

# Zielmarken

## Meta

- **Typ:** `target-mark-log` — Register der
  **Zielmarken**: die Marken des Projekts, seine
  Zwischenziel-Anker (Versionen wie „1.0", Ereignis-
  Marken wie „Nach der Revision", Etappen; Begriff:
  [[Glossar]] „Marke“, was eine Marke abschließt und
  wann eine neue beginnt: [[Marken]]). Produkt- und
  Projektplanung in einer Mechanik. Singleton,
  Pflicht-Fassade in jedem Projekt (Wiki.md §3a); die
  erste Marke legt der Init an.
- **Kategorie:** (a) Fassade + Detail-Knoten im
  wiki/ — Einträge leben inline; eine **gewichtige**
  Marke darf einen eigenen Detail-Knoten bekommen
  (Kriterium „gewichtig", Wiki.md §2.4).
- **Marken-Dreiklang (Eintragsformat):**
  `### <Bezeichnung> — <Benennung>` mit
  Beschreibung und Zustand. **Bezeichnung** = harte
  Kennung (`1.1`, frei wählbar); **Benennung** =
  Codename oder sprechender Name („Aurora", „Nach
  der Revision"); **Beschreibung** = präzisiert, was
  genau gemeint ist (z.B. welche Revision); **Zustand**
  = eine Zeile `- **Zustand:** künftig`,
  `- **Zustand:** in-progress`,
  `- **Zustand:** zurückgestellt (für 2.0.1)` oder
  `- **Zustand:** abgeschlossen` (das erste Wort zählt;
  die Marke mit dem Zeiger `current` trägt dahinter
  `(current)`; bei `zurückgestellt` nennt die Klammer
  die Zwischenmarke, siehe „Zwischenmarke“ unten). Der
  Lint liest den Zustand nur aus dieser Zeile. Bei
  einer Komponente kommt die Zeile
  `- **fuer_marke:** <koordinator>:<marke>` dazu
  (Bedeutung: „Zuliefernde Komponenten“ unten); bei
  einer Zwischenmarke die Zeile
  `- **Zwischenmarke:** Vorgänger von 2.1` oder
  `- **Zwischenmarke:** Sackgasse` (unten); bei
  einem Detail-Knoten steht der Wert zusätzlich im
  Frontmatter ([[Katalog-Zielmarken]]). Die
  Eintrags-Reihenfolge ist die geplante Abfolge; die
  **Vormarke** einer Marke ist die vorige Marke der
  Abfolge, eine Sackgasse ausgenommen.
- **Marken-Eintrag ist Element** mit Freeze ab
  Abschluss ([[Einfrieren-und-Abloesen]]): eine
  **künftige** Marke ist frei änderbar; eine
  Umbenennung trägt den Vermerk „vormals …“, und der
  Lint meldet `zielmarke:`-Werte ohne Ziel. Bei der
  Marke **`in-progress`** darf sich der Umfang
  ändern, die Bezeichnung bleibt fest; die Zeile
  `Zwischenmarke:` einer Zwischenmarke wird mit der
  ersten Ablösung oder Überlagerung in ihr fest
  („Zwischenmarke“ unten, Zeile `Zwischenmarke:`);
  dasselbe gilt
  für eine **zurückgestellte** Marke (sie war
  `in-progress` und ruht, solange eine Zwischenmarke
  oder mehrere aufeinander folgende Zwischenmarken
  laufen — unten). Eine
  **abgeschlossene** Marke (abgeschlossen ist sie mit
  dem Marken-Wechsel, unten) ist eingefroren; es folgen
  nur noch Vermerke (Nachtrag, unten — auch der
  Nachtrag „Tag korrigiert“ bei unverändertem Inhalt
  des Produkts), nie eine
  Ablösung. Was später nachkommt, gehört zur nächsten
  Marke (z.B. einer Patch-Marke `2.0.1`; läuft schon
  eine Folge-Marke, als Zwischenmarke, unten).
- **Zwei Zeiger:** genau eine Marke trägt
  **`current`** (zuletzt abgeschlossene/geltende),
  genau eine **`in-progress`** (daran wird
  gearbeitet) — keine nur, wenn das Projekt ruht
  (Ruhe-Zeile, unten); übrige Marken sind künftig,
  zurückgestellt (höchstens eine, nur während einer
  Zwischenmarke oder mehrerer aufeinander folgender
  Zwischenmarken) oder abgeschlossen. Solange keine
  Marke abgeschlossen ist (erste Marke), trägt keine
  Marke `current`.
  Die Zeiger führt diese Fassade;
  `devstate_active.md` (mit SP-1: [[devstate-Skelett]])
  referenziert die `in-progress`-Marke nur — und während einer
  Zwischenmarke die zurückgestellte Marke, zu der der
  Agent zurückkehrt; ruht das Projekt, den Ruhezustand.
  Die Zeiger-Führung liegt
  außerhalb der Mechanik von Wiki.md §1.1a (devstate ist
  eine Root-Session-Datei, kein Detail-Knoten).
  **Ruhe-Zeile** (dieser Absatz ist der führende Ort
  des Formats): Fehlt beim Marken-Wechsel eine
  künftige Marke und entscheidet der Anwender, dass das
  Projekt ruht (Wechsel-Prozedur Schritt 1, unten),
  trägt keine Marke `in-progress`; stattdessen steht im
  Abschnitt `## Marken` vor dem ersten Marken-Eintrag
  die Zeile `- **Ruht seit:** JJJJ-MM-TT` (das Datum des
  Wechsels). Der Lint liest sie: keine Marke
  `in-progress` ist mit der Ruhe-Zeile kein Hinweis,
  ohne sie bleibt sie es; eine Ruhe-Zeile neben einer
  Marke `in-progress` ist ein Hinweis. **Weitermachen:**
  Wer später weiterarbeitet, legt zuerst eine Marke an
  — Bezeichnung vom Anwender, Vorschlag des Agenten wie
  bei der ersten Marke im Init (die nächste typische
  Marke des Prozesses aus `Marken-<P>.md`, sonst die
  nächste Nummer der Zählung des Projekts; Bootstrap
  dieser Fassade), Zustand `in-progress`, Vormarke ist
  die `current`-Marke als vorige Marke der Abfolge —,
  bevor er etwas bucht: jedes neue Element erhält beim
  Anlegen die `in-progress`-Marke in `zielmarke:`
  (unten), also entsteht die Marke vor dem ersten
  Element. Die Ruhe-Zeile entfällt mit der neuen Marke.
  Das Weitermachen ist der **nachgeholte zweite Teil
  des Wechsels** (dieser Absatz ist der führende Ort):
  die `current`-Marke ist abgeschlossen und bleibt es,
  ein zweiter Wechsel-Eintrag entsteht nicht (der
  Eintrag „Marken-Wechsel von <A>; Projekt ruht“
  steht); aber was die Wechsel-Prozedur nach dem Wechsel
  vorsieht, holt der Agent mit der neuen Marke nach: Er
  legt die **Übernahme der Stände der letzten Marke** —
  und ihres Tags — in die neue Marke gesammelt vor
  (Wechsel-Prozedur Schritt 5, unten: welche Stände und
  ob der Tag weitergelten, was für die neue Marke
  überholt ist) und legt mit vor, was im
  Vollständigkeits-Scan des Wechsels mit Ruhe offen
  geblieben ist (Schritt 1, unten). Er übernimmt nicht
  still.
- **Pflichtfeld `zielmarke:`** an Elementen (in
  der Basis DEC, IDEA, NEED, SCEN; mit dem Prozess
  z.B. REQ, BUG, FUNC, ARC, SPEC, TEST, DEPL, CON;
  `testplan` ist kein Element, sondern die Kennung
  eines Stands und trägt das Feld nicht; dieser Absatz
  ist der führende Ort der Regel): Wert = Bezeichnung
  der Marke, zu der das Element gehört. **Beim Anlegen
  schreibt der Agent die aktuelle `in-progress`-Marke
  hinein;** ist das Element von vornherein für eine
  spätere Marke geplant oder wird es dorthin
  verschoben, trägt es diese Marke. Ein neues Element
  ohne Feld gibt es nicht. **Ausnahmen** — Elemente,
  deren Marke keine Planungsaussage, sondern eine
  Tatsache ist, wie die Marke abgeleiteter Nachweise:
  ein **BUG** trägt nicht die laufende Marke, sondern
  die Marke des Produkt-Stands, an dem der Fehler
  beobachtet wurde (welche Marke das ist und wann der
  Agent fragt: SP-1 `Fehlermeldungen.md` §Meta
  „Zielmarke“); die **DEPL eines Deploy-Stands, der zu
  einer abgeschlossenen Marke nachgetragen wird** — für
  eine neue Umgebung wie für eine Umgebung, die anders
  ausgerollt wird —, eine **Entscheidung, die nur diese
  Umgebung betrifft,** und eine **Fix-Anforderung auf
  einen Deploy** (ein Fehler in der Auslieferung, nicht
  im Produkt, behoben durch einen weiteren Deploy-Stand;
  SP-1 `Anforderungen.md` „Fehlerbehebungen“) tragen die
  Marke des nachgetragenen Deploy-Stands — die Marke
  dessen, was ausgerollt wird, ist der Grund, warum der
  Stand nachgetragen werden kann (Nachtrag unten; SP-1
  `Katalog-Deployments.md`, [[Katalog-Entscheidungen]],
  SP-1 `Katalog-Anforderungen.md`).
  In allen vier Fällen fragt der Agent bei Unklarheit,
  statt die laufende Marke zu schreiben; weitere
  Ausnahmen gibt es nicht — eine Änderung an
  Spezifikation oder Produkt ist nie ein Nachtrag,
  sondern eine neue Marke (Nachtrag unten). Gelesen
  wird der Wert, nicht
  die laufende Marke zum Prüfzeitpunkt: ab seiner
  Marke gilt das Element für alle späteren Marken ihrer
  Vormarken-Kette, in einer Sackgasse nur für diese
  (Marken-Regel: [[Einfrieren-und-Abloesen]] §Stand;
  Ablösung ab der Marke des Nachfolgers: ebenda
  §Ablösung). Das Feld ist eine Planungsaussage und bis
  zum Freeze des Elements umhängbar; mit der Annahme
  wird es wie das übrige Element eingefroren, danach
  ändert es nur noch eine Ablösung. Nachweise tragen
  das Feld nicht; abgeleitete Nachweise tragen
  stattdessen die Marke als Herkunft. **Sitz:**
  kanonisch ist der Fassaden-Eintrag (Wiki.md §1.1a).
  **Ohne Detail-Knoten** ist der Register-Eintrag
  selbst der Fassaden-Eintrag; er trägt das Feld als
  Feldzeile `- **Zielmarke:** M` (Eintragsformat der
  Register-Metas, Beispielzeile: [[Entscheidungen]]
  Meta „Eintragsformat“; der Lint liest die Feldzeile,
  auch in Kleinschreibung `zielmarke`, und die Angabe
  in der Status-Zeile). **Mit Detail-Knoten** steht das
  Feld im Frontmatter des Knotens und als Anzeige im
  Fassaden-Eintrag — dieselbe Feldzeile
  `- **Zielmarke:** M` bzw. die Angabe in der
  Status-Zeile wie ohne Detail-Knoten; ein
  Klammer-Zusatz in der Überschrift ist keine
  lint-lesbare Anzeige und ersetzt die Feldzeile nicht;
  beim Anlegen und beim Umhängen schreibt der Agent
  beide — wer das Feld ändert, fasst die Fassade an,
  der Knoten spiegelt (Wiki.md §1.1a). Der Lint liest
  beide und meldet eine Abweichung zwischen
  Fassaden-Eintrag und Knoten als Hinweis
  `ZIELMARKE-DRIFT`; nennt der Eintrag eine Marke, gilt
  sie ihm für alle weiteren Prüfungen (Marken-Regel,
  Ablösung) — bis zum Freeze des Elements zieht der
  Agent den Knoten nach; nach dem Freeze ist das Feld
  eingefroren, der Hinweis bleibt stehen, und der
  Eintrag gilt; nennt der
  Eintrag keine, liest er den Knoten (eine fehlende
  Anzeige im Eintrag ist kein Befund). In der
  Pflichtfeld-Zeile der Katalog-Einträge steht es mit
  `(seit 2.0)` ([[Katalog]] §Typ-Konventionen). Ein
  Freigabe-Eintrag trägt die Marke der Freigabe, ein
  Marken-Wechsel-Eintrag die abgeschlossene Marke
  ([[Entscheidungen]] Meta). **Anlage-Datum:** Zusammen
  mit `zielmarke:` schreibt der Agent beim Anlegen das
  Anlage-Datum des Elements — `datum: JJJJ-MM-TT` im
  Kopf des Detail-Knotens, ohne Detail-Knoten die Zeile
  `- **Angelegt:** JJJJ-MM-TT` im Register-Eintrag
  (Pflichtfeld seit 2.0 an allen Element-Typen); es
  wird nie geändert und ist das Stichtags-Feld des
  Bestandsschutzes ([[Katalog]] §Typ-Konventionen,
  führender Ort des Felds).
  **Bestand:** Elemente ohne Feld, die vor dem Stichtag
  des Bestandsschutzes angenommen wurden (das Datum des
  Herkunfts-Vermerks, [[Init-Choreografie]] §Herkunft),
  sind **Bestands-Elemente**: sie gelten wie bisher ab
  ihrer Annahme — für die Marke, die dabei
  `in-progress` war, und alle späteren Marken der Kette;
  nachgetragen wird nichts, weil sie eingefroren sind.
  Der Lint liest das Anlage-Datum (`datum:` bzw.
  `Angelegt`) als Stichtags-Feld: ein fehlendes
  `zielmarke:` an einem Element mit Anlage-Datum ab dem
  Stichtag ist ein Fehler; ein Element ohne
  Anlage-Datum gilt ihm als Bestand und bekommt einen
  Hinweis — Bestand und vergessenes Feld sind dann
  nicht zu unterscheiden. **Heilweg** (dieser Absatz
  ist der führende Ort des Formats): Bis zur Annahme —
  dem Freeze-Zeitpunkt des Typs, bei einem BUG der
  Anlage — ist das Feld änderbar: fehlt es an einem
  Element, das der Agent in diesem Zug angelegt hat und
  das bis zu seinem Freeze-Zeitpunkt änderbar ist
  (Sammel-Register; Elemente mit Annahme nach dem
  Anlegen), trägt er es vor der Annahme bzw. dem Commit
  nach. Fehlt es an einem Element, das direkt
  angenommen wird — eine DEC ist mit der Buchung
  angenommen und hat kein „vor der Annahme“, auch nicht
  im selben Zug vor dem Commit — oder schon
  eingefroren ist, heilt es ein **angehängter Vermerk**
  am Element:
  `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)`
  — im Register-Eintrag ohne Detail-Knoten als
  Vermerk-Zeile unter der Überschrift, im Detail-Knoten
  in der Sektion `## Vermerke`; bei einem Element mit
  Detail-Knoten gehört der Vermerk in den Knoten, auch
  wenn der Fassaden-Eintrag die Marke zeigt oder den
  Vermerk trägt — nur der Vermerk im Knoten beendet den
  Fehler `PFLICHTFELD` dort. M ist die Marke, die das
  Feld beim Anlegen hätte tragen müssen (oben). Der
  Lint liest den Vermerk wie das Feld — Marken-Regel und
  Ablösungs-Wirkung lesen M, der Fehler `PFLICHTFELD`
  endet —; der eingefrorene Inhalt bleibt unverändert,
  das Feld selbst bleibt leer (angehängter Vermerk als
  Ausnahme der Unveränderlichkeit,
  [[Einfrieren-und-Abloesen]] §Freeze und Ausnahmen).
  Der Vermerk ist kein Nachtragen im Bestand:
  Bestands-Elemente ohne Feld bleiben, wie sie sind.
  Ohne Vermerk bleibt der Fehler stehen und wird dem
  Anwender gemeldet, und die Marken-Regel wertet das
  Element wie ein Bestands-Element. Wer ein
  Element anlegt, verlässt sich deshalb nicht auf den
  Lint, sondern schreibt Feld und Anlage-Datum. Wie der
  Lint Bestands-Elemente in der Marken-Regel wertet:
  [[Einfrieren-und-Abloesen]] §Stand; einen
  Bestands-Nachfolger ohne Feld bei vorgezogener
  Zwischenmarke: ebenda §Ablösung.
- **Marken-Trigger:** das `trigger:`-Feld
  aufgeschobener Einträge akzeptiert neben einem
  Datum auch eine Marken-Bezeichnung — der
  Register-Wächter reaktiviert den Eintrag, wenn
  die Marke `in-progress` wird („für 2.0 vertagt"
  heißt schlafen gelegt mit Wecker); der Wächter
  prüft bei jedem Lauf den Zustand, kein Ereignis:
  Trigger-Marke ist die aktuelle `in-progress`-Marke.
  Während einer Zwischenmarke (unten) ist das die
  Zwischenmarke; Einträge mit der zurückgestellten
  Marke als Trigger bleiben aufgeschoben und werden
  bei der Rückkehr reaktiviert, sobald sie wieder
  `in-progress` ist — auch Einträge, die erst während
  der Zwischenmarke aufgeschoben wurden; ein schon
  reaktivierter Eintrag ist nicht mehr aufgeschoben
  und wird nicht erneut geweckt. Marken-Trigger
  und Register-Wächter wirken **nur in
  Sammel-Registern**; welche das sind und wohin eine
  zurückgestellte Entscheidung gehört:
  [[Einfrieren-und-Abloesen]] §Eintrittsregel.
- **Zuliefernde Komponenten** (bei einem Schnitt in
  Komponenten; dieser Absatz ist der führende Ort des
  Formats): der Marken-Eintrag des Koordinators
  trägt einen Abschnitt „Zuliefernde Komponenten“
  (Fettzeile `- **Zuliefernde Komponenten:**` oder
  Überschrift) mit einer **Tabelle** — je Lieferung
  eine Zeile:
  `| Datum | Komponente | Gegenstand | quelle |`
  mit Datum der Buchung, Komponente als **Repo-Name**,
  Gegenstand (Tag bzw. Abschluss-Stand der
  Komponente, als qualifizierter Verweis
  `<repo>/<tag>` bzw. `<repo>/<Dateiname>`; bei einem
  Zwischen-Koordinator ohne eigene Bauteile an Stelle
  des Tags der Verweis `<repo>/Zielmarken` mit der
  Bezeichnung seiner Marke im Text der Zelle, kein
  Anker — seine Tabelle trägt die Lieferungs-Tags, der
  Verweis ist bis zu seinem Marken-Abschluss ein
  Lesehinweis; Doppelrolle und was der Koordinator
  daraus in `herkunft` übernimmt: [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art,
  Zwischen-Koordinator) und
  `quelle:` (die Meldung der Komponente als Nachricht,
  `<repo>/MSG-NNN`, [[Katalog-message]]; welche
  Meldungen die Komponente schickt: Vorgehen.md §3a);
  idempotent je `quelle:` und Gegenstand. Eine
  **übernommene Lieferung** — der Tag der Vormarke
  gilt weiter, weil das Produkt unverändert ist
  ([[Kettenpruefung]] §Kette, Übernahme des Tags und
  der Lieferung) — steht als eigene Zeile der
  Folge-Marke: Gegenstand ist der alte Tag
  `<repo>/<tag>` (beim Zwischen-Koordinator sein
  Verweis) mit dem Zusatz „übernommen aus <Vormarke>“
  in derselben Zelle, `quelle:` die Meldung der
  Komponente zur Folge-Marke (ihr Marken-Abschluss) —
  dieselbe `quelle:` wie die Zeile des Abschluss-Stands,
  ein anderer Gegenstand. So liest ihn der Lint: Zeilen der
  Tabelle, die den Repo-Namen nennen; keine Fettzeilen
  zwischen den Lieferungen. Bei der Marke
  `in-progress` ist das Umfang; nach dem Abschluss
  wird er als Nachtrag geführt. Erwartet werden zu
  einer Marke die Komponenten, deren Übergabe-Stand
  zu dieser Marke freigegeben **oder übernommen** ist
  ([[Kettenpruefung]] §Kette). Der Marken-Eintrag
  einer Komponente trägt `fuer_marke:
  <koordinator>:<marke>` — die Marke des
  Koordinators, für die sie liefert. Bei ihrer ersten
  Marke ist das die `marke` aus der Herkunftszeile
  des Übergabe-Stands; der Init liest sie über den
  Verweis auf den Übergabe-Stand im Startprompt. Ab
  der zweiten Marke nennt die Nachricht des
  Koordinators zum Start seiner Folge-Marke (bzw. ein
  neuer Übergabe-Stand mit seiner `marke`) die Marke,
  für die die Komponente liefert (Vorgehen.md §3a);
  der Agent setzt `fuer_marke:` bei Anlage ihrer
  Marke. Der Lint liest den Wert nur aus dieser Zeile.
- **Marken-Wechsel-Prozedur** (Wechsel des
  `in-progress`-Zeigers; zugleich
  Wächter-T2-Ereignis, mit SP-1; zusätzlicher
  Auslöser der Freigabe-Bezugsprüfung T4):
  1. **Vollständigkeits-Scan** der abzuschließenden
     Marke: offene zugeordnete Einträge — per
     `zielmarke:`-Feld, dazu offene Bestands-Einträge
     ohne Feld und die offenen BUG früherer Marken der
     Kette (unten) — als Register- und TODO-Punkte
     vorlegen — erledigen oder auf die nächste bzw.
     eine spätere Marke verschieben (Anwender-Entscheid
     je Punkt). Dazu jeden **noch nicht freigegebenen
     Doku-Stand** aus der Doku-Abfrage (Entwickler-Doku,
     Benutzer-Doku, Betriebs-Anleitung je Umgebung;
     [[Kettenpruefung]] §Kette, Doku-Abfrage) — mit
     „jetzt“ wie mit „später“, und jedes Doku-Glied ohne
     Zeile der Abfrage (etwa eine nach der Abfrage
     hinzugekommene Umgebung): bei „jetzt“ ist die
     Vorlage zur Freigabe vor dem Wechsel Pflicht (eine
     Betriebs-Anleitung „jetzt“ kann keine Einschränkung
     „Doku folgt“ tragen); bei „später“ gibt der Anwender
     vor dem Wechsel frei oder entscheidet erneut
     „später“ — dann wird der Stand nach dem Wechsel als
     Nachtrag gebucht (Nachtrag unten), der Wechsel
     wartet nicht; eine fehlende Zeile stellt der Agent
     hier nach. Verschieben heißt: an einem noch nicht
     eingefrorenen Element (offener oder aufgeschobener
     Eintrag eines Registers mit `Freeze ab:
     angenommen`) das Feld umhängen; ein eingefrorenes
     Element (angenommen, [[Katalog]] `Freeze ab:`)
     wird nicht umgehängt, sein Feld ändert nur noch
     eine Ablösung (Pflichtfeld `zielmarke:` oben): das
     Element wird durch ein neues mit der `zielmarke:`
     der späteren Marke abgelöst
     ([[Einfrieren-und-Abloesen]] §Ablösung). Ein BUG
     (`Freeze ab: Anlage`) wird weder umgehängt noch
     wegen seiner Marke abgelöst: sein Feld ist die
     Marke der Meldung (= Marke des Produkt-Stands, an
     dem der Fehler beobachtet wurde); „auf eine spätere Marke
     verschieben“ heißt bei ihm, dass die Anforderung,
     die ihn erledigt (seine Fix-Anforderung oder die
     geänderte bzw. neue Anforderung, auf die er mit
     `fix_requirement:` verweist), die spätere Marke
     erhält (SP-1 `Anforderungen.md` „Fehlerbehebungen“)
     oder der BUG mit `trigger:` aufgeschoben wird
     (Marken-Trigger oben; das Feld bleibt); liegt der
     Fehler in der Auslieferung, wird nicht verschoben
     (unten, Offene BUG früherer Marken).
     **Offene BUG früherer Marken** (dieser Absatz ist
     der führende Ort der Regel): Zugeordnet sind auch
     die offenen BUG, deren Marke eine frühere Marke der
     Vormarken-Kette der abzuschließenden Marke ist —
     sie gelten für sie (Marken-Regel; eine Sackgasse
     nur für sich: ein BUG mit der Marke einer Sackgasse
     steht nur im Scan dieser Sackgasse, ein BUG der
     Vormarke auch im Scan einer Zwischenmarke). Offen
     ist ein BUG, dessen Status weder `umgesetzt` noch
     `abgeschlossen` noch `verworfen` ist und der nicht
     als Duplikat abgelöst ist (`superseded_by:`) — also
     `offen`, `aufgeschoben`, `angenommen` oder
     `in-umsetzung` (SP-1 `Register-Lebenszyklus.md`);
     ein als „kein Fehler“ verworfener BUG und ein
     Duplikat werden nicht vorgelegt. Auch ein BUG, dessen Behebung
     in einem früheren Scan verschoben oder aufgeschoben
     wurde, steht mit seinem Stand (Fix-Anforderung mit
     ihrer Marke, `trigger:`) in der Vorlage. Der
     Anwender entscheidet je BUG wie bei jedem Punkt:
     Behebung in der abzuschließenden Marke (eine
     Fix-Anforderung mit ihrer Marke, vor dem Wechsel
     umgesetzt), Behebung verschieben (die
     Fix-Anforderung erhält die spätere Marke oder wird
     mit ihr angelegt) oder aufschieben (`trigger:`);
     das Feld des BUG bleibt in jedem Fall. Liegt der
     Fehler in der Auslieferung — im Ausrollen einer
     Umgebung, das Produkt in Ordnung —, nennt die
     Vorlage diesen Weg mit: Die Behebung ist ein
     weiterer Deploy-Stand derselben Umgebung mit einer
     Fix-Anforderung auf einen Deploy, die die Marke des
     BUG trägt und behält (SP-1 `Anforderungen.md`
     „Fehlerbehebungen“; Pflichtfeld `zielmarke:` oben,
     Ausnahmen) — nach dem Wechsel ein Nachtrag zu
     dieser Marke (Nachtrag unten); sie wird weder
     verschoben noch umgehängt, der BUG bleibt bis zur
     Freigabe des Stands offen und steht im nächsten
     Scan mit diesem Stand; mit der Freigabe ist er
     `umgesetzt`, abgeschlossen erst mit der Bestätigung
     des Anwenders (SP-1 `Anforderungen.md`
     „Fehlerbehebungen“). Zusätzlich legt der Scan jeden
     BUG vor, den allein Fix-Anforderungen auf einen
     Deploy behoben haben und der noch `umgesetzt` ist —
     zur Bestätigung der Behebung; offen ist er nicht.
     Der Anwender antwortet je BUG: Er bestätigt (BUG
     und Fix-Anforderungen werden abgeschlossen, die
     Wiedervorlage in `TODO.md` ist erledigt); er
     bestätigt noch nicht (beide bleiben `umgesetzt`;
     der Agent fragt im selben Zug nach dem neuen
     Zeitpunkt und ändert die Wiedervorlage, fehlt sie,
     legt er sie an); oder der Fehler tritt weiter auf
     (weitere Fix-Anforderung auf einen Deploy am selben
     BUG, nach dem Wechsel ein Nachtrag). Jede dieser
     Antworten ist der Entscheid zu diesem BUG; die
     Bestätigung selbst hält den Wechsel nicht auf
     (SP-1 `Anforderungen.md` „Fehlerbehebungen“).
     Ohne
     Entscheid zu jedem vorgelegten BUG wird der Wechsel
     nicht gebucht. Ist die abzuschließende Marke eine
     Sackgasse, ist für einen BUG mit ihrer Marke die
     Behebung in ihr die Anforderung der Sackgasse
     („Zwischenmarke“ unten); verschieben lässt er sich
     nicht, weil er für keine spätere Marke gilt — er
     bleibt offen oder wird aufgeschoben. Bei der Ruhe
     (unten) gibt es kein Ziel zum Verschieben: ein
     offener BUG bleibt mit seiner Marke offen und gilt
     ab ihr weiter. Der Scan ist der Pflicht-Ort dieser
     Entscheidung; der Fehlerstand bleibt ein optionales
     Angebot und führt dieselben BUG nach seinem Filter
     (SP-1 `Katalog-Fehlerstand.md`).
     Bei einer
     Zwischenmarke, die Sackgasse ist, wird nicht
     umgehängt: dort ist das Mitnehmen die Übernahme
     nach der Rückfrage („Zwischenmarke“ unten). Bei
     einer Zwischenmarke, die Vorgänger ist, und der
     Rückkehr (dem Wechsel der letzten Zwischenmarke)
     legt der Scan jedes Element vor, das zwei für die
     zurückgestellte Marke geltende Nachfolger hat —
     der Anwender wählt (a) den Stand der
     zurückgestellten Marke, (b) den Fix oder (c) die
     Zusammenführung („Doppelte Nachfolger“ unten).
     Dasselbe gilt, wenn der Nachfolger-DEPL eines
     Nachtrags ein DEPL ablöst, das die laufende
     Folge-Marke schon abgelöst hat („Doppelte
     Nachfolger beim Nachtrag“ unten).
     **Fehlt eine künftige Marke** (kein Eintrag mit
     Zustand `künftig` nach der abzuschließenden Marke
     in der Abfolge **und** keine zurückgestellte Marke
     und keine folgende Zwischenmarke: beim Wechsel einer
     Zwischenmarke ist die nächste Marke der Abfolge die
     zurückgestellte Marke oder eine folgende
     Zwischenmarke — beide zählen als künftige Marke,
     die Rückkehr löst die Frage nicht aus), fragt der
     Agent spätestens hier,
     vor dem Buchen des Wechsels (Frage-Block): (a)
     **Folge-Marke anlegen** — der Anwender nennt die
     Bezeichnung, der Agent schlägt vor wie bei der
     ersten Marke im Init (nächste typische Marke aus
     `Marken-<P>.md`, sonst die nächste Nummer); die
     neue Marke wird im Marken-Dreiklang eingetragen
     und mit dem Wechsel `in-progress`, der
     Wechsel-Eintrag nennt sie als B; oder (b)
     **Projekt ruht** — der Wechsel wird gebucht, ohne
     dass eine Marke `in-progress` wird (Ruhe-Zeile,
     Zeiger oben); im Scan dieses Wechsels gibt es kein
     Ziel für „verschieben“: was weder erledigt noch
     mitgenommen wird, bleibt mit seiner Marke offen
     und gilt ab ihr weiter, und der Agent legt es beim
     Weitermachen mit vor (Ruhe-Zeile, oben). Beim
     Koordinator
     meldet der Scan zusätzlich offene zuliefernde
     Marken der Komponenten; der Anwender entscheidet
     ([[Berichten-statt-Blockieren]]).
  2. **Freigabe des Abschluss-Stands** durch den
     Anwender ([[Katalog-Abschluss-Stand]]). Die Marke
     ist damit noch nicht abgeschlossen: das ist sie
     erst mit dem Wechsel (Schritt 4).
  3. **Prüfung auf überholte Stände:** der Agent
     prüft (Lint-Lauf), ob Stände im Abschluss-Stand
     nach der Überholt-Regel überholt sind
     ([[Einfrieren-und-Abloesen]] §Überholt-Regel),
     und legt Befunde vor. Sind Stände im
     Abschluss-Stand überholt, werden sie neu
     abgeleitet und freigegeben (Überholt-Regel); der
     Abschluss-Stand, der die alten Stände und
     Freigaben listet, wird als neue Version gebildet,
     und die Prozedur läuft ab Schritt 2 erneut, bevor
     Schritt 4 folgt. In derselben Form — neue Version,
     erneute Freigabe, weiter ab Schritt 2 — läuft ohne
     Prozess eine Tag-Korrektur nach der Freigabe des
     Abschluss-Stands; vor seiner Freigabe entsteht
     ebenfalls eine neue Version, nur ohne abzulösende
     Freigabe ([[Kettenpruefung]] §Kette,
     Tag-Korrektur ohne Prozess).
  4. **Zeiger nachführen** (`current` auf die
     abgeschlossene, `in-progress` auf die nächste
     Marke der Abfolge — nach einer Zwischenmarke auf
     eine folgende Zwischenmarke oder, als Rückkehr
     nach der letzten, auf die zurückgestellte Marke,
     unten; ohne künftige Marke nach der Antwort aus
     Schritt 1 auf die angelegte Folge-Marke oder auf
     keine, mit der Ruhe-Zeile (Zeiger oben);
     Zeiger = Zeile `Zustand:` beider
     Marken, Format in §Meta „Marken-Dreiklang“)
     und den Wechsel als Eintrag im
     Entscheidungs-Register buchen — Gegenstand
     „Marken-Wechsel von <A> zu <B>“ (ruht das
     Projekt: „Marken-Wechsel von <A>; Projekt ruht“,
     ohne B) mit Verweis auf
     den freigegebenen Abschluss-Stand, mit
     `zielmarke:` der abgeschlossenen Marke A (der
     Eintrag ist ihr Abschluss-Akt), ohne den
     Pflichtteil „Verworfene Alternativen“ (Aufbau:
     [[Entscheidungen]] Meta „Marken-Wechsel-Einträge“).
     **Mit dem Wechsel ist die Marke abgeschlossen und
     eingefroren**; was danach an ihr zu korrigieren
     wäre, gehört in eine Patch-Marke (Freeze ab
     Abschluss, oben). Mit dem Wechsel
     wechselt der Status der Elemente, die ab der neuen
     Marke abgelöst sind, auf `abgelöst`
     ([[Einfrieren-und-Abloesen]] §Ablösung). Mit SP-1
     ist der gebuchte Wechsel der Meilenstein
     „Marken-Abschluss“ und löst die T2-Runde des
     Wächters aus (`Meilenstein-und-T2.md`).
  5. **Übernahme in die neue Marke:** Die freigegebenen
     Pflicht-Stände der abgeschlossenen Marke gelten
     für die neue Marke weiter, solange sie nicht —
     geprüft gegen die neue Marke — überholt sind; sie
     werden weder neu gebildet noch neu freigegeben
     ([[Kettenpruefung]] §Kette, Übernahme aus der
     Vormarke). Dasselbe gilt für den **Tag**, wenn
     das Produkt seit ihm unverändert ist und die
     Stände, auf denen er beruht, übernommen werden
     (ebenda, Übernahme des Tags und der Lieferung).
     Bekommt die neue Marke einen eigenen Tag, werden
     Testplan-Stand, Deploy-Stände und
     Betriebs-Anleitungen nicht übernommen, sondern
     als Folge-Versionen mit eigener Freigabe
     fortgeführt (ebenda, Folge-Marke mit eigenem Tag).
     Der Agent legt vor, welche Stände und ob der Tag
     übernommen werden und welche Stände für die neue
     Marke überholt sind (Lint-Lauf, Marken-Bezug der
     Überholt-Regel). Der Abschluss-Stand der neuen
     Marke führt die übernommenen Stände und den
     übernommenen Tag mit „übernommen aus <Vormarke>“
     ([[Katalog-Abschluss-Stand]]); beim Koordinator
     kommen übernommene Lieferungen unveränderter
     Komponenten als Zeilen in „Zuliefernde
     Komponenten“ der neuen Marke (oben), sobald die
     Komponente sie meldet. Den Komponenten, deren
     Übergabe-Stand weitergilt, nennt der Koordinator
     die neue Marke per Nachricht (Vorgehen.md §3a,
     Start einer Folge-Marke). Bei der Rückkehr aus
     einer Zwischenmarke (unten) legt der Agent
     zusätzlich vor, welche schon gebildeten Stände der
     zurückgestellten Marke durch die Zwischenmarke
     überholt sind, und führt die Zweige der
     Zwischenmarken, die Vorgänger sind, in die
     Hauptlinie zurück, bevor die zurückgestellte Marke
     weiterläuft — Konflikte legt er dem Anwender vor
     und löst sie nicht selbst („Tag und Produkt-Repo“
     unten); aus einer Sackgasse wird nichts
     übernommen und ihr Zweig nicht zurückgeführt — was
     der Anwender auf die Rückfrage
     zur Übernahme (unten) in die reguläre Linie holt,
     kommt auf dem Planweg in die zurückgestellte Marke.
- **Zwischenmarke** (dieser Absatz ist der führende
  Ort der Regel): Soll das Produkt einer
  abgeschlossenen Marke korrigiert werden (Patch-Marke,
  z.B. `2.0.1` zu `2.0`; ein anderes Ausrollen bei
  unverändertem Produkt ist keine Patch-Marke, sondern
  ein Nachtrag, unten), während die Folge-Marke
  (`2.1`) schon `in-progress` ist, wird die Patch-Marke
  als **Zwischenmarke vorgezogen**: Der Agent trägt sie
  in der Abfolge vor der laufenden Marke ein, sie wird
  `in-progress`, und die bisher laufende Marke wird
  **zurückgestellt** (`- **Zustand:** zurückgestellt
  (für 2.0.1)`). Es bleibt bei genau einer Marke
  `in-progress`: an ihr hängen der Wert, den neue
  Elemente beim Anlegen in `zielmarke:` erhalten,
  Marken-Trigger und devstate; Freigaben tragen ihre
  Marke immer selbst — im Kopf des Stands oder, ohne
  Stand-Datei, im Zusatz „zu Marke M“ („Freigaben“
  unten). Arbeit an der zurückgestellten Marke bleibt
  zulässig; was für sie entsteht, nennt sie
  ausdrücklich — Freigaben „zu Marke 2.1“ (Vorgehen.md
  §4), Elemente mit `zielmarke: 2.1` (der Agent
  schreibt beim Anlegen die zurückgestellte Marke
  hinein statt der `in-progress`-Marke) — auch ein BUG
  aus einem Test der Arbeit an der zurückgestellten
  Marke (Testbericht in `gefunden_in:`): er trägt
  `zielmarke: 2.1`, denn die Marke der Meldung ist die
  Marke des Produkt-Stands, an dem der Fehler beobachtet
  wurde, und der getestete Tag gehört zu `2.1`; ein BUG
  aus dem Betrieb des ausgelieferten `2.0` trägt `2.0`;
  ist die Marke nicht eindeutig, fragt der Agent — nie
  die Zwischenmarke als laufende Marke (SP-1
  `Fehlermeldungen.md` §Meta, Zielmarke — der führende
  Ort). Was vor dem
  Anlegen der Zwischenmarke für die zurückgestellte
  Marke angenommen wurde, trägt `zielmarke: 2.1` schon
  und gilt für die Zwischenmarke nicht —
  Bestands-Elemente ohne Feld ausgenommen (Pflichtfeld
  `zielmarke:` oben). **Bestands-Nachfolger ohne Feld:**
  Hat ein Bestands-Element ohne Feld vor dem Vorziehen
  ein Element abgelöst, wertet der Lint die Ablösung ab
  der laufenden Marke — also ab der Zwischenmarke —,
  obwohl sie zur zurückgestellten Marke gehören kann;
  er meldet den Fall während der Zwischenmarke als
  Hinweis `ABLOESUNG-BESTAND`, der Agent fragt den
  Anwender, zu welcher Marke die Ablösung gehört, und
  bucht die Antwort als Vermerk „Ablösung von <E> gilt
  ab Marke <M>“ am Nachfolger — mit dem Vermerk gilt
  der Nachfolger ab M wie mit `zielmarke: M`, ohne
  Vermerk bleibt die Bestands-Lesart ab der laufenden
  Marke (Zeitpunkt der Rückfrage, Format des Vermerks
  und Wirkung: [[Einfrieren-und-Abloesen]] §Ablösung,
  Bestands-Nachfolger bei einer Zwischenmarke — der
  führende Ort).
  Zu welcher Marke ein neues
  Element gehört, folgt aus dem Auftrag (Arbeit an der
  Zwischenmarke oder an der zurückgestellten Marke);
  ist das aus dem Auftrag nicht ableitbar, fragt der
  Agent vor dem Anlegen (Frage-Block, MasterPrompt
  §5.1.0) — nach dem Freeze heilt eine falsche Marke
  nur noch eine Ablösung. **Fehlerbehebung in der
  Zwischenmarke:** Ein BUG, der am ausgelieferten Stand
  der Vormarke beobachtet wurde (`zielmarke: 2.0`), darf
  in der Zwischenmarke behoben werden — seine
  Fix-Anforderung trägt `zielmarke: 2.0.1` — wie in
  `2.1`: `2.0` ist die Vormarke der Zwischenmarke, die
  Behebung liegt nach der Meldung, der Regelfall ohne
  Ausnahme (SP-1 `Anforderungen.md` „Fehlerbehebungen“).
  Ein BUG, der am Tag der zurückgestellten Marke
  beobachtet wurde (`zielmarke: 2.1`), wird nicht in der
  Zwischenmarke behoben — das wäre eine Behebung an
  einem Stand, der den Fehler nicht zeigt, und, ist die
  Zwischenmarke Vorgänger, ein Lint-Fehler wie jede
  Behebung vor der Meldung; der Lint liest dafür allein
  die Vormarken-Kette, weder die Zeile `Zwischenmarke:`
  noch einen Zeitpunkt — eine Sackgasse ist nur für sich
  eine frühere Marke: eine Behebung in ihr vergleicht
  der Lint mit keiner anderen Marke und bleibt still,
  die Regel gilt trotzdem.
  Die Marke der Meldung bleibt, wie sie ist, der BUG
  wird nicht umgehängt. Ein BUG, der am Stand der
  Zwischenmarke selbst beobachtet wird, trägt deren
  Marke; ist sie Sackgasse, ist er ein Fehler des
  Workarounds und gilt nur für sie — ihn behebt eine
  Anforderung mit der Marke der Sackgasse, mit ihrer
  Umsetzung ist er behoben (Status wie bei jedem BUG)
  und steht in den Release-Notes der Sackgasse als
  Behebung; behebt ihn niemand, bleibt er offen und
  steht im Vollständigkeits-Scan der Sackgasse, in die
  Rückfrage zur Übernahme (unten) kommt er nicht (SP-1
  `Fehlermeldungen.md` §Meta „Zielmarke“).
  **Sackgasse:** Ist die Zwischenmarke Sackgasse, gilt
  die Behebung in ihr nur dort — für einen BUG der
  regulären Linie ein Workaround; nach
  `2.1` kommt sie über die Übernahme (Rückfrage unten)
  oder eine eigene Fix-Anforderung mit `zielmarke:
  2.1` — der echte Fix. Der BUG nennt beide
  Anforderungen in `fix_requirement:`, beide tragen
  `behebt:`; behoben ist ein BUG der regulären Linie
  erst mit der Anforderung
  für `2.1`, und die Release-Notes führen ihn in der
  Sackgasse als Workaround, in `2.1` als Behebung (SP-1
  `Anforderungen.md` „Fehlerbehebungen“,
  [[Katalog-Release-Notes]]). Behebt allein die
  Sackgasse einen BUG der regulären Linie — es folgt
  keine Anforderung der
  regulären Linie —, bleibt es dabei: die Release-Notes
  der Sackgasse führen ihn als Workaround, die der
  regulären Linie nicht; sein Status wechselt nicht, er
  bleibt in der regulären Linie offen und steht im
  Fehlerstand der regulären Marke als offener BUG mit
  Workaround (SP-1 `Fehlermeldungen.md` §Meta
  „Zielmarke“, `Katalog-Fehlerstand`); eine eigene
  Lint-Regel gibt es dafür nicht. **Kein Prozess-Upgrade:**
  Solange eine Zwischenmarke läuft (eine Marke ist
  zurückgestellt), gibt es kein Prozess-Upgrade (Wiki.md
  §11.5); wünscht der Anwender eines, verweist der Agent
  auf die Zeit nach der Rückkehr. **Bevor der Agent eine
  Zwischenmarke anlegt,** (1) **kündigt er an,** dass
  die laufende Marke zurückgestellt wird, dass neue
  Elemente bis zum Wechsel der Zwischenmarke deren
  Marke in `zielmarke:` erhalten, dass jede Freigabe
  ohne Stand-Datei ihre Marke ausdrücklich nennt (auch
  für die Zwischenmarke) und Stände ihre Marke im Kopf
  tragen, dass Arbeit an der zurückgestellten Marke
  diese ausdrücklich nennt, dass die Arbeit am Produkt
  auf einem eigenen Zweig ab dem Tag der Vormarke läuft
  („Tag und Produkt-Repo“ unten), und dass er nach dem
  Wechsel zu ihr zurückkehrt;
  (2) **fragt er bei größeren Anpassungswünschen**
  (mehr als eine Korrektur: eine neue Funktion, eine
  größere Änderung an Produkt oder Spezifikation), ob
  die Arbeit nicht besser auf dem Planweg weitergeht —
  in der laufenden Marke statt in einer Zwischenmarke;
  (3) **fragt er ausdrücklich, ob die Zwischenmarke
  Vorgänger oder Sackgasse ist,** und nennt dabei die
  Folgen beider Fälle (Vorgänger: ihr Inhalt geht in
  die zurückgestellte Marke ein, ihr Zweig wird bei der
  Rückkehr zurückgeführt; Sackgasse: nichts wird
  von selbst übernommen, Elemente der regulären Linie
  werden nur überlagert, vor dem Abschluss folgt die
  Rückfrage zur Übernahme, ihr Zweig bleibt stehen) —
  beide Fragen im
  Frage-Block (MasterPrompt §5.4); erst nach dem OK des
  Anwenders legt er sie an. In Fällen, die diese Regeln
  nicht abdecken (etwa ein Wunsch, der über
  eine Korrektur hinausgeht und trotzdem nicht auf den
  Planweg soll), fragt der Agent den Anwender, statt
  die Regel zu dehnen. **Zweite Korrektur während einer
  Zwischenmarke:** Kommt ein weiterer Korrekturwunsch
  für das Produkt der abgeschlossenen Marke, solange
  die Zwischenmarke läuft, entscheidet die Art: Ist die
  zweite Korrektur von derselben Art wie die
  Zwischenmarke — bei einem Vorgänger ein echter Fix,
  der in der zurückgestellten Marke enthalten sein
  soll; bei einer Sackgasse ein Workaround, der es nicht
  soll —, nimmt der Agent sie **in dieselbe
  Zwischenmarke** auf (neue Elemente mit ihrer
  `zielmarke:`, Ablösung bzw. Überlagerung wie bei der
  ersten Korrektur); er kündigt das an wie beim Anlegen
  (1) und stellt die Planweg-Frage (2), wenn der Wunsch
  über eine Korrektur hinausgeht. Eine Zwischenmarke
  kann so **mehrere Korrekturen** enthalten. Passt die
  Art nicht, folgt die zweite Korrektur als **eigene
  Zwischenmarke** (z.B. `2.0.2`) **nach dem Abschluss**
  der laufenden: Der Agent trägt sie in der Abfolge
  nach der laufenden Zwischenmarke und vor der
  zurückgestellten Marke ein; der Wechsel der ersten
  Zwischenmarke setzt `in-progress` auf die zweite
  statt auf die zurückgestellte Marke (Wechsel-Eintrag
  „Marken-Wechsel von 2.0.1 zu 2.0.2“), und die zweite
  durchläuft die Pflichten (1) bis (3) mit ihrer eigenen
  Antwort auf „Vorgänger oder Sackgasse“. Zwei
  Zwischenmarken laufen nie nebeneinander: genau eine
  Marke ist `in-progress`, höchstens eine
  zurückgestellt (Zeiger oben). Die **zurückgestellte
  Marke bleibt zurückgestellt** bis nach der letzten
  Zwischenmarke; die Klammer ihres Zustands nennt die
  laufende Zwischenmarke, der Agent führt sie mit dem
  Wechsel nach (`zurückgestellt (für 2.0.2)`). Die
  **Rückkehr** ist der Wechsel der letzten
  Zwischenmarke (unten). **Vormarke einer folgenden
  Zwischenmarke:** Ist die vorige Zwischenmarke
  Vorgänger, ist sie die Vormarke der folgenden (Kette
  `2.0` → `2.0.1` → `2.0.2` → `2.1`, wenn auch diese
  Vorgänger ist); ist sie Sackgasse, ist die Vormarke
  die Marke davor — bei einer Sackgasse `2.0.1` ist die
  Vormarke von `2.0.2` die `2.0` —, weil eine Sackgasse
  keine Vormarke ist (Marken-Dreiklang oben).
  Übernahme der Stände und des Tags, Zweig und Geltung
  der `zielmarke:`-Werte folgen dieser Vormarke.
  **Zeile `Zwischenmarke:`** (die Antwort auf Frage
  (3), Format unten): Der Anwender darf sie **ändern,
  solange in der Zwischenmarke noch kein Element
  abgelöst** (`supersedes:` an einem Element mit ihrer
  `zielmarke:`) **oder überlagert** (`ueberlagert:`)
  **ist**; der Agent schreibt dann den neuen Wert in die
  Zeile und hält die vorige Antwort als Vermerk am
  Marken-Eintrag fest (`- **Vermerk <Datum>:**
  Zwischenmarke vormals Sackgasse, geändert <Datum>`) —
  der Eintrag ist `in-progress`, sein Umfang änderbar
  (oben). **Mit der ersten Ablösung oder Überlagerung
  ist die Zeile fest** wie die Bezeichnung der Marke:
  eine Ablösung aus einem Vorgänger wirkt für die
  zurückgestellte Marke und ist endgültig, eine
  Überlagerung gibt es nur in einer Sackgasse — die Spur
  der Antwort steht danach im Bestand. Der Lint liest
  keine Historie; eine spätere Änderung erkennt er am
  Widerspruch zwischen Zeile und Bestand (bei
  `Sackgasse` eine Ablösung über die Sackgassen-Grenze,
  bei `Vorgänger` ein `ueberlagert:`) und meldet sie als
  Hinweis `UEBERLAGERUNG`, der die feste Zeile als
  Ursache nennt. Will der Anwender danach den anderen
  Weg, bleibt die Zeile, und **der Bestand trägt den
  Kurswechsel:** aus einer Sackgasse wird ihr Inhalt per
  Rückfrage übernommen (unten; sie bleibt Sackgasse);
  bei einem Vorgänger, dessen Korrektur nicht in der
  zurückgestellten Marke gelten soll, wird das Element
  der Korrektur dort abgelöst — ein Nachfolger mit der
  `zielmarke:` der zurückgestellten Marke auf dem
  Planweg (er bleibt Vorgänger). **Tag und
  Produkt-Repo:** Die Arbeit einer Zwischenmarke am
  Produkt läuft auf einem **eigenen Zweig** in dem
  Repo, das die Pfade des Produkts trägt (`Facts.md`
  §Allgemeine Fakten; im Zwei-Repo-Fall das
  Produkt-Repo), abgezweigt **am Tag der Vormarke** der
  Zwischenmarke (bei der ersten Zwischenmarke die
  abgeschlossene Marke; bei einer folgenden deren
  Vormarke, oben). Die Namenskonvention des Zweigs
  steht in `Facts.md` neben der Tag-Konvention und den
  Pfaden des Produkts (z.B. `marke/2.0.1`); der Agent
  fragt sie vor der ersten Zwischenmarke ab und bucht
  sie auf Anwender-Angabe, wie die Tag-Konvention. Der
  Tag der Zwischenmarke sitzt auf diesem Zweig; die
  Tag-Mechanik gilt unverändert (Vorgehen.md §4
  „Freigabe per Tag“). Die **Hauptlinie** — der Zweig,
  auf dem die zurückgestellte Marke arbeitet — bleibt
  von der Zwischenmarke unberührt. Bei der Rückkehr
  führt der Agent die Zweige der Zwischenmarken, die
  **Vorgänger** sind, in die Hauptlinie zurück, bevor
  die zurückgestellte Marke weiterläuft; Konflikte legt
  er dem Anwender vor (Frage-Block) und löst sie nicht
  selbst — doppelte Nachfolger im Register sind die
  Register-Seite derselben Lage (unten). Der Zweig einer
  **Sackgasse** wird nicht zurückgeführt; er bleibt mit
  seinem Tag stehen, und was der Anwender auf die
  Rückfrage übernimmt (unten), kommt mit eigenen
  Commits auf dem Planweg in die Hauptlinie. Das gilt
  auch für Projekte ohne Code, deren Produkt in den
  Pfaden des Produkts im selben Repo liegt (etwa der
  Schriftsatz): Zweig, Tag und Zurückführung sind
  dieselben. **Vorgänger** (der Fall einer
  Fehlerbehebung): Die Zwischenmarke reiht sich als
  Vormarke der zurückgestellten Marke ein (`2.0` →
  `2.0.1` → `2.1`), ihr Inhalt ist in ihr enthalten —
  Stände und, bei unverändertem Produkt, der Tag der
  Zwischenmarke werden übernommen, solange sie nicht
  überholt sind; Elemente und Ablösungen mit
  `zielmarke: 2.0.1` gelten ab `2.0.1` und damit auch
  für `2.1` ([[Einfrieren-und-Abloesen]] §Stand,
  §Ablösung). Umgekehrt gilt ein Element, das schon
  den Status `abgelöst` trägt, weil sein Nachfolger die
  `zielmarke:` der zurückgestellten Marke hat, für die
  Zwischenmarke weiter — Vorgänger wie Sackgasse —,
  und ihre Stände führen es: der Status ist eine
  Anzeige der Ablösung, kein Filter für Stände; was in
  einen Stand darf, entscheidet allein, ob ein
  Nachfolger für dessen Marke gilt (Marken-Regel,
  [[Einfrieren-und-Abloesen]] §Stand). Schon gebildete Stände der
  zurückgestellten Marke bleiben gültig; überholt ist
  einer nur nach der Überholt-Regel (ein verwiesenes
  Element ist in der Zwischenmarke abgelöst, oder ein
  Vorgänger-Stand ist überholt) und wird dann als neue
  Version neu abgeleitet — der Lint berechnet das, der
  Agent legt es bei der Rückkehr vor (Schritt 5 oben).
  **Sackgasse** (der Fall eines temporären Workarounds):
  Die Zwischenmarke ist in keiner Folge-Marke
  enthalten; die Vormarke der zurückgestellten Marke
  bleibt die vorige Marke (`2.0`), aus der Sackgasse
  wird nichts von selbst übernommen, Elemente mit
  `zielmarke: 2.0.1` gelten nur für sie. „In der
  Sackgasse“ heißt: mit ihrer `zielmarke:`; ein
  Element, das während der Sackgasse mit der
  `zielmarke:` der zurückgestellten oder einer späteren
  Marke entsteht, ist Arbeit an dieser Marke oder
  Übernahme (unten) und gilt ab ihr. **Überlagern statt
  ablösen:** Ein Element, das außerhalb der Sackgasse
  gilt (mit der `zielmarke:` einer anderen Marke oder
  als Bestands-Element ohne Feld), wird in der
  Sackgasse nicht abgelöst — eine Ablösung ist
  endgültig und nähme es auch der zurückgestellten
  Marke. Der Agent legt stattdessen
  ein neues Element mit `zielmarke: 2.0.1` an, das im
  Frontmatter `ueberlagert: [<ID>]` trägt (Liste wie
  `supersedes:`; das Element hat deshalb einen
  Detail-Knoten) — das ist der Überlagerungs-Vermerk
  „ersetzt <ID> in 2.0.1“; eine Zeile im Text darf ihn
  wiederholen, gelesen wird das Feld. Das überlagerte
  Element bleibt unverändert `aktiv` (kein
  `superseded_by:`, kein Statuswechsel, kein Gegen-Feld)
  und gilt nach der Rückkehr für die zurückgestellte
  Marke wie zuvor; nichts wird zurückgesetzt.
  Kettenprüfung und Lint lesen für die Sackgasse das
  überlagernde Element, für alle anderen Marken das
  überlagerte: ein Stand der Sackgasse verweist nicht
  auf das überlagerte, ein Stand einer anderen Marke
  nicht auf das überlagernde Element (Marken-Regel,
  [[Einfrieren-und-Abloesen]] §Stand). Nur zwischen
  Elementen, die beide `zielmarke: 2.0.1` tragen, wird
  in der Sackgasse gewöhnlich abgelöst. **Überlagerung
  nach einer Freigabe:** Ist ein Stand für die
  Sackgasse schon freigegeben — oder aus der Vormarke
  übernommen — und wird ein Element, das er verweist,
  erst danach für die Sackgasse überlagert, ist der
  Stand nicht überholt (die Überholt-Regel bleibt auf
  Ablösungen bezogen) und kein Fehler: der Lint meldet
  den Hinweis `UEBERLAGERUNG`, und der Agent legt den
  Fall dem Anwender vor (Frage-Block) — eine neue
  Version des Stands für die Sackgasse ableiten (bei
  einem Stand der Sackgasse eine neue Version derselben
  Ketten-ID, deren Freigabe die alte ablöst; bei einem
  übernommenen Stand der Vormarke ein eigener Stand der
  Sackgasse) oder den Stand so belassen (der
  Abschluss-Stand der Sackgasse führt ihn; der Hinweis
  bleibt stehen, er sperrt nichts). Der Anwender
  entscheidet; spätestens stellt der Agent die Frage im
  Vollständigkeits-Scan des Wechsels, zusammen mit der
  Rückfrage zur Übernahme. Die Antwort steht als
  Vermerk am Eintrag der Sackgasse, neben dem Vermerk
  der Übernahme: `- **Vermerk <Datum>:** Überlagerung
  nach Freigabe: <Stand> verweist <ID>, überlagert durch
  <ID> — neue Version <Stand mit Version> | belassen`;
  der Lint liest ihn nicht. Ein Stand, der erst nach
  der Überlagerung mit dem überlagerten Element
  gebildet wird, bleibt ein Fehler der Marken-Regel und
  wird als neue Version neu gebildet, bevor er zur
  Freigabe kommt. **Rückfrage zur
  Übernahme:** Bevor die Sackgasse abgeschlossen ist —
  spätestens im Vollständigkeits-Scan ihres Wechsels
  (Schritt 1 oben) — legt der Agent die Inhalte der
  Sackgasse vor (die überlagernden Elemente mit dem, was
  sie überlagern, und die neuen Elemente) und fragt, ob
  Teile davon in die reguläre Linie übernommen werden
  (Frage-Block, MasterPrompt §5.4). Übernommene Teile
  gehen den Planweg: je ein Element mit `zielmarke:`
  der zurückgestellten Marke — bei einem überlagernden
  Element als gewöhnliche Ablösung **des Elements, das
  in der zurückgestellten Marke gerade gilt** (das
  überlagerte Element oder, wenn die zurückgestellte
  Marke es inzwischen abgelöst hat, dessen für sie
  gültiger Nachfolger), nicht des ursprünglich
  überlagerten — so erhält kein Element zwei für die
  zurückgestellte Marke geltende Nachfolger („Doppelte
  Nachfolger“ unten) — (§Ablösung, wirkt ab der
  zurückgestellten Marke), bei
  einem neuen Element als neues Element — mit
  `vorgaenger: [<Sackgassen-Element>]` als Herkunft
  (Vorgänger ohne Ablösung, [[Katalog]]
  Typ-Konventionen); das Sackgassen-Element bleibt
  unverändert (sein Feld wird nicht umgehängt — ein
  `ueberlagert:` darf nur an einem Element der
  Sackgasse stehen), die Sackgasse bleibt Sackgasse,
  ihr Zweig wird nicht zurückgeführt (oben).
  Auch offene Elemente der Sackgasse nimmt diese
  Rückfrage mit; sie ersetzt für sie das Umhängen im
  Vollständigkeits-Scan (Schritt 1 oben) — nicht einen
  offenen BUG mit der Marke der Sackgasse: er betrifft
  nur den Workaround und gilt in der regulären Linie
  nicht; zeigt sich der Fehler auch am Stand der
  zurückgestellten Marke, ist das eine neue Meldung mit
  deren Marke (SP-1 `Fehlermeldungen.md` §Meta
  „Zielmarke“). Die
  Antwort — auch „nichts übernommen“ — steht als Vermerk
  am Eintrag der Sackgasse: `- **Vermerk <Datum>:**
  Übernahme in 2.1: <ID> → <ID>, …; nicht übernommen:
  <ID>, …`; der Lint liest ihn nicht. Die Einreihung
  steht am Eintrag der Zwischenmarke als Zeile
  `- **Zwischenmarke:** Vorgänger von 2.1` oder
  `- **Zwischenmarke:** Sackgasse` (erstes Wort zählt;
  der Lint liest sie und überspringt eine Sackgasse,
  wenn er für spätere Marken Vormarke, Übernahme und die
  Geltung von `zielmarke:`-Werten bestimmt; wann die
  Zeile änderbar und wann sie fest ist: oben).
  **Doppelte Nachfolger bei der Rückkehr** (nur bei
  einem Vorgänger): Löst in der Zwischenmarke ein
  Element F (mit ihrer `zielmarke:`) ein Element E ab,
  das die zurückgestellte Marke schon durch ein Element
  N (mit ihrer `zielmarke:`) abgelöst hat, gelten für
  die zurückgestellte Marke beide Nachfolger — F ab der
  Zwischenmarke, N ab ihr selbst (§Ablösung). Spätestens
  im Vollständigkeits-Scan der Rückkehr (Schritt 1 oben)
  legt der Agent jedes Element mit zwei Nachfolgern,
  die für dieselbe Marke gelten, mit beiden Nachfolgern
  vor (Frage-Block; bei vielen Punkten Briefing-Modus).
  Der Anwender wählt: **(a) der Stand der
  zurückgestellten Marke gilt** — N löst F ab
  (`supersedes:` an N um F ergänzt; die
  Ablösungs-Felder sind von der Unveränderlichkeit
  ausgenommen, [[Einfrieren-und-Abloesen]] §Freeze);
  die Ablösung wirkt ab der zurückgestellten Marke, für
  die Zwischenmarke bleibt F. **(b) der Fix gilt** — ein
  neues Element mit der `zielmarke:` der
  zurückgestellten Marke trägt den Inhalt von F und
  löst F und N ab (`supersedes: [F, N]`); für die
  Zwischenmarke bleibt F. Ein Element der Zwischenmarke
  löst nachträglich nichts ab: es ist eingefroren, und
  ein Nachfolger trägt die Marke, ab der er gilt.
  **(c) zusammenführen** — ein neues Element mit der
  `zielmarke:` der zurückgestellten Marke löst F und N
  ab (`supersedes: [F, N]`) und trägt den
  zusammengeführten Inhalt; für die Zwischenmarke bleibt
  F. Gebucht wird die Wahl als gewöhnliche Ablösung
  (beidseitig, mit Ablöse-Vermerk, §Ablösung); der
  Status des abgelösten Elements wechselt mit der
  Rückkehr, weil die zurückgestellte Marke dann
  `in-progress` wird. Danach hat E für die
  zurückgestellte Marke genau einen gültigen Nachfolger.
  Der Lint meldet ein Element mit zwei Nachfolgern aus
  verschiedenen Marken (`zielmarke:` verschieden), die
  für dieselbe Marke gelten — gelesen entlang der
  Vormarken-Kette —, als **Fehler `NACHFOLGER-DOPPELT`**,
  bis der Konflikt aufgelöst ist; auch schon während
  der Zwischenmarke, weil die Lage mit der Ablösung in
  ihr entsteht und der Lint keinen Zeitpunkt liest. Kein
  Doppel-Nachfolger sind die Teilung eines Elements in
  mehrere Nachfolger derselben Marke (§Ablösung) und
  zwei Nachfolger, die für verschiedene Marken gelten —
  etwa F in einer Sackgasse und N in der
  zurückgestellten Marke. Einen Bestands-Nachfolger ohne
  `zielmarke:` zählt die Prüfung erst, wenn der Vermerk
  „Ablösung von <E> gilt ab Marke <M>“ seine Marke
  nennt (Bestands-Nachfolger ohne Feld, oben); ohne
  Vermerk ist er nicht vergleichbar. Bei der Übernahme aus einer
  Sackgasse entsteht kein Doppel-Nachfolger, weil das
  übernommene Element das in der zurückgestellten Marke
  gerade gültige Element ablöst (Rückfrage zur Übernahme
  oben). Dieselbe Lage entsteht beim Nachtrag, wenn ein
  Nachfolger-DEPL des Nachtrags ein DEPL ablöst, das die
  laufende Folge-Marke schon selbst abgelöst hat; dort
  gilt dasselbe Verfahren mit der Folge-Marke an der
  Stelle der zurückgestellten Marke („Nachtrag“ unten).
  **Rückkehr:** Die Zwischenmarke wird
  abgeschlossen wie jede Marke (Wechsel-Prozedur oben;
  ihr Vollständigkeits-Scan legt Offenes vor — bei
  einem Vorgänger wird es erledigt oder auf die
  zurückgestellte oder eine spätere Marke verschoben
  (umgehängt, solange es nicht eingefroren ist, sonst
  abgelöst — Schritt 1 oben), und bei der Rückkehr legt
  der Agent doppelte Nachfolger vor (oben);
  bei einer Sackgasse ist das Mitnehmen die Übernahme
  nach der Rückfrage, umgehängt wird nicht; spätestens
  hier stellt der Agent die Rückfrage zur Übernahme und
  die Frage zur Überlagerung nach einer Freigabe);
  Schritt 4
  setzt `in-progress` auf die nächste Marke der
  Abfolge — auf eine folgende Zwischenmarke (zweite
  Korrektur, oben) oder, nach der letzten Zwischenmarke
  als **Rückkehr**, auf die zurückgestellte Marke — und
  `current` auf die Zwischenmarke; der
  Wechsel-Eintrag lautet „Marken-Wechsel von 2.0.1 zu
  2.1“ bzw. „… zu 2.0.2“ (mit `zielmarke: 2.0.1`). Mit
  der Rückkehr läuft die zurückgestellte Marke wieder,
  Marken-Trigger auf sie feuern (oben), und der Zweig
  eines Vorgängers wird zurückgeführt (Schritt 5 oben).
  Der Lint meldet unter anderem als Hinweis: eine
  zurückgestellte Marke ohne Klammer oder ohne
  Zwischenmarke `in-progress`, mehr als eine
  zurückgestellte Marke, eine Zwischenmarke ohne die
  Zeile `Zwischenmarke:` oder mit einem anderen ersten
  Wort, ein Element einer Sackgasse, das ein Element
  außerhalb der Sackgasse ablöst statt es zu
  überlagern, `ueberlagert:` an einem Element ohne die
  `zielmarke:` einer Sackgasse oder auf ein Element
  derselben Sackgasse (beide auch als Spur einer nach
  dem Festwerden geänderten Zeile `Zwischenmarke:`,
  oben), einen Bestands-Nachfolger ohne Feld während
  der Zwischenmarke (`ABLOESUNG-BESTAND`, bis zum
  Vermerk „Ablösung von <E> gilt ab Marke <M>“,
  [[Einfrieren-und-Abloesen]] §Ablösung), und den
  freigegebenen oder
  übernommenen Stand mit nachträglich überlagertem
  Element; als Fehler: einen Stand, der gegen die
  Lesart der Überlagerung verstößt oder die
  `zielmarke:` einer fremden Sackgasse verweist
  (Marken-Regel), ein `ueberlagert:`-Ziel ohne
  Knoten, und ein Element mit zwei für dieselbe Marke
  geltenden Nachfolgern aus verschiedenen Marken
  (`NACHFOLGER-DOPPELT`, oben). Die vollständige Liste
  der Codes: `sh
  _template/tools/lint.sh --help`.
- **Nachtrag zu einer abgeschlossenen Marke** (dieser
  Abschnitt ist der führende Ort der Regel): entsteht
  zu der Marke ein weiterer Deploy-Stand — dieselbe
  Software, in der Kette bis zum Tag der
  Implementierung (beim Koordinator ohne eigene
  Bauteile: bis zu den Lieferungen, [[Kettenpruefung]]
  §Fehlende und vertretene Glieder) nichts geändert;
  für eine **neue Umgebung** oder für eine Umgebung,
  die zu dieser Marke schon einen freigegebenen
  Deploy-Stand hat und **anders ausgerollt** wird
  (unten) —, oder wird ein **Doku-Stand** der Marke
  (Entwickler-Doku, Benutzer-Doku, Betriebs-Anleitung),
  der in der Doku-Abfrage „später“ erhielt, erst nach
  dem Wechsel freigegeben („Nachtrag eines
  Doku-Stands“ unten), wird er als **Vermerk
  am Marken-Eintrag** mit seiner Freigabe gebucht: die
  Freigabe steht als Formel im Nachtrag, wie beim
  Nachtrag „Tag korrigiert“ (unten), nicht als eigener
  Freigabe-Eintrag im Entscheidungs-Register — die Marke
  ist eingefroren, ihr folgen nur Vermerke; der Nachtrag
  löst nichts ab, die Freigaben der Marke bleiben stehen
  (die Ausnahme von „jede Freigabe ist ein Eintrag, die
  erneute löst ab“: [[Entscheidungen]] Meta
  „Freigabe-Einträge“). **Format der Nachtragszeile
  eines Deploy-Stands** (dieser Absatz ist der führende
  Ort des Formats):
  `- **Vermerk <Datum>:** Nachtrag: Stand <Datei mit
  Version> von Deploy-Stand, freigegeben für P13
  Ausliefern zu Marke <M>, freigegeben vom Anwender
  <Datum>[; Nachweise: …][; Einschränkung: …]` —
  `<Datei mit Version>` ist die Stand-Datei mit Version
  (`<Datum> - Deploy-Stand - <Umgebung>_VV_TLA`; sie
  trägt die Umgebung als Gegenstand und ist der Verweis
  des Feld-Sets), gelesen in derselben Form wie im Feld
  „Verweise“ eines Freigabe-Eintrags — Dateiname mit
  Version, mit oder ohne Endung `.md`, auch als
  Wikilink oder als Pfad unter `output/`
  ([[Entscheidungen]] Meta „Freigabe-Einträge“); allein
  die Version `VV_TLA` genügt, wenn genau eine
  Deploy-Stand-Datei sie trägt — (die Zeile folgt der
  Freigabe-Formel aus Vorgehen.md §4: die Stand-Datei
  an der Stelle der Version x, „Deploy-Stand“ an der
  Stelle des Dokumenttyps), der Zweck
  „für P13 Ausliefern“ (SP-1 `Katalog-Deploy-Stand`),
  „zu Marke M“ wiederholt die Marke aus dem Kopf des
  Stands und ist im Nachtrag immer gesetzt, damit er für
  sich lesbar ist; danach die Nachweise des Feld-Sets,
  soweit sie anfallen (`review-report` der
  Kettenprüfung, Testbericht), und eine Einschränkung
  wie im Freigabe-Eintrag (etwa offene BUG). Der Stand
  trägt `marke: M`; eine neue Umgebung ist eine eigene
  Ketten-ID, ein weiterer Stand derselben Umgebung eine
  neue Version ihrer Ketten-ID (unten). Die
  DEPL-Elemente des nachgetragenen Stands — bei einer
  neuen Umgebung ihre DEPL, bei einer anders
  ausgerollten Umgebung die neuen DEPL und die
  Nachfolger abgelöster DEPL der Umgebung —
  tragen `zielmarke: M` — die Marke dessen, was
  ausgerollt wird, nicht die laufende Marke (Pflichtfeld
  `zielmarke:` oben, Ausnahmen; SP-1
  `Katalog-Deployments.md`) —, ebenso eine Entscheidung,
  die nur diese Umgebung betrifft (etwa die Wahl des
  Zielsystems, einer Region oder eines Mandanten für
  sie; ist nicht eindeutig, ob eine Entscheidung nur die
  Umgebung betrifft, fragt der Agent beim Anlegen); so
  gehören sie zum nachgetragenen Stand, gelten ab M für
  die Folge-Marken und ändern an der eingefrorenen Marke
  nichts. Eine Entscheidung, die über die Umgebung
  hinausreicht, trägt die laufende Marke.
  **Doppelte Nachfolger beim Nachtrag** (dieser Absatz
  ist der führende Ort der Regel): Hat die laufende
  Folge-Marke ein DEPL der Umgebung schon selbst durch
  ein eigenes DEPL abgelöst und löst der Nachfolger des
  Nachtrags dasselbe DEPL ab, hat es zwei Nachfolger,
  die beide für die Folge-Marke gelten — der des
  Nachtrags ab M entlang der Kette, der eigene ab der
  Folge-Marke; der Lint meldet den Fehler
  `NACHFOLGER-DOPPELT`, bis der Anwender gewählt hat. Es
  gilt dasselbe Verfahren wie bei doppelten Nachfolgern
  bei der Rückkehr („Zwischenmarke“ oben, Doppelte
  Nachfolger), mit der Folge-Marke an der Stelle der
  zurückgestellten Marke: Der Agent legt das DEPL mit
  beiden Nachfolgern vor, sobald die Lage entsteht —
  mit der Buchung des Nachfolgers im Nachtrag —,
  spätestens im Vollständigkeits-Scan der Folge-Marke
  (Schritt 1 oben; Frage-Block, ohne Vorzugs-Wahl). Der
  Anwender wählt: **(a) der Stand der Folge-Marke
  gilt** — ihr DEPL löst den Nachfolger des Nachtrags ab
  (`supersedes:` ergänzt), die Ablösung wirkt ab der
  Folge-Marke; **(b) der Nachtrag gilt** — ein neues
  DEPL mit der `zielmarke:` der Folge-Marke trägt den
  Inhalt des Nachtrags-Nachfolgers und löst beide ab
  (`supersedes:` mit beiden); **(c) zusammenführen** —
  ein neues DEPL der Folge-Marke mit zusammengeführtem
  Inhalt löst beide ab. Gebucht wird die Wahl als
  gewöhnliche Ablösung ([[Einfrieren-und-Abloesen]]
  §Ablösung); der Status der abgelösten Elemente
  wechselt im selben Zug, weil die Folge-Marke
  `in-progress` ist. Für M bleibt in jedem Fall der
  Nachfolger des Nachtrags: am Nachtrag wird nichts
  abgelöst, der nachgetragene Stand bleibt freigegeben.
  Behebt der weitere Stand
  einen Fehler in der Auslieferung, ist er die Umsetzung
  einer **Fix-Anforderung auf einen Deploy**; sie trägt
  ebenso `zielmarke: M`, nennt die Umgebung in
  `umgebung:`, ist mit der Freigabe des Stands
  umgesetzt und nennt den freigegebenen Stand als
  angehängten Vermerk, weil sie eingefroren ist (SP-1
  `Anforderungen.md` „Fehlerbehebungen“). Braucht
  das Ausrollen eine Änderung an einer Spezifikation oder
  am Produkt — auch eine neue Spezifikation zur
  Pipeline —, ist das kein Nachtrag, sondern eine neue
  Marke (unten). Die Freigabe im Nachtrag wirkt wie jede
  Deploy-Stand-Freigabe: Pflicht-Freigabe der Umgebung
  für Lint und Vollständigkeits-Scan; Zeitpunkt und
  Form der Betriebs-Anleitung dieser Umgebung
  entscheidet die mit der Vorlage des Deploy-Stands
  nachgestellte Zeile der Doku-Abfrage
  ([[Kettenpruefung]] §Kette, Doku-Abfrage), nicht die
  Freigabe; ihre Zeilen-DEC trägt `zielmarke: M` wie
  jede Entscheidung, die nur diese Umgebung betrifft.
  **Nachtrag eines Doku-Stands** (dieser Absatz ist der
  führende Ort des Formats): Wird eine Entwickler-Doku,
  Benutzer-Doku oder Betriebs-Anleitung, die in der
  Doku-Abfrage „später“ erhielt, nach dem Marken-Wechsel
  zu M freigegeben, steht ihre Freigabe in derselben
  Form:
  `- **Vermerk <Datum>:** Nachtrag: Stand <Datei mit
  Version> von <Dokumentname>, freigegeben für <Zweck>
  zu Marke <M>, freigegeben vom Anwender <Datum>[;
  Nachweise: …][; Einschränkung: …]` — ⟨Artefakt⟩ ist
  der Dokumentname des Katalog-Eintrags
  (Entwickler-Doku, Benutzer-Doku, Betriebs-Anleitung),
  der Zweck „für P13 Ausliefern“ bzw. „für P15
  Betreiben“; die Stand-Datei einer Betriebs-Anleitung
  trägt die Umgebung als Gegenstand wie der
  Deploy-Stand (`<Datum> - Betriebs-Anleitung -
  <Umgebung>_VV_TLA`). Nachweise: `review-report` der
  Kettenprüfung, M6-Bericht, Testbericht. Der Stand
  trägt `marke: M`; der Abschluss-Stand bleibt und ist
  durch ihn nicht überholt; der Nachtrag zählt für Lint
  und Vollständigkeits-Scan als Pflicht-Freigabe des
  Doku-Glieds (bei der Betriebs-Anleitung der
  Umgebung); kein Meilenstein-Anlass, kein Auslöser der
  Release-Notes. Vor dem Wechsel wäre dieselbe Freigabe
  ein gewöhnlicher Freigabe-Eintrag. Der Lint erkennt
  die Freigabe im Nachtrag an der
  Formel, ordnet sie der Marke des Eintrags zu, zählt
  sie als Pflicht-Freigabe P13 und als Freigabe des
  Stands und erwartet keine abgelöste Freigabe; einen
  Nachtrag zu einem Deploy-Stand ohne Formel, eine Formel
  ohne „Nachtrag:“ am Anfang, eine andere Marke, eine
  fehlende Stand-Datei (in keiner der Schreibweisen
  oben vorhanden) und einen zusätzlichen eigenen
  Freigabe-Eintrag für denselben Stand meldet er als
  Hinweis. **Umgebung mit freigegebenem Deploy-Stand**
  (dieser Absatz ist der führende Ort der Regel): Zu
  einer Marke kann es beliebig viele Deploy-Stände
  geben — für neue Umgebungen und für dieselbe
  Umgebung, so oft sie anders ausgerollt wird; je
  Umgebung gilt der jüngste. Hat eine Umgebung zu der
  Marke schon einen freigegebenen Deploy-Stand —
  regulär vor dem Wechsel als Freigabe-Eintrag oder im
  Nachtrag —, gilt: Wird das Produkt der Marke in
  dieser Umgebung erneut ausgerollt, ohne dass sich am
  Ausrollen etwas ändert (etwa nach einem Neuaufbau der
  Infrastruktur), ist das **Betrieb** — kein neuer
  Deploy-Stand, keine Freigabe, kein Nachtrag; der
  freigegebene Deploy-Stand beschreibt das Ausrollen
  weiter, und die Betriebs-Anleitung bleibt die
  Anleitung dafür. Wird die Umgebung **anders
  ausgerollt** — Konfiguration, Zielsystem oder Ablauf,
  also das, was die DEPL-Elemente der Umgebung und der
  Deploy-Stand beschreiben —, entsteht ein **weiterer
  Deploy-Stand derselben Umgebung** mit eigener
  Freigabe: nach dem Abschluss der Marke als weiterer
  Nachtrag (weitere Nachtragszeile im Format oben,
  neben dem früheren Freigabe-Eintrag oder der früheren
  Nachtragszeile der Umgebung; der neue Nachtrag muss
  den älteren Stand nicht nennen), vor dem Abschluss
  als neue Version mit eigenem Freigabe-Eintrag, der den
  früheren ablöst ([[Entscheidungen]] Meta
  „Freigabe-Einträge“, Neu-Stand; löst das andere
  Ausrollen ein DEPL ab, ist der frühere Stand überholt
  und die neue Version seine Antwort,
  [[Einfrieren-und-Abloesen]] §Überholt-Regel — gebucht
  in dieser Reihenfolge: Nachfolger-DEPL, neuer Stand,
  Nachtragszeile; dazwischen meldet der Lint den
  überholten Stand, bis der neue Stand ihn ablöst). Ob eine
  Änderung am Eintrag der Umgebung in der
  Entitäts-Fassade der Zielumgebungen (Provider, Hosts,
  Versionen, Verweise auf Zugangsdaten) ein anderes
  Ausrollen ist oder Pflege ohne neuen Stand, legt das
  Template nicht fest — das entscheidet der Anwender je
  Fall; der Agent weist bei einer solchen Änderung
  darauf hin, dass ein weiterer Deploy-Stand möglich
  ist, und fragt (SP-1 `Zielumgebungen.md` §Meta). Eine
  Patch-Marke braucht es dafür
  nicht: Sie gibt es nur, wenn sich das Produkt ändert
  — Code oder Spezifikation (unten). Der weitere Stand
  ist eine **neue Version derselben Ketten-ID**
  (`<Datum> - Deploy-Stand - <Umgebung>_VV_TLA`, `VV`
  zählt hoch, `marke: M`, eigenes `datum:`): Je
  Umgebung und Marke gibt es eine Ketten-ID — Stände
  eines Dokumenttyps unterscheiden sich innerhalb einer
  Marke durch ihren Gegenstand, derselbe Gegenstand ist
  dieselbe Ketten-ID ([[Einfrieren-und-Abloesen]]
  §Stand, Dateiname) —, und „je Umgebung der jüngste“
  ist die jüngste Version je Ketten-ID, die Lint und
  Register-Wächter ohnehin lesen; nach dem Abschluss
  der zuletzt gebuchte Nachtrag der Umgebung (das Datum
  der Vermerk-Zeile, bei gleichem Datum die spätere
  Zeile; ein Nachtrag ist stets jünger als ein
  Freigabe-Eintrag vor dem Wechsel). Die ältere Version
  bleibt freigegeben und zitierfähig; nach dem Abschluss
  wird nichts abgelöst — kein `supersedes:` im Nachtrag,
  kein `superseded_by:` an einem Freigabe-Eintrag der
  Marke —, weil die Marke eingefroren ist. Eine eigene
  Ketten-ID je weiterem Stand derselben Umgebung gibt
  es nicht: Sie hielte die ältere Ketten-ID als jüngste
  Version im Lesebereich von Marken-Regel und
  Überholt-Regel, und sobald ein DEPL der Umgebung
  durch einen Nachfolger mit `zielmarke: M` abgelöst
  ist, stünde der ältere Stand dauerhaft als Fehler.
  **Der Abschluss-Stand ist durch die neue Version
  nicht überholt:** Er nennt die ältere Version des
  Deploy-Stands in `herkunft` und bleibt eingefroren —
  auch wenn ein Nachfolger-DEPL mit `zielmarke: M` die
  ältere Version für M überholt, wird er nicht neu
  gebildet und seine Freigabe nicht abgelöst. Lint und
  Vollständigkeits-Scan lesen Abschluss-Stand und
  Nachtrag zusammen: Der Verweis in `herkunft` liest
  sich auf den Deploy-Stand der Umgebung, dessen jüngste
  Version die im Nachtrag freigegebene ist — wie der
  Nachtrag „Tag korrigiert“ die Tag-Namen einander
  zuordnet und die Nachweise mit dem alten Namen
  unverändert lässt (unten); die Antwort auf die
  überholte ältere Version ist die jüngere Version
  selbst ([[Einfrieren-und-Abloesen]] §Überholt-Regel,
  ältere Version nach dem Nachtrag). Vor dem Abschluss
  bleibt es beim Neu-Stand: Dort wird ein Stand, der
  den überholten Deploy-Stand nennt, neu gebildet
  (Wechsel-Prozedur Schritt 3).
  Die Übernahme in die Folge-Marke (Wechsel-Prozedur
  Schritt 5) legt je Umgebung den jüngsten Stand vor.
  Der Lint liest je Umgebung den jüngsten Deploy-Stand
  (die Umgebung aus `umgebung` im Kopf der Stand-Datei,
  sonst aus dem Gegenstand des Dateinamens), zählt die
  Pflicht-Freigabe P13 der Umgebung einmal und meldet
  eine Nachtragszeile für eine Umgebung mit
  freigegebenem Deploy-Stand nicht; eine zweite
  Ketten-ID für dieselbe Umgebung zu der Marke nennt er
  als Hinweis (Form: neue Version), liest die Zeile aber
  als Freigabe; den Abgleich „dieselbe Freigabe im
  Nachtrag und als eigener Eintrag“ führt er über die
  Stand-Datei, nicht über die Version — zwei Umgebungen
  mit derselben Version sind kein Doppel. Nennt ein Freigabe-Eintrag
  eines Deploy-Stands keine eindeutige Stand-Datei —
  mehrere Deploy-Stände verschiedener Umgebungen tragen
  die Version, und kein Feld des Eintrags nennt die
  Datei (Feld-Set „Verweise“, [[Entscheidungen]] Meta
  „Freigabe-Einträge“) —, meldet der Lint das als
  Hinweis: Der Doppel-Abgleich bleibt für den Eintrag
  ungeprüft. Der
  Abschluss-Stand bleibt
  unverändert, Lint und Vollständigkeits-Scan lesen
  Abschluss-Stand und Nachtrags-Vermerke zusammen (der
  Lint liest von den Nachträgen den Nachtrag „Tag
  korrigiert“ und die Nachtragszeile eines
  Deploy-Stands oder eines Doku-Stands). **Keine Freigabe im Nachtrag ist ein
  Meilenstein-Anlass** und keine löst eine T2-Runde
  aus (mit SP-1: `Meilenstein-und-T2`) — die Marke ist
  abgeschlossen, ihr Meilenstein Marken-Abschluss mit
  dem Wechsel erreicht, am Produkt ändert sich nichts.
  Ändern sich Produkt
  (bei Software der Code) oder Spezifikation (z.B.
  die Behebung eines Fehlers im Produkt, eine neue
  Spezifikation zur
  Pipeline), ist es eine neue Marke — immer; die
  Patch-Marke ist davon der Fall der Korrektur. Ein
  anderes Ausrollen bei unverändertem Produkt ist keine
  neue Marke, sondern ein weiterer Deploy-Stand im
  Nachtrag (oben) — auch wenn es einen Fehler in der
  Auslieferung behebt (Fix-Anforderung auf einen
  Deploy, oben). Beim
  Koordinator wird der Abschnitt „Zuliefernde
  Komponenten“ nach dem Abschluss ebenso als
  Nachtrags-Vermerk geführt. **Nachtrag „Tag
  korrigiert“** (mit und ohne Prozess; dieser Absatz ist
  der führende Ort des Formats): Stellt sich nach dem
  Marken-Wechsel heraus, dass der Tag der Marke auf dem
  falschen Commit sitzt, prüft der Agent, ob sich die
  Pfade des Produkts (`Facts.md` §Allgemeine Fakten)
  zwischen dem alten und dem neuen Tag unterscheiden.
  **Gleicher Inhalt:** Der Agent setzt den neuen Tag
  nach dem OK des Anwenders, der alte bleibt (ein Tag
  wird nie verschoben, Vorgehen.md §4), und bucht am
  Marken-Eintrag den Nachtrag
  `- **Vermerk <Datum>:** Tag korrigiert: <alt> → <neu>,
  Inhalt unverändert — freigegeben vom Anwender
  <Datum>`. **Mit Prozess** enthält der Nachtrag dazu
  die neue Tag-Freigabe zu derselben Marke in der Formel
  der Freigabe per Tag (Vorgehen.md §4):
  `- **Vermerk <Datum>:** Tag korrigiert: <alt> → <neu>,
  Inhalt unverändert — Stand <neu> von Implementierung,
  freigegeben für P10 Testen zu Marke <M>, freigegeben
  vom Anwender <Datum>`; der Nachtrag ist der Träger
  dieser Freigabe — einen eigenen Freigabe-Eintrag im
  Entscheidungs-Register gibt es nicht, und die alte
  Tag-Freigabe dort bleibt stehen und wird nicht
  abgelöst (die Marke ist eingefroren, ihr folgen nur
  Vermerke; es gibt keinen neuen Stand, den die
  Freigabe ablösen könnte; der Abschluss-Stand bleibt;
  ein Stand, der den alten Tag-Namen in `herkunft`
  trägt, ist dadurch nicht überholt — die Ausnahme von
  „jede Freigabe ist ein Eintrag, die erneute löst ab“:
  [[Entscheidungen]] Meta „Freigabe-Einträge“). Der Lint
  liest die Tag-Freigabe im Nachtrag an der Formel als
  Tag-Freigabe der Marke und erwartet keine abgelöste
  Tag-Freigabe; fehlt die Formel mit Prozess,
  gibt er einen Hinweis. Der Abschluss-Stand bleibt
  eingefroren —
  keine neue Version, keine neue Freigabe —; Lint und
  Vollständigkeits-Scan lesen Abschluss-Stand und
  Nachtrag zusammen: der Tag der Marke ist der des
  jüngsten Nachtrags. **Anderer Inhalt:** Die Korrektur
  gehört in eine Patch-Marke mit eigenem Tag und eigenem
  Abschluss-Stand — läuft schon eine Folge-Marke, als
  Zwischenmarke (oben). Vor dem Wechsel ist eine
  Tag-Korrektur ohne Prozess eine neue Version des
  Abschluss-Stands (Wechsel-Prozedur Schritt 3), mit
  Prozess ein neuer Tag mit neuer Freigabe, die die alte
  ablöst (Vorgehen.md §4).
- **Bestand:** abgeschlossene Marken aus der Zeit vor
  Template-Stand 2.0 haben keinen Abschluss-Stand; der
  Lint gibt für eine abgeschlossene Marke ohne
  Abschluss-Stand einen Hinweis, keinen Fehler (er kann
  Marken nicht datieren; die Pflicht sichern
  Vollständigkeits-Scan und Wechsel-Prozedur).
- **Freigaben:** Die Marke einer Freigabe mit
  Stand-Datei trägt der Stand in seinem Kopf; der
  Zusatz „zu Marke X" wiederholt sie nur und steht bei
  der Buchung, wenn die Marke des Stands nicht die
  `in-progress`-Marke ist (Vorgehen.md §4,
  [[Kettenpruefung]] §Regel) — die Sicherung leistet
  die Wechsel-Prozedur. **Eine Freigabe ohne
  Stand-Datei nennt die Marke immer** — die Freigabe
  per Tag wie jede andere: ihr Eintrag ist die einzige
  Quelle ihrer Marke, eine ungenannte Marke gibt es bei
  Freigaben nicht (Vorgehen.md §4; der Lint meldet eine
  Freigabe ohne Stand-Datei und ohne Marke als Fehler).
  Das Pflichtfeld `zielmarke:` eines Freigabe-Eintrags
  nennt dieselbe Marke — die Marke der Freigabe, nicht
  ohne Weiteres die beim Buchen laufende
  ([[Entscheidungen]] Meta
  „Freigabe-Einträge“; eine Abweichung meldet der Lint
  als Hinweis).
- **Abgrenzungen:** **Version** meint den
  `_VV_TLA`-Dateistand, **Stand** das abgeleitete
  Dokument — beides bleibt unberührt; eine
  Marken-Bezeichnung „1.1" und eine Produkt-Version
  „v1.1.0" sind zwei verschiedene Dinge, auch wenn
  SemVer-artig benannt.
  **Fristen** sind pflichtbezogene Termine mit
  Verfalls-Semantik (due-Datum, „Abgelaufen");
  Zielmarken sind Planungs-Horizonte ohne Verfall.
- **Pflege:** bei Marken-Anlage (auch einer
  Zwischenmarke, auch der ersten Marke nach einer
  Ruhe), Zuordnung, Zeiger-Wechsel, Ruhe-Zeile;
  Commit-Präfix `Zielmarken:`.

---

**Bearbeitungsstand:** Vorbelegt beim Starter-Bau — die
erste Marke ist die Übernahme-Marke
`Uebernahme-JJJJ-MM-TT`, die die Migration anlegt
(`_template/migration/MIGRATION.md` Phase 1).

## Marken

_(in geplanter Abfolge; vom Agenten bei der
Erst-Definition in der Migration gefüllt)_
