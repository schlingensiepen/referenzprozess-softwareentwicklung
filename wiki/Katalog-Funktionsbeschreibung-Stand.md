---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Funktionsbeschreibung-Stand

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Funktionsbeschreibung zu Marke M“ der
Phase P4 (Kennung `funktionsbeschreibung-stand`),
abgeleitet aus dem FUNC-Register
([[Katalog-Funktionsbeschreibungen]]). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert. RP-1 präzisiert den Komponenten-Fall als
Ergänzung unten.

### funktionsbeschreibung-stand

- **Zweck:** „für P5 Zerlegen in Bausteine“ — die
  Architektur darf die Funktionsbeschreibung als
  verlässliche Grundlage nehmen.
- **Phase:** P4
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard (Lint-Anteil REQ → FUNC:
  [[Kettenpruefung]] §Lint-Anteil).
- **Quell-Register und Filter:**
  [[Funktionsbeschreibungen]] — FUNC der Marke mit
  Status `angenommen`, `in-umsetzung`, `umgesetzt`
  oder `abgeschlossen`, an einer vorgelegten, noch
  nicht freigegebenen Version auch `offen` — im Kopf
  ausgewiesen, mit der Freigabe angenommen
  ([[Einfrieren-und-Abloesen]] §Ableitungsprüfung)
  — (nicht verworfen; für die Marke
  nicht abgelöst — eine FUNC mit Status `abgelöst`
  gehört dazu, solange ihr Nachfolger für die Marke
  nicht gilt, [[Einfrieren-und-Abloesen]] §Stand; mit
  `zielmarke:` dieser oder einer
  früheren Marke, Bestands-Elemente ohne Feld
  eingeschlossen; Außensicht: Verhalten,
  Qualitäten, Schnittstellen nach außen); kopiert
  werden referenzierte Rollen und Glossar-Einträge
  (was als referenziert gilt:
  [[Einfrieren-und-Abloesen]] §Kopien).
- **Pflichtfelder:** `type: funktionsbeschreibung-stand`,
  `marke`, `zweck`, `herkunft`, `datum` (seit 2.0)
  (Herkunftszeile und Datum des Stands:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
- **Komponenten-Kette:** welche Glieder bei einer
  Komponente der Übergabe-Stand des Koordinators
  ersetzt oder vertritt — [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art; lesen, bevor
  dieser Stand bei einer Komponente gebildet wird.
- **RP-1-Präzisierung** (gilt bei aktivem RP-1): Bei
  einer Komponente ist das die
  Teil-Funktionsbeschreibung; als Provider nennt sie
  die Contracts, die sie anbietet, als Verweise
  `<koordinator>/CON-NNN` — Rollen eines CON je Phase:
  [[Katalog-Contract-Index#Rollen eines CON in der Kette]].
