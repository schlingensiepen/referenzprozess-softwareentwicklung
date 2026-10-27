---
type: test-report-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Testberichte

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — das
Register der Testberichte belegt die Testdurchgänge
nach dem Testplan der Phase P10.

## Meta

- **Typ:** `test-report-log` — Register aller
  Testberichte (TRES) dieses Repos. Singleton,
  ID-Präfix `TRES-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Nachweis, eingefroren ab Anlage:** ein Testbericht
  wird nie abgelöst und nie geändert; Nachträge stehen
  als angehängte Vermerke
  ([[Einfrieren-und-Abloesen]] §Klassen). Ein neuer
  Durchgang ist ein neuer Testbericht.
- **Gegenstand:** der Durchgang nach einem
  freigegebenen Testplan-Stand ([[Katalog-Testplan]]) —
  je Testfall (TEST-ID) das Ergebnis `bestanden`,
  `nicht bestanden` oder `blockiert`, wer und wann.
  Ein nicht bestandener Testfall erzeugt einen
  Eintrag in [[Fehlermeldungen]] mit `gefunden_in:`
  auf diesen Testbericht und die TEST-ID.
- **Herkunft:** Marke und Herkunft trägt der
  Testbericht im Kopf (Testplan-Stand, Tag der
  Implementierung, Kopie des Test-Setups) — Felder
  und Format: [[Einfrieren-und-Abloesen]] §Stand;
  lesen beim Anlegen eines Testberichts. Die Herkunft
  ist zugleich die Angabe zur Reproduzierbarkeit.
- **Wofür er gebraucht wird:** die Freigabe von P10
  nach P11 hängt am Testbericht
  ([[Kettenpruefung]] §Code-Glieder).
- **Nicht Bestandenes:** Weist der Testbericht nicht
  bestandene oder blockierte Testfälle aus, legt der
  Agent die Freigabe für P11 trotzdem vor — mit dem
  Testbericht und den offenen BUG; der Anwender
  entscheidet ([[Berichten-statt-Blockieren]]). Gibt
  er trotz offener BUG frei, nennt der
  Freigabe-Eintrag die offenen BUG als Einschränkung
  (`## Meta` von [[Entscheidungen]],
  Freigabe-Einträge). Dabei bietet der Agent einen
  Fehlerstand an ([[Katalog-Fehlerstand]]); er bleibt
  optional. Bei einer Komponente ohne eigenes P11 und
  bei P11 ohne Zielumgebung: [[Kettenpruefung]]
  §Code-Glieder.
- **Abgrenzung:** wie Testläufe ohne Testplan und
  normale Läufe belegt werden: Testergebnis-Regel in
  der `## Meta` von [[Systemtest-Setup]] — lesen,
  bevor ein Lauf außerhalb des Testplans belegt wird.
- **Eintragsformat:** `### TRES-NNN — <Durchgang>` mit
  Feldern Status (`angenommen` ab Anlage, ohne weitere
  Übergänge, [[Register-Lebenszyklus]]) / Datum /
  Marke / Testplan-Stand /
  Ergebnis kurz (bestanden, nicht bestanden,
  blockiert je Anzahl) / Detail (Wikilink).
- **`test-report`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Testberichte]] — lesen
  beim Anlegen eines `test-report`-Knotens. Sektionen:
  Durchgang (wer, wann, Umgebung) / Ergebnisse je
  TEST-ID / Fehlermeldungen (erzeugte BUG) / Vermerke
  (append-only) / Bezüge (Fassaden-Eintrag
  [[Testberichte]]). Dateiname
  `TRES-NNN <Durchgang>.md`.

---

**Bearbeitungsstand:** _(vom Agenten bei jedem Testdurchgang nach
Testplan gepflegt)_

## Testberichte

_(chronologisch nach ID; vom Agenten beim ersten
Testdurchgang gefüllt)_
