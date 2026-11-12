---
type: glossary-appendix
prozess: "RP-2-IT-Infrastruktur"
---

# Glossar-Anhang RP-2

_(Glossar-Teil des Prozesses RP-2 — IT-Infrastruktur.
Template-Quelle: Diese Datei wird beim Prozess-Merge
nicht ins Anwender-`wiki/` kopiert; ihre Einträge
übernimmt der Merge in `wiki/Glossar.md` des Projekts
(Wiki.md §11.3 Schritt 2, „Glossar-Anhang“). Die
Einträge gelten als freigegeben mit dem Template-Stand.
Eintragsformat: [[Glossar]] §Meta.)_

## Einträge

### Abnahmeprotokoll

**English:** acceptance protocol

Nachweis der Abnahme **am Ziel nach dem Ausrollen**
eines freigegebenen Deploy-Stands einer Umgebung, mit
dem Beleg der Probe-Rücksicherung; eine neue Abnahme
ist ein neuer Eintrag. Es ist Bedingung des
Inbetriebnahme-Tors — fehlt es, steht das als
Einschränkung mit Frist in der Freigabe der
Betriebs-Anleitung, und das Prüfprogramm gibt einen
HINWEIS.

**Verankert in:** mit RP-2 die Fassade
`Abnahmeprotokolle.md` §Meta; Tor: `Vorgehen-RP-2.md` §5;
Prüfung: dort §8

### Abschalt-Tor

**English:** decommissioning gate

Bedingung der Freigabe des Deploy-Stands „abgebaut“
einer Umgebung — keine eigene Freigabe: Testbericht der
Verifikation, Re-Inventur vom selben Tag und benannte
Vorab-Sicherung liegen vor der Freigabe vor.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §5
„Abschalt-Tor“; Ablauf des Abbaus `Marken-RP-2.md` §4

### Bestandsbericht

**English:** inventory report

Lesende Ist-Aufnahme je Zielumgebung mit markierten
Annahmen und offenen Prüffragen, abgelegt in
`overview/` mit Datum — kein Stand, ohne Tag,
Testbericht und Freigabe. Vor der ersten Marke ist er
der Einstieg „Bestand erfassen“; dieselbe Form hat die
**Re-Inventur** vor einem Abbau und vor destruktiven
Schritten.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §2
Anmerkung P2 und §4

### Betriebsjournal

**English:** operations journal

Markenfreies Register je Zielumgebung, in dem jeder
Skriptlauf an einer Anlage — auch der
Wiederholungslauf ohne Änderung — als Nachweis steht,
dazu Prüfungen, Störungen und Beobachtungen. Ein
Eintrag mit Abweichung vom Stand, der jünger ist als
der Deploy-Stand, macht einen weiteren Deploy-Stand
oder eine Marke der Art Ändern fällig.

**Verankert in:** mit RP-2 die Fassade
`Betriebsjournal.md` §Meta

### Externe Abhängigkeit

**English:** external dependency

Anbieter oder Fremdleistung, von der eine Anlage
abhängt, mit Fakten, Fristen und **Annahmen**, die je
ein Prüfdatum als Frist tragen; zum Prüfdatum prüft der
Agent die Annahme und schlägt die Erneuerung vor. Diese
Annahme über einen Anbieter ist nicht die Annahme eines
Elements.

**Verankert in:** mit RP-2 die Fassade
`Externe-Abhaengigkeiten.md` §Meta

### Inbetriebnahme-Tor

**English:** commissioning gate

Die Bedingungen der Freigabe der Betriebs-Anleitung je
Umgebung — diese Freigabe **ist** die Inbetriebnahme,
das Tor keine eigene Freigabe. Eine fehlende Bedingung
steht als Einschränkung mit Frist im Freigabe-Eintrag.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §5
„Inbetriebnahme-Tor“; Kurzform mit SP-1
`Katalog-Betriebs-Anleitung` (RP-2-Präzisierung)

### Marken-Art

**English:** mark type (infrastructure)

Die Art einer Infrastruktur-Marke, die im Namen oder
in der Begründung der Marke steht, nicht in einem Feld;
die Phasen-Matrix sagt je Art, welche Phasen Pflicht,
Standard-Verzicht oder übernommen sind.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §3
„Marken-Arten und Phasen-Matrix“; `Marken-RP-2.md` §2

### Prüfort

**English:** test location

Wo ein Testfall einer Anlage geprüft wird; der Prüfort
sagt nur „wo“, in welchen Nachweis das Ergebnis gehört
(Testbericht oder Abnahmeprotokoll), entscheidet der
Zeitpunkt.

**Verankert in:** mit SP-1 der Katalog-Eintrag
`Katalog-Testfaelle` (RP-2-Präzisierung); Zeitpunkt:
`Vorgehen-RP-2.md` §2 Anmerkung P10/P13

### Rezept

**English:** recipe

Das Produkt einer Infrastruktur-Marke: die Skripte und
Dateien in `deploy/`, beim Abbau die Rückbau-Skripte;
der Tag der Implementierung markiert das Rezept, nicht
die Anlage. Ein Betreiber-Projekt ohne
eigene Skripte hat als Rezept die Pin-Datei und die
Parameter seiner Zielumgebungen.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §2
Anmerkung P9 „Tag des Rezepts“; Konvention §4a

### Störung

**English:** incident

Fehlermeldung einer Anlage mit ausdrücklicher
**Ursache** und **Klärungsstand**; Leichtform ist die
**Kurzstörung** im Betriebsjournal, eine Zeile, solange
kein Produkt-Stand sich falsch verhält. Der Übergang
Störung → Fix-Anforderung → Marke der Art Ändern bleibt
wie im Standardprozess.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §6
„Markenfreier Betriebsteil“; Kurzstörung:
`Betriebsjournal.md` §Meta

### Vorab-Sicherung

**English:** pre-run backup

Die Sicherung vor einem Lauf an einer Anlage, genannt
im Journal-Eintrag des Laufs; vor dem Abschalten einer
Umgebung benennt sie die Re-Inventur, und der
Deploy-Stand „abgebaut“ nennt sie in seinem Kopf.

**Verankert in:** mit RP-2 `Vorgehen-RP-2.md` §5
„Abschalt-Tor“; Feld `vorab_sicherung`:
`Betriebsjournal.md` §Meta
