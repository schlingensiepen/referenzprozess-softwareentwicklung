---
type: process-brief
process: SP-1
status: ausgearbeitet
extends: []
---

# SP-1 — Standardprozess Entwicklungsprojekt

**Bearbeitungsstand:** 2026-10-25

**Was ich bin:** Der allgemeine Standardprozess für
Entwicklungsprojekte im Template-Umfeld — allgemein für alle
Entwicklungsdomänen (Software, Hardware, System). Als
Grundlage für spezifischere Referenzprozesse (RP-*) oder
eigenständig für einfache Entwicklungsprojekte ohne besondere
Domänen-Anforderungen.

## Mitgebrachte Fassaden

Was ein Typ ist (Zweck, Datei, Pflichtfelder,
Präfix), steht nur in seinem Katalog-Eintrag — lesen
bei Anlage oder Pflege der Fassade; die Spalte
„Gegenstand“ ist die Link-Beschreibung. Die
Einstufung (Status, Vorauswahl, Ablösung) steht hier;
ob eine Fassade aktiv ist, führt [[Fassaden]].

| Fassade | Status | Katalog-Eintrag | Gegenstand | Einstufung |
|---|---|---|---|---|
| Anforderungen | mandatory | [[Katalog-Anforderungen]] | REQ-Register | — |
| Funktionsbeschreibungen | mandatory | [[Katalog-Funktionsbeschreibungen]] | FUNC-Register (P4, Außensicht) | — |
| Spezifikationen | mandatory | [[Katalog-Spezifikationen]] | SPEC-Register (P8, Bauanleitung) | — |
| Fehlermeldungen | mandatory | [[Katalog-Fehlermeldungen]] | BUG-Register | setzt Anforderungen voraus (die Behebung ist dort eine Fix-Anforderung oder die ablösende bzw. neue Anforderung) — solange Fehlermeldungen aktiv ist, lehnt der Agent die Abwahl oder Deaktivierung von Anforderungen ab; wer Anforderungen abwählen will, wählt zuerst Fehlermeldungen ab; der Lint meldet aktive Fehlermeldungen ohne Anforderungen |
| Systemarchitektur | mandatory | [[Katalog-Systemarchitektur]] | ARC-Register und Sollzustand mit §Komponenten | RP-1 löst mit Softwaresystemarchitektur ab |
| Systemtest-Setup | mandatory | [[Katalog-Systemtest-Setup]] | Sollzustand der Prüfung | RP-1 löst mit Softwaresystemtest-Setup ab |
| Testfälle | mandatory | [[Katalog-Testfaelle]] | TEST-Register | — |
| Testberichte | mandatory | [[Katalog-Testberichte]] | TRES-Register | — |
| Deployments | mandatory | [[Katalog-Deployments]] | DEPL-Register | — |
| Zielumgebungen | mandatory | [[Katalog-Zielumgebungen]] | Zielumgebungen (Entitäten) | — |
| Contract-Index | optional | [[Katalog-Contract-Index]] | CON-Register | vorausgewählt, sobald ein Schnitt in Komponenten stattfindet; aktiv nur beim Koordinator |
| Geschäftsbeziehungen | optional | [[Katalog-Geschaeftsbeziehungen]] | Kunden, Wettbewerber, Partner | Vorauswahl deaktiviert — bei Produktentwicklung Empfehlung aktivieren |

**Basis-Fassaden, die SP-1 voraussetzt:** Eine
optionale Basis-Fassade wird Pflicht, wenn der aktive
Prozess sie voraussetzt; der Merge aktiviert sie ohne
Anwender-Frage (Wiki.md §3a). Unter SP-1 sind das:

| Basis-Fassade | Warum SP-1 sie voraussetzt |
|---|---|
| [[Rollen]], [[Bedarfe]], [[Szenarien]] | der Konzept-Stand (P1) filtert bzw. kopiert sie |
| [[Agent-Berichte]] | je Pflicht-Stand ein `review-report` der Kettenprüfung ([[Kettenpruefung]]; nicht beim Abschluss-Stand, der nur auf Vollständigkeit geprüft wird) |
| [[Ideen]] | zurückgestellte Entscheidungen der Ableitungsprüfung ([[Einfrieren-und-Abloesen]]) |

