---
type: target-mark-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Zielmarken

## Meta

- **Typ:** `target-mark-log` — Register der
  **Zielmarken**: benannte Planungs-Horizonte des
  Projekts (Versionen wie „1.0", Ereignis-Marken wie
  „Nach der Revision", Etappen). Produkt- und
  Projektplanung in einer Mechanik. Singleton.
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
  genau gemeint ist (z.B. welche Revision). Die
  Eintrags-Reihenfolge ist die geplante Abfolge.
- **Zwei Zeiger:** genau eine Marke trägt
  **`current`** (zuletzt abgeschlossene/geltende),
  genau eine **`in-progress`** (daran wird
  gearbeitet); übrige Marken sind künftig oder
  abgeschlossen. Die Zeiger führt diese Fassade;
  `devstate_active.md` (mit SP-1) referenziert die
  `in-progress`-Marke nur. Die Zeiger-Führung liegt
  außerhalb der §1.1a-Mechanik (devstate ist eine
  Root-Session-Datei, kein Detail-Knoten).
- **Zuordnungs-Feld `zielmarke:`** an planbaren
  Register-Einträgen (idea, requirement, bug-report,
  decision; prozess-mitgebracht z.B. specification,
  testplan, contract): Wert = Bezeichnung der Marke.
  **Opt-in-Regel: das Feld steht nur, wenn etwas
  aktiv auf eine spätere Marke verschoben oder von
  vornherein für eine Marke geplant ist — ohne Feld
  gilt der Eintrag als aktuell bzw. in Arbeit.**
  Nachweis-Typen (z.B. document, event,
  agent-report, research-artifact) tragen das Feld
  nicht. **Sitz:** das Feld lebt im Frontmatter des
  Detail-Knotens; wo ein Fassaden-Eintrag ohne
  Detail-Knoten existiert, als Klammer-Zusatz in
  der Fassaden-Zeile — kanonisch ist der
  Fassaden-Eintrag (Wiki.md §1.1a).
- **Marken-Trigger:** das `trigger:`-Feld
  aufgeschobener Einträge akzeptiert neben einem
  Datum auch eine Marken-Bezeichnung — der
  Register-Wächter reaktiviert den Eintrag, wenn
  die Marke `in-progress` wird („für 2.0 vertagt"
  heißt schlafen gelegt mit Wecker).
- **Marken-Wechsel-Prozedur** (Wechsel des
  `in-progress`-Zeigers; zugleich
  Wächter-T2-Ereignis, mit SP-1):
  1. **Vollständigkeits-Scan** der abzuschließenden
     Marke: offene zugeordnete Einträge — explizit
     per `zielmarke:`-Feld oder implizit ohne Feld
     (Opt-in-Regel) — als Register- und TODO-Punkte
     vorlegen — erledigen, mitnehmen
     oder auf eine spätere Marke verschieben
     (Anwender-Entscheid je Punkt).
  2. **Freigabe-Fixierungs-Prüfung per Subagent**
     (Standard-Beauftragungs-Rahmen, MasterPrompt
     §5.6): kein neuer Freigabe-Mechanismus — der
     Wechsel ist ein zusätzlicher **Auslöser** der
     bestehenden Freigabe-Bezugsprüfung. Der
     Subagent schlägt vor, welche Freigaben auf die
     abgeschlossene Marke zu **fixieren** sind (sie
     galten im Kontext der alten Marke und würden
     durch neue Arbeit implizit invalidiert),
     welche weitergelten und welche zu erneuern
     sind. Anwender entscheidet; Regelfall der
     Fixierung ist ein **append-only-Vermerk** im
     Freigabe-Eintrag (Unveränderlichkeit gewahrt),
     ein formaler Ablöse-Eintrag nur bei
     substantieller Wirkung.
  3. **Zeiger nachführen** (`current` auf die
     abgeschlossene, `in-progress` auf die neue
     Marke) und den Wechsel als Eintrag im
     Entscheidungs-Register buchen.
- **Freigaben:** kein Pflicht-Marken-Zusatz; „für
  Zweck Y zu Marke X" bleibt als optionale
  Präzisierung zulässig — die Sicherung leistet die
  Wechsel-Prozedur.
- **Abgrenzungen:** **Version** meint die
  `_VV_TLA`-Dokumentkette, **Fassung** die
  Spezifikations-/Contract-Stände — beides bleibt
  unberührt; eine Marken-Bezeichnung „1.1" und eine
  Produkt-Version „v1.1.0" sind zwei verschiedene
  Dinge, auch wenn SemVer-artig benannt.
  **Fristen** sind pflichtbezogene Termine mit
  Verfalls-Semantik (due-Datum, „Abgelaufen");
  Zielmarken sind Planungs-Horizonte ohne Verfall.
- **Pflege:** bei Marken-Anlage, Zuordnung,
  Zeiger-Wechsel; Commit-Präfix `Zielmarken:`.

---

**Stand:** _(vom Agenten bei Anlage und laufend
gepflegt)_

## Marken

_(in geplanter Abfolge; vom Agenten bei der
Erst-Definition im Init gefüllt)_
