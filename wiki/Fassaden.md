---
type: facade-registry
active: true   # kann nicht deaktiviert werden — die FassadenLandkarte ist Pflicht-Fassade (mandatory)
---

# Fassaden

## Meta

- **Typ:** `facade-registry` — Register aller Fassaden
  des Projekts (MetaFassade: ihre „Detail-Elemente"
  sind andere Fassaden). Singleton, Pflicht-Fassade.
- **Zweiklang:** diese Landkarte ist die
  Kurzform-Übersicht (Kontextfenster-Schoner); die
  einzelnen Fassaden-Dateien sind die Vollversionen —
  dort lebt je Fassade die Betriebs-Semantik in deren
  `## Meta`.
- **Kanonizität:** der Aktivierungs-Status aller
  Fassaden (aktiv / deaktiviert) lebt führend hier;
  das Frontmatter-Feld `active:` der jeweiligen Fassade
  wird synchron gehalten.
- **Eintrag-Aufbau:** Kurzform-Erklärung (Zweck in
  diesem Projekt) — Wikilink auf die Fassaden-Datei —
  Status (`aktiv` / `deaktiviert`) — Kategorie (`Basis`
  / `Prozess-mitgebracht (<Prozess>)` / `projekt-eigen`).
- **Pflege:** bei Aktivierung, Deaktivierung
  („deaktiviere X" / „reaktiviere X"), Prozess-Merge
  und Anlage projekt-eigener Fassaden im selben Vorgang
  nachführen.
- **Abgrenzung:** [[Knotentypen]] = was gibt es
  strukturell (Typ-Katalog); diese Landkarte = was ist
  in diesem Projekt aktiv und wozu; [[InterneMechanik]]
  = wie steuert sich dieses Projekt; [[Facts]] = was
  hat der Anwender festgeschrieben.

---

**Stand:** Vorbelegt beim Starter-Bau (RP-1 auf
SP-1, Vorfestlegungen eingearbeitet; Rollen-Frage
Standalone/Koordinator offen — bei „Koordinator“
wird [[Contract-Index]] regulär aktiviert).

## InterneMechanik und MetaFassade

**[[InterneMechanik]]** ist die besondere Fassade für
die Projekt-Steuerung: sie katalogisiert das gesamte
Steuerungs-Wissen dieses Projekts (Konzepte, Prozeduren,
Muster, Regeln) als `internal-*`-Detail-Knoten — der
Einstieg für „wie steuert sich dieses Projekt". Status:
aktiv, Kategorie Basis, nicht deaktivierbar.

Diese Landkarte selbst ([[Fassaden]], Typ
`facade-registry`) ist das Register aller Fassaden —
Status: aktiv, Kategorie Basis, nicht deaktivierbar.

## Aktive Fassaden

| Fassade | Kurzform | Status | Kategorie |
|---|---|---|---|
| [[Mission Statement]] | Projekt-Überblick (Kurzform) | aktiv _(Vorauswahl)_ | Basis |
| [[Facts]] | Projekteinstieg, Anwender-Fakten, Stolpersteine | aktiv | Basis |
| [[Chronologie]] | Zeitachse: was ist wann passiert | aktiv _(Vorauswahl)_ | Basis |
| [[Fristen]] | Fälligkeitsübersicht Offen/Erledigt/Abgelaufen | aktiv _(Vorauswahl)_ | Basis |
| [[Ansprechpartner]] | wer ist wofür zuständig | aktiv _(Vorauswahl)_ | Basis |
| [[Ideen]] | Register unverbindlicher Ideen | aktiv _(Vorauswahl)_ | Basis |
| [[Entscheidungen]] | Register aller Entscheidungen | aktiv _(Vorauswahl)_ | Basis |
| [[Glossar]] | freigegebene Terminologie | aktiv _(Vorauswahl)_ | Basis |
| [[Glossar Review]] | Glossar-Vorschläge in Bearbeitung | aktiv _(Vorauswahl)_ | Basis |
| [[Konzepte]] | Register der Sach-Wissens-Anker (concept-Knoten) | aktiv _(Vorauswahl)_ | Basis |
| [[Zielmarken]] | Register der Planungs-Horizonte (Zeiger current/in-progress) | aktiv _(Vorauswahl)_ | Basis |
| [[Knotentypen]] | kanonischer Typen-Katalog | aktiv | Basis |
| [[InterneMechanik]] | Steuerungs-Wissen des Projekts | aktiv | Basis |
| [[Eingangsdokumente]] | Register aller Eingangsdokumente | aktiv _(Vorauswahl)_ | Basis |
| [[Agent-Berichte]] | Register aller Sub-Agent-Berichte | aktiv _(Vorauswahl)_ | Basis |
| [[Rechercheartefakte]] | Register aller Rechercheartefakte (Nachweis, nicht Wahrheit) | aktiv _(Vorauswahl)_ | Basis |
| [[Personen]] | Register aller Personen-Knoten | aktiv _(Vorauswahl)_ | Basis |
| [[Organisationen]] | Register aller Organisations-Knoten | aktiv _(Vorauswahl)_ | Basis |
| [[Anforderungen]] | REQ-Register (funktional/nicht-funktional) | aktiv | Prozess-mitgebracht (SP-1) |
| [[Fehlermeldungen]] | BR-Register | aktiv | Prozess-mitgebracht (SP-1) |
| [[Verwendungs-Rollen]] | Register der Nutzer-Rollen | aktiv | Prozess-mitgebracht (SP-1) |
| [[Softwaresystemarchitektur]] | Sollzustand Systemarchitektur (löst SP-1-Systemarchitektur ab) | aktiv | Prozess-mitgebracht (RP-1) |
| [[Softwaresystemtest-Setup]] | Sollzustand Test-Setup (löst SP-1-Systemtest-Setup ab) | aktiv | Prozess-mitgebracht (RP-1) |
| [[Spezifikationen]] | SPEC-Register (lebende Fassungen) | aktiv | Prozess-mitgebracht (RP-1) |

## Deaktivierte Fassaden

| Fassade | Kurzform | Status | Kategorie |
|---|---|---|---|
| [[Mission Statement Long]] | Projekt-Überblick (Langform) | deaktiviert _(Vorauswahl)_ | Basis |
| [[Orte]] | Register aller Orts-Knoten | deaktiviert _(Vorauswahl)_ | Basis |
| [[Dinge]] | Register aller `thing`-Knoten (physische Dinge) | deaktiviert _(Vorauswahl)_ | Basis |
| [[Mitgliedschaften]] | Relations-Register Person↔Organisation | deaktiviert _(Vorauswahl)_ | Basis |
| [[Aktenzeichen]] | Register aller Aktenzeichen | deaktiviert _(Vorfestlegung; Reaktivierung per Zuruf)_ | Basis |
| [[Geschäftsbeziehungen]] | Register externer Organisations-Beziehungen | deaktiviert _(Vorauswahl)_ | Prozess-mitgebracht (SP-1) |
| Contract-Index | Contract-Register — **nicht aktiviert**; wird bei Koordinator-Entscheid aus `referenzprozesse/RP-1-Systementwicklung/wiki/` aktiviert | nicht aktiviert _(Rollen-Option)_ | Prozess-mitgebracht (RP-1) |
