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
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung und Deaktivierungs-Grenzen dieser Fassade:
Wiki.md §3a („mandatory vs. optional beim Init“,
„Deaktivierungs-Grenzen“) — vor den Schritten lesen.

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
  aktive Prozess-Präfixe nach Merge — und der
  **Herkunfts-Vermerk** als Abschnitt `## Herkunft`
  mit den festen Zeilen `Template-Stand` (Version der
  Vorlage und Tag der Anlage: `2.0 seit JJJJ-MM-TT` —
  das Datum ist der Stichtag des Bestandsschutzes),
  `Quelle` (Quelle und Stand, z.B. Commit/Tag — bei
  Modus A der Stand der Einmal-Kopie unter
  `_template/`, MasterPrompt §1), `Anbindungs-Modus`,
  `Prozess`,
  `Rolle` (aus dem Startprompt oder der Rollen-Frage,
  sonst Standalone) und `Übernahme-Art` (aus dem
  Startprompt, sonst „—“). Wortlaut der Zeilen und was der Lint
  daraus liest: [[Init-Choreografie]] §Phase A0
  „Herkunfts-Vermerk“ — die Zeilen genau so anlegen,
  sonst liest der Lint weder Stichtag noch
  Übernahme-Art.
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
