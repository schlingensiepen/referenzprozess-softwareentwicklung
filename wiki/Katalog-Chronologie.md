---
type: catalog-entry
art: register
---

# Katalog-Chronologie

Register-Eintrag: Fassade `timeline` ([[Chronologie]])
mit Element-Typ `event`.

### timeline

- **Zweck:** Zeitachse — was ist wann passiert
- **Pflichtfelder:** `type: timeline`
- **Präfix:** `—`
- **Datei:** `wiki/Chronologie.md`
- **Singleton**

### event

- **Zweck:** gewichtiges Ereignis mit Kontext,
  Beteiligten, Quelle (Hybrid zur Chronologie)
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: event`, `date`
  (`YYYY-MM-DD`)
- **Empfohlen:** `case`, `source` (String-Slugs, keine
  Wikilinks — Wiki.md §4.1)
- **Optional:** `origin: redaktionell`
- **Beispielname:**
  `2026-04-15 Ereignis Angebot angenommen 2026-117.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Chronologie]].
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade — die Fassade
  Chronologie ist in SP-2 **Pflicht ab Stufe 1**):
  - **Verfahrens-Zeitachse:** jedes Ereignis des
    Verfahrens — Zugang eines Dokuments, Einreichung,
    Termin, Entscheidung, Fristablauf, Zahlung,
    Status- und Instanzwechsel, Strang-Entscheidung —
    steht mit `case` (in SP-2 Pflichtfeld, String-Slug
    des Verfahrens) in der Chronologie; sie ist die
    Grundlage für Sachverhalts-Darstellung,
    Fristberechnung und Terminsvorbereitung des
    Prozesses und wird beim Einlesen jedes Eingangs und
    mit jeder Einreichung fortgeschrieben.
  - **Unverändert:** `date`, `source`,
    `origin: redaktionell`, Kriterium „gewichtig“ und
    `## Meta` der Fassade [[Chronologie]] gelten weiter.
