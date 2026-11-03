---
type: need-log
active: true   # Pflicht durch SP-1 (der Konzept-Stand filtert die Bedarfe; Wiki.md §3a) — beim Starter-Bau aktiviert; führend: wiki/Fassaden.md
---

# Bedarfe

## Meta

- **Typ:** `need-log` — Register der **Bedarfe**: was
  jemand will und warum, aus Sicht einer Rolle.
  Vorstufe der Anforderungen. Singleton, ID-Präfix
  `NEED-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Bedarfs-Status
  liegt in dieser Fassade — Detail-Knoten (Typ `need`)
  spiegeln (Wiki.md §1.1a).
- **Sammel-Register:** ein Bedarf darf `offen` oder
  `aufgeschoben` sein, bevor er angenommen ist
  ([[Einfrieren-und-Abloesen]] §Eintrittsregel); ab
  `angenommen` ist er eingefroren. Bis zur Bildung des
  Stands, der Bedarfe filtert („Kette nach vorn“,
  unten), ist diese Fassade — zusammen mit
  [[Szenarien]] — die **Lese-Klammer** der Phase: sie
  listet jeden Bedarf mit Link und Status, und der
  Agent benennt sie dem Anwender so; Ablauf bis zur
  Freigabe: [[Lebenslauf-eines-Stands]].
- **Rollen:** jeder Bedarf nennt die betroffenen
  Rollen per `rollen:`; die Rollen sind im
  Rollen-Register definiert ([[Rollen]]) und werden
  nicht inline neu definiert.
- **Kette nach vorn:** Anforderungen stützen sich per
  `abgeleitet_von:` auf Bedarfe; welcher Stand Bedarfe
  filtert, sagt der aktive Prozess (mit SP-1 der
  Konzept-Stand der Phase P1). Ein Prozess darf den
  Typ per Spezialisierung ersetzen (mit RP-1
  `user-story`); Register und Präfix bleiben gleich.
- **Eintragsformat:** `### NEED-NNN — <Kurzsatz>` mit
  Feldern Status (8-Zustand) / Datum (letzter
  Statuswechsel) / Angelegt (Anlage-Datum
  `JJJJ-MM-TT`, Pflichtfeld seit 2.0 am Eintrag ohne
  Detail-Knoten, sonst `datum:` im Detail-Knoten;
  [[Katalog]] §Typ-Konventionen) / Rollen / Zielmarke
  ([[Zielmarken]];
  Pflichtfeld, kanonisch hier) / Auslöser (nur bei
  aufgeschoben) / Grund (bei verworfen) / Detail
  (Wikilink, nur wenn Detail-Knoten existiert).
- **`need`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Bedarfe]] — lesen
  beim Anlegen eines NEED-Knotens. Sektionen: Bedarf
  (wer will was) / Warum / Vermerke (append-only) /
  Bezüge (Fassaden-Eintrag [[Bedarfe]]). Dateiname
  `NEED-NNN <Kurzsatz>.md`.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Einträge

_(chronologisch nach ID)_
