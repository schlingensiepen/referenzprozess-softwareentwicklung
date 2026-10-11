---
type: deadline-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Fristen

## Meta

- **Typ:** `deadline-log` — vorwärtsgerichtete
  Fälligkeitsübersicht in Sektionen Offen / Erledigt /
  Abgelaufen. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ (Einträge
  ohne Detail-Knoten zulässig) — siehe Wiki.md
  §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Frist-Status liegt
  in dieser Fassade — auch bei Aufgaben mit
  Außenwirkung; `deadline`-Detail-Knoten spiegeln
  (Wiki.md §1.1a).
- **Eintragsformat:** `### YYYY-MM-DD — <Bezeichnung>`
  mit Feldern Gesetzt am / Typ (z.B. Abgabefrist,
  Zahlungsfrist, Review-Frist) / Gegenstand ([[document-Knoten]]) /
  Bezüge (Case); bei gewichtigen Fristen Wikilink auf
  den Detail-Knoten; bei registrierten externen
  Fristensammlern zusätzlich „Gespiegelt: <Sammler>
  YYYY-MM-DD" je erfolgter Spiegelung.
- **`deadline`-Detail-Knoten-Konventionen:** Frontmatter
  `type: deadline`, `status:
  offen|erfuellt|abgelaufen`, `due: YYYY-MM-DD`,
  empfohlen `case:` und `source:` (String-Slugs, keine
  Wikilinks — Wiki.md §4.1), `fulfilled_at:` bei
  `erfuellt`. Sektionen: Was ist zu tun / Kontext /
  Teilschritte (Checkliste) / Historie / Bezüge.
  Dateiname `YYYY-MM-DD Frist <Bezeichnung>.md`.
- **Statuswechsel nach Abgelaufen:** automatisch beim
  Sessionstart bzw. Tageswechsel (Wiki.md §10a).
- **Externe Fristensammler:** unterhält der Anwender
  zentrale Fristensammler (Abfrage im Bootstrap;
  nachträgliche Registrierung jederzeit per Zuruf,
  gleiche Prozedur), werden sie in einer Sektion
  `## Externe Fristensammler` dieser Fassade
  registriert (Sektion entsteht bei der ersten
  Registrierung) — je Sammler Name, Zugriffsweg
  (das Zugriffs-Werkzeug steht in `Tools.md`,
  MasterPrompt §7.5) und Spiegelungs-Modus. Zwei
  Modi, **der Anwender entscheidet je Sammler**
  nach Erklärung durch den Agenten:
  **Melden durch Eintragen** — jede neu angelegte
  Frist wird im Sammler eingetragen; Statuswechsel
  (erfüllt/abgelaufen) bleiben im wiki.
  **Vollspiegelung** — Neuanlage **und** alle
  Statuswechsel werden nachgeführt; der Sammler
  zeigt auch den Erledigt-Stand.
- **Spiegelungs-Regel:** jede neu angelegte Frist
  wird **im selben Zug** in jeden registrierten
  Sammler übertragen (Muster Fassaden-Nachzug);
  am Fristen-Eintrag der „Gespiegelt:"-Vermerk
  (siehe Eintragsformat). Kanonizität unverändert:
  diese Fassade führt, der Sammler ist Spiegel.
  Bei fehlendem Zugriff bleibt die Spiegelung als
  offener Punkt beim Wächter (MasterPrompt §5.3 C4)
  sichtbar.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Offen

_(vom Agenten beim ersten Ingest gefüllt)_

## Erledigt

_(vom Agenten beim ersten Erledigen gefüllt)_

## Abgelaufen

_(automatisch: Statuswechsel beim Sessionstart oder
Tageswechsel, siehe Wiki.md §10a)_
