---
type: process-brief
process: RP-1
status: ausgearbeitet
extends: [SP-1]
---

# RP-1 — Entwicklung eines Softwaresystems

**Stand:** 2026-08-24

**Was ich bin:** Referenzprozess für die Entwicklung eines
Softwaresystems mit mehreren Komponenten und Contracts.
Aufsetzend auf SP-1 — meine Regeln ergänzen und
modifizieren SP-1 nur dort, wo die Entwicklung eines
Softwaresystems besondere Anforderungen stellt. Der
Vorgehensrahmen (P-Phasen, zweck-gebundene Freigaben,
Wächter-Trigger T4) liegt in [[Vorgehen-RP-1]] und erbt
von [[Vorgehen-SP-1]].

**Was ich kann:**

- Softwaresystem mit mehreren Komponenten strukturieren
  (Entwicklungs-Projekt-Rolle Koordinator / Komponent /
  Standalone — Ebene A₀ des Rollen-Ebenen-Modells;
  Rolle-Erkennung siehe SP-1; RP-1-spezifische
  Ausstattung im RP-1-index §6, Komponenten-Repositories
  als Template-Instanzen siehe RP-1-index §4).
- System-Rolle-Abbildung (Ebene C des Rollen-Ebenen-
  Modells) — die Verwendungs-Rollen (SP-1-`role`-Knoten
  in `wiki/Verwendungs-Rollen.md`) bekommen bei RP-1 ein
  `system_abbildung:`-Feld, das ihre technische
  Umsetzung im Softwaresystem verweist. Präzisierung in
  RP-1-index §5.
- Zweck-gebundene Freigaben an P-Phasen des RP-1-
  Vorgehens buchen (siehe [[Vorgehen-RP-1]]
  §Zweck-Freigaben in RP-1). Jede Freigabe ist ein
  DEC-Eintrag im Entscheidungsregister mit festem
  Feld-Set (betroffenes Artefakt mit Version, Prüfer,
  Reife-Kriterium, Wirkung) und agent-lokaler
  Meilenstein-Wirkung auf den Wächter.
- Spezifikationsketten als Wiki-Knoten pflegen und
  Freigabestände in `output/` mit `_VV_TLA`
  versionieren (RP-1-index §4).
- Contracts zwischen Komponenten führen: Contract-Index-
  Fassade beim Koordinator, individuelle Contracts
  kanonisch beim Provider (RP-1-index §4,
  [[Contract-Index]]).
- Ausgangsdokumente an Dritte (Deploy-Dokument,
  Testplan, Startprompts) über `output/` mit `_VV_TLA`
  ausliefern (RP-1-index §4).
- Analysen und Testberichte in `overview/` sammeln
  (RP-1-index §4).
- Prüf- und Rechercheangebot an P-Phasen des RP-1-
  Vorgehens anwenden (R4/R5/R9/R10 an P5/P7/P10/P12;
  siehe [[Vorgehen-RP-1]] §Angebote an Phasen).
- Beim Init als aufbauender Prozess auf SP-1 angeboten
  werden — primär im Init-Prozess-Angebot, sekundär
  nochmals, sobald Zweck und Anforderungsskizze stehen
  (RP-1-index §4).

**Was ich mitbringe:**

- **Fassaden:** `Softwaresystemarchitektur.md`
  (`software-system-architecture-overview`, löst
  Systemarchitektur aus SP-1 ab),
  `Softwaresystemtest-Setup.md`
  (`software-system-test-setup`, löst
  Systemtest-Setup aus SP-1 ab), `Spezifikationen.md`
  (`specification-log`, Spezifikations-Register je
  Repo — mandatory), `Contract-Index.md`
  (`contract-index`, nur beim Koordinator aktiv) —
  Aktivierung siehe § Mitgebrachte Fassaden.
