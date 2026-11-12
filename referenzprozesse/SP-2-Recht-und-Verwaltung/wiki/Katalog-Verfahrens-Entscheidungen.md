---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Verfahrens-Entscheidungen

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Verfahrens-Entscheidungen zu Marke M“ der Phase P7
(Kennung `verfahrens-entscheidungen`), abgeleitet aus
dem Basis-Register [[Entscheidungen]] — den DEC mit
`decision_type: verfahren` ([[Katalog-Entscheidungen]]
SP-2-Präzisierung) — nach dem Vorbild der
Technologie-Entscheidungen eines Entwicklungsprozesses.
Auf Stufe 1 dünn, mindestens mit dem
**Pflichtabschnitt Begleitanträge**; voll ab Stufe 2.
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert.

### verfahrens-entscheidungen

- **Zweck:** „für P8 Schriftsatz gliedern“ — Gliederung
  und Schriftsatz dürfen Rechtsbehelf, Stelle,
  Vertretung, Kanal und die erwogenen Begleitanträge als
  entschieden nehmen.
- **Phase:** P7
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; bei jedem
  verfahrensgestaltenden Schritt — jeder eingehenden
  belastenden Entscheidung und jedem eigenen
  verfahrensgestaltenden Schriftsatz, auf Angriffs- wie
  Verteidigungsseite ([[Vorgehen-SP-2]] §4,
  Begleitanträge); Freigabe nur mit einem Prüfbericht
  der Gegenperspektive ohne offenen Befund.
- **Quell-Register und Filter:** DEC mit
  `decision_type: verfahren` aus [[Entscheidungen]]
  (Rechtsbehelf, Gericht bzw. Stelle, Vertretung,
  Kanal; Heilung abwarten oder angreifen) mit Status
  `angenommen`, mit `zielmarke:` dieser Marke oder
  einer früheren, soweit sie für die Marke gelten;
  dazu der Pflichtabschnitt **Begleitanträge** als
  offene Liste mit Grundbestand aus der Checkliste des
  Wegweisers der Ordnung ([[Wegweiser]]) — zu jedem
  Punkt „erwogen: ja/nein, Begründung“; verwiesen wird
  auf das Prüfraster-Ergebnis der eingehenden
  Entscheidung ([[Eingangsdokumente]]) und die
  Eventualpläne ([[Strategie]]).
- **Pflichtfelder:** `type: verfahrens-entscheidungen`,
  `marke`, `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand), `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); je
  Marke neu gebildet (die Entscheidungen einer
  Folge-Marke sind neue Entscheidungen).
- **Pflicht ab Stufe:** 1 — dünn, mindestens der
  Pflichtabschnitt Begleitanträge; voll ab 2.
- **Entfällt abgeleitet, wenn:** nie — das Glied ist in
  jeder Stufe Pflicht.
- **Wächter:** ein verfahrensgestaltender Schritt ohne
  Abschnitt Begleitanträge ist ein Befund
  (`SP2-BEGLEIT`, [[Vorgehen-SP-2]] §8).
- **Vertraulichkeit:** `intern` als Standard; die
  Begründung „erwogen: nein“ erreicht die Gegenseite
  nicht.
