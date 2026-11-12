---
type: cost-log
active: false   # ab Stufe 1 aktivierbar; Pflicht mit dem Auslöser (Kostenantrag, PKH, Beratungshilfe, Erstattung im Vorverfahren, Vorschuss) — dann setzt der Agent active: true
---

# Kosten

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis). Sie
ist **ab Stufe 1 aktivierbar** und wird **Pflicht,
sobald** Kostenantrag, Prozess- oder
Verfahrenskostenhilfe, Beratungshilfe, Erstattung im
Vorverfahren oder ein Vorschuss ins Spiel kommt; bis
dahin liegt sie mit `active: false` bereit.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Kosten.md`
  — bei Aktivierung von dort abarbeiten.
- **Typ:** `cost-log` — Register der Kosten-Posten je
  Verfahren (Element-Typ `cost-item`): Streitwert,
  Gerichtskosten, Prozess- bzw. Verfahrenskostenhilfe,
  Beratungshilfe, Erstattung, Honorare, Vorschüsse,
  Kostenrisiko. Singleton; **Pflicht ab:** Auslöser
  (oben).
- **Kategorie:** (b) Inline-Fassade im wiki/ mit
  Detail-Knoten nur bei gewichtigen Posten (Hybrid wie
  [[Fristen]]) — siehe Wiki.md §Kategorisierung der
  Register.
- **Kanonizität:** die Wahrheit bei Betrag und Status
  liegt in dieser Fassade; Detail-Knoten spiegeln
  (Wiki.md §1.1a). Ein Kosten-Posten ist lebend (Klasse
  außerhalb): Beträge und Stände ändern sich am
  Eintrag; die Entscheidung über einen Kostenantrag
  oder eine Deckungsanfrage wird in [[Entscheidungen]]
  gebucht, der Posten hält die Fakten.
- **Träger** (Feld, offene Liste): `selbst` ·
  `rechtsschutzversicherung` · `prozessfinanzierer` ·
  `verband` · `staatskasse` · `gegenueber`
  (Erstattung) — wer den Posten trägt oder tragen
  soll; der Träger ist ein Eintrag in [[Beteiligte]]
  (Kostenträger). Eine Deckungsanfrage ist eine
  Erwartung, eine Deckungszusage eine Zusage in
  [[Fristen]].
- **Kostenrisiko:** je Verfahren ein Posten der Art
  `kostenrisiko` mit dem Betrag bei vollständigem
  Unterliegen (Gerichtskosten, eigene und fremde
  Vertretung, Auslagen), aktualisiert bei
  Streitwertänderung und Instanzwechsel; Grundlagen
  nach dem Kostenregime der Ordnung ([[Wegweiser]]).
- **Begleitanträge mit Kostenwirkung** (vorsorgliche
  Kostenanträge, PKH, Sicherheitsleistung) prüft der
  Agent bei jedem verfahrensgestaltenden Schritt
  ([[Vorgehen-SP-2]] §Prüfen); das Ergebnis steht im
  Stand zu den Verfahrens-Entscheidungen
  ([[Katalog-Verfahrens-Entscheidungen]]), der Posten
  hier.
- **Eintragsformat:** `### <Verfahren> — <Art> —
  <Bezeichnung>` mit Feldern Verfahren (VF-NNN) / Art
  (`streitwert` · `gerichtskosten` · `pkh` ·
  `beratungshilfe` · `erstattung` · `honorar` ·
  `vorschuss` · `kostenrisiko`; offene Liste) / Betrag
  (mit Währung; bei Streitwert der festgesetzte oder
  angenommene Wert) / Träger / Status (`offen` ·
  `beantragt` · `festgesetzt` · `gezahlt` ·
  `erstattet` · `abgelehnt`; offene Liste) / Grundlage
  (Norm oder Gebührentatbestand aus dem Wegweiser,
  Festsetzungsbeschluss als Eingangsdokument) / Frist
  (Zahlungs- oder Antragsfrist, [[Fristen]]) / Angelegt
  (`JJJJ-MM-TT`) / Detail (Wikilink, nur wenn
  Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** bei Kostenfestsetzung,
  PKH-Verfahren und Deckungsstreit — sobald Verlauf
  oder Vermerke anfallen.
- **`cost-item`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Kosten]] — lesen beim
  Anlegen eines `cost-item`-Knotens. Sektionen:
  Posten und Grundlage / Verlauf (Antrag, Festsetzung,
  Zahlung mit Datum) / Vermerke (append-only) /
  Bezüge (Fassaden-Eintrag [[Kosten]], Verfahren).
  Dateiname `<VF-NNN> Kosten <Art> <Bezeichnung>.md`.
- **Pflege:** bei Aktivierung (Bestand aus der Akte),
  bei jedem Kostenbeschluss, jeder Rechnung, jeder
  Zahlung und jedem Instanzwechsel.

---

**Bearbeitungsstand:** _(vom Agenten bei Aktivierung und
laufend gepflegt)_

## Einträge

_(je Verfahren; Kostenrisiko zuerst, dann die Posten
chronologisch)_
