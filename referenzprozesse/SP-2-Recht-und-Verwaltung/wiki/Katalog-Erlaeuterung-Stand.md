---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Erlaeuterung-Stand

Dokumenttyp-Eintrag von SP-2: der selbsttragende
Pflicht-Stand „Erläuterung zu Marke M“ der Phase P12
(Kennung `erlaeuterung-stand`) — für Personen ohne
Wiki-Zugang, die vom Verfahren betroffen sind (Mandant,
Familienangehörige, Mitgesellschafter, Kostenträger,
Mitglieder eines Verbands): was geschieht, was es
bedeutet, was von ihnen erwartet wird. Entsteht nach
der Doku-Abfrage; bei den meisten Schriftsatz-Marken
entfällt er. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### erlaeuterung-stand

- **Zweck:** „für P13 Einreichen“ — die Betroffenen
  sind unterrichtet, bevor der Schriftsatz hinausgeht;
  ihre Mitwirkung (Unterschrift, Vollmacht, Unterlagen)
  ist eingeholt.
- **Phase:** P12
- **Verbindlichkeit:** pflicht
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: die **Doku-Abfrage**
  je Marke, sobald der Tag gesetzt ist
  ([[Kettenpruefung]] §Kette, Doku-Glieder) — Zeile
  Erläuterung mit Zeitpunkt und Form; Empfehlung
  „jetzt“, wenn Betroffene mitwirken müssen oder eine
  Entscheidung sie unmittelbar trifft. Freigabe eines
  Strategie-Abschnitts nur mit einem Prüfbericht der
  Gegenperspektive ohne offenen Befund.
- **Quell-Register und Filter:** die getaggte Fassung
  und die freigegebenen Quell-Stände der Marke in
  verständlicher Sprache zusammengefasst; die Fristen,
  die die Betroffenen angehen ([[Fristen]]); die
  Rolle der Betroffenen aus [[Beteiligte]]; alles
  **kopiert**, gefiltert nach der Vertraulichkeitsstufe
  der Empfänger ([[Vorgehen-SP-2]] §9).
  Verständnis-Check M6 (`Reviewmuster.md`) vor der
  Freigabe.
- **Pflichtfelder:** `type: erlaeuterung-stand`,
  `marke`, `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand), `empfaenger`, `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); je
  Empfängerkreis eine Ketten-ID; in einer Folge-Marke
  mit eigenem Tag als Folge-Version fortgeführt.
- **Pflicht ab Stufe:** 1, nach Doku-Abfrage.
- **Entfällt abgeleitet, wenn:** kein Beteiligter ohne
  Wiki-Zugang betroffen ist (Register [[Beteiligte]]
  nennt nur den Anwender); sonst entscheidet die
  Doku-Abfrage.
- **Vertraulichkeit:** die Stufe des Empfängerkreises;
  Prüfpunkt vor der Freigabe (`SP2-VERTRAULICH`).
