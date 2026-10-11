---
type: specification-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Spezifikationen

**Ich bin neu in RP-1.** Diese Fassade entsteht mit der
Wahl von RP-1 (Wiki.md §11 Prozess-Teil-Wikis) — die
Spezifikationskette ist Kern der P4-Mechanik.

## Meta

- **Typ:** `specification-log` — Register aller
  Spezifikationen dieses Repos. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Verortung je Repo:** jedes Repo führt seine
  eigenen Spezifikationen — der Koordinator die
  Gesamtspezifikation, jede Komponente ihre
  Teilspezifikation. Die Kette entsteht über
  Cross-Repo-Verweise (`<komponente>/SPEC-NNN`);
  kein geteilter Kanonizitäts-Split nötig.
- **Zweigleisigkeit:** die **lebende Fassung** einer
  Spezifikation ist ihr Detail-Knoten (Typ
  `specification`) in diesem Repo;
  **Freigabestände** gehen als versionierte Datei
  (`_VV_TLA`) nach `output/` — der Freigabe-Eintrag
  im Entscheidungs-Register verweist auf die exakte
  Version (MasterPrompt §1.5).
- **Eintragsformat:** `### SPEC-NNN — <Kurzsatz>` mit
  Feldern Gegenstand (Gesamt/Teil, ggf. Komponente) /
  Status + status_date / letzter Freigabestand
  (output/-Version oder „—") / Detail (Wikilink).
- **Detail-Knoten-Konventionen:** Frontmatter
  `type: specification`, `id: SPEC-NNN`, `status`
  (8-Zustands-Enum), `status_date`; optional
  `trigger` (Datum oder Zielmarken-Bezeichnung),
  `zielmarke` (Marken-Bezeichnung; nur wenn
  verschoben oder eine Fassung für eine Marke
  geplant ist),
  `superseded_by`. Sektionen frei nach
  Spezifikations-Gegenstand; Kanonizität bei
  Register-Status in dieser Fassade (Wiki.md §1.1a).
- **Pflege:** bei Anlage, Statuswechsel und jedem
  Freigabestand.

---

**Stand:** _(vom Agenten bei Anlage und laufend
gepflegt)_

## Spezifikationen

_(chronologisch nach ID; vom Agenten bei der ersten
Spezifikation gefüllt)_
