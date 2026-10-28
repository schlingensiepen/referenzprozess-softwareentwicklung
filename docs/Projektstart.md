# Projektstart — vom leeren Ordner zum ersten Auftrag

> **Herkunft:** abgeleitet aus `../INIT.md`,
> `../README.md`, `../MasterPrompt.md` (Abschnitte 1,
> 2, 5.3, 8), `../setup/init-frisch.sh` (als
> Implementierung der Kopier-Liste) und dem
> vorbereiteten `../wiki/` (`Aktivierter-Prozess.md`,
> `Init-Choreografie.md`, `Fassaden.md`,
> `Standarddateien-Katalog.md`,
> `WorkspaceManager-Kontrakt.md`,
> `Two-Repo-Submodul-Muster.md`,
> `Instruktionsdatei-Pflege.md`, `Marken-RP-1.md`,
> `templates/Tools-Vorlage.md`); erzeugt am 2026-10-28
> aus dem Starter in Version 2.0. Dieses Dokument wird
> nicht von Hand nachgepflegt, sondern zu festen
> Anlässen neu aus den Quellen erzeugt.

Zurück zur [Einführung](Einfuehrung.md).

Dieses Dokument beschreibt den Weg **Neues Projekt**.
Für ein Projekt, das schon Wissen in verstreuten
Dateien sammelt, gilt die [Migration](Migration.md);
für ein Projekt, das schon mit dieser oder der
allgemeinen Vorlage arbeitet, das
[Upgrade](Upgrade.md).

## Was du brauchst

- einen **Projektordner**, leer oder fast leer, und
  `git`. Fehlt ein git-Repository, bietet der Agent
  `git init` an; lehnst du ab, ruhen alle Schritte mit
  Commit-Anteil, bis ein Repo da ist. Ein Ordner mit
  einer gewachsenen Wissensbasis ist kein Fall für
  diesen Weg, sondern für die Migration — der Agent
  sagt es dir;
- einen **KI-Agenten**, der im Projektordner arbeiten
  kann (Claude Code, Cursor, Windsurf oder ein anderer
  — der Starter ist KI-agnostisch) und Dateien von
  einer Repo-URL lesen darf;
- **Internet-Zugriff auf GitHub** beim Einrichten der
  Einbindung; bei der verknüpften Vorlage auch, wenn
  jemand dein Projekt später klont und die Vorlage
  mitholt.

Ob ein Konvertierungs-Werkzeug (WorkspaceManager)
vorhanden ist, musst du vorher nicht klären — der Agent
fragt danach und übernimmt die Aufgabe sonst selbst.

## Was du vorher klärst

Der Agent fragt alles Übrige im Gespräch; vorab lohnt
sich nur, worüber du nachdenken musst:

- **Anbindung: verknüpfte Vorlage oder eingefrorene
  Kopie?** Nimm die **verknüpfte Vorlage** (empfohlen;
  technisch ein git-Submodul, das auf einen festen
  Stand gepinnt ist), wenn du spätere Stände des
  Starters gezielt ziehen willst; wer dein Projekt
  später klont, holt die Vorlage mit
  `git clone --recursive` mit. Nimm die **eingefrorene
  Kopie** (technisch eine Einmal-Kopie ohne
  Git-Verbindung, ca. 3 MB, mit dem Projekt
  gespeichert), wenn du immer sehen willst, womit du
  gestartet bist, oder wenn kein Submodul möglich ist;
  neuere Stände übernimmst du später durch bewussten
  Austausch der Kopie — das erledigt der Agent beim
  Anheben. Was die beiden Bauformen tun, steht in
  Schritt 0.
- **Passt der Software-Prozess?** Der Starter bringt
  RP-1 auf SP-1 mit und fragt nicht danach. Nur wenn
  der Agent erkennt, dass das Vorhaben nicht dazu
  passt, oder wenn er unsicher ist, fragt er dich, ob
  das der richtige Prozess ist — und richtet das
  Projekt auf Wunsch mit einem anderen Prozess aus
  `_template/referenzprozesse/` ein (siehe
  [Referenzprozesse](Referenzprozesse.md)).
- **Rolle des Repos:** **Standalone** (ein einzelnes
  Repo, der Standardfall), **Koordinator** (das Repo,
  das ein System in Komponenten zerlegt) oder
  **Komponente** (dann startest du mit dem Startprompt
  deines Koordinators, und die Frage entfällt). Mehr
  in [Zusammenarbeit mehrerer Repos](Mehrere-Repos.md).
