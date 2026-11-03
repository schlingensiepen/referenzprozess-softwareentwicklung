# Stände, Freigaben und Marken

> **Herkunft:** abgeleitet aus `../Vorgehen.md`
> (Abschnitte 1 bis 5 und 7a), `../MasterPrompt.md`
> (Abschnitte 1.5 und 6.4), `../Wiki.md` (Abschnitt
> 3a), `../upgrade/UPGRADE.md` (Grundsätze) und dem
> vorbereiteten `../wiki/` (`Vorgehen-RP-1.md`
> Abschnitt 2 für die Phasentabelle,
> `Vorgehen-SP-1.md`, `Einfrieren-und-Abloesen.md`,
> `Kettenpruefung.md`, `Zielmarken.md`, `Marken.md`,
> `Marken-SP-1.md`, `Marken-RP-1.md`,
> `Katalog-Abschluss-Stand.md`, `Entscheidungen.md`,
> `Fehlermeldungen.md`, `Anforderungen.md`,
> `Deployments.md`, `Katalog-Deploy-Stand.md`,
> `Katalog-Deployments.md`, `Katalog-Fehlerstand.md`,
> `Katalog-Entwickler-Doku.md`, `Katalog-Benutzer-Doku.md`,
> `Katalog-Betriebs-Anleitung.md`,
> `Lebenslauf-eines-Stands.md`,
> `Meilenstein-und-T2.md`, `Katalog-Release-Notes.md`,
> `Glossar.md`), `../Reviewmuster.md` (Muster M6) sowie
> `../referenzprozesse/SP-1-Standardprozess/index.md`
> (Glieder der Kette). Stand der Quellen:
> Starter-Commit `3a32dbd` (Version 2.1). Dieses
> Dokument ist aus den Quellen abgeleitet und wird bei
> Änderungen der Quellen auf deren Stand nachgezogen
> (zuletzt am 2026-11-03); eigene Inhalte bekommt es
> nicht — Änderungen gehören in die Quellen.

Zurück zur [Einführung](Einfuehrung.md).

## Phasen sind ein Angebot

Das Vorgehen ordnet Projektarbeit in **Phasen** mit je
einem Ergebnis-Artefakt. Die Phasen zwingen zu nichts:
Du darfst in beliebiger Reihenfolge arbeiten, eine
Technologie erproben, bevor die Architektur steht, oder
den Betrieb planen, bevor die Ausarbeitung fertig ist.
Das Modell ist eine Checkliste — der Agent fragt „hast
du das schon bedacht?“, und du antwortest „ja, dort“,
„nein, überspringen“ oder „machen wir jetzt“.

Die Belegung der Phasen P1 bis P15 mit dem
Software-Prozess dieses Starters (so, wie
`wiki/Vorgehen-RP-1.md` sie festlegt):

| Phase | Aktivität | Ergebnis-Artefakt |
|---|---|---|
| P1 | Konzipieren | Konzept-Stand, mit User-Stories und Use Cases |
| P2 | Stand der Technik erfassen | Stand-der-Technik-Bericht: Referenzarchitekturen, verfügbare Bibliotheken und Frameworks, Standards |
| P3 | Anforderungen sammeln | Anforderungen-Stand aus dem Register Anforderungen; User-Stories und Use Cases fließen als Quellen ein |
| P4 | Beschreiben der Funktion | Funktionsbeschreibung-Stand aus dem Register Funktionsbeschreibungen |
| P5 | Zerlegen in Bausteine | Architekturdokument aus der Softwaresystemarchitektur, mit dem Komponenten-Schnitt und dem Architekturmuster als eigener Wahl |
| P6 | Starten von Teilaktivitäten | Übergabe je Komponente; Komponenten-Repositories mit Start-Tabelle und Startprompt |
| P7 | Auswählen der Technologie | Technologie-Entscheidungen: Sprachen und Runtime-Version, Werkzeugkette, Lizenzen |
| P8 | Spezifizieren | Spezifikation-Stand — die Bauanleitung nach Schnitt und Technologie-Stack, umsetzbar ohne Fachkenntnis; entsteht dort, wo gebaut wird |
| P9 | Ausarbeiten | die Implementierung mit Unit-Tests und automatisierten Integrationstests — das Produkt; Glied der Kette ist der Tag |
| P10 | Testen | Testplan mit den nicht automatisierbaren Anteilen, aus den Testfällen; Testberichte |
| P11 | Dokumentieren für Entwickler | Entwickler-Doku als selbsttragender Stand, Kopie in `docs/developer/`: Aufbau, Entscheidungen, Einstieg und Build; die aus Code-Kommentaren erzeugte API-Doku ist Teil davon |
| P12 | Dokumentieren für Benutzer | Benutzer-Doku als selbsttragender Stand, Kopie in `docs/user/` |
| P13 | Ausliefern | Deploy-Stand je Zielumgebung; dazu die CI-Pipeline-Konfiguration |
| P14 | Produzieren | Bereitstellen und Konfigurieren der Zielumgebung — bei Standard-Software oft weitgehend durch den Deploy-Stand abgedeckt |
| P15 | Betreiben | Betriebs-Anleitung je Umgebung als selbsttragender Stand, Kopie in `docs/ops/`, aus dem Deploy-Stand; Fehlermeldungen aus dem Betrieb laufen fortlaufend ins Register |

Phasen heißen nach der **Tätigkeit** („Zerlegen in
Bausteine“, nicht „Zerlegung“), weil die Tätigkeit sagt,
was getan wird, während ein Substantiv offen lässt, ob
Ergebnis oder Handlung gemeint ist. Vor den Phasen steht
meist eine Zieldefinition, die im Mission Statement
landet. Wer ein Projekt aus Version 1.x anhebt, findet
die Phasen neu nummeriert — P8 „Spezifizieren“ ist in
2.0 neu, die früheren P8 bis P12 sind um eins
verschoben (siehe [Upgrade](Upgrade.md), „Der Sprung
von 1.x auf 2.0“).

„Stand aus den Elementen“ heißt: Der Inhalt einer Phase
entsteht als Einträge eines Registers im `wiki/` (die
**Elemente**), und der Stand ist das daraus abgeleitete
Dokument in `output/` — der Stand ist das Dokument, die
Elemente sind sein Inhalt (unten, „Was ein Stand ist“).
Die drei **Doku-Phasen** P11, P12 und P15 bringen
Stände hervor, die ohne das Wiki lesbar sind — für
Entwickler, Benutzer und Betreiber des Produkts. Die
beiden Doku-Phasen für Entwickler und Benutzer liegen
**vor** der Auslieferung, damit die Ordnung der
Freigaben sichert, dass die Dokumentation vorliegt, wenn
ausgeliefert wird; die Betriebs-Anleitung folgt der
Auslieferung, weil sie daraus entsteht. Ob und in
welcher Form eine Marke ihre Dokumentation erhält,
entscheidet die **Doku-Abfrage** (unten,
„Dokumentation: Entwickler-Doku, Benutzer-Doku,
Betriebs-Anleitung“).

**Wer aus Version 2.0 der Vorlage kommt:** Dort gab es
die Doku-Phasen noch nicht, und die letzten Phasen
trugen andere Nummern — Ausliefern war P11, Produzieren
P12, Betreiben P13; P1 bis P10 sind unverändert.
Freigaben nennen immer Nummer **und** Tätigkeit („für
P13 Ausliefern“), und eingefrorene Einträge aus der Zeit
vor dem Anheben bleiben, wie sie sind: Der Lint liest
ihren Zweck am Tätigkeitsnamen („für P11 Ausliefern“
ist die Auslieferung, „für P13 Betreiben“ der Betrieb),
nicht an der Nummer. Die Zuordnung der alten zu den
neuen Nummern vermerkt das Anheben im Herkunfts-Vermerk
deines Projekts (`wiki/Aktivierter-Prozess.md`,
Abschnitt „Herkunft“, unter der Zeile „Vorher“); die
Tabelle selbst steht in der Upgrade-Anleitung dieses
Starters, `../upgrade/2.0-nach-2.1.md` (siehe
[Upgrade](Upgrade.md), Schritt 6).

**Phasen ordnen Freigaben, nicht Arbeit.** Ein Eintrag
in einem Register (eine Anforderung, eine
Technologie-Entscheidung, ein Testfall) darf jederzeit
entstehen und angenommen werden, sobald du ihn weißt.
Geordnet ist allein, in welcher Reihenfolge die
**Stände** der Phasen freigegeben werden.

**Was ein kleines Projekt davon braucht.** Mit dem
Software-Prozess trägt fast jede Phase einen
Pflicht-Stand (unten, „Pflicht oder optional“), jeder
davon mit Kettenprüfung durch einen Prüfer vor der
Freigabe, dazu Tag und Abschluss-Stand. Für ein kleines
Werkzeug hast du zwei Wege, das zu dosieren: Phasen,
die du nicht brauchst, lässt du je Marke per
**Verzicht** aus (unten, „Kettenprüfung“; bei der
Dokumentation ist der Verzicht eine Antwort in der
Doku-Abfrage), und die Spezifikation darf in kleinen
Projekten schmal bleiben.
Zielmarken führt jedes Projekt; zu jeder Marke gehören
der **Tag**, der das Produkt der Marke markiert, und
beim Abschluss der **Abschluss-Stand**, der nur auf
Vollständigkeit geprüft wird. Wer beim Start einen
anderen, nur geplanten Prozess wählt, arbeitet mit der
Basis allein: dann verlangt die Vorlage keine
Phasen-Stände und prüft keine Kette, Stände und
Freigaben bleiben ein Angebot, und der Tag wird vom
Abschluss-Stand geführt und mit dessen Freigabe
bestätigt.

