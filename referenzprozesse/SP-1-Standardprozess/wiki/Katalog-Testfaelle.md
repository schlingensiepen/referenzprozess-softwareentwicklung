---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Testfaelle

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`test-case-log` ([[Testfaelle]]) mit Element-Typ
`test-case`. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### test-case-log

- **Zweck:** Register aller Testfälle dieses Repos
  (System- und Anwendertests); speist den Testplan
  der Phase P10
- **Pflichtfelder:** `type: test-case-log`
- **Präfix:** `TEST`
- **Datei:** `wiki/Testfaelle.md`
- **Singleton**

### test-case

- **Zweck:** einzelner Testfall mit Ablauf und
  Erwartung (Detail-Knoten zum TEST-Eintrag im
  Register)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** offen (Vorstatus `offen` ohne
  `aufgeschoben`; Annahme einzeln oder im Freigabe-Zug
  des ersten Stands, der das Element verweist —
  [[Einfrieren-und-Abloesen]] §Eintrittsregel)
- **Pflichtfelder:** `type: test-case`, `id` (Format
  `TEST-NNN`), `status` (Werte nach
  [[Register-Lebenszyklus]]), `status_date`, `datum`
  (seit 2.0) (Anlage-Datum `JJJJ-MM-TT`, nie geändert;
  [[Katalog]] §Typ-Konventionen), `prueft`
  (Liste der REQ, FUNC und SPEC, die der Testfall
  prüft; darf auf SCEN zeigen; Lint-Anteil:
  [[Kettenpruefung]]), `testart` (Enum: `system` |
  `anwender` | `integration`), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  Bestand ohne Feld: [[Zielmarken]] §Meta)
- **Optional:** `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste). Kein
  `trigger`: Sammelzustand `offen` ohne
  `aufgeschoben`, nichts zu reaktivieren.
- **Dokumenttypen:** [[Katalog-Testplan]]
- **Beispielname:** `TEST-001 Anmeldung mit gültigem Konto.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Testfaelle.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Testfaelle]].
