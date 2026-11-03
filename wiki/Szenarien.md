---
type: scenario-log
active: true   # Pflicht durch SP-1 (der Konzept-Stand filtert die Szenarien; Wiki.md §3a) — beim Starter-Bau aktiviert; führend: wiki/Fassaden.md
---

# Szenarien

## Meta

- **Typ:** `scenario-log` — Register der
  **Szenarien**: wie ein Ablauf vor sich geht, aus
  Sicht der beteiligten Rollen. Vorstufe der
  Anforderungen. Singleton, ID-Präfix `SCEN-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Szenario-Status
  liegt in dieser Fassade — Detail-Knoten (Typ
  `scenario`) spiegeln (Wiki.md §1.1a).
- **Sammel-Register:** ein Szenario darf `offen` oder
  `aufgeschoben` sein, bevor es angenommen ist
  ([[Einfrieren-und-Abloesen]] §Eintrittsregel); ab
  `angenommen` ist es eingefroren. Bis zur Bildung des
  Stands, der Szenarien filtert („Kette nach vorn“,
  unten), ist diese Fassade — zusammen mit
  [[Bedarfe]] — die **Lese-Klammer** der Phase: sie
  listet jedes Szenario mit Link und Status, und der
  Agent benennt sie dem Anwender so; Ablauf bis zur
  Freigabe: [[Lebenslauf-eines-Stands]].
- **Rollen:** jedes Szenario nennt die beteiligten
  Rollen per `rollen:`; die Rollen sind im
  Rollen-Register definiert ([[Rollen]]) und werden
  nicht inline neu definiert.
- **Kette nach vorn:** Anforderungen stützen sich per
  `abgeleitet_von:` auf Szenarien; Testfälle dürfen
  per `prueft:` auf ein Szenario zeigen
  (Anwendertests). Welcher Stand Szenarien filtert,
  sagt der aktive Prozess (mit SP-1 der Konzept-Stand
  der Phase P1). Ein Prozess darf den Typ per
  Spezialisierung ersetzen (mit RP-1 `use-case`);
  Register und Präfix bleiben gleich.
- **Eintragsformat:** `### SCEN-NNN — <Kurzsatz>` mit
  Feldern Status (8-Zustand) / Datum (letzter
  Statuswechsel) / Angelegt (Anlage-Datum
  `JJJJ-MM-TT`, Pflichtfeld seit 2.0 am Eintrag ohne
  Detail-Knoten, sonst `datum:` im Detail-Knoten;
  [[Katalog]] §Typ-Konventionen) / Rollen / Zielmarke
  ([[Zielmarken]];
  Pflichtfeld, kanonisch hier) / Auslöser (nur bei
  aufgeschoben) / Grund (bei verworfen) / Detail
  (Wikilink, nur wenn Detail-Knoten existiert).
- **`scenario`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Szenarien]] — lesen
  beim Anlegen eines SCEN-Knotens. Sektionen: Ablauf (Schritte aus
  Sicht der Rollen) / Ergebnis / Vermerke
  (append-only) / Bezüge (Fassaden-Eintrag
  [[Szenarien]]). Dateiname `SCEN-NNN <Kurzsatz>.md`.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Einträge

_(chronologisch nach ID)_
