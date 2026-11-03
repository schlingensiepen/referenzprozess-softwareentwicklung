---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Funktionsbeschreibungen

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`function-description-log` ([[Funktionsbeschreibungen]])
mit Element-Typ `function-description`. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert. RP-1 präzisiert im Vorgehen und legt keinen
eigenen Typ an.

### function-description-log

- **Zweck:** Register aller Funktionsbeschreibungen
  dieses Repos (Koordinator: Gesamt-, Komponente:
  Teil-Funktionsbeschreibung) — führender Ort für den
  Status; Artefakt der Phase P4 „Beschreiben der
  Funktion“ (Außensicht, vor dem Schnitt)
- **Pflichtfelder:** `type: function-description-log`
- **Präfix:** `FUNC`
- **Datei:** `wiki/Funktionsbeschreibungen.md`
- **Singleton**

### function-description

- **Zweck:** Außensicht eines Systems oder einer
  Komponente — was es leistet: Verhalten, Qualitäten,
  Schnittstellen nach außen (Detail-Knoten zum
  Funktionsbeschreibungs-Register dieses Repos); bei
  Komponenten samt Contract-Bezug als Provider (Verweise
  `<koordinator>/CON-NNN`); der Stand der Phase P4 ist
  [[Katalog-Funktionsbeschreibung-Stand]]
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** offen (Vorstatus `offen` ohne
  `aufgeschoben`; Annahme einzeln oder im Freigabe-Zug
  des ersten Stands, der das Element verweist —
  [[Einfrieren-und-Abloesen]] §Eintrittsregel)
- **Pflichtfelder:** `type: function-description`, `id`
  (Format `FUNC-NNN`), `status` (Werte nach
  [[Register-Lebenszyklus]]), `status_date`, `datum`
  (seit 2.0) (Anlage-Datum `JJJJ-MM-TT`, nie geändert;
  [[Katalog]] §Typ-Konventionen),
  `abgeleitet_von` (seit 2.0) (Liste der REQ, die
  diese Funktion abdeckt; Lint-Anteil:
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
- **Dokumenttypen:**
  [[Katalog-Funktionsbeschreibung-Stand]],
  [[Katalog-Architekturdokument]], [[Katalog-Uebergabe]]
- **Beispielname:** `FUNC-001 Datei hochladen.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Funktionsbeschreibungen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Funktionsbeschreibungen]].
- **Cross-Repo-Adressierung:** `<repo>/FUNC-NNN`
  (Qualifizierer Repo-Name; gleiches Muster wie
  `terminal/REQ-014`).
