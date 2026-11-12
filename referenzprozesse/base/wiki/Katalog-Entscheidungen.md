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
  Entscheidung — **offene Liste**: die Basis nennt die
  ihren, `technologie`, `muster`, `vorgehen`
  (Verfahrensweise), `verzicht`, dazu die Freigabe- und
  Marken-Einträge nach ihrer Form in [[Entscheidungen]]
  Meta; **jeder Prozess ergänzt eigene Arten in seinem
  Katalog-Eintrag** — etwa der Verfahrens-Prozess die
  Entscheidung über das Verfahren und den Strang, der
  Infrastruktur-Prozess das OK je Eingriff und das
  stehende OK; die
  Arten selbst stehen im Prozess, nicht hier. Das
  Prüfprogramm prüft die Werte nicht gegen eine feste
  Liste; die Arten mit Lint-Bedeutung (`verzicht`)
  bleiben. Kann-Feld — gesetzt, wo
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
  Deploy-Stand. Mit SP-2: Verfahrens-Entscheidungen
  (`decision_type: verfahren`).
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
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade; führender Ort der
  Abläufe `Vorgehen-SP-2.md`, der Stränge
  `Marken-SP-2.md`):
  - **Entscheidungsarten** (Ergänzung der offenen
    Liste): `verfahren` — Entscheidung **über das
    Verfahren**: Rechtsbehelf, Gericht bzw. Stelle,
    Vertretung, Kanal, „Heilung abwarten oder
    angreifen“; speist den Stand der
    Verfahrens-Entscheidungen (Phase P7) — nicht zu
    verwechseln mit dem Basis-Wert `vorgehen`
    (Verfahrensweise); `strang` — Entscheidung nach der
    Entscheidungsmatrix (F1 Serie, F2 Bündel, F3 Folge,
    F4 Vorziehen, F5 Abspaltung) mit Eintrag der
    Strang-Form im Register Verfahren; der
    **Stufenwechsel** (Ausbaustufe 1 → 2 → 3) als
    Entscheidung nach dem Grundsatz „Zuschnitt ändern“
    mit Nachtrag der Zeile `Ausbaustufe` in
    [[Aktivierter-Prozess]]. Das Ruhen des Verfahrens
    auf Anwender-Wort ist eine Entscheidung der Art
    `verfahren`, auf die das Kann-Feld `ruht_auf:` am
    `case` verweist (`Vorgehen-SP-2.md` §3).
  - **Strategie-Freigabe nur durch den Anwender:** der
    Freigabe-Eintrag des Strategie-Stands (P1) wird nie
    vom Agenten allein gebucht; eine Änderung von Ziel,
    Linie oder Sperrliste ist eine Ablösung mit neuer
    Freigabe.
  - **Rückzug und Prozesshandlung:** die Entscheidung
    Rückzug / Berichtigung / Ersatz gilt nur für
    Dokumente ohne Prozesshandlungs-Charakter; die
    Rücknahme einer Prozesshandlung (Klage, Antrag,
    Rechtsmittel, Erklärung) ist eine
    Verfahrens-Entscheidung (`verfahren`) aus der
    Strategie, nie ein Rückzug.
  - **Unverändert:** Format, Vermerk-Praxis und
    Freigabe-Einträge der Basis; die Form der
    Entscheidungen folgt der Basis, nicht der
    SP-1-Präzisierung.
- **RP-2-Präzisierung** (gilt bei aktivem RP-2; kein
  neuer Typ, keine neue Fassade): Entscheidungsarten
  (Ergänzung der offenen Liste) `eingriff-ok` (OK je
  Eingriff mit Wortlaut) und `stehendes-ok`
  (stehendes OK mit Rahmen — eine Entscheidung, keine
  Freigabe: eine Freigabe hängt immer an einem Stand);
  Inhalt der Einträge:
  `Vorgehen-RP-2.md` §5.
