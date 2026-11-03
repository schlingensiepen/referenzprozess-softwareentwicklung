---
type: decision-log
active: true   # kann nicht deaktiviert werden — Entscheidungen ist Pflicht-Fassade (mandatory)
---

# Entscheidungen

## Meta

- **Typ:** `decision-log` — Register aller
  Entscheidungen des Projekts (universeller
  Mechanismus: jedes Projekt dokumentiert
  Entscheidungen). Singleton, Pflicht-Fassade in
  jedem Projekt (Wiki.md §3a): hier werden auch
  Freigaben, die Freigabe des Abschluss-Stands und
  der Marken-Wechsel gebucht ([[Zielmarken]] §Meta).
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei
  Entscheidungs-Status liegt in dieser Fassade —
  Detail-Knoten (Typ `decision`) spiegeln
  (Wiki.md §1.1a).
- **Eintritts-Register:** ein DEC kommt erst mit
  Anwender-OK ins Register, direkt als `angenommen`;
  `offen`, `aufgeschoben` und Auslöser gibt es hier
  nicht. Wohin eine nicht getroffene oder
  zurückgestellte Entscheidung gehört (nach [[Ideen]])
  und auf welchen Registern Wächter und Marken-Trigger
  arbeiten: [[Einfrieren-und-Abloesen]]
  §Eintrittsregel — lesen, bevor eine Entscheidung
  zurückgestellt wird.
- **Eintragsformat:** `### DEC-NNN — <Gegenstand>` mit
  Feldern Status (angenommen | in-umsetzung |
  umgesetzt | abgeschlossen | verworfen | abgelöst) /
  Datum (letzter Statuswechsel) / Angelegt
  (Anlage-Datum, Pflichtfeld seit 2.0 — bei einem
  Eintrag ohne Detail-Knoten die Zeile
  `- **Angelegt:** JJJJ-MM-TT`, sonst `datum:` im Kopf
  des Detail-Knotens; wird nie geändert, [[Katalog]]
  §Typ-Konventionen) / Zielmarke
  ([[Zielmarken]]; Pflichtfeld, kanonisch hier — beim
  Anlegen die `in-progress`-Marke, für eine spätere
  Marke Geplantes diese Marke; ein Freigabe-Eintrag
  trägt die Marke der Freigabe, ein
  Marken-Wechsel-Eintrag die abgeschlossene Marke —
  unten) / Wahl und
  Begründung / Verweise / Nachbarschaft (die geprüften
  Nachbarn, Kollisions-Grep unten) / Detail (Wikilink,
  nur wenn Detail-Knoten existiert). Die Felder stehen
  als Zeilen `- **Feld:** Wert` unter der Überschrift,
  bei einem Eintrag ohne Detail-Knoten auch Angelegt
  und Zielmarke (so liest sie der Lint); mit
  Detail-Knoten steht Zielmarke als Anzeige ebenfalls im
  Eintrag — dieselbe Feldzeile, der Lint liest sie und
  prüft sie gegen den Knoten ([[Zielmarken]] §Meta
  „Sitz“) —, z.B.
  `- **Status:** angenommen — **Datum:** JJJJ-MM-TT`,
  `- **Angelegt:** JJJJ-MM-TT` und
  `- **Zielmarke:** 1.0`; ein bei der Buchung
  vergessenes `Zielmarke` heilt der angehängte Vermerk
  `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)`
  am Eintrag, den der Lint wie das Feld liest
  ([[Zielmarken]] §Meta „Heilweg“). Bei `abgelöst` steht der
  Verweis nur im Feldpaar `supersedes:`/`superseded_by:`.