- **Ein Repo oder zwei?** Zwei nur, wenn Arbeit und
  vorzeigbares Produkt getrennte Historien bekommen
  sollen (etwa Produkt öffentlich, Arbeit privat).
- **Dein Bearbeiter-Kürzel** (drei Buchstaben) und die
  **Sprache der Commit-Nachrichten** (unten, Schritt 3).
- **Die Bezeichnung der ersten Marke** — bei einem
  Softwaresystem typischerweise „1.0“ („Erster
  Release“); der Agent schlägt sie vor.

## Schritt 0 — die Einbindung

Starte den Agenten im Projektordner mit dem Satz aus
der `../README.md`:

> Richte dieses Verzeichnis als neues Projekt nach der
> Anleitung unter
> https://github.com/schlingensiepen/referenzprozess-softwareentwicklung
> ein.

Der Agent liest `INIT.md` direkt von der Repo-URL und
stellt dir **als allererste Frage** die
Einbindungs-Frage: Wie soll die Vorlage in dein Projekt
kommen? Sie landet in beiden Fällen im Ordner
`_template/` und wird dort nie verändert.

- **Verknüpfte Vorlage** — der Agent bindet den Starter
  als git-Submodul unter `_template/` ein. Dein Projekt
  pinnt damit einen bestimmten Stand und kann neuere
  Stände später gezielt ziehen. Schlägt das Einbinden
  fehl (kein Netz, URL nicht erreichbar), meldet er es,
  und du entscheidest: erneut versuchen, andere URL,
  eingefrorene Kopie oder Abbruch.
- **Eingefrorene Kopie** — der Agent klont den Starter
  nach `_template/`, liest den Stand ab (Commit und
  Tag) und entfernt das git-Verzeichnis der Kopie. Die
  Kopie ist gewöhnlicher Projekt-Inhalt: Nur-Lese, wird
  mit dem Projekt committet und nie gelöscht — das
  Archiv des Stands, mit dem dein Projekt begann.

Fehlt ein git-Repository, gehört `git init` mit in
dieses Angebot. Der Agent nennt die exakten Kommandos
und führt sie erst nach deiner Zustimmung aus. In
beiden Fällen merkt er sich Repo-URL, Stand und Modus
für den **Herkunfts-Vermerk**, den er in Schritt 4 ins
Wiki schreibt. Ist die Einbindung schon erfolgt (etwa
weil du sie selbst vorgenommen hast), erkennt er das
und geht weiter; ist `_template/` leer (Submodul nach
einem Klon ohne `--recursive`), bietet er die
Initialisierung an.

## Schritt 1 — die Projektdateien

Der Agent bietet dir zwei Wege an, die Ausstattung des
Starters ins Projekt zu kopieren, und kopiert erst nach
deiner Zustimmung:

- **das Kopier-Skript** `sh _template/setup/init-frisch.sh`
  (empfohlen: deterministisch, überschreibt nichts,
  listet Kollisionen) oder
- **von Hand** nach der Kopier-Liste aus `INIT.md` —
  die Liste ist der führende Ort, das Skript ihre
  Implementierung; von Hand ist zugleich der Rückfall,
  wenn das Skript nicht lauffähig ist.

Kopiert werden das Regelwerk (`MasterPrompt.md`,
`Wiki.md`, `Vorgehen.md`, `Reviewmuster.md`,
`Outgoing.md`, die drei Styleguides), eine
`.gitignore` (nur, wenn keine vorhanden ist), das
komplette vorbereitete `wiki/` einschließlich der
Kopiervorlagen in `wiki/templates/` und der
deaktivierten Fassaden, und `devstate_active.md`, der
Arbeitsstands-Zettel des Agenten. Diese Kopien sind
**lebende Dokumente** deines Projekts — sie dürfen sich
vom Starter entfernen.

**Nie kopiert** werden `referenzprozesse/`, `tools/`,
`upgrade/`, `README.md`, `INIT.md`, `migration/`,
`docs/`, `setup/` und `LICENSE` — sie bleiben in
`_template/` lesbar; den Lint ruft der Agent aus
`_template/tools/` auf, diese Erklärung liest du unter
`_template/docs/`.

