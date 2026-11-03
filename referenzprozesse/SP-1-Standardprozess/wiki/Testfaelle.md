---
type: test-case-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Testfälle

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — das
Register der Testfälle speist den Testplan der Phase
P10 „Testen“.

## Meta

- **Typ:** `test-case-log` — Register aller Testfälle
  (TEST) dieses Repos. Singleton, ID-Präfix
  `TEST-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Gegenstand:** System- und Anwendertests mit
  Ablauf und Erwartung; jeder Testfall nennt per
  `prueft:`, welche Anforderungen,
  Funktionsbeschreibungen oder Spezifikationen er
  prüft (Anwendertests dürfen auf ein Szenario
  zeigen). **Pflicht nur für System- und
  Anwendertests;** Unit- und Integrationstests bleiben
  Code. Integrationstests dürfen als Testfall geführt
  werden, wenn eine Projekt-Regel in
  [[InterneMechanik]] das festlegt.
- **Abgrenzung:** das **Test-Setup** (wie geprüft wird:
  Testarten, Umgebung, Ausführung) steht lebend in
  [[Systemtest-Setup]]; der **Testplan** ist kein
  Wiki-Knoten, sondern der Stand über die Testfälle
  einer Marke ([[Katalog-Testplan]]); das Ergebnis
  eines Durchgangs steht in [[Testberichte]].
- **Eintritt und Lese-Klammer:** Testfälle dürfen
  jederzeit entstehen, auch vor dem Tag der
  Implementierung; der Agent legt sie als `offen` an,
  sie bleiben bearbeitbar, bis sie einzeln angenommen
  werden oder mit der Freigabe des Testplan-Stands,
  der sie verweist, und sind ab dann eingefroren
  ([[Einfrieren-und-Abloesen]] §Eintrittsregel). Bis
  zur Bildung des Testplans ist diese Fassade die
  Lese-Klammer der Phase P10
  ([[Lebenslauf-eines-Stands]]). Für einen
  neuen Testplan wird ein Testfall abgelöst,
  weggelassen oder ergänzt.
- **Kanonizität:** die Wahrheit beim Status liegt in
  dieser Fassade — Detail-Knoten (Typ `test-case`)
  spiegeln (Wiki.md §1.1a, [[Register-Grundmuster]]).
- **Eintragsformat:** `### TEST-NNN — <Kurzsatz>` mit
  Feldern Testart / Prüft (IDs) / Status +
  status_date / Angelegt (Anlage-Datum `JJJJ-MM-TT`,
  Pflichtfeld seit 2.0 am Eintrag ohne Detail-Knoten,
  sonst `datum:` im Detail-Knoten; [[Katalog]]
  §Typ-Konventionen) / Zielmarke ([[Zielmarken]];
  Pflichtfeld, kanonisch hier) /
  Detail (Wikilink, nur wenn Detail-Knoten existiert).
- **`test-case`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Testfaelle]] — lesen
  beim Anlegen eines `test-case`-Knotens. Sektionen:
  Vorbedingung /
  Ablauf / Erwartung / Vermerke (append-only) /
  Bezüge (Fassaden-Eintrag [[Testfaelle]]). Dateiname
  `TEST-NNN <Kurzsatz>.md`.

---

**Bearbeitungsstand:** _(vom Agenten bei Anlage und laufend
gepflegt)_

## Testfälle

_(chronologisch nach ID; vom Agenten beim ersten
Testfall gefüllt)_
