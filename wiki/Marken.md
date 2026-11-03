---
type: internal-rule
---

# Marken

**Bearbeitungsstand:** 2026-10-25

Was eine Marke abschließt, wann eine neue beginnt, was
eine Frist an ihr ist und wie Marken in verschiedenen
Projektarten aussehen. Die Definition führt das
[[Glossar]] („Marke“); Registerformat, Zustände, die
Zeiger `current` und `in-progress` und die
Marken-Wechsel-Prozedur führt die Fassade
[[Zielmarken]] §Meta — dieser Knoten wiederholt sie
nicht. Jedes Prozess-Template ergänzt oder schärft
diesen Knoten in seinem eigenen Marken-Dokument
`Marken-<P>.md` (§Marken-Dokument je Prozess). Lesen
beim Init (erste Marke), vor einem Marken-Wechsel und
wenn unklar ist, ob ein Ergebnis eine eigene Marke
verdient.

## Was eine Marke ist

Die Marke ist in jeder Projektart der
Zwischenziel-Anker: ein benanntes Ergebnis, das nach
außen geht und freigegeben wird — das **Produkt** der
Marke ([[Glossar]] „Produkt“) —, kein Datum. Nach außen
(Auftraggeber, Gericht, Kunde, Verlag, Betreiber) sieht
man vom Projekt seine Marken und deren Produkte; nach
innen ordnen die Marken Stände, Freigaben, Tag und
Abschluss-Stand. Deshalb ist die Marke das Scharnier
zwischen Außen- und Innendarstellung des Projekts, und
deshalb führt jedes Projekt Zielmarken, mit und ohne
Prozess (Pflicht-Fassade, Wiki.md §3a). Der Begriff ist
„Marke“ beziehungsweise „Zielmarke“ (Eintrag im
Register), nicht „Meilenstein“: gearbeitet wird fließend
und parallel, ohne Zeitachse; mit SP-1 ist der
Meilenstein-Vorgang eine abgeschlossene Arbeits-Einheit,
keine Marke (Abgrenzung in `Marken-SP-1.md`).

## Was eine Marke abschließt

- **Das Produkt der Marke**, markiert durch den Tag der
  Implementierung in dem Repo, das es trägt — in jedem
  Projekt, auch ohne Code und ohne Prozess
  ([[Kettenpruefung]] §Kette, Tag als Glied P9).
- **Mit Prozess die Kette der Pflicht-Stände** zu dieser
  Marke, in der Freigabe-Ordnung des Prozesses
  ([[Kettenpruefung]] §Kette); welche Glieder das sind,
  sagen die Dokumenttyp-Einträge des Prozesses.
- **Den Abschluss-Stand** als Inhaltsliste der Marke
  ([[Katalog-Abschluss-Stand]]); der Anwender gibt ihn
  in der Wechsel-Prozedur frei, und mit dem Wechsel der
  Zeiger ist die Marke abgeschlossen und eingefroren
  ([[Zielmarken]] §Meta). Was unverändert aus der
  Vormarke weitergilt — Stände und, bei unverändertem
  Produkt, der Tag —, wird übernommen, nicht neu
  gebildet ([[Kettenpruefung]] §Kette, Übernahme).

## Wann eine neue Marke beginnt

Faustregeln für den Schnitt; die Entscheidung trifft
der Anwender:

- **Ein neues Ergebnis geht nach außen** — eine neue
  Version des Produkts, die ein Empfänger bekommt oder
  auf die sich jemand verlässt: neue Marke. Das gilt
  auch für die kleinste Änderung (eine Patch-Marke
  `2.0.1`), sobald sich Produkt oder Spezifikation
  gegenüber der abgeschlossenen Marke ändern; ein
  anderes Ausrollen bei unverändertem Produkt ist keine
  Marke, sondern ein weiterer Deploy-Stand (unten), und
  erneutes Ausrollen ohne Änderung ist Betrieb
  ([[Zielmarken]] §Meta, Freeze ab Abschluss und
  Nachtrag). Läuft
  die Folge-Marke schon, wird die Patch-Marke als
  **Zwischenmarke** vorgezogen und die laufende Marke
  so lange zurückgestellt; der Agent kündigt das an und
  fragt, ob die Zwischenmarke Vorgänger oder Sackgasse
  ist. Eine Zwischenmarke kann mehrere Korrekturen
  gleicher Art enthalten; eine Korrektur anderer Art
  folgt als eigene Zwischenmarke nach dem Abschluss der
  ersten, und die zurückgestellte Marke kehrt erst nach
  der letzten zurück ([[Zielmarken]] §Meta,
  Zwischenmarke).
- **Dasselbe Ergebnis in neuer Umgebung oder anders
  ausgerollt** — nichts in der Kette bis zum Tag ändert
  sich (dieselbe Software auf einem weiteren Zielsystem
  oder in einer Umgebung, die schon einen Deploy-Stand
  hat, mit anderer Konfiguration): kein neuer Schnitt,
  sondern ein weiterer Deploy-Stand — nach dem
  Abschluss ein Nachtrag an der abgeschlossenen Marke;
  je Umgebung gilt der jüngste ([[Zielmarken]] §Meta,
  Nachtrag). Ebenso ein Doku-Stand der Marke, der in
  der Doku-Abfrage „später“ erhielt und erst nach dem
  Wechsel freigegeben wird: eine Doku ändert weder
  Produkt noch Spezifikation — Nachtrag, keine Marke
  ([[Kettenpruefung]] §Kette, Doku-Abfrage).
