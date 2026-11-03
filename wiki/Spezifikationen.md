---
type: specification-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Spezifikationen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — das
Register der Spezifikationen ist das Artefakt der
Phase P8 „Spezifizieren“.

## Meta

- **Typ:** `specification-log` — Register aller
  Spezifikationen dieses Repos. Singleton, ID-Präfix
  `SPEC-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Gegenstand:** die **Bauanleitung** — die konkrete
  Umsetzungsvorgabe nach dem Schnitt in Bausteine (P5)
  und der Technologie-Entscheidung (P7), umsetzbar ohne
  Fachkenntnis (auch durch Subagenten). Die Außensicht
  (was das System leistet) ist nicht Gegenstand dieser
  Fassade, sondern der [[Funktionsbeschreibungen]]
  (P4).
- **Entstehungsort:** dort, wo tatsächlich gebaut
  wird — typisch die nicht weiter zerlegte Komponente;
  der Koordinator spezifiziert nur seine eigenen
  Bauteile. Ein Koordinator ohne eigene Bauteile führt
  dieses Register leer.
- **Verortung je Repo:** jedes Repo führt seine eigenen
  Spezifikationen — der Koordinator und das
  Standalone-Projekt die **Gesamtspezifikation** (für
  eigene Bauteile), jede Komponente ihre
  **Teilspezifikation**. „Gesamt“ und „Teil“ sind
  Rolle des Repos und Eigenschaft des Stands, kein
  Merkmal je Element. Die Kette
  entsteht über qualifizierte Verweise
  (`<repo>/SPEC-NNN`, Qualifizierer = Repo-Name);
  kein geteilter Kanonizitäts-Split nötig.
- **Contract-Bezug:** eine Spezifikation nennt die
  Contracts, an denen die Komponente beteiligt ist
  (als Provider wie als Consumer), als Verweise
  `<koordinator>/CON-NNN` — dort sind sie Bauvorgabe
  (Register [[Contract-Index]]).
- **Eintritt und Lese-Klammer:** ein SPEC-Element
  legt der Agent als `offen` an; es bleibt bearbeitbar,
  bis es einzeln angenommen wird oder mit der Freigabe
  des ersten Stands, der es verweist
  ([[Einfrieren-und-Abloesen]] §Eintrittsregel). Bis
  zur Bildung des Stands ist **diese Fassade die
  Lese-Klammer** der Phase P8 — sie listet jedes
  Element mit Link und Status, und der Agent benennt
  sie dem Anwender so; Ablauf bis zur Freigabe:
  [[Lebenslauf-eines-Stands]].
- **Freigabe:** Freigabestände gehen als versionierte
  Datei (`_VV_TLA`) nach `output/`; der
  Freigabe-Eintrag im Entscheidungs-Register nennt
  Stand und Zweck „für P9 Ausarbeiten“ (Zweck-Katalog
  `Vorgehen.md` §4, Präzisierung der RPs).
- **Kleine Projekte:** wann P8 schmal bleiben oder
  per Verzichts-DEC entfallen darf und was dann für
  Lint und Stand gilt: [[Kettenpruefung]]
  §Fehlende und vertretene Glieder — lesen, bevor auf
  P8 verzichtet wird.
- **Eintragsformat:** `### SPEC-NNN — <Kurzsatz>` mit
  Feldern Gegenstand (nur der beschriebene Gegenstand,
  z.B. „Auth-Modul“, „Datenmodell“ — nicht „Gesamt“
  oder „Teil“: das ist die Rolle des Repos, §Verortung
  je Repo) / Status + status_date / Angelegt
  (Anlage-Datum `JJJJ-MM-TT`, Pflichtfeld seit 2.0 am
  Eintrag ohne Detail-Knoten, sonst `datum:` im
  Detail-Knoten; [[Katalog]] §Typ-Konventionen) /
  Zielmarke
  ([[Zielmarken]]; Pflichtfeld, kanonisch hier) /
  Detail (Wikilink). Ein Freigabestand steht nur im
  Freigabe-Eintrag, nicht im Element-Eintrag.
- **Kanonizität:** die Wahrheit beim Status liegt in
  dieser Fassade — Detail-Knoten (Typ
  `specification`) spiegeln (Wiki.md §1.1a,
  [[Register-Grundmuster]]).
- **Detail-Knoten-Konventionen:** Frontmatter-Felder:
  [[Katalog-Spezifikationen]] — lesen beim Anlegen
  eines `specification`-Knotens. Sektionen frei nach
  Spezifikations-Gegenstand (Bauteile, Datenmodell,
  Schnittstellen-Umsetzung, Contract-Bezug,
  Abnahmekriterien). Dateiname
  `SPEC-NNN <Kurzsatz>.md`.
- **Pflege:** bei Anlage und Statuswechsel.

---

**Bearbeitungsstand:** _(vom Agenten bei Anlage und laufend
gepflegt)_

## Spezifikationen

_(chronologisch nach ID; vom Agenten bei der ersten
Spezifikation gefüllt)_
