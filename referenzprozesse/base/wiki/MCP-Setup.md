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
  vorstellen.
- **Ad-hoc bei laufender Arbeit:** wenn eine Aufgabe
  ein fehlendes Tool benötigt.

## Empfohlener Startkatalog

**Grundausstattung (alle Projekte):**

| Fähigkeit | Beispiel-Implementierung |
|---|---|
| Mermaid-Diagramme | Claude Code: `mermaid-skill`; andere Agenten: native Fähigkeit oder agent-spezifisches Äquivalent |

**Recherche-lastige Projekte:**

| Name | Typ | Quelle |
|---|---|---|
| WebMCP | MCP | https://webmcp.dev/ |

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzform und Grundsatz: MasterPrompt §7
- Dokumentation jeder Installation: `Tools.md`
  (MasterPrompt §7.5; Kopiervorlage
  `wiki/templates/Tools-Vorlage.md`)
- Init-Vorstellung des Katalogs:
  [[Init-Choreografie]]
