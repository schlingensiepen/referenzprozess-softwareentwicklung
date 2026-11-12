---
type: process-brief
process: RP-2
status: ausgearbeitet
extends: [SP-1]
---

# RP-2 — IT-Infrastruktur

**Bearbeitungsstand:** 2026-11-11 (Ausarbeitung aus
realen Infrastruktur-Projekten; löst den Platzhalter ab)

**Was ich bin:** Referenzprozess für Vorhaben, deren
Ergebnis der **Zustand einer selbst betriebenen Anlage**
ist — installiert, konfiguriert, gehärtet, aktualisiert,
umgezogen oder abgebaut. Aufsetzend auf SP-1: meine
Regeln ergänzen und präzisieren SP-1 nur dort, wo eine
Anlage statt eines Software-Produkts das Ergebnis ist.
Aufbau und Betrieb laufen in einem Prozess, weil alle
Arbeitsarten an derselben Zielumgebung hängen und
ineinander übergehen (Störung → Änderung → neue
Betriebs-Anleitung). Der Vorgehensrahmen (Phasen mit
RP-2-Namen, Marken-Arten, Einstieg „Bestand erfassen“,
Tore, Prüfungen) liegt in [[Vorgehen-RP-2]] und erbt
von [[Vorgehen-SP-1]]; die typische Marke einer Anlage in
[[Marken-RP-2]], erbend von [[Marken-SP-1]].

**Kriterium „Wer betreibt?“:** Betreibt der Autor die
Anlage selbst, gilt RP-2. Werkzeuge für eine Anlage
(Abgleich-Werkzeug, Verwaltungsoberfläche,
Warteschlange) und Lieferungen an Dritte (verteiltes
Image, Pakete) sind Software — SP-1 bzw. RP-1 — mit der
Anlage als Zielumgebung, bei Bedarf mit einem
RP-2-Projekt daneben. Ein fremd gebautes Image betreibt
RP-2; Mängel am Image gehen als Meldung an das
Software-Projekt. Zugang nur über Anbieter-API oder
Portal ist RP-2 mit einer Zielumgebung ohne
Shell-Zugang; bei dominanter Vertragslast RP-11.
Ausführlich: [[Vorgehen-RP-2]] §1.

**Was ich kann:**

- Eine laufende Anlage ohne Projekt übernehmen: der
  Einstieg **„Bestand erfassen“** nimmt den Ist-Zustand
  lesend auf (Bestandsbericht ohne Stand), füllt die
  Zielumgebungen und lässt die Init-Fragen nebenbei
  laufen ([[Vorgehen-RP-2]] §4; Init-Angebot:
  `index.md` §5).
- Arbeitsarten über **Marken-Arten** abbilden —
  Aufbauen, Ändern, Aktualisieren, Abbauen — mit einer
  Matrix, welche Phasen je Art Pflicht sind; der Agent
  schlägt je Art Verzichte und Übernahmen vor
  ([[Vorgehen-RP-2]] §3, [[Marken-RP-2]]).
- Das **Rezept** (Skripte, Stack-, Konfig- und
  Pin-Dateien in `deploy/`) als Produkt der Marke taggen
  und je Zielumgebung einen Deploy-Stand bilden; jeder
  Lauf an einer Anlage steht im **Betriebsjournal**,
  auch der Wiederholungslauf ohne Änderung
  ([[Betriebsjournal]]).
- Zwei Nachweise trennen: **Testbericht** vor der
  Freigabe des Deploy-Stands (gleich wo geprüft) und
  **Abnahmeprotokoll** am Ziel nach dem Ausrollen
  ([[Abnahmeprotokolle]]; Grundsatz nach dem Zeitpunkt:
  [[Vorgehen-RP-2]] §2 Anmerkung P10/P13).
- Die Inbetriebnahme über ein **Tor** an der Freigabe
  der Betriebs-Anleitung sichern (Abnahme, Sicherung
  mit geprüftem Rückweg, Überwachung, zweiter Zugang,
  bei fremden Nutzern das Dienstblatt; Ausweg
  Einschränkung mit Frist) und den Abbau über ein
  **Abschalt-Tor** ([[Vorgehen-RP-2]] §5,
  [[Marken-RP-2]] §4).
- Jeden schreibenden Lauf an einer produktiven
  Umgebung an ein **Anwender-OK** binden —
  Entscheidungseintrag mit Wortlaut oder stehendes OK
  mit festem Rahmen; Ausführungsrolle Mensch oder Agent
  ([[Vorgehen-RP-2]] §5).
- Störungen mit Ursache und Klärungsstand führen,
  externe Abhängigkeiten mit Prüfdatum im Blick halten
  ([[Vorgehen-RP-2]] §6, [[Externe-Abhaengigkeiten]]).
