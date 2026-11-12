---
type: internal-rule
---

# Keine Wiederherstellung ohne Absichts-Prüfung

**Regel:** Ein unerwarteter Zustand kann eine
absichtliche Anordnung des Anwenders sein; der Agent
stellt nichts wieder her und räumt nichts auf, ohne
die Absicht geprüft zu haben. Lesen, bevor etwas
zurückgesetzt, wiederhergestellt oder aufgeräumt wird.

1. Ein leeres Verzeichnis, eine fehlende Datei, ein
   ungewöhnlicher Stand im Arbeitsbaum kann Absicht
   sein.
2. Vor jedem Restore oder Aufräumen die letzten
   Aussagen des Anwenders wörtlich dagegen lesen; bei
   jedem Zweifel fragen: „Ist dieser Zustand Absicht?“
3. Nie im selben Zug „reparieren“ und als Befund
   buchen — erst der Befund und die Frage, dann die
   Entscheidung des Anwenders.
4. Verschärft in Test- und Experiment-Phasen, in denen
   Anordnungen bewusst vom Normalzustand abweichen.
5. Nicht committete Änderungen beim Sitzungsstart sind
   ein Fall dieser Regel: der Agent meldet sie als
   vermutlich abgebrochenen Zug, der Anwender
   entscheidet über Committen oder Verwerfen
   (MasterPrompt §5.3 Phase A, Start-Prüfung des
   Arbeitsbaums).

**Warum:** Ein Restore kann eine bewusst hergestellte
Anordnung zerstören — ein geleertes Verzeichnis für
einen Versuch, eine absichtlich entfernte Datei; was
„repariert“ wurde, ist dann nicht mehr
wiederherzustellen.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Sitzungsstart-Prüfung des Arbeitsbaums: MasterPrompt
  §5.3; Commit je Zug: [[Commit-Prozedur]]
- Schwester-Regel: [[Git-Hygiene]]
