---
type: guide-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Wegweiser

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `guide-log` — Index aller Wegweiser des
  Projekts (Knoten vom Typ `guide`,
  [[Katalog-Wegweiser]]). Singleton, kein Präfix:
  Schlüssel eines Wegweisers ist das Kürzel der
  Verfahrensordnung (`zpo`, `fgo`) oder ein
  sprechender Slug beim Querschnittsthema (`kosten`,
  `pruefraster`).
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register; die
  Detail-Knoten sind die Wegweiser selbst, große
  Wissens-Knoten mit Teilaufsätzen im gleichnamigen
  Unterordner (Wiki.md §5.4: Übersicht listet alle,
  jeder Teilaufsatz trägt Rücklink und Vor/Zurück;
  Dateinamen mit dem Knotennamen als Präfix).
- **Was ein Wegweiser ist:** eine Prüfliste für einen
  Agenten ohne juristische Vorbildung — je
  Verfahrensordnung Rechtsbehelfe und Fristen,
  Eilrechtsschutz, Begleitanträge-Checkliste, Kosten
  und Kostenanträge, Begründung und Heilung,
  Erledigung, Prüfraster für eingehende
  Entscheidungen; je Querschnittsthema das Thema über
  alle Ordnungen. Jede Normaussage ist mit einem Link
  auf den Anker der Norm in der Lesefassung des
  Normen-Pakets belegt; was sich dort nicht belegen
  lässt, ist als „nicht im Paket belegt“
  gekennzeichnet. Wegweiser, keine Rechtsberatung;
  maßgeblich ist der Normtext.
- **Eigentum und Upgrade:** Die Wegweiser **gehören dem
  Template**. Das Upgrade ersetzt sie (Übersicht und
  Teilaufsätze gemeinsam); **das Projekt ändert sie
  nicht**. Projektwissen, eigene Ergänzungen und
  Notizen stehen in eigenen Knoten (Konzepte, eigene
  Rechercheartefakte) und verweisen auf den Wegweiser.
- **Stand der Normtexte:** Jeder Wegweiser trägt im Kopf
  die Zeile „Stand der Normtexte“ und verweist auf den
  Normen-REC, für den er geschrieben ist (Frontmatter
  `normen_rec`, `normen_stand`; Register
  [[Rechercheartefakte]]). Das Upgrade bringt Wegweiser
  und Stand gemeinsam. Holt das Projekt einen neueren
  Stand auf Zuruf, **bleiben die Wegweiser auf ihrem
  Stand**; zitiert wird dann aus dem neuen
  Rechercheartefakt, und der Wächter meldet die
  Abweichung. Auffälligkeiten der Quelle, die für die
  Arbeit zählen, stehen im Normen-REC; die Wegweiser
  verweisen darauf.
- **Prüfung der Links:** `tools/wegweiser-quellen.py
  --pruefen` prüft Links und Anker aller Wegweiser auf
  die Lesefassungen sowie den Aufbau der Teilaufsätze
  (Rücklink, Eindeutigkeit der Dateinamen); Links
  werden im Projekt **nie umgeschrieben**. Die Liste
  aller zitierten Normen erzeugt `--liste` mechanisch
  (Grundlage für eine Gegenlesung durch ein anderes
  Modell oder einen Menschen). Aufruf: `tools/README.md`.
- **Eintragsformat:** Tabelle unten — Wegweiser
  (Wikilink) / Gegenstand / Hauptgesetze. Dieser Index
  ist der führende Ort der Liste; Einstieg für die Wahl
  von Rechtsweg und Ordnung ist
  [[Wegweiser-Verfahrensordnungen]].

---

**Bearbeitungsstand:** _(vom Agenten beim Merge und beim Upgrade
gepflegt)_

## Einträge