## Was ein Stand ist

Lebendes Wissen im Wiki ändert sich fortlaufend. Wenn
sich jemand darauf verlassen soll, wird daraus ein
**Stand** gebildet: ein abgeleitetes Dokument in
`output/`, versioniert, eingefroren, zu genau einer
Zielmarke gehörend. Freigegeben wird immer ein Stand,
nie die lebende Fassade und nie ein einzelner Eintrag.

- **Dreiklang je Register:** die Fassade (lebend) → ihre
  Elemente (die einzelnen Einträge; eingefroren, sobald
  sie angenommen sind) → der Stand je Dokumenttyp
  (abgeleitet, in `output/`). Der Stand ist das
  Dokument, die Elemente sind sein Inhalt. Ein Stand
  filtert oft mehrere Register; ein Register speist
  mehrere Stände.
- **Zwei Grade.** Ein Stand ist entweder
  **wiki-verweisend** — die Regel: er verweist auf
  seine Elemente und ist nur mit dem Wiki vollständig
  lesbar, sein Leser hat Zugang zum Projekt — oder
  **selbsttragend**: am Stück lesbar für Leser ohne
  Wiki-Zugang, ohne Wikilinks und Register-Kennungen,
  mit ausgeschriebenen Begründungen. Selbsttragend sind
  mit SP-1 die drei Doku-Stände Entwickler-Doku,
  Benutzer-Doku und Betriebs-Anleitung; sie verweisen
  auf keine Elemente, sondern sind aus eingefrorenen
  **Quell-Ständen** ausformuliert (unten,
  „Dokumentation“). Welchen Grad ein Dokumenttyp hat,
  steht in seinem Katalog-Eintrag.
- **Offen, dann eingefroren.** In den beschreibenden
  Registern eines Prozesses (mit SP-1
  Funktionsbeschreibungen, Architektur, Spezifikationen,
  Testfälle, Deployments) legt der Agent einen Eintrag
  als `offen` im Wiki an — mit seinem Vorschlag und den
  offenen Punkten im Eintrag selbst. Solange ein
  Eintrag offen ist, ändert eine Klärung mit dir ihn
  direkt; eingefroren wird er durch **Annahme**:
  einzeln, wenn andere Arbeit darauf baut (du sagst
  „ja, so“), oder gesammelt mit der Freigabe des ersten
  Stands, der ihn verweist. Entscheidungen und Contracts
  kommen dagegen erst mit deinem OK ins Register und
  sind ab dann eingefroren; nur dort liegen Entwürfe
  außerhalb des Wikis.
- **Freigegeben wird nur aus Eingefrorenem.** Elemente
  werden im Stand **verwiesen**, nicht kopiert; jede
  Kennung im Text eines Stands ist ein Verweis. Was bei
  der Vorlage noch offen ist, nimmt der Agent mit der
  Freigabe an — damit ist es eingefroren. Lebende
  Quellen (Glossar-Einträge, Rollen, Konzepte, das
  Mission Statement) werden neben dem Stand in einen
  Ordner `output/<Ketten-ID>_VV_TLA/` (der Dateiname
  des Stands ohne Endung; die Ketten-ID ist der Teil
  des Namens vor der Version, der über alle Versionen
  gleich bleibt) **kopiert**, als Kopie gekennzeichnet
  und unveränderlich. Ein selbsttragender Stand braucht
  keine Kopien: Er trägt alles im Text.
- **Ableitungsprüfung.** Vor der Bildung legt der Agent
  vor, was dazugehört, aber noch nicht angenommen ist —
  je Punkt: annehmen, weglassen (im Kopf des Stands
  ausgewiesen) oder „trotzdem alles“ (dann ist es eine
  Momentaufnahme, nicht freigabefähig). Für offene
  Einträge der beschreibenden Register darf die Annahme
  im Freigabe-Zug liegen: Die vorgelegte Version
  verweist sie wie angenommene und weist sie im Kopf
  aus („Offen (Annahme im Freigabe-Zug)“).
- **Herkunftszeile.** Jeder Stand trägt im Kopf die
  Marke, das Datum seiner Bildung, den Zweck und die
  Vorgänger-Stände mit Version (wo die Kette es
  verlangt, auch den Tag der Implementierung und den
  Testbericht — in jeder Domäne mit Prozess, nicht nur
  bei Software); ein selbsttragender Stand nennt dort
  die Quell-Stände, aus denen er ausformuliert ist.
- **Name.** Ein Stand heißt nach dem Schema für
  `output/` (`<Datum> - <Dokumentname>[ - <Gegenstand>]_VV_TLA.md`),
  ohne Absender und Empfänger — sie treffen bei einem
  Stand nicht zu —; die Marke steht nur im Kopf, nicht
  im Namen. Gibt es zu einer Marke mehrere Stände eines
  Typs (ein Deploy-Stand oder eine Betriebs-Anleitung je
  Umgebung, eine Übergabe je Komponente), steht der
  Gegenstand im Namen. Status-Wörter wie „Entwurf“,
  „final“ oder „freigegeben“ gehören nicht in den Namen:
  Der Name bleibt über alle Versionen gleich, ein solches
  Wort bliebe für immer stehen; ob und wofür ein Stand
  freigegeben ist, steht nur im Freigabe-Eintrag.
- **Voll-Stand.** Ein Stand zu Marke M beschreibt das
  ganze Produkt zu M, einschließlich weiter gültiger
  Elemente früherer Marken; den Zuwachs zeigen
  optionale Release-Notes.
- **Pflicht oder optional.** Pflicht-Stände braucht der
  Prozess (ihr Zweck ist die Phase); optionale Stände
  beauftragst du mit freiem Zweck (Versand, Anwender-Test,
  Auftrag an einen Unteragenten). Mit dem
  Software-Prozess tragen P1, P3 bis P8, P10 bis P13
  und P15 einen Pflicht-Stand (die Übergabe P6 nur beim
  Schnitt in Komponenten, der Deploy-Stand P13 und die
  Betriebs-Anleitung P15 je Zielumgebung); P9 ist der
  Tag; P2 und P14 tragen keinen Pflicht-Stand; zum
  Marken-Abschluss kommt der Abschluss-Stand.

**Stand, Version, Marke.** Die **Version** ist der
`_VV_TLA`-Dateistand; der **Stand** ist das abgeleitete
Dokument; die **Marke** ist der Planungs-Horizont. Eine
Marken-Bezeichnung „1.1“ und eine Produkt-Version
„v1.1.0“ sind zwei verschiedene Dinge: die Marke ordnet
Stände, Freigaben und Abschluss-Stand; die
Produkt-Version ist der Tag-Name nach der
Tag-Konvention in `wiki/Facts.md`.

## Der Lebenslauf eines Stands

Vom ersten Eintrag bis nach der Freigabe läuft jeder
Stand durch dieselben Schritte; das Regelwerk führt sie
in `../referenzprozesse/base/wiki/Lebenslauf-eines-Stands.md`.

1. **Erarbeiten.** Die Einträge einer Phase entstehen
   im Wiki, als offene Elemente (oben). Das darf in
   jeder Reihenfolge geschehen — geordnet ist nur die
   Freigabe der Stände, nicht die Arbeit.
2. **Lesen während der Arbeit.** Bis ein Stand gebildet
   ist, liest du die Einträge einer Phase über ihre
   Register-Fassade — der Agent benennt sie dir
   ausdrücklich als „Lese-Klammer dieser Phase“ und
   zeigt dir die Einträge auf Wunsch gesammelt im Chat.
   Einen frühen Stand als Lese-Dokument bildet er nicht
   von sich aus; auf deinen Zuruf jederzeit.
3. **Bilden.** Der Agent **bietet** die Bildung an,
   sobald er die Einträge für vollständig hält, oder
   bildet den Stand auf deinen Zuruf — auch vorher. Der
   Katalog-Eintrag eines Dokumenttyps kann den Anlass
   einengen (bei den Doku-Ständen ist es die
   Doku-Abfrage). Vor der Bildung läuft die
   Ableitungsprüfung (oben). **Entwürfe neben dem Stand
   gibt es nicht** — weder im Scratch noch als eigene
   Versionskette: Was der Agent dir vorlegt, ist der
   Stand selbst.
4. **Prüfen.** Bei einem Pflicht-Stand läuft die
   Kettenprüfung durch den Prüfer **vor der Vorlage**
   an dich, so dass du den Prüfbericht mit dem Stand
   bekommst (unten, „Kettenprüfung“); bei den
   Doku-Ständen dazu der Verständnis-Check durch einen
   Leser ohne Repo-Zugang. Optionale Stände werden auf
   Anfrage geprüft, der Abschluss-Stand nur auf
   Vollständigkeit.
