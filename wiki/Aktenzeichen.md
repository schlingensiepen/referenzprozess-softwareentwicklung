---
type: file-number-log
active: false   # Vorfestlegung: deaktiviert (Reaktivierung per Zuruf)
---

# Aktenzeichen

## Meta

- **Typ:** `file-number-log` — Register aller im
  Projekt vorkommenden Aktenzeichen. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Kein eigener Detail-Knoten:** der Kontext eines
  Aktenzeichens lebt im Metadatenblock der zugehörigen
  `case`- oder `document`-Knoten. Dieses Register ist
  eine denormalisierte Sicht, gruppiert nach Absender
  oder Case.
- **Eintragsformat:** `### <Aktenzeichen>` mit Feldern
  Typ (z.B. Ticket / Bestell-Nr. / Aktenzeichen) /
  Absender / Zuordnung ([[case-Knoten]] und/oder
  [[document-Knoten]]) / kurzer Notiz falls sinnvoll.
- **Einträge ohne Detail-Knoten sind zulässig** — auch
  ein einzeln erwähntes Aktenzeichen ist gültig.
- **Pflege:** beim Ingest und laufend.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
