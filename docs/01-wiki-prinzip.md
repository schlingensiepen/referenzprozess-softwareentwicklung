# Das Wiki-Prinzip: eine Quelle der Wahrheit

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-11; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

## Das Problem

Wer mit einem KI-Agenten arbeitet, erlebt es
schnell: Der Chat weiß heute alles und morgen
nichts. Sitzungen enden, Kontextfenster laufen voll,
Zusammenfassungen lassen Details weg. Entscheidungen
(„wir nehmen PostgreSQL", „der Liefertermin ist
verschoben", „diese Anforderung ist gestrichen")
leben dann nur noch in einem Gesprächsverlauf, den
niemand mehr vollständig liest — und der nächste
Agent, oder derselbe Agent nach einer Pause, kennt
sie nicht mehr.

## Die Lösung

Dieses Template-System zieht eine harte Linie:

**Das `wiki/` ist die Quelle der Wahrheit. Was nicht
im `wiki/` steht, ist nicht festgelegt. Der Chat ist
Arbeitsspeicher, nicht Quelle.**

Das `wiki/` ist dabei nichts Exotisches: ein Ordner
mit Markdown-Textdateien im Projekt, versioniert mit
git, lesbar mit jedem Editor (komfortabel z.B. mit
Obsidian, aber das ist optional).

## Was daraus folgt — für den Agenten

Zwei Pflichten, die das Regelwerk dem Agenten
auferlegt:

- **Lese-Pflicht:** Bevor der Agent behauptet, etwas
  sei entschieden oder festgelegt, schlägt er im
  Wiki nach — und nennt die Register-Nummer des
  Eintrags (z.B. „DEC-012"). Eine Behauptung ohne
  Nummer ist nur eine Erinnerung, und Erinnerungen
  werden erst geprüft, dann ausgesprochen. Dasselbe
  gilt, bevor er dich etwas fragt: Vielleicht steht
  die Antwort schon da.
- **Pflege-Pflicht:** Sobald etwas geklärt ist —
  eine Entscheidung, ein Prüf-Ergebnis, ein neuer
  Stand — wird es **im selben Arbeitsschritt** ins
  Wiki geschrieben. Nicht „später", nicht „am Ende
  der Sitzung": sofort. Berichte werden abgelegt,
  bevor sie im Chat zusammengefasst werden.

## Was daraus folgt — für dich

- Du kannst den Projektstand **jederzeit durch Lesen
  rekonstruieren** — ohne den Chatverlauf, ohne den
  Agenten. Das gilt auch für einen neuen Agenten
  eines anderen Herstellers: Er liest dieselben
  Dateien.
- Wenn du etwas wissen willst („was haben wir zur
  Datenbank entschieden?"), ist die Antwort eine
  Datei, kein Scrollen durch Chats.
- Wenn dir auffällt, dass etwas Besprochenes
  **nicht** im Wiki steht, ist das ein Fehler, den
  du anmahnen darfst — das System ist darauf gebaut,
  dass diese Lücke nie entsteht.

## Abgrenzung: Was nicht ins Wiki gehört

Das Wiki trägt den **lebenden Sachstand**. Daneben
gibt es bewusst andere Orte (Details im Dokument
[03-ordnerstruktur.md](03-ordnerstruktur.md)):
Original-Eingangsdokumente bleiben unverändert in
eigenen Ordnern (Nachweis), fertige Ergebnis-Stände
werden versioniert eingefroren (Übergabe), und der
Programmcode eines Softwareprojekts lebt in den
üblichen Code-Verzeichnissen. Das Wiki beschreibt,
verweist und entscheidet — es ersetzt weder Archiv
noch Code.
