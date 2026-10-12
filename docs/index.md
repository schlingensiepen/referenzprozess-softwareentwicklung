# Wie dieses Template-System funktioniert

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-12; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

Dieses Dokument erklärt einem Menschen ohne
Vorkenntnisse, was dieses Repository ist und wie ein
damit aufgesetztes Projekt funktioniert. Es baut die
Konzepte aufeinander auf; jede Station hat ein
Detail-Dokument für die Vertiefung. Du kannst hier
am Stück lesen und abbiegen, wo es dich interessiert.

## Es gibt ein wiki/ — und warum

Das Herzstück jedes Projekts aus dieser Vorlage ist
ein Ordner `wiki/` voller Markdown-Dateien. Er ist
die **Quelle der Wahrheit**: Alles, was im Projekt
besprochen, entschieden und erarbeitet wird, steht
dort — **was nicht im wiki/ steht, ist nicht
festgelegt.**

Warum so streng? Weil die Unterhaltung mit einem
KI-Agenten nur **Arbeitsspeicher** ist: Chats enden,
werden zusammengefasst und vergessen Details. Ein
Projekt, dessen Wissen im Chatverlauf lebt, verliert
es. Deshalb gilt für den Agenten eine doppelte
Pflicht: **nachschlagen, bevor er etwas behauptet**,
und **ablegen, sobald etwas geklärt ist**. Für dich
als Mensch heißt das: Du kannst jederzeit — auch
Monate später, auch mit einem anderen Agenten —
durch bloßes Lesen der Dateien den vollen Stand
rekonstruieren.

→ Vertiefung: [01-wiki-prinzip.md](01-wiki-prinzip.md)

## Wie das wiki/ organisiert ist

Das Wiki hat zwei Ebenen: **Fassaden** — Übersichts-
und Register-Dokumente, die man am Stück lesen kann
(z.B. ein Entscheidungs-Register, eine Zeitachse,
ein Glossar) — und **Detail-Knoten** — je ein
kleines Dokument pro Wissensobjekt (ein Dokument,
eine Person, ein Konzept, eine Entscheidung mit
Begründung). Für den Überblick genügen die Fassaden;
wer es genau wissen will, folgt den Links in die
Details. Welche Fassaden es gibt und welche in
deinem Projekt aktiv sind, zeigt die Landkarte
`wiki/Fassaden.md`.

→ Vertiefung: [02-fassaden-und-knoten.md](02-fassaden-und-knoten.md)

## Der Rest des Repos

Um das Wiki herum liegt eine feste Ordnerstruktur:
Regelwerks-Dokumente im Root, `raw/` und `input/`
für unveränderliche Eingangsdokumente, `output/` und
`overview/` für versionierte, eingefrorene
Ergebnis-Stände, `outgoing/` für Versandfertiges —
und die eingebundene Vorlage `_template/` (mit den
Prozess-Vorlagen `referenzprozesse/`) als
Nur-Lese-Quelle, aus der sich das Projekt bedient
hat und später bedienen kann.

→ Vertiefung: [03-ordnerstruktur.md](03-ordnerstruktur.md)

## Prozesse: was hier schon aktiviert ist

Die Vorlage kennt wählbare **Prozesse** — Pakete aus
Fassaden, Vorgehens-Phasen und Konventionen für eine
Projektart. In diesem Starter ist die Kombination
für Softwareentwicklung bereits aktiviert: der
Standardprozess SP-1 und darauf der Prozess RP-1
„Entwicklung eines Softwaresystems" (Anforderungen,
Architektur, Spezifikationen, Test-Setup). Geplant
wird mit **Zielmarken** — benannten Etappen wie
„1.0" oder „Nach dem Prototyp".

→ Vertiefung: [04-prozesse.md](04-prozesse.md)

## Wie der Agent arbeitet

Der Agent startet jede Sitzung mit einem festen
Ablauf (Orientierung, Kontext laden, Abgleiche) und
meldet sich dann strukturiert: **Erledigt** (was
ist passiert), **Aktion** (was er als Nächstes tut,
Widerspruch möglich), **Frage** (was er wirklich von
dir braucht). Er committet in kleinen, thematischen
Schritten nach fester Konvention und kann für
Prüfungen und Recherchen Unter-Agenten einsetzen —
wichtige Prüfungen macht ein **anderes** Modell als
das, das gebaut hat.

→ Vertiefung: [05-agent-arbeitsweise.md](05-agent-arbeitsweise.md)

## Die zwei Wege in dein Projekt

Dieses Repository wird nicht selbst zum Projekt — es
wird als Vorlage unter `_template/` in dein Projekt
**eingebunden**. Gestartet wird mit einem einzigen
Satz an deinen KI-Agenten, den du in deinem
Projektordner gibst; die zwei Sätze stehen zum
Herauskopieren ganz oben in der README. Der Agent
liest daraufhin die passende Anleitung direkt von
der Repo-URL und arbeitet sie mit dir ab:

- **Neues Projekt** (Anleitung `INIT.md`): Zuerst
  fragt dich der Agent, ob die Vorlage als
  verknüpfte Vorlage, die du später gezielt
  aktualisieren kannst (empfohlen; technisch ein
  git-Submodul), oder als eingefrorene Kopie, die
  dauerhaft im Projekt bleibt, damit du immer
  siehst, womit du gestartet bist, eingebunden
  wird. Dann bietet er an, die Startausstattung zu
  kopieren — per Skript `setup/init-frisch.sh` oder
  von Hand, du entscheidest. Danach: wenige Fragen,
  erster Commit, losarbeiten.
- **Bestehendes Projekt** (Anleitung
  `migration/MIGRATION.md`): Der Agent sichert
  zuerst deinen Alt-Zustand per Commit, stellt dann
  dieselbe Einbindungs-Frage und bietet die Kopie
  an (Skript `setup/init-migration.sh` oder von
  Hand — dieselbe Ausstattung plus
  Migrations-Varianten). Danach überführt er dein
  vorhandenes Wissen ins Wiki — ohne dass
  Bestands-Dateien angetastet werden.

Kein Schritt, der etwas in deinem Projekt anlegt,
läuft ungefragt.

→ Vertiefung: [06-start-und-migration.md](06-start-und-migration.md)

## Was verbindlich ist

Diese Doku erklärt; sie entscheidet nichts. Die
verbindlichen Regeln stehen im Regelwerk:
`MasterPrompt.md` (Zentrale), `Wiki.md`
(Wiki-Logik), `Vorgehen.md` (Phasen und Freigaben),
`Reviewmuster.md` (Prüfungen), `Outgoing.md`
(Versand) und die Styleguides. Bei jedem Widerspruch
zwischen dieser Doku und dem Regelwerk gilt das
Regelwerk.