5. **Vorlegen.** Der Agent nennt den Stand mit Version
   und Pfad, den Zweck, das Weggelassene und die noch
   offenen Einträge, den Prüfbericht und die
   Einschränkungen; er sagt, dass der Stand auf
   Einträge verweist und wo du ihnen folgst; und er
   fragt nach der Freigabe im Wortlaut der Formel
   (unten, „Freigaben“). Bei einem selbsttragenden
   Stand nennt er statt der Einträge die Quell-Stände
   mit Version und den Bericht des Verständnis-Checks.
6. **Korrigieren vor der Freigabe.** Eine Korrektur
   geht in die **Einträge**, nie in den Stand: Offene
   werden geändert, eingefrorene abgelöst. Danach
   bildet der Agent eine **neue Version** desselben
   Dokuments (die Versionsnummer zählt hoch, der Name
   bleibt — auch das Datum im Namen); die vorige Version
   bleibt ohne Freigabe liegen, und die Freigabe trifft
   die jüngste. Schreibst du selbst eine Version des
   Stands (mit deinem Kürzel), überträgt der Agent deine
   Änderungen in die Einträge und bildet die nächste
   Version. Nach einer Korrektur prüft der Prüfer nur
   die geänderten Einträge noch einmal. Bei einem
   selbsttragenden Stand geht eine Korrektur nicht in
   Einträge (seine Quell-Stände sind eingefroren) und
   wird nicht von Hand nachgezogen: Der Agent erzeugt
   die neue Version erneut aus den Quell-Ständen, und
   Kettenprüfung und Verständnis-Check laufen über das
   ganze Dokument.
7. **Freigeben und buchen.** Du gibst frei; der Agent
   bucht die Freigabe als Entscheidung und nimmt im
   selben Zug die offenen Einträge an, die der Stand
   verweist — damit sind sie eingefroren. Schon
   angenommene Einträge werden nicht erneut angenommen.
8. **Nach der Freigabe.** Eine Freigabe gilt für ihren
   eingefrorenen Stand und wird nicht zurückgenommen;
   ändert sich danach etwas, entsteht ein neuer Stand
   (unten, „Nach der Freigabe“). Gilt ein Stand für die
   nächste Marke weiter, wird er übernommen, nicht neu
   gebildet (unten, „Zielmarken“).

Abweichend vom Standardablauf sind nur der
Abschluss-Stand (eigener Anlass: der Marken-Wechsel;
Prüfung nur auf Vollständigkeit), optionale Stände
(Angebot, freier Zweck, Prüfung auf Anfrage),
selbsttragende Ableitungen wie Release-Notes (aus einem
freigegebenen Stand abgeleitet, mit ihrer Freigabe
friert nichts Neues ein) und die drei Doku-Stände
(eigener Anlass Doku-Abfrage, Verständnis-Check als
Pflicht, Korrektur durch Neu-Erzeugung — unten,
„Dokumentation“).

## Freigaben

**Der Kernsatz: Eine Freigabe hängt immer an einem
Stand.** Freigegeben wird „Stand X für Zweck Y“ — immer
ein Stand, nie die lebende Fassade und nie ein
einzelner Eintrag. Mit der Freigabe frieren alle
Einträge ein, auf die der Stand verweist; bis dahin
leben sie im Wiki. Der Stand ist damit der einzige
Ort, an dem etwas übergreifend eingefroren und an dem
eine Zweck-Freigabe festgemacht wird. Die einzige
Zweck-Freigabe ohne Stand ist der Tag der
Implementierung (unten): Ein Tag friert selbst ein wie
ein Stand und gehört zum Produkt, nicht zum Wiki.

**Annahme und Freigabe** bleiben getrennt: Einen
einzelnen Eintrag kannst du vorher **annehmen** („ja,
so“) — das ist das OK zum Eintrag, und er friert damit
ein. Eine **Freigabe für einen Zweck** gibt es nur am
Stand. Zwei weitere Vorgänge heißen „Freigabe“, sind
aber keine Zweck-Freigabe: die Ordner-Freigabe beim
Projektstart (eine Erlaubnis) und die Freigabe eines
Contracts durch die zuständige Stelle (die Annahme
eines Eintrags).

Jeder Stand kann null, eine oder mehrere Freigaben
tragen — **jede an einen Zweck gebunden**. Ein Stand der
Funktionsbeschreibung kann „für P5 Zerlegen in
Bausteine“ freigegeben sein (die Architektur darf ihn
als Grundlage nehmen), ohne schon „für P13 Ausliefern“
freigegeben zu sein. Freigaben sind unabhängig
voneinander; eine impliziert nicht die andere.

Das Wort „Freigabe“ hat im Regelwerk noch eine zweite,
engere Bedeutung: die **Freigabe eines Ordners** — die
als Entscheidung gebuchte Erlaubnis, im Projekt einen
zusätzlichen Ordner zu führen (siehe
[Wiki und Register](Wiki-und-Register.md), „Die Ordner
und ihre Rollen“). Dieses Dokument handelt von der
Freigabe eines Stands.

**Die Formel.** Jede Freigabe wird wörtlich so gebucht:

> **Stand x von ⟨Artefakt⟩, freigegeben für Zweck Z
> [zu Marke M]**

x ist die Version, ⟨Artefakt⟩ der Dokumenttyp, Z die
Phase in ihrem Tätigkeits-Namen („für P4 Beschreiben der
Funktion“) oder ein freier Zweck. Der Wortlaut ist
verbindlich, weil der Lint Freigabe-Einträge daran
erkennt; das Wort „Zweck“ darf dabei entfallen
(„freigegeben für P5 Zerlegen in Bausteine“). Die Marke
einer Freigabe mit Stand-Datei steht im Kopf des Stands;
der Zusatz „zu Marke M“ wiederholt sie nur und steht,
wenn sie nicht die laufende Marke ist (die Marke mit
dem Zeiger `in-progress`, unten „Zielmarken“). Eine
Freigabe ohne Stand-Datei — die Freigabe per Tag
(unten) wie jede andere — nennt die Marke immer, denn
der Eintrag ist dann ihre einzige Quelle.

**Gebucht als Entscheidung.** Jede Freigabe ist ein
Eintrag im Entscheidungs-Register mit Verweis auf die
Stand-Datei und — bei Pflicht-Ständen — auf den
Prüfbericht der Kettenprüfung, bei den drei
Doku-Ständen dazu auf den Bericht des
Verständnis-Checks; sein Feld `zielmarke:`
trägt die Marke der Freigabe, nicht ohne Weiteres die
beim Buchen laufende. Eine Einschränkung steht
ausdrücklich dabei: ein fehlender Vorgänger, „Doku
folgt“ (die Auslieferung wird freigegeben, bevor
Entwickler- oder Benutzer-Doku vorliegen), „Teil-Doku
fehlt“ (der Koordinator gibt seine Gesamtsicht ohne die
Entwickler-Doku einer Komponente frei), offene Fehler
im Testbericht, oder dass Prüf- und Bau-Modell dasselbe
waren. Wird derselbe Gegenstand erneut
freigegeben, ist das ein neuer Eintrag, der den alten
ablöst. Ausnahme: Freigaben, die nach dem
Marken-Wechsel zu einer abgeschlossenen Marke gehören,
stehen im Nachtrag an der Marke, nicht als eigener
Eintrag, und lösen nichts ab — die Tag-Freigabe einer
Tag-Korrektur (die alte Tag-Freigabe bleibt stehen),
die Freigabe eines nachgetragenen Deploy-Stands und die
Freigabe eines Doku-Stands, der in der Doku-Abfrage
„später“ erhielt (unten, „Tag-Korrektur“ und der Absatz
danach).

**Nach der Freigabe.** Eine Freigabe gilt für ihren
eingefrorenen Stand und wird nicht zurückgenommen.
Wird danach ein verwiesenes Element abgelöst und gilt
der Nachfolger für die Marke des Stands, ist der Stand
**überholt** — eine Ablösung, die erst ab einer
späteren Marke wirkt, überholt ihn nicht (unten,
„Ablösung wirkt ab der Marke des Nachfolgers“).
Ebenso ist er überholt, wenn ein Vorgänger-Stand
überholt ist. „Überholt“ wird nicht gebucht, sondern
vom Lint berechnet und vom Wächter laufend
gemeldet. Die Antwort ist ein **neuer Stand** mit eigener
Prüfung und eigener Freigabe, die die alte ablöst; der
alte Stand bleibt unverändert liegen.

**Freigabe-Bezugsprüfung.** Bezieht sich der Agent bei
der Arbeit an einem Artefakt auf ein Artefakt einer
anderen Phase, prüft er, ob die Grundlage existiert und
für diesen Zweck freigegeben ist. Fehlt beides oder
eines, warnt er und nennt die Optionen: trotzdem
weiterarbeiten (explorativ), erst die Freigabe erwirken
oder den Bezug überdenken. Er blockiert nicht.

