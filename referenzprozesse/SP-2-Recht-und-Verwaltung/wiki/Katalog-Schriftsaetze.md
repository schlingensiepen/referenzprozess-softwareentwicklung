---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Schriftsaetze

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`submission-log` ([[Schriftsaetze]]) mit Element-Typ
`submission` (`extends: document`; sprechender Slug,
kein Präfix). Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### submission-log

- **Zweck:** Register der Schriftsätze je Verfahren —
  Kette in beide Richtungen (eigene, gegnerische, die
  der Stelle) mit Status angekündigt / in Arbeit /
  eingereicht / eingegangen / gegenstandslos; eigene
  Zeilen verweisen auf Marke, Tag und Einreichungen
- **Pflichtfelder:** `type: submission-log`
- **Präfix:** `—` (sprechende Slugs)
- **Datei:** `wiki/Schriftsaetze.md`
- **Singleton**
- **Pflicht ab:** Stufe 1
- **Inline vor dem Knoten:** vor Einreichung bzw.
  Eingang steht ein Schriftsatz nur als Zeile im
  Register (`angekuendigt`, `in-arbeit`); der Text
  eines eigenen lebt bis dahin als Produkt in
  `output/` ([[Katalog-Schriftsatz]]).

### submission

- **Zweck:** ein eingereichter oder eingegangener
  Schriftsatz als Knoten — mit Anträgen, Vortrag,
  Argumenten und dem Abschnitt `## Anlagen` als
  Sammler und Nachweis (Detail-Knoten zur Zeile im
  Register; entsteht erst mit Einreichung bzw. Eingang)
- **Extends:** `document`
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: submission`, `verfahren`
  (String-Slug des `case`-Knotens), `richtung` (`eigen`
  | `gegner` | `stelle`), `status` (`eingereicht` |
  `eingegangen` | `gegenstandslos`; die Werte
  `angekuendigt` und `in-arbeit` gibt es nur in der
  Register-Zeile), `datum` (Anlage-Datum `JJJJ-MM-TT`)
- **Empfohlen:** `antwort_auf` (String-Slug des
  beantworteten Schriftsatzes; Kette), `marke` und
  `tag` (nur eigene; [[Zielmarken]]), `einreichungen`
  (nur eigene; Liste der String-Slugs in
  [[Einreichungen]]), `eingangsdokument` (nur fremde;
  String-Slug — bei fremden Schriftsätzen ist der
  Knoten zugleich das Eingangsdokument mit
  `document_type: schriftsatz`)
- **Optional:** `fristen` (Liste der gezogenen oder
  gesetzten Fristen, [[Fristen]]), `vertretung_kennung`
  (Kennung der Fassung der Vertretung, falls diese
  einreicht; verknüpft beide Zählungen), `vertraulich`
  (`offen` | `intern` | `streng-intern`), `alias`
- **Beispielname:** `2026-04-02 Schriftsatz Widerspruchsbegruendung.md`
- **Kanonizität:** Status und Kette liegen in
  `wiki/Schriftsaetze.md` (Wiki.md §1.1a); die Nummern
  der Anlagen in [[Anlagen]].
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Schriftsaetze]] (Sektionen Kurzzusammenfassung /
  Anträge / Vortrag und Argumente / **Anlagen** /
  Einreichung bzw. Eingang / Vermerke / Bezüge).
- **Geerbte Felder:** als `document` trägt der Knoten
  `document_type` (bei Schriftsätzen `schriftsatz`),
  `source_text` und `ingested_at`
  ([[Katalog-Eingangsdokumente]]). Bei eigenen
  Schriftsätzen zeigt `source_text` auf die
  eingereichte Fassung (Pfad unter `outgoing/`), und
  `ingested_at` ist der Tag der Einreichung; bei
  fremden gelten die Basis-Regeln des Ingest.
- **`## Anlagen`:** Pflicht-Abschnitt jedes eigenen
  Knotens; Liste der Anlagen mit Nummer nach dem
  Schema des Verfahrens (im Entwurf `temp-`-IDs,
  endgültige Nummern beim Tag, [[Anlagen]]). Aus ihm
  wird `attachments` des Versandstands gebaut
  (Outgoing.md); ein `temp-` im getaggten Schriftsatz
  blockiert Tag und Versandstand (FEHLER).
