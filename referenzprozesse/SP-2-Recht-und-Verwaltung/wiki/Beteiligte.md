---
type: party-log
# active: false   # bei Deaktivierung (Default ist active: true; Pflicht ab Stufe 1)
---

# Beteiligte

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `party-log` — Relations-Register: wer ist in
  welchem Verfahren in welcher Rolle beteiligt
  (Relation Person oder Organisation ↔ Verfahren,
  Element-Typ `party`). Singleton; **Pflicht ab
  Stufe 1**. Der Anwender ist immer ein Eintrag.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register. Bauform
  wie [[Mitgliedschaften]] (Relation als Detail-Knoten),
  inhaltlich davon getrennt (Abgrenzung unten).
- **Kanonizität:** die Wahrheit bei Rolle und
  Vertretung liegt in dieser Fassade — Detail-Knoten
  spiegeln (Wiki.md §1.1a). **Kanonisch für Absender,
  Stimme und Unterschrift** jedes ausgehenden Dokuments:
  der Prüfplan liest sie ([[Vorgehen-SP-2]] §Prüfen).
- **Rolle je Verfahren und Instanz:** ein Beteiligter
  hat je Verfahren eine oder mehrere Rollen zugleich
  (die Voreinstellungen werden vereinigt, Widersprüche
  meldet der Agent); ein Wechsel mit der Instanz (etwa
  Kläger → Berufungsbeklagter) ist eine neue Zeile im
  Feld Rolle, die alte bleibt mit Instanz stehen.
  **Rollen-Grundbestand** (offene Liste): Kläger,
  Antragsteller, Beklagter, Antragsgegner,
  Beigeladener, Streitgenosse, Nebenintervenient bzw.
  Streitverkündeter, Gläubiger, Schuldner, Betroffener,
  Beschuldigter, Verletzter, Zeuge, Beschwerde- bzw.
  Rechtsmittelführer; gesetzlicher Vertreter oder
  Bevollmächtigter einer dieser Rollen; Zuarbeit zur
  Vertretung; Schreiben in fremder Stimme;
  Antragsteller ohne Gegner; **öffentliche Stelle**
  (Behörde, Körperschaft, Träger, Kammer) als
  Gegenüber, als entscheidende Stelle und als Rolle
  des Anwenders selbst. Dazu **Kostenträger**
  (Rechtsschutzversicherung — Deckungsanfrage und
  Deckungszusage als Erwartung bzw. Zusage in
  [[Fristen]] —, Prozessfinanzierer, Verband oder
  Gewerkschaft, Staatskasse; Feld Träger am
  Kosten-Posten, [[Kosten]]) und **Dritte mit eigener
  Frist** (Drittschuldner, Anfechtungsgegner,
  Streitverkündungsempfänger, Zeuge und
  Sachverständiger, Anmelder zu einem Verbands- oder
  Musterverfahren, Auskunftspflichtiger).
- **Anwender als öffentliche Stelle:** die
  Voreinstellungen kehren sich um — Marken,
  Begleitanträge und Prüfraster aus Sicht der
  erlassenden oder beklagten Stelle; die
  Prüfperspektive „Adressat bzw. Bürger“ tritt an die
  Stelle der Perspektive der Stelle ([[Vorgehen-SP-2]]
  §Prüfen; [[Wegweiser]]).
- **Voreinstellungen je Rolle** (typische Marken,
  Prüfperspektiven, Checkliste Begleitanträge) setzen
  die Schwerpunkte; sie stehen nicht hier, sondern in
  [[Marken-SP-2]], [[Vorgehen-SP-2]] §Prüfen und den
  Wegweisern der Ordnung ([[Wegweiser]]) — diese
  Fassade nennt nur die Rolle.
- **Rolle gelegentlich überprüfen:** bei jedem Marken-
  und Instanzwechsel, bei neuen Beteiligten und sonst
  per Wiedervorlage im Turnus ([[Fristen]], selbst
  gesetzt); Ergebnis als kurzer Vermerk am Eintrag,
  eine Änderung der Rolle ist eine Entscheidung
  ([[Entscheidungen]]). Der Wächter meldet eine fällige
  Rollen-Prüfung ([[Vorgehen-SP-2]] §Wächter).
