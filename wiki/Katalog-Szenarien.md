---
type: catalog-entry
art: register
---

# Katalog-Szenarien

Register-Eintrag: Fassade `scenario-log`
([[Szenarien]]) mit Element-Typ `scenario`. Ein
Prozess darf den Element-Typ per Spezialisierung
ersetzen; Register und Präfix bleiben.

### scenario-log

- **Zweck:** Register der Szenarien — wie ein Ablauf
  vor sich geht (Vorstufe der Anforderungen)
- **Pflichtfelder:** `type: scenario-log`
- **Präfix:** `SCEN`
- **Datei:** `wiki/Szenarien.md`
- **Singleton, Basis-Fassade** (Einstufung: Wiki.md
  §3a)

### scenario

**abgelöst durch use-case (aus Prozess RP-1)**

- **Zweck:** einzelner Ablauf aus Sicht der
  beteiligten Rollen (Detail-Knoten zum Eintrag im
  Szenario-Register)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** ja
- **Pflichtfelder:** `type: scenario`, `id` (Format
  `SCEN-NNN`), `status` (8-Zustands-Enum),
  `status_date`, `datum` (seit 2.0) (Anlage-Datum
  `JJJJ-MM-TT`, nie geändert; [[Katalog]]
  §Typ-Konventionen), `rollen` (String-Liste der
  Rollen aus [[Rollen]]), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  Bestand ohne Feld: [[Zielmarken]] §Meta)
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung; nur bei `aufgeschoben`),
  `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste)
- **Dokumenttypen:** —. Mit SP-1: Konzept-Stand.
- **Beispielname:** `SCEN-001 Antrag online einreichen.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Szenarien.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Szenarien]].
