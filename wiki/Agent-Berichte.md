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
- **Nachweis, eingefroren ab Anlage, `ampel` als
  Bewertung:** ein Bericht wird nie abgelöst und nie
  geändert; Nachträge stehen als angehängte Vermerke
  ([[Einfrieren-und-Abloesen]] §Klassen).
- **Ingest-Regel (Standardaufgabe, keine Rückfrage):**
  sobald ein nicht-trivialer Sub-Agent-Aufruf beendet
  ist (eigenständiges Urteil oder Analyse — bloße
  Tool-Aufrufe ausgenommen): nächste freie REP-Nummer
  aus diesem Register vergeben, Detail-Knoten anlegen,
  Auftrag und Bericht unverändert übernehmen (der
  Sub-Agent-Text bleibt kanonisch), Wikilinks
  materialisieren, Register-Eintrag ergänzen, Commit
  mit Präfix `Report:`. **Reihenfolge (Pflege-Pflicht,
  MasterPrompt §9): erst ablegen, dann im Chat
  zusammenfassen** — die
  Zusammenfassung zitiert die REP-Nummer; ein
  Bericht, der nur in der Unterhaltung lebt, gilt
  als nicht erstattet.
- **Header führt, Fassade spiegelt:** die Felder eines
  Berichts stehen im Frontmatter des Detail-Knotens;
  der Fassaden-Eintrag zeigt die Kurzform. Wer ein
  Feld ändert, ändert den Header und zieht den
  Eintrag nach.
- **Eintragsformat:** `### REP-NNN — <Kurzsatz>` mit
  der Kurzform „**Modell:** … — **Bau:** … —
  **Runde:** … — **Datum:** … — **Ampel:** …“ (Bau
  und Runde nur bei Prüfberichten) / Anlass /
  Kern-Ergebnis (ein bis zwei Sätze) / Detail
  (Wikilink auf den Detail-Knoten).
- **Berichts-Typen** (Typ-Ebene per Vererbung,
  Wiki.md §3.4): `agent-report` (jeder Bericht),
  `review-report` (Prüfbericht, schreibt der Prüfer)
  und `convergence-report` (Konvergenz-Bericht,
  schreibt der Koordinator nach der
  Runden-Obergrenze, `Reviewmuster.md` §2
  Schleife 4). Felder, ihre Bedeutung und was der
  Vor-Check `sh _template/tools/lint.sh` daran prüft:
  [[Katalog-Agent-Berichte]],
  [[Katalog-review-report]],
  [[Katalog-convergence-report]] — lesen beim Anlegen
  eines Berichts. Die Meldung „Prüf-Modell =
  Bau-Modell“ gibt der Trigger-Hygiene-Wächter beim
  Sessionstart (MasterPrompt §5.3 C7) — Meldung, kein
  Block.
- **Detail-Knoten-Konventionen:** Sektionen Auftrag
  (Wortlaut inkl. Kontext-Bootstrap-Liste) / Bericht
  (unverändert übernommen) / Vermerke (append-only).
  Dateiname `REP-NNN — <Kurzsatz>.md` (Kurzsatz ohne
  Umlaut und ß), flach im `wiki/`-Root.

---

**Bearbeitungsstand:** _(vom Agenten beim ersten Bericht und
laufend gepflegt)_

Chronologische Liste.

## Einträge

_(chronologisch nach ID)_
