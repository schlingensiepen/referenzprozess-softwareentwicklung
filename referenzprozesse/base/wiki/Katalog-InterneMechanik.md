---
type: catalog-entry
art: register
---

# Katalog-InterneMechanik

Register-Eintrag: Fassade `internal-machinery-log`
([[InterneMechanik]]) mit den Element-Typen
`internal-concept`, `internal-procedure`,
`internal-pattern` und `internal-rule`.

### internal-machinery-log

- **Zweck:** Fassade des Steuerungs-Wissens (Konzepte,
  Prozeduren, Muster, Regeln — `internal-*`-Knoten)
- **Pflichtfelder:** `type: internal-machinery-log`
- **Präfix:** `—`
- **Datei:** `wiki/InterneMechanik.md`
- **Singleton, Pflicht**

Die vier Element-Typen tragen den Präfix `internal-`
(„zur internen Verwendung des Projekt-Systems" —
grenzt ab von `concept`, Anwender-Fachbegriffe).
Gemeinsam: Klasse außerhalb (lebende Mechanik);
Ablage flach im `wiki/`-Root; Struktur-Konventionen
in der
`## Meta` der Fassade [[InterneMechanik]];
Beispielnamen `Berichten-statt-Blockieren.md`,
`Git-Bestandsaufnahme.md`.

### internal-concept

- **Zweck:** Konzept-Erklärung des Projekt-Systems —
  was ist X, welche Rolle spielt X, wie hängt es
  zusammen
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: internal-concept`
- **Ablage:** flach im `wiki/`-Root.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[InterneMechanik]].

### internal-procedure

- **Zweck:** Handlungs-Prozedur — wie mache ich X
  Schritt für Schritt
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: internal-procedure`
- **Ablage:** flach im `wiki/`-Root.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[InterneMechanik]].

### internal-pattern

- **Zweck:** wiederkehrendes Design-Muster mit
  Wahl-Optionen
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: internal-pattern`
- **Ablage:** flach im `wiki/`-Root.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[InterneMechanik]].

### internal-rule

- **Zweck:** verbindliche einzelne Konvention
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: internal-rule`
- **Ablage:** flach im `wiki/`-Root.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[InterneMechanik]].