- **Ein Ereignis beim Empfänger**, das das Projekt in
  eine neue Lage bringt (Revision eingelegt, Zuschlag
  erteilt, Bescheid ergangen): eine Ereignis-Marke
  („Nach der Revision“), deren Produkt die Antwort des
  Projekts darauf ist.
- **Kein Schnitt** für Arbeits-Einheiten ohne eigenes
  Ergebnis nach außen (eine Recherche, ein Refactoring,
  eine interne Abstimmung) — sie gehören zur laufenden
  Marke; ebenso keine Marke je Stand (ein Stand gehört
  zu einer Marke, nicht umgekehrt).
- **Benennung:** die Bezeichnung ist frei (Version,
  Ereignis, Etappe); Marke und Produkt-Version sind
  zwei Dinge („1.1“ gegenüber „v1.1.0“, [[Zielmarken]]
  §Meta, Abgrenzungen). Das Marken-Dokument des
  Prozesses nennt die übliche Form.

## Frist als Eigenschaft

Eine Marke kann eine Frist haben — den Abgabetermin
eines Schriftsatzes, den Einreichungsschluss, einen
zugesagten Liefertermin. Die Frist ist dann eine
Eigenschaft der Marke: sie wird in der Beschreibung der
Marke genannt und, wenn die Fassade [[Fristen]] aktiv
ist, dort mit Verfall geführt. Der
Kern der Marke bleibt das Ergebnis — verstreicht die
Frist, ist die Marke nicht erledigt und nicht verfallen,
sie steht noch aus ([[Zielmarken]] §Meta, Abgrenzungen:
Fristen haben Verfall, Marken nicht). Eine Marke ohne
Frist ist der Normalfall.

## Beispiele aus mehreren Projektarten

| Projektart | Typische Marke | Produkt der Marke |
|---|---|---|
| Softwaresystem | ein Release („1.0“, „1.1“); Hotfix als Patch-Marke | der Code, markiert durch den Tag (`v1.1.0`) |
| Rechtsfall | je Schriftsatz eine Marke („Klageschrift“, „Replik“) oder je Verfahrensstufe; Ereignis-Marke „Nach der Revision“ | der Schriftsatz bzw. die Kommentierung |
| Angebot | die abgegebene Angebotsfassung, danach jede Nachbesserung | das Angebotsdokument |
| Publikation | Einreichung, Revision, Endfassung | das Manuskript (die Kapitel) |
| Betrieb einer Infrastruktur | ein Änderungspaket („Wartungsfenster Q3“) | der umgesetzte Änderungsstand |
| Studie | Studiendesign, Abschluss der Feldphase, Ergebnisbericht | Design-Dokument, Datensatz, Bericht |

Die Spalte „Typische Marke“ zeigt, was ein
Marken-Dokument `Marken-<P>.md` der Projektart als
typische Marke nennen würde. Beim Init schlägt der Agent
die typische Marke des gewählten Prozesses aus dessen
Marken-Dokument als Bezeichnung der ersten Marke vor,
ohne Prozess „1.0“; die Entscheidung liegt beim
Anwender.

## Projekt ohne Prozess

Auch ohne Prozess führt das Projekt Zielmarken; der
Init legt die erste Marke an, Vorschlag „1.0“, die
Bezeichnung nennt der Anwender (Bootstrap der Fassade,
[[Init-Choreografie]] §Init-Fassaden-Auswahl). Zu jeder
Marke gehören der Tag, der ihr Produkt markiert, und
der Abschluss-Stand; Phasen-Pflicht-Stände und eine
Freigabe-Ordnung gibt es nicht ([[Kettenpruefung]]
§Kette, Projekt ohne Prozess). Der Marken-Wechsel läuft
wie mit Prozess ([[Zielmarken]] §Meta). Ist das Projekt
mit seiner Marke am Ziel (etwa die eingereichte
Klageschrift) und fehlt beim Wechsel eine künftige
Marke, fragt der Agent: Folge-Marke anlegen oder
Projekt ruht — dann trägt keine Marke `in-progress`,
und wer später weitermacht, legt zuerst eine Marke an
([[Zielmarken]] §Meta, Wechsel-Prozedur Schritt 1 und
Ruhe-Zeile).

## Marken-Dokument je Prozess

Jedes Prozess-Template bringt neben seinem Vorgehen ein
Marken-Dokument `Marken-<P>.md` mit (Typ
`process-procedure`, [[Katalog-process-procedure]];
`extends` wie `Vorgehen-<P>.md`). Es ergänzt oder
schärft den Knoten des zugrundeliegenden Prozesses —
und in letzter Instanz diesen —, ohne ihn zu
wiederholen: die typische Marke der Projektart, ihr
Produkt (Verweis auf die Zeile P9 der Phasentabelle),
der übliche Schnitt und die Benennung. Der Merge
kopiert es wie das Vorgehen ins Anwender-`wiki/`
(Wiki.md §11); ein geplanter Prozess trägt bis zu
seiner Ausarbeitung eine Vormerkung „Typische Marke“ im
Steckbrief.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Begriffe: [[Glossar]] „Marke“, „Produkt“,
  „Abschluss-Stand“, „Zwischenmarke“
- Register, Zustände, Zeiger, Wechsel-Prozedur,
  Zwischenmarke, Nachtrag: [[Zielmarken]] §Meta
- Tag, Kette, Übernahme, Projekt ohne Prozess:
  [[Kettenpruefung]] §Kette
- Abschluss-Stand: [[Katalog-Abschluss-Stand]]
- Freeze der Marke und Überholt-Regel:
  [[Einfrieren-und-Abloesen]]
- Erste Marke beim Init: [[Init-Choreografie]]
  §Init-Fassaden-Auswahl
