---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Argumentation-Stand

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Argumentation zu Marke M“ der Phase P4 (Kennung
`argumentation-stand`), abgeleitet aus dem Register
[[Argumente]] ([[Katalog-Argumente]]). Mit seiner
Freigabe werden die verwiesenen Argumente angenommen
und frieren ein; danach nur Ablösung. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### argumentation-stand

- **Zweck:** „für P8/P9“ — Gliederung und Schriftsatz
  dürfen die Linien mit ihren Belegen und Gegeneinwänden
  als verlässliche Grundlage nehmen.
- **Phase:** P4
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; Strategie- und
  Sachverhalts-Stand der Marke freigegeben
  ([[Kettenpruefung]] §Kette).
- **Quell-Register und Filter:** `argument`-Elemente
  (`ARG`) aus [[Argumente]] mit Status `angenommen`
  oder an einer vorgelegten, noch nicht freigegebenen
  Version auch `offen` — im Kopf ausgewiesen, mit der
  Freigabe angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung); nicht verworfen, für die Marke
  nicht abgelöst; mit `zielmarke:` dieser oder einer
  früheren Marke. Jede Linie trägt ihren
  **Pflicht-Gegeneinwand**; der Stand verweist nur auf
  angenommene Argumente. In einer Folge-Marke wird der
  Stand als **Delta** gebildet (neue und abgelöste
  Linien gegenüber der Vormarke). Fundstellen gelten
  als unverifiziert, bis sie an der Primärquelle geprüft
  sind ([[Vorgehen-SP-2]] §4).
- **Pflichtfelder:** `type: argumentation-stand`,
  `marke`, `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand), `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
- **Pflicht ab Stufe:** 2.
- **Entfällt abgeleitet, wenn:** die Ausbaustufe unter
  2 liegt oder die Fassade Argumente inaktiv ist.
- **Vertraulichkeit:** `intern` als Standard (die
  Gegeneinwände und verworfenen Linien erreichen die
  Gegenseite nicht); erbt die höchste Stufe seiner
  Quellen.
