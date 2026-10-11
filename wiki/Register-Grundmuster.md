---
type: internal-pattern
---

# Register-Grundmuster

**Ich bin neu in SP-1** — mitgebrachter Mechanik-Knoten
(SP-1-Steckbrief §„Mitgebrachte Mechanik"; Einführung
beim Merge nach Wiki.md §11.3). Wortlaut aus der
SP-1-Prozess-Definition (`index.md` §3.3
„Register-Status-Kanonizität als §1.1a-Ausnahme")
hierher verlagert; dort steht die Kurzform.

SP-1 aktiviert eine konkrete Ausprägung der generischen
Feld-Kanonizität (Wiki.md §1.1a):

**Regel:** die Register-Fassaden `wiki/Anforderungen.md`
und `wiki/Fehlermeldungen.md` sind **kanonisch für den
8-Zustands-Status** aller REQ- bzw. BR-Einträge. Die
zugehörigen Detail-Knoten (`requirement`, `bug-report`)
**spiegeln** den Status im Frontmatter (`status`,
`status_date`), sind aber nicht kanonische Quelle.

Bei Statuswechsel greift automatisch die Vier-Schichten-
Absicherung:

1. **Kanonische Änderungsrichtung.** Wer den Status ändern
   will, fasst die **Fassade** an, nicht den Detail-
   Knoten. Der Detail-Knoten spiegelt. Damit gibt es die
   Konfliktquelle strukturell nicht.
2. **Standardaufgabe „Fassade nachziehen".** Wenn die
   Änderung dennoch am Detail-Knoten passiert (weil der
   Agent im Kontext dieses Knotens arbeitet), ist das
   Nachziehen der Fassade **Standardaufgabe im selben
   Vorgang** (MasterPrompt §5.1.2 — kein Veto, keine
   Rückfrage).
3. **Subagenten-Auftrag umfasst den Nachzug.** Ein
   delegierter Auftrag, der einen REQ- oder BR-Detail-
   Knoten ändert, umfasst den Fassaden-Nachzug für den
   Status automatisch.
4. **Sicherheitsnetz Lint.** Sessionstart und Snapshot-
   Lint finden residuale Drift zwischen Fassade und
   Detail-Knoten (Wiki.md §9.1) und melden sie als
   Warnung.

**Was ist kanonisch, was spiegelt:**

- **Kanonisch an der Fassade:** `status` (8-Zustand),
  `status_date` (letzter Statuswechsel), Sektions-
  Zuordnung (bei `wiki/Anforderungen.md` die Gliederung
  in `## Funktional` vs. `## Nicht-funktional`),
  `abgelöst durch <ID>` (Ablöseverweis im Fassaden-
  Eintrag).
- **Kanonisch am Detail-Knoten:** Body-Inhalt
  (Beschreibung, Nachweis, Vermerke, Reproduktions-
  Schritte bei BR, ausformulierte Wahl-Begründung),
  Register-Felder im Frontmatter als Spiegelung
  (`id`, `status`, `status_date`, `trigger` — Datum
  oder Zielmarken-Bezeichnung —, `zielmarke`,
  `superseded_by`).

**Warum kein Register-Grundmuster für
`wiki/Entscheidungen.md`:** `wiki/Entscheidungen.md`
(`decision-log`) ist Basis-Fassade — universeller
Mechanismus. Die Register-Kanonizität für Entscheidungen
liegt bei der Basis, nicht bei SP-1; die
Regel-Formulierung ist aber gleich (das gleiche
Vier-Schichten-Muster gilt für alle Register-Fassaden,
egal in welcher Stufe verankert).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-1)`)
- Kern-Kurzform: SP-1-`index.md` §3.3
- Statuswerte: [[Register-Lebenszyklus]]
- Generische Regel: Wiki.md §1.1a (Feld-Kanonizität)
