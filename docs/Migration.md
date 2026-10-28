# Migration — ein bestehendes Projekt ins Wiki überführen

> **Herkunft:** abgeleitet aus
> `../migration/MIGRATION.md`, den Migrations-Varianten
> in `../migration/` (`devstate_active.md`,
> `wiki/Zielmarken.md`, `wiki/Aktivierter-Prozess.md`,
> `wiki/Commit-Sprache.md`,
> `wiki/WorkspaceManager-Kontrakt.md`,
> `wiki/InterneMechanik.md`), `../INIT.md` (Schritt 0),
> `../setup/init-migration.sh` (als Implementierung der
> Kopier-Liste), `../README.md` und dem vorbereiteten
> `../wiki/` (`Zielmarken.md`, `Entscheidungen.md`,
> `Agent-Berichte.md`, `Glossar Review.md`,
> `Standarddateien-Katalog.md`); erzeugt am 2026-10-28
> aus dem Starter in Version 2.0. Dieses Dokument wird
> nicht von Hand nachgepflegt, sondern zu festen
> Anlässen neu aus den Quellen erzeugt.

Zurück zur [Einführung](Einfuehrung.md).

## Wann das der richtige Weg ist

Die Migration ist für ein Projekt gedacht, das sein
Wissen bisher in verstreuten Dateien sammelt — README,
Changelog, Aufgabenlisten, Architektur-Notizen, eine
Instruktionsdatei für den Agenten — und jetzt auf
diesen Starter umsteigt. Der Agent überführt dieses
Wissen ins `wiki/`, ohne eine vorgefundene Datei zu
verändern.

Zwei Abgrenzungen prüft der Agent vorab:

- **Arbeitet das Projekt schon mit diesem Starter oder
  mit der allgemeinen Vorlage** — erkennbar an
  `wiki/Aktivierter-Prozess.md` mit einem Abschnitt
  „Herkunft“ oder einem Feld „Template-Herkunft“ —,
  ist das keine Migration, sondern ein
  [Upgrade](Upgrade.md). Der Agent sagt es dir.
- **Die Migration führt in den Prozess für
  Softwareentwicklung** (RP-1 auf SP-1). Findet der
  Agent im Vorgefundenen keinen Software-Bezug — keinen
  Code, keine Software-Anforderungen, keine
  Architektur — oder ist er nicht sicher, fragt er dich
  im Fragen-Block, ob das der richtige Prozess ist oder
  ob du einen anderen nennst; bestehst du auf dem
  Software-Prozess, migriert er damit.

Du startest den Agenten im Projektordner mit dem Satz
aus der `../README.md`:

> Migriere das Projekt in diesem Verzeichnis nach der
> Anleitung unter
> https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.

Der Agent liest `migration/MIGRATION.md` direkt von der
Repo-URL. Die Anleitung ist sein Auftrag; das Regelwerk
zieht er erst heran, wenn eine Phase ihn dorthin
schickt — Kontext schonen geht vor Vollständigkeit.

## Die Grundsätze

Alles Weitere folgt aus drei Grundsätzen; wo ein Fall
in der Anleitung nicht ausdrücklich steht, entscheiden
sie:

- **Nichts geht verloren.** Nichts überschreiben,
  nichts löschen ohne deinen ausdrücklichen Wunsch.
  Darum steht der Sicherungs-Commit vor allem anderen,
  bleibt jede vorgefundene Datei unverändert liegen
  (Umbenennen ist die einzige Änderung), überschreibt
  keine Starter-Datei eine vorgefundene, und auch die
  Antwort „komplett integrieren“ bei einer Kollision
  löscht nichts, bis du das Löschen ausdrücklich sagst.
- **Alles wird einsortiert.** Was der Agent vorfindet,
  überträgt er in die Struktur der Vorlage oder
  verlinkt es; die Herkunft bleibt erkennbar. Darum
  nennt jeder übertragene Eintrag seine
  Herkunfts-Datei, bleiben Nachweise (alte
  Testergebnisse, Original-Changelogs,
  Betriebs-Anleitungen für Menschen) liegen und werden
  verlinkt statt übertragen, verlinkt die neue
  `TODO.md` jede Datei mit offenen Arbeiten, und was
  in keine Wissens-Klasse passt, kommt in eine
  Auffang-Datei — nie wird etwas verworfen.
