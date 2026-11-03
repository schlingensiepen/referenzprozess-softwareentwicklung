# Wiki und Register — Ordner, Fassaden, Knoten

> **Herkunft:** abgeleitet aus `../MasterPrompt.md`
> (Abschnitte 1 bis 4, 9), `../Wiki.md` (Abschnitte 1
> bis 10b), `../INIT.md` (Schritt 1, Kopier-Liste) und
> dem vorbereiteten `../wiki/` (`Fassaden.md`,
> `Aktivierter-Prozess.md`, `Facts.md`,
> `Entscheidungen.md`, `InterneMechanik.md`,
> `Katalog.md`, `Einfrieren-und-Abloesen.md`,
> `Lebenslauf-eines-Stands.md`, `Glossar.md`,
> `Standarddateien-Katalog.md`). Stand
> der Quellen: Starter-Commit `c7fbc93` (Version 2.1).
> Dieses Dokument ist aus den Quellen abgeleitet und
> wird bei Änderungen der Quellen auf deren Stand
> nachgezogen (zuletzt am 2026-11-03); eigene Inhalte
> bekommt es nicht — Änderungen gehören in die Quellen.

Zurück zur [Einführung](Einfuehrung.md).

## Die Ordner und ihre Rollen

| Ordner | Rolle | Verändert? |
|---|---|---|
| Root | Regel-Dokumente, Steuerdateien (`TODO.md`, `Tools.md`, `devstate_active.md`, Indizes), Arbeitsdokumente | lebend |
| `_template/` | der Starter als Template-Quelle (eingefrorene Kopie oder verknüpfte Vorlage), darunter `referenzprozesse/`, `tools/`, `upgrade/`, `docs/` | Nur-Lese für den Agenten |
| `raw/` | Originale, wie eingegangen, Originalname | nie durch den Agenten |
| `input/` | Volltexte der Originale als Markdown (`input/raw/`, `input/<quelle>/`) | nie |
| `research/` | Quellen, die der Agent bei Recherchen beschafft, je Recherche ein Ordner | unveränderlich ab Ablage |
| `tools/` | Projekt-Skripte des Agenten (Konverter, Prüfungen), in `Tools.md` registriert | lebend |
| `wiki/` | Quelle der Wahrheit: Fassaden und Detail-Knoten | lebend; keine Versionsnummern im Dateinamen, den Verlauf trägt git |
| `output/` | eingefrorene Übergabe-Stände, versioniert; `output/nachrichten/` für Nachrichten an andere Repos | neue Version statt Änderung |
| `overview/` | eingefrorene Auswertungen für dich selbst, versioniert; Wiki-Snapshots | neue Version statt Änderung |
| `outgoing/` | Versandstand-Ordner je Versand an Menschen | unveränderlich ab Erzeugung |

Der Software-Prozess bringt weitere Ordner mit, die als
freigegeben gelten (etwa die Quellordner des Codes);
ihre Freigaben bucht der Agent beim Projektstart als
Entscheidungen.

**Eiserne Regeln.** Der Agent verändert `raw/` und
`input/` nie — sie bleiben Nachweis und Zitiergrundlage.
Du darfst in `raw/` ersetzen oder ergänzen; das löst
Umwandlung und Übernahme neu aus. Einmal vergebene
Dateinamen werden nicht mehr geändert: in `output/` und
`overview/` zählt nur die Versionsnummer hoch, Wiki-Knoten
behalten ihren Namen, sonst brechen Verweise.
`_template/` wird nie beschrieben und nie gelöscht.

**Zusätzliche Ordner** darfst du anlegen; der Agent
legt selbst keine an, außer den Standardordnern und
Ordnern, die du freigibst oder die ein Prozess
deklariert. Jede Freigabe wird als Entscheidung gebucht;
Pfade, die eine Plattform zwingend vorschreibt (etwa
`.github/workflows/`), brauchen keine eigene Freigabe.

## Fassaden und Detail-Knoten

Das `wiki/` ist flach — keine Unterordner nach Typ
(einzige Ausnahme `wiki/templates/` mit Kopiervorlagen
für Setup-Dateien). Dateinamen sind lesbar, mit
Leerzeichen und Großschreibung
(`REQ-012 Anmeldung per E-Mail.md`,
`2025-03-11 Lastenheft Auftraggeber.md`); Umlaute
werden umschrieben (ae, oe, ue, ss). Knoten verweisen
aufeinander mit **Wikilinks** `[[Knotenname]]`; das
Wiki ist mit Obsidian lesbar (einem Notizprogramm für
Markdown-Dateien, das solche Verweise auflöst) — nötig
ist es nicht, jeder Texteditor genügt.

