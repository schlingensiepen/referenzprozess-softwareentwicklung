---
type: research-artifact-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Rechercheartefakte

## Meta

- **Typ:** `research-artifact-log` — Register aller
  Rechercheartefakte des Projekts. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im
  wiki/ — siehe Wiki.md §Kategorisierung der
  Register.
- **Verseuchungs-Warnung (fester Kopf-Satz):**
  Diese Fassade sammelt **extern beschafftes
  Wissen**. Externe Aussagen können verseucht sein
  (Fehler, Bias, veraltet, absichtlich manipuliert).
  Rechercheartefakte sind **Nachweis, nicht
  Wahrheit**. Die Übernahme einer Aussage ins
  Projekt ist eine bewusste Anwender-Entscheidung
  und wird als Entscheidung im Register gebucht —
  das Rechercheartefakt selbst dient als Beleg.
- **Kanonizität:** die Wahrheit bei
  Recherche-Status liegt in dieser Fassade —
  Detail-Knoten (Typ `research-artifact`) spiegeln
  (Wiki.md §1.1a).
- **Eintragsformat:**
  `### REC-NNN — <Kurzsatz>` mit Feldern
  Quelle(n) + Datum / Frage / Kern-Ergebnis
  (1–2 Sätze) / Übernommen als DEC
  (Wikilink oder „offen") / Detail (Wikilink).
- **Detail-Knoten-Konventionen:** Frontmatter
  `type: research-artifact`, `id: REC-NNN`,
  `titel`, `quelle_liste` (Liste; je Quelle
  Herkunfts-URL **und** Archiv-Pfad unter
  `research/REC-NNN - <Kurzsatz>/`, sofern
  archiviert), `datum`.
  Sektionen: Frage / Recherche-Verlauf /
  Fundstellen (Zitate als Blockquotes mit
  Quellen-Angabe unmittelbar am Zitat) / Ergebnis /
  Vermerke (append-only) / Bezüge. Dateiname
  `REC-NNN — <Kurzsatz>.md`, flach im wiki/.
- **Ingest-Regel (Standardaufgabe):** nach
  Abschluss einer externen Recherche nächste freie
  REC-Nummer vergeben, Detail-Knoten anlegen,
  Fremdaussagen als solche kennzeichnen,
  **Quellen archivieren** (alles, worauf ein Zitat
  oder eine Übernahme-Buchung sich stützt, als
  Kopie/Snapshot nach `research/REC-NNN -
  <Kurzsatz>/` — MasterPrompt §1.8; ein flüchtiger
  Link allein ist kein Nachweis), Fassaden-Eintrag
  ergänzen („Übernommen als DEC: offen"), Commit
  mit Präfix `Recherche:`.
- **Übernahme ins Projekt:** eigene
  Anwender-Aktion, als Entscheidung gebucht;
  danach das Feld „Übernommen als DEC" mit
  Wikilink vervollständigen.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Einträge

_(chronologisch nach ID)_
