---
type: business-relation-log
active: false   # Vorauswahl deaktiviert; Aktivierung per Init-Frage oder User-Anweisung
---

# Geschäftsbeziehungen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) —
relevant für Vorhaben mit Markt-Kontext
(Produktentwicklung: Kunden, Wettbewerber, Partner).

## Meta

- **Bootstrap/Reaktivierung (DEC-217):**
  Einmal-Anweisungen in der Template-Quelle
  `referenzprozesse/SP-1-Standardprozess/bootstrap/Geschäftsbeziehungen.md` —
  bei Reaktivierung von dort abarbeiten.

- **Typ:** `business-relation-log` —
  Relations-Fassade: Register der Beziehungen des
  Projekts zu externen Organisationen über die drei
  Relations-Typen `customer`, `competitor`,
  `partner` (Organisation ↔ Projektaspekt).
  Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ (die
  Relation lebt inline im Eintrag, ohne
  Detail-Knoten) — siehe Wiki.md §Kategorisierung
  der Register.
- **Eintragsformat:** `### <Organisation>` mit
  Feldern Beziehung (`customer` | `competitor` |
  `partner`; mehrere Zeilen zulässig, wenn eine
  Organisation mehrere Rollen hat) / Aspekt (wofür
  gilt die Beziehung) / Wikilink
  ([[organization-Knoten falls vorhanden]]) /
  Anmerkung (optional).
- **Einträge ohne Organisations-Detail sind
  zulässig** — ein `organization`-Knoten
  ([[Organisationen]]) entsteht erst, wenn über die
  Organisation mehr bekannt ist als Name und
  Beziehung.
- **Abgrenzung:** [[Ansprechpartner]] führt
  Person↔Zuständigkeit; diese Fassade führt
  Organisation↔Projektaspekt. Kunden-**Anforderungen**
  gehören ins REQ-Register ([[Anforderungen]]), hier
  steht nur die Beziehung.
- **Pflege:** beim Ingest und laufend.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

_(vom Agenten beim ersten Ingest gefüllt)_