- **Im Zweifel fragt er dich.** Gesammelt im
  Fragen-Block; danach arbeitet er autonom und
  berichtet bei echten Blockaden, statt zu blockieren.
  Status-Werte wählt er im Zweifel konservativ,
  Ungeklärtes landet in der Auffang-Datei.

Feste Regeln gibt es nur dort, wo eine Maschine liest
(der Lint und die Skripte: die Zeile `Template-Stand`,
die Übernahme-Marke, die Zuordnung neuer Elemente zu
einer Marke, der Kopf der Auffang-Datei) oder wo du
bewusst vom vernünftigen Standard abweichst (die neue
`TODO.md` entsteht immer, die Kollisionsfrage, die
Prozess-Nachfrage). Alles andere sind Beispiele unter
den Grundsätzen.

**Keine Ausführung ohne Zustimmung.** `git init`,
Einbindung und Kopier-Skript sind Angebote — der Agent
nennt das exakte Kommando und handelt erst nach deiner
Antwort. Ausgenommen sind genau zwei Commits, die er in
einem Satz ankündigt: der Sicherungs-Commit in einem
bestehenden Repo (er verändert keine Bestands-Datei)
und der Aufnahme-Commit (er nimmt nur auf, was du
freigegeben hast).

**Die Kollisionsfrage.** Für jede vorgefundene Datei
und jeden Ordner, deren Name mit etwas kollidiert, das
die Migration kopiert oder anlegt — typisch `wiki/`,
`devstate_active.md`, `TODO.md`, eine Instruktionsdatei
—, stellt der Agent im Fragen-Block die Frage mit drei
Möglichkeiten und gibt eine Empfehlung mit Grund; du
darfst gesammelt antworten („alles wie empfohlen“,
„überall (c)“):

- **(a) umbenennen und nur verlinken** — die Datei
  bleibt umbenannt und unverändert liegen, ihr Inhalt
  wird nicht übertragen; die Starter-Datei wird
  angelegt und verlinkt sie;
- **(b) komplett integrieren** — ihr Inhalt geht
  vollständig an seinen Ort im Wiki oder in die
  Starter-Datei; gelöscht wird nur auf deinen
  ausdrücklichen Wunsch, sonst bleibt die Datei bis
  dahin umbenannt liegen; der Agent empfiehlt nie von
  sich aus das Löschen;
- **(c) integrieren und alte Fassung behalten** —
  Inhalt wie (b), die Datei zusätzlich wie (a).

Der umbenannte Name folgt dem Schema
`<Name>-vorgefunden.<Endung>` im selben Ordner (für
einen Ordner `<Name>-vorgefunden/`); der Agent schlägt
ihn vor, du bestätigst oder nennst einen anderen.
Reihenfolge: erst umbenennen, dann die ausgelassene
Starter-Datei einspielen, dann buchen. Inhaltsgleiche
Dateien sind keine Kollision. Für eine vorgefundene
`TODO.md` empfiehlt der Agent (c): die Punkte werden
einsortiert, die Datei bleibt als `TODO-vorgefunden.md`
und wird von der neuen `TODO.md` verlinkt. Eine
vorgefundene Instruktionsdatei ist ebenfalls ein
Kollisionsfall — die neue verlinkt die umbenannte.

## Was du vorher wissen solltest

- Die Migration braucht ein git-Repository. Fehlt es,
  bietet der Agent `git init` an und wartet; ohne Repo
  ruht die Migration. Deine Zustimmung zu `git init`
  gilt auch für den ersten Commit.
- Der Starter wird wie beim Projektstart als
  `_template/` eingebunden — verknüpfte Vorlage oder
  eingefrorene Kopie (siehe
  [Projektstart](Projektstart.md), Schritt 0). Er wird
  nie beschrieben, nie gelöscht und bleibt dauerhaft als
  Nachschlage- und Upgrade-Quelle.
- Dein `wiki/` kommt **vorbereitet**: eine Kopie des
  Starter-Wikis plus sechs **Migrations-Varianten**,
  die der Agent eintauscht — jede ist das Pendant der
  Frisch-Fassung mit genau einem Unterschied:
  `devstate_active.md` zeigt auf die
  Migrations-Anleitung; die Zielmarken nennen als erste
  Marke die Übernahme-Marke statt der Marke des Starts;
  der Herkunfts-Vermerk trägt das Übernahme-Datum; die
  Commit-Sprache bleibt für die Dauer der Migration die
  bisherige; den WorkspaceManager übernimmt der Agent
  für die Dauer der Migration selbst; die
  Steuerungs-Übersicht verweist auf die
  Migrations-Anleitung statt auf den Projektstart. Du
  baust kein Wiki, du füllst eines.
