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
- **Abgrenzung:** [[Katalog]] = was gibt es
  strukturell (welche Typen; Katalog-Einträge); diese
  Landkarte = was ist
  in diesem Projekt aktiv und wozu; [[InterneMechanik]]
  = wie steuert sich dieses Projekt; [[Facts]] = was
  hat der Anwender festgeschrieben.

---

**Bearbeitungsstand:** _(vom Agenten beim Init und laufend gepflegt)_

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

Ebenso nicht deaktivierbar sind [[Facts]], [[Katalog]],
[[Zielmarken]] und [[Entscheidungen]] (Pflicht-Fassaden
in jedem Projekt, Wiki.md §3a „mandatory“); sie stehen
mit Status `aktiv` ohne Vorauswahl-Vermerk in der
Tabelle unten.

## Aktive Fassaden

| Fassade | Kurzform | Status | Kategorie |
|---|---|---|---|
| [[Mission Statement]] | Projekt-Überblick (Kurzform) | aktiv _(Vorauswahl)_ | Basis |
| [[Facts]] | Projekteinstieg, Anwender-Fakten, Stolpersteine | aktiv | Basis |
| [[Chronologie]] | Zeitachse: was ist wann passiert | aktiv _(Vorauswahl)_ | Basis |
| [[Fristen]] | Fälligkeitsübersicht Offen/Erledigt/Abgelaufen | aktiv _(Vorauswahl)_ | Basis |
| [[Aktenzeichen]] | Register aller Aktenzeichen | aktiv _(Vorauswahl)_ | Basis |
| [[Ansprechpartner]] | wer ist wofür zuständig | aktiv _(Vorauswahl)_ | Basis |
| [[Ideen]] | Register unverbindlicher Ideen | aktiv _(Vorauswahl)_ | Basis |
| [[Entscheidungen]] | Register aller Entscheidungen, darunter Freigaben und Marken-Wechsel (Pflicht in jedem Projekt) | aktiv | Basis |
| [[Glossar]] | freigegebene Terminologie | aktiv _(Vorauswahl)_ | Basis |
| [[Glossar Review]] | Glossar-Vorschläge in Bearbeitung | aktiv _(Vorauswahl)_ | Basis |
| [[Konzepte]] | Register der Sach-Wissens-Anker (concept-Knoten) | aktiv _(Vorauswahl)_ | Basis |
| [[Zielmarken]] | Register der Marken — Zwischenziel-Anker des Projekts (Zeiger current/in-progress; Pflicht in jedem Projekt) | aktiv | Basis |
| [[Katalog]] | Katalog der Typen (Meta-Fassade mit Katalog-Einträgen) | aktiv | Basis |
| [[InterneMechanik]] | Steuerungs-Wissen des Projekts | aktiv | Basis |
| [[Eingangsdokumente]] | Register aller Eingangsdokumente | aktiv _(Vorauswahl)_ | Basis |
| [[Agent-Berichte]] | Register aller Sub-Agent-Berichte | aktiv _(Vorauswahl)_ | Basis |
| [[Rechercheartefakte]] | Register aller Rechercheartefakte (Nachweis, nicht Wahrheit) | aktiv _(Vorauswahl)_ | Basis |
| [[Personen]] | Register aller Personen-Knoten | aktiv _(Vorauswahl)_ | Basis |
| [[Organisationen]] | Register aller Organisations-Knoten | aktiv _(Vorauswahl)_ | Basis |

## Deaktivierte Fassaden

| Fassade | Kurzform | Status | Kategorie |
|---|---|---|---|
| [[Mission Statement Long]] | Projekt-Überblick (Langform) | deaktiviert _(Vorauswahl)_ | Basis |
| [[Orte]] | Register aller Orts-Knoten | deaktiviert _(Vorauswahl)_ | Basis |
| [[Dinge]] | Register aller `thing`-Knoten (physische Dinge) | deaktiviert _(Vorauswahl)_ | Basis |
| [[Mitgliedschaften]] | Relations-Register Person↔Organisation | deaktiviert _(Vorauswahl)_ | Basis |
| [[Rollen]] | Register der Rollen-Definitionen (Pflicht, wenn ein Prozess sie kopiert) | deaktiviert _(Vorauswahl)_ | Basis |
| [[Bedarfe]] | Register der Bedarfe — Vorstufe der Anforderungen (Pflicht, wenn ein Prozess sie filtert) | deaktiviert _(Vorauswahl)_ | Basis |
| [[Szenarien]] | Register der Szenarien — Vorstufe der Anforderungen (Pflicht, wenn ein Prozess sie filtert) | deaktiviert _(Vorauswahl)_ | Basis |
