# Styleguide-md — Markdown-Konventionen

**Stand: 23.08.2026**

Namenskonventionen siehe MasterPrompt §3, insbesondere
§3.9 zu Neuheits-Markern in Namen.

## 0. Geltungsbereich

Dieser Styleguide gilt **nur für Markdown-Dateien, die**

- der KI-Agent als **Output** erzeugt
  (`output/`, `overview/`, Snapshots), oder
- **für den User zum Lesen im Root** bestimmt sind
  (`TODO.md`, `Offene Fragen.md`, `Tools.md`,
  `index.md` und Teilindizes im Root, weitere
  Arbeitsdokumente im Root).

**Ausdrücklich nicht** von diesem Styleguide abgedeckt:

- **Alle Dateien in `wiki/`** (Detail-Knoten und
  Fassaden wie `wiki/Facts.md`, `wiki/Chronologie.md`,
  `wiki/Fristen.md` etc.) — folgen
  `Styleguide-wiki.md`.
- **Maschinell erzeugte Hilfsdateien**
  (`wiki/index.md`, `wiki/log.md`) — folgen den kompakten,
  greppable Formaten aus `Wiki.md`; kein Semantic
  Line Break, keine Fließtext-Regeln.
- **Dateien in `raw/` und `input/`** — werden nie
  verändert (eiserne Regel, siehe MasterPrompt §1.2
  und §1.3).

## 1. Semantic Line Breaks

Zielbreite: ~72 Zeichen pro Zeile.
Umbrüche an Satzgrenzen und semantischen Einheiten,
nicht mitten im Wort oder Halbsatz.

**Kein Umbruch nach Kopplungs-Bindestrich:** Ein
Zeilenumbruch steht nie unmittelbar nach einem
Bindestrich, der Wörter koppelt — das Wortpaar
(„Sonn- und Feiertage", „Ein- und Ausgabe") bleibt
auf einer Zeile. Grund: Konvertierungs-Tools ziehen
Zeilen zusammen und erzeugen sonst „Sonnund
Feiertage". Gilt für alle Semantic-Line-Break-Texte;
**hart verpflichtend** für Quellen, die in
Zielformate konvertiert werden (`outgoing/`-
Anschreiben, `output/`-Konvertierungen).

Zweck: Bessere Diff-Lesbarkeit bei Versionskontrolle
und in der Zusammenarbeit zwischen KI und User.

Beispiel:

```markdown
RICHTIG:
Der Bericht wendet eine einheitliche Struktur
auf die gesamte Beispielsammlung an,
obwohl die Vorlage differenziert.

FALSCH:
Der Bericht wendet eine einheitliche Struktur auf die gesamte Beispielsammlung an, obwohl die Vorlage differenziert.
```

## 2. Überschriftenhierarchie

- `#` — Dokumenttitel (genau einmal pro Datei)
- `##` — Hauptabschnitte
- `###` — Unterabschnitte
- `####` — Detailabschnitte (sparsam verwenden)

Zwischen Überschrift und folgendem Text
steht immer eine Leerzeile.

## 3. Listen

Aufzählungen mit `- ` (Bindestrich + Leerzeichen).
Nummerierte Listen nur wenn Reihenfolge relevant.
Checkboxen mit `- [ ]` und `- [x]`
nur in TODO-Listen.

### 3.1 Keine Anzahl in Listen-Ansagen

Aufzählungen werden **nicht mit der Anzahl der
Einträge eingeleitet**. Die Anzahl ändert sich bei
Überarbeitung; die Ansage muss dann mit-nachgezogen
werden — sonst entsteht ein Widerspruch zwischen Ansage
und Liste. „Folgende" trägt semantisch dasselbe wie
„vier folgende". Redundanz ist die Vorstufe zum
Widerspruch.

```markdown
RICHTIG:
Es gibt folgende Typen:
- entity
- concept
- document

FALSCH:
Es gibt drei Typen:
- entity
- concept
- document
```

Ausnahmen (Zahl ist erlaubt):

- **Aggregat-Statements**, wenn die Zahl selbst die
  Information trägt („Register-Gesamtstand: 100 DECs",
  „42 neue Basis-DECs migriert").
- **Nummerierte Sektionen / Überschriften** („§ 4
  Termini").
- **Feststehende Aufzählungen mit kanonischer Anzahl**
  („die drei Gewalten der Verfassung") — nur wenn die
  Anzahl außerhalb dieses Textes verbindlich feststeht.

## 4. Tabellen

Pipes `|` als Spaltentrennzeichen.
Headerzeile mit `|---|` darunter.
Tabellen nur wenn tabellarische Darstellung
echten Mehrwert bietet.

## 5. Fett und Kursiv

**Fett** für Schlüsselbegriffe und Warnungen.
*Kursiv* für Hervorhebungen und Zitate.
Sparsam verwenden — wenn alles fett ist,
ist nichts mehr hervorgehoben.

## 6. Codeblöcke

Inline-Code mit Backticks: `Dateiname.md`.
Mehrzeilige Codeblöcke mit dreifachen Backticks
und Sprachkennung (```markdown, ```python etc.).

## 7. Verlinkung

Relative Links zu anderen Projektdateien:
`[Argumentenliste](Projekt Argumentenliste.md)`.
Keine absoluten Pfade in Markdown-Dokumenten.
