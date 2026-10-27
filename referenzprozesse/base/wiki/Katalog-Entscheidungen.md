---
type: catalog-entry
art: register
---

# Katalog-Entscheidungen

Register-Eintrag: Fassade `decision-log`
([[Entscheidungen]]) mit Element-Typ `decision`.
`decision` liegt in der Basis (universeller
Mechanismus); SP-1 präzisiert ihn als Ergänzung im
Abschnitt `decision` (kein eigener Typ, keine eigene
Fassade).

### decision-log

- **Zweck:** Register aller Entscheidungen des Projekts
  (universeller Mechanismus)
- **Pflichtfelder:** `type: decision-log`
- **Präfix:** `DEC`
- **Datei:** `wiki/Entscheidungen.md`
- **Singleton, Pflicht** (Basis-Fassade in jedem
  Projekt, mit und ohne Prozess — Wiki.md §3a
  „mandatory“; nicht deaktivierbar)
- **Kanonizität:** kanonisch für den Status aller
  DEC-Einträge (Wiki.md §1.1a).

### decision

- **Zweck:** Projekt-, Design- oder Architektur-
  Entscheidung (Detail-Knoten für DEC-Eintrag im
  Register). ADR-Muster; universeller Mechanismus —
  jedes Projekt dokumentiert Entscheidungen.
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** nein
- **Pflichtfelder:** `type: decision`, `id`
  (Format `DEC-NNN`), `status` (Status-Achse ab
  `angenommen`), `status_date`, `datum` (seit 2.0)
  (Anlage-Datum `JJJJ-MM-TT`, nie geändert; ohne
  Detail-Knoten die Zeile `Angelegt` des Eintrags —
  [[Katalog]] §Typ-Konventionen), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  eine Entscheidung, die nur die Umgebung eines zu einer
  abgeschlossenen Marke nachgetragenen Deploy-Stands
  betrifft — neue oder anders ausgerollte Umgebung —:
  die Marke des nachgetragenen Deploy-Stands
  — [[Zielmarken]] §Meta, Nachtrag; Freigabe-Eintrag:
  die Marke der Freigabe,
  Marken-Wechsel-Eintrag: die abgeschlossene Marke —
  [[Entscheidungen]] Meta; Bestand ohne Feld:
  [[Zielmarken]] §Meta)
- **Optional:** `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur an
  einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `decision_type` (Art der
  Entscheidung, z.B. `technologie`, `muster`,
  `verfahren`, `verzicht`; Kann-Feld — gesetzt, wo
  ein Stand oder die Kettenprüfung danach filtert:
  `technologie` speist den Technologie-Entscheidungs-
  Stand, `verzicht` kennzeichnet den Verzicht auf eine
  Phase mit Pflicht-Stand für die Marke in
  `zielmarke` — dann mit `phase`, [[Kettenpruefung]]
  §Lint-Anteil; ohne Prozess der Verzicht auf „Tests
  grün“ ohne `phase`, [[Entscheidungen]] Meta
  „Verzichts-Einträge“), `phase` (`Pn`, nur am Verzicht: die
  ausgelassene Phase; Wirkung in der Kette:
  [[Kettenpruefung]] §Fehlende und vertretene
  Glieder),
  `extends`, `alias` (Liste; Wiki.md §4.1). Kein
  `trigger`: DEC ist Eintritts-Register ohne
  `offen`/`aufgeschoben`.
- **Dokumenttypen:**
  [[Katalog-Uebersicht-gueltiger-DECs]],
  [[Katalog-Abschluss-Stand]] (Freigabe-Einträge).
  Mit SP-1: Technologie-Entscheidungen
  (`decision_type: technologie`), Architekturdokument,
  Deploy-Stand.
- **Beispielname:** `DEC-001 Einspruch statt Aenderungsantrag.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Entscheidungen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Entscheidungen]].
- **Freeze und Ablösung:** Mechanismus, Ausnahmen und
  Form des Ablöse-Vermerks stehen in
  [[Einfrieren-und-Abloesen]] (lesen vor einer
  Ablösung); der Betrieb am Register (Vermerk-Praxis,
  Verworfene Alternativen, Freigabe-Einträge) in der
  `## Meta` der Fassade [[Entscheidungen]].
- **SP-1-Präzisierung** (gilt bei aktivem SP-1;
  MADR-kompatibel, kein neuer Typ, keine neue
  Fassade):
  - **Zusätzliche Kann-Frontmatter-Felder** (englische
    Kopfschlüssel nach MADR-Konvention):
    `decision-makers: []`, `consulted: []`,
    `informed: []` — Rollen, keine Klarnamen
    (Unveränderlichkeit der DEC-Detail-Dateien,
    Personenbezug).
  - **Empfohlene Detail-Abschnitte** in fester
    Reihenfolge: Kontext und Problem / Betrachtete
    Optionen / Entscheidung / Folgen / Verworfen und
    warum.
  - **Flag `document-format: madr`** (Kann-Feld im
    Frontmatter): nicht gesetzt — Felder optional,
    Abschnitte Empfehlung; gesetzt — strenge
    Konvention: Abschnitte Pflicht, englische
    Kopfschlüssel, der Kopf ist reine Buchhaltung.
  - **Unverändert:** Dateiname und Fließtext-Sprache
    folgen der Projekt-Konvention; Register-Mechanik
    und `## Meta` der Fassade [[Entscheidungen]]
    gelten weiter.
