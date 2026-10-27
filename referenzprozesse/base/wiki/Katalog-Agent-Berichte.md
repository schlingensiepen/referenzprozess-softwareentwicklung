---
type: catalog-entry
art: register
---

# Katalog-Agent-Berichte

Register-Eintrag: Fassade `agent-report-log`
([[Agent-Berichte]]) mit Element-Typ `agent-report`.
Die Kind-Typen `review-report` und
`convergence-report` (`Extends: agent-report`) stehen
in [[Katalog-review-report]] und
[[Katalog-convergence-report]].

### agent-report-log

- **Zweck:** Register aller Sub-Agent-Berichte des
  Projekts
- **Pflichtfelder:** `type: agent-report-log`
- **Präfix:** `REP`
- **Datei:** `wiki/Agent-Berichte.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)
- **Kanonizität:** Header führt, Fassade spiegelt —
  die Fassade führt kein Feld kanonisch, ihr Eintrag
  zeigt die Kurzform (`## Meta` der Fassade, Wiki.md
  §1.1a); ein REP ist Nachweis, eingefroren ab
  Anlage, `ampel` ist die Bewertung.

### agent-report

- **Zweck:** zitierfähiger Bericht eines Sub-Agenten
  (interne Analyse, Prüfung, Ausführung)
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: agent-report`, `id`
  (Format `REP-NNN`), `titel`, `modell` (das Modell,
  das den Bericht schrieb), `datum`, `ampel`
  (`gruen`/`gelb`/`rot`/`—`)
- **Optional:** `marke` (Marke, zu der der Bericht
  gehört), `alias` (Liste; Wiki.md §4.1)
- **Beispielname:** `REP-001 — Pipeline-Review.md`
- **Kanonizität:** Header führt, Fassade spiegelt —
  die Felder stehen im Frontmatter des Berichts, der
  Eintrag in `wiki/Agent-Berichte.md` zeigt die
  Kurzform; der Bericht ist Nachweis, eingefroren ab
  Anlage.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Agent-Berichte]].
