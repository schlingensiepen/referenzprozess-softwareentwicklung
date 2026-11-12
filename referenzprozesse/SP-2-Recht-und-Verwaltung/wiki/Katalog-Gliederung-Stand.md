---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Gliederung-Stand

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Gliederung zu Marke M“ der Phase P8 (Kennung
`gliederung-stand`) — die Bauanleitung des
Schriftsatzes aus Argumentation und
Verfahrens-Entscheidungen; bei einer Serie mit Manifest
je Einheit. Bei kurzen Schreiben ist der **Verzicht
üblich** (Verzichts-Entscheidung je Marke,
[[Kettenpruefung]] §Fehlende und vertretene Glieder).
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert.

### gliederung-stand

- **Zweck:** „für P9 Schriftsatz ausformulieren“ — der
  Schriftsatz darf Aufbau, Anträge, Reihenfolge der
  Linien und das Anlagenverzeichnis als verlässliche
  Grundlage nehmen.
- **Phase:** P8
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; Verfahrens-Entscheidungen der
  Marke freigegeben.
- **Quell-Register und Filter:** der
  Argumentations-Stand (ab Stufe 2) und die
  Verfahrens-Entscheidungen der Marke; die
  vorgesehenen Anlagen aus [[Anlagen]] (im Entwurf mit
  `temp-`-Kennung, Schema des Verfahrens); bei einer
  Serie die Einheiten aus [[Serien]] mit Manifest je
  Einheit; Formvorgaben der Stelle aus dem Wegweiser
  der Ordnung ([[Wegweiser]]) und dem geprüften
  Versandweg ([[Organisationen]]). Kopiert werden
  Aufbau, Anträge in der Fassung, die gestellt werden
  sollen, und das vorläufige Anlagenverzeichnis.
- **Pflichtfelder:** `type: gliederung-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); je
  Marke neu gebildet.
- **Pflicht ab Stufe:** 1; Verzicht bei kurzen
  Schreiben üblich.
- **Entfällt abgeleitet, wenn:** nie — ein Entfall
  läuft über den Verzicht je Marke.
- **Termin-Marke:** die Gliederung der
  Termin-Vorbereitung ist dieser Stand
  ([[Katalog-Termin-Vorbereitung]]); Verzicht üblich.
