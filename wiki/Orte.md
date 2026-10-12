---
type: place-log
active: false   # Vorauswahl deaktiviert; Aktivierung im Init wählbar oder später per Reaktivierung
---

# Orte

## Meta

- **Bootstrap/Reaktivierung (DEC-217):**
  Einmal-Anweisungen in der Template-Quelle
  `_template/referenzprozesse/base/bootstrap/Orte.md` —
  bei Reaktivierung von dort abarbeiten.

- **Typ:** `place-log` — Register aller Orts-Knoten
  des Projekts. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Eintragsformat:** `[[<Name>]]` mit Kurzform
  (Rolle bzw. Bedeutung im Projekt, ein Satz).
- **`place`-Detail-Knoten-Konventionen:** Frontmatter
  `type: place`. Body: Kurzbeschreibung nach der H1,
  Sektionen `## Stammdaten` und `## Bezüge` (Erwähnt
  in, Verwandte Knoten). Dateiname `<Name>.md`, flach
  im wiki/.
- **Pflege:** beim Ingest und redaktionell.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
