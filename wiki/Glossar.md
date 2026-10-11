---
type: glossary
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Glossar

## Meta

- **Typ:** `glossary` — freigegebene Terminologie des
  Projekts. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Nur inhaltliche Felder:** Definition-Text, English,
  Verankert in, Siehe auch. Prozess-Felder (Freigabe,
  Kommentar, Rückmeldung AIG) bleiben in
  [[Glossar Review]] als Audit-Trail.
- **Anwender-Terrain:** Einträge kommen ausschließlich
  über den Review-Prozess (Wiki.md §3a.1) — der Agent
  verschiebt aus [[Glossar Review]] nach User-Freigabe,
  schreibt hier nicht direkt.
- **Eintragsformat:** `### <Begriff>` mit `**English:**`,
  Definition in Fließtext, `**Verankert in:**`
  ([[document-Knoten oder Regel-Ref]]), `**Siehe
  auch:**` ([[concept-Knoten falls vorhanden]]).
- **Verhältnis zu `concept`-Knoten (Sprach- vs.
  Sach-Ebene):** dieses Glossar regelt die
  **Benennungen** (lexikalische Kurzfassung +
  English, Freigabe über den Review-Prozess); das
  **Sach-Wissen** zu einem Gegenstand lebt im
  `concept`-Knoten und ist in der Fassade
  [[Konzepte]] registriert. Derselbe Gegenstand darf
  auf beiden Ebenen vorkommen — die Einträge
  verweisen dann aufeinander. Drift zwischen den
  Ebenen wird bewusst akzeptiert — keine
  Sync-Pflicht (Wiki.md §3a.1).

---

**Stand:** _(vom Agenten beim ersten freigegebenen
Eintrag und laufend gepflegt)_

Vorschläge und Diskussion siehe `[[Glossar Review]]`.

_(Einträge werden aus `Glossar Review.md` durch den
Agenten nach User-Freigabe verschoben.)_