**Kollisionen.** Liegt im Ordner schon eine Datei oder
ein Ordner, deren Name mit etwas kollidiert, das der
Agent kopiert oder anlegt, bleibt die Starter-Datei
zunächst ausgelassen, und der Agent stellt dir im
Fragen-Block (Schritt 3, Punkt 11) je Fall die
**Kollisionsfrage** mit drei Möglichkeiten und einer
Empfehlung mit Grund — du darfst gesammelt antworten
(„alles wie empfohlen“):

- **(a) umbenennen und nur verlinken** — die Datei
  bleibt umbenannt und unverändert liegen, die
  Starter-Datei wird angelegt und verlinkt sie;
- **(b) komplett integrieren** — ihr Inhalt geht in die
  Starter-Datei oder an einen Ort im Wiki, den der
  Agent vorschlägt; gelöscht wird nur auf deinen
  ausdrücklichen Wunsch, sonst bleibt die Datei bis
  dahin umbenannt liegen; der Agent empfiehlt nie von
  sich aus das Löschen;
- **(c) integrieren und alte Fassung behalten** —
  Inhalt wie (b), die Datei zusätzlich wie (a).

Der umbenannte Name folgt dem Schema
`<Name>-vorgefunden.<Endung>` (für einen Ordner
`<Name>-vorgefunden/`); der Agent schlägt ihn vor, du
bestätigst oder nennst einen anderen. Inhaltsgleiche
Dateien sind keine Kollision. Ein vorgefundenes
`wiki/`, das nicht aus diesem Starter stammt, ist
**eine** Kollision auf Ordner-Ebene — nichts wird
hineinkopiert, bis du geantwortet hast.

## Schritt 2 — der Aufnahme-Commit

Der Agent prüft, dass das Repo da ist und die
Einbindung stimmt, und committet den kopierten Stand
samt Einbindung (bei der eingefrorenen Kopie
einschließlich `_template/`) — angekündigt, nicht
erfragt: „Setup: Starter-Stand aufgenommen“. Liegen
außer den kopierten Dateien noch andere im Ordner,
nimmt er nur die freigegebenen auf und nennt dir den
Rest. Ignorierte Dateien bleiben ignoriert; eine
fehlende git-Identität erfragt er, statt sie zu
setzen; bei einem abweisenden Hook oder verlangter
Signatur hält er an und beschreibt die Lage. Das
Remote-Ziel richtet er jetzt noch nicht ein — das ist
ein Punkt im Fragen-Block.

## Schritt 3 — der Fragen-Block

Der Agent zeigt dir zuerst die Punkte unten als
**Fahrplan** (je Punkt eine Zeile mit dem, was
feststeht oder ableitbar ist) und bietet den
**Briefing-Modus** an: wählst du ihn, stellt er die
Fragen einzeln mit kurzem Briefing; sonst alle in
**einem** Block, nummeriert, je Punkt sein Vorschlag
zuerst. Was aus deinem Aufruf, aus Dateien im Ordner
oder aus einem Startprompt ableitbar ist, fragt er
nicht, sondern legt es als Entwurf vor. Was der
Starter vorfestlegt (der Prozess, die
Fassaden-Auswahl), fragt er nicht.

1. **Prozess-Nachfrage** — nur, wenn der
   Software-Prozess nach allem, was der Agent bis
   hierher weiß, nicht zum Vorhaben passt oder er
   nicht sicher ist: „Bist du sicher, dass das der
   richtige Prozess ist? Ich erkenne nicht, dass er zum
   Vorhaben passt — willst du mir einen anderen
   nennen?“ Ohne Liste. Nennst du einen anderen
   Prozess, richtet er das Projekt damit ein (Schritt
   4); bleibst du beim Software-Prozess, geht es damit
   weiter.
2. **Ein Repo oder zwei?** — ob ein eigenes
   Produkt-Repo entsteht und wo die selbsttragenden
   Dokumente liegen (siehe
   [Zusammenarbeit mehrerer Repos](Mehrere-Repos.md)).
3. **WorkspaceManager verfügbar?** — getrennt nach den
   Rollen Konvertierung (Originale nach `input/`) und
   Outgoing-Erzeugung (PDF, E-Mail, DOCX); fehlt das
   Werkzeug, übernimmt der Agent die Aufgabe selbst.
