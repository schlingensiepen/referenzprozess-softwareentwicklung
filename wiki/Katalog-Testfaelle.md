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
- **RP-2-Präzisierung** (gilt bei aktivem RP-2): Jeder
  Testfall trägt zusätzlich als Pflichtfelder den
  **Prüfort** `pruefort` (`attrappe` | `wegwerf` |
  `ziel` — wo geprüft wird: an einer Attrappe, in einer
  Wegwerf-Instanz oder an der Zielumgebung) und den
  **Ausführenden** `ausfuehrender` (`mensch` oder
  `agent`). Der Prüfort sagt nur „wo“; **in welchen
  Nachweis das Ergebnis gehört, entscheidet der
  Zeitpunkt**: Was vor der Freigabe des Deploy-Stands
  geprüft wird, steht im Testbericht ([[Testberichte]]) —
  auch mit Prüfort `ziel`, etwa ein Pre-Flight vor dem
  Abschalten; was erst nach dem Ausrollen am Ziel
  prüfbar ist, steht im Abnahmeprotokoll
  (`Abnahmeprotokolle.md` (RP-2)) und gilt im Testbericht weder
  als `blockiert` noch als fehlend (`Vorgehen-RP-2.md`
  §2 Anmerkung P10/P13). Das Prüfprogramm liest den
  Prüfort nicht gegen den Nachweis. Beim Abbau sind die
  Verifikations-Testfälle (Trockenlauf, Prüfsumme gegen
  das Ziel, Pre-Flight) Testfälle wie alle anderen
  (`Marken-RP-2.md` §4).
