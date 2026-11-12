---
type: input-document-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Eingangsdokumente

## Meta

- **Typ:** `input-document-log` — Register aller
  Eingangsdokumente des Projekts: zitierbare
  Originaldokumente aus `raw/` / `input/`. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Dokument-Status
  liegt in dieser Fassade — Detail-Knoten (Typ
  `document`) spiegeln (Wiki.md §1.1a).
- **Pflege:** automatisch beim Ingest (Wiki.md §2.1) —
  Register-Eintrag pro neuem document-Knoten, keine
  Rückfrage.
- **Eintragsformat:**
  `### YYYY-MM-DD — <Kurzbezeichnung> (<document_type>)`
  mit Feldern Aktenzeichen ([[Aktenzeichen]]-Bezug,
  falls vorhanden) / Absender bzw. Quelle
  ([[Ansprechpartner]]-Bezug, falls vorhanden) /
  Eingangsort (aus `## Eingangsorte`, falls nicht der
  Projektordner) / Status (`eingelesen`, sobald der
  Ingest den Dokument-Knoten angelegt hat; davor
  `eingegangen`) / Detail (Wikilink auf den
  Dokument-Knoten). Erfüllt ein Eingang eine erwartete
  Frist `für-uns` ([[Fristen]]), setzt der Ingest sie
  im selben Zug auf `erfuellt` mit Link auf den
  Dokument-Knoten. Chronologische Liste, optional
  gruppiert nach `document_type` (z.B. `brief`,
  `schreiben`, `protocol`, …). Prozesse ergänzen
  Pflichtfelder je Eintrag (etwa Zugangsdatum,
  Zustellart, ausgelöste Frist) in ihrem
  Katalog-Eintrag.
- **Eingangsorte:** Die Sektion `## Eingangsorte`
  registriert, woher Eingänge kommen — in drei
  Schichten, erfragt beim Init
  ([[Init-Choreografie]] §Init-Fragen, Baustein
  Eingangsorte): (a) die **Projektordner** `raw/`,
  `mails/` und weitere Eingangsordner, immer; (b)
  **weitere Eingangsorte** (Postfach, Portal,
  Datenraum), je Ort Name, Zugriffsweg, Modus
  (*maschinell lesbar* → Dateivergleich; *manueller
  Abruf* → Erinnerung im Turnus, mit Turnus) und
  Prüfvermerk (Zugriff getestet am, Werkzeug in
  `Tools.md`, Blockade dokumentiert); (c) **aktive
  Lesewege**, die es schon gibt (externer
  Posteingangs-Agent, Mail-Konverter, Konnektor,
  Abruf-Skript) — registriert und genutzt, der Agent
  baut im Standard keinen eigenen. Neue Orte jederzeit
  auf Zuruf. Ein Prozess kann einen Ort ab einer
  Ausbaustufe zur Pflicht machen (etwa ein
  elektronisches Postfach ab der Stufe, in der es
  eröffnet ist).
- **Wächter C9 (Posteingang):** vergleicht
  Eingangsordner und registrierte maschinell lesbare
  Eingangsorte mit diesem Register — nur
  Dateivergleich, kein Lesen von Inhalten — und
  meldet: Datei ohne Eintrag; Eintrag ohne Status
  `eingelesen`; Abrufturnus eines manuellen Orts
  überschritten. Gilt in jedem Projekt mit dieser
  Fassade, Stufe HINWEIS (MasterPrompt §5.3 C9).
- **`document`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder und Enum `document_type`:
  [[Katalog-Eingangsdokumente]] — lesen beim Ingest
  eines Eingangsdokuments. Body: Volltext, Metadaten-Block
  (Dokumenttyp, Datum, Absender, Empfänger,
  Aktenzeichen, weitere Datenfelder),
  Kurzzusammenfassung in Fließtext, `## Bezüge` (Case,
  erwähnte Entities, Concepts). Dateiname
  `<Datum> <Dokumentname> <Gegenstand>.md`.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Eingangsorte

_(vom Agenten beim Init gefüllt — Baustein
Eingangsorte in [[Init-Choreografie]]; je Ort Name,
Zugriffsweg, Modus (maschinell lesbar | manueller Abruf
mit Turnus), Prüfvermerk. Der Projektordner `raw/`
steht immer als erste Zeile.)_

## Eingänge

_(vom Agenten beim ersten Ingest gefüllt; optionale
Gruppen nach document_type)_
