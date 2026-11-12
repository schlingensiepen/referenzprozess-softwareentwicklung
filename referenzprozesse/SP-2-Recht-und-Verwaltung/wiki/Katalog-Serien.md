---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Serien

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`series-log` ([[Serien]]) mit Element-Typ `series-unit`
(Einheit eines Massenverfahrens; Einheitstyp frei).
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert.

### series-log

- **Zweck:** Register der Einheiten eines
  Massenverfahrens — je Einheit Manifest,
  Freigabevermerk, Signatur- und Versandstatus; die
  Serie hat eine gemeinsame Marke
- **Pflichtfelder:** `type: series-log`
- **Präfix:** `—` (Schlüssel ist Serie + Einheit)
- **Datei:** `wiki/Serien.md`
- **Singleton** — optional, Aktivierung mit der
  Strang-Entscheidung „Serie“ (Steckbrief
  § Mitgebrachte Fassaden)
- **Pflicht ab:** — (optional)
- **Entfällt abgeleitet, wenn:** die Fassade inaktiv
  ist (`active: false`)

### series-unit

- **Zweck:** eine Einheit einer Serie — Grundstück,
  Bescheid, Vertrag, Verbraucher, Person, Zeitraum oder
  anderer Einheitstyp — mit ihren Varianten im
  Manifest, Freigabevermerk, Signatur- und
  Versandstatus (Detail-Knoten zum Eintrag im
  Register, Kategorie a mit Inline-Einträgen zulässig)
- **Klasse:** Element
- **Freeze ab:** angenommen (mit der Freigabe des
  Serien-Stands; Signatur- und Versandstatus sind
  Zustands-Achsen am eingefrorenen Element)
- **Sammelzustand:** offen
- **Pflichtfelder:** `type: series-unit`, `serie`
  (Marke der Serie, [[Zielmarken]]), `einheit`
  (Schlüssel der Einheit, in der Serie eindeutig),
  `einheitstyp` (frei: `grundstueck` | `bescheid` |
  `vertrag` | `verbraucher` | `person` | `zeitraum` |
  …), `status` (`offen` | `angenommen` | abgelöst;
  [[Einfrieren-und-Abloesen]] §Eintrittsregel),
  `status_date`, `datum`, `zielmarke`
- **Empfohlen:** `einheit_knoten` (String-Slug des
  Knotens der Einheit, etwa eines `flurstueck`,
  [[Flurstuecke]]), `verfahren` (String-Slug des
  `case`-Knotens, wenn die Einheit ein eigenes
  Aktenzeichen trägt)
- **Optional:** `signatur` (`offen` | `signiert`),
  `versand` (`offen` | `abgesandt` | `eingereicht`;
  Verweis auf die Einreichung, [[Einreichungen]]),
  `freigabevermerk` (Datum und Freigabe-Eintrag),
  `supersedes`, `superseded_by`, `alias`, `vertraulich`
- **Dokumenttypen:** [[Katalog-Serien-Stand]]
- **Beispielname:** `Serie Gebuehrenbescheide 2026 Einheit Flur 3 Flurstueck 12.md`
- **Kanonizität:** Wahrheit bei Status je Einheit liegt
  in `wiki/Serien.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Serien]] (Sektionen Einheit und Varianten /
  Freigabe / Signatur und Versand / Vermerke / Bezüge).
- **RP-21-Präzisierung** (gilt bei aktivem RP-21; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`):
  Einheitstyp je Massenverfahren mit der Bescheidkette
  als Datenquelle; Strategiewechsel als Ablösung mit
  Änderungskatalog und Freigabevermerk je Einheit.
  Einzelheiten in `Vorgehen-RP-21.md` §3 „Serien“ und
  §6.