**Delegation.** Sind die Vorbedingungen einer Freigabe
automatisch prüfbar (Tests grün, Lint frei), bietet der
Agent an, die Freigabe selbst zu buchen, wenn alle
Nachweise grün sind — generell oder je Fall nach deiner
Wahl. Substantielle Prüfung (Widerspruchsfreiheit,
Anforderungs-Deckung) bleibt Prüfern oder Personen
vorbehalten.

## Kettenprüfung

Die Pflicht-Stände einer Marke bilden eine **Kette**,
abgeschlossen durch den Abschluss-Stand. Ein
Pflicht-Stand der Phase Pn wird nach den
Pflicht-Ständen der früheren Phasen derselben Marke
freigegeben. Fehlt ein früherer Stand ohne Verzicht,
**warnt** der Agent — du entscheidest; gibst du
trotzdem frei, nennt der Eintrag den fehlenden
Vorgänger. Die einzige harte Bedingung: der
Testplan-Stand (P10) wird erst nach dem Tag der
Implementierung freigegeben. Die Doku-Glieder stehen in
dieser Ordnung so: Entwickler-Doku (P11) und
Benutzer-Doku (P12) **vor** dem Deploy-Stand — fehlt
eines ohne Verzicht, warnt der Agent, und die Freigabe
der Auslieferung nennt es als Einschränkung „Doku
folgt“, keine Blockade; die Betriebs-Anleitung (P15)
**nach** dem Deploy-Stand ihrer Umgebung, aus dem sie
entsteht.

Vor der Freigabe eines Pflicht-Stands wird er gegen
**alle freigegebenen Vorgänger derselben Marke**
geprüft, einschließlich der aus der Vormarke
übernommenen, nicht nur gegen den direkten — auf
Folgendes:

- **Widerspruch** — der Stand widerspricht einem
  Vorgänger;
- **Abdeckung** — alles vom Vorgänger ist aufgegriffen;
  geprüft gegen die Quell-Stände, die der Katalog-Eintrag
  des Dokumenttyps nennt (die Benutzer-Doku etwa gegen
  Konzept, Anforderungen und Funktionsbeschreibung, nicht
  gegen die Spezifikation; die Betriebs-Anleitung gegen
  den Deploy-Stand ihrer Umgebung);
- **Unbegründetes** — eine neue Sachaussage, die kein
  Vorgänger trägt (eine Funktion, eine Eigenschaft, eine
  Grenze, die das Produkt laut Vorgängern nicht hat).
  Darstellung — Anleitungen, Beispiele, Erklärungen,
  Gliederung, Bilder — ist erlaubt und kein Befund,
  solange sie keine neue Sachaussage enthält.

Die Abdeckung prüft der Lint nur mechanisch über
Verweis-Felder („mindestens einer“ je Glied); ob sie
vollständig ist, beurteilt der Reviewer. Widerspruch
und Unbegründetes prüft ein **Reviewer mit einem
anderen Modell** als dem, das gebaut hat — zuerst über
ein Werkzeug, sonst über den beim Start gewählten
Ersatzweg; das Standard-Prüfmuster setzt dafür zwei
unabhängige Prüfer ein (siehe
[Arbeitsweise](Arbeitsweise.md), „Prüfmuster und
Review-Kette“). Die Prüfung läuft **vor der Vorlage**
an dich: Du bekommst den Prüfbericht zusammen mit dem
Stand, und die Freigabe zeigt auf ihn. Nach einer
Korrektur vor der Freigabe prüft eine neue Runde nur
die geänderten Einträge. Optionale Stände werden nur
auf Anfrage geprüft; der Abschluss-Stand wird nur auf
Vollständigkeit geprüft.

**Verzicht.** Willst du eine Phase mit Pflicht-Stand für
eine Marke bewusst auslassen, wird das als
Verzichts-Entscheidung gebucht (mit Marke und genau
einer Phase); dann entfallen der Stand und seine
Prüfpflichten für diese Marke, und spätere Glieder
prüfen gegen die übrigen Vorgänger. Bei den
Doku-Gliedern ist der Verzicht die Antwort „gar nicht
(Verzicht)“ in der Doku-Abfrage; auf die
Betriebs-Anleitung wird je Umgebung verzichtet (die
Entscheidung nennt die Umgebung). Nicht verzichtbar ist
der Tag der Implementierung. Manche Glieder fehlen ohne
Verzicht von selbst — die Phasen P2 und P14 haben
keinen Pflicht-Stand, eine Übergabe gibt es nur bei
einem Schnitt in Komponenten, Auslieferung und
Betriebs-Anleitung nur mit Zielumgebung — oder werden
durch anderes vertreten, etwa den Übergabe-Stand des
Koordinators bei einer Komponente (siehe
[Zusammenarbeit mehrerer Repos](Mehrere-Repos.md));
welche Glieder in welchem Fall fehlen oder vertreten
werden, legt `../wiki/Kettenpruefung.md` im Einzelnen
fest.

**Kettenprüfung ist kein Wächter.** Die Arbeit wird nie
gesperrt; nur die Freigabe eines Pflicht-Stands setzt
die Prüfung voraus. Nach einer Migration sind die
Pflicht-Stände der Übernahme-Marke die erste Aufgabe;
nach einem Upgrade meldet die Kettenprüfung fehlende
Pflicht-Stände der laufenden Marke vor der nächsten
Freigabe, und der Agent bietet sie an.

## Der Tag der Implementierung

Die Phase P9 „Ausarbeiten“ bringt das **Produkt** der
Marke hervor — bei einem Softwaresystem den Code mit
seinen automatisierten Tests. Das Produkt wird nicht
als Stand freigegeben; seine Freigabe ist ein
**git-Tag** im Repo, das das Produkt trägt. Welche
Pfade das Produkt ausmachen, legt dein Projekt in
`wiki/Facts.md` fest (die Quellordner). Der
Freigabe-Eintrag lautet:

> **Stand ⟨Tag-Name⟩ von Implementierung, freigegeben
> für P10 Testen zu Marke M**

Die Vorbedingung ist die Kettenprüfung des Produkts
gegen die freigegebenen Vorgänger — bei Code das
Code-Review, das darunter gegen die Spezifikation
prüft — und „Tests grün“ für das automatisiert
Prüfbare des Produkts. Ein Verzicht auf das Code-Review
ist nur als deine Entscheidung mit benannter Folge
möglich.

Das Muster des Tag-Namens und die Pfade des Produkts,
an denen „unverändert“ gemessen wird, fragt der Agent
vor dem ersten Tag ab und vermerkt sie in
`wiki/Facts.md`; vor der ersten Zwischenmarke dazu das
Muster für ihren Zweig (unten, „Zwischenmarke“). Den
Tag setzt der Agent nach deinem OK; er wird **nie
verschoben oder gelöscht** — eine Korrektur ist ein
neuer Tag mit neuer Freigabe; nach dem Marken-Wechsel
wird sie als Nachtrag gebucht (unten, „Tag-Korrektur“).
Gepusht wird nur auf Anfrage.

Nach dem Tag folgt ein Testplan-Stand (P10) und ein
**Testbericht** als Nachweis des Durchgangs; nicht
Bestandenes erzeugt Fehlermeldungen (mit der Marke des
getesteten Stands). Weist der
Testbericht offene Fehler aus, legt der Agent die
Freigabe für die Auslieferung oder einen Doku-Stand
trotzdem vor — du entscheidest, und der Eintrag nennt
die offenen Fehler. Mit dem gesetzten Tag legt der
Agent außerdem die **Doku-Abfrage** vor (unten,
„Dokumentation“): Erst jetzt ist der Umfang der
Änderung bekannt, und Entwickler-Doku und Benutzer-Doku
stehen in der Ordnung der Freigaben zwischen dem
Testbericht und der Auslieferung.

## Dokumentation: Entwickler-Doku, Benutzer-Doku, Betriebs-Anleitung

Mit SP-1 trägt die Kette drei Stände, die für Leser
ohne Zugang zum Projekt geschrieben sind — die
**Doku-Stände**, je ein Pflicht-Stand seiner Phase:

- die **Entwickler-Doku** (P11, „für P13 Ausliefern“):
  Ein Fremder kann das Produkt ohne Rückfrage ändern —
  Aufbau, Entscheidungen und ihre Gründe, Einstieg und
  Build, Schnittstellen. Sie ist aus den freigegebenen
  Ständen von Architektur, Technologie-Entscheidungen
  und Spezifikation und dem Tag ausformuliert.
- die **Benutzer-Doku** (P12, „für P13 Ausliefern“):
  Ein Fremder kann das Produkt ohne Hilfe benutzen —
  was es leistet, wie man es bedient, was es nicht tut.
  Sie ist aus Konzept, Anforderungen,
  Funktionsbeschreibung und Tag ausformuliert.
  „Benutzer“ sind die Leser des Produkts — nicht du als
  Anwender, der mit dem Agenten arbeitet.
- die **Betriebs-Anleitung** je Zielumgebung (P15, „für
  P15 Betreiben“): Ein Fremder kann das Produkt in
  dieser Umgebung ausführen — Installation und Betrieb.
  Sie ist aus dem freigegebenen Deploy-Stand ihrer
  Umgebung ausformuliert und wird erst nach ihm
  freigegeben; ein weiterer Deploy-Stand derselben
  Umgebung ist der Anlass einer neuen Version.

