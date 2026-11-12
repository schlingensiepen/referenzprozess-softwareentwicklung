---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Schriftsatz

Dokumenttyp-Eintrag von SP-2: das **Produkt der Marke**
in Phase P9 (Kennung `schriftsatz`) — der Schriftsatz,
Einspruch, Widerspruch, Antrag oder das Schreiben, das
nach außen geht, als Versionskette in `output/`. Glied
der Kette ist der **Tag** auf der freigegebenen Fassung
(Freigabe per Tag, `Vorgehen.md` §4; [[Kettenpruefung]]
§Kette); der Text ist bis zur Einreichung Produkt, der
Knoten in [[Schriftsaetze]] entsteht erst mit der
Einreichung ([[Katalog-Schriftsaetze]]). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### schriftsatz

- **Zweck:** „für P10 Prüfen vor Versand“ — der Tag
  gibt die Fassung frei; das Paket darf gebaut und als
  Ganzes geprüft werden. Die Fassungs-Freigabe ist
  nicht die Versand-Freigabe ([[Vorgehen-SP-2]] §2).
- **Phase:** P9
- **Verbindlichkeit:** pflicht
- **Grad:** selbsttragend
- **Auslöser:** Standard; **Vorbedingung des Tags sind
  die inhaltlichen Prüfrunden** ([[Vorgehen-SP-2]] §4:
  Perspektiven, Faktenabgleich, Vertraulichkeit,
  unwidersprochener Vortrag, Primärquelle vor Zitat;
  Gegenperspektive, wo der Schriftsatz Strategisches
  trägt), endgültige lückenlose Anlagennummern nach dem
  Schema des Verfahrens und **kein `temp-`** im Text,
  Verzeichnis oder Paket (`SP2-TEMP`, FEHLER).
- **Quell-Register und Filter:** Gliederungs-Stand (oder
  Verzicht), Argumentations-Stand (ab Stufe 2),
  Verfahrens-Entscheidungen und Sachverhalts-Stand der
  Marke als freigegebene Grundlage; die Anlagen aus
  [[Anlagen]] mit Status `geplant` → `eingeführt` beim
  Tag; Absender, Stimme und Unterschrift aus
  [[Beteiligte]]; Formvorgaben aus dem Wegweiser der
  Ordnung und dem geprüften Versandweg der Stelle. Der
  Abschnitt `## Anlagen` (Anlagenverzeichnis) ist der
  Sammler, aus dem das Paket gebaut wird
  ([[Vorgehen-SP-2]] §6).
- **Pflichtfelder:** `type: schriftsatz`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  der Fassung: [[Einfrieren-und-Abloesen]] §Stand),
  `verfahren` (Slug des `case`), `empfaenger` (Stelle
  oder Beteiligter), `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); der
  Tag markiert die freigegebene **Fassung**; eine neue
  Fassung nach dem Tag (inhaltlicher Fehler in P10,
  Rückmeldung der Vertretung) ist die nächste Datei der
  Kette mit neuem Tag; ein Tag wird nie verschoben. Die
  getaggte Version eines Schriftsatzes heißt in SP-2
  durchgehend „Fassung“, nicht „Version“.
- **Pflicht ab Stufe:** 1; nicht verzichtbar (P9 ist in
  keiner Domäne verzichtbar).
- **Fassungen der Vertretung:** eingereichte oder
  entworfene Fassungen einer mandatierten Vertretung
  kommen als Eingangsdokument mit ihrer Kennung; die
  Schriftsatz-Zeile in [[Schriftsaetze]] verknüpft
  beide Zählungen ([[Vorgehen-SP-2]] §13).
- **Vertraulichkeit:** `offen` gegenüber dem Empfänger
  — ein Schriftsatz an die Stelle erreicht die
  Gegenseite; der Prüfplan prüft, dass kein Inhalt
  höherer Stufe enthalten ist ([[Vorgehen-SP-2]] §9).
- **Rückzug:** ein eingereichter Schriftsatz mit
  Prozesshandlungs-Charakter wird nie über den
  Basis-Rückzug zurückgenommen ([[Vorgehen-SP-2]]
  §12).
