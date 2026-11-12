---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Flurstuecke

**Ich bin neu in SP-2.** Register-Eintrag:
Entitäts-Fassade `flurstueck-log` ([[Flurstuecke]]) mit
dem Entitäts-Typ `flurstueck` (eigenständige Entität,
kein `extends: place`; eine der deutschen Ausnahmen der
Namenskonvention). Beim Prozess-Merge (Wiki.md §11.3)
wird dieser Eintrag als Datei ins Anwender-`wiki/`
kopiert und in [[Katalog]] verankert.

### flurstueck-log

- **Zweck:** Register der Flurstücke, die Gegenstand
  eines Verfahrens sind — Beispiel einer Einheit mit
  eigenem Typ
- **Pflichtfelder:** `type: flurstueck-log`
- **Präfix:** `—` (Flurstücke tragen Gemarkung, Flur
  und Nummer, keine ID)
- **Datei:** `wiki/Flurstuecke.md`
- **Singleton** — optional, Vorauswahl deaktiviert
  (Steckbrief § Mitgebrachte Fassaden)
- **Pflicht ab:** — (optional)
- **Entfällt abgeleitet, wenn:** die Fassade inaktiv
  ist (`active: false`)

### flurstueck

- **Zweck:** ein Flurstück mit Stammdaten (Gemarkung,
  Flur, Flurstücksnummer, Grundbuchblatt, Eigentümer,
  Lage, Fläche) — Detail-Knoten zum Eintrag der
  Fassade; Bescheide und Bewertungen dazu sind
  Eingangsdokumente mit Gegenstand Flurstück
- **Klasse:** außerhalb (Entität; im Stand kopiert)
- **Pflichtfelder:** `type: flurstueck`, `gemarkung`,
  `flur`, `flurstuecksnummer`
- **Optional:** `grundbuchblatt`, `eigentuemer` (Liste
  der String-Slugs von [[Personen]]- oder
  [[Organisationen]]-Knoten), `lage` (Anschrift oder
  Bezeichnung), `flaeche` (mit Einheit), `verfahren`
  (Liste der String-Slugs der `case`-Knoten, in denen
  das Flurstück Gegenstand ist), `alias`
- **Beispielname:** `Musterfeld Flur 3 Flurstueck 12.md`
- **Kanonizität:** Wahrheit bei den Stammdaten liegt in
  `wiki/Flurstuecke.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Flurstuecke]] (Sektionen Stammdaten / Eigentum und
  Rechte / Bescheide und Bewertungen / Vermerke /
  Bezüge).
- **RP-21-Präzisierung** (gilt bei aktivem RP-21; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`):
  aktiv bei Grundbesitz als Gegenstand; Einheit in
  Serien je Grundstück; Bescheide je Flurstück als
  eigene Kette. Einzelheiten in `Vorgehen-RP-21.md` §3
  „Flurstücke“.
