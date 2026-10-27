---
type: facade-bootstrap
fassade: "Contract-Index"
prozess: "SP-1-Standardprozess"
---

# Bootstrap — Contract-Index

_(Ziel: `wiki/Contract-Index.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-1-Standardprozess/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden — vor der
Rollen-Klärung lesen. Beim SP-1-Merge bzw. beim
ersten Schnitt:

1. Entwicklungs-Projekt-Rolle klären (Koordinator /
   Komponent / Standalone — `index.md` §5):
   - **Koordinator:** `active: true` setzen (der
     Contract-Index gehört zum Koordinator).
   - **Komponent:** `active: false` setzen — die CON
     liegen beim Koordinator; zerlegt die Komponente
     selbst weiter, ist sie für ihre
     Unter-Komponenten Koordinator und aktiviert die
     Fassade dann.
   - **Standalone:** `active: false` — kein Schnitt,
     kein Index nötig.
2. Bei Aktivierung: `### Verankerungen` abarbeiten. Bei
   Abwahl bleibt die Fassaden-Datei mit
   `active: false` liegen (Reaktivierung liest
   diese Bootstrap-Datei erneut).

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-1)`.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
