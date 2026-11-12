---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Pruefplan

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Prüfplan zu Marke M“ der Phase P10 (Kennung
`pruefplan`) — die **Versandprüfung des eingefrorenen
Pakets** nach dem Tag; nach der Bauform des Testplans
eines Entwicklungsprozesses, ohne Vererbung. Der
Prüfbericht dazu ist ein `review-report`
([[Katalog-review-report]], Register [[Agent-Berichte]]).
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert.

### pruefplan

- **Zweck:** „für P13 Einreichen“ — die Einreichung
  darf das geprüfte Paket als verlässliche Grundlage
  nehmen.
- **Phase:** P10
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; Tag der Fassung gesetzt
  ([[Kettenpruefung]] §Kette). Der Prüfplan prüft nur
  noch das **Paket**: Formalia (Anträge, Unterschrift,
  Absender nach [[Beteiligte]], Form der Stelle),
  Anlagen (Verzeichnis ↔ Datei ↔ Nummer, Prüfsummen,
  Seitensumme ↔ Kanal), Kanal (geprüfter Versandweg der
  Stelle, Grenzen, Teil-Sendungen), Vertraulichkeit
  gegen den Empfänger ([[Vorgehen-SP-2]] §9),
  Rest-Formalia der Fundstellen (Kennzeichen
  „unverifiziert“ getilgt). Ein **inhaltlicher Fehler**
  in P10 führt zu einer neuen Fassung mit neuem Tag,
  nicht zu einer Korrektur im Paket.
- **Quell-Register und Filter:** die getaggte Fassung
  des Schriftsatzes ([[Katalog-Schriftsatz]]) bzw. der
  Termin-Vorbereitung; die Anlagen der Marke aus
  [[Anlagen]] mit Status `eingeführt`; die Beteiligten
  für Absender und Stimme; der geprüfte Versandweg des
  Empfängers aus [[Organisationen]]; die
  Vertraulichkeitsstufen der Quellen; die maschinelle
  Paketprüfung ([[Vorgehen-SP-2]] §6) als Vorlauf.
  Kopiert werden die Prüfpunkte je Perspektive mit
  Ergebnis.
- **Pflichtfelder:** `type: pruefplan`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); in
  einer Folge-Marke mit eigenem Tag wird dieselbe
  Ketten-ID als **Folge-Version** mit `marke:` der
  Folge-Marke fortgeführt ([[Vorgehen-SP-2]] §2).
- **Pflicht ab Stufe:** 1.
- **Herkunft:** `herkunft` führt zusätzlich den Tag der
  Fassung, nach dem der Stand freigegeben wird — immer
  den Tag der eigenen Marke.
- **Nachweis:** der Prüfbericht (`review-report`) zu
  diesem Prüfplan; sein Verweis steht im Pflichtfeld
  `review` des Versandstands (`Outgoing.md` §3.2) — ohne
  Eintrag kein Versandstand (`SP2-REVIEW`, FEHLER). Ein
  Prüfbericht mit offenem Befund ist keine Grundlage
  für P13.
- **Vertraulichkeit:** `intern`.
