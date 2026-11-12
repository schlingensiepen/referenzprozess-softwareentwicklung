---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Verfahren

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`case-log` ([[Verfahren]]) mit Element-Typ `case`. Der
Typ `case` kommt aus der Basis nach SP-2 (bis 2.1 dort
als Einzeltyp ohne Fassade geführt); seine Erklärung
steht jetzt hier. Beim Prozess-Merge (Wiki.md §11.3)
wird dieser Eintrag als Datei ins Anwender-`wiki/`
kopiert und in [[Katalog]] verankert.

### case-log

- **Zweck:** Register aller Verfahren des Projekts —
  je Verfahren Stelle, Aktenzeichen, Instanz,
  Vorgänger, Gegenüber mit Stellung, Rolle des
  Anwenders, Vertretung und Vertretungszwang,
  Verfahrensgrundsatz, Nummerierungsschema der
  Anlagen, Anträge, Status mit Abschlussform, offener
  Zug, Strang-Form
- **Pflichtfelder:** `type: case-log`
- **Präfix:** `VF`
- **Datei:** `wiki/Verfahren.md`
- **Singleton**
- **Pflicht ab:** Stufe 1

### case

- **Zweck:** ein Verfahren — der Fall-Knoten, an dem
  Fristen, Eingangsdokumente, Schriftsätze, Anlagen,
  Beteiligte und Kosten hängen (Detail-Knoten zum
  VF-Eintrag im Register)
- **Klasse:** außerhalb (lebend; der Status führt den
  Abschluss, Entscheidungen über das Verfahren werden
  in [[Entscheidungen]] gebucht, der Knoten hält die
  Fakten)
- **Pflichtfelder:** `type: case`, `id` (seit 2.2)
  (Format `VF-NNN`; gleichbleibende Register-ID — der
  sprechende Schlüssel ist das Aktenzeichen, sobald
  eines vorliegt), `status` (offene Liste mit
  Grundbestand `laufend` | `ruhend` | `ausgesetzt` |
  `unterbrochen` | `abgeschlossen`), `stelle` (seit
  2.2) (String-Slug des [[Organisationen]]-Knotens mit
  `authority`), `rolle` (seit 2.2) (Rolle des Anwenders
  in diesem Verfahren; Liste, Werte aus dem
  Rollen-Grundbestand in [[Beteiligte]]),
  `verfahrensgrundsatz` (seit 2.2) (`beibringung` |
  `amtsermittlung` | `gemischt`), `anlagen_schema`
  (seit 2.2) (Präfix und Zählweise der Anlagen:
  `je-verfahren` | `je-schriftsatz`, mit Präfix-Text;
  Voreinstellung aus dem Referenzprozess, Anordnung
  der Stelle geht vor), `vertretungszwang` (seit 2.2)
  (`ja` | `nein` | `teilweise`; Erläuterung je Instanz
  und Handlung im Body), `stufe` (seit 2.2)
  (Ausbaustufe, in der das Verfahren begonnen hat:
  `1` | `2` | `3`)
- **Empfohlen:** `aktenzeichen` (Liste der
  Aktenzeichen dieses Verfahrens, [[Aktenzeichen]];
  Umbenennung und Verbindung dort), `instanz`,
  `gegenueber` (Liste der String-Slugs der
  Gegenüber-Einträge in [[Beteiligte]])
- **Optional:** `vorgaenger` (String-Slug des
  Vorgänger-Verfahrens; Vorgänger ohne Ablösung,
  [[Katalog]] §Typ-Konventionen), `abschlussform` (nur
  bei `abgeschlossen`; offene Liste, Grundbestand in
  [[Marken-SP-2]]), `ruht_auf` (nur bei `ruhend` auf
  Anwender-Wort: Kennung der Entscheidung in
  [[Entscheidungen]]; ohne das Feld gilt die
  Wecker-Pflicht, [[Vorgehen-SP-2]] §Fristen),
  `strang_form` (`serie` | `buendel` | `folge` |
  `vorziehen` | `abspaltung`; mit der
  Strang-Entscheidung), `vertretung` (String-Slug des
  Vertretungs-Eintrags in [[Beteiligte]]),
  `vertraulich` (`offen` | `intern` | `streng-intern`;
  Vorgabe `offen`), `alias` (Liste; Wiki.md §4.1)
- **Beispielname:** `VF-001 Widerspruch Gebuehrenbescheid.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Verfahren.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Verfahren]] (Sektionen Gegenstand und Beteiligte /
  Anträge / Verlauf / Fristen / Schriftsätze / Offene
  Punkte / Vermerke / Bezüge).
- **Schlüssel:** Register-ID `VF-NNN` ab Anlage, nie
  geändert; das Aktenzeichen der Stelle ist der
  sprechende Schlüssel in Überschrift und Verweisen,
  sobald es vorliegt — bis dahin steht `VF-NNN` allein
  ([[Aktenzeichen]]: Pflicht in SP-2).
- **Bezugsfelder anderer Typen:** Fristen, Ereignisse,
  Eingangsdokumente und Schriftsätze nennen das
  Verfahren im Feld `case:` bzw. `verfahren:`
  (String-Slug, Wiki.md §4.1); Beteiligte, Anlagen,
  Einreichungen, Kosten und Beweisangebote im Feld
  `verfahren:`.
- **RP-20-Präzisierung** (gilt bei aktivem RP-20; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-20-Rechtsfall/`): Voreinstellung
  `anlagen_schema` je Gerichtsbarkeit und Rolle,
  `vertretungszwang` je Instanz und Handlung,
  `verfahrensgrundsatz` und Instanzenzug je Ordnung.
  Einzelheiten in `Vorgehen-RP-20.md` §3 „Verfahren“.
- **RP-21-Präzisierung** (gilt bei aktivem RP-21; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`):
  Verfahren je Rechtsbehelf mit Bezug auf Bescheidkette
  und Steuersubjekt, `anlagen_schema` je Schriftsatz,
  `verfahrensgrundsatz` Amtsermittlung,
  `vertretungszwang` vor dem Bundesfinanzhof.
  Einzelheiten in `Vorgehen-RP-21.md` §3 „Verfahren“.
