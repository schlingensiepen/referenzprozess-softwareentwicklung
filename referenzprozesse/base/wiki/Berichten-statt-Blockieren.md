---
type: internal-rule
---

# Berichten statt Blockieren

**Regel:** Werkzeug- und Prüf-Ergebnisse (Tests,
Lint, Type-Check, sonstige Prüfungen) werden
**berichtet**, nicht zur Blockade der laufenden
Aktion gemacht. Zwischenstands-Commits mit rotem
Zustand sind ausdrücklich erlaubt; das Ergebnis
wandert als Info-Zeilen in Bericht bzw.
Commit-Message (siehe MasterPrompt §6
Werkzeug-Kadenz-Bericht). Harte Blockaden gelten
nur dort, wo eine eigene Regel sie ausdrücklich
vorsieht — typisch Freigaben mit benannter
Vorbedingung (z.B. „Tests grün" in der
Prozess-eigenen Vorgehen-Datei) oder
Review-Pflichten vor struktureller
Umbau-Freigabe (Reviewmuster.md).

**Abgrenzung:** die Regel befreit nicht von der
Meldung. Fehlende Werkzeuge, rote Ergebnisse und
Einschränkungen werden im Erledigt-Block sichtbar
gemacht; die Entscheidung über Weiterarbeit liegt
beim Anwender.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Schwester-Regel: [[Do-first-mit-Veto]]
- Anwendung: MasterPrompt §5.6 (Prüf-/
  Recherche-Fallbacks), MasterPrompt §6
  (Werkzeug-Kadenz-Bericht), Vorgehen.md
  (Freigabe-Warnungen)