Ohne Prozess bleiben diese Fassaden optional.
[[Zielmarken]] und [[Entscheidungen]] stehen nicht in
der Tabelle: sie sind in jedem Projekt Pflicht
(Wiki.md §3a „mandatory“); SP-1 nutzt sie für die
`marke` in jeder Herkunftszeile, den Abschluss-Stand
beim Marken-Abschluss und die Freigabe-Einträge
(`Vorgehen.md` §4). Die typische Marke unter SP-1:
[[Marken-SP-1]].

Dazu bringt SP-1 Dokumenttyp-Einträge mit: die
Pflicht-Stände der Kette und die optionalen bzw.
selbsttragenden Dokumenttypen. Welche es sind und
welche Phase sie tragen, steht in `index.md` §3.2
(lesen beim Merge und vor der Bildung eines Stands);
sie werden beim Merge wie die Register-Einträge als
Dateien kopiert und im Katalog verankert.

## Mitgebrachte Ordner

Vom Prozess deklarierte Root-Ordner-Freigaben — beim
Merge automatisch als Freigabe-Buchung ins
Entscheidungs-Register übernommen (MasterPrompt
§1.1; beim Init erst nach der Anlage der ersten
Marke, Wiki.md §11.3 Schritt 2); die Ordner entstehen
erst bei Bedarf (Scaffolding, `index.md` §4.4).

| Ordner/Muster | Zweck | Einordnung |
|---|---|---|
| `src/` | Quellcode | Code-Bereich, lebend |
| `tests/` | Tests | Code-Bereich, lebend; Test-Outputs flüchtig (Nachweis-Regel: [[Systemtest-Setup]] `## Meta`) |
| `ci/` | Pipeline-Konfiguration | Code-Bereich, lebend; konkreter Zuschnitt je Scaffolding (V4); Plattform-Konventions-Pfade (z.B. `.github/workflows/`) laufen unter dieser Deklaration mit (MasterPrompt §1.1) |
| `deploy/` | Deploy-Skripte und Infrastruktur-Definitionen | Code-Bereich, lebend, optional; Zuschnitt je Scaffolding (V4/V6a) |
| `docs/` | externe Doku (Kopien der selbsttragenden Doku-Stände Entwickler-Doku, Benutzer-Doku und Betriebs-Anleitung; weitere Handbücher) | **Ableitungs-Schicht** — neu abgeleitet, nicht gepflegt; Wahrheit bleibt im wiki, die freigegebenen Stände in `output/` (`index.md` §4.11); Unterstruktur `docs/developer/`, `docs/user/`, `docs/ops/` |
| weitere je Scaffolding | nach V4-Vorlage | Code-Bereich; Zuschnitt im Instanz-Projekt, Buchung je Ordner |

## Mitgebrachte Präfixe

_(Führender Deklarations-Ort — beim Prozess-Merge
liest der Agent diese Sektion und verbucht die
aktiven Prozess-Präfixe im `internal-rule`-Knoten
[[Aktivierter-Prozess]], Wiki.md §11.3 Schritt 6.)_

SP-1 bringt folgende Commit-Präfixe mit (zusätzlich
zu den Basis-Präfixen aus MasterPrompt §6.2):

- `Anforderungen:` — Änderung an `wiki/Anforderungen.md`
  oder REQ-Detail-Knoten
- `Funktionsbeschreibungen:` — Änderung an
  `wiki/Funktionsbeschreibungen.md` oder
  FUNC-Detail-Knoten
- `Spezifikationen:` — Änderung an
  `wiki/Spezifikationen.md` oder SPEC-Detail-Knoten
- `Fehlermeldungen:` — Änderung an `wiki/Fehlermeldungen.md`
  oder BUG-Detail-Knoten
- `Architektur:` — Änderung an `wiki/Systemarchitektur.md`
  oder ARC-Detail-Knoten (bzw. RP-1-Überschreibung)
- `Test-Setup:` — Änderung an `wiki/Systemtest-Setup.md`
  (bzw. RP-1-Überschreibung)
- `Systemkomponente:` — Änderung an
  Systemkomponente-Detail-Knoten
- `Code:` — Änderungen im Code-Bereich (`src/`, `tests/`,
  `ci/` etc.)
- `Scaffolding:` — Scaffolding-Commit — verbindliche
  Message `Initial project scaffolding`
