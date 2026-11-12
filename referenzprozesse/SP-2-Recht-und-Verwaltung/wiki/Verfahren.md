---
type: case-log
# active: false   # bei Deaktivierung (Default ist active: true; Pflicht ab Stufe 1)
---

# Verfahren

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `case-log` — Register aller Verfahren des
  Projekts (Element-Typ `case`). Ein Verfahren ist das,
  was ein Gegenüber mit uns führt oder wir mit ihm:
  Antrag, Vorverfahren, Streit, Gerichtsverfahren,
  Vollstreckung, Schlichtung. Singleton; **Pflicht ab
  Stufe 1**. Schlüssel ist das Aktenzeichen der Stelle
  ([[Aktenzeichen]]); bis eines vorliegt — und als
  gleichbleibende Register-ID darüber hinaus — trägt
  jedes Verfahren `VF-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register. Jedes
  Verfahren hat seinen `case`-Knoten; er ist der
  Fall-Knoten, an dem Fristen, Eingangsdokumente,
  Schriftsätze und Beteiligte hängen (`case:` bzw.
  `verfahren:` in deren Frontmatter).
- **Kanonizität:** die Wahrheit bei Verfahrens-Status
  liegt in dieser Fassade — Detail-Knoten spiegeln
  (Wiki.md §1.1a). **Der Status am Verfahren führt den
  Abschluss** ([[Marken-SP-2]] §Enden und
  Abschlussformen); Ruhen, Aussetzung und Unterbrechung
  sind Zustände des Verfahrens und seiner Marke, nie
  der Frist — die Fristen bleiben unter Wache
  ([[Fristen]], [[Vorgehen-SP-2]] §Fristen).
- **Status** (offene Liste mit Grundbestand): `laufend`
  · `ruhend` · `ausgesetzt` · `unterbrochen` ·
  `abgeschlossen`; bei `abgeschlossen` nennt das Feld
  Abschlussform die Form (offene Liste, Grundbestand in
  [[Marken-SP-2]]: Vergleich, Rücknahme, Anerkenntnis,
  Erledigung, Rechtskraft, Bestandskraft, Abhilfe,
  Einstellung, Verzicht, Erfüllung, Verjährungseintritt,
  Rücknahmefiktion, Nichtannahme, Schiedsspruch,
  Anwaltsvergleich). Nach dem Abschluss folgt die Marke
  Nachlauf ([[Marken-SP-2]]). **Ruhend auf Anwender-Wort:**
  ruht ein Verfahren auf Entscheidung des Anwenders,
  nennt das Kann-Feld `ruht_auf:` diese Entscheidung
  (Kennung des Eintrags in [[Entscheidungen]]); nur
  dann entfällt die Wecker-Pflicht
  ([[Vorgehen-SP-2]] §Fristen „Immer ein Wecker“) —
  ein Verfahren, das ohne Anwender-Entscheidung ruht,
  ausgesetzt oder unterbrochen ist, bleibt mit Wecker.
  Bei der Unterbrechung (Tod, Insolvenz, Verlust der
  Prozessfähigkeit, Anwaltsverlust) beginnen die
  Fristen nach der Aufnahme neu; Rechtsnachfolge ist ein
  Rollenwechsel in [[Beteiligte]].
- **Verfahrensgrundsatz** (`beibringung` |
  `amtsermittlung` | `gemischt`): steuert, welche
  Stellungen zum Vortrag [[Sachverhalt]] anbietet, und
  die Prüfperspektiven ([[Vorgehen-SP-2]] §Prüfen).
- **Nummerierungsschema der Anlagen** (Feld
  `anlagen_schema`): Präfix und Zählweise (je Verfahren
  über alle Schriftsätze oder je Schriftsatz) stehen
  hier, nirgends sonst; Voreinstellung nach
  Gerichtsbarkeit und Rolle aus dem Referenzprozess,
  eine gerichtliche oder behördliche Anordnung geht
  vor. Die Nummern selbst vergibt allein [[Anlagen]].
- **Vertretung und Vertretungszwang:** Feld
  `vertretungszwang` (`ja` | `nein` | `teilweise`, mit
  Erläuterung je Instanz und Handlung); die Vertretung
  selbst ist ein Eintrag in [[Beteiligte]] mit
  Vollmacht. Bei mandatierter Vertretung läuft das
  Mandat als Auftrag ohne Repo (Vorgehen.md §3).
- **Gegenüber:** eines oder mehrere, je mit Stellung
  (Gegner, Beigeladener, Streitgenosse, entscheidende
  Stelle …); Einzelheiten je Beteiligtem in
  [[Beteiligte]], hier nur die Kurzliste.
- **Stränge:** Ein neues Aktenzeichen, ein neues
  Gegenüber, ein neuer Antrag, ein Rechtsmittel oder
  eine neue Sache in der Akte ist ein Anlass für die
  Entscheidungsmatrix ([[Marken-SP-2]] §Stränge; Formen
  Serie, Bündel, Folge, Vorziehen, Abspaltung); der
  Anwender entscheidet, die Buchung ist eine
  Entscheidung der Art `strang` ([[Entscheidungen]]),
  die Form steht im Feld Strang-Form des Verfahrens.
  Ein Rechtsmittel in der nächsten Instanz ist ein
  neues Verfahren mit `vorgaenger:` auf das bisherige.
- **Eintragsformat:** `### VF-NNN — <Kurzbezeichnung>`
  mit Feldern Aktenzeichen (eines oder mehrere, Verweis
  auf [[Aktenzeichen]]; Umbenennung und Verbindung
  dort) / Stelle ([[Organisationen]]-Knoten mit
  `authority`) / Instanz / Vorgänger (VF-NNN) /
  Gegenüber (je mit Stellung) / Rolle (Rolle des
  Anwenders in diesem Verfahren, [[Beteiligte]]) /
  Vertretung / Vertretungszwang / Verfahrensgrundsatz /
  Anlagen-Schema / Anträge (Kurzliste; der Wortlaut
  steht im Schriftsatz) / Status / Abschlussform (nur
  bei `abgeschlossen`) / Ruht auf (nur bei `ruhend`
  auf Anwender-Wort) / Offener Zug (wer ist am Zug,
  was erwarten wir) / Strang-Form / Stufe (Ausbaustufe,
  in der das Verfahren begonnen hat) / Angelegt
  (`JJJJ-MM-TT`) / Detail (Wikilink auf den
  `case`-Knoten).
