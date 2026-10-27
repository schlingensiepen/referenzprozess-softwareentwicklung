---
type: facade-bootstrap
fassade: "Mission Statement Long"
prozess: "base"
---

# Bootstrap — Mission Statement Long

_(Ziel: `wiki/Mission Statement Long.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Diese Fassade ist **optional** mit Voreinstellung
**deaktiviert** — im Init wird sie wie jede optionale
Fassade angeboten, nicht vorausgewählt (Wiki.md §3a);
das Ankreuzen ist die Anweisung zur Aktivierung, später
genügt eine Anweisung des Users. Bei
Aktivierung:

1. `active: true` setzen.
2. Setup-Dialog wie für die Kurzform führen (Wiki.md
   §3a.2) — aktives Fragen, Entwurf, Freigabe,
   Fallback — mit erweitertem Umfang.
3. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] von „deaktiviert" auf
  „aktiv" umsetzen (Kurzform-Erklärung, Wikilink,
  Kategorie `Basis`).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
