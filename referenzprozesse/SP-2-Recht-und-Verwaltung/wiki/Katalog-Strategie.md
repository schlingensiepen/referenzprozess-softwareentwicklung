---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Strategie

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`strategy-log` ([[Strategie]]) mit den Element-Typen
`strategy` (Präfix `STR`) und `contingency`
(Eventualplan, Präfix `EVP`). Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### strategy-log

- **Zweck:** Register der Strategie je Verfahren und
  ihrer Eventualpläne (Ziel, Grundlinie,
  Vorgehensplan, Sperrliste, Haltung; „wenn X
  eintritt, dann Y“)
- **Pflichtfelder:** `type: strategy-log`
- **Präfix:** `STR`, `EVP` (zwei intern nummerierte
  Reihen in einer Fassade: Strategien `STR`,
  Eventualpläne `EVP`)
- **Datei:** `wiki/Strategie.md`
- **Singleton**
- **Pflicht ab:** Stufe 2
- **Entfällt abgeleitet, wenn:** die Ausbaustufe unter
  Stufe 2 liegt (Fassade `active: false`)

### strategy

- **Zweck:** Strategie eines Verfahrens — Ziel,
  Grundlinie, Vorgehensplan, Sperrliste, Haltung;
  Pflicht-Eingabe jedes Prüfauftrags (Detail-Knoten
  zum STR-Eintrag im Register)
- **Klasse:** Element
- **Freeze ab:** angenommen (nur mit der Freigabe des
  Strategie-Stands durch den Anwender; ein
  Strategiewechsel ist eine Ablösung mit neuer
  Freigabe)
- **Sammelzustand:** offen
- **Pflichtfelder:** `type: strategy`, `id` (Format
  `STR-NNN`), `status` (`offen` | `angenommen` |
  abgelöst; [[Einfrieren-und-Abloesen]]
  §Eintrittsregel), `status_date`, `datum`
  (Anlage-Datum `JJJJ-MM-TT`, nie geändert; [[Katalog]]
  §Typ-Konventionen), `zielmarke` (Marke, zu der die
  Strategie gilt; [[Zielmarken]]), `verfahren`
  (String-Slug des `case`-Knotens)
- **Optional:** `supersedes` (Liste), `superseded_by`
  (Liste), `ueberlagert` (Liste; nur in einer
  Sackgasse), `alias` (Liste), `eventualplaene` (Liste
  der EVP-IDs), `vertraulich` (`offen` | `intern` |
  `streng-intern`; Vorgabe der Strategie ist
  `streng-intern` — wer je Stufe Inhalte erhält, legt
  der Anwender projektweit fest)
- **Dokumenttypen:** [[Katalog-Strategie-Stand]]
- **Beispielname:** `STR-001 Bestandskraft vermeiden, Vergleich offen halten.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Strategie.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Strategie]] (Sektionen Ziel / Grundlinie /
  Vorgehensplan / Sperrliste / Haltung / Eventualpläne
  / Vermerke / Bezüge).

### contingency

- **Zweck:** Eventualplan — „wenn X eintritt, dann Y“
  mit Auslöser, vorbereitetem Zug und Frist ab
  Auslöser; der Posteingangs-Wächter prüft Eingänge
  gegen offene Auslöser, ein ausgelöster Plan legt die
  Ereignis-Marke an (Detail-Knoten zum EVP-Eintrag)
- **Klasse:** Element
- **Freeze ab:** angenommen (mit dem Strategie-Stand;
  den Plan-Status ändert das Ereignis, nicht eine
  Ablösung)
- **Sammelzustand:** offen
- **Pflichtfelder:** `type: contingency`, `id` (Format
  `EVP-NNN`), `status` (`offen` | `angenommen` |
  abgelöst), `status_date`, `datum`, `zielmarke`,
  `verfahren`, `strategie` (String-Slug des
  STR-Knotens), `ausloeser` (das Ereignis, ein Satz),
  `plan_status` (`vorbereitet` | `ausgeloest` |
  `erledigt` | `gegenstandslos`)
- **Optional:** `zug` (der vorbereitete Zug, ein Satz;
  Ausführung im Body), `frist_ab_ausloeser` (Dauer
  oder Regel; die Frist selbst entsteht bei Auslösung
  in [[Fristen]]), `ausgeloest_durch` (String-Slug des
  auslösenden Eingangsdokuments), `supersedes`,
  `superseded_by`, `alias`, `vertraulich`
- **Dokumenttypen:** [[Katalog-Strategie-Stand]]
- **Beispielname:** `EVP-001 Wenn Vollstreckung angekuendigt, Eilantrag.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Strategie.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Strategie]] (Sektionen Auslöser / Vorbereiteter
  Zug / Frist ab Auslöser / Verlauf / Vermerke /
  Bezüge).
