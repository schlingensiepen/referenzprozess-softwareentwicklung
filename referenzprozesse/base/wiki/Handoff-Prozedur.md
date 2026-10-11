---
type: internal-rule
---

# Handoff-Prozedur

Handoff-Zustand, Handoff-Momente T1–T4 und die
Standard-Konsolidierungs-Aktionen der
Wahrheits-Konsolidierung. Wortlaut aus MasterPrompt
§9.2 hierher verlagert; die Doku-Pflicht bei Klärung
(§9.1) und die übrigen §9-Grundsätze bleiben im
MasterPrompt. Moment: vor Session-Pause/Resume, auf
User-Aufforderung, vor Sub-Agent-Beauftragung, vor
Prozess-Merge und Prozess-Upgrade.

Der **Handoff-Zustand** ist der Ziel-Zustand dieser
Regel: **alles ist auf die Platte geschrieben, sodass
ein anderer Agent nahtlos weiterarbeiten kann.**
Prüf-Frage: *„Könnte ein fremder Agent jetzt allein
aus den Dateien nahtlos übernehmen — ohne diesen
Chat?"* Vor jedem **Handoff-Moment** stellt der Agent
diesen Zustand aktiv her. Handoff-Momente:

- **T1 Session-Resume-Vorbereitung** — vor bewusster
  Session-Pause oder nach Rückkehr aus einer solchen.
- **T2 User-Aufforderung** — auf explizite Anweisung
  („mach mal eine Kondensation", „vor Compact",
  „Speicherpunkt setzen", „Handoff").
- **T3 Sub-Agent-Beauftragung** — vor jedem
  Sub-Agent-Aufruf, damit der Sub-Agent-Prompt eine
  ehrliche „aktuelle Wahrheit" referenzieren kann
  (der Sub-Agent liest nur die Platte).
- **T4 Prozess-Merge und Prozess-Upgrade** — vor dem
  Merge (MasterPrompt §5.3/Wiki.md §11.3) und vor jeder
  Upgrade-Migration (Wiki.md §11.5).

Standard-Konsolidierungs-Aktionen an diesen Momenten:

- Offene mündliche Klärungen aus dieser Session in
  Dateien überführen (MasterPrompt §9.1).
- `wiki/Chronologie.md` Nachtrag für die
  abgeschlossene Session-Phase.
- `TODO.md` Erledigt-Punkte markieren, Fahrplan-
  Zustand aktualisieren; Merkliste durchgehen.
- DEC-Register-Konsistenz prüfen (Status-Änderungen
  im Register-Eintrag und im Detail-Knoten
  synchronisieren).
- `wiki/Facts.md` **nur auf explizite Anwender-
  Anweisung** (MasterPrompt §9.4) — nicht aus eigener
  Konsolidierungs-Initiative.
- **Commit** der Konsolidierung — damit der git-Log
  einen sichtbaren Handoff-Anker trägt.

**Standard-Vorgehen bereitlegen:** Der Agent hält
sich diese Konsolidierungs-Aktionen als routiniertes
Vorgehen vor — dieser Knoten unter
[[InterneMechanik]] ist dafür der Ort, damit sie im
Trigger-Moment abrufbar sind, ohne den MasterPrompt
jedes Mal neu abzugleichen.

Zweck ist nicht Vollständigkeit um ihrer selbst
willen, sondern **Anschlussfähigkeit**: der Zustand
auf der Platte muss ausreichen, damit weiter­
gearbeitet werden kann, ohne den Chat-Verlauf zu
brauchen.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzform: MasterPrompt §9.2; Doku-Pflicht:
  MasterPrompt §9.1; Facts-Regel: MasterPrompt §9.4
- Wächter Handoff-Hygiene: MasterPrompt §5.3 Phase C
- Sub-Agent-Beauftragung (T3):
  [[Angebots-und-Beauftragungs-Muster]]