- **Detail-Knotentypen:** `user-story` (spezialisiert
  `need` aus SP-1; Pflichtfeld `rollen:` als
  String-Liste auf `wiki/Verwendungs-Rollen.md`-`role`-
  Knoten), `use-case` (spezialisiert `scenario` aus
  SP-1; ebenfalls Pflichtfeld `rollen:`),
  `software-system-component` (löst `system-component`
  aus SP-1 ab; kann Ziel des `system_abbildung:`-Felds
  eines Verwendungs-Rollen-`role`-Knotens sein).
  Dazu die Typen `specification` (Spezifikationen,
  SPEC-NNN), `contract` (Contracts, CON-NNN),
  `testplan` und `deployment` — jeweils zweigleisig:
  lebende Fassung im wiki/, Übergabe-Stände in
  `output/` (RP-1-index §4). Startprompts sind
  bewusst reine `output/`-Artefakte; Testergebnisse
  laufen als REP-Knoten nach der Nachweis-Regel der
  Test-Setup-Fassade.
- **Ebene-C-Präzisierung am SP-1-`role`-Typ:**
  zusätzliches Frontmatter-Feld `system_abbildung:`
  (String-Notation), das die technische Abbildung der
  Verwendungs-Rolle im Ziel-System verweist — RP-1-
  mitgebracht auf einem SP-1-Detail-Typ, siehe
  RP-1-index §5.
- **Präfixe:** der SP-1-mitgebrachte Commit-Präfix
  `Freigabe:` läuft in RP-1 unverändert weiter; darüber
  hinaus bringt RP-1 keine neuen Präfixe mit —
  die SP-1-Präfixe `Architektur:` und `Test-Setup:`
  bleiben gültig, der Prozess-Kontext ergibt sich aus
  dem Dateinamen der geänderten Fassade
  (Softwaresystemarchitektur.md bzw.
  Softwaresystemtest-Setup.md). Führende Deklaration:
  §„Mitgebrachte Präfixe" oben; Details RP-1-index §3.4.
- **Kein separates `devstate_system.md`** — der
  Koordinator-`devstate_active.md` §Gesamtstand
  verweist auf die kanonischen Wiki-Quellen
  (RP-1-index §4).

## Mitgebrachte Fassaden

| Fassade | Status | Bemerkung |
|---|---|---|
| Softwaresystemarchitektur | mandatory | löst Systemarchitektur aus SP-1 ab |
| Softwaresystemtest-Setup | mandatory | löst Systemtest-Setup aus SP-1 ab |
| Spezifikationen | mandatory | Spezifikations-Register je Repo (Gesamt- bzw. Teilspezifikation); Kern der P4-Mechanik |
| Contract-Index | optional | rollen-abhängig: beim Koordinator empfohlen ja, bei Komponent/Standalone nein |

## Mitgebrachte Präfixe

_(Führender Deklarations-Ort — beim Prozess-Merge
liest der Agent diese Sektion, Wiki.md §11.3
Schritt 6.)_

RP-1 führt den SP-1-mitgebrachten Präfix
`Freigabe:` unverändert fort und bringt **keine
eigenen Commit-Präfixe** mit; die SP-1-Präfixe
gelten weiter (Ablösungs-Details: RP-1-index §3.4).

## Mitgebrachte Mechanik

_(Führender Deklarations-Ort, Wiki.md §11.3
Schritt 7.)_

RP-1 bringt **keine eigenen
`internal-*`-Mechanik-Knoten** mit. Die
SP-1-mitgebrachten Knoten ([[Register-Lebenszyklus]],
[[Meilenstein-und-T2]], [[Register-Grundmuster]],
[[devstate-Skelett]]) gelten unter RP-1 unverändert
weiter; die RP-1-Betriebs-Mechanik
(Zweck-Freigaben-Format, Spezifikationsketten,
Contract-Konzept) liegt in [[Vorgehen-RP-1]], im
RP-1-index §4 und in den Fassaden-Metas
([[Contract-Index]], [[Spezifikationen]]).

**Setzt voraus:** SP-1 (Standardprozess
Entwicklungsprojekt, siehe
[SP-1-Steckbrief](../SP-1-Standardprozess/Steckbrief.md)).

**Volle Definition:** [[index]]
