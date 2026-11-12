---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Strategie-Stand

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Strategie zu Marke M“ der Phase P1 (Kennung
`strategie-stand`), erstes Glied der Kette ab
Ausbaustufe 2 ([[Kettenpruefung]] §Kette), abgeleitet
aus dem Register [[Strategie]] ([[Katalog-Strategie]]).
Der Stand ist eingefroren ab Freigabe; die Strategie
selbst lebt im Register. Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### strategie-stand

- **Zweck:** „für P4 Argumentation aufbauen“ — die
  Argumentation darf Ziel, Grundlinie, Sperrliste und
  Eventualpläne als verlässliche Grundlage nehmen;
  zugleich **Pflicht-Eingabe jedes Prüfauftrags** vor
  Tag und Versandstand ([[Vorgehen-SP-2]] §4).
- **Phase:** P1
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; **Freigabe nur durch den
  Anwender** — nie durch den Agenten allein —, und nur
  mit einem Prüfbericht der Gegenperspektive ohne
  offenen Befund ([[Vorgehen-SP-2]] §4).
- **Quell-Register und Filter:** `strategy`- und
  `contingency`-Elemente der Marke aus [[Strategie]]
  (`STR`, `EVP`) mit Status `angenommen` oder an einer
  vorgelegten, noch nicht freigegebenen Version auch
  `offen` — im Kopf ausgewiesen, mit der Freigabe
  angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung); nicht verworfen, für die Marke
  nicht abgelöst; mit `zielmarke:` dieser oder einer
  früheren Marke. Kopiert werden Ziel, Grundlinie,
  Vorgehensplan, **Sperrliste**, Haltung und die
  Eventualpläne mit Auslöser, vorbereitetem Zug und
  Status; verwiesen wird auf das Verfahren
  ([[Verfahren]]), die Rolle ([[Beteiligte]]) und den
  Sachverhalt.
- **Pflichtfelder:** `type: strategie-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `vertraulich` (Standard `streng-intern`)
- **Ablage:** `output/`, versioniert (`_VV_TLA`); in
  einer Folge-Marke gilt der Stand meist als übernommen
  ([[Vorgehen-SP-2]] §2, Folge-Version); ein
  Strategiewechsel ist eine Ablösung mit neuer Freigabe.
- **Pflicht ab Stufe:** 2 — darunter entfällt das
  Glied abgeleitet.
- **Entfällt abgeleitet, wenn:** die Ausbaustufe in
  [[Aktivierter-Prozess]] unter 2 liegt oder die Fassade
  Strategie inaktiv ist.
- **Vertraulichkeit:** `streng-intern` als Standard —
  im Standard-Vorschlag auch nicht an die eigene
  Vertretung; der Stand erbt die höchste Stufe seiner
  Quellen ([[Vorgehen-SP-2]] §9). Dossier und
  Erläuterung übernehmen aus dem Strategie-Stand nur,
  was die Stufe des Empfängers erlaubt.
- **Nachweis:** der Prüfbericht der Gegenperspektive
  (`review-report`) zu dieser Version.