- Subagenten, Reviews und Commits sind
  werkzeug-agnostisch; ohne Subagenten arbeitet der
  Agent die Aufträge sequenziell selbst ab.

## Phase 0 — Sicherung und Aufnahme

Die Reihenfolge ist fest: Sicherungs-Commit des
Alt-Zustands → Einbindung mit Modus-Frage → Kopie
(Skript oder von Hand, als Angebot) → Aufnahme-Commit.
So trennt die Historie sauber „vorher“ von „Starter
da“.

1. **Sicherung zuerst.** Der Agent committet den
   unveränderten Alt-Zustand, **vor** der Einbindung:
   „Sicherung vor Wissens-Migration“. Dabei gelten
   Schutzregeln für jeden Commit der Migration: Ist
   nichts zu committen, gilt der aktuelle Stand als
   Sicherung (kein leerer Commit). Ignorierte Dateien
   bleiben ignoriert. **Offensichtlich sensible
   Dateien** unter den ungetrackten (`.env`, Schlüssel,
   Zertifikate, Namen mit `secret` oder `token`) und
   sehr große Dateien (über 50 MB) nimmt er nicht auf,
   sondern nennt sie dir — du committest sie selbst
   oder trägst sie in `.gitignore` ein. Fehlt die
   git-Identität, fragt er danach. Bei laufendem Merge
   oder Rebase, abweisendem Hook, verlangter Signatur
   oder eingebetteten fremden Repos committet er nicht,
   beschreibt die Lage und wartet.
2. **Einbindung** nach deiner Antwort auf die
   Einbindungs-Frage — nach dem Sicherungs-Commit, vor
   dem Aufnahme-Commit.
3. **Projektdateien anlegen (Angebot).** Der Agent
   bietet zwei Wege an und kopiert erst nach deiner
   Zustimmung: das Kopier-Skript
   `sh _template/setup/init-migration.sh` (empfohlen:
   deterministisch, überschreibt nichts, listet
   Kollisionen) oder von Hand nach der Kopier-Liste in
   `MIGRATION.md`; die Liste ist der führende Ort, das
   Skript ihre Implementierung. Kopiert werden dieselben
   Dateien wie beim Projektstart (Regelwerk,
   Styleguides, `.gitignore` nur wenn keine da ist,
   das komplette `wiki/`, `devstate_active.md`); danach
   werden die sechs Varianten eingetauscht. Nie kopiert
   werden `referenzprozesse/`, `tools/`, `upgrade/`,
   `README.md`, `INIT.md`, `migration/`, `docs/`,
   `setup/`, `LICENSE` — ein vorgefundenes `docs/`
   bleibt unberührt. Kollidierende Starter-Dateien
   bleiben ausgelassen und gelistet (auch ein
   Varianten-Ziel, das kollidiert); ein vorgefundenes
   `wiki/`, das nicht aus diesem Starter stammt, ist
   **eine** Kollision auf Ordner-Ebene — nichts wird
   hineinkopiert, keine Variante dorthin getauscht.
   Nach deiner Antwort im Fragen-Block benennt der Agent
   um und lässt das Skript erneut laufen oder kopiert
   von Hand.
4. **Herkunft vermerken.** Nach der Kopie, vor dem
   Aufnahme-Commit, schreibt der Agent in den Abschnitt
   `## Herkunft` von `wiki/Aktivierter-Prozess.md`:
   `Template-Stand: 2.0 seit JJJJ-MM-TT` mit dem
   **Übernahme-Tag** — dem Tag des Aufnahme-Commits; er
   ist der Stichtag, den der Lint liest, und das Datum
   in der Bezeichnung der Übernahme-Marke —, die
   `Quelle` (Repo-URL und Stand) und den
   `Anbindungs-Modus`.
5. **Aufnahme-Commit** — Einbindung, Kopie und
   Herkunfts-Vermerk, angekündigt, nicht erfragt:
   „Starter aufgenommen“. Hast du Einbindung und Kopie
   selbst vorgenommen und ist der Alt-Zustand noch
   ungesichert, sichert der Agent alles in einem Commit
   und vermerkt die fehlende Trennung in der
   Commit-Nachricht.