- `devstate:` — Aktualisierung `devstate_active.md`
- `Freigabe:` — Buchung eines zweck-gebundenen
  Freigabe-DEC-Eintrags (RP-1 führt das Präfix
  unverändert fort)

Die Register Testfälle, Testberichte, Deployments,
Zielumgebungen und Contract-Index bringen keinen
eigenen Präfix mit; Änderungen laufen unter dem
Basis-Präfix `Wiki:`.

## Mitgebrachte Mechanik

_(Führender Deklarations-Ort — beim Prozess-Merge
liest der Agent diese Sektion und führt die
Einführungs-Anweisungen unten je Knoten aus,
Wiki.md §11.3 Schritt 7. Ein Merge ohne diese
Schritte ist ein Befund, kein Erfolg.)_

SP-1 bringt folgende `internal-*`-Knoten mit (Ablage
im SP-1-Teil-Wiki
`referenzprozesse/SP-1-Standardprozess/wiki/`, beim
Merge ins Anwender-`wiki/` kopiert):

| Knoten | Typ | Zweck |
|---|---|---|
| [[Register-Lebenszyklus]] | `internal-concept` | Status-Achse der Register-Einträge, Zustände je Register-Art, samt Feld-Regeln |
| [[Meilenstein-und-T2]] | `internal-rule` | Wächter-Trigger T2 (Prozess-Meilenstein-Wechsel, volle Runde C4–C8), Meilenstein-Anlässe, Meilenstein-Regel „agent-lokal" mit Koordinator-Meilenstein, Meilenstein-Vorgang |
| [[Register-Grundmuster]] | `internal-pattern` | Register-Status-Kanonizität als Ausnahme von Wiki.md §1.1a: Vier-Schichten-Absicherung, Feldliste kanonisch vs. gespiegelt |
| [[devstate-Skelett]] | `internal-pattern` | `devstate_active.md` im Repo-Root: Anlage-Zeitpunkt, Minimal-Skelett, Koordinator-Regel |

**Einführungs-Anweisungen (je Knoten, beim Merge):**

1. **Eintragung:** Aufnahme in die
   Anwender-[[InterneMechanik]] als Register-Eintrag
   in der jeweiligen **Typ-Sektion** (Wikilink +
   Kurzform) mit Herkunfts-Zusatz „(Prozess-
   mitgebracht, SP-1)" in der Eintrags-Zeile — die
   Kategorien-Führung im Landkarten-Sinn liegt bei
   [[Fassaden]]; hier zählt der Katalog-Eintrag,
   nicht nur die Datei-Kopie.
2. **Neuverdrahtung:** nach dem Merge müssen folgende
   Zeiger auf die Knoten zeigen — prüfen, dass sie
   auflösen, und **fehlende Zeiger nachtragen**
   (z.B. die devstate-Referenz in der
   Zielmarken-`## Meta`, die Grundmuster-Nennungen
   der Register-Fassaden-Metas); wird dabei eine bestehende projekt-eigene
   Regel ersetzt, trägt sie den Vermerk „abgelöst
   durch `[[<neu>]]`" (kein stiller Ersatz):
   - [[Register-Lebenszyklus]] ← SP-1-`index.md`
     §4.1-Kurzform und §3.2 Absatz
     „Register-Detail-Knoten"; [[Contract-Index]]
     `## Meta` (Status).
   - [[Meilenstein-und-T2]] ← SP-1-`index.md`
     §4.2/§4.3-Kurzformen; MasterPrompt §6.1
     (Begriffs-Kette Meilenstein-Vorgang);
     `Vorgehen-SP-1.md` §7; dieser Steckbrief
     §„Was ich kann".
   - [[Register-Grundmuster]] ← SP-1-`index.md`
     §3.3-Kurzform; die Kanonizitäts-Absätze der
     Fassaden-Metas der Ketten-Register nennen
     dieselbe Regel in Kurzform.
   - [[devstate-Skelett]] ← SP-1-`index.md`
     §4.5-Kurzform; `## Meta` der Fassade
     [[Zielmarken]] (devstate-Referenz-Zeile).
