---
type: glossary-review
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Glossar Review

## Meta

- **Typ:** `glossary-review` — Glossar-Vorschläge in
  Bearbeitung und Audit-Trail freigegebener Einträge.
  Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Prozess** (Wiki.md §3a.1):
  1. Vorschlag (Agent oder User) unter
     `## In Bearbeitung`.
  2. Iterativer Dialog: User → `Kommentar:` → Agent →
     `Rückmeldung AIG:` → …
  3. User setzt `Freigabe: <Datum> <TLA>`.
  4. Agent verschiebt die inhaltlichen Felder nach
     [[Glossar]].
  5. Vollständiger Trail bleibt hier unter
     `## Freigegeben (Audit-Trail)`.
- **Eintragsformat:** `### <Begriff>` mit `**English:**`,
  `**Freigabe:**`, `**Kommentar:**`,
  `**Rückmeldung AIG:**`, Definition in Fließtext,
  `**Verankert in:**`, `**Siehe auch:**`.

---

**Stand:** _(vom Agenten oder User beim ersten
Vorschlag angelegt und laufend gepflegt)_

## In Bearbeitung

_(vom User oder Agenten beim ersten Vorschlag gefüllt)_

## Freigegeben (Audit-Trail)

_(Agent verschiebt Einträge hierher, sobald sie in
`[[Glossar]]` übernommen wurden.)_
