# Referenzprozesse — Vorgehens-Pakete für Projektarten

> **Herkunft:** abgeleitet aus `../Wiki.md` (Abschnitt
> 11), `../MasterPrompt.md` (Abschnitte 1, 5.1.2, 9.1),
> `../Vorgehen.md` (Abschnitte 7a, 8), `../INIT.md`
> (Fragen-Block Nr. 1, Schritt 4),
> `../migration/MIGRATION.md` (Phase 1 Nr. 1), dem
> vorbereiteten `../wiki/` (`Aktivierter-Prozess.md`,
> `Init-Choreografie.md`, `Kettenpruefung.md`,
> `Vorgehen-SP-1.md`, `Vorgehen-RP-1.md`,
> `Marken-SP-1.md`, `Marken-RP-1.md`), den Steckbriefen
> `../referenzprozesse/*/Steckbrief.md` und
> `../referenzprozesse/SP-1-Standardprozess/index.md`
> (Rollen). Stand der Quellen: Starter-Commit `2017c75`
> (Version 2.1). Dieses Dokument ist aus den Quellen
> abgeleitet und wird bei Änderungen der Quellen auf
> deren Stand nachgezogen (zuletzt am 2026-11-03);
> eigene Inhalte bekommt es nicht — Änderungen gehören
> in die Quellen.

Zurück zur [Einführung](Einfuehrung.md).

## Was ein Prozess ist

Die Basis der Vorlage ist bewusst domänen-neutral. Ein
**Referenzprozess** ergänzt sie um das, was eine
bestimmte Projektart braucht — als geschlossenes Paket,
das ins Wiki eingespielt wird. Die Basis bleibt
schlank; jeder Prozess ergänzt lokal.

**Standardprozesse** (SP) sind eigenständige
Grundlagen für eine Domäne; **Referenzprozesse** (RP)
bauen auf genau einem Standardprozess auf und
präzisieren ihn für einen Anwendungsfall. Mehr als eine
Basis hat ein Prozess nicht — das hält das Einspielen
einfach.

Ein Prozess-Paket liegt in
`_template/referenzprozesse/<PROZESS>/` und enthält:

- **`Steckbrief.md`** — die Selbstvorstellung mit festem
  Aufbau: „Was ich bin / Was ich kann / Was ich
  mitbringe / Setzt voraus / Volle Definition“. Hier
  stehen Kennung, Basis-Prozess und Ausbau-Stand
  (ausgearbeitet oder geplant) sowie die
  Deklarationen: mitgebrachte Fassaden mit Einstufung
  Pflicht/optional, mitgebrachte Ordner (gelten als
  freigegeben), Commit-Präfixe, Mechanik-Knoten.
- **`index.md`** — die vollständige Beschreibung des
  Prozesses: Positionierung, Instanzen der
  Basis-Mechanismen, eigene Mechanismen, Rollen,
  Vorwahlen, die prozess-spezifischen Fragen beim
  Start.
- **`bootstrap/`** — Einmal-Anweisungen je Fassade, die
  der Agent beim Aktivieren aus der Template-Quelle
  abarbeitet und nie ins Projekt kopiert.
- **`wiki/`** — das Teil-Wiki: Fassaden-Skelette,
  Katalog-Einträge für die mitgebrachten Typen und das
  prozess-eigene Vorgehen `Vorgehen-<Prozess>.md` samt
  Marken-Dokument `Marken-<Prozess>.md`.

Ein zentrales Prozess-Verzeichnis gibt es nicht: die
Steckbriefe ersetzen es. Ein neuer Prozess ist ein neuer
Ordner, sonst nichts.

## Was in diesem Starter schon eingespielt ist

Der Starter liefert sein `wiki/` mit zwei bereits
eingespielten Prozessen: dem **Standardprozess
Entwicklungsprojekt (SP-1)** und darauf der
**Entwicklung eines Softwaresystems (RP-1)** — im
Ordner `referenzprozesse/` heißen die Pakete
`SP-1-Standardprozess/` und `RP-1-Systementwicklung/`.
Das Einspielen (der Merge, unten) ist im Starter schon
vollzogen; der Regel-Knoten `wiki/Aktivierter-Prozess.md`
bucht die Vorfestlegungen: aktive Prozesse Basis, SP-1,
RP-1; die aktiven Commit-Präfixe des Prozesses; die
mitgebrachten Mechanik-Knoten; die Abweichung von der
Basis-Vorauswahl (Aktenzeichen deaktiviert). Beim
Projektstart gibt es deshalb kein Prozess-Angebot und
keine Fassaden-Auswahl.

