---
type: facade-bootstrap
fassade: "Fristen"
prozess: "base"
---

# Bootstrap — Fristen

_(Ziel: `wiki/Fristen.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung und Basis-Vorauswahl dieser Fassade:
Wiki.md §3a („mandatory vs. optional beim Init“) —
vor der Aktivierungs-Wahl lesen. Beim Init:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „aktivieren").
2. Bei Aktivierung: **Fristensammler-Frage** — der
   Agent erklärt kurz, was die Fristen-Fassade
   macht (vorwärtsgerichtete Fälligkeitsübersicht
   Offen/Erledigt/Abgelaufen, automatischer
   Ablauf-Statuswechsel, Kanonizität im wiki), und
   fragt, ob der Anwender einen oder mehrere
   **zentrale Fristensammler** unterhält
   (Fristenbuch, Team-Kalender, zentrale Tabelle,
   externes System). Bei Ja je Sammler: Zugriffsweg
   klären und **testen**, Sammler in der Sektion
   `## Externe Fristensammler` registrieren
   (Semantik in `## Meta`) und den
   **Spiegelungs-Modus** wählen lassen — der Agent
   erklärt beide Modi (siehe Meta), **der Anwender
   entscheidet je Sammler**. Kein Zugriff möglich →
   als Blockade dokumentieren; die Spiegelung
   bleibt beim Wächter sichtbar.
3. `### Verankerungen` abarbeiten. Bei Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest
   diese Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] prüfen (Status, Kurzform).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
