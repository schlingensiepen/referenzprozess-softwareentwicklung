---
type: catalog-entry
art: dokumenttyp
process: RP-1
---

# Katalog-Durchführungs-Instanz

**Ich bin neu in RP-1.** Dokumenttyp-Eintrag: die
Durchführungs-Instanz als selbsttragende Ableitung aus
dem Testplan-Stand (Kennung `durchfuehrungs-instanz`)
— Plan und Protokoll in einem ausfüllbaren Dokument,
je Testdurchgang. Beim Prozess-Merge (Wiki.md §11.3)
wird dieser Eintrag als Datei ins Anwender-`wiki/`
kopiert und in [[Katalog]] verankert.

### durchfuehrungs-instanz

- **Zweck:** Ausführende ohne Wiki-Zugang führen den
  Testdurchgang nach Plan durch und protokollieren je
  Testfall das Ergebnis im selben Dokument.
- **Phase:** —
- **Verbindlichkeit:** optional (Angebot in P10
  Testen)
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: jeder Testdurchgang
  nach dem freigegebenen Testplan-Stand
  ([[Katalog-Testplan]]); die Struktur der Instanz
  wird vor der Anlage vorgelegt.
- **Quell-Register und Filter:** Quell-Stand ist der
  freigegebene Testplan-Stand der Marke (nie ein
  lebender Knoten); die Marke wird aus seiner
  Herkunftszeile geerbt. Format nach Werkzeug-Wahl
  des Anwenders (z.B. Tabellenkalkulation). Das Feld
  **Zielgruppe** gehört an die Instanz (z.B. technisch
  unerfahrene Tester — dann gehören
  Vorbereitungs-Anleitungen dazu). Die ausgefüllte
  Instanz wird wieder eingelesen und ergibt den
  Testbericht (TRES, [[Testberichte]]).
- **Pflichtfelder:** `type: durchfuehrungs-instanz`,
  `marke`, `quell_stand` (Testplan-Stand mit Version;
  Herkunftszeile: [[Einfrieren-und-Abloesen]] §Stand),
  `zielgruppe`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); die
  ausgefüllte Instanz als Versandstand bzw. Rücklauf
  (`outgoing/`, `input/`).
