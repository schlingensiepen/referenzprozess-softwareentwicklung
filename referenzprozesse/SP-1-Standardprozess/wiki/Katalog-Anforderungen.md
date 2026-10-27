---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Anforderungen

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`requirement-log` ([[Anforderungen]]) mit Element-Typ
`requirement`. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### requirement-log

- **Zweck:** Register aller Anforderungen
  (REQ-Register, Sektionen Funktional /
  Nicht-funktional)
- **Pflichtfelder:** `type: requirement-log`
- **Präfix:** `REQ`
- **Datei:** `wiki/Anforderungen.md`
- **Singleton**

### requirement

- **Zweck:** fachliche oder nicht-funktionale Anforderung
  (Detail-Knoten für REQ-Eintrag im Register)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** ja
- **Pflichtfelder:** `type: requirement`, `id`
  (Format `REQ-NNN`), `status` (8-Zustands-Enum),
  `status_date`, `datum` (seit 2.0) (Anlage-Datum
  `JJJJ-MM-TT`, nie geändert; [[Katalog]]
  §Typ-Konventionen), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  bei einer Fix-Anforderung die Marke der Behebung —
  bei einer Fix-Anforderung auf einen Deploy die Marke
  des ausgelieferten Produkt-Stands, den der weitere
  Deploy-Stand ausrollt, nicht die laufende Marke
  ([[Anforderungen]] „Fehlerbehebungen“);
  Bestand ohne Feld: [[Zielmarken]] §Meta)
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung; nur bei `aufgeschoben`),
  `umgebung` (Name aus [[Zielumgebungen]]; nur an einer
  Fix-Anforderung auf einen Deploy — sie kennzeichnet
  die Anforderung, deren Umsetzung ein weiterer
  Deploy-Stand dieser Umgebung ist und die nicht von
  FUNC, SPEC und TEST gedeckt wird; den freigegebenen
  Stand nennt sie als angehängten Vermerk „Umgesetzt mit
  Stand … von Deploy-Stand, freigegeben zu Marke <M>“,
  nicht im eingefrorenen Feld Verweise, [[Anforderungen]]
  „Fehlerbehebungen“),
  `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste),
  `abgeleitet_von` (Liste: Bedarfe und Szenarien, auf
  die sich die Anforderung stützt — [[Bedarfe]],
  [[Szenarien]]; bei einer Komponente auch FUNC des
  Koordinators als `<koordinator>/FUNC-NNN`,
  [[Kettenpruefung]] §Komponenten-Kette nach
  Übernahme-Art), `requirement_type` (Enum-Feld:
  `functional` | `non-functional` | `fix`; entspricht
  der Sektion in der Fassade — `fix` ist die
  Fix-Anforderung zu einer Fehlermeldung, Abschnitt
  „Fehlerbehebungen“ der Fassade [[Anforderungen]]),
  `behebt` (Liste der BUG-IDs, die diese Anforderung
  behebt — an jeder Anforderung, die einen BUG behebt:
  der Fix-Anforderung (`requirement_type: fix`; fehlt
  ihr der Verweis, meldet der Lint einen Hinweis) wie
  der ablösenden bzw. neuen REQ (`functional` oder
  `non-functional`, deren Begründung `abgeleitet_von:`
  bleibt); der BUG nennt die Anforderung in seiner Liste
  `fix_requirement:` zurück, [[Katalog-Fehlermeldungen]]
  — eine fehlende Gegenseite meldet der Lint als Hinweis,
  an jeder Anforderung), `quelle` (bei
  Buchung aus
  einer Nachricht eines anderen Repos:
  `<absender>/MSG-NNN`, [[Katalog-message]])
- **Dokumenttypen:** [[Katalog-Anforderungen-Stand]],
  [[Katalog-Release-Notes]]
- **Beispielname:** `REQ-001 Nutzer kann Datei hochladen.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Anforderungen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Anforderungen]].
