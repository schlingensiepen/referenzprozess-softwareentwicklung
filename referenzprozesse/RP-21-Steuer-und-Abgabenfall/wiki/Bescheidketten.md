---
type: notice-log
# active: false   # bei Deaktivierung (Default ist active: true — Pflicht ab Stufe 1)
---

# Bescheidketten

**Ich bin neu in RP-21.** Diese Fassade entsteht mit der
Wahl von RP-21 (Wiki.md §11 Prozess-Teil-Wikis) und ist
**Pflicht ab Stufe 1**: jeder Bescheid, der in die Akte
kommt, gehört in eine Kette — auch bei Mitwirkung ohne
Streit, damit sichtbar ist, wogegen ein Rechtsbehelf noch
zulässig ist.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/RP-21-Steuer-und-Abgabenfall/bootstrap/Bescheidketten.md`
  — beim Merge von dort abarbeiten.
- **Typ:** `notice-log` — Register der Bescheidketten
  (Element-Typ `notice`, `extends: document`): je
  **Subjekt × Abgabenart × Zeitraum** eine Kette aus
  Erstbescheid, Änderungen, Vorbehalt der Nachprüfung,
  Vorläufigkeit, Rechtsbehelf, mit der Angabe, wogegen ein
  Rechtsbehelf **noch zulässig** ist, und der Lückenliste
  fehlender Bescheide. Singleton; Pflicht ab Stufe 1.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register; der
  Detail-Knoten eines Bescheids ist zugleich sein
  Eingangsdokument (`document_type: bescheid`,
  [[Eingangsdokumente]]) — ein Knoten, zwei Register.
- **Kanonizität:** die Wahrheit über Reihenfolge, Lücken,
  Rechtsbehelf und Angreifbarkeit liegt in dieser Fassade
  (Wiki.md §1.1a). Ein Bescheid-Knoten ist Nachweis
  (Freeze ab Anlage) und hält nur die Fakten des
  Bescheids; die **laufenden Angaben** — Rechtsbehelf,
  Angreifbarkeit, gezogene Fristen, Verfahren — stehen
  allein in der Kettenzeile; Bestandskraft und eingelegter
  Rechtsbehelf kommen zusätzlich als angehängter, datierter
  Vermerk an den Knoten. Der Bekanntgabe-Tag ist das
  geerbte Feld `zugang` des Eingangsdokuments (Fiktion der
  Ordnung, [[Fristenkatalog-RP-21]]).
- **Posteingangs-Pflicht je Bescheid** (RP-21, führender
  Ort [[Vorgehen-RP-21]] §4): beim Einlesen **Kette
  fortschreiben** (neue Zeile oder neue Kette), **Frist
  ziehen** (Rechtsbehelfsfrist ab Bekanntgabe mit der
  Fiktion der Ordnung, [[Fristenkatalog-RP-21]]; Frist in
  [[Fristen]] mit `source` auf den Bescheid),
  **Rechtsbehelfsfähigkeit prüfen** (Prüfraster der
  Ordnung: Belehrung, Bekanntgabe, Vorbehalt,
  Vorläufigkeit, Umfang der Änderung —
  [[Wegweiser-Vorverfahren]] bzw. [[Wegweiser-Pruefraster]]).
  Erst danach trägt das Eingangsdokument den Status
  `eingelesen`.
- **Angreifbarkeit je Ordnung:** Nach der Abgabenordnung
  ist ein Änderungsbescheid nur im Umfang der Änderung
  angreifbar, soweit der geänderte Bescheid bestandskräftig
  war; ein Bescheid unter Vorbehalt der Nachprüfung bleibt
  bis zum Ablauf der Festsetzungsfrist änderbar; ein
  vorläufiger Bescheid im Umfang der Vorläufigkeit. Der
  Agent schreibt je Zeile das Feld „angreifbar“ (voll /
  Änderungsumfang / keiner) mit Begründung und Fundstelle;
  Regeln im Wegweiser der Ordnung. Andere Ordnungen
  (Kommunalabgaben nach Landesrecht und
  Verwaltungsgerichtsordnung) nach deren Regeln, sonst
  „nach Ordnung prüfen“.
- **Lückenliste:** je Kette die erwarteten, aber
  fehlenden Bescheide (Zeiträume ohne Bescheid,
  Folgebescheid nach Grundlagenbescheid, Zinsbescheid
  nach Änderung, Abrechnung) — als Erwartung in
  [[Fristen]] (`richtung: für-uns`), damit sie unter
  Wache stehen.
- **Massenverfahren:** bei Ketten je Einheit (Grundstück,
  Bescheid, Zeitraum) ist die Kette die Datenquelle der
  Serie ([[Serien]], [[Vorgehen-RP-21]] §6); Flurstücke
  als Einheit aus [[Flurstuecke]].
- **Eintragsformat:** `### <Subjekt> — <Abgabenart> —
  <Zeitraum>` mit Feldern Subjekt ([[Steuersubjekte]]
  oder [[Beteiligte]]) / Stelle ([[Organisationen]]) /
  Verfahren (VF-NNN, sobald ein Rechtsbehelf läuft) /
  Angreifbar (voll · Änderungsumfang · keiner — mit Stand
  `JJJJ-MM-TT`) / Nächste Frist (Wikilink in [[Fristen]])
  / Lücken (Aufzählung) / Angelegt (`JJJJ-MM-TT`); darunter
  die **Kettentabelle**: Bekanntgabe (`zugang` des
  Knotens) · Bescheidart · Vorbehalt · Vorläufig ·
  Rechtsbehelf · Angreifbar · Fristen (Wikilinks in
  [[Fristen]]) · Verfahren (VF-NNN) · Knoten (Wikilink) —
  die laufenden Spalten werden hier fortgeschrieben,
  nicht am eingefrorenen Knoten.
- **Detail-Knoten-Pflicht:** je Bescheid ein Knoten
  (`notice`, zugleich Eingangsdokument); Felder und
  Werte: [[Katalog-Bescheidketten]] — lesen beim Anlegen.
  Sektionen: Festsetzung / Abweichung zur Erklärung bzw.
  zum Vorbescheid / Begründung und Belehrung (Prüfraster)
  / Fristen und Rechtsbehelf / Vermerke (append-only) /
  Bezüge (Kette, Subjekt, Verfahren, Eingangsdokument).
  Dateiname `<JJJJ-MM-TT> Bescheid <Abgabenart>
  <Zeitraum> <Kurzbezeichnung>.md`.
- **Pflege:** beim Init (Bestand aus der Akte, älteste
  Bescheide zuerst — laufende Fristen sofort melden),
  bei jedem Bescheid im Posteingang, bei jeder
  Rechtsbehelfs-Einreichung, bei Bestandskraft, im
  Nachlauf.

---

**Bearbeitungsstand:** _(vom Agenten beim Merge und
laufend gepflegt)_

## Einträge

_(je Kette; Ketten mit offener Frist zuerst)_