- **Freigabe-Einträge** (dieser Absatz ist der
  führende Ort ihres Aufbaus; Wortlaut der Formel,
  Tag-Fall, Zweck-Katalog und Marken-Koordinate:
  `Vorgehen.md` §4, lesen vor der Buchung einer
  Freigabe). Ein Freigabe-Eintrag ist ein DEC-Eintrag
  im Eintragsformat oben:
  - **Gegenstand** ist die Freigabe-Formel (Wortlaut:
    `Vorgehen.md` §4), **wörtlich eingehalten**: sie
    ist zugleich das Kennzeichen, an dem der Lint
    einen Freigabe-Eintrag erkennt und daraus Stand
    mit Version bzw. Tag-Name, Dokumenttyp, Zweck und
    Marke liest ([[Kettenpruefung]] §Lint-Anteil);
    eine Abweichung vom Wortlaut meldet er (Schwere
    dort). Es gibt kein eigenes Feld für Freigaben und
    keine Detail-Knoten-Pflicht über die Fälle unten
    hinaus.
  - **Verweise:** die Stand-Datei in `output/` mit
    Version — als Dateiname mit Endung `.md`, als Text
    ohne Wikilink (`output/` liegt außerhalb von
    `wiki/`; ein Wikilink mit Endung ist ein toter
    Link), z.B. `2026-10-20 - Deploy-Stand -
    Produktion-EU_01_ABC.md`; daran liest der Lint die
    Datei, auch ohne die Endung, und unterscheidet bei
    Deploy-Ständen mit derselben Version die Umgebung
    ([[Kettenpruefung]] §Lint-Anteil) — (beim Tag der
    Implementierung statt dessen
    der Tag-Name und die Nachweise des Tags: der
    `review-report` der Kettenprüfung des Glieds P9 —
    das Code-Review — und, soweit das Produkt
    automatisiert Prüfbares hat, Tests grün —
    [[Kettenpruefung]] §Code-Glieder) und, wenn ein
    Pflicht-Stand freigegeben wird, der
    `review-report` der Kettenprüfung (nicht beim
    Abschluss-Stand, der nur auf Vollständigkeit
    geprüft wird, [[Kettenpruefung]] §Regel) und bei
    den drei Doku-Ständen der Kette (Entwickler-Doku,
    Benutzer-Doku, Betriebs-Anleitung; mit SP-1) der
    Bericht des Verständnis-Checks M6
    (`Reviewmuster.md`); Prüfer
    und Reife stehen dort.
  - **Wahl und Begründung:** das Ergebnis der
    Kettenprüfung. Eine **Einschränkung** steht
    ausdrücklich da, je nach Fall: **fehlender
    Vorgänger** — ein früherer Pflicht-Stand fehlt
    ohne Verzicht und der Anwender gibt trotzdem frei
    ([[Kettenpruefung]] §Kette, Freigabe-Ordnung als
    Warnung); **„Doku folgt“** — ein Doku-Glied P11
    oder P12 fehlt ohne Verzicht und der Deploy-Stand
    wird trotzdem freigegeben ([[Kettenpruefung]]
    §Kette, Doku-Glieder); **„Teil-Doku <Komponente>
    fehlt“** — die Entwickler-Doku einer Komponente ist
    „später“ oder verzichtet und der Koordinator gibt
    seine Gesamtsicht trotzdem frei ([[Kettenpruefung]]
    §Freigabe-Ordnung des Koordinators); **offene BUG** — der
    Testbericht weist
    nicht Bestandenes aus und der Anwender gibt
    trotzdem für P13 oder einen Doku-Stand frei
    ([[Kettenpruefung]]
    §Code-Glieder); **Prüf-Modell = Bau-Modell** — die
    Prüfung lief im Ein-Modell-Weg (`Reviewmuster.md`
    §2 Schleife 2). Ebenso eine Notfall-Freigabe
    (`Reviewmuster.md` §1).
  - **Zielmarke:** die Marke der Freigabe — mit
    Stand-Datei die `marke` aus dem Kopf des Stands,
    ohne Stand-Datei die Marke aus „zu Marke M“; beide
    Angaben nennen dieselbe Marke, nicht ohne Weiteres
    die beim Buchen laufende (`in-progress`-)Marke. So
    gehört eine
    während einer Zwischenmarke gebuchte Freigabe für
    die zurückgestellte Marke zu dieser, und ihre
    Ablösung einer älteren Freigabe (Neu-Stand, unten)
    wirkt ab ihr ([[Einfrieren-und-Abloesen]]
    §Ablösung). Weicht das Feld von der Marke der
    Freigabe ab, meldet der Lint einen Hinweis.
  - **Neu-Stand:** seine Freigabe löst die alte per
    `supersedes:` ab ([[Einfrieren-und-Abloesen]]
    §Überholt-Regel) — wird derselbe Gegenstand erneut
    freigegeben, ist das ein neuer Eintrag, der den
    früheren ablöst; eine Freigabe wird nur durch die
    Freigabe eines neuen Stands abgelöst, beim Tag durch
    die Freigabe eines neuen Tags vor dem Marken-Wechsel.
    Die Ablösung steht im
    Frontmatter beider Elemente (Wiki.md §1.1a);
    ablösende und abgelöste Freigabe tragen deshalb
    einen Detail-Knoten.
  - **Ausnahme „Nachtrag zu einer abgeschlossenen
    Marke“:** Jede Freigabe, die nach dem Marken-Wechsel
    zu einer abgeschlossenen Marke gehört, steht als
    Formel im Nachtrag am Marken-Eintrag dieser Marke
    ([[Zielmarken]] §Meta, Nachtrag — die Formate stehen
    dort), nicht als eigener Freigabe-Eintrag. Der
    Nachtrag ist der Träger der Freigabe, weil die Marke
    abgeschlossen und eingefroren ist und ihr nur noch
    Vermerke folgen. Der Nachtrag löst nichts ab — kein
    `supersedes:` im Nachtrag, kein `superseded_by:` an
    einem Freigabe-Eintrag der Marke —, die Freigaben
    der Marke bleiben stehen, der Abschluss-Stand bleibt
    unverändert. Drei Fälle: **(a) Tag-Korrektur** —
    wird der Tag der Marke nach dem Wechsel bei gleichem
    Inhalt der Pfade des Produkts korrigiert, steht die
    neue Tag-Freigabe zu derselben Marke im Nachtrag
    „Tag korrigiert“; die frühere Tag-Freigabe wird
    nicht abgelöst, es gibt keinen neuen Stand, den sie
    ablösen könnte. **(b) Nachgetragener Deploy-Stand**
    — entsteht zu der Marke ohne Änderung in der Kette
    ein weiterer Deploy-Stand (dieselbe Software in
    einer neuen Umgebung oder in einer Umgebung, die
    anders ausgerollt wird; je Umgebung gilt der
    jüngste), steht seine Freigabe in der
    Nachtragszeile des Stands; sie wirkt wie jede
    Deploy-Stand-Freigabe (Pflicht-Freigabe der Umgebung
    für Lint und Vollständigkeits-Scan; Zeitpunkt und
    Form der Betriebs-Anleitung dieser Umgebung
    entscheidet die Doku-Abfrage, [[Kettenpruefung]]
    §Kette). **(c) Doku-Stand „später“** — wird ein
    Doku-Stand der Kette (Entwickler-Doku, Benutzer-Doku,
    Betriebs-Anleitung), der in der Doku-Abfrage
    „später“ erhielt, erst nach dem Wechsel freigegeben,
    steht seine Freigabe in derselben Form in der
    Nachtragszeile des Stands (Nachweise: `review-report`
    der Kettenprüfung, M6-Bericht, Testbericht); sie
    zählt als Pflicht-Freigabe des Doku-Glieds. Der Lint
    erkennt
    die Freigabe im Nachtrag an der Formel, ordnet sie
    der Marke des Eintrags zu und erwartet keine
    abgelöste Freigabe. Eine Freigabe im Nachtrag ist
    kein Meilenstein-Anlass (mit SP-1:
    `Meilenstein-und-T2`). Vor dem Wechsel bleibt es beim
    Neu-Stand (oben): jede Freigabe ein Eintrag, die
    erneute löst ab.
  - **Keine verworfenen Alternativen:** eine Freigabe
    ist keine Wahl zwischen Lösungen; die Felder oben
    sind vollständig (der Pflichtteil unten gilt hier
    nicht).
  - **Ordner-Freigabe** (MasterPrompt §1.1, Quelle (a)
    nach dem Init): ein DEC-Eintrag ohne Stand-Datei und
    ohne die Formel — der Lint liest ihn nicht; der
    Gegenstand nennt den freigegebenen Ordner (daran
    findet der Struktur-Wächter C6 die Buchung);
    `zielmarke:` ist die beim Buchen laufende
    (`in-progress`-)Marke, im Init die erste Marke; der
    Pflichtteil „Verworfene Alternativen“ gilt nicht
    (unten).
