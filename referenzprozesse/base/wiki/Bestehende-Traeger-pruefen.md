---
type: internal-rule
---

# Vor Neuem bestehende Träger prüfen

**Regel:** Taucht ein neuer Zweck auf (neue Rolle,
neuer Ort, neuer Begriff, neuer Typ), sichtet der
Agent zuerst, ob ihn schon etwas trägt, und nennt das
Ergebnis in seiner Empfehlung. Lesen vor jeder
Empfehlung für etwas Neues und vor jeder Frage an den
Anwender.

1. **Bestand sichten:** eine Fassade, ein
   Katalog-Eintrag ([[Katalog]]), ein Knoten der
   [[InterneMechanik]], eine Konvention in
   `MasterPrompt.md`, `Wiki.md` oder `Vorgehen.md`, eine
   Entscheidung im Register ([[Entscheidungen]] — die
   Textstelle, nicht nur den Titel).
2. **Ergebnis nennen:** „geprüft: X, Y, Z — keiner
   deckt den Zweck“ bzw. „X deckt ihn teilweise“.
3. Deckt ein Träger den Zweck teilweise, **Erweiterung
   vor Neuanlage** prüfen; dabei klären, ob der Träger
   Übersicht oder Detail ist (ein führender Ort, Link
   statt Redundanz — MasterPrompt §9.3).
4. **`wiki/` bleibt flach:** neue Knoten liegen direkt
   in `wiki/`; Unterordner nur nach Wiki.md §5.4.
5. **Vor jeder Frage an den Anwender prüfen, ob sie
   schon entschieden ist:** Entscheidungs-Register samt
   Vermerken, [[Facts]], `Offene Fragen.md`,
   Prozess-Vorgehen; im Arbeitsmodus per Such-Subagent
   (MasterPrompt §5.1.3). Das Ergebnis in der Vorlage
   nennen („entschieden in DEC-…“ bzw. „nicht
   entschieden“). Ebenso vor einem neuen Formalismus
   prüfen, ob die Sache implizit schon immer so galt.
   Das gilt auch für Fragen aus Prüfberichten: vor dem
   Weiterreichen prüfen, ob ein allgemeines Muster sie
   schon beantwortet.
6. **Befund: erst das Ganze prüfen, dann die Stelle
   flicken.** Meldet eine Prüfung, eine Abnahme oder der
   Anwender einen Fehler an einer Stelle (ein
   Dokumenttyp, ein Knoten, eine Phase), prüft der Agent
   zuerst, ob die allgemeine Erläuterung (Mechanik-Knoten,
   Vorgehen, Kernsatz) die Lücke hat und welche weiteren
   Typen oder Stellen denselben Fehler tragen. Gebucht
   wird dann der Grundsatz, nicht die Sonderlocke an
   einer Stelle.

**Warum:** Ein zweiter Träger für denselben Zweck
driftet vom ersten weg, und eine Frage, die der Bestand
schon beantwortet, kostet den Anwender Zeit und
Vertrauen; wer zuerst sichtet, baut auf dem Vorhandenen
auf.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Bestand: [[Katalog]], [[Fassaden]], [[InterneMechanik]],
  [[Entscheidungen]], [[Glossar]]
- Suche nach Antworten im Arbeitsmodus: MasterPrompt
  §5.1.3; Persistenz offener Fragen: `Offene Fragen.md`
- Schwester-Regel: [[Keine-Analogie-Schluesse]]
