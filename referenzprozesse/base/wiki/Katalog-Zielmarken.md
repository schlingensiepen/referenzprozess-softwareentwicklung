---
type: catalog-entry
art: register
---

# Katalog-Zielmarken

Register-Eintrag: Fassade `target-mark-log`
([[Zielmarken]]) mit Element-Typ `target-mark`.

### target-mark-log

- **Zweck:** Register der Zielmarken — der Marken
  des Projekts als Zwischenziel-Anker (Versionen,
  Ereignis-Marken, Etappen; Begriff: [[Glossar]]
  „Marke“, Mechanik: [[Marken]]) mit den Zeigern
  `current` und `in-progress`; definiert das
  `zielmarke:`-Feld und die Marken-Trigger-Semantik
  für die planbaren Register-Typen
- **Pflichtfelder:** `type: target-mark-log`
- **Präfix:** `—` (Marken tragen eine Bezeichnung,
  keine ID)
- **Datei:** `wiki/Zielmarken.md`
- **Singleton, Pflicht** (Basis-Fassade in jedem
  Projekt, mit und ohne Prozess — Wiki.md §3a
  „mandatory“; nicht deaktivierbar)

### target-mark

- **Zweck:** einzelne **gewichtige** Zielmarke als
  Detail-Knoten zum Eintrag im Zielmarken-Register
  (Kriterium „gewichtig", Wiki.md §2.4); Regelfall
  bleibt der Inline-Eintrag in der Fassade. Der
  Marken-Eintrag (inline oder Detail-Knoten) ist ein
  Element: eine künftige Marke ist frei änderbar,
  eine abgeschlossene eingefroren; danach gibt es nur
  Nachträge als Vermerk, nie eine Ablösung
- **Klasse:** Element
- **Freeze ab:** Abschluss
- **Sammelzustand:** nein
- **Pflichtfelder:** `type: target-mark`
- **Optional:** `fuer_marke` (an jedem Marken-Eintrag
  einer Komponente: `<koordinator>:<marke>`, die Marke
  des Koordinators, für die sie liefert; Form der
  Zeile im Inline-Eintrag: [[Zielmarken]] §Meta
  „Marken-Dreiklang“; woher der Wert bei der ersten
  und bei jeder weiteren Marke kommt: ebenda
  „Zuliefernde Komponenten“), `zwischenmarke` (am
  Detail-Knoten einer Zwischenmarke: `Vorgänger von
  <Marke>` | `Sackgasse`; die Zeile `Zwischenmarke:` im
  Inline-Eintrag ist die Form, die der Lint liest:
  [[Zielmarken]] §Meta „Zwischenmarke“), `alias`
  (Liste; Wiki.md §4.1)
- **Dokumenttypen:** [[Katalog-Abschluss-Stand]],
  [[Katalog-Release-Notes]]
- **Beispielname:** `1.0 Aurora.md`
- **Kanonizität:** Wahrheit bei Zeigern und Abfolge
  liegt in `wiki/Zielmarken.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Zielmarken]] — dort auch der Abschnitt
  „Zuliefernde Komponenten“ am Marken-Eintrag des
  Koordinators und die Regel für Nachträge nach dem
  Abschluss.