- **Marken-Wechsel-Einträge:** Der Wechsel des
  `in-progress`-Zeigers (Schritt 4 der
  Wechsel-Prozedur, [[Zielmarken]] §Meta) wird als
  DEC-Eintrag im Eintragsformat oben gebucht:
  Gegenstand „Marken-Wechsel von <A> zu <B>“ (nach
  einer Zwischenmarke ist B eine folgende Zwischenmarke
  oder, bei der Rückkehr, die zurückgestellte Marke;
  fehlt eine künftige Marke und ruht das Projekt,
  lautet der Gegenstand „Marken-Wechsel von <A>; Projekt
  ruht“ ohne B — [[Zielmarken]] §Meta);
  Verweise: der freigegebene Abschluss-Stand von A mit
  Version und sein Freigabe-Eintrag; Zielmarke: die
  abgeschlossene Marke A (der Eintrag ist ihr
  Abschluss-Akt; bei der Rückkehr aus einer
  Zwischenmarke also die Zwischenmarke); Begründung: das
  Ergebnis des Vollständigkeits-Scans in einem Satz
  (verschobene Punkte mit Ziel-Marke). Wie die Freigabe
  ist der Wechsel keine Wahl zwischen Lösungen — der
  Pflichtteil unten gilt nicht. Der Lint liest den
  Eintrag nicht; die Zeiger liest er aus den Zeilen
  `Zustand:` in [[Zielmarken]].
