---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Sachverhalt-Stand

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Sachverhalt zu Marke M“ der Phase P3 (Kennung
`sachverhalt-stand`), abgeleitet aus dem Register
[[Sachverhalt]] ([[Katalog-Sachverhalt]]) und den
Belegen über die `evidence`-Relation. Eingefroren ab
Freigabe. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### sachverhalt-stand

- **Zweck:** „für P4 Argumentation aufbauen“ — die
  Argumentation darf die Tatsachen mit ihrer Stellung
  als belegt nehmen.
- **Phase:** P3
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; Freigabe, sobald jede fremde
  Tatsachenbehauptung der Marke eine Stellung trägt
  ([[Vorgehen-SP-2]] §4, unwidersprochener Vortrag).
- **Quell-Register und Filter:** `assertion`-Elemente
  (`TAT`) aus [[Sachverhalt]] mit Status `angenommen`
  oder an einer vorgelegten, noch nicht freigegebenen
  Version auch `offen` — im Kopf ausgewiesen, mit der
  Freigabe angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung); nicht verworfen, für die Marke
  nicht abgelöst; mit `zielmarke:` dieser oder einer
  früheren Marke. Je Tatsache Herkunft (eigene,
  Gegenseite, andere Beteiligte, von Amts wegen
  ermittelt) und **Stellung** nach dem
  Verfahrensgrundsatz am `case` (offen, unstreitig bzw.
  zugestanden, bestritten, mit Nichtwissen bestritten,
  von Amts wegen zu ermitteln, nicht
  entscheidungserheblich, bewiesen, widerlegt); Belege
  über `evidence` auf [[Anlagen]], [[Eingangsdokumente]]
  und [[Beweisangebote]]; die Zeitleiste aus
  [[Chronologie]] wird verwiesen.
- **Pflichtfelder:** `type: sachverhalt-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); in
  einer Folge-Marke meist übernommen; neue Tatsachen
  (neuer Eingang) überholen den Stand und führen zu
  einer neuen Version mit eigener Freigabe.
- **Pflicht ab Stufe:** 2.
- **Entfällt abgeleitet, wenn:** die Ausbaustufe unter
  2 liegt oder die Fassade Sachverhalt inaktiv ist.
- **Vertraulichkeit:** erbt die höchste Stufe seiner
  Quellen; Tatsachen der Gegenseite sind in der Regel
  `offen`, eigene Bewertungen `intern`.
