---
type: bug-report-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Fehlermeldungen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `bug-report-log` — Register aller
  Fehlermeldungen des Projekts (setzt ein gebautes
  Ding plus Nutzung voraus). Singleton, ID-Präfix
  `BUG-NNN`; Einträge aus der Zeit vor 2.0 mit dem
  Präfix BR tragen ihre alte ID als `alias: BR-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei
  Fehlermeldungs-Status liegt in dieser Fassade —
  Detail-Knoten (Typ `bug-report`) spiegeln
  (Wiki.md §1.1a).
- **Meldungen, nicht Arbeit:** das Register führt
  Meldungen — die Reparatur läuft als Fix-Anforderung
  im `wiki/Anforderungen.md`-Register (REQ mit
  `requirement_type: fix` im Abschnitt
  „Fehlerbehebungen“, [[Anforderungen]]; Zusatzfeld
  `Fix-Anforderung: REQ-NNN, …` hier — eine Liste, die
  jede Anforderung nennt, die den BUG behebt; die ID
  ohne Wikilink oder als
  `[[REQ-NNN <Kurzsatz>|REQ-NNN]]`, wie `Behebt:`, denn
  `[[REQ-NNN]]` löst im flachen `wiki/` nicht auf —,
  `behebt:` dort).
  So bleibt die BUG-Liste eine saubere Meldungsliste,
  keine Aufgabenliste. Deshalb setzt diese Fassade die
  Fassade [[Anforderungen]] voraus: wer kein
  Anforderungs-Register hat, braucht keine
  Fehlermeldungen — ist Fehlermeldungen aktiv, ist
  Anforderungen Pflicht (der Lint meldet die Fassade
  ohne ihre Voraussetzung als Fehler).
- **Zielmarke** (dieser Absatz ist der führende Ort der
  Regel im Prozess): `zielmarke:` eines BUG ist die Marke
  der Meldung — die Marke des Produkt-Stands, an dem der
  Fehler beobachtet wurde. Bei einer **Meldung aus dem
  Betrieb** ist das die Marke des Deploy-Stands der
  Umgebung, in der er auffiel (`marke` im Kopf des
  Stands, [[Katalog-Deploy-Stand]]); bei einem
  **Testbefund** die `marke` des Testberichts, auf den
  `gefunden_in:` zeigt ([[Testberichte]]) — der getestete
  Tag gehört zu dieser Marke, auch wenn er während einer
  Zwischenmarke aus der Arbeit an der zurückgestellten
  Marke stammt ([[Zielmarken]] §Meta, Zwischenmarke).
  Ist die Marke nicht eindeutig — eine Beobachtung ohne
  Deploy-Stand und ohne Testbericht, mehrere Umgebungen
  mit verschiedenen Marken —, fragt der Agent beim
  Anlegen (Frage-Block); er rät nicht und schreibt nicht
  die laufende Marke hinein: die Marke eines BUG ist eine
  Herkunftstatsache wie die Marke an abgeleiteten
  Nachweisen, keine Planungsaussage, und die Ausnahme vom
  Satz „beim Anlegen die `in-progress`-Marke“
  ([[Zielmarken]] §Meta, Pflichtfeld `zielmarke:`). In
  der Regel nennt sie eine ausgelieferte, abgeschlossene
  Marke; die Meldung ändert an der nichts — wegen der
  Meldung kein Nachtrag, kein neuer Stand. Die Behebung
  gehört zur nächsten Marke der Kette, wenn der Fehler
  im Produkt liegt; liegt er in der Auslieferung — im
  Ausrollen einer Umgebung, das Produkt in Ordnung —,
  ist sie ein weiterer Deploy-Stand derselben Umgebung,
  nach dem Abschluss ein Nachtrag zur Marke der Meldung
  (Fix-Anforderung auf einen Deploy, [[Anforderungen]]
  „Fehlerbehebungen“). Eingefroren ab Anlage. Der BUG gilt ab
  seiner Marke für alle späteren Marken der
  Vormarken-Kette; der Vollständigkeits-Scan jedes
  Marken-Wechsels legt ihn vor, solange er offen ist
  ([[Zielmarken]] §Meta, Wechsel-Prozedur Schritt 1). Ein
  BUG, der am Stand einer Sackgasse beobachtet wird,
  trägt ihre Marke, ist ein Fehler des Workarounds und
  gilt nur für die Sackgasse ([[Katalog-Fehlerstand]]):
  ihn behebt eine Anforderung derselben Sackgasse —
  Status wie bei jedem BUG (unten), in den
  Release-Notes der Sackgasse eine Behebung —, sonst
  bleibt er offen und steht im Scan der Sackgasse; eine
  Anforderung der regulären Linie braucht er nicht,
  weil er für sie nicht gilt. Die Rückfrage zur
  Übernahme nimmt ihn nicht mit — er wird nicht
  übernommen; zeigt sich der Fehler auch am Stand der
  zurückgestellten Marke, ist das eine neue Meldung mit
  deren Marke. Die Marke der Behebung trägt
  jede Anforderung, die ihn behebt — die Fix-Anforderung
  oder, wenn die Lösung eine geänderte oder neue
  Anforderung ist, diese REQ (`Fix-Anforderung: REQ-NNN,
  …` bzw. `fix_requirement:` nennt jede von ihnen,
  [[Anforderungen]] „Fehlerbehebungen“) —, und sie liegt
  nicht vor der Marke der Meldung, ohne Ausnahme: eine
  Behebung vor der Meldung gibt es nicht. Ein am Stand
  von `2.0` beobachteter BUG darf in einer Zwischenmarke
  `2.0.1` behoben werden wie in `2.1`; ein am Tag von
  `2.1` beobachteter nicht in `2.0.1` ([[Zielmarken]]
  §Meta, Zwischenmarke). Behoben
  ist der BUG mit der Anforderung **seiner Linie** — der
  Linie, zu der seine Marke gehört: er wechselt auf
  `umgesetzt`, wenn eine Anforderung in
  `fix_requirement:` `umgesetzt` ist, die für seine
  Marke gilt, und danach nach der Status-Achse auf
  `abgeschlossen` ([[Register-Lebenszyklus]]). Für einen
  BUG der regulären Linie ist das die Anforderung der
  regulären Linie; eine Anforderung in einer Sackgasse
  ist für ihn ein Workaround, der ihn dort umgeht
  ([[Anforderungen]] „Fehlerbehebungen“) und seinen
  Status nicht ändert — behebt allein eine Sackgasse
  einen BUG der regulären Linie, bleibt er dort `offen`
  bzw. `angenommen` und steht im Fehlerstand der
  regulären Marke als offener BUG mit Workaround
  ([[Katalog-Fehlerstand]]). Für einen BUG mit der Marke
  einer Sackgasse ist es die Anforderung mit der Marke
  dieser Sackgasse (oben). Ein BUG wird nicht auf eine
  andere Marke verschoben ([[Zielmarken]] §Meta,
  Wechsel-Prozedur); Release-Notes führen ihn unter der
  Marke jeder Anforderung, die ihn behebt — für einen
  BUG der regulären Linie in einer Sackgasse als
  Workaround, in der regulären Marke als Behebung; für
  einen BUG mit der Marke der Sackgasse dort als
  Behebung ([[Katalog-Release-Notes]]). Einen BUG, den
  eine Fix-Anforderung auf einen Deploy behebt (Fehler
  in der Auslieferung), führen keine Release-Notes;
  dokumentiert ist diese Behebung im Nachtrag am
  Marken-Eintrag, hier am BUG und als angehängter
  Vermerk an der Fix-Anforderung (sie ist eingefroren,
  ihr Feld Verweise ändert sich nicht), der Fehlerstand
  führt ihn mit seinem Status; `umgesetzt` ist er mit
  der Freigabe des Stands, `abgeschlossen` — zusammen
  mit der Fix-Anforderung — mit der Bestätigung des
  Anwenders, dass der Fehler behoben ist, nach der der
  Agent zu dem bei der Freigabe vereinbarten Zeitpunkt
  fragt; bleibt sie aus, folgt eine weitere
  Fix-Anforderung auf einen Deploy am selben BUG
  ([[Anforderungen]] „Fehlerbehebungen“).
- **Sammel-Register, eingefroren ab Anlage:** eine
  Meldung ist `offen` (gemeldet, nicht bestätigt),
  bis sie `angenommen` (bestätigt) ist. Der
  Meldungskern (Beobachtetes Verhalten, Erwartetes
  Verhalten, Reproduktionsschritte) ist ab der Meldung
  eingefroren; „Analyse und Eingrenzung“ wird nur
  angehängt ([[Einfrieren-und-Abloesen]]).
- **Duplikat:** zwei Meldungen desselben Fehlers
  werden per `superseded_by:` mit Vermerk „Duplikat“
  zusammengeführt; eine Neuformulierung ist nicht
  nötig.
- **Herkunft aus Tests:** eine Meldung aus einem
  Testdurchgang nennt per `gefunden_in:` den
  Testbericht und die TEST-ID ([[Testberichte]],
  [[Testfaelle]]); sie trägt die `marke` des
  Testberichts als Zielmarke (oben) — weicht sie ab,
  meldet der Lint einen Hinweis.
- **Eintragsformat:** `### BUG-NNN — <Beobachtetes
  Verhalten in einem Satz>` mit Feldern Status
  (8-Zustand) / Datum (letzter Statuswechsel) /
  Angelegt (Anlage-Datum `JJJJ-MM-TT`, Pflichtfeld
  seit 2.0 am Eintrag ohne Detail-Knoten, sonst
  `datum:` im Detail-Knoten; nie geändert —
  [[Katalog]] §Typ-Konventionen) /
  Zielmarke ([[Zielmarken]]; Pflichtfeld, kanonisch
  hier — die Marke der Meldung, d.h. die Marke des
  Produkt-Stands, an dem der Fehler beobachtet wurde,
  oben; mit Detail-Knoten
  ebenfalls als Feldzeile im Eintrag, [[Zielmarken]]
  §Meta „Sitz“; ein vergessenes Feld
  heilt der Vermerk „Zielmarke <M> (nachgetragen)“,
  [[Zielmarken]] §Meta „Heilweg“) / Auslöser (nur bei
  aufgeschoben) / Fix-Anforderung
  (REQ-NNN, … — die ID ohne Wikilink oder als
  `[[REQ-NNN <Kurzsatz>|REQ-NNN]]`, wie Behebt; sobald
  angelegt — jede Anforderung, die den BUG behebt) /
  Duplikat von (BUG-NNN, ohne Wikilink oder als
  `[[BUG-NNN <Kurzsatz>|BUG-NNN]]`, nur bei
  Zusammenführung) / Gefunden in
  (TRES und TEST-ID, nur aus Tests) / Grund (bei
  verworfen) / Detail (Wikilink, nur wenn
  Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** sobald
  Reproduktionsschritte, Analyse-Notizen oder Vermerke
  anfallen — bei komplexen Fehlern mit
  Reproduktions-Setup fast immer.
- **`bug-report`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Fehlermeldungen]] —
  lesen beim Anlegen eines `bug-report`-Knotens.
  Sektionen: Beobachtetes Verhalten /
  Erwartetes Verhalten / Reproduktionsschritte /
  Analyse und Eingrenzung / Verweise (Fix-Anforderung,
  Duplikat von — als `superseded_by:`, betroffenes
  Requirement bei
  Regression) / Vermerke (append-only) / Bezüge
  (Fassaden-Eintrag [[Fehlermeldungen]]). Dateiname
  `BUG-NNN <Beobachtetes Verhalten in einem Satz>.md`.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

Eine chronologische Liste.

## Einträge

_(chronologisch nach ID)_