- **Fassaden** sind Übersichts-Knoten, je Thema genau
  eine. Jede Fassade beschreibt in ihrem Abschnitt
  `## Meta` selbst, wie sie gepflegt wird und welche
  Felder sie **kanonisch** führt (typisch den Status).
  Für den Überblick genügen die Fassaden; beim
  Sessionstart liest der Agent die wichtigsten
  vollständig (Landkarte, Facts, Fristen) und
  registriert die übrigen aktiven, um sie bei Bedarf
  zu lesen (die Liste steht in
  [Projektstart](Projektstart.md), „Was der Agent beim
  Sessionstart tut“).
- **Detail-Knoten** sind atomar: ein Knoten je
  zitierfähigem Wissensobjekt. Für Inhalt (Beschreibung,
  Kontext, Nachweis) ist der Detail-Knoten maßgeblich;
  für den Status die Fassade. Ändert der Agent ein
  kanonisches Feld, fasst er die Fassade an, der
  Detail-Knoten spiegelt; passiert es doch am Knoten,
  zieht er die Fassade im selben Vorgang nach.

Jeder Detail-Knoten trägt im Kopf (Frontmatter) seinen
Typ und seine Herkunft — bei einem Dokument den Pfad der
`input/`-Datei und des Originals, das Datum der
Übernahme. Beim Zitieren in Ausgangsdokumenten wird der
**Originalname** der Quelle genannt, nicht der
Wiki-Knoten.

Folgende Hilfsdateien pflegt der Agent automatisch; du
bearbeitest sie nicht: `wiki/index.md` (Katalog aller
Detail-Knoten nach Typ, je Knoten eine Zeile) und
`wiki/log.md` (Protokoll aller Übernahmen).

## Was in diesem Starter aktiv ist

Das `wiki/` kommt aus dem Starter vorbereitet; die
Landkarte `wiki/Fassaden.md` zeigt den Stand. Beim
Projektstart gibt es keine Fassaden-Auswahl — sie ist
Vorauswahl des Starters, und was deaktiviert ist, wird
per Zuruf reaktiviert.

**Pflicht-Fassaden**, in jedem Projekt aktiv und nicht
abschaltbar:

- **`Facts.md`** — Projekteinstieg, projektweite Fakten
  (dein Kürzel, die Tag-Konvention, die Pfade des
  Produkts) und **Stolpersteine**: Hinweise auf
  wiederkehrende Fehler des Agenten oder subtile
  Sachverhalte, die dauerhaft sichtbar bleiben sollen.
  Facts gehört dir; der Agent schreibt dort nur auf
  Anweisung. Stolpersteine überstimmen bei
  Widersprüchen die Detail-Knoten.
- **`Katalog.md`** mit den Einträgen `Katalog-<Name>.md`
  — das Verzeichnis der im Projekt zulässigen Typen:
  je Eintrag Zweck, Pflichtfelder, Datei-Konvention. Der
  Katalog kommt vorausgefüllt, einschließlich der
  Typen des Software-Prozesses, und wächst im
  Projektverlauf (unten).
- **`Fassaden.md`** — die **FassadenLandkarte**: welche
  Fassaden es gibt, wozu, ob aktiv oder deaktiviert,
  ob aus der Basis, einem Prozess oder projekt-eigen.
  Der Aktivierungs-Status lebt führend hier.
- **`InterneMechanik.md`** — das Steuerungs-Wissen des
  Projekts: Regel-Knoten (der aktivierte Prozess mit
  dem Herkunfts-Vermerk, der WorkspaceManager-Kontrakt,
  die Commit-Sprache, mitgelieferte Grundregeln) und
  die Mechanik-Knoten des Software-Prozesses. Hier
  steht, **wie** das Projekt arbeitet; der Katalog
  sagt, **welche Typen** es gibt; Facts, **was du**
  festgeschrieben hast.
