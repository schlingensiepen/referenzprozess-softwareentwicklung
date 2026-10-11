---
type: process-brief
process: SP-1
status: ausgearbeitet
extends: []
---

# SP-1 — Standardprozess Entwicklungsprojekt

**Stand:** 2026-08-24

**Was ich bin:** Der allgemeine Standardprozess für
Entwicklungsprojekte im Template-Umfeld — allgemein für alle
Entwicklungsdomänen (Software, Hardware, System). Als
Grundlage für spezifischere Referenzprozesse (RP-*) oder
eigenständig für einfache Entwicklungsprojekte ohne besondere
Domänen-Anforderungen.

## Mitgebrachte Fassaden

| Fassade | Status | Bemerkung |
|---|---|---|
| Anforderungen | mandatory | REQ-Register, funktional und nicht-funktional |
| Fehlermeldungen | mandatory | BR-Register — Meldungen, nicht Arbeit |
| Systemarchitektur | mandatory | Sollzustands-Fassade; RP-1 löst mit Softwaresystemarchitektur ab |
| Systemtest-Setup | mandatory | Sollzustands-Fassade Prüfung; RP-1 löst mit Softwaresystemtest-Setup ab |
| Verwendungs-Rollen | mandatory | Rollen im Nutzer-Prozess (Ebene B) |
| Geschäftsbeziehungen | optional | Kunden/Wettbewerber/Partner (Organisation↔Projektaspekt); Vorauswahl deaktiviert — bei Produktentwicklung Empfehlung aktivieren |

## Mitgebrachte Ordner

Vom Prozess deklarierte Root-Ordner-Freigaben — beim
Merge automatisch als Freigabe-Buchung ins
Entscheidungs-Register übernommen (MasterPrompt
§1.1); die Ordner entstehen erst bei Bedarf
(Scaffolding, `index.md` §4.4).

| Ordner/Muster | Zweck | Einordnung |
|---|---|---|
| `src/` | Quellcode | Code-Bereich, lebend |
| `tests/` | Tests | Code-Bereich, lebend; Test-Outputs flüchtig (Nachweis-Regel: Test-Setup-Fassade) |
| `ci/` | Pipeline-Konfiguration | Code-Bereich, lebend; konkreter Zuschnitt je Scaffolding (V4); Plattform-Konventions-Pfade (z.B. `.github/workflows/`) laufen unter dieser Deklaration mit (MasterPrompt §1.1) |
| `deploy/` | Deploy-Skripte und Infrastruktur-Definitionen | Code-Bereich, lebend, optional; Zuschnitt je Scaffolding (V4/V6a) |
| `docs/` | externe Doku-Ableitungen (User-/Developer-/Ops-Doku, Handbücher) | **Ableitungs-Schicht** — gepflegt, Wahrheit bleibt im wiki (`index.md` §4.11); Unterstruktur je Bedarf (`docs/user/`, `docs/developer/`, `docs/ops/`) |
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
- `Fehlermeldungen:` — Änderung an `wiki/Fehlermeldungen.md`
  oder BR-Detail-Knoten
- `Architektur:` — Änderung an `wiki/Systemarchitektur.md`
  (bzw. RP-1-Überschreibung)
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
| [[Register-Lebenszyklus]] | `internal-concept` | der feste 8-Zustands-Lebenszyklus der Register-Einträge (REQ, BR — Muster auch für DEC) samt Feld-Regeln |
| [[Meilenstein-und-T2]] | `internal-rule` | Wächter-Trigger T2 (Prozess-Meilenstein-Wechsel), Meilenstein-Regel „agent-lokal, mit Aggregaten für Koordinator", Meilenstein-Vorgang |
| [[Register-Grundmuster]] | `internal-pattern` | Register-Status-Kanonizität als §1.1a-Ausnahme: Vier-Schichten-Absicherung, Feldliste kanonisch vs. gespiegelt |
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
   durch [[neu]]" (kein stiller Ersatz):
   - [[Register-Lebenszyklus]] ← SP-1-`index.md`
     §4.1-Kurzform; `Knotentypen-Anhang-SP-1`
     §Register-Detail-Knoten; RP-1-[[Contract-Index]]
     `## Meta` (Status-Enum).
   - [[Meilenstein-und-T2]] ← SP-1-`index.md`
     §4.2/§4.3-Kurzformen; MasterPrompt §6.1
     (Begriffs-Kette Meilenstein-Vorgang);
     `Vorgehen-SP-1.md` §7; dieser Steckbrief
     §„Was ich kann".
   - [[Register-Grundmuster]] ← SP-1-`index.md`
     §3.3-Kurzform; die Kanonizitäts-Absätze der
     Register-Fassaden-Metas (Anforderungen,
     Fehlermeldungen, Verwendungs-Rollen) nennen
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
  8-Zustands-Lebenszyklus führen (offen | aufgeschoben |
  angenommen | in-umsetzung | umgesetzt | abgeschlossen |
  verworfen | abgelöst durch).
