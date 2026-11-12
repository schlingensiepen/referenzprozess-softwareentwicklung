---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Termin-Vorbereitung

Dokumenttyp-Eintrag von SP-2: das **Produkt der
Termin-Marke** in Phase P9 (Kennung
`termin-vorbereitung`) — die Vorbereitung eines Termins
(mündliche Verhandlung, Erörterungs-, Beweis-, Güte-,
Schlichtungs-, Mediationstermin, Schlussbesprechung,
Prüfungstermin, Vernehmung) als Versionskette in
`output/` mit **Tag** auf der freigegebenen Fassung;
geprüft wie ein Schriftsatz. Ein Glied, kein zweiter
Wiki-Stand daneben; die Gliederung davor ist der
Gliederungs-Stand (P8, Verzicht üblich). Die
**Einreichung** ist die Erklärung im Termin (P13, Kanal
`muendlich-termin`), das **Protokoll** ihr Nachweis
([[Marken-SP-2]] §7). Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### termin-vorbereitung

- **Zweck:** „für P10 Prüfen vor Versand“ — der Tag gibt
  die Fassung frei, mit der der Anwender oder die
  Vertretung in den Termin geht; das Paket (Unterlagen,
  Anträge zu Protokoll) darf gebaut und geprüft werden.
- **Phase:** P9
- **Verbindlichkeit:** pflicht
- **Grad:** selbsttragend
- **Auslöser:** Standard; Ladung als Ereignis-Marke
  eingegangen und Termin-Marke angelegt; Vorbedingung
  des Tags sind die inhaltlichen Prüfrunden und die
  Gegenperspektive ([[Vorgehen-SP-2]] §4); der
  **Vergleichsrahmen** ist vom Anwender freigegeben;
  kein `temp-`.
- **Quell-Register und Filter:** Strategie- und
  Argumentations-Stand (ab Stufe 2),
  Verfahrens-Entscheidungen der Marke; die Anträge in
  der Fassung, die zu Protokoll gegeben wird;
  Erklärungen, Fragen an Zeugen und Sachverständige,
  Vergleichsrahmen (Unter- und Obergrenze, Bedingungen),
  Unterlagen aus [[Anlagen]]; Rolle, Stimme und
  Vertretung aus [[Beteiligte]]; die Eventualpläne für
  den Termin ([[Strategie]]); der Terminsablauf der
  Ordnung aus dem Wegweiser.
- **Pflichtfelder:** `type: termin-vorbereitung`,
  `marke`, `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum der Fassung: [[Einfrieren-und-Abloesen]]
  §Stand), `verfahren`, `termin` (Datum und Stelle des
  Termins), `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); der
  Tag markiert die freigegebene Fassung; eine
  Terminsverlegung ändert die Fassung nicht (neuer
  Termin, ggf. neue Fassung).
- **Pflicht ab Stufe:** 1 (nur Termin-Marke).
- **Entfällt abgeleitet, wenn:** die Marke keine
  Termin-Marke ist.
- **Vertraulichkeit:** `intern` — Vergleichsrahmen und
  Eventualpläne gehen nicht an die Gegenseite; was zu
  Protokoll gegeben wird, ist `offen`; der Prüfplan
  trennt beides.
