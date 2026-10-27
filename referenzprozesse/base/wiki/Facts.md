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
  Diskrepanz zeitnah und pflegt den Detail-Knoten nach
  (oder aktualisiert den Stolperstein, wenn er veraltet
  ist).
- **Bearbeitungsstand-Zeile:** _(vom Anwender oder auf
  Anweisung gepflegt)_.

---

**Bearbeitungsstand:** _(beim Init gesetzt)_

## 1. Projekteinstieg

_(beim Init aus User-Angaben gefüllt. Kurz und mit
Wikilinks auf Hauptbeteiligte und zentrale Themen.)_

## 2. Allgemeine Fakten

_(TLA-Zuordnungen, projektweiter Rahmen, sonstige
projektweite Fakten; die Tag-Konvention des Projekts —
Muster des Tag-Namens, `Vorgehen.md` §4 „Freigabe per
Tag“ — und daneben die Pfade des Produkts, auf die
sich „unverändert“ bei der Übernahme eines Tags
bezieht (im Zwei-Repo-Fall das Produkt-Repo;
[[Kettenpruefung]] §Kette, Übernahme des Tags und der
Lieferung), beides abgefragt vor dem ersten Tag; dazu
die Zweig-Konvention für Zwischenmarken — Muster des
Zweignamens im Repo, das die Pfade des Produkts trägt,
z.B. `marke/2.0.1`, abgezweigt am Tag der Vormarke
([[Zielmarken]] §Meta „Zwischenmarke“, Tag und
Produkt-Repo) —, abgefragt vor der ersten
Zwischenmarke.)_

## 3. Stolpersteine

_(Hinweise auf wiederkehrende KI-Fehler oder subtile
Sachverhalte, die permanent sichtbar bleiben sollen.)_

_(vom User oder auf User-Anweisung gefüllt)_