- Wächter mit den Basis-Triggern T1 (Sessionstart) und
  T3 (User-Anfrage) ausführen und um Trigger T2
  (Prozess-Meilenstein) ergänzen — Meilenstein-Regel
  „agent-lokal, mit Aggregaten für Koordinator" siehe
  [[Meilenstein-und-T2]] (Kurzform `index.md` §4.2).
- Zweck-gebundene Freigaben als DEC-Einträge im
  Entscheidungs-Register verankern und per
  Wächter-Trigger T4 „Freigabe-Bezugsprüfung" gegen die
  Grundlage-Artefakte prüfen (Vorgehensrahmen,
  `Vorgehen.md` §4/§5).
- Prüf- und Rechercheangebot mit den SP-1-R-Themen an
  P-Phasen des Vorgehens organisieren (kanonische
  Bindungstabelle: `Vorgehen-SP-1.md` §3; Angebotsformat:
  MasterPrompt §5.6).
- Init-Verzahnung mit dem Prozess-Angebot in
  MasterPrompt §5.3 (Steckbrief-Scan, automatische
  Aktivierung der mandatory-Fassaden).

**Was ich mitbringe:**

- **Fassaden:** siehe Tabelle oben — `Anforderungen.md`
  (`requirement-log`), `Fehlermeldungen.md`
  (`bug-report-log`), `Systemarchitektur.md`
  (`system-architecture-overview`; RP-1 löst mit
  `Softwaresystemarchitektur` ab), `Systemtest-Setup.md`
  (`system-test-setup`; RP-1 löst mit
  `Softwaresystemtest-Setup` ab), `Verwendungs-Rollen.md`
  (`role-log`, Register aller Verwendungs-Rollen im
  Nutzer-Prozess — Ebene B), `Geschäftsbeziehungen.md`
  (`business-relation-log`, optional mit Vorauswahl
  deaktiviert — Kunden/Wettbewerber/Partner).
- **Detail-Knotentypen:** `requirement`, `bug-report`,
  `system-component`, `system`, `role` — dazu die
  MADR-Präzisierung des Basis-Typs `decision` und die
  Relations `customer`/`competitor`/`partner`. Die Typen `need`
  (rollen-basierter Bedarf, referenziert
  Verwendungs-Rollen) und `scenario` sind als generische
  Vorstufen im Katalog benannt; konzeptuelle Ausarbeitung
  folgt.
- **Präfixe:** SP-1-eigene Commit-Präfixe für Register-,
  Architektur-, Test-Setup-, Systemkomponente-, Code-,
  Scaffolding-, devstate- und Freigabe-Commits —
  vollständige Deklaration oben,
  §„Mitgebrachte Präfixe".
- **Mechanik:** vier `internal-*`-Knoten
  ([[Register-Lebenszyklus]], [[Meilenstein-und-T2]],
  [[Register-Grundmuster]], [[devstate-Skelett]]) —
  vollständige Deklaration samt
  Einführungs-Anweisungen oben,
  §„Mitgebrachte Mechanik".

**Zur Abgrenzung:** `Entscheidungen.md` (`decision-log`)
und der Detail-Typ `decision` sind Basis-Fassade bzw.
Basis-Detail-Typ, nicht SP-1-mitgebracht — universeller
Mechanismus, jedes Projekt dokumentiert Entscheidungen.
Einen eigenen Typ `structure` gibt es nicht — Struktur
ist durch die Systemarchitektur-Fassade plus
`system-component`-Detail-Knoten abgedeckt.

**Setzt voraus:** nur die Basis (Template out-of-the-box).

**Volle Definition:** [[index]] (Architektur und
Verhältnis zur Basis) · Mechanik-Knoten:
[[Register-Lebenszyklus]] · [[Meilenstein-und-T2]] ·
[[Register-Grundmuster]] · [[devstate-Skelett]]
(Deklaration: §„Mitgebrachte Mechanik" oben)
