---
type: agent-report-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Agent-Berichte

## Meta

- **Typ:** `agent-report-log` — Register aller
  Sub-Agent-Berichte des Projekts (interne Analyse,
  Prüfung, Ausführung als zitierfähiges Wissen).
  Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Bericht-Status
  liegt in dieser Fassade — Detail-Knoten (Typ
  `agent-report`) spiegeln (Wiki.md §1.1a).
- **Ingest-Regel (Standardaufgabe, keine Rückfrage):**
  sobald ein nicht-trivialer Sub-Agent-Aufruf beendet
  ist (eigenständiges Urteil oder Analyse — bloße
  Tool-Aufrufe ausgenommen): nächste freie REP-Nummer
  aus diesem Register vergeben, Detail-Knoten anlegen,
  Auftrag und Bericht unverändert übernehmen (der
  Sub-Agent-Text bleibt kanonisch), Wikilinks
  materialisieren, Register-Eintrag ergänzen, Commit
  mit Präfix `Report:`. **Reihenfolge (DEC-212):
  erst ablegen, dann im Chat zusammenfassen** — die
  Zusammenfassung zitiert die REP-Nummer; ein
  Bericht, der nur in der Unterhaltung lebt, gilt
  als nicht erstattet.
- **Eintragsformat:** `### REP-NNN — <Kurzsatz>` mit
  Feldern Modell — Datum — Ampel / Anlass /
  Kern-Ergebnis (ein bis zwei Sätze) / Detail
  (Wikilink auf den Detail-Knoten).
- **`agent-report`-Detail-Knoten-Konventionen:**
  Frontmatter `type: agent-report`, `id: REP-NNN`,
  `titel`, `modell` (z.B. `fable-5`, `sonnet-5`),
  `datum`, `ampel: gruen|gelb|rot|—`. Sektionen:
  Auftrag (Wortlaut inkl. Kontext-Bootstrap-Liste) /
  Bericht (unverändert übernommen) / Vermerke
  (append-only). Dateiname `REP-NNN — <Kurzsatz>.md`,
  flach im `wiki/`-Root.

---

**Stand:** _(vom Agenten beim ersten Bericht und
laufend gepflegt)_

Chronologische Liste.

## Einträge

_(chronologisch nach ID)_