Commit-Texte sind bis zur Sprach-Frage in Phase 5
sinngemäß in der bisherigen Projektsprache zulässig.
Ab jetzt endet jede abgeschlossene Phase mit einem
Commit.

## Phase 1 — der Fragen-Block

Der Agent zeigt dir zuerst die Übersicht der Punkte
(je eine Zeile) und bietet den Briefing-Modus an;
sonst stellt er alle Fragen in **einem** Block,
nummeriert, je Punkt sein Vorschlag zuerst. Was der
Starter vorfestlegt, fragt er nicht.

1. **Prozess-Nachfrage** — nur ohne Software-Bezug
   oder bei Zweifel. Nennst du einen anderen Prozess,
   geht die Transformation in die Struktur dieses
   Prozesses: Das kopierte Software-Wiki ersetzt der
   Agent durch das Basis-Wiki und das Paket des
   gewählten Prozesses aus `_template/referenzprozesse/`;
   Herkunfts-Vermerk, Übernahme-Marke und die
   Unterschiede der Varianten gelten sinngemäß für
   ihre Pendants; im Mapping (Phase 3) nimmt eine
   Wissens-Klasse, deren Ziel es im gewählten Prozess
   nicht gibt, die Fassade dieses Prozesses mit
   demselben Zweck, sonst die Auffang-Datei. Der
   Starter bleibt `_template/`.
2. **Wissensbasis-Dateien bestätigen.** Der Agent
   listet alle Dateien und Ordner, die er als bisherige
   Wissensträger erkennt (er liest dafür nur
   Datei-Namen und Kopfzeilen, nicht die Volltexte),
   und kennzeichnet die mit **offenen Arbeiten**
   (Aufgabenlisten, Roadmaps, TODO-Abschnitte) — sie
   verlinkt die neue `TODO.md`. Du streichst oder
   ergänzt.
3. **Prüf-Modelle.** Der Agent nennt, welches Modell er
   selbst ist, und schlägt für die Absicherung in
   Phase 4 zwei Prüfer verschiedener Modelle vor,
   möglichst beide ungleich seinem eigenen. Gibt es nur
   ein Modell: frische Agenten desselben Modells in
   neuem Kontext — ausdrücklich als schwächere
   Absicherung benannt. Dazu die Wahl des
   **Ersatzwegs** für alle späteren Prüfungen ohne
   zweites Modell: dasselbe Modell in frischem Kontext
   oder du als Prüfer — dann prüfst du in Phase 4 nach
   der Vorprüfung selbst.
4. **Sprache.** Vorschlag: für die Dauer der Migration
   die bisherige Sprach-Regelung beibehalten; die
   reguläre Frage kommt in Phase 5 — ein Wechsel
   während der Migration vermischt Transformation und
   Übersetzung.
5. **Rolle** des Projekts: Standalone, Koordinator
   (mehrere Komponenten-Repos unter diesem Projekt)
   oder Komponente. Bei Koordinator kündigt der Agent
   an, dass er in Phase 5 den Contract-Index aktiviert.
6. **Übernahme-Marke.** Die Migration legt als erste
   Marke `Uebernahme-JJJJ-MM-TT` an (Datum ist der
   Übernahme-Tag; Benennung „Übernahme des
   vorgefundenen Stands“). Der Agent erfragt die
   Beschreibung: die vorgefundene Version, falls es
   eine gibt (etwa „ausgeliefert als 3.4“).
7. **Bestands-Ordner.** Der Agent listet die
   vorhandenen Root-Ordner (`src/`, `data/` …) und
   schlägt vor, sie in Phase 3 als Freigaben zu buchen
   — je ein Eintrag im Entscheidungs-Register. `tools/`
   ist Standard-Ordner und braucht keine Freigabe.
8. **Kollisionsfrage** aus Phase 0, falls es
   Kollisionen gab.

**Antworten einarbeiten.** Der Agent löst Kollisionen
auf (umbenennen, ausgelassene Starter-Dateien und
Varianten einspielen, Links setzen; Links in
vorgefundenen Dateien zieht er nicht nach — bricht
einer, notiert er die Stelle für den Bericht zur
Gesamt-Annahme), baut bei einem anderen Prozess das
`wiki/` um, trägt Rolle und Commit-Sprache ein und
legt die **Übernahme-Marke** an — vor dem ersten neuen
Eintrag, weil jedes neue Element sie trägt. Dann
Commit.

