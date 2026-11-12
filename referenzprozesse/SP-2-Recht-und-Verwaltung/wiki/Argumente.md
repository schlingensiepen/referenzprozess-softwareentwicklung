---
type: argument-log
active: false   # Pflicht ab Stufe 2; der Init setzt active: true, sobald die Ausbaustufe erreicht ist
---

# Argumente

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis) und
wird ab **Stufe 2** (Streit) aktiv; darunter liegt sie
mit `active: false` bereit, ihre Glieder in der Kette
entfallen abgeleitet.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Argumente.md`
  — beim Stufenwechsel von dort abarbeiten.
- **Typ:** `argument-log` — Register der
  Argumentationslinien des Verfahrens (Element-Typ
  `argument`, ID-Präfix `ARG-NNN`). Singleton;
  **Pflicht ab Stufe 2**.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Status liegt in
  dieser Fassade — Detail-Knoten spiegeln (Wiki.md
  §1.1a). Ein Argument ist ein **Element**
  (Sammelzustand `offen` — frei bearbeitbar, solange
  kein Stand es verweist; Freeze ab `angenommen` mit
  der Freigabe des Argumentations-Stands, der es
  verweist, [[Katalog-Argumentation-Stand]]); danach
  nur noch Ablösung unter neuer Nummer
  ([[Einfrieren-und-Abloesen]]). Der
  Argumentations-Stand verweist nur auf angenommene
  Argumente.
- **Pflicht-Gegeneinwand:** jede Linie trägt den
  stärksten Gegeneinwand und die Antwort darauf — ohne
  Gegeneinwand ist das Argument nicht annahmefähig; die
  Gegenperspektive ([[Vorgehen-SP-2]] §Prüfen) prüft
  die Gegeneinwände.
- **Verfolgung** (`verfolgt` · `zurueckgestellt` ·
  `aufgegeben`): ob die Linie im nächsten Schriftsatz
  geführt wird; eine Zustands-Achse neben dem
  Register-Status, ändert sich ohne Ablösung.
- **Eintragsformat:** `### ARG-NNN — <Kernthese in
  einem Satz>` mit Feldern Status (`offen` /
  `angenommen` / abgelöst — [[Einfrieren-und-Abloesen]]
  §Eintrittsregel) / Datum (letzter Statuswechsel) /
  Angelegt (`JJJJ-MM-TT`) / Zielmarke ([[Zielmarken]]) /
  Verfahren (VF-NNN) / Strategie (STR-NNN,
  [[Strategie]]) / Verfolgung / Belege (TAT-IDs aus
  [[Sachverhalt]], Beweis-Knoten aus
  [[Beweisangebote]]) / Einsatzorte (Schriftsätze, in
  denen die Linie geführt wird — [[Schriftsaetze]]) /
  Detail (Wikilink).
- **Detail-Knoten-Pflicht:** immer — Begründung,
  Gegeneinwand und Antwort sind Sektionen des Knotens.
- **`argument`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Argumente]] — lesen
  beim Anlegen eines `argument`-Knotens. Sektionen:
  Kernthese / Begründung / Belege / **Gegeneinwand und
  Antwort** (Pflicht) / Einsatzorte / Vermerke
  (append-only) / Bezüge (Fassaden-Eintrag
  [[Argumente]], Strategie). Dateiname
  `ARG-NNN <Kernthese>.md`.
- **Pflege:** beim Stufenwechsel auf Stufe 2, beim
  Entwurf jedes Schriftsatzes, nach jedem Eingang mit
  gegnerischem Vortrag.

---

**Bearbeitungsstand:** _(vom Agenten beim Stufenwechsel
und laufend gepflegt)_

## Linien

_(Einträge nach ID, chronologisch angelegt; verfolgte
Linien zuerst)_
