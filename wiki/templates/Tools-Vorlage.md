# Tools.md — Kopiervorlage

_(Kopiervorlage, Quelle: MasterPrompt §7.5. Gerüst
für `Tools.md` im Anwender-Root — bei Anlage
kopieren und Beispiele ersetzen. Die Kategorien
(Überschriften `##`) bleiben alle stehen, auch ohne
Werkzeug: dann trägt die Kategorie die Wahl „ohne
Werkzeug“ bzw. „keines“ mit Datum (Vorgehen.md §7b —
die Wahl ohne Werkzeug ist eine Wahl); ersetzt oder
entfernt werden nur die Beispiel-Einträge `###` und
Platzhalter. Keine Wiki-Knoten-Datei.)_

```markdown
# Tools — installierte MCPs und Erweiterungen

**Bearbeitungsstand: <Datum>**

_(Je Kategorie die installierten Werkzeuge und die
Werkzeug-Wahlen des Anwenders, auch die Wahl „ohne
Werkzeug“ — Vorgehen.md §7b. Produktnamen in dieser
Vorlage sind Beispiele.)_

## MCPs (agent-übergreifend)

### WebMCP
- **Installiert am:** ...
- **Konfiguration:** agent-spezifisch
- **Zweck:** Web-Ressourcen als MCP-Endpoints
- **Quelle:** https://webmcp.dev/

## Erweiterungen

### Mermaid (Claude Code Skill)
- **Agent:** Claude Code
- **Installiert am:** ...
- **Pfad:** `.claude/skills/mermaid`
- **Zweck:** Mermaid-Diagramme erzeugen
- **Quelle:** https://github.com/WH-2099/mermaid-skill

## Prüf-Werkzeuge

_(Werkzeuge, die der Agent für Prüf-Subagenten mit
frischem Kontext nutzen kann — MasterPrompt §5.6. Beim
Init nennt der Agent sie in Phase D Turn 1 aus seiner
Umgebung im Erledigt-Block und trägt sie hier mit der
ersten Wahl ein.)_

### <Beispiel: Subagent-Fähigkeit>
- **Agent:** Claude Code (Task-Tool)
- **Zweck:** Subagenten mit frischem Kontext starten
  (Zwei-Modelle-Regel)

### Zweites Modell für Prüfungen
- **Werkzeug:** <Peer-Agent oder externes Modell> |
  keines verfügbar
- **Ersatzweg (nur ohne Werkzeug, Wahl beim Init):**
  Ein-Modell-Weg | Anwender als Prüfer
  (`Reviewmuster.md` §2 Schleife 2, Fallback)
- **Gewählt am:** ...

## Recherche-Werkzeuge

_(Werkzeuge, die der Agent für externe Recherche nutzen
kann — MasterPrompt §5.6. Beim Init nennt der Agent sie
in Phase D Turn 1 aus seiner Umgebung im Erledigt-Block
und trägt sie hier mit der ersten Wahl ein.)_

### <Beispiel: Web-Recherche-MCP>
- **Installiert am:** ...
- **Zweck:** externe Web-Recherche
- **Quelle:** ...

## Sub-Agent-Werkzeuge

_(Werkzeuge für Sub-Agenten-Starts und Multi-Agent-
Reviews — MasterPrompt §5.6, `Reviewmuster.md`. Konkrete Modelle
stehen nur hier, nicht in Regeln oder Anleitungen.)_

### Zum Starten eines Sub-Agenten
- ...

### Zur Kommunikation mit einem laufenden Sub-Agenten
- ...

### Verfügbare Modelle mit Klassen
- <Modell-Name> — Klassen: K-STRUKTUR, K-URTEIL, …

## UI-Entwurfs-Werkzeuge

_(Werkzeuge für UI-Entwürfe bei Systemen mit
Benutzungs-Schnittstelle, wo ein Prozess sie anbietet;
ohne Werkzeug: Markdown-Wireframes, HTML-Mockups.
Wahl nach Vorgehen.md §7b.)_

### <Beispiel: Entwurfs-Werkzeug, z.B. Stitch>
- **Gewählt am:** ...
- **Zweck:** UI-Entwürfe
- **Quelle:** ...

## Code-Review-Werkzeuge

_(anderes Modell oder spezialisiertes Werkzeug für das
Code-Review — die Kettenprüfung des Glieds P9, in
jedem Projekt mit Prozess; ohne Code die Kettenprüfung
des Produkts, [[Kettenpruefung]] §Code-Glieder. Wahl
nach Vorgehen.md §7b; ohne Werkzeug der Ersatzweg aus
§Prüf-Werkzeuge.)_

### <Beispiel: Review-Werkzeug, z.B. Codex>
- **Gewählt am:** ...
- **Zweck:** Code-Review (Kettenprüfung des Glieds P9)
- **Quelle:** ...

## Peer-Agenten: Start und Transport

_(Werkzeuge, mit denen ein Peer-Agent in einem anderen
Repo gestartet wird und Nachrichten zwischen den Repos
transportiert werden; gewählt beim Start einer
Teilaktivität — Vorgehen.md §3. Ohne Werkzeug: die
Datei-Variante. Dazu, wie der Agent eine neue
Nachricht bemerkt — MasterPrompt §5.4, Anlass T5.)_

### Start
- **Gewählt am:** ...
- **Werkzeug:** ... | Datei-Variante

### Transport
- **Gewählt am:** ...
- **Werkzeug:** ... | Datei-Variante

### Signal bei neuer Nachricht
- **Gewählt am:** ...
- **Signal:** <Beobachtung von `output/nachrichten/`
  der Nachbarn, z.B. inotify> | Zustellung durch das
  Transport-Werkzeug | Zeit-Trigger alle <Intervall,
  vom Anwender genannt> | ohne (C8 nur zu den übrigen
  Anlässen)

## Ordner-Synchronisation zwischen Repos

_(Werkzeug, das Ordner aus einem anderen Repo bezieht
oder für ein anderes Repo bereitstellt; das Template
hat dafür keinen eigenen Mechanismus — Vorgehen.md
§7b.)_

### <Beispiel: Synchronisations-Werkzeug, z.B. WorkspaceManager>
- **Eingerichtet am:** ...
- **Ordner:** <Repo, Pfad, Richtung: beziehen | bereitstellen>

## Kadenz-Werkzeuge

_(Test- und Stil-Kommandos für den Werkzeug-Kadenz-
Bericht bei Commits mit prozess-relevanten Änderungen
— MasterPrompt §6.1. Was hier nicht registriert ist, wird nicht
ausgeführt.)_

### <Beispiel: Test-Kommando>
- **Kommando:** ...
- **Zweck:** Testlauf vor prozess-relevanten Commits

### <Beispiel: Linter/Formatter-Kommando>
- **Kommando:** ...
- **Zweck:** Stilprüfung pro Projekt

## Projekt-Skripte

_(Skripte im Ordner `tools/` — MasterPrompt §1.9.
Registrier-Pflicht: jedes Skript ein Eintrag.)_

### _template/tools/lint.sh (Template-Werkzeug, nur lesen)
- **Zweck:** deterministischer Vor-Check des Wikis
  vor dem Lint-Workflow (Wiki.md §9)
- **Aufruf:** `sh _template/tools/lint.sh` im
  Projekt-Root; den Stichtag (ab dem neue Pflichtfelder
  Fehler statt Hinweise sind) liest er aus der Zeile
  `Template-Stand` (Datum hinter `seit`) des
  Herkunfts-Vermerks in
  `wiki/Aktivierter-Prozess.md` ([[Init-Choreografie]]
  §Phase A0); `--stichtag YYYY-MM-DD` geht vor
  (nötig nur, solange der Knoten fehlt, dann mit
  `--kennt Aktivierter-Prozess,Commit-Sprache`).
  Anlässe: Wiki.md §9. Hilfe mit `--help`
- **Abhängigkeiten:** POSIX sh, awk; keine Kopie ins
  Projekt-`tools/`, Pflege nur im Template

### <Beispiel: tools/convert_raw.py>
- **Zweck:** ...
- **Aufruf:** ...
- **Abhängigkeiten:** ...
```
