---
type: series-log
active: false   # optional; Aktivierung mit der Strang-Entscheidung „Serie“
---

# Serien

**Ich bin neu in SP-2.** Diese Fassade entsteht mit der
Wahl von SP-2 (Wiki.md §11 Prozess-Teil-Wikis) und ist
**optional**: sie wird aktiv, wenn der Anwender einen
Strang als **Serie** führt (Massenverfahren mit einer
gemeinsamen Marke, [[Marken-SP-2]] §Stränge).

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/Serien.md`
  — bei Aktivierung von dort abarbeiten.
- **Typ:** `series-log` — Register der Einheiten eines
  Massenverfahrens (Element-Typ `series-unit`): je
  Einheit Manifest, Freigabevermerk, Signatur- und
  Versandstatus. Der **Einheitstyp ist frei**
  (Grundstück, Bescheid, Vertrag, Verbraucher, Person,
  Zeitraum); eine Einheit mit eigenem Typ verweist auf
  ihren Knoten (etwa [[Flurstuecke]]). Singleton;
  optional.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Status je Einheit
  liegt in dieser Fassade — Detail-Knoten spiegeln
  (Wiki.md §1.1a). Eine Einheit ist ein **Element**
  (Sammelzustand `offen`, Freeze ab `angenommen` mit
  der Freigabe des Serien-Stands,
  [[Katalog-Serien-Stand]]); danach nur Ablösung
  ([[Einfrieren-und-Abloesen]]). Signatur- und
  Versandstatus sind Status-Achsen am eingefrorenen
  Element.
- **Serie und Marke:** eine Serie hat **eine
  gemeinsame Marke**; ihr Produkt ist der
  Serien-Schriftsatz mit Manifest, das je Einheit die
  Varianten nennt (Adressat, Aktenzeichen, Beträge,
  Anlagen). Der Serien-Stand ([[Katalog-Serien-Stand]])
  weist die Einheiten mit Freigabevermerk aus; je
  Einheit eine Einreichung ([[Einreichungen]]) mit
  eigenem Nachweis und eigener Erwartung.
- **Eintragsformat:** `### <Serie> — <Einheit>` mit
  Feldern Serie (Marke der Serie, [[Zielmarken]]) /
  Einheit (Schlüssel; Wikilink auf den Einheits-Knoten,
  falls vorhanden) / Einheitstyp / Verfahren (VF-NNN,
  falls je Einheit ein eigenes Aktenzeichen) /
  Manifest (Varianten der Einheit) / Freigabevermerk
  (Datum, Freigabe-Eintrag) / Signatur (`offen` ·
  `signiert`) / Versand (`offen` · `abgesandt` ·
  `eingereicht`; Verweis auf [[Einreichungen]]) /
  Status (`offen` / `angenommen`) / Angelegt
  (`JJJJ-MM-TT`) / Zielmarke / Detail (Wikilink, nur
  wenn Detail-Knoten existiert).
- **Detail-Knoten-Pflicht:** sobald eine Einheit vom
  Manifest abweicht oder Vermerke anfallen; sonst
  Inline-Eintrag.
- **`series-unit`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Serien]] — lesen beim
  Anlegen eines `series-unit`-Knotens. Sektionen:
  Einheit und Varianten / Freigabe / Signatur und
  Versand (Verlauf) / Vermerke (append-only) / Bezüge
  (Fassaden-Eintrag [[Serien]], Serie). Dateiname
  `<Serie> Einheit <Schlüssel>.md`.
- **Pflege:** mit der Strang-Entscheidung „Serie“
  (Einheiten anlegen), beim Serien-Stand, je Signatur
  und Versand.

---

**Bearbeitungsstand:** _(vom Agenten bei Aktivierung und
laufend gepflegt)_

## Einträge

_(je Serie nach Einheit; offene Signaturen und
Versände zuerst)_