Was SP-1 mitbringt: Register für Anforderungen,
Funktionsbeschreibungen, Spezifikationen,
Fehlermeldungen, Testfälle, Testberichte, Deployments,
die Systemarchitektur mit ihren Komponenten, die
Zielumgebungen, das Systemtest-Setup und — optional, bei
einem Schnitt in Komponenten — den Contract-Index (ein
**Contract** ist eine zwischen Komponenten vereinbarte
Schnittstelle); dazu ein Vorgehen mit
Scaffolding-Vorlagen, Meilensteinen und der Kette der
Pflicht-Stände — darin die drei Doku-Stände
Entwickler-Doku, Benutzer-Doku und Betriebs-Anleitung,
die für Leser ohne Zugang zum Projekt geschrieben sind
(siehe
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
„Dokumentation“). Die Rollen Koordinator, Komponente und
Standalone gibt es schon mit SP-1. RP-1 löst einige
SP-1-Fassaden durch software-spezifische ab
(Softwaresystemarchitektur statt Systemarchitektur,
Softwaresystemtest-Setup statt Systemtest-Setup — die
abgelösten liegen deaktiviert im Wiki und verweisen auf
ihre Nachfolger) und präzisiert für Software: die Rolle
je Komponente in der Architektur, die Aushandlung von
Contracts, den Ablauf des Tag-Setzens und die Sprachen
der Artefakte (Code und daraus erzeugte API-Doku
Englisch; die Benutzer-Doku projekt-primär Deutsch,
weitere Sprachen auf Aufforderung; der erklärende Text
der Entwickler-Doku in der Projektsprache — die
API-Doku ist Teil der Entwickler-Doku, nicht ihr
Ersatz); Bedarfe und Szenarien haben mit RP-1 die Form
der User-Story und des Use Case. Die vollständige Beschreibung steht je
Prozess in `../referenzprozesse/<PROZESS>/index.md`.

## Welche Prozesse es sonst gibt

Der Starter weiß, dass es andere Referenzprozesse gibt;
sie liegen in `_template/referenzprozesse/` als
Nur-Lese-Quelle. Die Tabelle zeigt, was in diesem Stand
im Ordner liegt; der Agent legt sie dir nicht als
Auswahl vor — nennst du einen Prozess, richtet er ihn
ein:

| Kennung | Name | Basis | Ausbau-Stand |
|---|---|---|---|
| SP-1 | Standardprozess Entwicklungsprojekt — für alle Entwicklungsdomänen (Software, Hardware, System), eigenständig oder als Grundlage | — | ausgearbeitet |
| RP-1 | Entwicklung eines Softwaresystems mit mehreren Komponenten und Contracts | SP-1 | ausgearbeitet |
| SP-2 | Recht und Verwaltung — rechts- und verwaltungsbezogene Vorgänge | — | geplant |
| RP-3 | Rechtsfall — individueller Rechtsfall mit Aktenzeichen und Fristen | SP-2 | geplant |
| RP-4 | Steuerfall — Steuererklärung, Betriebsprüfung, Einspruch | SP-2 | geplant |
| SP-3 | Publikation — wissenschaftliches, journalistisches, redaktionelles Publizieren | — | geplant |
| SP-4 | Studie und Forschung — empirische Studien von der Hypothese bis zur Ergebnis-Dokumentation | — | geplant |
| RP-7 | Sozialforschung mit offenen Fragebögen | SP-4 | geplant |
| SP-5 | Kaufmännische Prozesse — Angebote, Ausschreibungen, Vergabe, Beauftragung, Rechnungslegung | — | geplant |
| RP-8 | Angebot — Erstellung und Verwaltung von Angeboten | SP-5 | geplant |
| RP-9 | Vergabe — Ausschreibung, Vergleich, Zuschlag aus Sicht des Vergebenden | SP-5 | geplant |
| RP-2 | IT-Infrastruktur — Aufbau und Betrieb der eigenen Infrastruktur | SP-1 | geplant |
| RP-5 | Altprojekt-Übernahme — Ist-Aufnahme und Weiterführung eines bestehenden Projekts | SP-1 | geplant |
| RP-6 | Datenmigration — Übertragung von Datenbeständen mit Schema-Mapping und Cut-over | SP-1 | geplant |
| RP-10 | Hardwareentwicklung — mechanische, elektronische, mechatronische Komponenten | SP-1 | geplant |
| RP-11 | Cloudanwendung — Nutzung externer Cloud-Dienste mit dominanten Vertragsaspekten | SP-1 | geplant |
| RP-12 | Datenreport und Dashboard — Aufbau auf bestehender Reporting-Plattform | SP-1 | geplant |

