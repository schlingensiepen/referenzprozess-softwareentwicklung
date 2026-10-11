---
type: facts
active: true   # kann nicht deaktiviert werden — Facts ist Pflicht-Fassade (mandatory)
---

# Facts

## Meta

- **Typ:** `facts` — Projekteinstieg, projektweite
  Fakten, Stolpersteine. Singleton, Pflicht-Fassade.
- **Kategorie:** (b) Inline-Fassade im wiki/ — siehe
  Wiki.md §Kategorisierung der Register.
- **Anwender-Terrain:** Facts gehört dem Anwender. Der
  Agent editiert hier nur auf ausdrückliche Anweisung —
  keine automatische Pflege beim Ingest, keine
  Agent-gepflegte Konfiguration. Der Fassaden-Status
  lebt in [[Fassaden]]; Betriebs-Konfiguration
  (aktivierter Prozess, WorkspaceManager, Commit-Sprache)
  lebt in `internal-rule`-Knoten unter
  [[InterneMechanik]].
- **Lese-Priorität:** Facts hat beim Sessionstart hohe
  Lese-Priorität. Stolpersteine überstimmen
  Detail-Knoten bei Widersprüchen — der Agent klärt die
  Diskrepanz und pflegt den Detail-Knoten nach.
- **Stand-Zeile:** _(vom Anwender oder auf Anweisung
  gepflegt)_.

---

**Stand:** _(beim Init gesetzt)_

## 1. Projekteinstieg

_(beim Init aus User-Angaben gefüllt. Kurz und mit
Wikilinks auf Hauptbeteiligte und zentrale Themen.)_

## 2. Allgemeine Fakten

_(TLA-Zuordnungen, projektweiter Rahmen, sonstige
projektweite Fakten.)_

## 3. Stolpersteine

_(Hinweise auf wiederkehrende KI-Fehler oder subtile
Sachverhalte, die permanent sichtbar bleiben sollen.)_

_(vom User oder auf User-Anweisung gefüllt)_
