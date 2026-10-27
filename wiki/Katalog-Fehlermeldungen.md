---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Fehlermeldungen

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`bug-report-log` ([[Fehlermeldungen]]) mit Element-Typ
`bug-report`. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### bug-report-log

- **Zweck:** Register aller Fehlermeldungen
  (BUG-Register; Meldungen, nicht Arbeit)
- **Pflichtfelder:** `type: bug-report-log`
- **Präfix:** `BUG`
- **Datei:** `wiki/Fehlermeldungen.md`
- **Singleton**

### bug-report

- **Zweck:** einzelne Fehlermeldung — die Meldung, dass
  ein existierender Produkt-Stand sich falsch verhält,
  aus dem Betrieb oder aus einem Test (`gefunden_in`);
  Detail-Knoten für den BUG-Eintrag im Register; über
  die Behebung wird getrennt entschieden
  (Fix-Anforderung, `fix_requirement`); der Meldungskern
  (Beobachtet, Erwartet, Reproduktionsschritte) ist ab
  Meldung eingefroren, „Analyse und Eingrenzung“ wird
  nur angehängt
- **Klasse:** Element
- **Freeze ab:** Anlage
- **Sammelzustand:** ja (`offen` = gemeldet, nicht
  bestätigt; `angenommen` = bestätigt)
- **Pflichtfelder:** `type: bug-report`, `id`
  (Format `BUG-NNN`), `status`, `status_date`,
  `datum` (seit 2.0) (Anlage-Datum `JJJJ-MM-TT`, nie
  geändert; [[Katalog]] §Typ-Konventionen),
  `zielmarke` (seit 2.0) (Marken-Bezeichnung: die
  Marke der Meldung = die Marke des Produkt-Stands, an
  dem der Fehler beobachtet wurde — bei einer Meldung
  aus dem Betrieb die `marke` des Deploy-Stands der
  Umgebung, in der er auffiel ([[Katalog-Deploy-Stand]]),
  bei einem Testbefund die `marke` des Testberichts in
  `gefunden_in` ([[Katalog-Testberichte]]); ist sie nicht
  eindeutig, fragt der Agent beim Anlegen — nie die
  laufende Marke: eine Herkunftstatsache, die Ausnahme
  vom Satz „beim Anlegen die `in-progress`-Marke“;
  eingefroren ab Anlage; die Marke der Behebung trägt
  die Anforderung in `fix_requirement`, unten;
  Bestand ohne Feld: [[Zielmarken]] §Meta; Regel im
  Prozess: [[Fehlermeldungen]] §Meta „Zielmarke“)
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung; nur bei `aufgeschoben`),
  `supersedes`
  (Liste), `superseded_by` (Liste; bei Duplikaten mit
  Vermerk „Duplikat“), `ueberlagert` (Liste; nur an
  einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste; Bestand vor
  2.0: `BR-NNN`),
  `fix_requirement` (Liste `[REQ-NNN, …]`, sobald eine
  Anforderung angelegt ist, die den BUG behebt — am
  eingefrorenen BUG ergänzt, wie die Ablösungs-Felder
  eine Ausnahme vom Freeze, [[Einfrieren-und-Abloesen]]
  §Freeze und Ausnahmen; jede
  solche Anforderung: die Fix-Anforderung, ein REQ mit
  `requirement_type: fix`, [[Katalog-Anforderungen]];
  oder, wenn die Lösung eine geänderte oder neue
  Anforderung ist, diese REQ (`functional` bzw.
  `non-functional`, Ablösung oder neue Anforderung) —
  jede trägt `behebt:` zurück, und die Release-Notes
  führen den BUG unter der Marke jeder Anforderung der
  Liste — außer bei einer Fix-Anforderung auf einen
  Deploy: dann in keinen Release-Notes,
  [[Katalog-Release-Notes]]; in der Regel eine, mehrere bei einem Workaround
  in einer Sackgasse und einem echten Fix in der
  regulären Linie — behoben ist ein BUG der regulären
  Linie erst mit der Anforderung der regulären Linie,
  ein BUG mit der Marke einer Sackgasse mit der
  Anforderung dieser Sackgasse ([[Anforderungen]]
  „Fehlerbehebungen“); ein einzelner Wert
  `fix_requirement: REQ-NNN` bleibt zulässig und liest
  sich als Liste mit einem Eintrag; die `zielmarke:`
  jeder Anforderung ist die Marke der Behebung und liegt
  nicht vor der Marke der Meldung — ohne Ausnahme, auch
  nicht in einer Zwischenmarke; eine Fix-Anforderung auf
  einen Deploy (Fehler in der Auslieferung, behoben
  durch einen weiteren Deploy-Stand) trägt die Marke der
  Meldung selbst, und ein BUG, den allein solche
  Anforderungen beheben, wird mit ihnen `abgeschlossen`,
  wenn der Anwender die Behebung bestätigt,
  [[Anforderungen]] „Fehlerbehebungen“;
  Lint-Fehler, soweit die
  Marken vergleichbar sind: eine Sackgasse ist nur für
  sich eine frühere Marke, [[Zielmarken]] §Meta),
  `gefunden_in` (Liste: Testbericht und TEST-ID; die
  `marke` des Testberichts ist die Marke der Meldung —
  weicht `zielmarke` ab, meldet der Lint einen
  Hinweis), `quelle` (bei Buchung aus
  einer Nachricht eines anderen Repos:
  `<absender>/MSG-NNN`, [[Katalog-message]])
- **Dokumenttypen:** [[Katalog-Fehlerstand]],
  [[Katalog-Release-Notes]]
- **Beispielname:** `BUG-001 Login-Timeout nach 5 Minuten.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Fehlermeldungen.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Fehlermeldungen]].