Diese Stände sind **selbsttragend** (oben, „Zwei
Grade“): keine Wikilinks, keine Register-Kennungen,
Begründungen ausgeschrieben; eine feste Kapitelliste
gibt es nicht, der Maßstab ist der Satz je Typ. Vor der
Freigabe stehen zwei Prüfungen: die Kettenprüfung gegen
die Quell-Stände (Darstellung ist dabei kein Befund,
eine neue Sachaussage schon) und, als Pflicht, der
**Verständnis-Check** — ein Prüfer, der nur das
Dokument bekommt, nicht das Wiki, und die Prüffrage des
Typs beantwortet („Kann ein Fremder das Produkt ohne
Rückfrage ändern?“, „… ohne Hilfe benutzen?“, „… in
dieser Umgebung ausführen?“) und jede Stelle nennt, an
der er raten müsste. Beide Berichte bekommst du mit dem
Stand; die Freigabe nennt sie. Vorbedingung von
Entwickler- und Benutzer-Doku ist der Testbericht der
Marke. Die freigegebene Version liegt wie jeder Stand
versioniert in `output/`; eine Kopie geht in den Ordner
`docs/` des Produkts (`docs/developer/`, `docs/user/`,
`docs/ops/`) — im Zwei-Repo-Fall ins Produkt-Repo
(siehe [Zusammenarbeit mehrerer Repos](Mehrere-Repos.md)).
Mit RP-1 ist die aus den Code-Kommentaren erzeugte
API-Doku Teil der Entwickler-Doku, nicht ihr Ersatz.

**Die Doku-Abfrage.** Sobald der Tag der
Implementierung einer Marke gesetzt ist (beim
Koordinator ohne eigene Bauteile: sobald die letzte
erwartete Lieferung gebucht ist), legt dir der Agent
**einmal je Marke** eine Tabelle vor — je eine Zeile
für Entwickler-Doku, Benutzer-Doku und
Betriebs-Anleitung je Zielumgebung, mit seiner
Empfehlung und Begründung. Du entscheidest je Zeile
zweierlei:

- den **Zeitpunkt**: **jetzt** — die Doku wird vor der
  Auslieferung freigegeben, in der Ordnung der Kette
  (der Normalfall); **später** — die Auslieferung geht
  zuerst, ihre Freigabe trägt die Einschränkung „Doku
  folgt“, und die Doku kommt spätestens zum
  Marken-Abschluss (unten); **gar nicht** — als
  **Übernahme**, wenn sich für diese Leser nichts
  geändert hat (der freigegebene Stand der Vormarke
  gilt weiter, der Abschluss-Stand weist ihn als
  übernommen aus), oder als **Verzicht**, wenn es keinen
  Stand geben soll (mit Begründung). Für die
  Betriebs-Anleitung, die nach ihrem Deploy-Stand
  kommt, heißt „jetzt“: nach dem Deploy-Stand und vor
  dem Marken-Abschluss; „später“: der Marken-Abschluss
  wartet nicht auf sie, ihre Freigabe wird nach dem
  Wechsel nachgetragen.
- die **Form** (bei „jetzt“ und „später“):
  **Änderungsdokument** — es benennt nur die Änderungen
  gegenüber der letzten Vollfassung, nennt sie im Kopf
  als Basis und ist kumulativ (ein weiteres
  Änderungsdokument zur selben Vollfassung enthält die
  früheren Änderungen wieder, so dass Vollfassung plus
  ein Änderungsdokument immer genügen);
  **Einarbeitung** — eine neue Vollfassung, in der die
  geänderten Kapitel neu erzeugt und die übrigen
  unverändert aus der letzten Vollfassung übernommen
  sind; **komplett neu** — eine neue Vollfassung,
  vollständig neu erzeugt. In jeder Form stammt jeder
  Text aus dem Wiki bzw. den Quell-Ständen, nichts wird
  von Hand nachgezogen, und beide Prüfungen gehen über
  das ganze Dokument.

Die Empfehlung des Agenten folgt Umfang und Art der
Änderung: erste Marke, Bruch oder neue Struktur des
Produkts → komplett neu; übliche Folge-Marke →
Einarbeitung; Patch- oder Zwischenmarke mit kleiner
Änderung → Änderungsdokument; ab zwei
Änderungsdokumenten seit der letzten Vollfassung →
Einarbeitung; dringender Fix → später; nichts für diese
Leser sichtbar → gar nicht (Übernahme); erste Marke
nach einem Anheben der Vorlage, das die Doku-Stände
einführt → komplett neu, vorgefundene Dokumente in
`docs/` bleiben als Nachweis liegen. Die
Arbeit an einer Doku darf früher beginnen — die Abfrage
entscheidet nur Zeitpunkt und Form der Freigabe.

Jede Zeile wird als eigene Entscheidung gebucht
(„Doku-Entscheidung zu Marke 1.1: Benutzer-Doku — gar
nicht (Übernahme)“); die Tabelle steht als Nachweis an
der ersten davon. Ein Verzicht ist eine gewöhnliche
Verzichts-Entscheidung mit genau einer Phase, bei der
Betriebs-Anleitung je Umgebung. Die Freigaben der
Doku-Stände selbst bleiben eigene Freigabe-Einträge.
Kommt nach der Abfrage eine Zielumgebung hinzu oder
entsteht zu einer Umgebung ein weiterer Deploy-Stand,
stellt der Agent mit dessen Vorlage die Zeile
Betriebs-Anleitung für diese Umgebung nach — die
Abfrage je Marke bleibt eine, die Nachfrage ist ihre
Fortsetzung.

**Später und Nachtrag.** Ein Doku-Stand mit „später“
wird spätestens zum Marken-Abschluss freigegeben: Der
Vollständigkeits-Scan beim Marken-Wechsel legt ihn dir
als offenen Punkt vor. Sagst du dort erneut „später“,
wird seine Freigabe nach dem Wechsel als **Nachtrag** an
der Marke gebucht — wie ein nachgetragener Deploy-Stand
(unten, „Marken-Wechsel und Abschluss-Stand“): kein
eigener Freigabe-Eintrag, keine Ablösung, kein
Meilenstein; der Abschluss-Stand bleibt und ist dadurch
nicht überholt.

**Jede Freigabe eines Doku-Stands** einer laufenden
Marke ist ein Meilenstein wie bei jedem Pflicht-Stand;
beim Koordinator sind Entwickler-Doku und Benutzer-Doku
je ein eigener Anlass.

**Release-Notes bleiben unverändert:** Sie sagen,
**was** sich geändert hat; ein Änderungsdokument sagt,
**wie** man das Geänderte benutzt, ändert oder betreibt.
Beides nebeneinander ist keine Redundanz.

**Ohne Prozess** gibt es keine Phasen und keine
Doku-Abfrage; der Agent bietet Doku-Stände dann nur auf
Zuruf an, als optionale Stände. Welche Doku-Glieder
Koordinator, Komponente und Standalone-Projekt führen:
[Zusammenarbeit mehrerer Repos](Mehrere-Repos.md), „Die
Kette der Komponente“ und „Der Koordinator“.

## Zielmarken

Eine **Marke** ist der Zwischenziel-Anker deines
Projekts: ein benanntes Ergebnis, das nach außen geht
und freigegeben wird — kein Datum. Nach außen sieht
man von einem Projekt seine Marken und deren Produkte;
nach innen ordnen die Marken Stände, Freigaben, Tag und
Abschluss-Stand. Deshalb führt jedes Projekt
Zielmarken, und der Agent legt beim Projektstart die
erste an (die Bezeichnung nennst du; bei der Migration
ist es die Übernahme-Marke). Bei einem Softwaresystem
ist eine Marke ein **Release** („1.0“, „1.1“); ein
Hotfix nach dem Abschluss ist eine **Patch-Marke**
(„2.0.1“) — eine eigene Marke, die nur das Produkt
einer abgeschlossenen Marke korrigiert; ein anderes
Ausrollen bei unverändertem Produkt ist keine
Patch-Marke, sondern ein weiterer Deploy-Stand (unten,
„Nachtrag“). Beim Koordinator ist die Marke der Release
des Gesamtsystems; die Komponenten liefern ihre Tags zu
dieser Marke.

Eine neue Marke beginnt, wenn ein neues Ergebnis nach
außen geht; Arbeits-Einheiten ohne eigenes Ergebnis
(eine Recherche, ein Umbau im Inneren) gehören zur
laufenden Marke. Eine **Frist** kann eine Eigenschaft
einer Marke sein (ein zugesagter Liefertermin), ist
aber nicht ihr Kern: verstreicht sie, steht die Marke
noch aus. Das Marken-Dokument legt keine Release-Kadenz
fest; die Marke folgt dem Ergebnis, nicht dem Kalender.
Die Faustregeln für den Schnitt stehen in
`../wiki/Marken.md`, `../wiki/Marken-SP-1.md` und
`../wiki/Marken-RP-1.md`.

