---
type: assertion-log
active: false   # Pflicht ab Stufe 2; der Init setzt active: true, sobald die Ausbaustufe erreicht ist
---

# Sachverhalt

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis) und
wird ab **Stufe 2** (Streit) aktiv; darunter liegt sie
mit `active: false` bereit, ihre Glieder in der Kette
entfallen abgeleitet.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Sachverhalt.md`
  — beim Stufenwechsel von dort abarbeiten.
- **Typ:** `assertion-log` — Register der Tatsachen des
  Verfahrens (Element-Typ `assertion`, ID-Präfix
  `TAT-NNN`): jede Tatsachenbehauptung, gleich von wem,
  mit Herkunft und Stellung. Singleton; **Pflicht ab
  Stufe 2**. Der Typ heißt `assertion`, nicht `fact`,
  weil [[Facts]] die Anwender-Fakten der Basis trägt.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Stellung und Status
  liegt in dieser Fassade — Detail-Knoten spiegeln
  (Wiki.md §1.1a). Eine Tatsache ist ein **Element**
  (Sammelzustand `offen`, Freeze ab `angenommen` mit
  der Freigabe des Sachverhalts-Stands,
  [[Katalog-Sachverhalt-Stand]]); eine geänderte
  Tatsache ist eine Ablösung unter neuer Nummer
  ([[Einfrieren-und-Abloesen]]). Die **Stellung** ist
  Status-Achse und ändert sich am eingefrorenen Element
  (wie der Status eines Elements), ohne Ablösung.
- **Herkunft** (`eigene` · `gegenseite` ·
  `andere-beteiligte` · `von-amts-wegen`): wer die
  Tatsache in das Verfahren eingeführt hat. Fremder
  Vortrag kommt aus dem Posteingang: **jede fremde
  Tatsachenbehauptung bekommt eine Stellung** beim
  Einlesen ([[Vorgehen-SP-2]] §Prüfen); der Wächter
  meldet unwidersprochenen Vortrag (eine fremde
  Tatsache mit Stellung `offen` vor dem nächsten
  eigenen Schriftsatz).
- **Stellung** (offene Liste; das Feld
  Verfahrensgrundsatz am Verfahren steuert, welche
  angeboten werden — [[Verfahren]]): `offen` ·
  `unstreitig` (bzw. zugestanden) · `bestritten` ·
  `mit-nichtwissen-bestritten` (nur bei
  Beibringungsgrundsatz) · `von-amts-wegen-zu-ermitteln`
  (bei Amtsermittlung) · `nicht-entscheidungserheblich`
  · `bewiesen` · `widerlegt`.
- **Beleg:** über die Relation `evidence`
  ([[Beweisangebote]]; Feld `beweis:` mit den
  Beweis-Knoten); eine Anlage ([[Anlagen]]) wird über
  ein Beweisangebot der Beweisart Urkunde zum Beleg.
  Materielle Fristen (Verjährung, Ausschlussfristen)
  werden aus Tatsachen dieses Registers berechnet
  ([[Fristen]], [[Vorgehen-SP-2]] §Fristen) — die
  Frist nennt die TAT-ID.
- **Eintragsformat:** `### TAT-NNN — <Tatsache in einem
  Satz>` mit Feldern Status (`offen` / `angenommen` /
  abgelöst — [[Einfrieren-und-Abloesen]]
  §Eintrittsregel) / Datum (letzter Statuswechsel) /
  Angelegt (`JJJJ-MM-TT`) / Zielmarke ([[Zielmarken]]) /
  Verfahren (VF-NNN) / Herkunft / Stellung / Quelle
  (Eingangsdokument oder Schriftsatz, in dem die
  Tatsache vorgetragen ist) / Beweis (Verweise auf
  [[Beweisangebote]]) / Detail (Wikilink, nur wenn
  Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** sobald die Tatsache mehr
  als einen Satz braucht, Belege gewürdigt werden oder
  Vermerke anfallen.
- **`assertion`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Sachverhalt]] — lesen
  beim Anlegen eines `assertion`-Knotens. Sektionen:
  Tatsache / Herkunft und Fundstelle / Stellung und
  Verlauf (Datum je Wechsel) / Belege / Vermerke
  (append-only) / Bezüge (Fassaden-Eintrag
  [[Sachverhalt]]). Dateiname `TAT-NNN <Kurzsatz>.md`.
- **Pflege:** beim Einlesen jedes Eingangs mit Vortrag,
  beim Entwurf jedes eigenen Schriftsatzes, nach jedem
  Termin ([[Marken-SP-2]] §Termin).

---

**Bearbeitungsstand:** _(vom Agenten beim Stufenwechsel
und laufend gepflegt)_

## Tatsachen

_(Einträge nach ID, chronologisch angelegt; Herkunft
und Stellung je Eintrag)_
