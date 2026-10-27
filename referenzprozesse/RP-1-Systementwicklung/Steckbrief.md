---
type: process-brief
process: RP-1
status: ausgearbeitet
extends: [SP-1]
---

# RP-1 — Entwicklung eines Softwaresystems

**Bearbeitungsstand:** 2026-10-25

**Was ich bin:** Referenzprozess für die Entwicklung eines
Softwaresystems mit mehreren Komponenten und Contracts.
Aufsetzend auf SP-1 — meine Regeln ergänzen und
modifizieren SP-1 nur dort, wo die Entwicklung eines
Softwaresystems besondere Anforderungen stellt. Der
Vorgehensrahmen (P-Phasen, zweck-gebundene Freigaben,
Wächter-Trigger T4) liegt in [[Vorgehen-RP-1]] und erbt
von [[Vorgehen-SP-1]]; die typische Marke eines
Softwaresystems (Release, Produkt-Version ≠ Marke) in
[[Marken-RP-1]], erbend von [[Marken-SP-1]].

**Was ich kann:**

- Softwaresystem mit mehreren Komponenten strukturieren
  (Entwicklungs-Projekt-Rolle Koordinator / Komponent /
  Standalone — Ebene A₀ des Rollen-Ebenen-Modells;
  Rolle-Erkennung siehe SP-1; RP-1-spezifische
  Ausstattung im RP-1-index §6, Komponenten-Repositories
  als Template-Instanzen siehe RP-1-index §4).
- System-Rolle-Abbildung (Ebene C des Rollen-Ebenen-
  Modells) — die Verwendungs-Rollen (`role`-Knoten im
  Basis-Register [[Rollen]]) bekommen bei RP-1 ein
  `system_abbildung:`-Feld, das ihre technische
  Umsetzung im Softwaresystem verweist. Präzisierung in
  RP-1-index §5.
- Zweck-gebundene Freigaben an P-Phasen des RP-1-
  Vorgehens buchen (siehe [[Vorgehen-RP-1]]
  §Zweck-Freigaben in RP-1). Jede Freigabe ist ein
  DEC-Eintrag im Entscheidungsregister mit dem
  RP-1-Feld-Set und agent-lokaler
  Meilenstein-Wirkung auf den Wächter (RP-1-index §4).
- Die Kette der Pflicht-Stände präzisieren
  (Funktionsbeschreibung, Spezifikation) und
  Freigabestände in `output/` mit `_VV_TLA`
  versionieren (RP-1-index §4).
- Contracts zwischen Komponenten aushandeln: der
  Provider verhandelt und meldet per Nachricht, der
  Koordinator bucht im SP-1-Register [[Contract-Index]]
  samt Consumer-Registrierungen; Lieferungen der
  Komponenten bucht er am Marken-Eintrag
  (RP-1-index §4).
- Ausgangsdokumente an Dritte (Deploy-Stand,
  Testplan, Startprompts) über `output/` mit `_VV_TLA`
  ausliefern (RP-1-index §4).
- Analysen in `overview/` sammeln und Testergebnisse
  nach der Nachweis-Regel belegen, bei Durchgängen
  nach Testplan als Testbericht im SP-1-Register
  [[Testberichte]] (RP-1-index §4).
- Prüf- und Rechercheangebot an P-Phasen des RP-1-
  Vorgehens anwenden (R4/R5/R9/R10 an P5/P7/P11/P13;
  siehe [[Vorgehen-RP-1]] §Angebote an Phasen).
- Beim Init als aufbauender Prozess auf SP-1 angeboten
  werden — primär im Init-Prozess-Angebot, sekundär
  nochmals, sobald Zweck und Anforderungsskizze stehen
  (RP-1-index §4).

**Was ich mitbringe:**

- **Fassaden** für Softwaresystemarchitektur und
  Softwaresystemtest-Setup, die die SP-1-Fassaden
  ablösen — Deklaration unten, §„Mitgebrachte
  Fassaden". Die SP-1-Register
  [[Funktionsbeschreibungen]], [[Spezifikationen]]
  und [[Contract-Index]] bringt RP-1 nicht mit,
  sondern präzisiert sie im Vorgehen.
- **Detail-Knotentypen** für User-Story, Use-Case und
  Softwaresystemkomponente (erweiternd bzw. ablösend)
  und die Durchführungs-Instanz — Liste, Ablösungen
  und die Lage der übrigen Artefakte (Testplan,
  Deploy-Stand, Startprompts, Testergebnisse):
  RP-1-index §3.2, lesen beim Merge und vor dem
  Anlegen eines Knotens.
- **Ebene-C-Feld `system_abbildung:`** am Basis-Typ
  `role` — RP-1-index §5.
- **Präfixe:** keine neuen — Deklaration unten,
  §„Mitgebrachte Präfixe"; Details RP-1-index §3.4.
- **Gesamtstand des Koordinators** als abgeleitete
  Sicht in `devstate_active.md` §Gesamtstand
  ([[devstate-Skelett]]).

## Mitgebrachte Fassaden

Was ein Typ ist (Zweck, Datei, Pflichtfelder,
`replaces_type:`), steht nur in seinem Katalog-Eintrag
— lesen bei Anlage oder Pflege der Fassade. Die
Einstufung steht hier; ob eine Fassade aktiv ist,
führt [[Fassaden]].

| Fassade | Status | Katalog-Eintrag | Einstufung |
|---|---|---|---|
| Softwaresystemarchitektur | mandatory | [[Katalog-Softwaresystemarchitektur]] | löst Systemarchitektur aus SP-1 ab |
| Softwaresystemtest-Setup | mandatory | [[Katalog-Softwaresystemtest-Setup]] | löst Systemtest-Setup aus SP-1 ab |

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
(Zweck-Freigaben-Format, Präzisierung der Kette,
Contract-Konzept) liegt in [[Vorgehen-RP-1]], im
RP-1-index §4 und in den Fassaden-Metas der
SP-1-Register ([[Contract-Index]],
[[Funktionsbeschreibungen]], [[Spezifikationen]]).

**Setzt voraus:** SP-1 (Standardprozess
Entwicklungsprojekt, siehe
[SP-1-Steckbrief](../SP-1-Standardprozess/Steckbrief.md)).

**Volle Definition:** [[index]]
