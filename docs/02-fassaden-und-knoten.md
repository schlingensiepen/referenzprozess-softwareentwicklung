# Fassaden und Detail-Knoten: wie das Wiki organisiert ist

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-11; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

## Zwei Ebenen

Das Wiki hat eine bewusst einfache Architektur aus
zwei Ebenen:

- **Fassaden** sind Übersichts-Dokumente, die einen
  zusammenhängenden Aspekt des Projekts **am Stück
  lesbar** abbilden — meist als Register mit einer
  Zeile pro Eintrag. Beispiele: das
  Entscheidungs-Register (`wiki/Entscheidungen.md`),
  die Zeitachse (`wiki/Chronologie.md`), das
  Anforderungs-Register (`wiki/Anforderungen.md`),
  das Glossar.
- **Detail-Knoten** sind kleine Einzel-Dokumente —
  eines pro eigenständig zitierbarem Wissensobjekt:
  ein eingegangenes Dokument, eine Person, ein
  Fachkonzept, eine Entscheidung mit ausführlicher
  Begründung. Jeder Knoten trägt einen Typ (z.B.
  `document`, `person`, `concept`, `decision`) und
  seine Herkunft im Dateikopf.

Verbunden sind beide Ebenen durch **Wikilinks** in
doppelten eckigen Klammern, z.B.
`[[Entscheidungen]]` — in Editoren wie Obsidian
klickbar, aber auch als reiner Text eindeutig.

## Progressive Disclosure: erst Übersicht, dann Tiefe

Der Zweck der zwei Ebenen ist Lese-Ökonomie — für
Menschen wie für Agenten (deren „Aufmerksamkeit",
das Kontextfenster, begrenzt und kostbar ist): Für
den Überblick genügen die Fassaden; erst wer ein
Detail braucht, folgt dem Link in den Knoten. Ein
Agent, der eine Sitzung startet, liest eine Handvoll
Fassaden — nicht hunderte Einzeldateien.

Eine Feinheit mit großem Nutzen: Für einzelne
**kanonische Felder** — typischerweise den Status
eines Eintrags („offen", „umgesetzt", „abgelaufen")
— ist die **Fassade** maßgeblich, nicht der
Detail-Knoten. Wer einen Status ändert, ändert ihn
im Register; der Knoten spiegelt. So gibt es nie
zwei widersprüchliche Wahrheiten.

## Der Typen-Katalog

Welche Knoten-Typen es gibt und wie sie aufgebaut
sind, steht im Katalog `wiki/Knotentypen.md` — in
diesem Starter bereits inklusive der Typen, die die
Software-Prozesse mitbringen (z.B. `requirement`,
`specification`). Neue Typen entstehen geregelt,
nicht wildwüchsig.

## Aktiv und deaktiviert

Nicht jedes Projekt braucht jede Fassade. Die
**Landkarte `wiki/Fassaden.md`** führt alle Fassaden
mit Status: aktiv oder deaktiviert. Deaktivierte
Dateien bleiben physisch liegen (z.B. ist in diesem
Starter das Aktenzeichen-Register deaktiviert, weil
Softwareprojekte es selten brauchen) und lassen sich
jederzeit **per Zuruf reaktivieren** („reaktiviere
Aktenzeichen") — der Agent erledigt dann auch die
Einrichtung.

Vier Fassaden sind Pflicht und nie abschaltbar: die
Anwender-Fakten (`Facts.md`), der Typen-Katalog
(`Knotentypen.md`), die Landkarte selbst
(`Fassaden.md`) und das Steuerungs-Register
(`InterneMechanik.md`).

## Woher kommt neues Wissen ins Wiki?

Hauptsächlich auf zwei Wegen:

- **Ingest:** Eingangsdokumente (Scans, Briefe,
  Spezifikationen) werden in Text konvertiert, und
  der Agent erzeugt daraus Wiki-Knoten mit
  Herkunfts-Verweis auf das Original.
- **Arbeit und Klärung:** Entscheidungen, Berichte,
  Konzepte und Register-Einträge entstehen laufend
  aus der Projektarbeit — nach der Pflege-Pflicht
  (siehe [01-wiki-prinzip.md](01-wiki-prinzip.md))
  immer sofort.

Jede Änderung wird committet; ein Ingest-Log
(`wiki/log.md`) und ein Index (`wiki/index.md`)
halten den Bestand nachvollziehbar.
