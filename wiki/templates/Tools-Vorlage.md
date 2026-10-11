# Tools.md — Kopiervorlage

_(Kopiervorlage, Quelle: MasterPrompt §7.5. Gerüst
für `Tools.md` im Anwender-Root — bei Anlage
kopieren und Beispiele ersetzen. Keine
Wiki-Knoten-Datei.)_

```markdown
# Tools — installierte MCPs und Erweiterungen

**Stand: <Datum>**

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
frischem Kontext nutzen kann — §5.6. Beim Init werden
sie in Phase B registriert und in Phase D Turn 1 im
Erledigt-Block genannt.)_

### <Beispiel: Subagent-Fähigkeit>
- **Agent:** Claude Code (Task-Tool)
- **Zweck:** Subagenten mit frischem Kontext starten
  (Zwei-Modelle-Regel)

## Recherche-Werkzeuge

_(Werkzeuge, die der Agent für externe Recherche nutzen
kann — §5.6. Beim Init werden sie in Phase B registriert
und in Phase D Turn 1 im Erledigt-Block genannt.)_

### <Beispiel: Web-Recherche-MCP>
- **Installiert am:** ...
- **Zweck:** externe Web-Recherche
- **Quelle:** ...

## Sub-Agent-Werkzeuge

_(Werkzeuge für Sub-Agenten-Starts und Multi-Agent-
Reviews — §5.6, `Reviewmuster.md`. Konkrete Modelle
stehen nur hier, nicht in Regeln oder Anleitungen.)_

### Zum Starten eines Sub-Agenten
- ...

### Zur Kommunikation mit einem laufenden Sub-Agenten
- ...

### Verfügbare Modelle mit Klassen
- <Modell-Name> — Klassen: K-STRUKTUR, K-URTEIL, …

## Kadenz-Werkzeuge

_(Test- und Stil-Kommandos für den Werkzeug-Kadenz-
Bericht bei Commits mit prozess-relevanten Änderungen
— §6.1. Was hier nicht registriert ist, wird nicht
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

### <Beispiel: tools/convert_raw.py>
- **Zweck:** ...
- **Aufruf:** ...
- **Abhängigkeiten:** ...
```
