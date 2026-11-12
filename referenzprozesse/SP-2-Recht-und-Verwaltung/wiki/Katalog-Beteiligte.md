---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Beteiligte

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`party-log` ([[Beteiligte]]) mit Element-Typ `party`
(Relation Person oder Organisation ↔ Verfahren, als
Detail-Knoten — Kategorie a, Bauform wie `member` in
[[Katalog-Mitgliedschaften]]). Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### party-log

- **Zweck:** Relations-Register aller Beteiligten je
  Verfahren — wer ist in welchem Verfahren in welcher
  Rolle und Instanz beteiligt, mit Vertretung,
  Vollmacht, Interessen; kanonisch für Absender,
  Stimme und Unterschrift
- **Pflichtfelder:** `type: party-log`
- **Präfix:** `—`
- **Datei:** `wiki/Beteiligte.md`
- **Singleton**
- **Pflicht ab:** Stufe 1
- **Abgrenzung der Rollen-Fassaden:** [[Ansprechpartner]]
  = Rolle einer **Person im Projekt**;
  Geschäftsbeziehungen (mit dem Standardprozess
  Systementwicklung) = **Organisation zum Projekt**;
  **Beteiligte** = **Rolle im Verfahren mit
  Vertretung** („Müller ist Kläger in Verfahren x“);
  [[Mitgliedschaften]] = **Zugehörigkeit unabhängig
  vom Projekt** („Maier ist Geschäftsführer in der
  Bau-Mich-Auf GmbH“). Diese Fassaden teilen die
  Bauform — Relation Person oder Organisation ↔ etwas
  —, nicht den Gegenstand. Mitgliedschaften bleibt
  auch in SP-2 `active: false`; der Agent schlägt das
  Einschalten vor, wenn eine Zugehörigkeit über
  Verfahren oder Zeit hinweg erheblich wird.

### party

- **Zweck:** Beteiligten-Relation — verknüpft eine
  Person oder Organisation mit einem Verfahren, mit
  Rolle je Instanz, Vertretung und Vollmacht,
  Interessen, Pflicht zur Nutzung elektronischer
  Kanäle (Detail-Knoten zum Eintrag im Register)
- **Klasse:** außerhalb (lebend; ein Rollenwechsel ist
  eine neue Zeile im Feld Rolle, eine Änderung der
  Rolle des Anwenders eine Entscheidung)
- **Pflichtfelder:** `type: party`, `beteiligter`
  (String-Slug des [[Personen]]- oder
  [[Organisationen]]-Knotens), `verfahren`
  (String-Slug des `case`-Knotens, [[Verfahren]]),
  `rolle` (Liste; je Eintrag Rolle und Instanz — offene
  Liste mit Grundbestand in `## Meta` von
  [[Beteiligte]]), `stellung` (`anwender` |
  `gegenueber` | `stelle` | `dritter`)
- **Optional:** `vertretung` (String-Slug des
  Vertretungs-Eintrags; die Vertretung selbst ist ein
  Eintrag mit Rolle Bevollmächtigter), `vollmacht`
  (`vorhanden` | `original` | `nachgewiesen`; mit
  Frist in [[Fristen]], falls befristet),
  `elektronischer_kanal` (`pflicht` | `eroeffnet` |
  `keiner`; Berufsträger und Behörden `pflicht`),
  `interessen` (Freitext oder Liste), `kostentraeger`
  (`ja`, wenn der Beteiligte einen Kosten-Posten trägt,
  [[Kosten]]), `eigene_frist` (String-Slug der Frist,
  bei Dritten mit eigener Frist), `alias` (Liste)
- **Beispielname:** `Stadtwerke Mittelbach in VF-001.md`
- **Kanonizität:** Wahrheit bei Rolle und Vertretung
  liegt in `wiki/Beteiligte.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Beteiligte]].
- **Voreinstellungen je Rolle** (typische Marken,
  Prüfperspektiven, Checkliste Begleitanträge) stehen
  in [[Marken-SP-2]], [[Vorgehen-SP-2]] §Prüfen und
  den Wegweisern der Ordnung ([[Wegweiser]]); die
  Rolle „öffentliche Stelle“ kehrt die
  Voreinstellungen um.
- **RP-20-Präzisierung** (gilt bei aktivem RP-20; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-20-Rechtsfall/`):
  Rollen-Grundbestand je Gerichtsbarkeit, Vertretung,
  Beiordnung, Zustellungsbevollmächtigter. Einzelheiten
  in `Vorgehen-RP-20.md` §3 „Beteiligte“.
- **RP-21-Präzisierung** (gilt bei aktivem RP-21; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`):
  Rollen-Grundbestand des Abgabenrechts einschließlich
  der abgabenerhebenden Stelle; steuerliche Rolle mit
  Kennzeichen im Steuersubjekt. Einzelheiten in
  `Vorgehen-RP-21.md` §3 „Beteiligte“.
