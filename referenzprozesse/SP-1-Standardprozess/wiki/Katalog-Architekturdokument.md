---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Architekturdokument

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Architekturdokument zu Marke M“ der
Phase P5 (Kennung `architekturdokument`) — ein Stand
aus mehreren Registern. Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.
RP-1 präzisiert den Komponenten-Fall als Ergänzung
unten.

### architekturdokument

- **Zweck:** „für P6/P7“ — Teilaktivitäten starten
  und Technologie auswählen dürfen die Architektur als
  verlässliche Grundlage nehmen.
- **Phase:** P5
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard (bei einer Komponente:
  [[Kettenpruefung]] §Komponenten-Kette nach
  Übernahme-Art).
- **Quell-Register und Filter:** die
  Architektur-Festlegungen (ARC) der Marke aus der
  Architektur-Fassade ([[Systemarchitektur]]; mit RP-1
  deren Ablösung), die Entscheidungen (DEC) der Marke
  aus [[Entscheidungen]], auf die sich die ARC stützen,
  und die Funktionsbeschreibungen (FUNC) der Marke aus
  [[Funktionsbeschreibungen]] — jeweils mit Status
  `angenommen`, `in-umsetzung`, `umgesetzt` oder
  `abgeschlossen`, ARC und FUNC an einer vorgelegten,
  noch nicht freigegebenen Version auch `offen` — im
  Kopf ausgewiesen, mit der Freigabe angenommen
  ([[Einfrieren-und-Abloesen]] §Ableitungsprüfung) —
  (nicht verworfen; für die Marke nicht
  abgelöst — ein Element mit Status `abgelöst` gehört
  dazu, solange sein Nachfolger für die Marke nicht
  gilt, [[Einfrieren-und-Abloesen]] §Stand;
  mit `zielmarke:` dieser oder einer früheren Marke,
  Bestands-Elemente ohne Feld eingeschlossen). **Keine
  Contracts:** die Existenz
  einer Schnittstelle folgt aus dem Zuschnitt (das
  ARC-Element nennt Provider und Consumer); ihren
  Inhalt verhandelt der Provider in seinem P4 — oder
  das, was dieses Glied vertritt
  ([[Katalog-Contract-Index#Rollen eines CON in der Kette]]).
  Kopiert werden die lebenden Abschnitte der
  Architektur-Fassade (§Komponenten mit Lage) und
  referenzierte Glossar-Einträge.
- **Pflichtfelder:** `type: architekturdokument`,
  `marke`, `zweck`, `herkunft`, `datum` (seit 2.0)
  (Herkunftszeile und Datum des Stands:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
- **RP-1-Präzisierung** (gilt bei aktivem RP-1): Beim
  Koordinator ist der Zuschnitt in Komponenten ein
  ARC-Element dieses Stands; aus ihm folgt, welche
  Schnittstellen es gibt und für welche Komponenten
  ein Übergabe-Stand entsteht ([[Katalog-Uebergabe]]).
