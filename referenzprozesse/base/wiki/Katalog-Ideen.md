---
type: catalog-entry
art: register
---

# Katalog-Ideen

Register-Eintrag: Fassade `idea-log` ([[Ideen]]) mit
Element-Typ `idea`.

### idea-log

- **Zweck:** Register unverbindlicher Ideen für spätere
  Iterationen (domänen-übergreifend)
- **Pflichtfelder:** `type: idea-log`
- **Präfix:** `IDEA`
- **Datei:** `wiki/Ideen.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`, per Init-Fassaden-Auswahl
  deaktivierbar)
- **Kanonizität:** kanonisch für den 8-Zustands-Status
  aller IDEA-Einträge (Wiki.md §1.1a).

### idea

- **Zweck:** unverbindliche Idee mit Optionen,
  Trade-offs, Vorbedingungen und Herkunft
  (Detail-Knoten der Ideen-Fassade); auch die
  zurückgestellte Entscheidung mit `Auslöser:`
  ([[Einfrieren-und-Abloesen]] §Eintrittsregel)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** ja
- **Pflichtfelder:** `type: idea`, `id` (Format
  `IDEA-NNN`), `status` (8-Zustands-Enum),
  `status_date`, `datum` (seit 2.0) (Anlage-Datum
  `JJJJ-MM-TT`, nie geändert; [[Katalog]]
  §Typ-Konventionen), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  Bestand ohne Feld: [[Zielmarken]] §Meta)
- **Optional:** `trigger` (Datum oder
  Zielmarken-Bezeichnung; nur bei `aufgeschoben`),
  `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste; Wiki.md
  §4.1), `quelle` (bei Buchung aus einer Nachricht
  eines anderen Repos: `<absender>/MSG-NNN`,
  [[Katalog-message]])
- **Dokumenttypen:** —
- **Beispielname:**
  `IDEA-003 Fristenrechner fuer Einspruchsfristen.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Ideen.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Ideen]].
