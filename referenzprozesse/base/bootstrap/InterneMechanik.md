---
type: facade-bootstrap
fassade: "InterneMechanik"
prozess: "base"
---

# Bootstrap — InterneMechanik

_(Ziel: `wiki/InterneMechanik.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
DEC-217, DEC-223.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **mandatory** — beim Init automatisch
aktiv, keine Anwender-Frage, nicht deaktivierbar.

1. Die mitgelieferten Basis-Regel-Knoten (Sektion
   `## internal-rule` unten) auf Vorhandensein prüfen.
2. Die Betriebs-Konfigurations-Knoten anlegen (siehe
   `### Verankerungen`) und mit den Init-Ergebnissen
   füllen.
3. Register-Einträge für die neu angelegten Knoten
   ergänzen.
4. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen (prominenter
  Kopf-Abschnitt der Landkarte): Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie `Basis`.
- `internal-rule`-Knoten **`Aktivierter-Prozess.md`**
  anlegen: gewählter Prozess (bzw. „Basis, ohne
  Prozess"), Abweichungen von der Prozess-Vorauswahl,
  abgelöste Ausprägungen, aktive Prozess-Präfixe nach
  Merge, Anbindungs-Modus und Template-Herkunft
  (Quelle und Stand, z.B. Commit/Tag — bei Modus A
  der Stand der Einmal-Kopie unter `_template/`,
  DEC-223).
- Im mitgelieferten `internal-rule`-Knoten
  **`WorkspaceManager-Kontrakt.md`** die Sektion
  `## Betriebs-Konfiguration` füllen (der Knoten
  selbst kommt mit dem Basis-Wiki, keine Neuanlage):
  Verfügbarkeit getrennt für Konvertierung (`raw/` →
  `input/`) und Outgoing-Erzeugung, jeweils „vorhanden —
  User startet bei Bedarf" oder „nicht vorhanden —
  Agent übernimmt selbst".
- `internal-rule`-Knoten **`Commit-Sprache.md`**
  anlegen: gewählte Variante — (A) Projektsprache für
  alles / (B) Sprache folgt Artefakt / (C) Englisch für
  alles.
