---
type: submission-log
# active: false   # bei Deaktivierung (Default ist active: true; Pflicht ab Stufe 1)
---

# Schriftsätze

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `submission-log` — Register der
  Schriftsätze je Verfahren, **Kette in beide
  Richtungen**: eigene Schriftsätze, die des
  Gegenübers und die der Stelle (Gericht, Behörde)
  in einer chronologischen Reihe (Element-Typ
  `submission`, `extends: document`; sprechender Slug,
  kein Präfix). Singleton; **Pflicht ab Stufe 1**.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register — mit
  einer Besonderheit: **vor Einreichung bzw. Eingang
  nur eine Inline-Zeile.** Ein eigener Schriftsatz
  steht hier als Zeile `angekündigt` oder `in Arbeit`,
  sein Text lebt bis zur Einreichung als Produkt in
  `output/` (Fassungskette mit Tag, [[Marken-SP-2]];
  [[Katalog-Schriftsatz]]); der `submission`-Knoten
  entsteht erst mit der Einreichung bzw. dem Eingang
  und ist ab Anlage eingefroren.
- **Kanonizität:** Status und Kette liegen in dieser
  Fassade. Ein Schriftsatz ist ein **Nachweis**
  (Freeze ab Anlage): er wird nie geändert, nur um
  Vermerke ergänzt ([[Einfrieren-und-Abloesen]]
  §Nachweis). Eine Antwort ist ein neuer Eintrag mit
  Verweis auf den beantworteten.
- **Status** (`angekuendigt` · `in-arbeit` ·
  `eingereicht` · `eingegangen` · `gegenstandslos`):
  `eingereicht` ist nur die Fassung mit
  Einreichungsnachweis ([[Einreichungen]]);
  `eingegangen` ein fremder Schriftsatz, der als
  Eingangsdokument eingelesen ist
  ([[Eingangsdokumente]], `document_type:
  schriftsatz`); `gegenstandslos` ein angekündigter,
  der nicht mehr kommt (etwa nach Erledigung) — so
  bleiben Lücken sichtbar.
- **Eigene Zeilen** verweisen auf Marke, Tag und
  Einreichungen; **fremde Zeilen** auf das
  Eingangsdokument und die daraus gezogenen Fristen
  ([[Fristen]]). Fassungen der Vertretung gehen als
  Eingangsdokument mit ihrer Kennung ein; die Zeile
  verknüpft beide Zählungen.
- **`## Anlagen` je Knoten:** jeder eigene
  Schriftsatz-Knoten trägt den Abschnitt `## Anlagen`
  als **Sammler und Nachweis** — die Liste der Anlagen
  mit Nummer nach dem Schema des Verfahrens
  ([[Anlagen]]; im Entwurf nur `temp-`-IDs, endgültige
  Nummern beim Tag). Aus ihm wird das Paket des
  Versandstands gebaut (`attachments`, Outgoing.md);
  die maschinelle Paketprüfung ist Vorbedingung des
  Versandstands ([[Vorgehen-SP-2]] §Versand). Bei
  fremden Schriftsätzen listet der Abschnitt die
  mitgeteilten Anlagen.
- **Verfahrensgestaltende Schriftsätze** (Klageschrift,
  Antrag, Widerspruch, Einspruch, Rechtsmittel,
  Verteidigungsanzeige, Klageerwiderung, Erwiderung im
  Eilverfahren) lösen die Prüfung der Begleitanträge
  aus ([[Vorgehen-SP-2]] §Prüfen,
  [[Katalog-Verfahrens-Entscheidungen]]).
- **Eintragsformat:** `### JJJJ-MM-TT —
  <Kurzbezeichnung> (<Richtung>)` mit Feldern
  Verfahren (VF-NNN) / Richtung (`eigen` · `gegner` ·
  `stelle`) / Status / Antwort auf (Eintrag, den
  dieser beantwortet) / Marke und Tag (nur eigene;
  [[Zielmarken]]) / Einreichungen (nur eigene;
  Verweise auf [[Einreichungen]]) / Eingangsdokument
  (nur fremde; Wikilink) / Fristen (gezogene oder
  gesetzte, [[Fristen]]) / Vertraulich (Stufe, falls
  nicht `offen`) / Detail (Wikilink, erst ab
  `eingereicht` bzw. `eingegangen`). Das Datum ist bei
  eigenen der Tag der Einreichung (bis dahin der
  geplante), bei fremden das Zugangsdatum.
- **Detail-Knoten-Pflicht:** mit der Einreichung bzw.
  dem Eingang — nie davor.
- **`submission`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Schriftsaetze]] — lesen
  beim Anlegen eines `submission`-Knotens. Sektionen:
  Kurzzusammenfassung / Anträge / Vortrag und
  Argumente (Verweise auf [[Sachverhalt]] und
  [[Argumente]]) / **Anlagen** / Einreichung bzw.
  Eingang (Nachweis, Zugang) / Vermerke (append-only) /
  Bezüge (Fassaden-Eintrag [[Schriftsaetze]],
  Verfahren). Dateiname
  `JJJJ-MM-TT Schriftsatz <Kurzbezeichnung>.md`.
- **Pflege:** mit jeder Marke (Zeile `angekündigt` beim
  Anlegen der Marke), beim Tag, bei jeder Einreichung
  und bei jedem Eingang eines Schriftsatzes.

---

**Bearbeitungsstand:** _(vom Agenten beim Init und laufend
gepflegt)_

## Einträge

_(je Verfahren chronologisch; eigene, gegnerische und
die der Stelle in einer Kette; angekündigte ohne
Detail-Knoten)_
