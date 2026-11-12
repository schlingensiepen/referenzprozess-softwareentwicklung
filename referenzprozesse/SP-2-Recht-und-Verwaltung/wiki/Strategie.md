---
type: strategy-log
active: false   # Pflicht ab Stufe 2; der Init setzt active: true, sobald die Ausbaustufe erreicht ist
---

# Strategie

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis) und
wird ab **Stufe 2** (Streit) aktiv; darunter liegt sie
mit `active: false` bereit, ihre Glieder in der Kette
entfallen abgeleitet.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Strategie.md`
  — beim Stufenwechsel von dort abarbeiten.
- **Typ:** `strategy-log` — Register der Strategie je
  Verfahren (Element-Typ `strategy`, ID-Präfix
  `STR-NNN`) und ihrer Eventualpläne (Element-Typ
  `contingency`, ID-Präfix `EVP-NNN`). Singleton;
  **Pflicht ab Stufe 2**.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Status liegt in
  dieser Fassade — Detail-Knoten spiegeln (Wiki.md
  §1.1a). Eine Strategie ist ein **Element**
  (Sammelzustand `offen`, Freeze ab `angenommen`):
  angenommen wird sie **nur mit der Freigabe des
  Strategie-Stands durch den Anwender**
  ([[Katalog-Strategie-Stand]]); danach ändert sie nur
  eine Ablösung unter neuer Nummer mit neuer Freigabe
  ([[Einfrieren-und-Abloesen]] §Ablösung) — ein
  Strategiewechsel ist eine Ablösung.
- **Inhalt einer Strategie:** Ziel, Grundlinie,
  Vorgehensplan, **Sperrliste** (was wir nicht tun,
  nicht sagen, nicht anbieten), Haltung (Ton gegenüber
  Gegenüber und Stelle). Die Strategie ist
  **Pflicht-Eingabe jedes Prüfauftrags**
  ([[Vorgehen-SP-2]] §Prüfen); die Gegenperspektive
  nutzt die Sperrliste zum Bewerten, nicht zum
  Befolgen. Ein Prüf-Befund gegen Sperrliste oder
  gebuchte Linie ist ein **Vorschlag**, kein
  Änderungsauftrag.
- **Eventualpläne** („wenn X eintritt, dann Y“): je
  Plan Auslöser, vorbereiteter Zug, Frist ab Auslöser,
  Plan-Status `vorbereitet` · `ausgeloest` · `erledigt`
  · `gegenstandslos`. Der Posteingangs-Wächter prüft
  jeden Eingang gegen die offenen Auslöser; ein
  ausgelöster Plan legt die Ereignis-Marke an
  ([[Marken-SP-2]]). Bei jeder Lageänderung durch das
  Gegenüber (Nachbesserung, Abhilfe, Anerkenntnis,
  Erfüllung, Rücknahme, Änderungsbescheid,
  Erledigterklärung) entsteht ein Eventualplan; bei
  drohender Vollstreckung die Pläne „Eilrechtsschutz“
  bzw. „Vollstreckungsschutz“ ([[Vorgehen-SP-2]]
  §Prüfen). Ein Eventualplan ist ein Element wie die
  Strategie (Sammelzustand `offen`, Freeze ab
  `angenommen` mit dem Strategie-Stand); den
  Plan-Status ändert das Ereignis, nicht eine Ablösung.
- **Argumente getrennt:** Argumentationslinien stehen
  in [[Argumente]] und verweisen auf die Strategie;
  hier steht die Linie des Verfahrens, nicht die des
  Schriftsatzes.
- **Eintragsformat Strategie:** `### STR-NNN —
  <Kurzsatz>` mit Feldern Status (`offen` bis zur
  Annahme, `angenommen` mit der Freigabe, danach
  Ablösung — [[Einfrieren-und-Abloesen]]
  §Eintrittsregel) / Datum (letzter Statuswechsel) /
  Angelegt (`JJJJ-MM-TT`) / Zielmarke ([[Zielmarken]]) /
  Verfahren (VF-NNN) / Ziel (ein Satz) / Eventualpläne
  (EVP-IDs) / Detail (Wikilink).
- **Eintragsformat Eventualplan:** `### EVP-NNN — wenn
  <Auslöser>, dann <Zug>` mit Feldern Status (wie
  Strategie) / Plan-Status / Datum / Angelegt /
  Zielmarke / Strategie (STR-NNN) / Auslöser / Zug /
  Frist ab Auslöser / Detail (Wikilink).
- **Detail-Knoten-Pflicht:** Strategie immer (Ziel,
  Grundlinie, Vorgehensplan, Sperrliste und Haltung
  sind Sektionen des Knotens); Eventualplan, sobald der
  Zug mehr ist als ein Satz oder Vermerke anfallen.
- **`strategy`- und `contingency`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Strategie]] — lesen
  beim Anlegen. Sektionen `strategy`: Ziel /
  Grundlinie / Vorgehensplan / Sperrliste / Haltung /
  Eventualpläne (Verweise) / Vermerke (append-only) /
  Bezüge (Fassaden-Eintrag [[Strategie]]). Sektionen
  `contingency`: Auslöser / Vorbereiteter Zug / Frist
  ab Auslöser / Verlauf (ausgelöst am, erledigt am) /
  Vermerke / Bezüge. Dateinamen `STR-NNN <Kurzsatz>.md`,
  `EVP-NNN <Kurzsatz>.md`.
- **Pflege:** beim Stufenwechsel auf Stufe 2 (erste
  Strategie zur ersten Marke), bei jedem Eingang gegen
  die Auslöser, bei jeder Prüfrunde.

---

**Bearbeitungsstand:** _(vom Agenten beim Stufenwechsel
und laufend gepflegt)_

## Strategien

_(STR-Einträge nach ID, chronologisch angelegt; je
Verfahren höchstens eine angenommene Strategie, die
übrigen abgelöst)_

## Eventualpläne

_(EVP-Einträge nach ID; offene Auslöser zuerst)_
