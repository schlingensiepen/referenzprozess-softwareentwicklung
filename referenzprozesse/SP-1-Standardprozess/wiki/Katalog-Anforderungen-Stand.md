---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Anforderungen-Stand

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Anforderungen zu Marke M“ der Phase P3
(Kennung `anforderungen-stand`), abgeleitet aus dem
REQ-Register ([[Katalog-Anforderungen]]). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### anforderungen-stand

- **Zweck:** „für P4 Beschreiben der Funktion“ — die
  Funktionsbeschreibung darf die Anforderungen als
  verlässliche Grundlage nehmen.
- **Phase:** P3
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard (offene und aufgeschobene
  REQ vor der Bildung: [[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung).
- **Quell-Register und Filter:** [[Anforderungen]] —
  REQ der Marke mit Status `angenommen`,
  `in-umsetzung`, `umgesetzt` oder `abgeschlossen`
  (nicht verworfen; für die Marke nicht abgelöst —
  ein REQ mit Status `abgelöst` gehört dazu, solange
  sein Nachfolger für die Marke nicht gilt,
  [[Einfrieren-und-Abloesen]] §Stand; mit `zielmarke:`
  dieser oder einer früheren Marke, Bestands-Elemente
  ohne Feld eingeschlossen); kopiert
  werden referenzierte Rollen und Glossar-Einträge
  (was als referenziert gilt:
  [[Einfrieren-und-Abloesen]] §Kopien).
- **Pflichtfelder:** `type: anforderungen-stand`,
  `marke`, `zweck`, `herkunft`, `datum` (seit 2.0)
  (Herkunftszeile und Datum des Stands:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
- **Komponenten-Kette:** welche Glieder bei einer
  Komponente der Übergabe-Stand des Koordinators
  ersetzt oder vertritt — [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art; lesen, bevor
  dieser Stand bei einer Komponente gebildet wird.