**Geplant** heißt: Der Steckbrief liegt vor, die
Ausarbeitung (Fassaden, Typen, Vorgehen) folgt in einer
späteren Version. Wählst du einen geplanten Prozess,
sagt der Agent das an, und das Projekt arbeitet
zunächst nur mit der Basis — kein Einspielen, kein
Zusatz-Angebot. Dasselbe gilt, wenn die Basis eines
Referenzprozesses noch geplant ist.

## Die Prozess-Nachfrage

Der Starter bietet keine Prozess-Liste an. Stattdessen
fragt der Agent nach, wenn der Software-Prozess nach
allem, was er weiß, nicht zum Vorhaben passt oder er
nicht sicher ist — in drei Situationen:

- **beim Projektstart**, aus deinem Aufruf, den Dateien
  im Ordner oder deiner Mission;
- **beim Start einer Komponente** per Startprompt eines
  Koordinators — der Startprompt gibt den Prozess der
  Komponente nicht vor, auch wenn der Koordinator
  selbst mit dem Software-Prozess arbeitet;
- **bei der Migration** eines Projekts ohne
  Software-Bezug (kein Code, keine
  Software-Anforderungen, keine Architektur).

Die Frage lautet: „Bist du sicher, dass das der
richtige Prozess ist? Ich erkenne nicht, dass er zum
Vorhaben passt — willst du mir einen anderen nennen?“
Bleibst du beim Software-Prozess, geht es damit weiter.
Nennst du einen anderen Prozess, richtet der Agent das
Projekt mit diesem Prozess aus dem Regelwerk im Starter
ein: Das vorbereitete Software-Wiki wird durch das
Basis-Wiki und das Paket des gewählten Prozesses aus
`_template/referenzprozesse/` ersetzt (Merge, unten) —
bei einem nur geplanten Prozess allein durch das
Basis-Wiki (oben, „Geplant“); von den Schritten des
Starts entfällt, was RP-1 oder
SP-1 voraussetzt (etwa die Rolle und der
Contract-Index); Herkunfts-Vermerk, erste Marke,
`Tools.md`, Instruktionsdatei und die übrigen
Buchungen bleiben. Der Starter bleibt in beiden Fällen
`_template/` — es entsteht kein zweiter Starter, nur
ein anderer Weg innerhalb des einen.

Die allgemeine Vorlage, aus der der Starter stammt,
bietet der Agent dabei nicht an.

## Einspielen (Merge)

Im Starter sind SP-1 und RP-1 so eingespielt; dasselbe
tut der Agent, wenn du einen anderen Prozess nennst
oder später einen ergänzt. Das
Einspielen ist eine **Standardaufgabe** — ohne weitere
Rückfrage, mit eigenem Commit (Präfix
`Prozess-Merge:`). Die Kette wird Basis-zuerst
aufgelöst (bei RP-1: Basis → SP-1 → RP-1). Je Prozess:

- die Fassaden-Skelette und Katalog-Einträge aus dem
  Teil-Wiki werden ins Projekt-`wiki/` kopiert und die
  neuen Typen im Katalog verankert;
- deklarierte Ordner gelten als freigegeben (der Ordner
  selbst entsteht erst bei Bedarf);
- löst ein Element ein Basis-Element ab, geschieht das
  **unter neuem Namen**: die alte Fassade wird
  deaktiviert und verweist auf die neue, der alte Typ
  gilt als abgelöst — nie wird still überschrieben;
- Pflicht-Fassaden des Prozesses werden aktiv,
  optionale bleiben deaktiviert bis zum Zuruf; für jede
  aktive Fassade arbeitet der Agent die
  Einmal-Anweisung ab;
- Commit-Präfixe und Mechanik-Knoten des Prozesses
  werden eingetragen, bestehende Zeiger umgestellt;
  Kollisionen mit vorhandenen Knoten legt der Agent dir
  vor, statt zu überschreiben;
- die FassadenLandkarte und der Regel-Knoten
  „Aktivierter Prozess“ werden nachgeführt.

Dateinamen sind über Basis und alle Prozesse disjunkt;
gleichnamige Dateien ohne ausdrückliche Ablösung sind
ein Fehler, der das Einspielen abbricht.

Danach gehören die Prozess-Artefakte zum Projekt-Wiki
und werden wie Basis-Wiki behandelt — lebend, von der
Vorlage entkoppelt.