## Phase 2 — der Arbeitsmodus

Ab hier arbeitet der Agent **autonom bis zum Ende von
Phase 4** — keine Rückfragen außer bei echten
Blockaden; Ausgabe sind knappe Erledigt-Blöcke je
Etappe. Dabei gilt:

- **Übernommenes ist Bestand, Neues trägt die Marke.**
  Elemente aus dem Vorgefundenen (Anforderungen,
  Fehler, Entscheidungen, Architektur, Deployments,
  Testfälle …) tragen keine Zielmarke und kein
  Anlage-Datum — sie gelten ab ihrer Annahme für jede
  Marke; der Lint meldet das fehlende Feld als Hinweis,
  nachgetragen wird nichts. Was die Migration **neu**
  anlegt (die Freigaben der Bestands-Ordner, die
  Gesamt-Annahme, die Entscheidungen aus Phase 5),
  trägt die Übernahme-Marke und sein Anlage-Datum.
- **Keine erfundenen Daten.** Niemals rekonstruierte
  Datumsangaben, Zahlen oder Fakten. Einschätzungen
  sind erlaubt — etwa die Status-Wahl nach dem, was
  Code oder Vorgefundenes belegt; im Zweifel „offen“
  und der Fall in die Auffang-Datei.
- **Nichts löschen.** Die alten Wissensbasis-Dateien
  bleiben unverändert liegen, als eingefrorene
  Nachweis-Schicht. Aufräumen ist ein Vorhaben nach der
  Übernahme-Marke.

## Phase 3 — die Transformation

Jede Wissens-Klasse in deinen Dateien hat genau ein
Ziel im `wiki/`. Eintragsformat, Kennungs-Präfix und
Zählung liest der Agent je Ziel aus dem Abschnitt
`## Meta` der Fassade. Die Zuordnung:

| Was du bisher in Dateien hattest | Wohin es kommt |
|---|---|
| Anforderungen, Features, Soll-Verhalten | Register Anforderungen (Status nach Beleg) |
| Wünsche mit Begründung; beschriebene Abläufe | Register Bedarfe bzw. Szenarien (mit RP-1 in der Form von User-Story und Use Case) |
| Bekannte Fehler, offene Bugs, Workarounds | Register Fehlermeldungen („offen“, solange nicht bestätigt) |
| Spezifikations-Texte, Funktions-Beschreibungen (Außensicht) | Register Funktionsbeschreibungen — der Standard; nur echte Bauanleitungen für die Umsetzung in die Spezifikationen |
| Getroffene Festlegungen, Beschlüsse | Entscheidungs-Register (Technologie-Festlegungen entsprechend gekennzeichnet) |
| Architektur- und Strukturwissen — Soll **und** dokumentierter Ist-Stand | Softwaresystemarchitektur (Komponenten als Entitäten; Ist als eigener Abschnitt kenntlich) |
| Schnittstellen zwischen Komponenten | nur bei Rolle Koordinator: Contract-Index; sonst Architektur bzw. Spezifikation |
| Installation und Betrieb je Umgebung | Deployments und Zielumgebungen; Betriebs-Anleitungen für Menschen bleiben als Nachweis liegen und werden später selbsttragend neu erzeugt |
| Test- und Prüf-Aufbau | Softwaresystemtest-Setup |
| Testfälle | Register Testfälle |
| Alte Testergebnisse | kein Testbericht — Nachweis in den Rechercheartefakten; der erste Testbericht entsteht im ersten Testdurchgang danach |
| Fachbegriffe, Definitionen | Glossar Review als **Vorschläge** — das Glossar gehört dir und wird nie direkt beschrieben; gesammelte Freigabe in Phase 5 |
| Betriebs- und Steuerungsregeln, Konventionen, Coding-Style | Regel-Knoten in der Steuerungs-Übersicht (InterneMechanik) |
| Entwickler-How-tos, Setup- und Build-Anleitungen | Muster-Knoten dort, einer je Anleitung |
| Werkzeug- und Skript-Doku | `Tools.md` im Root (aus der Kopiervorlage; dort auch der Lint und der Ersatzweg aus Phase 1) |
| Changelog, Release-Notizen | Chronologie (verdichtet; das Original bleibt als Nachweis liegen und wird verlinkt) |
| Externe Quellen, Literatur, Links | Rechercheartefakte bzw. die Bezüge des jeweiligen Fach-Knotens |
| Offene Fragen an dich | `Offene Fragen.md` im Root |
| Offene Arbeiten (Aufgabenlisten, Roadmaps, TODO-Abschnitte) | je Punkt: geplant → Anforderungen; unverbindlich → Ideen; operativ-kurzfristig → `devstate_active.md` — **und** die Datei wird aus der neuen `TODO.md` verlinkt |
| Beteiligte, Zuständigkeiten | Ansprechpartner, Personen, Organisationen |
| Zeitgeschehen, Meilensteine der Historie | Chronologie (grobe Epochen genügen) |
| Ideen, Vielleicht-später | Register Ideen |
| Nutzer-Rollen | Register Rollen |
| Projekt-Identität, Stolpersteine, Einstieg | Mission Statement und `wiki/Facts.md` (dabei deren Einmal-Anweisungen aus `_template/` abarbeiten) |
| **Nicht mehr sicher Rekonstruierbares — und alles, was in keine Zeile passt** | `wiki/Migrations-Grundlagen.md`, die Auffang-Datei (unten) |

