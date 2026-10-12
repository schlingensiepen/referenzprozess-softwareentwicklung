---
type: thing-log
active: false   # Vorauswahl deaktiviert; Aktivierung im Init wählbar oder später per Reaktivierung
---

# Dinge

## Meta

- **Bootstrap/Reaktivierung (DEC-217):**
  Einmal-Anweisungen in der Template-Quelle
  `_template/referenzprozesse/base/bootstrap/Dinge.md` —
  bei Reaktivierung von dort abarbeiten.

- **Typ:** `thing-log` — Register aller
  `thing`-Knoten des Projekts (physische,
  identifizierbare Dinge mit Stammdaten — Geräte,
  Sensoren, Fahrzeuge, Bauwerke). Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Eintragsformat:** `[[<Name>]]` mit Kurzform
  (Rolle bzw. Bedeutung im Projekt, ein Satz).
- **`thing`-Detail-Knoten-Konventionen:** Frontmatter
  `type: thing`. Body: Kurzbeschreibung nach der H1,
  Sektionen `## Stammdaten` und `## Bezüge` (Erwähnt
  in, Verwandte Knoten). Dateiname `<Name>.md`, flach
  im wiki/.
- **Pflege:** beim Ingest und redaktionell.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
