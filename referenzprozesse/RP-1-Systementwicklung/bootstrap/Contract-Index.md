---
type: facade-bootstrap
fassade: "Contract-Index"
prozess: "RP-1-Systementwicklung"
---

# Bootstrap — Contract-Index

_(Ziel: `wiki/Contract-Index.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; in Modus A
liegt sie in der mitkopierten
`referenzprozesse/RP-1-Systementwicklung/bootstrap/`-Vorlage —
DEC-217.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert — DEC-217.)_

Diese Fassade ist **optional** — ihre Aktivierung hängt
an der Entwicklungs-Projekt-Rolle. Beim RP-1-Merge:

1. Entwicklungs-Projekt-Rolle klären (Koordinator /
   Komponent / Standalone — Rolle-Erkennung siehe
   SP-1-Teil-Wiki):
   - **Koordinator:** `active: true` setzen (der
     Contract-Index gehört zum Koordinator).
   - **Komponent:** `active: false` setzen — der Index
     liegt beim Koordinator-Repo.
   - **Standalone:** `active: false` — kein
     Multi-Komponenten-Setup, kein Index nötig.
2. Bei Aktivierung: `### Verankerungen` abarbeiten. Bei Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest
   diese Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (RP-1)`.
- Keine `internal-*`-Knoten anzulegen.
