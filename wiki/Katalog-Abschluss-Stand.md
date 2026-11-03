---
type: catalog-entry
art: dokumenttyp
---

# Katalog-Abschluss-Stand

Dokumenttyp-Eintrag: der Pflicht-Stand beim Abschluss
einer Marke (Kennung `abschluss-stand`; Begriff im
[[Glossar]]). Mit einem Prozess schließt er die Kette
der Pflicht-Stände zu einer Marke ab
([[Kettenpruefung]] §Kette; ohne Prozess: ebenda,
Projekt ohne Prozess) und ist die Grundlage der
Marken-Wechsel-Prozedur ([[Zielmarken]]). Der Vorgang
heißt Marken-Abschluss, das Dokument Abschluss-Stand
(„der Abschluss-Stand der Marke 2.0“).

### abschluss-stand

- **Zweck:** „für den Marken-Abschluss“ — ein Stand
  über mehrere Register, der alle freigegebenen
  Stände der Kette dieser Marke mit ihren Freigaben
  listet (Konzept, Anforderungen,
  Funktionsbeschreibung, Architektur, Übergaben je
  Komponente, Technologie-Entscheidungen,
  Spezifikation, Tag der Implementierung, Testplan
  und Testbericht, Entwickler-Doku, Benutzer-Doku,
  Deploy-Stände und Betriebs-Anleitungen je Umgebung —
  soweit das Repo
  das Glied führt oder ein Vertreter an seiner Stelle
  steht: [[Kettenpruefung]] §Fehlende und vertretene
  Glieder; ein Doku-Glied mit „später“ aus der
  Doku-Abfrage steht als offener Punkt des
  Vollständigkeits-Scans und nach dem Wechsel als
  Nachtrag, ebenda §Kette). Aus der Vormarke
  übernommene Stände —
  und der übernommene Tag, wenn das Produkt seit ihm
  unverändert ist, und ein Doku-Stand mit „gar nicht
  (Übernahme)“ — stehen darin mit dem Vermerk
  „übernommen aus <Vormarke>“; mit der Freigabe des
  Abschluss-Stands ist die Übernahme bestätigt
  ([[Kettenpruefung]] §Kette, Übernahme aus der
  Vormarke sowie Übernahme des Tags und der
  Lieferung). Für Testplan-Stand, Deploy-Stände und
  Betriebs-Anleitungen gibt es den Vermerk nur, wenn
  die Marke keinen eigenen Tag hat: mit eigenem Tag
  führt der Abschluss-Stand ihre Folge-Versionen als
  eigene Stände mit eigener Freigabe — eine Zeile
  „übernommen aus <Vormarke>“ für einen solchen Stand
  meldet der Lint als Fehler, an einer abgeschlossenen
  Marke als Hinweis (ebenda, Folge-Marke mit eigenem
  Tag). Bei einer Komponente listet der
  Abschluss-Stand die Glieder, die sie führt (bis
  P11; P12, P13 und P15 nur mit eigener Zielumgebung —
  [[Kettenpruefung]] §Fehlende und vertretene
  Glieder), und geht mit dem Marken-Abschluss an den
  Koordinator. In einem Projekt ohne Prozess listet
  der Abschluss-Stand den Tag der Marke, der ihr
  Produkt markiert — als Zeile im Text, die das Wort
  „Tag“ (oder „Implementierung“) und den Tag-Namen
  nennt; der Tag steht zusätzlich in `herkunft`
  ([[Einfrieren-und-Abloesen]] §Stand), die Textzeile
  ist, was der Lint ohne Prozess liest (Hinweis, wenn
  sie fehlt) — ohne eigene Tag-Freigabe; mit
  der Freigabe des Abschluss-Stands ist der Tag
  bestätigt, und wird er vor dem Marken-Wechsel noch
  korrigiert, führt der Abschluss-Stand den neuen Tag
  als neue Version derselben Ketten-ID — vor seiner
  Freigabe ohne abzulösende Freigabe, nach ihr erneut
  freigegeben ([[Kettenpruefung]] §Kette, Tag-Korrektur
  ohne Prozess). Abgeschlossen ist die Marke erst mit dem
  Wechsel ([[Zielmarken]] §Meta); wird der Tag danach
  bei unverändertem Inhalt der Pfade des Produkts
  korrigiert — mit wie ohne Prozess —, bleibt der
  Abschluss-Stand eingefroren,
  und der neue Tag-Name steht im Nachtrag „Tag
  korrigiert“ am Marken-Eintrag (mit Prozess samt der
  neuen Tag-Freigabe; die alte bleibt stehen) — Lint und
  Vollständigkeits-Scan lesen den Tag der Marke aus
  dem jüngsten Nachtrag ([[Zielmarken]] §Meta,
  Nachtrag). Der
  Vollständigkeits-Scan hat damit ein nachschlagbares
  Ergebnis.
- **Phase:** Marken-Abschluss
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** eigener Auslöser: die
  Marken-Wechsel-Prozedur ([[Zielmarken]] §Meta): nach dem
  Vollständigkeits-Scan der abzuschließenden Marke;
  Freigabe durch den Anwender in dieser Prozedur
  (Prüfung am Abschluss-Stand: [[Kettenpruefung]]
  §Regel).
- **Quell-Register und Filter:** der Marken-Eintrag
  der Marke in [[Zielmarken]] (beim Koordinator samt
  Abschnitt „Zuliefernde Komponenten“ mit Verweisen
  auf Abschluss-Stand und Tag jeder Komponente); die
  Freigabe-Einträge in [[Entscheidungen]] zu dieser
  Marke; die freigegebenen Stände der Kette mit
  Version. Nachtrag nach dem Abschluss:
  [[Zielmarken]] §Meta (Nachtrag) — lesen, wenn nach
  dem Abschluss ein Stand hinzukommt. Erhält ein
  Deploy-Stand, den der Abschluss-Stand in `herkunft`
  nennt, im Nachtrag eine neue Version, oder wird ein
  Doku-Stand mit „später“ erst im Nachtrag freigegeben,
  bleibt der
  Abschluss-Stand eingefroren und ist dadurch nicht
  überholt — Lint und Vollständigkeits-Scan lesen den
  Verweis auf die jüngste Version bzw. Abschluss-Stand
  und Nachtrag zusammen
  ([[Einfrieren-und-Abloesen]] §Überholt-Regel).
- **Pflichtfelder:** `type: abschluss-stand`, `marke`,
  `datum` (seit 2.0), `zweck`, `herkunft` (Herkunftszeile:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
- **Ableitung nach außen:** [[Katalog-Release-Notes]]
  (selbsttragend, optional).
