---
type: process-brief
process: SP-2
status: geplant
extends: []
---

# SP-2 — Recht und Verwaltung

**Ich bin nur geplant, noch nicht ausgearbeitet.**
Vollständige Ausarbeitung (index.md, Vereinbarungen,
Fassaden-Skelette, Knotentypen-Anhang) folgt in einer
späteren Version.

**Was ich bin:** Eigenständiger Standardprozess für die
Bearbeitung rechts- und verwaltungsbezogener Vorgänge.
Basis für die spezifischen Referenzprozesse RP-3
(Rechtsfall) und RP-4 (Steuerfall) — perspektivisch
erweiterbar um weitere Verwaltungs-Vorgangsarten.

**Was ich kann:** noch nicht ausgearbeitet.

**Was ich mitbringe:**

- **Entity-Typ:** `flurstueck` (eigenständige Entity;
  die Präzisierungs-Frage `extends: place` bleibt der
  Ausarbeitung vorbehalten).
- **Relations:**
  - `authority` — Organisation↔Zuständigkeit („Behörde X
    ist zuständig für Y").
  - `evidence` — **Beweismittel als Relation** (nicht
    Entity). Verknüpft eine Beweismittel-Quelle mit der
    belegten Aussage. `source:` Pflicht (beliebiger
    Wikilink — Dokument, Person, Basis-`thing`, Ereignis
    usw.); `target:` optional (entfällt, wenn die belegte
    Aussage bereits im Source-Knoten enthalten ist).
    Weitere Attribute (Präzisierung, Bewertung,
    Zulässigkeit) folgen in der Ausarbeitung.
- **Basis-`thing` bleibt unangetastet.** Physische
  Beweisstücke (z.B. sichergestellte Waffe) sind
  Basis-`thing`; die Beweismittel-Rolle wird über
  die `evidence`-Relation hergestellt.
- **Fassaden** für die Detail-Typen werden bei der
  Prozess-Ausarbeitung angelegt (jeder neue Detail-Typ
  bekommt eine indexierende Fassade mit
  Index-Verankerung).

## Mitgebrachte Fassaden

Wird bei der Ausformulierung (Version 1.1+) festgelegt.

**Setzt voraus:** nur die Basis (Template out-of-the-box).

**Volle Definition:** noch nicht angelegt — folgt in
einer späteren Version.
