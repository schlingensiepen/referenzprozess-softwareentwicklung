---
type: internal-rule
---

# Werkzeuge

Übersicht der Werkzeuge, die die Vorlage **mitbringt**,
und der Werkzeuge, die sie **empfiehlt**, nach Zweck.
Der Agent liest diesen Knoten **zu Beginn des Init**
(vor dem Erledigt-Block von Turn 1,
[[Init-Choreografie]] §Phase D) und wenn laufende
Arbeit ein Werkzeug braucht. Regeln zum Fragen und
Installieren: [[MCP-Setup]] und MasterPrompt §7; was
im Projekt eingerichtet ist, steht in `Tools.md`.

## Mitgebracht

Kommen mit der Vorlage; eingerichtet werden muss
nichts.

| Werkzeug | Wo | Wofür |
|---|---|---|
| `lint.sh` | `_template/tools/` | deterministischer Vor-Check des Projekts ohne Sprachmodell (Pflichtfelder, Stand, Kette, Nachrichten); Aufruf aus dem Projekt-Root `sh _template/tools/lint.sh` |
| `normen-holen.py` | **nur bei SP-2:** nach dem Merge im Projekt-`tools/` (Python 3) | holt Bundesgesetze aus dem amtlichen XML und legt einen neuen, danach eingefrorenen Stand an |
| `wegweiser-quellen.py` | dto. — **nur bei SP-2** | prüft die Links der Wegweiser (`--pruefen`) |
| `frist-rechnen.py` | dto. — **nur bei SP-2** | Fristende mit Wochentag aus Ereignisdatum und Fristangabe, Verschiebung bei Wochenende und bundeseinheitlichem Feiertag; Landesfeiertage über `--feiertage` |

Ein Starter bringt zusätzlich seine Kopier-Skripte
unter `setup/` mit; sie nennt seine `INIT.md`.

## Empfohlen, nach Zweck

Die **Empfehlung bietet der Agent zuerst an**, vor
gleichwertigen Werkzeugen, die er in seiner Umgebung
findet; verfügbar ist ein Werkzeug erst nach einem
Zugriffstest. Der Anwender entscheidet, was
eingerichtet wird. Für Peer-Agenten und das zweite
Modell ist die Empfehlung die Ausnahme zur
werkzeug-agnostischen Werkzeug-Wahl (`Vorgehen.md`
§7b).

| Zweck | Empfehlung | Quelle |
|---|---|---|
| **Zweites Modell für Prüfungen** (Prüf-Modell ≠ Bau-Modell) | `schlingensiepen/peeragent`: Peer-Agent mit einem anderen Harness oder Modell starten | https://github.com/schlingensiepen/peeragent |
| Peer-Agent in einem anderen Repo starten | `schlingensiepen/peeragent` | https://github.com/schlingensiepen/peeragent |
| Nachrichten zwischen Agenten | `schlingensiepen/simple-a2a` oder `schlingensiepen/skill-a2a` (als Erweiterung des Agenten) | https://github.com/schlingensiepen/simple-a2a, https://github.com/schlingensiepen/skill-a2a |
| Diagramme (alle Projekte) | Mermaid: Claude Code `mermaid-skill`; andere Agenten native Fähigkeit oder Äquivalent | — |
| Recherche (recherche-lastige Projekte) | WebMCP (MCP) | https://webmcp.dev/ |

Für Peer-Agenten fällt die Wahl von Start und
Transport weiter erst beim Start einer Teilaktivität,
gleichwertig mit der Datei-Variante ohne Werkzeug
(`Vorgehen.md` §3); das Angebot beim Init nimmt sie
nicht vorweg. Eingerichtetes steht in `Tools.md`
§Peer-Agenten.

## Bezüge

- Regeln, Frage-Momente, Begriffe: [[MCP-Setup]]
- Init-Ablauf: [[Init-Choreografie]] (Turn 1)
- Eingerichtetes: `Tools.md` (Kopiervorlage
  `wiki/templates/Tools-Vorlage.md`)
