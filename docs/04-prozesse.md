# Prozesse: SP-1, RP-1 und die Zielmarken

> Erklär-Doku des Template-Systems, abgeleitet aus
> dem Regelwerk (MasterPrompt.md, Wiki.md,
> Vorgehen.md), Starter-Stand 2026-10-11; kein
> Wahrheits-Ort — verbindlich ist das Regelwerk.

## Was ein Prozess ist

Ein **Prozess** ist in dieser Vorlage ein fertiges
Paket für eine Projektart: zusätzliche Fassaden
(z.B. ein Anforderungs-Register), ein auf die
Domäne zugeschnittenes Vorgehen, Commit-Konventionen
und Knoten-Typen. Die Pakete liegen im Ordner
`referenzprozesse/` — vom Rechtsfall über
Publikationen bis zur Hardwareentwicklung; manche
ausgearbeitet, manche als Platzhalter.

## Was in diesem Starter schon aktiviert ist

Dieser Starter ist die Ausprägung für
**Softwareentwicklung**. Aktiviert sind:

- **SP-1 Standardprozess** — die Grundausstattung
  für Entwicklungsprojekte: Anforderungs-Register
  (`wiki/Anforderungen.md`), Fehlermeldungs-Register,
  Nutzer-Rollen, dazu Vorgehens- und
  Register-Mechanik.
- **RP-1 Entwicklung eines Softwaresystems** (baut
  auf SP-1 auf) — ergänzt Software-Spezifisches:
  Architektur-Sollzustand
  (`wiki/Softwaresystemarchitektur.md`),
  Test-Setup, Spezifikations-Register.

Die Aktivierung samt aller Vorfestlegungen ist im
Knoten `wiki/Aktivierter-Prozess.md` gebucht — beim
Projektstart musst du dazu nichts mehr entscheiden.
Offen bleibt genau eine Prozess-Frage (unten).

## Das Vorgehen: Phasen als Angebot

Das Vorgehensmodell (in `Vorgehen.md`, präzisiert je
Prozess) kennt zwölf generische Phasen — vom
Konzipieren über Anforderungen sammeln,
Spezifizieren, Zerlegen in Bausteine bis Testen,
Ausliefern und Betreiben. Wichtig ist die Haltung:
**Phasen sind ein Angebot, kein Zwang.** Der Agent
nutzt sie als Checkliste („hast du das schon
bedacht?"), nie als Blockade. Verlässlichkeit
entsteht stattdessen über **Freigaben**: Wer sich
auf ein Artefakt verlässt (z.B. die Architektur auf
die Spezifikation), prüft, ob es für genau diesen
Zweck freigegeben wurde — jede Freigabe wird als
Entscheidung gebucht und bindet sich an einen
eingefrorenen Stand.

## Zielmarken: Planen in Etappen

Geplant wird mit **Zielmarken** — benannten
Planungs-Horizonten wie „1.0", „Prototyp läuft" oder
„Nach der Abnahme" (Register:
`wiki/Zielmarken.md`). Genau eine Marke ist
`current` (zuletzt erreicht), genau eine
`in-progress` (daran wird gearbeitet). Einträge im
Wiki können einer Marke zugeordnet oder „bis Marke
X" vertagt werden — ein Wächter weckt sie, wenn die
Marke drankommt. In diesem Starter sind noch keine
Marken vorbelegt: Die ersten entstehen beim
Projektstart aus deinem Auftrag.

## Die offene Rollen-Frage: Standalone oder Koordinator

Beim Start fragt dich der Agent, ob dein Projekt
**Standalone** ist (ein Repository, ein System) oder
**Koordinator** mehrerer Komponenten-Repositories.
Beim Koordinator-Entscheid wird zusätzlich ein
Contract-Register aktiviert (Schnittstellen-Verträge
zwischen den Komponenten, Vorlage liegt in
`referenzprozesse/RP-1-Systementwicklung/`), und der
Agent legt dir das Muster „Trennung von Werkstatt
und Produkt" zur Entscheidung vor. Du kannst die
Rolle auch später noch wechseln — die Vorlagen
bleiben im Projekt verfügbar.

## Später mehr oder anders?

Die Prozess-Wahl ist nicht endgültig: Weitere
Prozesse lassen sich per Zuruf aktivieren
(„aktiviere Prozess X"), vorhandene aktualisieren —
`referenzprozesse/` bleibt dafür dauerhaft als
Quelle im Projekt liegen.