## Später hinzufügen oder wechseln

Du kannst jederzeit einen Prozess ergänzen („Aktiviere
RP-2 auf diesem Repo“) oder wechseln („Wechsele auf
SP-5“) — außer während einer Zwischenmarke (siehe
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md)):
dann verweist der Agent auf die Zeit nach der Rückkehr
zur zurückgestellten Marke. Der Agent spielt das Paket
ein wie oben und **migriert** bestehende Einträge, deren
Typ oder Fassade abgelöst wird: automatisch, wo das
ablösende Element klare Regeln dafür mitbringt; Lücken
sammelt er und legt sie im Frage-Block vor („Knoten X
hat kein Feld für den Technologie-Stack — was gehört
hier hin?“). Commit mit Präfix `Prozess-Upgrade:`.
Wurden dabei bestehende Einträge migriert, folgt ohne
Angebot das zweistufige Absicherungs-Review (siehe
[Arbeitsweise](Arbeitsweise.md), „Prüfungen und
Recherche“); ein reines Hinzufügen ohne Migration
bekommt das normale Review-Angebot.

Quelle ist immer `_template/referenzprozesse/`, also
der Stand des Starters, den dein Projekt gerade
angebunden hat. Enthält er den gewünschten Prozess
noch nicht (oder nur als Platzhalter), hebst du zuerst
den Starter an — den Austausch von `_template/`
erledigt dabei der Agent (siehe [Upgrade](Upgrade.md)).
Für den Agenten ist dieser Ordner Nur-Lese; zulässig
sind nur das Lesen der Steckbriefe und das Lesen als
Quelle beim Einspielen — und der Austausch der ganzen
Quelle beim Anheben.

**Kein Rollback.** Eine Prozess-Wahl ist ein
irreversibler Struktur-Vorgang: git trägt die Historie,
aber die Ablösungen im Wiki werden nicht automatisch
zurückgenommen. Wer einen Prozess loswerden will, tut
das als neuen Schritt — Wechsel auf einen anderen
Prozess oder Deaktivierung der Fassaden von Hand.

## Das prozess-eigene Vorgehen

Jeder Prozess bringt `Vorgehen-<Prozess>.md` mit — im
Starter liegen `wiki/Vorgehen-SP-1.md` und
`wiki/Vorgehen-RP-1.md`. Es verweist für die
Grundregeln auf `../Vorgehen.md`, **belegt** die Phasen
mit eigenen Namen und Artefakten, **bindet**
Recherche-Themen, Prüfungen und Scaffolding-Vorlagen an
Phasen (als eine Tabelle „Angebote an Phasen“ mit Typ
R, M oder V), präzisiert die Überholt-Regel und
dokumentiert Abweichungen (weggelassene, neue,
umbenannte Phasen). Ein RP erbt das Vorgehen seines SP
und präzisiert es für seine Domäne.

Daneben bringt jeder Prozess `Marken-<Prozess>.md` mit
(`wiki/Marken-SP-1.md`, `wiki/Marken-RP-1.md`): welche
Marke in dieser Projektart typisch ist — bei SP-1 eine
ausgelieferte Ausbaustufe, bei RP-1 ein **Release**,
dessen Produkt der Code mit seinen automatisierten
Tests ist —, wie geschnitten und benannt wird (ein
Hotfix nach dem Abschluss ist eine Patch-Marke, ein
Deploy desselben Tags in eine weitere Umgebung ein
Nachtrag, kein neuer Release). Es baut auf dem
Basis-Knoten `wiki/Marken.md` auf, der die Marke als
Zwischenziel-Anker jeder Projektart erklärt (siehe
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
„Zielmarken“). Daraus schlägt der Agent beim
Projektstart „1.0“ als erste Marke vor. Geplante
Prozesse tragen bis zur Ausarbeitung eine Vormerkung
„Typische Marke“ in ihrem Steckbrief. Prozesse ohne
Setup-Charakter (reine Dokumenten-Prozesse) lassen das
Scaffolding weg und sagen das.

Klärungen zur Anwendung des Prozesses in deinem Projekt
werden als Entscheidungen gebucht. Befunde, die den
Prozess oder den Starter selbst verbessern würden, hält
der Agent als Ideen-Eintrag in deinem Projekt fest; in
`_template/` schreibt er nicht. Gemeldet werden sie als
Issue im GitHub-Repo des Starters
(https://github.com/schlingensiepen/referenzprozess-softwareentwicklung/issues);
die `../README.md` nennt den Kanal unter „Template
aktualisieren“.
