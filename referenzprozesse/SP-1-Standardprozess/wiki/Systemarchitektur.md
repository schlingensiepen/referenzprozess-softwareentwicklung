---
type: system-architecture-overview
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Systemarchitektur

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) —
Systemarchitektur ist bei jedem Entwicklungsvorhaben
(Software, Hardware, System) relevant.

## Meta

- **Typ:** `system-architecture-overview` —
  Sollzustands-Fassade Systemarchitektur mit
  generischen Sektionen. Singleton.
- **Kategorie:** (b) Inline-Fassade im wiki/ mit
  optionalen Detail-Knoten — siehe Wiki.md
  §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei allen hier
  festgehaltenen Aspekten liegt in dieser Fassade —
  Detail-Knoten (Typ `system-component`) dürfen für
  einzelne Bausteine ergänzt werden, die Fassade behält
  die Übersicht (Wiki.md §1.1a).
- **Sollzustand:** nicht fortgeschrieben — bei
  Änderungen überschrieben; die zugehörige Entscheidung
  mit Begründung steht im Entscheidungsregister.
- **`system-component`-Detail-Knoten-Konventionen:**
  Frontmatter `type: system-component`; Dateiname im
  Title-Case (`Auth Modul.md`, `Sensorik Baugruppe.md`).
  Sektionen: Zweck (ein bis drei Sätze) /
  Schnittstellen (angeboten und genutzt: Form,
  Gegenstelle, Vertrag) / Verantwortung (wofür
  zuständig — und wofür ausdrücklich nicht) /
  Abhängigkeiten / Bezüge (Fassaden-Eintrag
  [[Systemarchitektur]]). **Anlage-Schwelle:**
  Pflicht, sobald ein Baustein einen eigenen
  Bearbeiter oder Peer-Agenten, einen Contract oder
  ein eigenes Repository hat — dann ist der Knoten
  der stabile Bezugs-Anker („meine Komponente" ist
  eine Datei). Darunter Kann — Faustregel: sobald ein
  Baustein mehrfach referenziert wird, eigene
  Schnittstellen hat oder als Argumentations-Anker
  dient.
- **Bausteine-Register:** die Sektion §Bausteine ist
  das Register der Komponenten — eine Zeile je
  Baustein (Name, Aufgabe in einem Satz, Wikilink auf
  den Detail-Knoten, sobald er existiert). Ein
  separates Komponenten-Register gibt es nicht; diese
  Fassade ist der eine führende Ort.
- **`system`-Detail-Knoten:** das entwickelte System
  selbst und relevante Umsysteme/Nachbar-Systeme
  können als Knoten vom Typ `system` angelegt werden
  (Katalog: Knotentypen-Anhang). Indexiert über
  §Zweck und Abgrenzung bzw. §Beziehungen — es gibt
  kein eigenes Systeme-Register.
- **Ablösung:** RP-1 löst diese Fassade mit
  `Softwaresystemarchitektur` ab (per `supersedes:`,
  Wiki.md §11.4).

---

**Stand:** _(vom Agenten beim Init aus dem Auftrag
abgeleitet und bei Änderungen überschrieben — nicht
fortgeschrieben)_

Beschreibt den **Sollzustand** des Systems.

## Zweck und Abgrenzung

<Was leistet das System — und ausdrücklich, was leistet
es nicht.>

## Bausteine

_(Register der Komponenten — führender Ort. Eine Zeile
je Baustein; Detail-Knoten nach der Anlage-Schwelle in
`## Meta`.)_

| Baustein | Aufgabe | Detail |
|---|---|---|
| <Name> | <ein Satz> | <[[Wikilink]] oder — > |

## Beziehungen

<Wie die Bausteine zusammenhängen: Schnittstellen,
Datenflüsse, Abhängigkeiten, Verträge zwischen
Bausteinen.>

## Verantwortungen

<Zuständigkeit je Baustein bzw. Bereich — wer oder was
verantwortet welchen Teil des Systems.>

## Design-Prinzipien

<Die für dieses Vorhaben verbindlichen übergreifenden
Prinzipien und Muster.>