4. **Bearbeiter-Kürzel** — drei Buchstaben, die in den
   Dateinamen versionierter Dokumente stehen (der Agent
   selbst heißt dort `AIG`).
5. **Commit-Sprache** — (A) Projektsprache für alles,
   (B) Sprache folgt Artefakt (Wiki und Dokumente in
   Projektsprache, Code englisch; Vorauswahl bei
   Codeprojekten), (C) Englisch für alles. Die
   Projektsprache selbst — die Sprache deiner Dokumente
   — wird nicht abgefragt: der Starter setzt in
   `Styleguide.md` Deutsch; eine andere Sprache legst
   du in `Styleguide-project.md` fest.
6. **Ersatzweg für Prüfungen** — nur, wenn der Agent
   aus seiner Umgebung kein Werkzeug nennen kann, über
   das ein zweites KI-Modell prüft: entweder prüft
   dasselbe Modell in frischem Kontext (mit sichtbarer
   Einschränkung in jeder Freigabe) oder du prüfst
   selbst. Die Wahl steht in `Tools.md`.
7. **Rolle** des Projekts: Standalone, Koordinator oder
   Komponente; entfällt mit Startprompt. Bei
   „Koordinator“ kündigt der Agent an, dass er den
   Contract-Index aktiviert.
8. **Mission und Auftrag** des Projekts — speist das
   Mission Statement und `wiki/Facts.md`.
9. **Bezeichnung der ersten Marke** — Vorschlag ist
   die typische Marke des Software-Prozesses: „1.0“,
   Benennung z.B. „Erster Release“ (siehe
   [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
   „Zielmarken“).
10. **Remote-Ziel**, falls nicht ableitbar.
11. **Kollisionsfrage** aus Schritt 1, falls es
    Kollisionen gab.

**Mit Startprompt (Rolle Komponente).** Startest du als
Komponente eines Koordinators, beginnt dessen
Startprompt mit demselben Satz wie oben, und der Agent
legt alles, was der Startprompt vorgibt, als abgeleitet
vor, ohne es zu fragen: Rolle, Repo-Name, Pfad und
Remote, Pfad des Koordinators, Übernahme-Art, Start
und Transport, Verweis auf den Übergabe-Stand. Den
Referenzprozess gibt der Startprompt **nicht** vor —
dafür gilt Punkt 1.

## Schritt 4 — die Umsetzung

Der Agent setzt die Antworten in fester Reihenfolge
um: erst Kollisionen auflösen, dann die erste Marke
anlegen, dann buchen — denn jedes neue Element trägt
beim Anlegen die laufende Marke und sein Anlage-Datum.

- **Kollisionen:** umbenennen, dann die ausgelassenen
  Starter-Dateien einspielen (Skript erneut — es
  ergänzt nur Fehlendes — oder von Hand); bei (a) und
  (c) verlinkt die Starter-Datei die umbenannte; hat
  sie keinen Platz dafür, steht der Link in der
  Projekt-README. Links in vorgefundenen Dateien zieht
  der Agent nicht nach; bricht einer, nennt er die
  Stelle.
- **Anderer Prozess** (Punkt 1): das vorbereitete
  `wiki/` wird ersetzt durch das Basis-Wiki und das
  Paket des gewählten Prozesses aus
  `_template/referenzprozesse/`; der Starter bleibt
  `_template/`. Was RP-1 oder SP-1 voraussetzt (etwa
  die Rolle), entfällt.
- **Erste Marke** im Register `wiki/Zielmarken.md` mit
  der Bezeichnung aus Punkt 9, Zustand `in-progress`;
  keine Marke trägt `current`, solange keine
  abgeschlossen ist.
- **Herkunfts-Vermerk** im Abschnitt `## Herkunft` von
  `wiki/Aktivierter-Prozess.md`: `Template-Stand: 2.0
  seit JJJJ-MM-TT` (der Tag des Starts — der Stichtag,
  den der Lint liest), `Quelle` (Repo-URL und Stand)
  und `Anbindungs-Modus` aus Schritt 0, `Rolle` und
  bei einer Komponente die `Übernahme-Art`.
- **Buchungen:** Commit-Sprache, Betriebs-Konfiguration
  des WorkspaceManagers, die Freigaben der Ordner, die
  der Software-Prozess mitbringt, als Einträge im
  Entscheidungs-Register, die Wahl „ein Repo oder
  zwei“.
- **`Tools.md`** aus der Kopiervorlage: Prüf-Werkzeuge
  und Ersatzweg, `_template/tools/lint.sh` als
  Template-Werkzeug, bei einer Komponente Start und
  Transport aus dem Startprompt.
- **Rolle Koordinator:** der Contract-Index wird
  aktiviert. **Rolle Komponente:** die eigene Zeile und
  die Lage des Koordinators in der Architektur-Fassade.
- **Mission Statement und Facts** aus ihren
  Einmal-Anweisungen (den Bootstraps in
  `_template/referenzprozesse/base/bootstrap/`, die nie
  ins Projekt kopiert werden).
- **Instruktionsdatei** des Agenten (z.B. `CLAUDE.md`)
  nach dem MasterPrompt, einschließlich des
  Grundgesetzes „das `wiki/` ist die Quelle der
  Wahrheit“; dazu `Styleguide-project.md` und
  `Styleguide-chat.md` (aus der Kopiervorlage im Wiki).

## Schritt 5 — der Abschluss

- Die **Projekt-README** (Kurzbeschreibung, Einstiege,
  Instruktionsdatei; Verweis auf diese Erklärung unter
  `_template/docs/Einfuehrung.md` und für spätere
  Stände auf `_template/README.md`) und **`TODO.md`**
  (deine offenen Punkte; sie verlinkt eine in Schritt 4
  umbenannte `TODO-vorgefunden.md`) entstehen — der
  Starter liefert sie nicht mit.
- Ein **Chronologie-Eintrag** hält fest, dass das
  Projekt aus diesem Starter angelegt wurde, mit
  Template-Stand, Quelle und Modus wie im
  Herkunfts-Vermerk.
- `devstate_active.md` wird nachgeführt, der **Lint**
  (`sh _template/tools/lint.sh` aus dem Projekt-Root)
  läuft ohne Fehler.
- **Erster eigener Commit**, danach Push auf das Remote
  aus dem Fragen-Block.

Ab hier gilt der normale Betrieb: „Bereit für den
ersten Auftrag.“ Bei einem Entwicklungsprozess weist
der Agent zusätzlich auf die Vorlagen-Kette der
Setup-Entscheidungen als nächsten Schritt hin — die
gebündelte Klärung der technischen Grundentscheidungen,
bevor die erste Fachlogik entsteht (erklärt in
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md),
„Scaffolding“). `INIT.md` liegt nur im Starter und
bleibt in `_template/` lesbar; es gibt keinen
Selbst-Abbau.

