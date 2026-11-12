---
type: receivable-log
active: false   # optional ab Stufe 2; Aktivierung per Angebot des Agenten oder Anweisung des Anwenders
---

# Forderungskonto

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis) und ist
**optional ab Stufe 2**; der Agent bietet die
Aktivierung an, sobald eine Geldforderung mit Zahlungen,
Tilgungsbestimmung oder Anrechnung im Verfahren steht.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Forderungskonto.md`
  — bei Aktivierung von dort abarbeiten.
- **Typ:** `receivable-log` — Register der Forderungen
  (Element-Typ `receivable`): je Forderung
  Hauptforderung, Nebenforderungen, Zahlungen mit
  Tilgungsbestimmung, Anrechnung, Saldo — in beiden
  Richtungen (wir fordern, von uns wird gefordert).
  Singleton; optional ab Stufe 2.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Saldo und Stand
  liegt in dieser Fassade — Detail-Knoten spiegeln
  (Wiki.md §1.1a). Eine Forderung ist lebend (Klasse
  außerhalb): Zahlungen und Anrechnungen werden am
  Konto fortgeschrieben, jede Buchung mit Datum und
  Nachweis (Kontoauszug, Quittung als
  [[Eingangsdokumente]]). Ob eine Forderung besteht,
  ist Vortrag ([[Sachverhalt]]) und Argument
  ([[Argumente]]), nicht Sache des Kontos; eine
  Umbuchung oder geänderte Tilgungsbestimmung ist eine
  neue Buchungszeile mit Begründung, keine Korrektur.
- **Prüfung jedes Begehrens:** will jemand Geld von
  uns, läuft vor jeder Zahlung oder Zusage das Raster
  ([[Vorgehen-SP-2]] §Prüfen, [[Wegweiser-Pruefraster]]);
  das Konto hält danach die Fakten. Forderungen werden
  gegen rechts- und bestandskräftige Entscheidungen
  geprüft ([[Marken-SP-2]] §Nachlauf).
- **Eintragsformat:** `### <Gegenüber> — <Forderung>`
  mit Feldern Verfahren (VF-NNN) / Richtung
  (`fuer-uns` · `gegen-uns`) / Gegenüber
  ([[Beteiligte]]) / Hauptforderung (Betrag, Grund,
  Fälligkeit) / Nebenforderungen (Zinsen, Kosten) /
  Saldo (Stand `JJJJ-MM-TT`) / Titel (falls tituliert;
  Eingangsdokument) / Verjährung (Frist in
  [[Fristen]], aus dem Sachverhalt berechnet) /
  Angelegt (`JJJJ-MM-TT`) / Detail (Wikilink).
- **Detail-Knoten-Pflicht:** immer — die Buchungen sind
  eine Tabelle im Knoten.
- **`receivable`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Forderungskonto]] —
  lesen beim Anlegen eines `receivable`-Knotens.
  Sektionen: Forderung (Grund, Betrag, Fälligkeit) /
  Buchungen (Tabelle: Datum · Betrag · Art · Tilgungs-
  bestimmung · Anrechnung auf · Nachweis) / Saldo /
  Vermerke (append-only) / Bezüge (Fassaden-Eintrag
  [[Forderungskonto]], Verfahren, Tatsachen). Dateiname
  `<VF-NNN> Forderung <Gegenüber> <Kurzbezeichnung>.md`.
- **Pflege:** bei Aktivierung (Bestand aus der Akte),
  bei jeder Zahlung, Mahnung, Aufrechnung, Titulierung
  und im Nachlauf.

---

**Bearbeitungsstand:** _(vom Agenten bei Aktivierung und
laufend gepflegt)_

## Einträge

_(je Verfahren; offene Salden zuerst)_
