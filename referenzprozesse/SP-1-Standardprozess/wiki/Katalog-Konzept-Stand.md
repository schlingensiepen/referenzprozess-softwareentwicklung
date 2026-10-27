---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Konzept-Stand

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Konzept zu Marke M“ der Phase P1
(Kennung `konzept-stand`), erstes Glied der Kette
([[Kettenpruefung]] §Kette). Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### konzept-stand

- **Zweck:** „für P2/P3“ — Stand der Technik erfassen
  und Anforderungen sammeln dürfen das Konzept als
  verlässliche Grundlage nehmen.
- **Phase:** P1
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; Freigabe, sobald die Bedarfe
  und Szenarien der Marke angenommen sind
  ([[Einfrieren-und-Abloesen]] §Ableitungsprüfung).
- **Quell-Register und Filter:** Bedarfe (NEED,
  [[Bedarfe]]) und Szenarien (SCEN, [[Szenarien]])
  der Marke mit Status `angenommen`, `in-umsetzung`,
  `umgesetzt` oder `abgeschlossen` (nicht verworfen;
  für die Marke nicht abgelöst — ein Element mit
  Status `abgelöst` gehört dazu, solange sein
  Nachfolger für die Marke nicht gilt,
  [[Einfrieren-und-Abloesen]] §Stand; mit
  `zielmarke:` dieser oder einer
  früheren Marke, Bestands-Elemente ohne Feld
  eingeschlossen; `offen`e und
  `aufgeschoben`e Einträge legt die Ableitungsprüfung
  vor); kopiert werden das lebende Konzept
  (referenzierte `concept`-Knoten aus [[Konzepte]]),
  die referenzierten Rollen ([[Rollen]]), die
  referenzierten Glossar-Einträge und das
  Mission-Dokument.
- **Pflichtfelder:** `type: konzept-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (seit 2.0) (Herkunftszeile und
  Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
- **Komponenten-Kette:** welche Glieder bei einer
  Komponente der Übergabe-Stand des Koordinators
  ersetzt oder vertritt — [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art; lesen, bevor
  dieser Stand bei einer Komponente gebildet wird.