**Die Auffang-Datei** `wiki/Migrations-Grundlagen.md`
gibt es nicht als Vorlage; der Agent legt sie bei
erstem Bedarf an, mit den Abschnitten Festlegungen,
Ungeklärt, Herkunft (dort auch die Umbenennungen aus
der Kollisionsfrage) und Vermerke. Formal ist sie eine
Entscheidung mit der nächsten freien Nummer, die für
die Gesamt-Annahme reserviert ist; bis zur
Register-Zeile meldet der Lint einen erwarteten
Hinweis. Einzelpunkte daraus können später zu eigenen
Entscheidungen befördert werden.

**Vorgehen.** Pro Wissensbasis-Datei ein Durchgang —
bei vielen Dateien mit Subagenten, einer je Datei oder
Themen-Bündel, die nur ihre Datei und die
Ziel-Fassaden lesen, jeden Baustein genau einer Zeile
der Tabelle zuordnen, die Quelle je Eintrag nennen,
nichts doppelt anlegen und nicht committen. Nach jedem
Durchgang führt der Agent die Register-Stände nach und
committet. Am Ende der Phase legt er die **neue
`TODO.md`** an — immer, auch wenn das Projekt keine
Aufgabenliste hatte: sie verlinkt jede vorgefundene
Datei mit offenen Arbeiten, je mit einer kurzen Angabe,
was die Datei enthält und wohin ihre Punkte eingeordnet
wurden; eine umbenannte `TODO-vorgefunden.md` steht
darunter. Dazu bucht er die Freigaben der
Bestands-Ordner, ergänzt `Tools.md`, aktualisiert
`devstate_active.md` und committet.

## Phase 4 — die Absicherung

1. **Maschinelle Vorprüfung.** Die beiden in Phase 1
   bestätigten Prüfer prüfen als frische Agenten
   unabhängig voneinander: Vollständigkeit (Stichprobe
   jeder Wissensbasis-Datei gegen das Wiki — fehlt
   Substanz?), Treue (verfälschen Einträge ihre
   Quelle?), Zuordnung (alles am richtigen Ort nach der
   Tabelle?), Register-Hygiene (Formate, Status-Werte,
   Quell-Verweise, Bestand ohne Marke und Datum, Neues
   mit beidem, keine erfundenen Daten) und der Lint
   ohne Fehler. Jeder schreibt genau einen Bericht mit
   Ampel (grün, gelb, rot) und nummerierten Befunden.
2. Jeden Bericht legt der Agent zuerst im Register
   Agent-Berichte ab, dann fasst er zusammen.
3. **Beide grün → weiter.** Sonst: Befunde
   nacharbeiten, Commit, Kurz-Re-Check beider Prüfer —
   höchstens drei Runden. Danach endet die Vorprüfung
   mit einem **Konvergenz-Bericht** an dich
   (wiederkehrende Befunde, Ursache,
   Handlungsoptionen) statt mit Grün; ein Befund, der
   nach Nacharbeit in gleicher Form wiederkehrt, geht
   sofort an dich.