Die Marken leben im Register `wiki/Zielmarken.md`;
jede Marke hat eine **Bezeichnung** (harte Kennung,
z.B. `1.1`), eine **Benennung** (Codename oder
sprechender Name), eine Beschreibung und einen
**Zustand**: künftig, in-progress, zurückgestellt oder
abgeschlossen. Genau eine Marke trägt den Zeiger
**`in-progress`** (daran wird gearbeitet), genau eine
**`current`** (die zuletzt abgeschlossene); bei der
ersten Marke gibt es noch kein `current`. Keine Marke
ist `in-progress` nur, wenn das Projekt ruht (unten,
„Marken-Wechsel“).

Zielmarken sind keine Fristen: Fristen sind Termine mit
Verfall („abgelaufen“), Marken sind Ergebnisse ohne
Verfall. Und sie sind keine Meilensteine im Sinn einer
Zeitplanung: gearbeitet wird fließend und parallel; der
„Meilenstein-Vorgang“ des Software-Prozesses ist eine
abgeschlossene Arbeits-Einheit, keine Marke.

### Zuordnung der Elemente zu Marken

Jedes Element trägt ein Feld `zielmarke:` mit der
Marke, zu der es gehört. Beim Anlegen schreibt der
Agent die `in-progress`-Marke hinein; ist etwas von
vornherein für eine spätere Marke geplant oder wird es
dorthin verschoben, steht diese Marke.

Vier Ausnahmen tragen eine Tatsache statt einer
Planung: eine Fehlermeldung die Marke des
Produkt-Stands, an dem der Fehler beobachtet wurde; die
Deployment-Elemente eines Deploy-Stands, der zu einer
abgeschlossenen Marke nachgetragen wird (neue oder
anders ausgerollte Umgebung), eine Entscheidung, die
nur diese Umgebung betrifft, und eine Fix-Anforderung,
die einen Fehler in der Auslieferung durch einen
weiteren Deploy-Stand behebt, die Marke dieses Stands
(unten, „Nachtrag“).

Das Feld ist bis zum Einfrieren umhängbar; danach gilt
das Element ab seiner Marke für alle späteren Marken,
die auf ihr aufbauen (ein Element einer Sackgasse gilt
nur dort), und eine andere Marke bekommt es nur noch
durch eine Ablösung. Hat der Agent das Feld bei einem
Element vergessen, das schon eingefroren ist, hängt er
einen Vermerk „Zielmarke <M> (nachgetragen)“ an; der
Lint liest ihn wie das Feld, der Inhalt bleibt
unverändert. Bei einem Element mit eigenem Knoten steht
das Feld im Knoten und zur Anzeige im Register-Eintrag;
der Agent schreibt beide, und der Lint meldet eine
Abweichung — es gilt dann die Marke des Eintrags.
Elemente aus der Zeit vor Version 2.0 der Vorlage und
Elemente, die eine Migration aus dem Vorgefundenen
übernommen hat, haben kein solches Feld und gelten ab
ihrer Annahme; nachgetragen wird nichts.

Weitere Regeln der Zuordnung:

- **Marken-Trigger.** „Für 2.0 vertagt“ heißt: schlafen
  gelegt mit Wecker — wird die Marke `in-progress`, holt
  der Wächter den aufgeschobenen Eintrag hervor.
- **Stand je Marke.** Ein Stand gehört zu genau einer
  Marke. Für eine neue Marke entsteht ein neues Dokument
  mit neuer Ketten-ID; neue Versionen derselben
  Ketten-ID gibt es nur innerhalb einer Marke.
- **Übernahme.** Ein freigegebener Pflicht-Stand der
  Vormarke gilt für die Folge-Marke weiter, solange er
  — gegen die Folge-Marke geprüft — nicht überholt ist.
  Er wird weder neu gebildet noch neu freigegeben;
  der Abschluss-Stand der Folge-Marke führt ihn mit
  „übernommen aus ⟨Vormarke⟩“. Bei den Doku-Ständen ist
  das die Antwort „gar nicht (Übernahme)“ in der
  Doku-Abfrage. Dasselbe gilt für den
  Tag, wenn das Produkt seit ihm unverändert ist
  **und** die Stände, auf denen er beruht, für die
  Folge-Marke nicht überholt sind; sonst folgt nach
  der Neu-Ableitung ein neuer Tag. Ein Testbericht
  der Vormarke gilt zum übernommenen Testplan-Stand
  weiter.
- **Ablösung wirkt ab der Marke des Nachfolgers.** Löst
  ein Element mit `zielmarke: M` ein älteres ab, gilt
  das alte für alle Marken vor M weiter und das neue ab
  M. Der Status „abgelöst“ am alten Element zeigt die
  Ablösung an; welche Stände es noch führen, entscheidet
  nicht der Status, sondern ob der Nachfolger für die
  Marke des Stands gilt.

### Zwischenmarke

Das Beispiel-Szenario für alles Folgende: Release
`2.0` ist abgeschlossen und ausgeliefert, die Arbeit an
`2.1` läuft (`2.1` ist `in-progress`). Jetzt meldet
der Betrieb einen Fehler in `2.0`, der nicht bis `2.1`
warten kann. Die Korrektur bekommt eine Patch-Marke
`2.0.1`, die vor `2.1` fertig werden soll.

Muss eine abgeschlossene Marke korrigiert werden,
während die nächste schon läuft, zieht der Agent die
Patch-Marke (`2.0.1`) als **Zwischenmarke** vor: sie
wird `in-progress`, die bisher laufende Marke (`2.1`)
ist so lange die **zurückgestellte Marke**, und mit dem
Abschluss der letzten Zwischenmarke kehrt der Agent zu
ihr zurück.

**Vorziehen und Fragen.** Vorher sagt der Agent dir das
— auch, dass jede Freigabe ohne Stand-Datei ihre Marke
nennt und Stände ihre Marke im Kopf tragen und dass die
Arbeit am Produkt auf einem eigenen Zweig ab dem Tag
der Vormarke läuft. Bei größeren Wünschen fragt er, ob
die Arbeit nicht besser in `2.1` bleibt. Und er fragt
dich, ob die Zwischenmarke **Vorgänger** der
zurückgestellten Marke ist (ein Bugfix, der in `2.1`
enthalten sein soll) oder eine **Sackgasse** (ein
Workaround, der dort nicht hineingehört) — mit den
Folgen beider Fälle; erst nach deinem OK legt er sie
an. Deine Antwort darfst du ändern, bis in der
Zwischenmarke zum ersten Mal etwas abgelöst oder
überlagert wird; danach steht sie fest, und ein
Kurswechsel läuft über die Übernahme (Sackgasse) oder
eine Ablösung in `2.1` (Vorgänger).

**Vorgänger oder Sackgasse.** Die **reguläre Linie**
sind die Marken, die aufeinander aufbauen (`2.0` →
`2.1`); ein Vorgänger reiht sich dort ein (`2.0` →
`2.0.1` → `2.1`), eine Sackgasse steht daneben.

**Zweite Korrektur.** Kommt während der Zwischenmarke
noch eine Korrektur derselben Art (wieder ein Bugfix,
wieder ein Workaround), nimmt der Agent sie mit
derselben Ankündigung in dieselbe Zwischenmarke auf;
eine Korrektur der anderen Art folgt als eigene
Zwischenmarke (`2.0.2`) nach dem Abschluss der ersten,
und `2.1` bleibt so lange zurückgestellt.

**Zweig im Repo.** Die Zwischenmarke arbeitet auf einem
eigenen Zweig, abgezweigt am Tag ihrer Vormarke, in dem
Repo, das das Produkt trägt; das Muster des Zweignamens
(etwa `marke/2.0.1`) steht in `wiki/Facts.md` neben der
Tag-Konvention, der Agent fragt es vor der ersten
Zwischenmarke ab. Ihr Tag sitzt auf diesem Zweig. Einen
Vorgänger-Zweig führt der Agent bei der Rückkehr in die
Hauptlinie zurück — den Zweig, auf dem die
zurückgestellte Marke arbeitet — und legt dir Konflikte
vor; ein Sackgassen-Zweig bleibt stehen.

**Zuordnung während der Zwischenmarke.** Solange die
Zwischenmarke läuft, bekommen neue Elemente sie als
`zielmarke:`; Arbeit an `2.1` nennt `2.1` ausdrücklich
— Elemente mit `zielmarke: 2.1`, Freigaben „zu Marke
2.1“. Ob ein neues Element zur Zwischenmarke oder zu
`2.1` gehört, folgt aus deinem Auftrag; ist es daraus
nicht ableitbar, fragt der Agent vor dem Anlegen. Ein
Element, das schon „abgelöst“ ist, weil sein Nachfolger
zu `2.1` gehört, gilt für die Zwischenmarke weiter und
steht in ihren Ständen. Hat ein alter Eintrag ohne
`zielmarke:` (Bestand) vor dem Vorziehen etwas ersetzt,
fragt dich der Agent, zu welcher Marke die Ersetzung
gehört — bei der ersten Meldung, spätestens bevor er
einen Stand zur Zwischenmarke bildet —, und vermerkt
die Antwort am Nachfolger; bis dahin gibt der Lint
einen Hinweis.

