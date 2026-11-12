---
type: flurstueck-log
active: false   # optional; Aktivierung per Angebot des Agenten oder Anweisung des Anwenders
---

# Flurstücke

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis) und ist
**optional**: Beispiel einer Einheit mit eigenem Typ —
der Agent bietet die Aktivierung an, sobald ein
Verfahren Grundstücke zum Gegenstand hat (Grundsteuer,
Erschließung, Nachbarrecht, Grundbuch, Enteignung).

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Flurstuecke.md`
  — bei Aktivierung von dort abarbeiten.
- **Typ:** `flurstueck-log` — Entitäts-Register der
  Flurstücke (Element-Typ `flurstueck`, eigenständige
  Entität ohne `extends: place`): Gemarkung, Flur,
  Flurstücksnummer, Grundbuchblatt, Eigentümer, Lage,
  Fläche. Singleton; optional. Der Typname ist eine
  der deutschen Ausnahmen der Namenskonvention
  ([[Katalog]] §Typ-Konventionen).
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei den Stammdaten
  liegt in dieser Fassade — Detail-Knoten spiegeln
  (Wiki.md §1.1a). Ein Flurstück ist eine Entität
  (Klasse außerhalb, lebend); Bescheide und Bewertungen
  zum Flurstück sind Eingangsdokumente mit Gegenstand
  = Flurstück ([[Eingangsdokumente]]), nicht Felder
  der Entität.
- **Einheit in Serien:** in einem Massenverfahren je
  Grundstück ist das Flurstück die Einheit
  ([[Serien]], Einheitstyp `flurstueck`); weitere
  Einheitstypen mit eigenem Typ legt der Anwender nach
  demselben Muster an (Fassaden-Promotion, Wiki.md
  §3a).
- **Eintragsformat:** `### <Gemarkung> Flur <n>
  Flurstück <n>` mit Feldern Gemarkung / Flur /
  Flurstücksnummer / Grundbuchblatt / Eigentümer
  ([[Personen]]- oder [[Organisationen]]-Knoten) / Lage
  (Anschrift oder Bezeichnung) / Fläche / Verfahren
  (VF-NNN, in denen das Flurstück Gegenstand ist) /
  Detail (Wikilink).
- **Detail-Knoten-Pflicht:** immer — die Entität ist
  der Knoten.
- **`flurstueck`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Flurstuecke]] — lesen
  beim Anlegen eines `flurstueck`-Knotens. Sektionen:
  Stammdaten / Eigentum und Rechte / Bescheide und
  Bewertungen (Verweise) / Vermerke (append-only) /
  Bezüge (Fassaden-Eintrag [[Flurstuecke]],
  Verfahren). Dateiname
  `<Gemarkung> Flur <n> Flurstueck <n>.md`.
- **Pflege:** bei Aktivierung (Bestand aus der Akte),
  bei jedem Bescheid oder Grundbuchvorgang zum
  Flurstück.

---

**Bearbeitungsstand:** _(vom Agenten bei Aktivierung und
laufend gepflegt)_

## Einträge

_(nach Gemarkung, Flur und Flurstücksnummer)_
