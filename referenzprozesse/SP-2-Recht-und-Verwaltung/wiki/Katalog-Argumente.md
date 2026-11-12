---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Argumente

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`argument-log` ([[Argumente]]) mit Element-Typ
`argument` (Präfix `ARG`). Der Typ `argument` kommt aus
der Basis nach SP-2 (bis 2.1 dort als Einzeltyp ohne
Fassade, Klasse außerhalb); in SP-2 ist er ein
**Element**, damit der Argumentations-Stand ihn
annehmen und einfrieren kann. Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### argument-log

- **Zweck:** Register der Argumentationslinien des
  Verfahrens — je Linie Kernthese, Begründung, Belege,
  Pflicht-Gegeneinwand, Einsatzorte, Verweis auf die
  Strategie
- **Pflichtfelder:** `type: argument-log`
- **Präfix:** `ARG`
- **Datei:** `wiki/Argumente.md`
- **Singleton**
- **Pflicht ab:** Stufe 2
- **Entfällt abgeleitet, wenn:** die Ausbaustufe unter
  Stufe 2 liegt (Fassade `active: false`)

### argument

- **Zweck:** Argumentationslinie — Kernthese mit
  Begründung, Belegen und Pflicht-Gegeneinwand
  (Gegenargument und Antwort) für Schriftsätze und
  Stellungnahmen (Detail-Knoten zum ARG-Eintrag im
  Register)
- **Klasse:** Element
- **Freeze ab:** angenommen (mit der Freigabe des
  Argumentations-Stands, der die Linie verweist;
  danach nur Ablösung unter neuer Nummer)
- **Sammelzustand:** offen (frei bearbeitbar, solange
  kein Stand die Linie verweist)
- **Pflichtfelder:** `type: argument`, `id` (seit 2.2)
  (Format `ARG-NNN`), `status` (seit 2.2) (`offen` |
  `angenommen` | abgelöst; [[Einfrieren-und-Abloesen]]
  §Eintrittsregel), `status_date` (seit 2.2), `datum`
  (seit 2.2), `zielmarke` (seit 2.2), `verfahren`
  (seit 2.2) (String-Slug des `case`-Knotens),
  `verfolgung` (seit 2.2) (`verfolgt` |
  `zurueckgestellt` | `aufgegeben`; Zustands-Achse
  neben dem Register-Status)
- **Optional:** `strategie` (String-Slug des
  STR-Knotens, [[Strategie]]), `belege` (Liste:
  TAT-IDs aus [[Sachverhalt]], String-Slugs von
  `evidence`-Knoten), `einsatzorte` (Liste der
  Schriftsätze, [[Schriftsaetze]]), `supersedes`,
  `superseded_by`, `ueberlagert`, `alias`,
  `vertraulich` (`offen` | `intern` | `streng-intern`)
- **Dokumenttypen:** [[Katalog-Argumentation-Stand]]
- **Beispielname:** `ARG-001 Rechtsbehelfsbelehrung unvollstaendig, Jahresfrist.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Argumente.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Argumente]] (Sektionen Kernthese / Begründung /
  Belege / Gegeneinwand und Antwort — Pflicht /
  Einsatzorte / Vermerke / Bezüge). Ein Argument ohne
  Sektion „Gegeneinwand und Antwort“ ist nicht
  annahmefähig; der Argumentations-Stand verweist nur
  auf angenommene Argumente.
