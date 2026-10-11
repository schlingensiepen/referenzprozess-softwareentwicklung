---
type: process-brief
process: SP-3
status: geplant
extends: []
---

# SP-3 — Publikation

**Ich bin nur geplant, noch nicht ausgearbeitet.**
Vollständige Ausarbeitung (index.md, Vereinbarungen,
Fassaden-Skelette, Knotentypen-Anhang) folgt in einer
späteren Version.

**Was ich bin:** Eigenständiger Standardprozess für
Publikations- und Redaktions-Arbeit — wissenschaftliches
Publizieren (Journals, Konferenzbeiträge) ebenso wie
journalistische oder redaktionelle Veröffentlichungen.

**Was ich kann:** noch nicht ausgearbeitet.

**Was ich mitbringe:**

- **Detail-Typen:**
  - `publication` — Publikations-Container (Journal,
    Proceedings, Zeitung, …) mit
    `publication_type:`-Enum (erweiterbar).
    Fassade `Publikationen.md` (`publication-log`).
  - `article` — einzelner Artikel/Beitrag. Fassade
    `Artikel.md` (`article-log`).
  - `conference` (`extends: event`) — spezialisiert
    Basis-`event` um Ort/Datum/Track-Felder; optional
    verknüpft mit einer `publication` (Proceedings).
- **Relations:**
  - `author` — Person↔Article („Person X ist Autor
    von Artikel Y").
  - `source` — Entität↔Article (Quelle; kann Person,
    Organisation, andere Publikation sein).
  - `fellowship` (`extends: member`) — spezialisiert
    Basis-Relation `member` für wissenschaftliche
    Zugehörigkeit.
- **Fassaden** für die Detail-Typen werden bei der
  Prozess-Ausarbeitung angelegt (jeder neue Detail-Typ
  bekommt eine indexierende Fassade mit
  Index-Verankerung).

**Zur Abgrenzung:** `institution` wandert **nicht**
hierher — Institutionen werden über den Basis-Typ
`organization` mit `organization_type: institution`
abgedeckt.

## Mitgebrachte Fassaden

Wird bei der Ausformulierung (Version 1.1+) festgelegt.

**Setzt voraus:** nur die Basis (Template out-of-the-box).

**Volle Definition:** noch nicht angelegt — folgt in
einer späteren Version.