- **Verzichts-Einträge:** Lässt der Anwender eine
  Phase mit Pflicht-Stand für eine Marke bewusst aus
  (`Vorgehen.md` §1), wird das als DEC mit
  `decision_type: verzicht`, `zielmarke:` (die Marke)
  und `phase: Pn` (die ausgelassene Phase — genau
  eine je DEC) gebucht;
  ohne diese Felder gilt kein Verzicht. Für P9 gibt es
  keinen Verzicht (der Tag markiert das Produkt in
  jedem Projekt, [[Kettenpruefung]] §Kette); eine DEC
  mit `phase: P9` ist kein Verzicht, der Lint meldet
  sie (ebenda §Lint-Anteil). Der Verzicht auf die
  Betriebs-Anleitung (`phase: P15`) gilt **je
  Umgebung**: die DEC trägt zusätzlich `umgebung:` mit
  dem Namen der Umgebung aus der Entitäts-Fassade der
  Zielumgebungen (dasselbe Feld wie DEPL), je Umgebung
  eine DEC; `phase: P15` ohne `umgebung:` ist kein
  Verzicht, der Lint meldet einen Hinweis. Bei den
  Doku-Gliedern P11, P12 und P15 ist der Verzicht die
  Zeile „gar nicht (Verzicht)“ der Doku-Abfrage; die
  übrigen Zeilen-DECs der Abfrage (jetzt, später,
  Übernahme) sind gewöhnliche Entscheidungen
  ([[Kettenpruefung]] §Kette, Doku-Abfrage —
  Gegenstand und Buchung). Der Eintrag
  nennt wie jeder DEC die Begründung und die
  verworfene Alternative (die Phase doch zu führen).
  Was der Verzicht in der Kette bewirkt und wann kein
  Verzicht nötig ist, weil ein Glied abgeleitet
  entfällt oder vertreten wird: [[Kettenpruefung]]
  §Fehlende und vertretene Glieder — lesen, bevor ein
  Verzicht gebucht wird. **Ohne Prozess** gibt es
  keine Phasen und darum keinen Verzicht mit
  `phase:`; der einzige Verzicht dort ist der auf
  „Tests grün“ als Vorbedingung des Tags
  ([[Kettenpruefung]] §Kette, Projekt ohne Prozess):
  eine DEC mit `decision_type: verzicht` und
  `zielmarke:` (die Marke), **ohne** `phase:`, deren
  Gegenstand „Tests grün“ nennt und deren Begründung
  die Folge benennt. Der Lint liest diesen Verzicht
  nicht und meldet ihn ohne Prozess nicht.
