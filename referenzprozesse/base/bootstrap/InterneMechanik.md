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
   `## internal-rule` der Fassade) auf Vorhandensein
   prüfen — darunter die Arbeitsregeln des Agenten
   (MasterPrompt §5) und die Rümpfe der
   Betriebs-Konfiguration [[Aktivierter-Prozess]] und
   [[Commit-Sprache]] (Platzhalter-Grundsatz, Wiki.md
   §3a: die Knoten liegen mit dem Basis-Wiki vor und
   werden **gefüllt, nicht angelegt**).
2. Die Betriebs-Konfigurations-Knoten mit den
   Init-Ergebnissen füllen (siehe `### Verankerungen`).
3. Register-Einträge der Fassade prüfen (die Rümpfe
   sind schon eingetragen); Einträge für
   projekt-eigene Knoten ergänzen.
4. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen (prominenter
  Kopf-Abschnitt der Landkarte): Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie `Basis`.
- Rumpf **`Aktivierter-Prozess.md`** füllen:
  gewählter Prozess (bzw. „Basis, ohne Prozess"; nach
  einem Join beide Prozesse mit Datum der
  Zuschaltung), Abweichungen von der
  Prozess-Vorauswahl, aktive Prozess-Präfixe nach
  Merge — und der **Herkunfts-Vermerk** als Abschnitt
  `## Herkunft` mit den festen Zeilen `Template-Stand`
  (Version der Vorlage und Tag der Anlage:
  `<Version> seit JJJJ-MM-TT` — die Version steht im
  Kopf der `README.md` der Template-Quelle, das Datum
  ist der Stichtag des Bestandsschutzes), `Quelle`
  (Quelle und Stand, z.B.
  Commit/Tag — bei Modus A der Stand der Einmal-Kopie
  unter `_template/`, MasterPrompt §1),
  `Anbindungs-Modus`, `Prozess`, `Repo` (der Repo-Name
  des Projekts — der Qualifizierer in Verweisen über
  Repo-Grenzen; daran erkennt das Prüfprogramm das
  eigene Projekt, nicht am Ordnerpfad), `Rolle` (aus
  dem Startprompt oder der Rollen-Frage, sonst
  Standalone), `Übernahme-Art` (aus dem Startprompt:
  selbstständig | Auftrag | Abspaltung, sonst „—“);
  nur bei einem Prozess mit Ausbaustufen die Zeile
  `Ausbaustufe` (aktuelle Stufe mit Datum); nur bei
  einer Abspaltung die Zeile `Abgespalten von`
  (`<repo>/<tag>` mit Hash aus dem Startprompt;
  Folge-Tags als weitere Zeilen); dazu die Zeile zum
  **Umgang mit Zugangsdaten als Akteninhalt**, wenn der
  Prozess sie im Hinweis zur Vertrauenszone festlegt
  ([[Init-Choreografie]] §Hinweis zur Vertrauenszone).
  Wortlaut der Zeilen und was der Lint daraus liest:
  [[Init-Choreografie]] §Phase A0 „Herkunfts-Vermerk“
  — die Zeilen genau so anlegen, sonst liest der Lint
  weder Stichtag noch Repo noch Übernahme-Art.
- Im mitgelieferten `internal-rule`-Knoten
  **`WorkspaceManager-Kontrakt.md`** die Sektion
  `## Betriebs-Konfiguration` füllen (der Knoten
  selbst kommt mit dem Basis-Wiki, keine Neuanlage):
  Verfügbarkeit getrennt für Konvertierung (`raw/` →
  `input/`) und Outgoing-Erzeugung, jeweils „vorhanden —
  User startet bei Bedarf" oder „nicht vorhanden —
  Agent übernimmt selbst".
- Rumpf **`Commit-Sprache.md`** füllen: gewählte
  Variante — (A) Projektsprache für alles / (B) Sprache
  folgt Artefakt / (C) Englisch für alles — mit Datum.