**Fehlermeldungen während der Zwischenmarke.** Eine
Fehlermeldung trägt die Marke des Produkt-Stands, an
dem der Fehler beobachtet wurde — aus dem Betrieb des
ausgelieferten `2.0` also `2.0`, aus einem Test der
Arbeit an `2.1` also `2.1`, nie einfach die laufende
Marke. Eine Fehlermeldung zu `2.0` darf in der
Zwischenmarke behoben werden — ihre Fix-Anforderung
trägt dann `2.0.1` — wie in `2.1`; eine Fehlermeldung
zu `2.1` nicht: behoben wird nie vor der Meldung.

**Workaround in einer Sackgasse.** Behebt eine Sackgasse
eine Fehlermeldung der regulären Linie nur per
Workaround, bleibt sie offen, bis der echte Fix in
`2.1` umgesetzt ist; die Meldung nennt beide
Anforderungen, und die Release-Notes der Sackgasse
führen sie als Workaround, die von `2.1` als Behebung.
Folgt kein echter Fix, bleibt es dabei: die
Release-Notes der Sackgasse führen sie als Workaround,
die der regulären Linie gar nicht, die Meldung bleibt
offen und steht im Fehlerstand der regulären Marke als
offener Fehler mit Workaround. Eine Fehlermeldung, die
am Stand der Sackgasse selbst beobachtet wurde, trägt
deren Marke, gilt nur dort und ist mit einer
Fix-Anforderung der Sackgasse behoben — in deren
Release-Notes eine Behebung; in die Rückfrage zur
Übernahme kommt sie nicht, ein Fehler am Stand von
`2.1` ist eine neue Meldung.

**Überlagern in der Sackgasse.** In einer Sackgasse löst
der Agent nichts aus der regulären Linie ab, sondern
**überlagert** es: ein neuer Eintrag ersetzt einen
Eintrag nur für die Sackgasse, der ursprüngliche gilt
für alle anderen Marken unverändert weiter, und nichts
wird zurückgesetzt.

**Rückfragen.** Trifft eine Überlagerung einen Stand,
der für die Sackgasse schon freigegeben oder aus der
Vormarke übernommen war, fragt er dich, ob er eine neue
Version ableitet oder den Stand belässt. Bevor die
Sackgasse abgeschlossen ist, fragt er dich, ob Teile
davon in die reguläre Linie übernommen werden sollen;
Übernommenes entsteht dort als eigener Eintrag für
`2.1`, der ablöst, was in `2.1` gerade gilt;
verschoben wird aus einer Sackgasse nichts. In Fällen,
die diese Regeln nicht abdecken, fragt der Agent dich.

**Doppelte Nachfolger.** Hat ein Vorgänger-Bugfix einen
Eintrag ersetzt, den `2.1` schon durch einen eigenen
Eintrag ersetzt hat, gelten für `2.1` zwei Nachfolger.
Der Agent legt dir solche Fälle bei der Rückkehr vor,
und du wählst: der Stand von `2.1` gilt, der Fix gilt,
oder beides wird zusammengeführt; bis dahin meldet der
Lint den Fall als Fehler.

**Kein Upgrade, kein Prozess-Upgrade.** Solange eine
Zwischenmarke läuft, gibt es weder ein Upgrade auf
einen neuen Stand der Vorlage noch ein Prozess-Upgrade;
der Agent verweist auf die Zeit nach der Rückkehr.

## Marken-Wechsel und Abschluss-Stand

Der Wechsel des `in-progress`-Zeigers läuft in festen
Schritten:

1. **Vollständigkeits-Scan** der abzuschließenden Marke.
   Der Agent legt die offenen Einträge der Marke vor —
   dazu die offenen Fehlermeldungen früherer Marken,
   die für sie gelten (nicht verworfene, keine
   Duplikate), denn über jeden bekannten offenen Fehler
   wird beim Abschluss entschieden: beheben, die
   Behebung verschieben oder aufschieben. Je Punkt
   entscheidest du: erledigen oder auf die nächste bzw.
   eine spätere Marke verschieben. Dabei gilt:
   - einen noch nicht eingefrorenen Eintrag hängt der
     Agent um; einen eingefrorenen — angenommenen —
     löst er durch einen neuen Eintrag für die spätere
     Marke ab;
   - einen Doku-Stand, der noch nicht freigegeben ist —
     „jetzt“ wie „später“ —, legt er vor: bei „jetzt“
     ist die Vorlage vor dem Wechsel Pflicht, bei
     erneutem „später“ folgt die Freigabe als Nachtrag
     (oben, „Dokumentation“);
   - eine Fehlermeldung bleibt bei der Marke ihrer
     Meldung (der Marke des Produkt-Stands, an dem der
     Fehler beobachtet wurde); ihre Behebung plant die
     Fix-Anforderung mit eigener Marke — oder, wenn die
     Lösung eine geänderte oder neue Anforderung ist,
     diese Anforderung, auf die die Meldung dann
     verweist;
   - liegt der Fehler in der Auslieferung, ist die
     Behebung ein weiterer Deploy-Stand derselben
     Umgebung mit einer Fix-Anforderung auf einen
     Deploy, die die Marke der Meldung behält — nach dem
     Abschluss ein Nachtrag zu dieser Marke (unten) —;
     sie wird nicht verschoben;
   - bei einer Sackgasse tritt die Rückfrage zur
     Übernahme an die Stelle des Verschiebens; bei der
     Rückkehr aus einem Vorgänger kommen doppelte
     Nachfolger zur Wahl;
   - beim Koordinator eines Komponenten-Verbunds auch
     offene Lieferungen.
   Gibt es keine künftige Marke mehr (die
   zurückgestellte Marke und eine folgende
   Zwischenmarke zählen als künftige Marke), fragt der
   Agent dich hier: eine Folge-Marke anlegen (er
   schlägt die Bezeichnung vor, du nennst sie) oder das
   Projekt ruhen lassen.
2. **Freigabe des Abschluss-Stands** durch dich — der
   Pflicht-Stand „für den Marken-Abschluss“, der alle
   freigegebenen Stände der Kette dieser Marke mit ihren
   Freigaben listet, einschließlich der übernommenen und
   der drei Doku-Stände (ein Doku-Stand mit „später“
   steht als offener Punkt und nach dem Wechsel im
   Nachtrag), und den Tag der Marke. Abgeschlossen ist
   die Marke damit noch nicht — das ist sie erst mit
   dem Wechsel
   (Schritt 4).
3. **Prüfung auf überholte Stände** im Abschluss-Stand;
   sind welche überholt, werden sie neu abgeleitet und
   freigegeben, der Abschluss-Stand wird als neue
   Version gebildet, und es geht bei Schritt 2 weiter.
   Ebenso, wenn der Tag nach der Freigabe des
   Abschluss-Stands und vor dem Wechsel noch korrigiert
   wird.
4. **Zeiger nachführen** — `current` auf die
   abgeschlossene, `in-progress` auf die nächste Marke
   der Abfolge; nach einer Zwischenmarke auf eine
   folgende Zwischenmarke oder, nach der letzten, zurück
   auf die zurückgestellte. Ruht das Projekt, zeigt
   `in-progress` auf keine Marke: das Register
   Zielmarken trägt dann die Zeile „Ruht seit <Datum>“,
   und wer später weitermacht, legt zuerst eine Marke
   an — dann legt der Agent dir die Übernahme der
   Stände der letzten Marke vor, der nachgeholte zweite
   Teil des Wechsels. Der Wechsel wird als Entscheidung
   gebucht („Marken-Wechsel von A zu B“ — ruht das
   Projekt, „Marken-Wechsel von A; Projekt ruht“ —, mit
   Verweis auf den Abschluss-Stand und der
   abgeschlossenen Marke A als `zielmarke:`). **Mit dem
   Wechsel ist die Marke abgeschlossen und
   eingefroren.** Elemente, die ab der neuen Marke
   abgelöst sind, wechseln auf „abgelöst“.
5. **Übernahme in die neue Marke:** Der Agent legt vor,
   welche Stände und ob der Tag weitergelten und welche
   für die neue Marke überholt sind; bei der Rückkehr
   aus einem Vorgänger führt er dessen Zweig in die
   Hauptlinie zurück und legt dir Konflikte vor.
   Komponenten, deren Übergabe weitergilt, erfahren die
   neue Marke per Nachricht.

Nach einer Migration bleibt die Übernahme-Marke
`in-progress`, bis ihre Pflicht-Stände abgeleitet sind;
der Abschluss läuft dann regulär nach diesen Schritten.
Abgeschlossene Marken aus einer Vorversion ohne
Abschluss-Stand gelten nach einem Upgrade als
abgeschlossen; ein Abschluss-Stand wird nicht
nachgebaut.

### Tag-Korrektur

Stellt sich der Tag **vor dem Wechsel** als falsch
heraus, setzt der Agent einen neuen mit neuer
Tag-Freigabe, die die alte ablöst; der Abschluss-Stand
führt den neuen Tag als neue Version — ein
versioniertes Dokument wird nie überschrieben, auch
nicht vor seiner Freigabe. War der Abschluss-Stand noch
nicht freigegeben, bleibt die vorige Version ohne
Freigabe liegen; war er es schon, gibst du die neue
Version erneut frei (Schritt 3).

