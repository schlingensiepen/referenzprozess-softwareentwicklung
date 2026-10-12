---
type: facade-bootstrap
fassade: "Knotentypen"
prozess: "base"
---

# Bootstrap — Knotentypen

_(Ziel: `wiki/Knotentypen.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
DEC-217, DEC-223.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **mandatory** — beim Init automatisch
aktiv, keine Anwender-Frage, nicht deaktivierbar.

1. Stand-Zeile setzen; der Standardkatalog unten ist
   bereits befüllt.
2. Bei Prozess-Wahl im Init: die Typ-Blöcke aus dem
   `Knotentypen-Anhang-<Prozess>` des gewählten
   Prozesses in diesen Katalog einspielen (Merge nach
   Wiki.md §11.3; Ablösungen nach Wiki.md §11.4).
3. `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie `Basis`.
- Keine `internal-*`-Knoten anzulegen.