- **Kollisions-Grep vor Anlage** (Lese-Pflicht,
  MasterPrompt §9): vor
  jeder neuen Entscheidung das Register nach
  thematisch verwandten Einträgen durchsuchen; der
  neue Eintrag nennt die geprüften Nachbarn
  (Nachbarschafts-Zeile); widerspricht er einem
  bestehenden, wird erst geklärt (Ablösung oder
  Vermerk), dann gebucht — nie beides stehen
  lassen.
- **Detail-Knoten-Pflicht:** sobald verworfene
  Alternativen, Vermerke, Nachweise oder ausführliche
  Wahl-Begründung anfallen. Einzeilige Einträge
  brauchen keinen Detail-Knoten.
- **`decision`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder (Pflicht und Kann, Werte von
  `decision_type`): [[Katalog-Entscheidungen]] — lesen
  beim Anlegen eines DEC-Knotens. Sektionen:
  Entscheidung (gewählte Option und Begründung) /
  Verworfene Alternativen / Nachweis (bei
  abgeschlossen mit Umsetzungsarbeit) / Verweise /
  Vermerke (append-only) / Bezüge (Fassaden-Eintrag
  [[Entscheidungen]]). Dateiname
  `DEC-NNN <Gegenstand>.md`.
- **Freeze und Ablösung:** Mechanismus und Ausnahmen
  führt [[Einfrieren-und-Abloesen]] (Abschnitte Freeze
  und Ausnahmen, Ablösung; dort auch die Form des
  sichtbaren Ablöse-Vermerks) — lesen vor einer
  Ablösung.
- **Vermerk-Praxis:** ein Vermerk **präzisiert** nur;
  Präzisierungs-Vermerke sind immer zulässig, vor und
  nach der Umsetzung, Korrektur-Vermerke gibt es
  nicht. Was eine Entscheidung **ändert**, wird eine
  neue DEC, die die alte vollständig ablöst
  (`supersedes:`); was sie **erweitert**, ohne dass sie
  sich danach anders liest, eine neue DEC mit
  `extends:` als Rückverweis. Das gilt unabhängig vom
  Umsetzungs-Status; der Bestand bleibt.
- **Eine Entscheidung je DEC:** ein DEC enthält genau
  eine Entscheidung; mehrere voneinander unabhängige
  Entscheidungen werden mehrere DECs — so bleibt die
  vollständige Ablösung billig, und ein Eintrag muss
  nie teilweise gelten.
- **Verworfene Alternativen als Pflichtteil:** jeder
  DEC außer einem Freigabe-Eintrag (dazu zählen auch
  die Ordner-Freigaben nach MasterPrompt §1.1, die der
  Prozess-Merge automatisch bucht) und einem
  Marken-Wechsel-Eintrag (oben) benennt die
  ernsthaft betrachteten Optionen und
  begründet je verworfener Option, warum sie es nicht
  geworden ist — sonst wird die verworfene Lösung
  später erneut vorgeschlagen.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

Eine chronologische Liste — keine Trennung offen /
getroffen, der Status trägt die Unterscheidung.

## Einträge

_(chronologisch nach ID)_
