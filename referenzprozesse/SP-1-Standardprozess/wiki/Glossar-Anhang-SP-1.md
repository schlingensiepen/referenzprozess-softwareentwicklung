---
type: glossary-appendix
prozess: "SP-1-Standardprozess"
---

# Glossar-Anhang SP-1

_(Glossar-Teil des Prozesses SP-1 — Standardprozess
Entwicklungsprojekt.
Template-Quelle: Diese Datei wird beim Prozess-Merge
nicht ins Anwender-`wiki/` kopiert; ihre Einträge
übernimmt der Merge in `wiki/Glossar.md` des Projekts
(Wiki.md §11.3 Schritt 2, „Glossar-Anhang“). Die
Einträge gelten als freigegeben mit dem Template-Stand.
Eintragsformat: [[Glossar]] §Meta.)_

## Einträge

### Ausführungsrolle

**English:** execution role

Wer an einer Zielumgebung ausführt, Mensch oder Agent —
als Vorgabe der Umgebung (`ausfuehrung`) und als Angabe
je Testfall (`ausfuehrender`), beide dieselbe Rolle.
Führt der Mensch aus, legt der Agent den Befehl vorher
zur Prüfung vor und verifiziert danach.

**Verankert in:** mit SP-1 `Zielumgebungen.md` §Meta
„Zugriffsstufe und Ausführende“ und
`Katalog-Zielumgebungen.md` (`ausfuehrung`),
`Katalog-Testfaelle.md` RP-2-Präzisierung
(`ausfuehrender`); Ablauf: mit RP-2 `Vorgehen-RP-2.md`
§5 „Ausführungsrolle“

### Dienstblatt

**English:** service sheet

Gestalt der Benutzer-Doku bei Infrastruktur: die kurze
Beschreibung einer Umgebung für ihre fremden Nutzer,
ohne Zugangsdaten und ohne eigenen Dokumenttyp. Bei
fremden Nutzern ist es Bedingung des
Inbetriebnahme-Tors, ohne fremde Nutzer gilt Verzicht.

**Verankert in:** mit SP-1 der Dokumenttyp-Eintrag
`Katalog-Benutzer-Doku` (RP-2-Präzisierung)

### Testfall

**English:** test case

Einzelner Test mit Ablauf und Erwartung, der
Anforderungen, Funktionsbeschreibungen oder
Spezifikationen prüft — Element im Register TEST, aus
dem der Testplan gebildet wird.

**Verankert in:** mit SP-1 die Fassade `Testfaelle.md`

### Überführung

**English:** transfer (of operations)

Die Abgabe des Betriebs einer Zielumgebung an ein
Infrastruktur-Projekt mit eigenem Agenten, erfragt beim
ersten Deploy-Stand dieser Umgebung — als Abspaltung
mit Übergabe-Punkt oder per Nachricht an ein
bestehendes Projekt. Der Eintrag der Umgebung bleibt
beim Abgebenden mit dem Feld `uebergeben_an`, aus dem
Deploy-Stand und Betriebs-Anleitung für sie in den
weiteren Marken abgeleitet entfallen.

**Verankert in:** mit SP-1 `Vorgehen-SP-1.md` §2
Anmerkung P13 und `Zielumgebungen.md` §Meta
„Überführter Betrieb“; aufnehmende Seite: mit RP-2
`Vorgehen-RP-2.md` §7

### Zugriffsstufe

**English:** access level

Was der Agent an einer Zielumgebung darf, festgehalten
am Eintrag der Umgebung; jeder schreibende Lauf an
einer produktiven Umgebung braucht unabhängig von der
Stufe das Anwender-OK.

**Verankert in:** mit SP-1 `Zielumgebungen.md` §Meta
„Zugriffsstufe und Ausführende“; Werteliste:
`Katalog-Zielumgebungen.md` (RP-2-Präzisierung)
