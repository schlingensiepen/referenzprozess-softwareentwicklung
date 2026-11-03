---
type: internal-rule
---

# Aktivierter-Prozess

- **Aktive Prozesse:** Basis, SP-1, RP-1.
- **Gewählter Prozess:** **RP-1 Entwicklung eines
  Softwaresystems** (setzt SP-1 voraus; beide beim
  Starter-Bau nach Wiki.md §11.3 gemergt —
  Vorfestlegung des Starters, kein Prozess-Angebot
  beim Init). `referenzprozesse/` bleibt in beiden
  Anbindungs-Modi unter `_template/referenzprozesse/`.
- **Abweichungen von der Vorauswahl:** Aktenzeichen
  deaktiviert (Vorfestlegung; Reaktivierung per Zuruf).
- **Aktive Prozess-Präfixe** (aus dem SP-1-Steckbrief
  §Mitgebrachte Präfixe verbucht, Wiki.md §11.3
  Schritt 6; zusätzlich zu den Basis-Präfixen aus
  MasterPrompt §6.2): `Anforderungen:`,
  `Funktionsbeschreibungen:`, `Spezifikationen:`,
  `Fehlermeldungen:`, `Architektur:`, `Test-Setup:`,
  `Systemkomponente:`, `Code:`, `Scaffolding:`,
  `devstate:`, `Freigabe:`. RP-1 führt `Freigabe:`
  unverändert fort und bringt keine eigenen Präfixe
  mit (RP-1-Steckbrief §Mitgebrachte Präfixe). Die
  Register Testfälle, Testberichte, Deployments,
  Zielumgebungen und Contract-Index haben keinen
  eigenen Präfix; Änderungen laufen unter `Wiki:`.
- **Mechanik-Einführung (Wiki.md §11.3 Schritt 7):**
  die SP-1-Mechanik-Knoten [[Register-Lebenszyklus]]
  (internal-concept), [[Meilenstein-und-T2]]
  (internal-rule), [[Register-Grundmuster]]
  (internal-pattern) und [[devstate-Skelett]]
  (internal-pattern) sind kopiert und in
  [[InterneMechanik]] eingetragen (Prozess-mitgebracht,
  SP-1); RP-1 bringt keine eigenen Mechanik-Knoten mit
  (RP-1-Steckbrief §Mitgebrachte Mechanik).

## Herkunft

- **Template-Stand:** offen — die Migration schreibt
  `2.1 seit JJJJ-MM-TT` (Übernahme-Tag, Stichtag des
  Bestandsschutzes; Übernommenes bleibt Bestand)
- **Quelle:** offen — Repo-URL und Commit bzw. Tag;
  bei Modus A der Stand der Einmal-Kopie unter
  `_template/`
- **Anbindungs-Modus:** offen — A | B, vom Anwender
  beim Einbinden gewählt
- **Prozess:** RP-1 (setzt SP-1 voraus; beide beim
  Starter-Bau gemergt — Phase A0 und Prozess-Merge
  vorab vollzogen)
- **Rolle:** offen (Fragen-Block der Migration,
  `_template/migration/MIGRATION.md` Phase 1; bei
  Rolle Koordinator aktiviert die Migration den
  Contract-Index nach seinem SP-1-Bootstrap in
  Phase 5)
- **Übernahme-Art:** — (Rolle offen; bei Rolle
  Komponent trägt die Migration sie ein)

Format der Zeilen: [[Init-Choreografie]] §Phase A0
„Herkunfts-Vermerk“ — der Lint liest aus
`Template-Stand` den Stichtag und aus `Übernahme-Art`
das erste Wort. Bis die Migration die offenen Werte
schreibt, läuft der Lint mit der Option `--stichtag`
(Eintrag in `Tools.md` §Projekt-Skripte).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Format des Herkunfts-Vermerks: [[Init-Choreografie]]
  §Phase A0
- Aktivierungs-Stand je Fassade: [[Fassaden]]
