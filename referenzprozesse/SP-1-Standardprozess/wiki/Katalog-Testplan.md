---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Testplan

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Testplan zu Marke M“ der Phase P10
(Kennung `testplan`), abgeleitet aus dem TEST-Register
([[Katalog-Testfaelle]]). Der Testplan ist ein Stand, kein
lebender Wiki-Knoten; das Test-Setup bleibt lebend
([[Systemtest-Setup]], mit RP-1 deren Ablösung) und
wird im Stand kopiert. Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### testplan

- **Zweck:** „für P10 Testen“ — der Testdurchgang
  darf den Testplan als verlässliche Grundlage nehmen.
- **Phase:** P10
- **Verbindlichkeit:** pflicht — auch bei einer
  Komponente für ihre eigene Kette (nach ihrem Tag;
  letztes Glied, das sie führt: [[Kettenpruefung]]
  §Fehlende und vertretene Glieder)
- **Grad:** wiki-verweisend (die Nutzer haben
  Wiki-Zugang; für Ausführende ohne Wiki-Zugang gibt
  es mit RP-1 die Durchführungs-Instanz als
  selbsttragende Ableitung)
- **Auslöser:** Standard (Tag der Implementierung als
  Vorbedingung: [[Kettenpruefung]] §Kette; beim
  Koordinator: §Freigabe-Ordnung des Koordinators;
  Lint-Anteil REQ/FUNC → TEST: §Lint-Anteil).
- **Quell-Register und Filter:** TEST-Elemente der
  Marke aus [[Testfaelle]] mit Status `angenommen`,
  `in-umsetzung`, `umgesetzt` oder `abgeschlossen`, an
  einer vorgelegten, noch nicht freigegebenen Version
  auch `offen` — im Kopf ausgewiesen, mit der Freigabe
  angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung) —
  (nicht verworfen; für die Marke nicht abgelöst —
  ein TEST mit Status `abgelöst` gehört dazu, solange
  sein Nachfolger für die Marke nicht gilt,
  [[Einfrieren-und-Abloesen]] §Stand; mit `zielmarke:`
  dieser oder einer früheren Marke, Bestands-Elemente
  ohne Feld eingeschlossen; System- und Anwendertests;
  `prueft:` auf REQ, FUNC, SPEC,
  SCEN); für einen neuen Testplan werden einzelne
  Tests durch Ablösung, Weglassen oder Ergänzen
  ausgetauscht. Kopiert wird das Test-Setup
  (Testarten, Testumgebung, Ausführung, Ausnahmen).
- **Pflichtfelder:** `type: testplan`, `marke`,
  `zweck`, `herkunft`, `datum` (seit 2.0) (Herkunftszeile und
  Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`); in
  einer Folge-Marke mit eigenem Tag wird dieselbe
  Ketten-ID als Folge-Version mit `marke:` der
  Folge-Marke fortgeführt ([[Einfrieren-und-Abloesen]]
  §Stand).
- **Herkunft:** `herkunft` führt zusätzlich den Tag
  der Implementierung, nach dem der Stand freigegeben
  wird — den Tag der eigenen Marke; der Tag-Name steht
  ohne Auszeichnung (Eintragsformat:
  [[Einfrieren-und-Abloesen]] §Stand). Hat eine
  Folge-Marke einen eigenen Tag, gilt der Testplan-Stand
  der Vormarke für sie nicht als übernommen: eigene
  Freigabe „für P10 Testen zu Marke M“ als
  Folge-Version, bei unveränderten TEST-Elementen und
  unverändertem Test-Setup mit unverändertem Text
  (Empfehlung des Agenten; [[Kettenpruefung]] §Kette,
  Folge-Marke mit eigenem Tag). Ohne eigenen Tag bleibt
  die Übernahme, der Testbericht der Vormarke gilt
  weiter.
- **Nachweis:** der Testbericht (TRES,
  [[Testberichte]]) zu einem Durchgang nach diesem
  Stand; was er als Vorbedingung der Doku-Stände P11
  und P12 und des Deploy-Stands P13 bedeutet
  (P10 → P11, P12, P13):
  [[Kettenpruefung]] §Code-Glieder; was bei nicht
  bestandenen Testfällen gilt: `## Meta` von
  [[Testberichte]]; seine Herkunftszeile:
  [[Einfrieren-und-Abloesen]] §Stand.
