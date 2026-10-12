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
  gewählt (B Submodul unter `_template/` oder A
  Einmal-Kopie unter `_template/`, mit dem Projekt
  committet — DEC-223); Phase A0 und Prozess-Merge
  beim Starter-Bau vorab vollzogen
  (Starter-Vorfestlegung). `referenzprozesse/`
  bleibt in beiden Modi unter
  `_template/referenzprozesse/`.
- **Template-Herkunft:** **OFFEN** — beim Einbinden
  vom Agenten einzutragen: Quelle (Repo-URL) und
  Stand (Commit-Hash bzw. Tag); bei Modus A der
  Stand der Einmal-Kopie unter `_template/`, bei
  Modus B der Submodul-Pin (DEC-223).
- **RP-1-Rolle:** **OFFEN** — Standalone oder
  Koordinator entscheidet der Anwender im
  INIT.md-Fragen-Block. Bei „Koordinator":
  Contract-Index aus
  `_template/referenzprozesse/RP-1-Systementwicklung/wiki/`
  aktivieren und das Werkstatt/Produkt-Angebot
  vorlegen ([[Two-Repo-Submodul-Muster]]).
- **Abweichungen von der Vorauswahl:**
  Aktenzeichen deaktiviert (Vorfestlegung;
  Reaktivierung per Zuruf). Keine weiteren
  Abweichungen — das Entscheidungs-Register folgt
  dem RP-1-Standard.
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
