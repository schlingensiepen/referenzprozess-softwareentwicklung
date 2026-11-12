---
type: catalog-entry
art: register
process: RP-21
---

# Katalog-Bescheidketten

**Ich bin neu in RP-21.** Register-Eintrag: Fassade
`notice-log` ([[Bescheidketten]]) mit Element-Typ
`notice` (Bescheid; `extends: document`). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### notice-log

- **Zweck:** Register der Bescheidketten — je Subjekt ×
  Abgabenart × Zeitraum eine Kette aus Erstbescheid,
  Änderungen, Vorbehalt der Nachprüfung, Vorläufigkeit
  und Rechtsbehelf mit der Angabe, **wogegen ein
  Rechtsbehelf noch zulässig ist**, und der Lückenliste
  fehlender Bescheide
- **Pflichtfelder:** `type: notice-log`
- **Präfix:** `—` (Schlüssel der Kette ist Subjekt ×
  Abgabenart × Zeitraum)
- **Datei:** `wiki/Bescheidketten.md`
- **Singleton**
- **Pflicht ab:** Stufe 1
- **Entfällt abgeleitet, wenn:** kein Bescheid im
  Posteingang liegt (Mitwirkung ohne Bescheid) — die
  Fassade bleibt aktiv, das Register leer

### notice

- **Zweck:** ein Bescheid als Knoten — Steuer-,
  Haftungs-, Abgaben-, Zins-, Feststellungs-, Mess- oder
  Änderungsbescheid, Ablehnung eines Antrags,
  Einspruchs- bzw. Widerspruchsentscheidung mit
  Bescheidwirkung — als Glied seiner Kette; der Knoten
  ist zugleich das Eingangsdokument (Detail-Knoten zur
  Zeile im Register)
- **Extends:** `document` (`document_type: bescheid`;
  `source_text` und `ingested_at` wie jedes
  Eingangsdokument, [[Katalog-Eingangsdokumente]])
- **Klasse:** Nachweis
- **Freeze ab:** Anlage (der Bescheid ändert sich nicht;
  Rechtsbehelf, Bestandskraft und Änderungen stehen als
  angehängte Vermerke und in der Kette)
- **Pflichtfelder:** `type: notice`, `document_type`
  (geerbt; Wert `bescheid`, bei einer Einspruchs- bzw.
  Widerspruchsentscheidung mit Bescheidwirkung
  `einspruchsentscheidung`), `kette` (Schlüssel der Kette `<subjekt>/
  <abgabenart>/<zeitraum>`, wie die Überschrift des
  Register-Eintrags), `subjekt` (String-Slug des
  [[Steuersubjekte]]-Knotens oder — solange die Fassade
  Steuersubjekte inaktiv ist — des [[Beteiligte]]-
  Eintrags), `abgabenart` (offene Liste mit
  Grundbestand: `einkommensteuer` | `koerperschaftsteuer`
  | `gewerbesteuer` | `umsatzsteuer` | `grundsteuer` |
  `grunderwerbsteuer` | `erbschaftsteuer` |
  `kraftfahrzeugsteuer` | `zoll` | `verbrauchsteuer` |
  `kommunalabgabe` | `gebuehr` | `beitrag` |
  `solidaritaetszuschlag` | `kirchensteuer` |
  `verspaetungszuschlag` | `zinsen` | `haftung`),
  `zeitraum` (Veranlagungs-, Erhebungs- oder
  Stichtags-Angabe: `JJJJ`, `JJJJ-MM`, `JJJJ-MM-TT` oder
  Zeitraum `JJJJ-MM-TT/JJJJ-MM-TT`), `bescheidart`
  (offene Liste: `erstbescheid` | `aenderungsbescheid` |
  `aufhebung` | `ablehnung` | `haftungsbescheid` |
  `feststellungsbescheid` | `messbescheid` |
  `zinsbescheid` | `einspruchsentscheidung` |
  `widerspruchsbescheid` | `vollstreckungsmassnahme`),
  `stelle` (String-Slug des [[Organisationen]]-Knotens
  mit `authority`); dazu die geerbten SP-2-Pflichtfelder
  des Eingangsdokuments — **`zugang`** ist der Tag der
  Bekanntgabe nach der Fiktion der Ordnung
  ([[Fristenkatalog-RP-21]]), kein zweites Feld;
  **`case`** fehlt, solange kein Verfahren besteht
  (Stufe 1, Bescheid ohne Rechtsbehelf), und wird
  mit dem Rechtsbehelf als neues Kopf-Feld
  nachgetragen ([[Katalog-Eingangsdokumente]]
  SP-2-Präzisierung)
- **Empfohlen:** `vorbehalt` (`ja` | `nein`; Vorbehalt
  der Nachprüfung), `vorlaeufig` (`ja` | `nein`; mit
  Umfang im Body), `aendert` (String-Slug des geänderten
  Bescheids; Kette) — alles Fakten des Bescheids, die
  mit der Anlage feststehen
- **Optional:** `betrag` (festgesetzter Betrag mit
  Währung; Nachzahlung oder Erstattung im Body),
  `faelligkeit` (`JJJJ-MM-TT`), `flurstueck` (String-Slug,
  [[Flurstuecke]], wenn der Bescheid ein Grundstück
  betrifft), `serie` (String-Slug der Serie, wenn der
  Rechtsbehelf Teil eines Massenverfahrens ist,
  [[Serien]]), `vertraulich` (`offen` | `intern` |
  `streng-intern`), `alias`
- **Beispielname:** `2026-03-12 Bescheid Grundsteuer 2026 Flur 3 Flurstueck 12.md`
- **Kanonizität:** die Kette (Reihenfolge, Lücken,
  Rechtsbehelf, was noch angreifbar ist) liegt in
  `wiki/Bescheidketten.md` (Wiki.md §1.1a); der
  Bescheid-Knoten hält die Fakten des einzelnen Bescheids
  und ist eingefroren; Rechts- und Bestandskraft stehen
  als angehängter Vermerk am Eingangsdokument
  ([[Katalog-Eingangsdokumente]] SP-2-Präzisierung).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Bescheidketten]] (Sektionen Festsetzung /
  Abweichung zur Erklärung bzw. zum Vorbescheid /
  Begründung und Belehrung (Prüfraster) / Fristen und
  Rechtsbehelf / Vermerke / Bezüge).
- **Bezugsfelder anderer Typen:** Fristen nennen den
  Bescheid als `source`; die Einspruchs-Marke nennt ihn
  in der Begründung; der `case` eines Rechtsbehelfs
  nennt die Kette im Body.
- **Nur in der Kettenzeile, nicht am Knoten** (laufende
  Angaben, die sich nach der Anlage ändern; der Knoten
  ist eingefroren): Rechtsbehelf (`moeglich` |
  `eingelegt` | `entschieden` | `ausgeschlossen` |
  `verfristet`), Angreifbarkeit (`voll` |
  `aenderungsumfang` | `keiner`), gezogene Fristen
  ([[Fristen]]), Verfahren (`case`, sobald ein
  Rechtsbehelf läuft) — Spalten der Kettentabelle in
  [[Bescheidketten]]; am Knoten stehen Rechtsbehelf und
  Bestandskraft nur als angehängte, datierte Vermerke
