---
type: internal-concept
---

# Register-Lebenszyklus

**Ich bin neu in SP-1** — mitgebrachter Mechanik-Knoten
(SP-1-Steckbrief §„Mitgebrachte Mechanik"; Einführung
beim Merge nach Wiki.md §11.3). Wortlaut aus der
SP-1-Prozess-Definition (`index.md` §4.1) hierher
verlagert; dort steht die Kurzform.

Dieser Knoten beschreibt nur die **Status-Achse** der
Register-Elemente. Freeze, Ablösung und die Bildung
von Ständen stehen einmal im Base-Knoten
[[Einfrieren-und-Abloesen]]; dort gilt: Freeze
betrifft den Inhalt, nicht die Status-Achse — ein
eingefrorenes Element wechselt weiter seinen Status.

**Geltungsbereich:** alle Ketten-Register (REQ, BUG,
FUNC, ARC, SPEC, TEST/TRES, DEPL, CON) und auf gleichem
Muster DEC, IDEA, NEED und SCEN in der Basis.

**Zustände nach Register-Art:**

- **Sammel-Register mit `aufgeschoben`** (REQ, BUG,
  IDEA, NEED, SCEN):
  `offen` → `aufgeschoben` → `angenommen` → `in-umsetzung` →
  `umgesetzt` → `abgeschlossen` → `verworfen` →
  `abgelöst`. Bei `aufgeschoben` steht zusätzlich
  `Auslöser:` (Datum oder Marke) im Fassaden-Eintrag;
  der Register-Wächter C5 und die Marken-Trigger
  arbeiten nur hier.
- **Sammel-Register ohne `aufgeschoben`** — die
  beschreibenden Register (FUNC, ARC, SPEC, TEST,
  DEPL): `offen` → `angenommen` → `in-umsetzung` →
  `umgesetzt` → `abgeschlossen` → `verworfen` →
  `abgelöst`. `offen` ist der Vorstatus eines
  bearbeitbaren Elements; die Annahme geschieht
  einzeln oder im Freigabe-Zug des ersten Stands, der
  es verweist ([[Einfrieren-und-Abloesen]]
  §Eintrittsregel; Ablauf: [[Lebenslauf-eines-Stands]]).
  `aufgeschoben`, `Auslöser:` und Wächter gibt es hier
  nicht.
- **Eintritts-Register** (DEC, CON): beginnen bei
  `angenommen`; `offen`, `aufgeschoben` und `Auslöser:`
  gibt es nicht.
- **Nachweis-Register** (TRES): ein Testbericht ist
  ab Anlage eingefroren und steht von der Anlage an
  auf `angenommen`; weitere Übergänge gibt es nicht,
  weil ein Nachweis nie abgelöst wird. Das Ergebnis
  steht je TEST-ID im Bericht.
- **Umgesetzt** ist, was am Tag der Implementierung
  hängt; **geprüft** ist, was ein Testbericht (TRES)
  belegt ([[Kettenpruefung]]). Eine Fix-Anforderung auf
  einen Deploy ist umgesetzt mit der Freigabe des
  weiteren Deploy-Stands ihrer Umgebung — Eintrag oder
  Nachtragszeile — statt mit dem Tag ([[Anforderungen]]
  „Fehlerbehebungen“). Ein BUG wechselt auf
  `umgesetzt`, wenn die Anforderung seiner Linie in
  `fix_requirement:` umgesetzt ist — für einen BUG der
  regulären Linie die der regulären Linie, für einen
  BUG mit der Marke einer Sackgasse die dieser
  Sackgasse —, und danach auf `abgeschlossen`; ein
  Workaround in einer Sackgasse für einen BUG der
  regulären Linie ändert dessen Status nicht
  ([[Fehlermeldungen]] §Meta „Zielmarke“). Einen BUG,
  den allein Fix-Anforderungen auf einen Deploy beheben,
  und diese Fix-Anforderungen schließt die Bestätigung
  des Anwenders ab, dass der Fehler behoben ist — beide
  im selben Zug, mit demselben `status_date`
  ([[Anforderungen]] „Fehlerbehebungen“).

Die Statuswerte sind in den Register-Fassaden-Einträgen
Pflicht (Fassaden-Wahrheit, siehe
[[Register-Grundmuster]]). `status_date` trägt das
Datum des letzten Statuswechsels. `abgelöst` ist ein
Status-Wert; der Verweis auf den Nachfolger
steht nur im Feldpaar `supersedes:`/`superseded_by:`
im Frontmatter beider Elemente — dort ist die Ablösung
kanonisch, die Fassade spiegelt sie, der Lint meldet
Drift in beide Richtungen. `status` und `status_date`
bleiben kanonisch an der Fassade.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-1)`)
- Kern-Kurzform: SP-1-`index.md` §4.1
- Kanonizitäts-Muster: [[Register-Grundmuster]]
- Freeze, Ablösung, Stand: [[Einfrieren-und-Abloesen]]
