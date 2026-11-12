---
type: exhibit-log
# active: false   # bei Deaktivierung (Default ist active: true; Pflicht ab Stufe 1)
---

# Anlagen

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `exhibit-log` — Register aller Anlagen, die
  in einem Verfahren eingeführt werden (Element-Typ
  `exhibit`; Schlüssel Verfahren + externe Nummer nach
  dem Schema des Verfahrens, kein Präfix). Singleton;
  **Pflicht ab Stufe 1**.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Nummernvergabe nur hier** — fortlaufend nach dem
  Schema des Verfahrens (Feld `anlagen_schema` in
  [[Verfahren]]: Präfix und Zählweise, je Verfahren
  oder je Schriftsatz; eine gerichtliche oder
  behördliche Anordnung geht vor), **ohne
  Wiederverwendung**: ein Rückzug lässt die Lücke mit
  Status stehen. **Nach der Einreichung ist eine
  Nummer unveränderlich.**
- **Temporäre IDs im Entwurf:** solange ein
  Schriftsatz in Arbeit ist, tragen seine Anlagen nur
  temporäre IDs mit dem Präfix `temp-` (etwa
  `temp-mietvertrag`) — projektweit eindeutig, auf
  einen Blick und maschinell erkennbar. **Endgültige
  lückenlose Nummern beim Tag** nach dem Schema des
  Verfahrens, im Anschluss an die schon eingereichten;
  Text, Verzeichnis und Paket werden maschinell
  umgeschrieben. Ein verbliebenes `temp-` im getaggten
  Schriftsatz, im Verzeichnis oder im Versandpaket
  **blockiert Tag und Versandstand** (FEHLER —
  [[Kettenpruefung]] §Lint-Anteil; die Paketprüfung in
  [[Vorgehen-SP-2]] §Versand).
- **Kanonizität:** jedes Dokument steht **einmal** in
  dieser Fassade; die erneute Verwendung in einem
  späteren Schriftsatz ist ein Verweis auf die
  eingereichte Nummer („bereits vorgelegt als <Nr>“)
  oder ein Verweis auf die Akte mit Blattzahl. Die
  Wahrheit bei Nummer und Status liegt hier —
  Detail-Knoten und die `## Anlagen`-Abschnitte der
  Schriftsätze ([[Schriftsaetze]]) spiegeln.
- **Element mit Sammelzustand `offen`:** eine Anlage
  ist bis zur Einreichung bearbeitbar (Quelle tauschen,
  Beweisthema schärfen); angenommen und eingefroren
  wird sie mit der Freigabe des Einreichungs-Stands
  ([[Katalog-Einreichung-Stand]]). Die Status-Achse
  **Verwendung** (`geplant` · `eingefuehrt` ·
  `zurueckgenommen` · `ersetzt`) ändert sich am
  eingefrorenen Element; ersetzt wird durch eine neue
  Anlage mit neuer Nummer.
- **Form:** `anlage` (die Datei liegt dem Schriftsatz
  bei) oder `aktenverweis` (Verweis auf die Akte mit
  Blattzahl, keine Datei im Paket).
- **Eintragsformat:** `### <Nummer> — <Bezeichnung>`
  (im Entwurf `### temp-<slug> — <Bezeichnung>`) mit
  Feldern Verfahren (VF-NNN) / Schriftsatz (in dem die
  Anlage eingeführt wird, [[Schriftsaetze]]) / Quelle
  (Wikilink auf das Dokument, [[Eingangsdokumente]],
  oder Ding, [[Dinge]]; mit Prüfsumme der Datei) /
  Beweisthema (wofür die Anlage steht; Verweis auf
  [[Sachverhalt]] und [[Beweisangebote]]) / Form /
  Verwendung / Status (`offen` / `angenommen`) /
  Angelegt (`JJJJ-MM-TT`) / Zielmarke ([[Zielmarken]]) /
  Detail (Wikilink, nur wenn Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** sobald Vermerke anfallen
  oder die Quelle mehr Erläuterung braucht als eine
  Zeile; sonst Inline-Eintrag.
- **`exhibit`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Anlagen]] — lesen beim
  Anlegen eines `exhibit`-Knotens. Sektionen: Quelle
  und Prüfsumme / Beweisthema / Verwendung (Verlauf
  mit Datum) / Vermerke (append-only) / Bezüge
  (Fassaden-Eintrag [[Anlagen]], Schriftsatz).
  Dateiname `<VF-NNN> Anlage <Nummer> <Bezeichnung>.md`.
- **Pflege:** mit jedem Schriftsatz-Entwurf
  (`temp-`-Zeilen), beim Tag (Nummern), mit dem
  Einreichungs-Stand (Freeze), bei Rückzug oder Ersatz.

---

**Bearbeitungsstand:** _(vom Agenten beim Init und laufend
gepflegt)_

## Einträge

_(je Verfahren nach Nummer; `temp-`-Einträge am Ende
des Verfahrens; eine Lücke durch Rückzug bleibt mit
Verwendung `zurueckgenommen` stehen)_