## Was danach im Projekt liegt

Im Projekt-Root:

- die kopierten Regel-Dokumente (`MasterPrompt.md`,
  `Wiki.md`, `Vorgehen.md`, `Reviewmuster.md`,
  `Outgoing.md`, `Styleguide.md`, `Styleguide-md.md`,
  `Styleguide-wiki.md`) und die Projekt-README;
- die **Instruktionsdatei** des Agenten (z.B.
  `CLAUDE.md`), beim Start als Entwurf angelegt;
- `Styleguide-project.md` (projektspezifische
  Schreibregeln) und `Styleguide-chat.md` (Regeln für
  das Gespräch);
- `Tools.md` — Verzeichnis der Werkzeuge und
  Werkzeug-Wahlen des Projekts, einschließlich des
  Lint-Aufrufs;
- `TODO.md` — deine offenen Punkte; der Agent liest
  sie, ergänzt aber nur auf Anweisung;
- `devstate_active.md` — der Arbeitsstand des Agenten
  (Zielmarke, nächste Schritte, Blockaden);
- `Offene Fragen.md` — entsteht beim ersten Eintrag im
  Arbeitsmodus;
- die Index-Dateien `index.md`, `index-output.md`,
  `index-overview.md`;
- `docsources.yml` — nur, wenn du externe
  Dokumentquellen anbindest (unten).

Dazu `_template/` (Nur-Lese), die Standardordner
(`raw/`, `input/`, `research/`, `tools/`, `output/`,
`overview/`, `wiki/`, `outgoing/`) und das `wiki/` mit
allen Fassaden des Software-Zuschnitts, den
Katalog-Einträgen, den Regel-Knoten und den beiden
Vorgehens-Dokumenten `Vorgehen-SP-1.md` und
`Vorgehen-RP-1.md`. Zweck, Mitliefer-Status und
Anlage-Zeitpunkt jeder Standarddatei beschreibt
`../wiki/Standarddateien-Katalog.md`.

