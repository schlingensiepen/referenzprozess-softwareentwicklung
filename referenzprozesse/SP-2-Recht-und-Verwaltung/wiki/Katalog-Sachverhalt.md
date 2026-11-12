---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Sachverhalt

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`assertion-log` ([[Sachverhalt]]) mit Element-Typ
`assertion` (Präfix `TAT`). Der Typ heißt `assertion`,
nicht `fact`, weil `Facts.md` die Anwender-Fakten der
Basis trägt. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### assertion-log

- **Zweck:** Register der Tatsachen des Verfahrens —
  jede Tatsachenbehauptung mit Herkunft und Stellung,
  Beleg über die Relation `evidence`
- **Pflichtfelder:** `type: assertion-log`
- **Präfix:** `TAT`
- **Datei:** `wiki/Sachverhalt.md`
- **Singleton**
- **Pflicht ab:** Stufe 2
- **Entfällt abgeleitet, wenn:** die Ausbaustufe unter
  Stufe 2 liegt (Fassade `active: false`)

### assertion

- **Zweck:** eine Tatsachenbehauptung im Verfahren mit
  Herkunft, Stellung und Belegen (Detail-Knoten zum
  TAT-Eintrag im Register)
- **Klasse:** Element
- **Freeze ab:** angenommen (mit der Freigabe des
  Sachverhalts-Stands; die Stellung ist Status-Achse
  und ändert sich am eingefrorenen Element)
- **Sammelzustand:** offen
- **Pflichtfelder:** `type: assertion`, `id` (Format
  `TAT-NNN`), `status` (`offen` | `angenommen` |
  abgelöst; [[Einfrieren-und-Abloesen]]
  §Eintrittsregel), `status_date`, `datum`, `zielmarke`,
  `verfahren` (String-Slug des `case`-Knotens),
  `herkunft` (`eigene` | `gegenseite` |
  `andere-beteiligte` | `von-amts-wegen`), `stellung`
  (offene Liste: `offen` | `unstreitig` | `bestritten`
  | `mit-nichtwissen-bestritten` |
  `von-amts-wegen-zu-ermitteln` |
  `nicht-entscheidungserheblich` | `bewiesen` |
  `widerlegt`; welche angeboten werden, steuert
  `verfahrensgrundsatz` am `case`)
- **Optional:** `quelle` (String-Slug des
  Eingangsdokuments oder Schriftsatzes, in dem die
  Tatsache vorgetragen ist), `beweis` (Liste der
  String-Slugs von `evidence`-Knoten,
  [[Beweisangebote]]; ohne aktive Fassade
  Beweisangebote direkt Anlage oder Dokument),
  `stellung_date` (Datum des letzten
  Stellungs-Wechsels), `supersedes`, `superseded_by`,
  `ueberlagert`, `alias`, `vertraulich` (`offen` |
  `intern` | `streng-intern`)
- **Dokumenttypen:** [[Katalog-Sachverhalt-Stand]]
- **Beispielname:** `TAT-001 Bescheid am 2026-03-11 zugegangen.md`
- **Kanonizität:** Wahrheit bei Status- und
  Stellungs-Drift liegt in `wiki/Sachverhalt.md`
  (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Sachverhalt]] (Sektionen Tatsache / Herkunft und
  Fundstelle / Stellung und Verlauf / Belege / Vermerke
  / Bezüge).
- **Materielle Fristen** (Verjährung,
  Ausschlussfristen) werden aus Tatsachen dieses
  Registers berechnet; die Frist nennt die TAT-ID im
  Feld `source` ([[Katalog-Fristen]], SP-2-Präzisierung).