- **`Zielmarken.md`** — das Register der **Marken**,
  der Zwischenziel-Anker deines Projekts (bei Software
  ein Release — ein Ergebnis, kein Datum). Die erste
  Marke legt der Agent beim Projektstart an, die
  Bezeichnung nennst du (mehr in
  [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
  „Zielmarken“).
- **`Entscheidungen.md`** — das Register der
  Entscheidungen; hier werden auch Freigaben und der
  Wechsel von einer Marke zur nächsten gebucht.

**Aktiv durch den Software-Prozess:** Anforderungen,
Funktionsbeschreibungen, Spezifikationen,
Fehlermeldungen, Testfälle, Testberichte, Deployments,
Zielumgebungen, die Softwaresystemarchitektur und das
Softwaresystemtest-Setup; aus der Basis dazu Ideen
(für zurückgestellte Entscheidungen), Agent-Berichte
(für die Prüfberichte), Rollen, Bedarfe und Szenarien
(mit RP-1 in der Form von User-Story und Use Case).

**Aktiv als Vorauswahl der Basis:** Mission Statement,
Chronologie, Fristen, Ansprechpartner, Glossar, Glossar
Review, Konzepte, Eingangsdokumente, Rechercheartefakte,
Personen, Organisationen.

**Deaktiviert**, als Datei vorhanden: Mission Statement
Long, Orte, Dinge, Mitgliedschaften, Aktenzeichen
(Vorfestlegung des Starters), Geschäftsbeziehungen
(Kunden, Wettbewerber, Partner — der Prozess empfiehlt
sie bei Produktentwicklung), der Contract-Index (wird
bei Rolle Koordinator aktiviert) sowie die beiden
SP-1-Fassaden Systemarchitektur und Systemtest-Setup,
die RP-1 durch die software-spezifischen abgelöst hat.

**Deaktivieren und reaktivieren.** Eine deaktivierte
Fassade bleibt als Datei liegen (`active: false`), wird
weder gelesen noch gepflegt und ist mit „reaktiviere X“
wieder einzuschalten — der Agent arbeitet dann die
Einmal-Anweisung aus der Template-Quelle ab und führt
die Landkarte nach. Fehlermeldungen setzen aktive
Anforderungen voraus; der Lint meldet den Widerspruch.

## Register

Viele Fassaden sind **Register**: eine Übersicht mit je
einer Zeile pro Eintrag, dahinter — wo nötig — ein
Detail-Knoten pro Eintrag. Einträge tragen nummerierte
Kennungen mit einem Präfix, das die Fassade in deinem
Projekt vorgibt — Entscheidungen `DEC-`, Ideen
`IDEA-`, Berichte `REP-`, Recherchen `REC-`; der
Software-Prozess bringt `REQ-`, `FUNC-`, `SPEC-`,
`BUG-`, `TEST-`, `DEPL-`, `ARC-` und weitere mit. Eine
Kennung wird nie wiederverwendet.

Die wichtigsten Register der Basis:

- **Entscheidungen** — jede Projekt-Wahrheit, die du
  mit dem Agenten festlegst, mit Wahl, Begründung,
  verworfenen Alternativen und Verweisen. Eine
  Entscheidung kommt
  **erst mit deinem OK** ins Register, direkt als
  „angenommen“; Entwürfe liegen nie im Wiki — der Agent
  legt dir den Entwurf vor und bucht erst nach deinem
  OK. Ab dann
  ist ihr Inhalt **eingefroren**: Was sich ändert, wird
  eine neue Entscheidung, die die alte vollständig
  ablöst (beide tragen den Verweis aufeinander); was
  nur präzisiert, wird als Vermerk angehängt. So bleibt
  datierbar, was wann galt. Vor jeder neuen
  Entscheidung durchsucht der Agent das Register nach
  verwandten Einträgen und nennt sie. Auch Freigaben
  von Ständen werden hier gebucht (siehe
  [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md)).
  Diese Eintrittsregel gilt für Entscheidungen und
  Contracts. Die **beschreibenden Register** eines
  Prozesses (mit SP-1 Funktionsbeschreibungen,
  Architektur, Spezifikationen, Testfälle, Deployments)
  arbeiten anders: Dort legt der Agent einen Eintrag
  als `offen` im Wiki an, mit seinem Vorschlag und den
  offenen Punkten im Eintrag selbst; eine Klärung mit
  dir ändert ihn direkt, bis er angenommen ist —
  einzeln („ja, so“) oder gesammelt mit der Freigabe
  des ersten Stands, der ihn verweist. Erst damit ist
  er eingefroren (siehe
  [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
  „Was ein Stand ist“).
- **Ideen** — unverbindliche Ideen und zurückgestellte
  Entscheidungen. Eine nicht getroffene Entscheidung
  ist keine Entscheidung, sondern eine Idee mit
  **Auslöser** (Datum oder Zielmarke): Wird der Auslöser
  fällig, holt der Wächter den Eintrag wieder hervor —
  der Prüfdurchgang, den der Agent zu festen Anlässen
  über Register und Zustände laufen lässt (siehe
  [Arbeitsweise](Arbeitsweise.md), „Wächter“).
- **Chronologie** (was ist wann passiert) und
  **Fristen** (offene Pflichten mit Fälligkeit, Sektionen
  Offen/Erledigt/Abgelaufen) — beide beim Einlesen von
  Dokumenten automatisch gefüllt; abgelaufene Fristen
  trägt der Agent beim Sessionstart um und meldet sie.
- **Eingangsdokumente**, **Personen**,
  **Organisationen**, **Ansprechpartner** — die beim
  Einlesen erkannten Dokumente, Beteiligten und
  Zuständigkeiten.
- **Glossar** und **Glossar Review** — freigegebene
  Terminologie und die Vorschläge in Bearbeitung; nur du
  gibst frei (siehe [Arbeitsweise](Arbeitsweise.md),
  „Dein Terrain“). **Konzepte** sammelt
  Sach-Wissen zu Fachbegriffen als eigene Knoten; das
  Glossar führt die Definition, der Konzept-Knoten
  erklärt den Zusammenhang.
- **Zielmarken** — die Planungs-Horizonte des Projekts
  (siehe
  [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md)).
- **Agent-Berichte** und **Rechercheartefakte** —
  Berichte von Prüf-Unteragenten und Ergebnisse
  externer Recherche; beides ist **Nachweis**, wird nie
  abgelöst, nur mit Vermerken ergänzt.

Die Register des Software-Prozesses — Anforderungen,
Funktionsbeschreibungen, Spezifikationen,
Fehlermeldungen, Testfälle, Testberichte, Deployments,
die Architektur mit ihren Komponenten — folgen demselben
Muster; welche Phase sie speisen, steht in
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md).

**Elemente und Nachweise.** Register-Einträge sind
entweder **Elemente** (ablösbar, gehen in Stände ein —
Entscheidungen, Ideen, Anforderungen, Marken-Einträge)
oder **Nachweise** (werden nie abgelöst — Berichte,
Recherchen, Nachrichten, eingegangene Dokumente).
Lebende Dinge ohne Einfrieren (Glossar, Rollen,
Konzepte, Personen, Fristen) werden für einen Stand
kopiert. Die Einzelheiten stehen in
`../wiki/Einfrieren-und-Abloesen.md`.

## Der Katalog wächst

Es ist erwartetes Verhalten, dass neue Typen entstehen.
Taucht ein Wissensobjekt auf, das keinem Typ entspricht,
schlägt der Agent einen neuen Katalog-Eintrag und eine
indexierende Fassade vor — legt sie aber nicht ohne
deine Bestätigung an, denn neue Typen sind
Struktur-Entscheidungen. Ungenutzte Typen bleiben still
im Katalog und erscheinen nicht im Index. Du kannst den
Katalog auch verkleinern.

**Fassaden-Promotion.** Erkennt der Agent eine Serie
gleichartiger Knoten ohne eigenes Register (schon wieder
ein ähnlicher Knoten, zum wiederholten Mal dieselbe
Sammel-Sektion), bietet er an, daraus eine Fassade zu
machen — mit Belegen, Vorschlag der Bauform und immer
der Gegen-Option „inline weiterführen“. Die Empfehlung
ist konservativ: eine Fassade muss sich verdienen. Bei
„später“ fragt er dich nach einem Zeitpunkt und trägt
eine Wiedervorlage in deine `TODO.md` ein; bei „nein“
hält er das im Entscheidungs-Register fest.

## Ingest — wie Dokumente ins Wiki kommen

Pro Datei in `input/`:

- Der Agent liest sie und erkennt die enthaltenen
  Einzeldokumente (ein Sammel-Scan wird getrennt).
- Je Einzeldokument entsteht ein Knoten mit Volltext,
  Metadaten-Block (Dokumenttyp, Datum, Absender,
  Empfänger …), einer Kurzzusammenfassung von vier bis
  acht Sätzen und Verweisen auf erkannte Personen,
  Organisationen und Begriffe.
- Datumsangaben werden eingetragen: Ereignisse in die
  Chronologie, Fristen ins Fristen-Register (mit einem
  „Frist gesetzt“-Vermerk in der Chronologie).
- Register, Index und Log werden nachgeführt, ein
  Commit gesetzt.

**Gewichtig.** Ereignisse, Fristen und Personen, die an
mehreren Stellen gebraucht werden, mehr Kontext tragen
oder einen Meilenstein markieren, bekommen zusätzlich
einen eigenen Detail-Knoten — als Vorschlag im
Aktion-Block am Ende des Ingests. Neue Fachbegriffe
(Konzepte) legt der Agent nur mit deiner Zustimmung an;
Facts-Vorschläge stehen sparsam im Frage-Block.

Scheitert eine Übernahme (unlesbares PDF, verschlüsselte
Datei), entsteht ein Skelett-Knoten mit dem Vermerk,
dass der Ingest fehlgeschlagen ist; nach besserer Vorlage
wird er ersetzt. Ist eine `input/`-Datei jünger als ihr
Knoten, bietet der Agent beim Sessionstart den
Re-Ingest an.

Bei Serien gleichartiger Dokumente (Messprotokolle,
Sprint-Berichte) bietet der Agent vor dem Einlesen ein
Namensschema an, das du als Entscheidung buchst. Bei
Namenskollisionen wird nie still eine Nummer angehängt;
der Agent fragt mit Vorschlag — wie bei der
Kollisionsfrage beim Projektstart und bei der
Migration.

## Versionierung in `output/` und `overview/`

Dateien dort heißen nach festem Schema:

```
<Datum> - <Absender> - <Empfänger> - <Dokumentname> - <Betreff> - <Gegenstand>_VV_TLA.ext
```

Felder, die nicht zutreffen, entfallen. `VV` ist die
zweistellige Version, `TLA` das Kürzel des Bearbeiters —
`AIG` für den Agenten, dein Kürzel für dich. Der Teil
vor `_VV_TLA` ist die **Ketten-ID** und bleibt über alle
Versionen gleich; eine Version wird nie überschrieben
oder gelöscht, eine Änderung ist eine neue Version.
Bei einem **Stand** entfallen Absender und Empfänger
immer, und die Marke steht nur in seinem Kopf, nicht
im Namen; gibt es zu einer Marke mehrere Stände eines
Typs (je Umgebung, je Komponente), steht der Gegenstand
im Namen. Status-Wörter wie „Entwurf“, „final“ oder
„freigegeben“ gehören in keinen Dateinamen in `output/`
oder `overview/` — die Ketten-ID ist unveränderlich,
ein solches Wort bliebe für immer stehen; ob und wofür
ein Stand freigegeben ist, steht nur im
Freigabe-Eintrag, und der Lint meldet ein solches Wort
als Hinweis.
Alles entsteht zunächst als Markdown; in ein anderes
Format wird erst konvertiert, wenn du den Inhalt für
abgeschlossen erklärst und es ausdrücklich verlangst.

Ein **Snapshot** friert auf deinen Wunsch einen
Wiki-Zustand zu einem Anlass (Frist, Meilenstein) in
einer `overview/`-Datei ein — ohne Wiki-Werkzeug
lesbar, mit Versionskette.

## Lint

`sh _template/tools/lint.sh` prüft aus dem Projekt-Root
mechanisch, was ohne Sprachmodell prüfbar ist:
Pflichtfelder nach dem Katalog, tote Wikilinks, doppelte
Kennungen, Ablösungen ohne Gegenstück, Status-Drift
zwischen Fassade und Knoten, Zielmarken, Stände und
Freigabe-Einträge. Der Agent ruft es vor jedem
Lint-Durchgang, vor Snapshots, vor den Wächter-Durchgängen,
nach einer Ablösung, beim Marken-Wechsel und am Ende
von Projektstart, Migration und Upgrade auf (der Aufruf
steht in `Tools.md`). Den Stichtag liest es aus dem
Herkunfts-Vermerk in `wiki/Aktivierter-Prozess.md` —
beim Projektstart das Datum des Starts, bei der
Migration der Übernahme-Tag, nach einem Upgrade dessen
Tag —, damit Pflichtfelder, die erst später in die
Vorlage kamen, nur für neue Knoten als Fehler zählen
und im Bestand als Hinweis; Altknoten aus einer
früheren Version meldet es als Hinweis mit
Überführungs-Angebot, nicht als Fehler; `--help`
erklärt alle Befund-Codes. Das Skript bleibt in
`_template/` und wird nicht ins Projekt kopiert.
Nicht-triviale Funde legt der Agent als Vorschläge vor;
triviale (fehlende Index-Zeilen) behebt er direkt.
