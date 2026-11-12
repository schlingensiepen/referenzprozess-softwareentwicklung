---
type: internal-rule
---

# Keine Analogie-Schlüsse aus Festlegungen

**Regel:** Legt der Anwender ein Muster für einen
Aspekt fest, gilt es **nur für diesen Aspekt**. Die
Übertragung auf Nachbarfälle wird gefragt, nicht
abgeleitet. Lesen, bevor eine Entscheidung des
Anwenders auf einen Nachbarfall übertragen werden soll.

1. Für benachbarte Aspekte fragen: „Soll dasselbe
   Muster dort gelten, oder gibt es andere
   Anforderungen?“
2. Aus Formulierungen keine strukturellen Nebenregeln
   ableiten („einzige Fassade“ heißt nicht „darf nichts
   verlinken“).
3. Aus „ähnlicher Zweck“ nicht „gleicher Zweck“
   ableiten, ohne es zu prüfen.
4. Verallgemeinerungen von Entscheidungen sind nie
   ableitbar im Sinn von MasterPrompt §5.1.0 — sie
   werden gefragt.
5. **Nachbarfälle suchen, nicht entscheiden:** Setzt
   eine Festlegung ein Muster, sucht der Agent vor dem
   Buchen (bei Bedarf per Subagent) die Fälle, für die
   es ebenfalls gelten könnte, und legt sie als Liste
   zur Entscheidung vor — bei mehreren Punkten im
   Briefing-Modus (MasterPrompt §5.1.0). Die
   Übertragung entscheidet der Anwender.

**Warum:** Ein eigenmächtig übertragenes Muster
verstößt gegen „im Zweifel fragen“; die Erfahrung
zeigt, dass gleich klingende Festlegungen oft andere
Anforderungen tragen.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Ableitbarkeit vor Rückfrage und Briefing-Modus:
  MasterPrompt §5.1.0; Fahrplan vor einer Kette:
  [[Fahrplan-Vorlage]]
- Schwester-Regel: [[Bestehende-Traeger-pruefen]]