- Den Betrieb einer Umgebung aus einem Software-Projekt
  übernehmen (Überführung): Start mit Übergabe-Punkt und
  Startprompt, Zielumgebung und Lieferbeziehung daraus
  ([[Vorgehen-RP-2]] §7).

**Was ich mitbringe:**

- **Fassaden** Abnahmeprotokolle (Nachweis-Register),
  Betriebsjournal (markenfreies Register je
  Zielumgebung) und Externe Abhängigkeiten
  (Entitäts-Register) — Deklaration unten,
  §„Mitgebrachte Fassaden“. Die SP-1-Register
  Zielumgebungen, Deployments, Testfälle, Testberichte
  und Fehlermeldungen und die SP-1-Dokumenttypen
  Deploy-Stand, Betriebs-Anleitung und Benutzer-Doku
  bringt RP-2 nicht neu mit, sondern **präzisiert** sie
  in ihren SP-1-Katalog-Einträgen und Fassaden-Metas
  (Block „RP-2-Präzisierung“; Liste: `index.md` §3.2).
- **ID-Präfixe** `ABN` (Abnahmeprotokoll) und `JNL`
  (Journal-Eintrag); Externe Abhängigkeiten tragen
  Namen, keine ID.
- **Entscheidungsarten** `eingriff-ok` und
  `stehendes-ok` für das Anwender-OK je Eingriff
  ([[Vorgehen-RP-2]] §5; die Basis führt die Arten als
  offene Liste).
- **Scaffolding-Vorlagen I1–I6** statt der
  SP-1-Vorlagen V3–V6 ([[Vorgehen-RP-2]] §4a).
- **Bausteine einzeln übernehmbar** für ein
  Software-Projekt, das den Betrieb behält
  (Überführungs-Frage, Antwort „behalten mit Bausteinen
  aus RP-2“ in [[Vorgehen-SP-1]] §2 Anmerkung P13): die
  erweiterten Felder der Zielumgebung
  (RP-2-Präzisierung in [[Katalog-Zielumgebungen]]),
  das Betriebsjournal ([[Katalog-Betriebsjournal]]),
  Prüfort je Testfall und Abnahmeprotokoll
  ([[Katalog-Testfaelle]] RP-2-Präzisierung,
  [[Katalog-Abnahmeprotokolle]]), das Inbetriebnahme-Tor
  ([[Katalog-Betriebs-Anleitung]] RP-2-Präzisierung).
  Übernommen wird
  der Katalog-Eintrag, gebucht wie beim Prozess-Merge;
  das Fassaden-Register führt jede übernommene Fassade
  als `Prozess-mitgebracht (RP-2)` ([[Zuschnitt-aendern]],
  Baustein-Übernahme).

## Mitgebrachte Fassaden

Was ein Typ ist (Zweck, Datei, Pflichtfelder), steht nur
in seinem Katalog-Eintrag — lesen bei Anlage oder
Pflege der Fassade. Die Einstufung steht hier; ob eine
Fassade aktiv ist, führt [[Fassaden]].

| Fassade | Status | Katalog-Eintrag | Einstufung |
|---|---|---|---|
| Abnahmeprotokolle | mandatory | [[Katalog-Abnahmeprotokolle]] | neu; Nachweis-Register neben [[Testberichte]] (SP-1) |
| Betriebsjournal | mandatory | [[Katalog-Betriebsjournal]] | neu; markenfreies Register je Zielumgebung |
| Externe Abhängigkeiten | mandatory | [[Katalog-Externe-Abhaengigkeiten]] | neu; Entitäts-Register, darf leer bleiben, bis ein Anbieter, ein Fremd-Image oder eine Annahme auftaucht |

RP-2 löst keine SP-1-Fassade ab. Die
RP-2-Präzisierungen an SP-1-Fassaden (Zielumgebungen,
Testfälle, Testberichte, Fehlermeldungen, Deployments)
gelten, sobald RP-2 aktiv ist; sie stehen als Block im
jeweiligen SP-1-Katalog-Eintrag bzw. `## Meta`.

## Mitgebrachte Ordner

Vom Prozess deklarierte Root-Ordner-Freigaben — beim
Merge als Freigabe-Buchung ins Entscheidungs-Register
übernommen (MasterPrompt §1.1); die Ordner entstehen
erst bei Bedarf (Scaffolding, [[Vorgehen-RP-2]] §4a).
RP-2 ersetzt die SP-1-Deklaration für sein Projekt:

