---
type: process-brief
process: RP-3
status: geplant
extends:
  - SP-2-Recht-und-Verwaltung
---

# RP-3 — Rechtsfall

**Ich bin nur geplant, noch nicht ausgearbeitet.**
Vollständige Ausarbeitung folgt in einer späteren
Version.

**Was ich bin:** Referenzprozess für die Bearbeitung
eines individuellen Rechtsfalls (Zivilrecht, Verwaltungs-
recht, Verfahren mit Aktenzeichen und Fristen).

**Was ich kann:** noch nicht ausgearbeitet.

**Was ich mitbringe:** noch keine RP-3-spezifischen
Fassaden oder Detail-Typen definiert — nutzt SP-2-Bestand
(Entity `flurstueck`; Relations `authority`, `evidence`).
Beweismittel sind als **`evidence`-Relation** modelliert,
nicht als eigener Entity-Typ: `source:` ist Pflicht
(beliebiger Wikilink auf die Beweismittel-Quelle —
Dokument, Person, Basis-`thing`, Ereignis usw.),
`target:` ist optional (entfällt, wenn die belegte
Aussage bereits im Source-Knoten enthalten ist).
Basis-`thing` bleibt für physische Dinge verfügbar
und wird erst über die `evidence`-Relation zum
Beweismittel.

## Mitgebrachte Fassaden

Wird bei der Ausformulierung (Version 1.1+) festgelegt.

**Setzt voraus:** SP-2 (Recht und Verwaltung). SP-2 ist
selbst noch `status: geplant` — solange die Basis-
Definition nicht ausgearbeitet ist, gilt auch über diesen
`extends:`-Verweis: erst einmal mit der Basis arbeiten
(Basis-Only-Modus, kein Prozess-Merge).

**Volle Definition:** noch nicht angelegt — folgt in
einer späteren Version.
