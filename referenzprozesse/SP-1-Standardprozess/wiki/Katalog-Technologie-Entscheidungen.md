---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Technologie-Entscheidungen

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Technologie-Entscheidungen zu Marke M“
der Phase P7 (Kennung `technologie-entscheidungen`),
abgeleitet aus dem Entscheidungs-Register
([[Katalog-Entscheidungen]]). Technologie-Entscheidungen
haben eine Alternativen-Abwägung und sind darum DEC,
kein eigenes Register. Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### technologie-entscheidungen

- **Zweck:** „für P8 Spezifizieren“ — die
  Spezifikation darf die gewählte Technologie als
  verlässliche Grundlage nehmen.
- **Phase:** P7
- **Verbindlichkeit:** pflicht (dort, wo gebaut wird;
  Koordinator: [[Kettenpruefung]] §Freigabe-Ordnung des
  Koordinators)
- **Grad:** wiki-verweisend
- **Auslöser:** Standard.
- **Quell-Register und Filter:** [[Entscheidungen]] —
  DEC der Marke mit `decision_type: technologie` und
  Status `angenommen`, `in-umsetzung`, `umgesetzt`
  oder `abgeschlossen` (nicht verworfen; für die Marke
  nicht abgelöst — eine DEC mit Status `abgelöst`
  gehört dazu, solange ihr Nachfolger für die Marke
  nicht gilt, [[Einfrieren-und-Abloesen]] §Stand; mit
  `zielmarke:` dieser oder einer
  früheren Marke, Bestands-Elemente ohne Feld
  eingeschlossen); bei einer Komponente
  eingeengt durch die übergebenen Contracts, die als
  Verweise `<koordinator>/CON-NNN` genannt werden
  (Rollen eines CON je Phase:
  [[Katalog-Contract-Index#Rollen eines CON in der Kette]]).
  Angenommene DEC der Marke ohne `decision_type:` legt
  die Ableitungsprüfung ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung) mit vor — Freigabe-Einträge
  (auch Ordner-Freigaben und Tag-Freigaben),
  Verzichts-Einträge und Marken-Wechsel-Einträge
  ([[Entscheidungen]] Meta) sind keine Kandidaten und
  werden weder vorgelegt noch ausgewiesen —, je DEC mit den
  Möglichkeiten **einordnen** (als
  Technologie-Entscheidung in den Stand) oder
  **weglassen** (keine Technologie-Entscheidung); die
  Einordnung steht im Stand, die DEC bleibt
  unverändert. Weggelassene DEC weist der Kopf des
  Stands in einer eigenen Zeile direkt unter dem Titel
  aus — `Nicht berücksichtigt (keine
  Technologie-Entscheidung): <ID>, …` — nach dem
  Muster der Ausweis-Zeile in
  [[Einfrieren-und-Abloesen]] §Ableitungsprüfung; die
  Zeile `Nicht berücksichtigt (offen): …` bleibt den
  `offen`en Elementen vorbehalten.
  Kopiert werden referenzierte Glossar-Einträge.
- **Pflichtfelder:** `type: technologie-entscheidungen`,
  `marke`, `zweck`, `herkunft`, `datum` (seit 2.0)
  (Herkunftszeile und Datum des Stands:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