| Ordner/Muster | Zweck | Einordnung |
|---|---|---|
| `deploy/` | **das Rezept** (P9): Skripte, Stack-, Konfig- und Pin-Dateien; Unterordner je Zielumgebung | Code-Bereich, lebend; Pflicht |
| `tests/` | Prüfwerkzeuge (Syntaxprüfung, Attrappen, Smoke-Test, Gleichlauf, Messskripte) | Code-Bereich, lebend; Test-Outputs flüchtig (Nachweis-Regel: [[Systemtest-Setup]] `## Meta`) |
| `src/` | eigener Werkzeug-Code | Code-Bereich, lebend; **nur, wenn eigener Werkzeug-Code entsteht**, sonst nicht angelegt |
| `docs/` | Kopien der selbsttragenden Doku-Stände: `docs/developer/` (Entwickler-Doku), `docs/user/` (Dienstblatt), `docs/ops/` (Betriebs-Anleitung) | **Ableitungs-Schicht** wie in SP-1 (`index.md` §4.11 von SP-1) |
| `overview/` | Ist-Aufnahmen (Bestandsbericht, Re-Inventur) und Prüfprotokolle mit Datum | Analyse-Ablage, lebend |
| — | **kein `ci/`**: Pipelines, Bauen, Paketierung und Veröffentlichung in der Registry gehören zum Software-Projekt, das Image oder Paket erzeugt; RP-2 bezieht das Ergebnis per gepinnter Version und prüft sein Rezept mit den Werkzeugen aus `tests/` | — |

Das Wort **„deploy“** bezeichnet in RP-2 den Ordner des
Rezepts; die Phase P13 heißt weiterhin „Ausliefern“ und
ihr Stand „Deploy-Stand“ — ausgeliefert wird das Rezept
in eine Umgebung, der Deploy-Stand hält fest, was dort
gilt.

## Mitgebrachte Präfixe

_(Führender Deklarations-Ort — beim Prozess-Merge
liest der Agent diese Sektion, Wiki.md §11.3
Schritt 6.)_

RP-2 führt die SP-1-Commit-Präfixe fort und bringt
**keine eigenen Commit-Präfixe** mit: Änderungen am
Rezept in `deploy/` und an den Prüfwerkzeugen in
`tests/` laufen unter `Code:`, Änderungen an den
RP-2-Registern (Abnahmeprotokolle, Betriebsjournal,
Externe Abhängigkeiten) unter dem Basis-Präfix `Wiki:`.
Die ID-Präfixe `ABN` und `JNL` stehen in den
Katalog-Einträgen der Fassaden.

## Mitgebrachte Mechanik

_(Führender Deklarations-Ort, Wiki.md §11.3
Schritt 7.)_

RP-2 bringt **keine eigenen `internal-*`-Mechanik-Knoten**
mit. Die SP-1-mitgebrachten Knoten
([[Register-Lebenszyklus]], [[Meilenstein-und-T2]],
[[Register-Grundmuster]], [[devstate-Skelett]]) gelten
unter RP-2 unverändert weiter; die RP-2-Betriebs-Mechanik
(Marken-Arten, Einstieg, Tore, Anwender-OK, Prüfungen,
Wächter-Anlässe) liegt in [[Vorgehen-RP-2]] und
[[Marken-RP-2]] und in den RP-2-Präzisierungen der
SP-1-Fassaden-Metas.

## Mitgebrachte Begriffe

_(Führender Deklarations-Ort — beim Prozess-Merge
übernimmt der Agent die Einträge des Glossar-Anhangs
in `wiki/Glossar.md` des Projekts, Wiki.md §11.3
Schritt 2, „Glossar-Anhang“.)_

RP-2 bringt den Glossar-Anhang `Glossar-Anhang-RP-2.md`
(`wiki/` des Prozess-Ordners) mit — die Begriffe des
Betriebs einer Anlage, die nur RP-2 benutzt, von
„Abnahmeprotokoll“ bis „Vorab-Sicherung“; die Begriffe
von SP-1 (`Glossar-Anhang-SP-1.md`) kommen über die
Erbschaft mit. Die Einträge
gelten als freigegeben mit dem Template-Stand; der
Anhang selbst wird nicht ins Projekt kopiert. Ein
vorhandener Eintrag gleichen Namens wird nicht
überschrieben, sondern dem Anwender vorgelegt.

**Setzt voraus:** SP-1 (Standardprozess
Entwicklungsprojekt, siehe
[SP-1-Steckbrief](../SP-1-Standardprozess/Steckbrief.md)).

**Zur Abgrenzung:** Übernahme eines laufenden Bestands
ist der Einstieg in RP-2, nicht RP-5 (dort: ein Projekt
mit Artefakten, hier eine laufende Anlage ohne Projekt).
Datenübertragung beim Umzug deckt die Marken-Art
Abbauen; eine große Datenmenge ist ein eigenes
RP-6-Projekt, RP-2 baut danach ab. Hardware erscheint nur
als Attribut der Zielumgebung (RP-10 bleibt getrennt).
Dienste mit dominanter Vertragslast → RP-11.

**Volle Definition:** [[index]]
