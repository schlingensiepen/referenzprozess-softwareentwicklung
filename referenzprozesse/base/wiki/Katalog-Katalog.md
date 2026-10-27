---
type: catalog-entry
art: register
---

# Katalog-Katalog

Register-Eintrag: Fassade `catalog` ([[Katalog]]) mit
Element-Typ `catalog-entry` (die Katalog-Einträge).

### catalog

- **Zweck:** Meta-Fassade des Katalogs — je
  Katalog-Eintrag eine Zeile mit Link und
  Link-Beschreibung; führender Ort der
  Typ-Konventionen (Grammatik)
- **Pflichtfelder:** `type: catalog`
- **Präfix:** `—`
- **Datei:** `wiki/Katalog.md` (vormals
  `wiki/Knotentypen.md`, Typ `types`)
- **Singleton, Pflicht**

### catalog-entry

- **Zweck:** ein Katalog-Eintrag — Register-Eintrag
  (Fassaden-Typ und Element-Typ eines Registers),
  Dokumenttyp-Eintrag oder Einzeltyp-Eintrag; trägt die
  Typ-Abschnitte mit Pflichtfeld-Zeile nach den
  Typ-Konventionen des Katalogs
- **Klasse:** außerhalb (lebende Mechanik; Änderungen
  per DEC)
- **Pflichtfelder:** `type: catalog-entry`, `art`
  (`register`/`dokumenttyp`/`einzeltyp`)
- **Optional:** `process` (bei prozess-mitgebrachten
  Einträgen: Prozess-Kürzel)
- **Beispielname:** `Katalog-Anforderungen.md`
- **Ablage:** flach im `wiki/`, Dateiname
  `Katalog-<Name>.md` ohne Umlaut und ß.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Katalog]].