- **Detail-Knoten-Pflicht:** je Verfahren ein
  `case`-Knoten, mit der Anlage.
- **`case`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Verfahren]] — lesen
  beim Anlegen eines `case`-Knotens. Sektionen:
  Gegenstand und Beteiligte / Anträge / Verlauf
  (Instanzen, Marken, Status-Log mit Datum) / Fristen
  (Verweis auf [[Fristen]], nur die laufenden) /
  Schriftsätze (Verweis auf die Kette in
  [[Schriftsaetze]]) / Offene Punkte / Vermerke
  (append-only) / Bezüge (Fassaden-Eintrag
  [[Verfahren]]). Dateiname
  `VF-NNN <Kurzbezeichnung>.md`.
- **Pflege:** beim Init (bestehende Akte zuerst
  einlesen, [[Vorgehen-SP-2]] §Init), bei jedem
  Eingang, der Status, Instanz oder Gegenüber berührt,
  und bei jeder Strang-Entscheidung.

---

**Bearbeitungsstand:** _(vom Agenten beim Init und laufend
gepflegt)_

## Laufend

_(Verfahren mit Status `laufend`, `ruhend`,
`ausgesetzt` oder `unterbrochen`, nach ID)_

## Abgeschlossen

_(Verfahren mit Status `abgeschlossen`, nach ID, mit
Abschlussform)_
