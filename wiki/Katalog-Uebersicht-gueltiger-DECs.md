---
type: catalog-entry
art: dokumenttyp
---

# Katalog-Übersicht gültiger DECs

Dokumenttyp-Eintrag: ein optionaler Stand über die
für eine Marke gültigen Entscheidungen (Kennung
`dec-uebersicht`). Beispiel für einen optionalen Stand
mit freiem Zweck und Angebots-Auslöser
([[Einfrieren-und-Abloesen]] §Stand).

### dec-uebersicht

- **Zweck:** frei, vom Anwender benannt — z.B. „für
  eine externe Prüfung“ oder „für die Übergabe an ein
  neues Team“.
- **Phase:** —
- **Verbindlichkeit:** optional
- **Grad:** wiki-verweisend
- **Auslöser:** Angebots-Auslöser: der Agent bietet
  den Stand an, wenn eine externe Prüfung, eine
  Übergabe oder ein Audit ansteht; sonst auf Zuruf
  (Prüfung eines optionalen Stands:
  [[Kettenpruefung]] §Regel).
- **Quell-Register und Filter:** [[Entscheidungen]]
  — alle DEC, die für die Marke gelten (für die Marke
  nicht abgelöst — eine DEC mit Status `abgelöst`
  gehört dazu, solange ihr Nachfolger für die Marke
  nicht gilt, [[Einfrieren-und-Abloesen]] §Stand;
  nicht verworfen; mit `zielmarke:` dieser oder einer
  früheren Marke, Bestands-Elemente ohne Feld
  eingeschlossen), wahlweise eingeengt auf eine
  Entscheidungsart (`decision_type:`); kopiert werden
  die referenzierten Glossar-Einträge.
- **Pflichtfelder:** `type: dec-uebersicht`, `marke`,
  `datum` (seit 2.0), `zweck`, `herkunft` (Herkunftszeile:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
