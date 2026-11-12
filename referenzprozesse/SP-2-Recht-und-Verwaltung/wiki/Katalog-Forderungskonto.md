---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Forderungskonto

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`receivable-log` ([[Forderungskonto]]) mit Element-Typ
`receivable` (Forderung mit Buchungen). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### receivable-log

- **Zweck:** Register der Forderungen je Verfahren —
  Hauptforderung, Nebenforderungen, Zahlungen mit
  Tilgungsbestimmung, Anrechnung, Saldo, in beiden
  Richtungen
- **Pflichtfelder:** `type: receivable-log`
- **Präfix:** `—`
- **Datei:** `wiki/Forderungskonto.md`
- **Singleton** — optional ab Stufe 2, Vorauswahl
  deaktiviert (Steckbrief § Mitgebrachte Fassaden)
- **Pflicht ab:** — (optional ab Stufe 2)
- **Entfällt abgeleitet, wenn:** die Fassade inaktiv
  ist (`active: false`)

### receivable

- **Zweck:** eine Forderung mit Buchungstabelle —
  Grund, Betrag, Fälligkeit, Zahlungen,
  Tilgungsbestimmung, Anrechnung, Saldo (Detail-Knoten
  zum Eintrag im Register)
- **Klasse:** außerhalb (lebend; jede Buchung eine
  neue Zeile mit Datum und Nachweis, keine Korrektur)
- **Pflichtfelder:** `type: receivable`, `verfahren`
  (String-Slug des `case`-Knotens), `richtung`
  (`fuer-uns` — wir fordern | `gegen-uns` — von uns
  wird gefordert), `gegenueber` (String-Slug des
  [[Beteiligte]]-Eintrags), `hauptforderung` (Betrag
  mit Währung)
- **Empfohlen:** `saldo` (Betrag mit Stand
  `JJJJ-MM-TT`), `faelligkeit` (`JJJJ-MM-TT`)
- **Optional:** `titel` (String-Slug des Titels als
  Eingangsdokument), `verjaehrung` (String-Slug der
  Frist in [[Fristen]], aus dem Sachverhalt berechnet),
  `tatsachen` (Liste der TAT-IDs, [[Sachverhalt]]),
  `alias`
- **Beispielname:** `VF-001 Forderung Gegenseite Rueckzahlung Gebuehr.md`
- **Kanonizität:** Wahrheit bei Saldo und Stand liegt
  in `wiki/Forderungskonto.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Forderungskonto]] (Sektionen Forderung / Buchungen
  — Tabelle Datum · Betrag · Art · Tilgungsbestimmung ·
  Anrechnung auf · Nachweis / Saldo / Vermerke /
  Bezüge).
- **RP-20-Präzisierung** (gilt bei aktivem RP-20; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-20-Rechtsfall/`): Vollstreckung
  als Gläubiger oder Schuldner: Titel und Klausel,
  Maßnahmen, Drittschuldner, Sicherheitsleistung.
  Einzelheiten in `Vorgehen-RP-20.md` §3
  „Forderungskonto“ und §8.
- **RP-21-Präzisierung** (gilt bei aktivem RP-21; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`):
  Abgabenvollstreckung und Abwehr: Konto je
  Kassenzeichen, Tilgungsbestimmung je Zahlung, Nachweis
  aus Buchungsdaten, Säumnis und Zinsen. Einzelheiten in
  `Vorgehen-RP-21.md` §3 „Forderungskonto“ und §8.
