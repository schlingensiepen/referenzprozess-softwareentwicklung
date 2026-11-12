---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Beweisangebote

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`evidence-log` ([[Beweisangebote]]) mit Element-Typ
`evidence` — die Beweismittel-Relation, als
Detail-Knoten (Kategorie a; was eine Relation ist:
[[Katalog-Mitgliedschaften]], Einleitung). Der Typ
kommt aus der Basis nach SP-2 (bis 2.1 dort als
Relations-Typ ohne Register). Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### evidence-log

- **Zweck:** Relations-Register der
  Beweismittel-Beziehungen je Verfahren —
  Beweisangebote, Beweisanregungen und
  Beweissicherungen je Beweisthema, mit Beweisart
- **Pflichtfelder:** `type: evidence-log`
- **Präfix:** `—`
- **Datei:** `wiki/Beweisangebote.md`
- **Singleton** — optional ab Stufe 2, Vorauswahl
  deaktiviert (Steckbrief § Mitgebrachte Fassaden)
- **Pflicht ab:** — (optional ab Stufe 2)
- **Entfällt abgeleitet, wenn:** die Fassade inaktiv
  ist (`active: false`)

### evidence

- **Zweck:** Beweismittel-Beziehung — verknüpft eine
  Beweismittel-Quelle mit der belegten Aussage. Die
  Rolle „Beweismittel“ ist relational, nicht
  intrinsisch: ein und dasselbe Dokument kann in einem
  Verfahren Beweismittel sein und in einem anderen
  nicht. Kein eigener Entity-Typ; ein physisches
  Beweisstück bleibt ein Basis-`thing`
- **Klasse:** außerhalb (lebend; die Bewertung des
  Beweises wird fortgeschrieben, die Stellung der
  Tatsache steht in [[Sachverhalt]])
- **Pflichtfelder:** `type: evidence`, `source`
  (String-Slug des Wissenselements, das das
  Beweismittel darstellt; beliebiger Typ zulässig:
  `document`, `exhibit`, `person`, `thing`, `event`,
  …), `verfahren` (seit 2.2) (String-Slug des
  `case`-Knotens), `beweisart` (seit 2.2) (offene
  Liste, Grundbestand: `urkunde` | `zeuge` |
  `sachverstaendiger` | `augenschein` |
  `parteivernehmung` | `amtliche-auskunft`)
- **Optional:** `target` (die belegte Aussage —
  String-Slug oder TAT-ID aus [[Sachverhalt]]; entfällt,
  wenn die Aussage im `source`-Knoten selbst
  ausgeschrieben ist), `evidence_type` (`angebot` |
  `anregung` | `sicherung` |
  `selbstaendiges-beweisverfahren`; Vorgabe `angebot`),
  `beweisthema` (ein Satz), `anlage` (Nummer in
  [[Anlagen]], bei Urkunden), `angeboten_in`
  (String-Slug des Schriftsatzes, [[Schriftsaetze]]),
  `verlauf` (`angeboten` | `angeordnet` | `erhoben` |
  `abgelehnt`), `bewertung` (Freitext: ergiebig,
  unergiebig, Zulässigkeit), `alias`
- **Beispielname:** `VF-001 Beweis Zustellungsurkunde fuer Zugang am 2026-03-11.md`
- **Kanonizität:** Wahrheit bei Beweisart, Beweisthema
  und Verlauf liegt in `wiki/Beweisangebote.md`
  (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Beweisangebote]] (Sektionen Beweismittel und
  Beweisthema / Angebot / Erhebung und Ergebnis /
  Vermerke / Bezüge).
- **Ohne aktive Fassade:** der Relations-Typ bleibt
  verfügbar — eine Tatsache nennt im Feld `beweis`
  Anlage oder Dokument direkt; die Fassade bündelt und
  bewertet ab Stufe 2 auf Angebot des Agenten.
- **RP-20-Präzisierung** (gilt bei aktivem RP-20; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-20-Rechtsfall/`): Beweisarten je
  Ordnung als Grundbestand von `beweisart`;
  Einwendungsfrist gegen Gutachten, Beweisbeschluss.
  Einzelheiten in `Vorgehen-RP-20.md` §3
  „Beweisangebote“.
