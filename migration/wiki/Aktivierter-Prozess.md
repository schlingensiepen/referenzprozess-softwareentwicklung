---
type: internal-rule
---

# Aktivierter-Prozess

- **Gewählter Prozess:** **RP-1 Entwicklung eines
  Softwaresystems** (setzt SP-1 voraus; beide beim
  Starter-Bau nach Wiki.md §11.3 gemergt —
  Vorfestlegung, kein Anwender-Init-Entscheid mehr
  nötig).
- **Anbindungs-Modus:** vom Anwender beim Einbinden
  gewählt (B Submodul `_template/` oder A
  Einmal-Kopie); Phase A0 und Prozess-Merge beim
  Starter-Bau vorab vollzogen
  (Starter-Vorfestlegung).
- **RP-1-Rolle:** **OFFEN** — Standalone oder
  Koordinator entscheidet der Anwender im
  Fragen-Block der Migration
  (`_template/migration/MIGRATION.md` Phase 1). Bei „Koordinator": Contract-Index aus
  `referenzprozesse/RP-1-Systementwicklung/wiki/`
  aktivieren und das Werkstatt/Produkt-Angebot
  vorlegen ([[Two-Repo-Submodul-Muster]]).
- **Abweichungen von der Vorauswahl:**
  Aktenzeichen deaktiviert (Vorfestlegung;
  Reaktivierung per Zuruf); Entscheidungs-Register
  ohne MADR-Detail-Knoten-Pflicht (Register-Zeilen
  genügen; Detail-Knoten nur bei Bedarf nach
  Wiki.md-Grundregeln).
- **Abgelöste Ausprägungen:** SP-1-Systemarchitektur
  → [[Softwaresystemarchitektur]];
  SP-1-Systemtest-Setup →
  [[Softwaresystemtest-Setup]].
- **Aktive Prozess-Präfixe** (aus SP-1-Steckbrief
  §Mitgebrachte Präfixe verbucht, §11.3 Schritt 6):
  `Anforderungen:`, `Fehlermeldungen:`,
  `Architektur:`, `Test-Setup:`,
  `Systemkomponente:`, `Code:`, `Scaffolding:`,
  `devstate:`, `Freigabe:` — RP-1 bringt keine
  weiteren mit.
- **Mechanik-Einführung (§11.3 Schritt 7):** die
  SP-1-Mechanik-Knoten [[Register-Lebenszyklus]],
  [[Meilenstein-und-T2]], [[Register-Grundmuster]],
  [[devstate-Skelett]] sind kopiert und in
  [[InterneMechanik]] eingetragen
  (Prozess-mitgebracht, SP-1).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