| Wegweiser | Gegenstand | Hauptgesetze |
|---|---|---|
| [[Wegweiser-Verfahrensordnungen]] | Einstieg: Rechtsweg, Ordnung, ordnungsübergreifende Regeln, Stand der Normtexte, was nicht im Paket ist | GVG, VwVfG, SGB X, AO |
| [[Wegweiser-VwGO]] | Verwaltungsgerichtliches Verfahren | VwGO, VwVfG, VwZG, VwVG |
| [[Wegweiser-SGG]] | Sozialgerichtliches Verfahren | SGG, SGB X |
| [[Wegweiser-FGO]] | Finanzgerichtliches Verfahren | FGO, AO |
| [[Wegweiser-ZPO]] | Zivilprozess, Mahnverfahren, Vollstreckung, Eilverfahren, selbständiges Beweisverfahren | ZPO, GVG, BGB |
| [[Wegweiser-ArbGG]] | Arbeitsgerichtliches Urteils- und Beschlussverfahren, Kündigungsschutzklage | ArbGG, KSchG, ZPO, BGB |
| [[Wegweiser-FamFG]] | Familiensachen, freiwillige Gerichtsbarkeit, Aufgebot, einstweilige Anordnung | FamFG, FamGKG, GNotKG |
| [[Wegweiser-Vorverfahren]] | Widerspruch und Einspruch vor der Klage, Sicht der Stelle | VwGO, SGG, AO, VwVfG, SGB X |
| [[Wegweiser-Bescheid-erlassen]] | Anwender als öffentliche Stelle: Anhörung, Begründung, Bestimmtheit, Belehrung, Bekanntgabe, Rücknahme und Widerruf, Vollstreckung eigener Bescheide (knapp, zum Erkennen und Abspalten) | VwVfG, SGB X, AO, VwVG, VwZG |
| [[Wegweiser-Auslands-und-EU-Bezug]] | Querschnitt: Warnsignale, Zustellungsfolgen, internationale Zuständigkeit, EU-Verfahren, Prozesskostensicherheit, Doppelbesteuerung (knapp, zum Erkennen und Abspalten) | ZPO, GVG, FamFG, VwGO, AO |
| [[Wegweiser-Bussgeld-und-Strafbefehl]] | Bußgeldbescheid und Strafbefehl als Betroffener | OWiG, StPO, StGB |
| [[Wegweiser-Strafrecht-Grundzuege]] | Rollen, Anzeige und Strafantrag, Verwarnung, Einstellung, Adhäsion, Delikte mit Verfahrensbezug (knapp, zum Erkennen und Abspalten) | StPO, StGB |
| [[Wegweiser-Insolvenz]] | Forderungsanmeldung als Gläubiger, Restschuldbefreiung in Grundzügen | InsO, GKG |
| [[Wegweiser-Streitbeilegung]] | Schlichtung, Verbraucherschlichtung, Mediation, Schiedsverfahren, Vergleich | EGZPO, VSBG, MediationsG, ZPO, BGB |
| [[Wegweiser-Verfassungsbeschwerde]] | Verfassungsbeschwerde zum Bundesverfassungsgericht | BVerfGG, GG |
| [[Wegweiser-Kosten]] | Gerichtskosten, Anwaltsvergütung, Zeugen und Sachverständige, Prozesskostenhilfe, Beratungshilfe | GKG, RVG, JVEG, BerHG |
| [[Wegweiser-Zustellung-und-Fristen]] | Zustellung, Bekanntgabe, Fristberechnung, Wiedereinsetzung, Verjährung | VwZG, ZPO, BGB |
| [[Wegweiser-Elektronischer-Rechtsverkehr]] | Nutzungspflichten, Dokumentanforderungen, elektronische Zustellung | ERVV, ZPO, VwGO, SGG, FGO |
| [[Wegweiser-Pruefraster]] | Prüfung jedes Begehrens: wer will was und darf er das, schon entschieden, erledigt, steht etwas entgegen, Reaktionsfrist; Befund und Freigabe-Vorbehalt | BGB, ZPO, VwVfG, SGB X, AO |

Normtexte: [[REC-9001 — Normen-Paket Stand 2026-11-05]]
(Lesefassungen mit Ankern, Prüfsummen, Auffälligkeiten
der Quelle).
