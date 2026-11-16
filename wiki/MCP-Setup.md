---
type: internal-rule
---

# MCP-Setup

Begriffsklärung, Frage-Momente und empfohlener
Startkatalog für MCPs und Agent-Erweiterungen.
Wortlaut aus dem MasterPrompt-§7-Block (Stand vor
der Z-Zerlegung) hierher verlagert; der Grundsatz (nicht eigenmächtig
installieren, fragen und aktiv vorschlagen) und die
Tools.md-Dokumentation (§7.5) bleiben in
MasterPrompt §7. Moment: beim Setup (Init) und wenn
laufende Arbeit ein fehlendes Werkzeug braucht.

## Begriffsklärung

- **MCP (Model Context Protocol):** standardisiertes,
  **agent-übergreifendes** Protokoll.
- **Agent-Erweiterung:** agent-spezifischer
  Mechanismus zur Funktionserweiterung:

| Agent | Erweiterungsmechanismus |
|---|---|
| Claude Code | Skills (`.claude/skills/`) |
| Cursor | Rules (`.cursor/rules/`) |
| Windsurf | Workflows (`.windsurf/workflows/`) |

## Wann der Agent fragt

- **Beim Init:** empfohlene Tools als Katalog
  vorstellen ([[Init-Choreografie]] §Baustein
  Werkzeug-Angebot, Turn 1).
- **Ad-hoc bei laufender Arbeit:** wenn eine Aufgabe
  ein fehlendes Tool benötigt.

## Empfohlener Startkatalog

Führend ist [[Werkzeuge]] §Empfohlen, nach Zweck —
dort auch die mitgebrachten Werkzeuge. Beim Init
bietet der Agent die Empfehlung zuerst an, vor
gleichwertigen Werkzeugen seiner Umgebung.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzform und Grundsatz: MasterPrompt §7
- Dokumentation jeder Installation: `Tools.md`
  (MasterPrompt §7.5; Kopiervorlage
  `wiki/templates/Tools-Vorlage.md`)
- Katalog: [[Werkzeuge]]
- Init-Vorstellung des Katalogs:
  [[Init-Choreografie]]
