---
type: evidence-log
active: false   # optional ab Stufe 2; Aktivierung per Angebot des Agenten oder Anweisung des Anwenders
---

# Beweisangebote

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis) und ist
**optional ab Stufe 2**; der Agent bietet die
Aktivierung an, sobald eine Tatsache in
[[Sachverhalt]] die Stellung `bestritten` erhält oder
ein Beweisbeschluss eingeht.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Beweisangebote.md`
  — bei Aktivierung von dort abarbeiten.
- **Typ:** `evidence-log` — Relations-Register der
  Beweismittel-Beziehungen (Element-Typ `evidence`:
  Beweismittel ↔ belegte Aussage, mit Beweisart):
  Beweisangebote, Beweisanregungen und
  Beweissicherungen je Beweisthema. Singleton;
  **optional ab Stufe 2**.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/
  (Relation als Detail-Knoten wie `member`,
  [[Mitgliedschaften]]) — siehe Wiki.md
  §Kategorisierung der Register.
- **Beweismittel sind relational, nicht intrinsisch:**
  ein Dokument, eine Person, ein Ding oder ein Ereignis
  wird erst über diese Relation zum Beweismittel —
  dasselbe Dokument kann in einem Verfahren
  Beweismittel sein und in einem anderen nicht. Kein
  eigener Entity-Typ; ein physisches Beweisstück bleibt
  ein Ding ([[Dinge]]), eine Urkunde ein Dokument
  ([[Eingangsdokumente]]) bzw. eine Anlage
  ([[Anlagen]]).
- **Felder der Relation:** `source` (Pflicht — das
  Beweismittel, beliebiger Wikilink), `target`
  (optional — die belegte Aussage, in der Regel eine
  TAT-ID aus [[Sachverhalt]]; entfällt, wenn die
  Aussage im `source`-Knoten selbst steht),
  **Beweisart** (offene Liste, Grundbestand: `urkunde`
  · `zeuge` · `sachverstaendiger` · `augenschein` ·
  `parteivernehmung` bzw. Beteiligtenvernehmung ·
  `amtliche-auskunft`), **Art des Angebots**
  (`angebot` · `anregung` — im
  Amtsermittlungsverfahren · `sicherung` — vor oder
  außerhalb des Verfahrens · `selbstaendiges-
  beweisverfahren`), Beweisthema.
- **Kanonizität:** die Wahrheit bei Beweisart,
  Beweisthema und Verlauf liegt in dieser Fassade —
  Detail-Knoten spiegeln (Wiki.md §1.1a). Die Relation
  ist lebend (Klasse außerhalb): die Bewertung des
  Beweises (erhoben, ergiebig, unergiebig) wird am
  Eintrag fortgeschrieben; ob eine Tatsache damit
  `bewiesen` oder `widerlegt` ist, steht als Stellung
  in [[Sachverhalt]].
- **Eintragsformat:** `### <Beweismittel> für
  <Beweisthema>` mit Feldern Verfahren (VF-NNN) /
  Beweismittel (`source`, Wikilink) / Belegt (`target`,
  TAT-IDs) / Beweisart / Art / Beweisthema / Anlage
  (bei Urkunden: Nummer in [[Anlagen]]) / Angeboten in
  (Schriftsatz, [[Schriftsaetze]]) / Verlauf
  (`angeboten` · `angeordnet` · `erhoben` ·
  `abgelehnt`; mit Datum) / Detail (Wikilink).
- **Detail-Knoten-Pflicht:** bei Zeugen und
  Sachverständigen (Ladungsfähige Anschrift, Fragen,
  Ergebnis), bei Beweissicherung und selbständigem
  Beweisverfahren; sonst Inline-Eintrag.
- **`evidence`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Beweisangebote]] —
  lesen beim Anlegen eines `evidence`-Knotens.
  Sektionen: Beweismittel und Beweisthema / Angebot
  (Schriftsatz, Wortlaut) / Erhebung und Ergebnis /
  Vermerke (append-only) / Bezüge (Fassaden-Eintrag
  [[Beweisangebote]], Tatsache). Dateiname
  `<VF-NNN> Beweis <Beweismittel> fuer <Beweisthema>.md`.
- **Pflege:** bei Aktivierung, beim Entwurf jedes
  Schriftsatzes mit Beweisangebot, bei Beweisbeschluss
  und nach jedem Beweistermin ([[Marken-SP-2]]
  §Termin).

---

**Bearbeitungsstand:** _(vom Agenten bei Aktivierung und
laufend gepflegt)_

## Einträge

_(je Verfahren nach Beweisthema; offene Angebote
zuerst)_
