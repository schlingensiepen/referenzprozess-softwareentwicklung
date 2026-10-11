---
type: contact-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Ansprechpartner

## Meta

- **Typ:** `contact-log` — Relations-Fassade: Register
  der Relation Person↔Zuständigkeit (wer ist wofür
  zuständig), mit Rolle und Zuständigkeit, nicht nur
  Namen. Die Einträge sind Relationen, keine
  Entitäten. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ (die
  Relation lebt inline im Eintrag, ohne
  Detail-Knoten) — siehe Wiki.md §Kategorisierung der
  Register.
- **Eintragsformat:** `### <Name>, <Organisation>` mit
  Feldern Zuständig für / Kontakt (falls bekannt) /
  Wikilink ([[person-Knoten falls vorhanden]]).
- **Einträge ohne Personen-Detail sind zulässig** —
  wenn über eine Person nicht mehr bekannt ist als
  Name, Organisation und Zuständigkeit, entsteht kein
  `person`-Knoten, nur der Fassaden-Eintrag.
- **Ansprechpartner mit relevantem Kontext:**
  zusätzlicher `person`-Knoten ([[Personen]]);
  der Wikilink führt dorthin.
- **Pflege:** beim Ingest und laufend.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