4. **Du als Prüfer.** Hast du in Phase 1 den Ersatzweg
   „Anwender als Prüfer“ gewählt, prüfst du jetzt das
   Ergebnis der Vorprüfung; dein Urteil hält ein
   eigener Bericht fest.
5. **Gesamt-Annahme.** Der Agent legt dir den Bericht
   über die unsicheren Stellen vor — Ungeklärtes aus
   der Auffang-Datei, konservativ gewählte Status,
   durch Umbenennung gebrochene Links in vorgefundenen
   Dateien. Du bestätigst die Rekonstruktion als
   Ganzes; damit bucht der Agent die Entscheidung
   „Migrations-Grundlagen als Gesamtpaket angenommen“
   mit der Übernahme-Marke. Sammel-Register dürfen
   offen bleiben.
6. Abschluss-Commit der Phase.

## Phase 5 — die Restfragen

Jetzt — und erst jetzt — die verbliebenen Fragen des
Projektstarts; Vorfestgelegtes wird nicht erneut
gefragt. Entscheidungen daraus tragen die
Übernahme-Marke und ihr Anlage-Datum.

1. **Glossar-Freigabe:** die im Glossar Review
   gesammelten Vorschläge gebündelt; Freigegebenes
   übernimmt der Agent ins Glossar.
2. **Sprach-Frage** regulär (A Projektsprache, B
   Sprache folgt Artefakt, C Englisch).
3. **WorkspaceManager verfügbar?** — beide Rollen;
   die Antwort ersetzt die Vorbelegung aus der
   Variante.
4. **Ein Repo oder zwei?** — Entscheid jetzt, Umsetzung
   als erstes Vorhaben nach der Übernahme-Marke.
5. **Instruktionsdatei** des Agenten (z.B.
   `CLAUDE.md`) nach dem MasterPrompt, einschließlich
   des Grundgesetzes „das `wiki/` ist die Quelle der
   Wahrheit“; eine vorgefundene Instruktionsdatei ist
   ein Kollisionsfall aus Phase 1 — die neue verlinkt
   die umbenannte.
6. Bei **Koordinator**: Contract-Index aktivieren.
7. **Kein Marken-Wechsel:** Die Übernahme-Marke bleibt
   `in-progress`, keine Marke trägt `current`; in der
   Migration entstehen keine Stände. Erste Aufgabe
   danach: die Pflicht-Stände der Marke ableiten und
   nach der Kettenprüfung zur Freigabe vorlegen; der
   Abschluss läuft regulär über Abschluss-Stand und
   Marken-Wechsel (siehe
   [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md)).
8. **Abschluss-Buchung:** Chronologie-Eintrag
   „Migration abgeschlossen“ mit Template-Stand,
   Quelle und Modus wie im Herkunfts-Vermerk. Eine
   vorgefundene README bleibt; der Agent schlägt dir
   vor, dort die Einstiege zu ergänzen
   (Instruktionsdatei, `wiki/`, diese Erklärung unter
   `_template/docs/Einfuehrung.md`).
9. **Lint** ohne Fehler; Hinweise zu Bestand ohne Feld
   sind erwartet.
10. Abschluss-Commit. `_template/` bleibt dauerhaft
    liegen. Ab hier gilt der normale Betrieb; die
    Migrations-Anleitung liegt nicht in deinem Projekt,
    es gibt keinen Selbst-Abbau.

## Was danach anders ist als bei einem neuen Projekt

- Die erste Marke heißt `Uebernahme-JJJJ-MM-TT`, nicht
  „1.0“; sie bleibt `in-progress`, bis du ihre
  Pflicht-Stände abgeleitet und den Abschluss regulär
  vollzogen hast.
- Übernommene Elemente sind Bestand ohne Marke und
  Anlage-Datum; der Lint meldet das als Hinweis, nicht
  als Fehler.
- Deine alten Dateien liegen unverändert da — teils
  umbenannt mit dem Zusatz `-vorgefunden`, verlinkt aus
  der Starter-Datei, der neuen `TODO.md` oder der
  Auffang-Datei.
- Die Auffang-Datei `wiki/Migrations-Grundlagen.md`
  hält, was nicht sicher rekonstruierbar war; sie ist
  als Gesamtpaket angenommen, und ihre Punkte können
  später einzeln zu Entscheidungen werden.