- **Konflikt-Hinweis:** einen möglichen
  Interessenkonflikt benennt der Agent **einmal**, ohne
  Blockade; bei Vertretung Dritter einmal den Hinweis
  auf die rechtlichen Rahmenbedingungen des Vertretens
  Dritter, ohne Bewertung. Beides als Vermerk am
  Eintrag.
- **Abgrenzung der Rollen-Fassaden:**
  [[Ansprechpartner]] = Rolle einer **Person im
  Projekt** (Sachbearbeiter einer Stelle,
  Vertretung); Geschäftsbeziehungen (mit dem
  Standardprozess Systementwicklung) = **Organisation
  zum Projekt**; **Beteiligte** = **Rolle im
  Verfahren mit Vertretung** („Müller ist Kläger in
  Verfahren x“); [[Mitgliedschaften]] =
  **Zugehörigkeit unabhängig vom Projekt** („Maier ist
  Geschäftsführer in der Bau-Mich-Auf GmbH“). Dieselbe
  Bauform, nicht derselbe Gegenstand; wird eine
  Zugehörigkeit über Verfahren oder Zeit hinweg
  erheblich (etwa Organstellung eines Beteiligten in
  mehreren Verfahren), schlägt der Agent das
  Einschalten der Mitgliedschaften vor. Die
  Basis-Fassade [[Rollen]] (Nutzungsrollen für Bedarfe
  und Szenarien) wird in SP-2 nicht verwendet.
- **Eintragsformat:** `### <Beteiligter> in VF-NNN`
  mit Feldern Beteiligter ([[Personen]]- oder
  [[Organisationen]]-Knoten) / Verfahren (VF-NNN) /
  Rolle (eine oder mehrere; je Zeile Rolle und
  Instanz) / Stellung (Gegenüber, entscheidende
  Stelle, Dritter, Anwender) / Vertretung (wer
  vertritt; Wikilink auf den Eintrag der Vertretung) /
  Vollmacht (vorhanden · Original · Nachweis · Frist) /
  Elektronischer Kanal (Pflicht zur Nutzung
  elektronischer Kanäle: Berufsträger, Behörde,
  eröffneter Zugang — ja/nein, mit Kanal) / Interessen
  und Beziehungen / Kostenträger (nur bei
  Kostenträgern: wofür) / Eigene Frist (nur bei
  Dritten mit eigener Frist: Verweis auf [[Fristen]]) /
  Angelegt (`JJJJ-MM-TT`) / Detail (Wikilink auf den
  `party`-Knoten).
- **Detail-Knoten-Pflicht:** sobald Vollmacht,
  Interessen oder Vermerke anfallen — beim Anwender
  und seinem Gegenüber in der Regel sofort.
- **`party`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Beteiligte]] — lesen
  beim Anlegen eines `party`-Knotens. Sektionen:
  Rolle und Instanz / Vertretung und Vollmacht /
  Interessen und Beziehungen / Vermerke (append-only;
  Rollen-Prüfung, Konflikt-Hinweis) / Bezüge
  (Fassaden-Eintrag [[Beteiligte]]). Dateiname
  `<Beteiligter> in VF-NNN.md`.
- **Pflege:** beim Init (Rolle und Interessen,
  [[Vorgehen-SP-2]] §Init; der Pflichtteil „Rolle und
  Interessen“ des [[Mission Statement]] fasst zusammen
  und verlinkt hierher), bei jedem neuen Beteiligten im
  Posteingang, bei jeder Strang-Entscheidung.

---

**Bearbeitungsstand:** _(vom Agenten beim Init und laufend
gepflegt)_

## Einträge

_(nach Verfahren gruppiert; je Verfahren zuerst der
Anwender, dann Gegenüber, dann weitere Beteiligte und
Dritte mit eigener Frist)_
