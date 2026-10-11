# Styleguide-wiki — Stilkonventionen für Wiki-Knoten

**Stand: 23.08.2026**

Dieser Styleguide regelt **Stil und Formulierung**
für Dateien im `wiki/`-Verzeichnis: Länge und Ton
der Kurzzusammenfassung, Datumsformat im Fließtext,
Verwendungsdichte von Wikilinks, Kompaktheit,
Formulierungs-Konventionen in Bezüge-Sektionen.

**Nicht hier geregelt** — sondern in `Wiki.md`
(Struktur, "was" statt "wie"):

- Welche Knotentypen es gibt (Wiki.md §3).
- Welche Sektionen jeder Knoten hat (Wiki.md §4.2).
- Welche Frontmatter-Felder Pflicht sind (Wiki.md
  §4.1).
- Cross-References-Format als solches (Wiki.md §8).

Wiki.md ist Struktur/Norm (fix), Styleguide-wiki.md
ist Stil (projektspezifisch anpassbar, analog zu den
anderen Styleguides).

## 1. Geltungsbereich

Dieser Styleguide gilt für **alle Dateien in
`wiki/`** — Detail-Knoten und Fassaden gleichermaßen.

**Ausnahmen** (maschinell erzeugte Dateien mit eigenen
Format-Konventionen aus Wiki.md):

- `wiki/index.md` — folgt Wiki.md §6.
- `wiki/log.md` — folgt Wiki.md §7.

## 2. Sprache und Ton

- **Deutsch**, sachlich, prägnant.
- **Aktiv** vor Passiv, wenn möglich.
- **Keine Unterwürfigkeit gegenüber Adressaten
  und Institutionen**, aber auch keine
  Aggressivität.
- **Konsistente Terminologie** — Fachbegriffe folgen
  der Freigabe in `wiki/Glossar.md`.

## 2a. Aufzählungen ohne Anzahl-Ansage

Aufzählungen werden **nicht mit der Anzahl der Einträge
eingeleitet**. „Es gibt folgende Xxx: …" statt „Es gibt
N Xxx: …". Die Anzahl ändert sich bei Überarbeitung; die
Ansage veraltet und driftet in Widerspruch zur Liste —
Redundanz ist die Vorstufe zum Widerspruch. Details und
Ausnahmen (Aggregat-Statements über Bestände,
nummerierte Sektionen, feststehende Kanons wie „die drei
Gewalten"): siehe `Styleguide-md.md` §3.1.

Für Zeilenumbrüche gilt zusätzlich: kein Umbruch
unmittelbar nach einem Kopplungs-Bindestrich
(`Styleguide-md.md` §1).

## 3. Länge der Kurzzusammenfassung

- **4–8 Sätze** in Fließtext.
- **Ohne eigene Überschrift** — als Absatzblock
  zwischen den strukturierten Abschnitten.
- **Zweck:** der Leser versteht, worum es geht, ohne
  den Volltext öffnen zu müssen.
- **Faustregel für Fassaden allgemein:** so kurz wie
  möglich, aber so lang, dass der Übersichts-Knoten
  aus sich heraus verständlich bleibt.

## 4. Datumsformat im Fließtext

- **Präzises Datum:** `11.03.2025` (numerisch,
  Punkte) oder `11. März 2025` (ausgeschrieben).
- **In Metadaten und Frontmatter:** ISO-Format
  `2025-03-11` (Wiki.md §4.3).
- **In Wikilinks / Dateinamen von document-,
  event-, deadline-Knoten:** ISO-Format am Anfang
  (Wiki.md §5.2).

## 5. Verwendungsdichte von Wikilinks im Fließtext

- **Erste Erwähnung** einer Entity, eines Concepts,
  eines Documents in einem Absatz: als Wikilink
  setzen.
- **Wiederholte Erwähnungen** im selben Absatz: nur
  im Klartext, keine Wikilink-Verdichtung.
- **Ausnahme:** bei aufzählenden Passagen alle
  Erwähnungen als Wikilink (Übersicht).

## 6. Formulierungs-Konventionen in Bezüge-Sektionen

Typische Beziehungstypen für strukturierte Listen im
`## Bezüge`-Abschnitt (siehe Wiki.md §8.3):

- **Gehört zu** — Zugehörigkeit (Case, Verfahren,
  Meilenstein).
- **Erwähnt** — inhaltliche Erwähnung ohne engere
  Beziehung.
- **Verweist auf** — expliziter Verweis auf ein
  Concept oder Document.
- **Erwähnt in** — passives Rückverweis-Muster.
- **Siehe auch** — verwandter, nicht direkt
  bezogener Knoten.
- **Widerspricht** — inhaltlicher Widerspruch (bei
  Argumenten oder widersprüchlichen Quellen).
- **Ersetzt** — neuere Version eines Sachverhalts.
- **Basiert auf** — inhaltliche Grundlage.

Projekte können weitere Beziehungstypen ergänzen —
Konsistenz innerhalb eines Projekts hat Priorität.

## 7. Beträge, Aktenzeichen, technische Notation

- **Geldbeträge:** `38,71 €` mit Eurozeichen, zwei
  Dezimalstellen, deutscher Kommazahlung. Tausender
  mit Punkt: `123.400 €`.
- **Prozent:** `31,7 %` mit Leerzeichen vor `%`.
- **Externe Referenznummern** (Aktenzeichen,
  Ticket-, Bestellnummern): exakt wie im Original —
  keine Vereinfachung, kein Umformatieren.
- **Rechtsverweise:** `§ 361 Abs. 3 S. 3 AO` (siehe
  `Styleguide.md`).

## 8. Kompaktheit vs. Ausführlichkeit

- **Detail-Knoten:** ausführlich für den Volltext,
  kompakt für die Kurzzusammenfassung.
- **Fassaden:** immer kompakt — sie sollen
  context-window-schonend beim Sessionstart lesbar
  sein.
- **`## Bezüge`:** strukturierte Liste, keine Prosa.

## 9. Was hier nicht steht

Alles Strukturelle (Abschnittsreihenfolge,
Pflicht-Sektionen, Frontmatter-Aufbau,
Cross-References-Mechanik) steht in `Wiki.md` §3, §4,
§8. Wenn eine Frage zwischen "Stil" und "Struktur"
fällt, gilt: **Wiki.md ist Norm, Styleguide-wiki.md
ist Anpassung**. Bei Konflikt gewinnt Wiki.md.
