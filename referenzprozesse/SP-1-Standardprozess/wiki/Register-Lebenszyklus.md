---
type: internal-concept
---

# Register-Lebenszyklus

**Ich bin neu in SP-1** — mitgebrachter Mechanik-Knoten
(SP-1-Steckbrief §„Mitgebrachte Mechanik"; Einführung
beim Merge nach Wiki.md §11.3). Wortlaut aus der
SP-1-Prozess-Definition (`index.md` §4.1) hierher
verlagert; dort steht die Kurzform.

Register-Einträge (REQ, BR — und auf gleichem Muster:
DEC in der Basis) folgen einem festen 8-Zustands-
Lebenszyklus:

`offen` → `aufgeschoben` → `angenommen` → `in-umsetzung`
→ `umgesetzt` → `abgeschlossen` → `verworfen` → `abgelöst
durch <ID>`.

Die Statuswerte sind in den Register-Fassaden-Einträgen
Pflicht (Fassaden-Wahrheit, siehe
[[Register-Grundmuster]]). `status_date`
trägt das Datum des letzten Statuswechsels. Bei
`aufgeschoben` oder `umgesetzt-wartet-auf-Prüfung` steht
zusätzlich `Auslöser:` im Fassaden-Eintrag; bei
`abgelöst durch <ID>` zeigt der Verweis auf den ablösenden
Eintrag.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]] (beim Merge,
  Kategorie `Prozess-mitgebracht (SP-1)`)
- Kern-Kurzform: SP-1-`index.md` §4.1
- Kanonizitäts-Muster: [[Register-Grundmuster]]