3. **Kollisions-Regel:** existiert im Anwender-`wiki/`
   bereits ein gleichnamiger oder funktions-gleicher
   `internal-*`-Knoten, wird er nicht überschrieben —
   der Agent legt die Kollision dem Anwender vor
   (Wiki.md §5.2a sinngemäß: Vorlage mit Optionen
   Ablösung per Vermerk / Umbenennung / Verzicht auf
   den mitgebrachten Knoten), vor dem Kopieren.
4. **Rückbau bei Prozess-Deaktivierung:** die vier
   Knoten auf `active: false` setzen (nicht löschen),
   ihre Register-Einträge in [[InterneMechanik]] als
   deaktiviert markieren und die unter Neuverdrahtung
   genannten Zeiger auf die dann geltende Quelle
   zurückstellen (Basis bzw. Nachfolge-Prozess);
   Buchung im Knoten [[Aktivierter-Prozess]].

**Was ich kann:**

- Anforderungen und Fehlermeldungen als Register mit
  8-Zustands-Lebenszyklus führen (Zustände und
  Ablöseverweis: [[Register-Lebenszyklus]]).
- Den Wächter der Basis um Trigger T2
  (Prozess-Meilenstein) ergänzen — Meilenstein-Anlässe
  und Meilenstein-Regel „agent-lokal" mit
  Koordinator-Meilenstein siehe
  [[Meilenstein-und-T2]] (Kurzform `index.md` §4.2;
  Basis-Anlässe: MasterPrompt §5.4 „Wächter-Trigger“).
- Zweck-gebundene Freigaben als DEC-Einträge im
  Entscheidungs-Register verankern und per
  Wächter-Trigger T4 „Freigabe-Bezugsprüfung" gegen die
  Grundlage-Artefakte prüfen (Vorgehensrahmen,
  `Vorgehen.md` §4/§5).
- Prüf- und Rechercheangebot mit den SP-1-R-Themen an
  P-Phasen des Vorgehens organisieren (kanonische
  Bindungstabelle: `Vorgehen-SP-1.md` §3; Angebotsformat:
  [[Angebots-und-Beauftragungs-Muster]]).
- Init-Verzahnung mit dem Prozess-Angebot in
  MasterPrompt §5.3 (Steckbrief-Scan, automatische
  Aktivierung der mandatory-Fassaden).

**Was ich mitbringe:**

- **Fassaden** für Anforderungen, Funktion,
  Spezifikation, Fehler, Architektur, Test, Deployment,
  Zielumgebungen, Contracts und Geschäftsbeziehungen —
  Deklaration oben, §„Mitgebrachte Fassaden".
- **Detail-Knotentypen und Dokumenttyp-Einträge** der
  Kette, dazu die MADR-Präzisierung des Basis-Typs
  `decision` und die Relations zu Organisationen — die
  Liste steht in `index.md` §3.2 (lesen beim Merge und
  vor dem Anlegen eines Knotens). Die Basis-Typen
  `need`, `scenario` und `role` nutzt SP-1 über den
  Konzept-Stand.
- **Ordner, Präfixe, Mechanik** — Deklarationen oben,
  §„Mitgebrachte Ordner", §„Mitgebrachte Präfixe",
  §„Mitgebrachte Mechanik".

**Zur Abgrenzung:** `Entscheidungen.md` (`decision-log`)
und der Detail-Typ `decision` sind Basis-Fassade bzw.
Basis-Detail-Typ, nicht SP-1-mitgebracht — universeller
Mechanismus, jedes Projekt dokumentiert Entscheidungen;
die Fassade ist in jedem Projekt Pflicht (Wiki.md §3a
„mandatory“), wie [[Zielmarken]].
Einen eigenen Typ `structure` gibt es nicht — Struktur
ist durch die Systemarchitektur-Fassade plus
`system-component`-Detail-Knoten abgedeckt.

**Setzt voraus:** nur die Basis (Template out-of-the-box).

**Volle Definition:** [[index]] (Architektur und
Verhältnis zur Basis) · Vorgehen: [[Vorgehen-SP-1]] ·
Marken: [[Marken-SP-1]] (typische Marke, ihr Produkt,
Schnitt, Zusammenspiel mit dem Meilenstein-Vorgang) ·
Mechanik-Knoten:
[[Register-Lebenszyklus]] · [[Meilenstein-und-T2]] ·
[[Register-Grundmuster]] · [[devstate-Skelett]]
(Deklaration: §„Mitgebrachte Mechanik" oben)