**Nach dem Wechsel** prüft der Agent, ob das Produkt
zwischen altem und neuem Tag dasselbe ist. Saß der Tag
nur auf dem falschen Commit, setzt er den neuen Tag
nach deinem OK und bucht am Marken-Eintrag den Nachtrag
„Tag korrigiert: <alt> → <neu>, Inhalt unverändert“ —
der Abschluss-Stand bleibt, wie er ist; im Nachtrag
steht auch die neue Tag-Freigabe zu derselben Marke —
ein eigener Freigabe-Eintrag entsteht nicht —, und die
alte bleibt stehen. Hat sich das Produkt geändert, ist
es eine Patch-Marke.

### Nachtrag

Eine abgeschlossene Marke ist eingefroren. Was danach
bei unverändertem Produkt noch hinzukommt, wird als
**Nachtrag** am Marken-Eintrag gebucht — es ändert
nichts an der Marke.

**Ein weiterer Deploy-Stand.** Kommt nach dem Abschluss
noch ein Deploy-Stand hinzu, ohne dass sich in der
Kette bis zum Tag etwas ändert — dieselbe Software in
einer neuen Umgebung, oder eine Umgebung, die schon
einen Deploy-Stand hat und anders ausgerollt wird
(andere Konfiguration, anderes Zielsystem, anderer
Ablauf) —, wird er als Nachtrag am Marken-Eintrag
gebucht, und seine Freigabe steht in der
Nachtragszeile. Ein eigener Freigabe-Eintrag entsteht
nicht, nichts wird abgelöst, und die Freigabe wirkt wie
jede Freigabe eines Deploy-Stands (sie zählt als
Pflicht-Freigabe der Umgebung; ob und in welcher Form
eine Betriebs-Anleitung für diese Umgebung entsteht,
entscheidet die nachgestellte Zeile der Doku-Abfrage,
oben „Dokumentation“); ebenso die Tag-Korrektur bei
unverändertem Produkt (oben) und die Freigabe eines
Doku-Stands, der in der Doku-Abfrage „später“ erhielt
und erst nach dem Wechsel freigegeben wird. Zu einer Marke kann es
so beliebig viele Deploy-Stände geben; je Umgebung
gilt der jüngste, und ein weiterer Stand derselben
Umgebung ist eine neue Version desselben Dokuments.
Die Deployment-Elemente eines nachgetragenen Stands
und eine Entscheidung, die nur diese Umgebung betrifft,
tragen die Marke des nachgetragenen Stands, nicht die
laufende Marke. Der Abschluss-Stand, der die ältere
Fassung des Deploy-Stands nennt, bleibt eingefroren und
gilt weiter — der Agent liest den Verweis auf die
jüngste Fassung, wie bei der Tag-Korrektur.

**Doppelte Nachfolger aus einem Nachtrag.** Löst ein
Deployment-Element des Nachtrags ein Element ab, das
die laufende Folge-Marke schon durch ein eigenes
abgelöst hat, gelten für die Folge-Marke beide
Nachfolger; der Lint meldet das, und es gilt dasselbe
Verfahren wie bei doppelten Nachfolgern bei der
Rückkehr aus einer Zwischenmarke: der Agent legt beide
vor, du wählst — der Stand der Folge-Marke, der
Nachtrag oder eine Zusammenführung —, gebucht als
gewöhnliche Ablösung; der Nachtrag selbst bleibt, wie
er ist.

**Ein Fehler in der Auslieferung.** Liegt ein gemeldeter
Fehler nicht im Produkt, sondern in der Auslieferung
(etwa eine falsche Konfiguration), ist die
Fix-Anforderung dazu eine **Fix-Anforderung auf einen
Deploy**: ihre Umsetzung ist ein weiterer Deploy-Stand
derselben Umgebung, sie trägt die Marke des
ausgelieferten Produkts, nennt die Umgebung und ist mit
der Freigabe des Stands umgesetzt — keine Patch-Marke;
den freigegebenen Stand nennt sie als angehängten
Vermerk, weil sie selbst eingefroren ist. In
Release-Notes erscheint ein so behobener Fehler nicht —
weder in denen der Marke noch in denen einer späteren:
Release-Notes beschreiben die Software, und die ist
unverändert; ein Nachtrag löst auch keine neue Fassung
der Release-Notes aus. Dokumentiert ist die Behebung im
Nachtrag und an der Fehlermeldung, und der Fehlerstand
führt sie mit ihrem Status.

**Bestätigung und Wiedervorlage.** Mit der Freigabe des
Stands ist die Fehlermeldung umgesetzt; abgeschlossen
ist sie — zusammen mit der Fix-Anforderung — erst, wenn
du bestätigst, dass der Fehler behoben ist. Weil der
Agent vom Ausrollen nichts erfährt, fragt er dich bei
der Freigabe, wann er nachfragen soll (ein Datum oder
ein Anlass), und trägt sich das in `TODO.md` ein — eine
Erinnerung (Wiedervorlage) je Meldung, die er mit
deiner Bestätigung erledigt. Bestätigst du nicht, weil
der Fehler weiter auftritt, folgt eine weitere
Fix-Anforderung auf einen Deploy an derselben Meldung,
und er führt dieselbe Erinnerung mit der weiteren
Behebung fort. Sagst du „noch nicht“, fragt er, wann er
erneut nachfragen soll. Beim nächsten Marken-Wechsel
legt er dir unbestätigte Meldungen dieser Art noch
einmal vor; du kannst bestätigen, „noch nicht“ sagen
oder melden, dass der Fehler weiter auftritt.

**Was kein Nachtrag ist.** Ob eine Änderung am Eintrag
einer Zielumgebung (Hosts, Versionen, Zugangsverweise)
ein anderes Ausrollen ist oder nur Pflege, entscheidest
du je Fall; der Agent weist auf den möglichen weiteren
Deploy-Stand hin und fragt. Erneutes Ausrollen ohne
Änderung ist Betrieb — kein neuer Stand, keine
Freigabe. Eine Freigabe im Nachtrag ist kein
Meilenstein: die Marke ist abgeschlossen, am Produkt
ändert sich nichts, ein Wächter-Durchgang folgt nicht.
Ändert sich Produkt oder Spezifikation, ist es eine
neue Marke (z.B. eine Patch-Marke `2.0.1`) — läuft die
nächste Marke schon, als Zwischenmarke (oben); ein
anderes Ausrollen allein ist keine.

## Selbsttragende Stände und Ableitungen

Die meisten Stände sind **wiki-verweisend**: sie
verweisen auf Elemente und sind nur mit dem Wiki
vollständig lesbar. Für Empfänger ohne Wiki-Zugang gibt
es zwei Wege (oben, „Zwei Grade“): Entweder ist der
Stand selbst **selbsttragend** und geht nach außen —
die drei Doku-Stände Entwickler-Doku, Benutzer-Doku und
Betriebs-Anleitung, Pflicht-Stände der Kette mit
eigener Freigabe (oben, „Dokumentation“) — oder aus
einem freigegebenen Stand entsteht bei Bedarf eine
**selbsttragende Ableitung**: aus dem Testplan eine
Durchführungs-Instanz für menschliche Tester, aus dem
Abschluss-Stand Release-Notes. Eine Ableitung verweist
auf keine Elemente, und mit ihrer Freigabe friert nichts
Neues ein; ihr Kopf nennt Marke und Quell-Stand. Beides
— selbsttragende Stände wie Ableitungen — wird zu
seinem Anlass vollständig aus dem Wiki bzw. den
Quell-Ständen neu erzeugt, nicht von Hand nachgepflegt
(auch eine Einarbeitung oder ein Änderungsdokument
entsteht so) — ähnlich wie diese Erklärung, die ihre
Quellen und ihren Stand im Kopf nennt. Bei einer
Migration und nach einem Anheben der Vorlage bleiben
vorgefundene Dokumente in `docs/` als Nachweis liegen;
der erste Doku-Stand entsteht selbsttragend über die
Doku-Abfrage.

## Scaffolding

Der Software-Prozess sieht eine **Scaffolding-Phase**
vor: die gebündelte Klärung der Setup-Entscheidungen,
bevor die erste Fachlogik entsteht. Dann gilt der
Dreischritt **Fahrplan** (Übersicht ohne Optionen) →
**Vorlagen-Kette** (nummerierte Vorlagen, die je
höchstens drei bis vier zusammengehörige Entscheidungen
bündeln; was eine andere Entscheidung voraussetzt,
kommt später) → **Scaffolding-Commit** mit der
Nachricht `Initial project scaffolding`, genau einer je
Repository. Er markiert den Nullpunkt der Fachlogik,
nicht des Repositories — committet wird schon vorher.

Die Vorlagen-Kette des Software-Prozesses beginnt mit
der Vorlage „Git und Ablage“ (sie hängt von nichts ab),
dann folgen Zweck und Anforderungsskizze, Sprache und
Technologie-Stack, Struktur und Architekturmuster, die
Werkzeugkette und zuletzt Betrieb und Rechtliches
(CI-Pipeline, Zielumgebung, Lizenz und Sichtbarkeit des
Repos). Der Agent weist am Ende des Projektstarts auf
den Fahrplan und die erste Vorlage als nächsten Schritt
hin (siehe [Projektstart](Projektstart.md), „Der erste
Auftrag“).