## Was der Agent beim Sessionstart tut

Der Sessionstart läuft bei jedem Start gleich; beim
ersten Mal kommen die Schritte oben hinzu.

- **Orientierung.** Der Agent prüft git und seine
  Instruktionsdatei; ist das Submodul `_template/`
  leer, bietet er die Initialisierung an.
- **Kontext laden.** Er liest Instruktionsdatei,
  Fassaden-Landkarte, `wiki/Facts.md` (mit Vorrang für
  die Stolpersteine), `Styleguide-chat.md`,
  `Offene Fragen.md`, `wiki/Fristen.md`, `Tools.md`
  und `TODO.md`; die übrigen Fassaden registriert er
  und liest sie bei Bedarf. `wiki/Mission Statement.md`
  liest er nicht automatisch — es ist für Menschen und
  fremde Agenten gedacht.
- **Abgleiche.** Fehlende oder veraltete Umwandlungen
  von `raw/` nach `input/`, Dokumente ohne Wiki-Knoten,
  abgelaufene Fristen, fällige Register-Einträge,
  Struktur- und Commit-Hygiene — alles wird nur
  vorgemerkt, nichts blockiert.
- **Ausgabe an dich** in strikt getrennten Blöcken:
  **Erledigt**, **Aktion** (was der Agent als Nächstes
  tut, wenn du nicht widersprichst) und **Frage** (was
  er wirklich von dir braucht).
- **Bereit.** Zum Schluss meldet der Agent „Bereit für
  den ersten Auftrag.“ und wartet.

## Dokumente einbringen

- **`raw/`** ist dein Eingang für Originale: Lastenhefte,
  Protokolle, Altdokumentation, Scans — so, wie sie
  eingegangen sind, unter ihrem Originalnamen. Der
  Agent verändert dort nie etwas; du darfst eine Datei
  ersetzen (etwa durch eine bessere Fassung) — das löst
  beim nächsten Sessionstart die erneute Umwandlung und
  Übernahme aus.
- **`docsources.yml`** im Projekt-Root benennt weitere
  Quellen außerhalb des Projekts (z.B. einen
  Netzlaufwerk-Ordner), je mit Name und Pfad. `raw/`
  gilt automatisch als Quelle.
- **Umwandlung nach `input/`.** Ein **WorkspaceManager**
  — ein externes Programm, das du startest, nicht der
  Agent — wandelt jede Originaldatei genau einmal in
  eine Markdown-Datei um: `raw/` nach `input/raw/`, jede
  weitere Quelle nach `input/<name>/`. Hast du kein
  solches Werkzeug, übernimmt der Agent die Umwandlung
  bei Bedarf selbst.
- **Ingest.** Aus jeder Datei in `input/` legt der Agent
  Wiki-Knoten an, trägt Ereignisse in die Chronologie
  und Fristen ins Fristen-Register ein, erkennt
  Personen und Organisationen und meldet alles im
  Erledigt-Block. Danach arbeitet er nur noch mit den
  Wiki-Knoten. Mehr in
  [Wiki und Register](Wiki-und-Register.md).

## Ab der zweiten Session

Von nun an lädt der Agent beim Start automatisch seine
**Instruktionsdatei** — den verpflichtenden
Minimal-Kontext mit Projekt-Identifikation, eisernen
Regeln, Verweisen ins Regelwerk und einer gespiegelten
Konfigurations-Übersicht. `MasterPrompt.md` liest er
nur auf Anweisung. Ändert sich der MasterPrompt, zieht
der Agent seine Instruktionsdatei nach; weicht die
gespiegelte Konfiguration von den Quellen im Wiki ab,
überschreibt er nicht still, sondern fragt, welcher
Stand gilt.

Jede Session beginnt mit dem Sessionstart (oben) und
endet, falls noch etwas offen ist, mit einem
Abschluss-Commit, damit der Arbeitsbaum sauber bleibt.
Wie die Zusammenarbeit im Alltag aussieht:
[Arbeitsweise](Arbeitsweise.md). Wie du das Projekt
später auf einen neuen Stand des Starters hebst:
[Upgrade](Upgrade.md).
