---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Einreichungen

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`filing-log` ([[Einreichungen]]) mit Element-Typ
`filing` (sprechender Slug, kein Präfix). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### filing-log

- **Zweck:** Register über die Versandstand-Ordner —
  je Empfänger Fassung (Tag), Kanal, Zeitpunkt,
  Nachweis, Zugang, Prüfsumme, Erwartung; maßgeblich
  ist der Zugang, nicht die Absendung
- **Pflichtfelder:** `type: filing-log`
- **Präfix:** `—` (sprechende Slugs)
- **Datei:** `wiki/Einreichungen.md`
- **Singleton**
- **Pflicht ab:** Stufe 1

### filing

- **Zweck:** eine Einreichung — eine Sendung einer
  getaggten Fassung an einen Empfänger über einen
  Kanal, mit Nachweis und Zugang (Detail-Knoten zum
  Eintrag im Register, Kategorie a mit Inline-Einträgen
  zulässig)
- **Klasse:** Nachweis
- **Freeze ab:** Anlage (Nachweis, Zugang und
  Zugangsart werden nachgetragen — der Nachweis wächst
  nur; alles andere bleibt, wie es bei der Absendung
  war; eine erneute Sendung ist eine neue Einreichung)
- **Pflichtfelder:** `type: filing`, `verfahren`
  (String-Slug des `case`-Knotens), `schriftsatz`
  (String-Slug des Schriftsatzes, [[Schriftsaetze]]),
  `fassung` (Tag der eingereichten Fassung),
  `empfaenger` (String-Slug des [[Organisationen]]-
  oder [[Beteiligte]]-Eintrags), `kanal` (aus dem
  geprüften Versandweg der Stelle; Kanal-Grundbestand
  in Outgoing.md, dazu `muendlich-termin` — Nachweis
  ist das Protokoll), `zeitpunkt` (Absendung,
  `JJJJ-MM-TTThh:mm`), `versandstand` (Pfad des
  Versandstand-Ordners unter `outgoing/`),
  `pruefsumme` (Prüfsumme des Pakets), `status`
  (`abgesandt` | `eingereicht` | `gescheitert`),
  `datum`
- **Empfohlen:** `erwartung` (String-Slug der
  automatisch angelegten Frist `für-uns`,
  `entstehung: erwartung`, [[Fristen]])
- **Optional:** `nachweis` (Dateiname in `nachweis/`
  des Versandstands; nachgetragen), `zugang` (Datum
  des Zugangs; nachgetragen), `zugang_art`
  (`eingangsbestaetigung` | `empfangsbekenntnis` |
  `sendebericht` | `quittung` | `protokoll` |
  `vermerk`; nachgetragen), `teil` (bei Teilsendungen:
  `Teil-N`, je Teil ein Nachweis), `alias`
- **Beispielname:** `2026-04-02 Einreichung Widerspruchsbegruendung an Kreisverwaltung.md`
- **Kanonizität:** Wahrheit bei Zugang und Nachweis
  liegt in `wiki/Einreichungen.md` (Wiki.md §1.1a);
  die Zeile des Schriftsatzes wechselt erst mit dem
  Nachweis auf `eingereicht`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Einreichungen]] (Sektionen Sendung / Nachweis und
  Zugang / Vermerke / Bezüge).
- **Erwartung je Einreichung:** jede Einreichung legt
  automatisch eine Erwartung an (Frist `richtung:
  für-uns`, `entstehung: erwartung`), Standard je
  Stelle aus dem Versandweg ([[Organisationen]], vom
  Anwender änderbar); der Eingang setzt sie auf
  `erfuellt`, bei Ablauf schlägt der Agent
  Sachstandsanfrage oder Erinnerung vor
  ([[Vorgehen-SP-2]] §Fristen „Immer ein Wecker“).
- **Wächter:** eine Einreichung ohne Nachweis und eine
  Einreichung, deren Prüfsumme vom freigegebenen Paket
  abweicht, meldet der Wächter ([[Vorgehen-SP-2]]
  §Wächter); die Paketprüfung vor dem Versandstand
  (Verweis ↔ Eintrag ↔ Datei, Prüfsumme je Datei,
  Inhalt ↔ Bezeichnung, Seitensumme ↔ Kanal, kein
  `temp-`) ist dessen Vorbedingung.
- **RP-20-Präzisierung** (gilt bei aktivem RP-20; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-20-Rechtsfall/`): Kanäle mit
  Abrufpflicht, Erklärung zu Protokoll und im Termin,
  Zustellung von Anwalt zu Anwalt, Fax mit Seitengrenze;
  Standard der Erwartung je Stellen-Typ. Einzelheiten in
  `Vorgehen-RP-20.md` §3 „Einreichungen“ und §6.
- **RP-21-Präzisierung** (gilt bei aktivem RP-21; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`): Fax
  mit Anlagen- und Seitengrenze der Stelle, Portal mit
  Quittung als Nachweis und Abrufturnus; Standard der
  Erwartung je Stelle. Einzelheiten in
  `Vorgehen-RP-21.md` §3 „Einreichungen“ und §5.
