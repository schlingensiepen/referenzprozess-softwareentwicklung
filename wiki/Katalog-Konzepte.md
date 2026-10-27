---
type: catalog-entry
art: register
---

# Katalog-Konzepte

Register-Eintrag: Fassade `concept-log` ([[Konzepte]])
mit Element-Typ `concept`.

### concept-log

- **Zweck:** Register der Sach-Wissens-Anker
  (`concept`-Knoten) — Sach-Ebene; die Definition
  eines Begriffs führt das Glossar
- **Pflichtfelder:** `type: concept-log`
- **Präfix:** `—`
- **Datei:** `wiki/Konzepte.md`
- **Singleton**

### concept

- **Zweck:** Fachbegriff, Norm, Prinzip oder
  technisches Konzept — Sach-Wissens-Anker für
  Cross-References; erklärt und verweist für die
  Definition auf den Glossar-Eintrag (das Glossar
  führt die Definition)
- **Klasse:** außerhalb (lebende Quelle; referenzierte
  `concept`-Knoten werden im Stand kopiert)
- **Pflichtfelder:** `type: concept`
- **Beispielname:** `Skonto.md`,
  `Semantic Line Breaks.md`, `REST API.md`
- **Register:** Eintrag in der Fassade [[Konzepte]]
  ist Teil der Knoten-Anlage (Name +
  Ein-Satz-Erläuterung + Wikilink).
- **Struktur-Konvention:** Sektionen `## Definition`
  (Link auf den Glossar-Eintrag mit
  Link-Beschreibung; solange kein Glossar-Eintrag
  freigegeben ist, steht hier die knappe Definition),
  `## Kontext / Anwendung`, optional
  `## Bezüge zu Grundlagen`, `## Bezüge` (Angewendet
  in, Verwandte Concepts, Glossar-Verweis).
- **Struktur-Konventionen im Übrigen:** `## Meta`
  der Fassade [[Konzepte]].
