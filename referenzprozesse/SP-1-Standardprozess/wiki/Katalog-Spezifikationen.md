---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Spezifikationen

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`specification-log` ([[Spezifikationen]]) mit
Element-Typ `specification`. Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.
RP-1 präzisiert im Vorgehen und legt keinen eigenen
Typ an.

### specification-log

- **Zweck:** Register aller Spezifikationen dieses
  Repos (Koordinator: Gesamt- für eigene Bauteile,
  Komponente: Teilspezifikation) — führender Ort für
  den Status; Artefakt der Phase P8 „Spezifizieren“
  (Bauanleitung nach Schnitt und
  Technologie-Entscheidung)
- **Pflichtfelder:** `type: specification-log`
- **Präfix:** `SPEC`
- **Datei:** `wiki/Spezifikationen.md`
- **Singleton**

### specification

- **Zweck:** Bauanleitung eines Bauteils oder einer
  Komponente, umsetzbar ohne Fachkenntnis
  (Detail-Knoten zum Spezifikations-Register dieses
  Repos); nennt die beteiligten Contracts als Verweise
  `<koordinator>/CON-NNN`; der Stand der Phase P8 ist
  [[Katalog-Spezifikation-Stand]] (Zweck „für P9
  Ausarbeiten“)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** offen (Vorstatus `offen` ohne
  `aufgeschoben`; Annahme einzeln oder im Freigabe-Zug
  des ersten Stands, der das Element verweist —
  [[Einfrieren-und-Abloesen]] §Eintrittsregel)
- **Pflichtfelder:** `type: specification`, `id`
  (Format `SPEC-NNN`), `status` (Werte nach
  [[Register-Lebenszyklus]]), `status_date`, `datum`
  (seit 2.0) (Anlage-Datum `JJJJ-MM-TT`, nie geändert;
  [[Katalog]] §Typ-Konventionen),
  `abgeleitet_von` (seit 2.0) (Liste der FUNC, die
  diese Bauanleitung umsetzt — bei einer Komponente
  ohne eigene FUNC, deren Übergabe-Stand das P4-Glied
  vertritt, die dort genannten FUNC des Koordinators
  als `<koordinator>/FUNC-NNN`; Lint-Anteil:
  [[Kettenpruefung]]), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  Bestand ohne Feld: [[Zielmarken]] §Meta)
- **Optional:** `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste). Kein
  `trigger`: Sammelzustand `offen` ohne
  `aufgeschoben`, nichts zu reaktivieren.
- **Dokumenttypen:** [[Katalog-Spezifikation-Stand]],
  [[Katalog-Deploy-Stand]] (Pipeline)
- **Beispielname:** `SPEC-001 Auth-Modul.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Spezifikationen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Spezifikationen]].
- **Cross-Repo-Adressierung:** `<repo>/SPEC-NNN`
  (Qualifizierer Repo-Name; gleiches Muster wie
  `terminal/REQ-014`).
