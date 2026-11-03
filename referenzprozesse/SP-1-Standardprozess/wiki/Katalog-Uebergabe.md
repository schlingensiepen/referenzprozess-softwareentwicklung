---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Übergabe

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Übergabe an Komponente K“ der Phase P6
(Kennung `uebergabe`), den der Koordinator je
Komponente bildet, sobald ein Schnitt in Komponenten
stattfindet. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### uebergabe

- **Zweck:** „für den Start von K“ — die Komponente K
  darf ihren eigenen Prozess auf diesem Stand starten.
- **Phase:** P6
- **Verbindlichkeit:** pflicht (nur beim Koordinator,
  je Komponente; entfällt ohne Schnitt in
  Komponenten)
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; je Komponente, sobald der
  Zuschnitt im Architekturdokument freigegeben ist.
  Der Startprompt der Komponente verweist auf diesen
  Stand.
- **Quell-Register und Filter:** die
  Funktionsbeschreibungen (FUNC) und
  Architektur-Festlegungen (ARC) der Marke, die K
  betreffen — mit Status `angenommen`, `in-umsetzung`,
  `umgesetzt` oder `abgeschlossen`, an einer
  vorgelegten, noch nicht freigegebenen Version auch
  `offen` — im Kopf ausgewiesen, mit der Freigabe
  angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung) — (nicht verworfen;
  für die Marke nicht abgelöst — ein Element mit
  Status `abgelöst` gehört dazu, solange sein
  Nachfolger für die Marke nicht gilt,
  [[Einfrieren-und-Abloesen]] §Stand; mit
  `zielmarke:` dieser oder einer
  früheren Marke, Bestands-Elemente ohne Feld
  eingeschlossen) —, dazu die für die Marke geltenden
  Contracts (CON) mit Beteiligung von K aus dem eigenen
  Contract-Index (angenommen, Filter wie oben: für die
  Marke nicht abgelöst, `zielmarke:` dieser oder einer
  früheren Marke) — alles als
  qualifizierte Verweise (`<koordinator>/FUNC-NNN`),
  keine Kopien eingefrorener Elemente. Kopiert werden
  lebende Quellen: die Lage aus §Komponenten der
  Architektur-Fassade, referenzierte Rollen und
  Glossar-Einträge.
- **Pflichtfelder:** `type: uebergabe`, `marke`,
  `zweck`, `herkunft`, `datum` (seit 2.0) (Herkunftszeile und
  Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand), `komponente` (die Komponente K, an die
  übergeben wird)
- **Ablage:** `output/`, versioniert (`_VV_TLA`); der
  Name trägt die Komponente als Gegenstand
  (`<Datum> - Uebergabe - <Komponente>_VV_TLA.md`), so
  dass jede Übergabe ihre eigene Ketten-ID hat
  ([[Einfrieren-und-Abloesen]] §Stand, Dateiname).
- **Komponenten-Kette:** was dieser Stand in der Kette
  der Komponente ersetzt oder vertritt und wie er eine
  FUNC des Koordinators deckt — [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art; lesen, bevor
  die Komponente ihren ersten eigenen Stand bildet.
- **Ableitung nach außen:** [[Katalog-Uebergabe-Dokument]]
  (selbsttragend, nur ohne Lesezugriff).
