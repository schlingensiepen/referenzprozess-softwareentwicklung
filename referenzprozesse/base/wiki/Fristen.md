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
  (Wiki.md §1.1a). Bei deaktivierter Fassade trägt
  der Detail-Knoten seinen Status selbst (Wiki.md
  §10a).
- **Eintragsformat:** `### YYYY-MM-DD — <Bezeichnung>`
  mit Feldern Gesetzt am / **Richtung** (`gegen-uns`:
  wir müssen handeln — die Regel; `für-uns`: ein
  anderer muss handeln, uns wird etwas geschuldet,
  oder der Ablauf der Frist wirkt für uns —
  [[Katalog-Fristen]]) / Typ (z.B. Abgabefrist,
  Zahlungsfrist, Review-Frist; bei `für-uns` etwa
  Antwort, Entscheidung, Lieferung, Bestätigung) /
  Gegenstand ([[document-Knoten]]) /
  Bezüge (Fall); bei gewichtigen Fristen Wikilink auf
  den Detail-Knoten; bei registrierten externen
  Fristensammlern zusätzlich „Gespiegelt: <Sammler>
  YYYY-MM-DD" je erfolgter Spiegelung; die Felder, die
  ein Prozess an jeder Frist verlangt (im
  Verfahrens-Prozess Entstehung, Wirkung, Verlängerbar,
  Wiedereinsetzung, Zeitbudget, Verfahren), stehen als weitere Felder im Eintrag —
  Namen und Form: [[Katalog-Fristen]],
  Präzisierungs-Block des Prozesses. Die Richtung ist
  **Pflicht**: der Agent setzt sie beim Anlegen (im
  Zweifel `gegen-uns`), eine Frist ohne Richtung meldet
  das Prüfprogramm; an Fristen aus einem älteren
  Template-Stand trägt das Upgrade `gegen-uns` nach.
- **Erwartungen an Dritte** stehen hier als Fristen
  `für-uns` (keine Wiedervorlage in `TODO.md`): der
  Eingang erfüllt sie — der Agent setzt `erfuellt` mit
  Link auf das Eingangsdokument ([[Eingangsdokumente]],
  Ingest); läuft sie ab, schlägt der Agent eine
  Sachstandsanfrage oder Erinnerung vor
  ([[Katalog-Fristen]] „Erwartung an Dritte“).
- **Wächter:** der Frist-Lebenszyklus-Check
  (MasterPrompt §5.3 C4) meldet ablaufende und
  abgelaufene Fristen **mit der Richtung im Text** —
  bei `gegen-uns` eine Pflicht, bei `für-uns` einen
  ausstehenden Eingang oder eine Chance, keine Pflicht;
  er prüft ein Zeitbudget (spätester Tag zum Handeln)
  überall, wo ein Prozess das Feld an seinen Fristen
  deklariert ([[Katalog-Fristen]] „Gleiche
  Feldnamen“), aus jedem Anlass.
- **`deadline`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Fristen]] — lesen
  beim Anlegen eines `deadline`-Knotens. Sektionen: Was ist zu tun / Kontext /
  Teilschritte (Checkliste) / Historie / Bezüge.
  Dateiname `YYYY-MM-DD Frist <Bezeichnung>.md`.
- **Statuswechsel nach Abgelaufen:** automatisch beim
  Sessionstart bzw. Tageswechsel (Wiki.md §10a).
- **Externe Fristensammler:** unterhält der Anwender
  zentrale Fristensammler (Abfrage im Bootstrap;
  nachträgliche Registrierung jederzeit per Zuruf,
  gleiche Prozedur), werden sie in einer Sektion
  `## Externe Fristensammler` dieser Fassade
  registriert (die Sektion liegt leer vor) — je
  Sammler Name, Zugriffsweg
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

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Externe Fristensammler

_(je registriertem Sammler ein Eintrag — Name,
Zugriffsweg, Spiegelungs-Modus; Semantik in `## Meta`.
Ohne Sammler bleibt die Sektion leer.)_

## Offen

_(vom Agenten beim ersten Ingest gefüllt)_

## Erledigt

_(vom Agenten beim ersten Erledigen gefüllt)_

## Abgelaufen

_(automatisch: Statuswechsel beim Sessionstart oder
Tageswechsel, siehe Wiki.md §10a)_
