---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Verfahrens-Stand

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Verfahren zu Marke M“ der Phase P5 (Kennung
`verfahrens-stand`), abgeleitet aus dem Register
[[Verfahren]] ([[Katalog-Verfahren]]) und den
Strang-Entscheidungen. Er darf **dünn** sein — bei
kleinen Fällen eine halbe Seite. Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### verfahrens-stand

- **Zweck:** „für P6/P7“ — Strang-Start, Mandat und die
  Wahl von Rechtsbehelf, Stelle, Vertretung und Kanal
  dürfen den Schnitt des Verfahrens als verlässliche
  Grundlage nehmen.
- **Phase:** P5
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; mit zwei
  **Pflicht-Prüfpunkten**, die der Stand ausweist:
  „Gilt ein Fachgesetz mit eigener Frist?“ (dann
  Projekt-REC nachladen, [[Vorgehen-SP-2]] §10) und
  „Auslandsbezug?“ (bei Ja Wegweiser Auslands- und
  EU-Bezug laden, Abspalten prüfen); Freigabe nur mit
  einem Prüfbericht der Gegenperspektive ohne offenen
  Befund ([[Vorgehen-SP-2]] §4).
- **Quell-Register und Filter:** die `case`-Einträge der
  Marke aus [[Verfahren]] — Stelle, Aktenzeichen,
  Instanz, Vorgänger, Gegenüber mit Stellung, Rolle,
  Vertretung und Vertretungszwang, Verfahrensgrundsatz,
  Nummerierungsschema der Anlagen, Status, Strang-Form
  —; die Entscheidungen mit `decision_type: strang` und
  der Stufenwechsel aus [[Entscheidungen]]; die
  Beteiligten ([[Beteiligte]]) werden verwiesen.
  Kopiert werden Schnitt und Strang-Form (welche
  Stränge, welche Form der Entscheidungsmatrix,
  [[Marken-SP-2]] §9), die beiden Prüfpunkte mit
  Antwort.
- **Pflichtfelder:** `type: verfahrens-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); in
  einer Folge-Marke meist übernommen; ein neuer Strang
  oder ein Stufenwechsel überholt den Stand.
- **Pflicht ab Stufe:** 1 (darf dünn sein).
- **Entfällt abgeleitet, wenn:** die Fassade Verfahren
  inaktiv ist (in SP-2 nie — sie ist Pflicht ab
  Stufe 1).
- **Vertraulichkeit:** `intern` als Standard.
