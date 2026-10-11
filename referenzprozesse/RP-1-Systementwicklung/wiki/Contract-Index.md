---
type: contract-index
# active: false   # bei Deaktivierung (Default ist active: true; bei Komponenten-Rolle deaktiviert)
---

# Contract-Index

**Ich bin neu in RP-1.** Diese Fassade entsteht mit der
Wahl von RP-1 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `contract-index` — Register aller Contracts
  zwischen Komponenten; nur beim Koordinator aktiv.
  Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität geteilt:** der Contract-**Inhalt** ist
  kanonisch beim Provider (Wiki-Knoten vom Typ
  `contract` im Provider-Repo); die **Index-Zeile**
  (Bestand, Fassung, Beteiligte) ist kanonisch beim
  Koordinator in dieser Fassade.
- **Eintragsformat:** eine Sektion `## Contracts`,
  chronologisch nach Contract-ID (Format `CON-NNN`).
  Pro Eintrag: Contract-ID / Provider (Komponente) /
  Consumer(s) / aktuelle **freigegebene** Fassung /
  Status + status_date / Freigabe (Wikilink auf den
  zweck-gebundenen Freigabe-Eintrag im
  Entscheidungs-Register) / optional Zielmarke
  (Bezeichnung, wenn eine Fassung für eine Marke
  geplant ist — „Fassung X, geplant für Marke Y";
  [[Zielmarken]]) / Verweis auf den
  Provider-Wiki-Knoten (Typ `contract`, dort liegt die
  Inhaltsdefinition).
- **Status:** universelles 8-Zustands-Enum der
  Register ([[Register-Lebenszyklus]],
  SP-1-mitgebracht) mit Contract-Lesart:
  offen = vorgeschlagen/in Aushandlung · aufgeschoben
  = Aushandlung vertagt · angenommen = **vereinbart
  und in Kraft** · in-umsetzung = Provider
  implementiert die Fassung · umgesetzt = Fassung
  geliefert und abgenommen · abgeschlossen =
  beendet/außer Kraft · verworfen = nicht zustande
  gekommen · abgelöst durch = Nachfolge-Contract.
  Die **Status-Wahrheit liegt in der Index-Zeile**
  (Koordinator, Wiki.md §1.1a); der Provider-Knoten
  spiegelt. Ein Fassungs-Wechsel innerhalb eines
  Contracts ist kein Status-Wechsel — dafür steht
  die Spalte „aktuelle Fassung".
- **Freigabe-Kopplung:** der Übergang auf
  `angenommen` — und jede neue Fassung, die in Kraft
  gehen soll — setzt eine **Freigabe-Buchung**
  voraus: zweck-gebundener `Freigabe:`-Eintrag im
  Entscheidungs-Register nach der Aushandlung
  (Vorgehen-RP-1 §9); die Index-Zeile verlinkt ihn.
  `angenommen` ohne verlinkte Freigabe ist ein
  Lint-/Wächter-Befund. Entwurfs-Fassungen leben
  beim Provider, bis die Freigabe kommt.
- **Commit-Präfix:** Änderungen laufen unter dem
  Basis-Präfix `Wiki:` (kein eigener Präfix —
  Änderungen sind selten).

---

**Stand:** _(vom Agenten bei Contract-Anlage und
laufend gepflegt)_

## Contracts

_(chronologisch nach Contract-ID; vom Agenten beim
ersten Contract gefüllt)_
