---
type: file-number-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Aktenzeichen

## Meta

- **Typ:** `file-number-log` — Register aller im
  Projekt vorkommenden Aktenzeichen. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Kein eigener Detail-Knoten:** der Kontext eines
  Aktenzeichens lebt im Metadatenblock des zugehörigen
  `document`-Knotens — jedes Eingangs- oder
  Ausgangsdokument trägt sein Aktenzeichen —; in
  Prozessen mit eigenem Fall-Typ (etwa `case` mit
  SP-2) gehört es auch zu dessen Knoten. Dieses
  Register ist eine denormalisierte Sicht, gruppiert
  nach Absender oder Fall.
- **Eintragsformat:** `### <Aktenzeichen>` mit Feldern
  Typ (z.B. Ticket / Bestell-Nr. / Aktenzeichen) /
  Absender / Zuordnung ([[document-Knoten]]; in
  Prozessen mit eigenem Fall-Typ auch dessen Knoten) /
  kurzer Notiz falls sinnvoll.
- **Einträge ohne Detail-Knoten sind zulässig** — auch
  ein einzeln erwähntes Aktenzeichen ist gültig.
- **Pflege:** beim Ingest und laufend.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
