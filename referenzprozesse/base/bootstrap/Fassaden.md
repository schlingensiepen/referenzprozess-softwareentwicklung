---
type: facade-bootstrap
fassade: "Fassaden"
prozess: "base"
---

# Bootstrap — Fassaden

_(Ziel: `wiki/Fassaden.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
DEC-217, DEC-223.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese MetaFassade ist **mandatory** — beim Init
automatisch aktiv, keine Anwender-Frage, nicht
deaktivierbar.

1. Nach der Init-Fassaden-Auswahl die Status-Spalte
   aller Basis-Einträge unten nachführen (`aktiv` /
   `deaktiviert` gemäß Anwender-Wahl bei optionalen
   Fassaden).
2. Die Kurzform-Erklärungen projektspezifisch schärfen —
   wozu die Fassade in *diesem* Projekt eingesetzt wird
   (nicht nur die generische Typ-Beschreibung).
3. Bei jedem Prozess-Merge: die vom Prozess
   mitgebrachten Fassaden als Einträge ergänzen
   (Kategorie `Prozess-mitgebracht` mit Prozess-Angabe);
   abgelöste Fassaden auf `deaktiviert` setzen mit
   Vermerk „abgelöst durch [[neu]]".
4. `### Verankerungen` abarbeiten.

### Verankerungen

- Eigener Eintrag in dieser Landkarte (Sektion
  `## InterneMechanik und MetaFassade` unten) prüfen.
- Keine `internal-*`-Knoten anzulegen.
