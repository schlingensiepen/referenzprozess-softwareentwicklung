---
type: internal-pattern
---

# Register-Grundmuster

**Ich bin neu in SP-1** — mitgebrachter Mechanik-Knoten
(SP-1-Steckbrief §„Mitgebrachte Mechanik"; Einführung
beim Merge nach Wiki.md §11.3). Wortlaut aus der
SP-1-Prozess-Definition (`index.md` §3.3
„Register-Status-Kanonizität als Ausnahme von Wiki.md
§1.1a") hierher verlagert; dort steht die Kurzform.

SP-1 aktiviert eine konkrete Ausprägung der generischen
Feld-Kanonizität (Wiki.md §1.1a):

**Regel:** die Fassaden der Ketten-Register (REQ, BUG,
FUNC, ARC, SPEC, TEST/TRES, DEPL, CON; Geltungsbereich
und Status-Achse je Register-Art:
[[Register-Lebenszyklus]]) sind **kanonisch für den
Status** ihrer Einträge — z.B. `wiki/Anforderungen.md`
für REQ, `wiki/Fehlermeldungen.md` für BUG. Die
zugehörigen Detail-Knoten (z.B. `requirement`,
`bug-report`) **spiegeln** den Status im Frontmatter
(`status`, `status_date`), sind aber nicht kanonische
Quelle.

Bei Statuswechsel greift die Vier-Schichten-Absicherung
der Feld-Kanonizität (Änderungsrichtung über die
Fassade, Nachzug als Standardaufgabe, Nachzug im
Subagenten-Auftrag, Lint als Sicherheitsnetz):
Wiki.md §1.1a — lesen vor dem ersten Statuswechsel an
einem Eintrag eines Ketten-Registers. Für SP-1 heißt
das: das kanonische Feld ist der Status, der
Detail-Knoten ist der Element-Typ des Registers.

**Was ist kanonisch, was spiegelt:**

- **Kanonisch an der Fassade:** `status` (Status-Achse
  nach [[Register-Lebenszyklus]], darunter der
  Status-Wert `abgelöst`), `status_date` (letzter
  Statuswechsel), Sektions-Zuordnung (bei
  `wiki/Anforderungen.md` die Gliederung in
  `## Funktional` vs. `## Nicht-funktional`).
- **Kanonisch am Detail-Knoten:** Body-Inhalt
  (Beschreibung, Vermerke, Reproduktions-Schritte bei
  BUG, ausformulierte Wahl-Begründung),
  Register-Felder im Frontmatter als Spiegelung
  (`id`, `status`, `status_date`, `trigger` — Datum
  oder Zielmarken-Bezeichnung —, `zielmarke`) sowie die
  **Ablösung**: das Feldpaar
  `supersedes:`/`superseded_by:` ist im Frontmatter
  beider Elemente kanonisch, die Fassade spiegelt den
  Verweis; der Lint meldet Drift in beide Richtungen.
  Freeze und Ablösung selbst regelt
  [[Einfrieren-und-Abloesen]].

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
- Freeze, Ablösung, Stand: [[Einfrieren-und-Abloesen]]
- Generische Regel: Wiki.md §1.1a (Feld-Kanonizität)
