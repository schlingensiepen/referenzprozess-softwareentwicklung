---
type: filing-log
# active: false   # bei Deaktivierung (Default ist active: true; Pflicht ab Stufe 1)
---

# Einreichungen

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis).

## Meta

- **Typ:** `filing-log` — Register über die
  Versandstand-Ordner: je Einreichung Fassung (Tag),
  Empfänger, Kanal, Zeitpunkt, **Nachweis, Zugang,
  Prüfsumme** und Erwartung (Element-Typ `filing`;
  sprechender Slug, kein Präfix). Singleton; **Pflicht
  ab Stufe 1**. **Maßgeblich ist der Zugang beim
  Empfänger, nicht die Absendung.**
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Zugang und Nachweis
  liegt in dieser Fassade — Detail-Knoten spiegeln
  (Wiki.md §1.1a). Eine Einreichung ist ein
  **Nachweis** (Freeze ab Anlage): Nachweis-Datei,
  Zugang und Zugangsart werden **nachgetragen**, sobald
  sie vorliegen (der Nachweis wächst nur,
  [[Einfrieren-und-Abloesen]] §Nachweis); alles andere
  bleibt, wie es bei der Absendung war. Eine erneute
  Sendung ist eine neue Einreichung.
- **Verhältnis zum Versandstand:** der
  Versandstand-Ordner unter `outgoing/` (Outgoing.md)
  trägt Anschreiben, Paket, `review` und `nachweis/`;
  diese Fassade ist das Register darüber — je Empfänger
  eine Einreichung, bei Teilsendungen (Fax-Grenze) je
  Teil ein Nachweis. **„Eingereicht“ ist nur die
  Fassung mit Einreichungsnachweis**; erst mit dem
  Nachweis wechselt die Zeile des Schriftsatzes in
  [[Schriftsaetze]] auf `eingereicht`.
- **Prüfsumme:** die Prüfsumme des Pakets aus dem
  Versandstand (Feld `pruefsumme` je Anlage, Basis);
  weicht der Nachweis vom freigegebenen Paket ab,
  meldet der Wächter ([[Vorgehen-SP-2]] §Wächter). Ein
  `temp-` im Paket blockiert den Versandstand
  ([[Anlagen]]).
- **Erwartung je Einreichung:** jede Einreichung legt
  automatisch eine Erwartung an — eine Frist
  `richtung: für-uns`, `entstehung: erwartung` in
  [[Fristen]] — mit einem Standard je Stelle (aus dem
  Versandweg der Stelle, [[Organisationen]]; vom
  Anwender änderbar); der Eingang setzt sie auf
  `erfuellt`, bei Ablauf schlägt der Agent
  Sachstandsanfrage oder Erinnerung vor
  ([[Vorgehen-SP-2]] §Fristen „Immer ein Wecker“). Der
  häufigste Wecker ist „Wir erwarten Rückmeldung von
  <Stelle>“.
- **Kanäle und Zugangsarten:** Kanal aus dem geprüften
  Versandweg der Stelle ([[Organisationen]];
  Kanal-Grundbestand in Outgoing.md); eine Erklärung im
  Termin ist eine Einreichung mit Kanal
  `muendlich-termin`, ihr Nachweis ist das Protokoll
  ([[Marken-SP-2]] §Termin). Zugangsart: Eingangs-
  bestätigung, Empfangsbekenntnis, Sendebericht,
  Quittung des Portals, Protokoll, Vermerk. **Versendet
  wird immer durch einen Menschen**; der Agent bucht.
- **Status** (`abgesandt` · `eingereicht` ·
  `gescheitert`): `eingereicht` mit Nachweis und
  Zugang; `gescheitert`, wenn der Zugang nicht
  nachweisbar ist (die erneute Sendung ist eine neue
  Einreichung, die gescheiterte bleibt stehen).
- **Eintragsformat:** `### JJJJ-MM-TT —
  <Schriftsatz> an <Empfänger> (<Kanal>)` mit Feldern
  Verfahren (VF-NNN) / Schriftsatz ([[Schriftsaetze]]) /
  Fassung (Tag, [[Zielmarken]]) / Empfänger
  ([[Organisationen]]- oder [[Beteiligte]]-Eintrag) /
  Kanal / Zeitpunkt (Absendung, Datum und Uhrzeit) /
  Versandstand (Pfad unter `outgoing/`) / Prüfsumme
  (Paket) / Nachweis (Datei in `nachweis/`;
  nachgetragen) / Zugang (Datum und Zugangsart;
  nachgetragen) / Erwartung (Frist `für-uns` in
  [[Fristen]]) / Status / Angelegt (`JJJJ-MM-TT`) /
  Detail (Wikilink, nur wenn Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** bei Teilsendungen,
  Zustellungs-Problemen oder Vermerken; sonst
  Inline-Eintrag.
- **`filing`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Einreichungen]] — lesen
  beim Anlegen eines `filing`-Knotens. Sektionen:
  Sendung (Fassung, Paket, Kanal) / Nachweis und Zugang
  (Verlauf mit Datum) / Vermerke (append-only) /
  Bezüge (Fassaden-Eintrag [[Einreichungen]],
  Schriftsatz, Versandstand). Dateiname
  `JJJJ-MM-TT Einreichung <Schriftsatz> an <Empfänger>.md`.
- **Pflege:** mit jedem Versandstand (Zeile
  `abgesandt`), beim Eintreffen des Nachweises
  (Nachtrag, Status `eingereicht`), beim Ablauf der
  Erwartung.

---

**Bearbeitungsstand:** _(vom Agenten beim Init und laufend
gepflegt)_

## Einträge

_(chronologisch nach Absendung; offene Zugänge zuerst
sichtbar durch Status `abgesandt`)_
