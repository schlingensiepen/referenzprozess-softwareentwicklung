# Einführung — der Starter für Menschen erklärt

> **Herkunft:** abgeleitet aus `../README.md`,
> `../INIT.md`, `../migration/MIGRATION.md`,
> `../upgrade/UPGRADE.md`, `../MasterPrompt.md`,
> `../Wiki.md` und `../Vorgehen.md`, dem vorbereiteten
> `../wiki/` (`Aktivierter-Prozess.md`, `Fassaden.md`)
> und den Steckbriefen
> `../referenzprozesse/*/Steckbrief.md`. Stand der
> Quellen: Starter-Commit `b5d0eef` (Version 2.1).
> Dieses Dokument ist aus den Quellen abgeleitet und
> wird bei Änderungen der Quellen auf deren Stand
> nachgezogen (zuletzt am 2026-11-03); eigene Inhalte
> bekommt es nicht — Änderungen gehören in die Quellen.

Diese Erklärung ist für dich geschrieben — einen
Menschen, der ein Softwareprojekt zusammen mit einem
KI-Agenten führen will und diesen Starter dafür
nutzt. Sie setzt kein Vorwissen voraus. Willst du
sofort loslegen, nimm den passenden Satz aus der
`../README.md` und lies das Dokument zu deinem Weg
([Projektstart](Projektstart.md),
[Migration](Migration.md) oder [Upgrade](Upgrade.md));
willst du zuerst verstehen, worauf du dich einlässt,
lies hier weiter — am Ende steht die Liste aller
Dokumente dieser Erklärung.

## Es gibt ein `wiki/` — und warum

Jedes Projekt, das mit diesem Starter arbeitet, führt
einen Ordner `wiki/`. Darin liegt **alles
projektspezifische Wissen**: Fakten, Begriffe,
Entscheidungen, Anforderungen, Fehlermeldungen, die
Architektur, der Stand der Arbeit. Das `wiki/` ist die
**Quelle der Wahrheit** des Projekts — was dort nicht
steht, ist nicht festgelegt.

Der Grund ist die Arbeitsweise eines KI-Agenten. Die
laufende Unterhaltung mit ihm ist Arbeitsspeicher,
keine Quelle: wird sie lang, verdichtet der Agent sie
und verliert dabei Einzelheiten; endet die Session, ist
sie weg. Wer am nächsten Tag weiterarbeitet — derselbe
Agent, ein anderer Agent oder du selbst — muss den
vollen Stand **durch bloßes Lesen der Dateien**
wiederherstellen können. Darum gilt: **Wissen lebt auf
der Platte, nicht im Kopf.** Alles, was zwischen dir
und dem Agenten geklärt wird, wandert sofort in eine
Datei. Der Agent schlägt vor jeder Behauptung über eine
Festlegung im `wiki/` nach (Lese-Pflicht) und legt
Klärungen, Berichte und Stände im selben Zug ab
(Pflege-Pflicht).

Das `wiki/` ist in Ebenen gebaut, damit es trotz
Umfang lesbar bleibt:

- **Fassaden** sind Übersichts-Dokumente, die man am
  Stück lesen kann — etwa `Facts.md` (Projekteinstieg
  und Stolpersteine), `Anforderungen.md`,
  `Entscheidungen.md`, `Zielmarken.md`, `Glossar.md`.
  Der Agent lädt die aktiven Fassaden beim Start jeder
  Session — die wichtigsten vollständig, die übrigen
  registriert er und liest sie bei Bedarf.
- **Detail-Knoten** sind einzelne Dateien je
  Wissensobjekt: eine Anforderung, eine Entscheidung
  mit Begründung, ein eingegangenes Dokument, ein
  Fachbegriff. Fassaden verweisen auf sie; der Agent
  folgt den Verweisen nur, wenn er Einzelheiten
  braucht.

Für dich als Menschen ist `wiki/Mission Statement.md`
der Einstieg in ein konkretes Projekt: ein kurzer
Projekt-Überblick, der ausdrücklich für Menschen und
fremde Agenten geschrieben ist und den der Agent beim
Sessionstart nicht automatisch liest.

Das `wiki/` kommt nicht leer. Dieser Starter liefert
ein **vorbereitetes `wiki/`** mit: alle Fassaden als
Skelette, der Prozess für Softwareentwicklung ist
schon eingespielt, die Vorfestlegungen sind gebucht.
Du baust kein Wiki, du füllst eines. Jede Fassade
stellt sich in ihrem eigenen Abschnitt `## Meta`
selbst vor (Zweck, Format, Pflege). Deaktivierte
Fassaden bleiben als Datei liegen und lassen sich
jederzeit per Zuruf wieder einschalten. Mehr dazu in
[Wiki und Register](Wiki-und-Register.md).

## Was dieser Starter ist

Dieser Starter ist eine Vorlage für Softwareprojekte,
in denen ein Mensch und ein KI-Agent strukturiert
zusammenarbeiten. Er ist aus einer allgemeinen
Projektvorlage abgeleitet — in dieser Erklärung „die
allgemeine Vorlage“: sie bringt keinen Prozess mit,
sondern bietet ihn beim Start an; ein Projekt kann
auch aus ihr stammen. Der Starter bringt den Prozess
für Softwareentwicklung schon mit: den
**Standardprozess Entwicklungsprojekt (SP-1)** und
darauf die **Entwicklung eines Softwaresystems
(RP-1)** mit Anforderungen, Funktionsbeschreibungen,
Spezifikationen, Architektur, Testfällen,
Testberichten, Deployments und Zielumgebungen. Beim
Projektstart gibt es deshalb kein Prozess-Angebot;
der Agent fragt nur nach, wenn der Software-Prozess
nicht zum Vorhaben passt (unten, „Die drei Wege“).

Der Starter trägt die **Versionsnummer 2.0** (die
`../README.md` nennt sie). Diese Nummer ist der
Template-Stand, den jedes Projekt aus dem Starter in
seinem Herkunfts-Vermerk im Wiki führt; frühere Stände
waren 1.0 und 1.1. Ein Projekt auf einem älteren Stand
holt den neuen über den Weg „Upgrade“.

Der Starter besteht aus:

- einem **Regelwerk** für den Agenten:
  `../MasterPrompt.md` mit seinen Teildateien
  `../Wiki.md` (Logik des Wikis), `../Vorgehen.md`
  (Phasen und Freigaben), `../Reviewmuster.md`
  (Prüfungen durch mehrere Agenten), `../Outgoing.md`
  (Versand) und den Styleguides — es wird ins Projekt
  kopiert und lebt dort;
- dem **vorbereiteten `wiki/`** als Kopier-Quelle
  (oben);
- **`referenzprozesse/`** — allen Prozess-Vorlagen als
  Nur-Lese-Quelle, auch denen für andere Projektarten
  (der Software-Prozess liegt dort als
  `RP-1-Systementwicklung/` auf
  `SP-1-Standardprozess/`);
- den drei **Anleitungen** `INIT.md`,
  `migration/MIGRATION.md` und `upgrade/UPGRADE.md`,
  die der Agent liest, nie kopiert;
- den **Skripten** in `setup/`, die der Agent anbietet
  (Kopie beim Start, Kopie plus Varianten bei der
  Migration, Mechanik beim Anheben), und dem **Lint**
  `tools/lint.sh`, einem Prüfskript, das mechanisch
  prüfbare Regeln ohne Sprachmodell kontrolliert;
- dieser **Erklärung** in `docs/`.

Der Starter ist **KI-agnostisch**: `MasterPrompt.md`
ist die eine Quelle der Regeln; jeder Agent (Claude
Code, Cursor, Windsurf, …) erzeugt daraus seine eigene
Instruktionsdatei (z.B. `CLAUDE.md` oder
`.cursorrules`), die er bei jedem Start automatisch
lädt. Beschriebene Abläufe (Unteragenten starten,
Dateien konvertieren, git bedienen) setzt jeder Agent
mit seinen eigenen Werkzeugen um und hält fest, wie.
Der Starter ist deutschsprachig — Regelwerk,
Anleitungen und die Fragen des Agenten; die Sprache
deiner Projekt-Dokumente ist mit Deutsch vorbelegt und
lässt sich im Projekt ändern.

**Wo der Starter im Projekt liegt.** Der Starter wird
nicht selbst zum Projekt; er wird in dein Projekt
**eingebunden**, immer unter `_template/`, in einer
von zwei Bauformen: als **verknüpfte Vorlage**
(technisch ein git-Submodul, auf einen festen Stand
gepinnt, später gezielt aktualisierbar) oder als
**eingefrorene Kopie** (eine Einmal-Kopie ohne
Git-Verbindung, die dauerhaft im Projekt bleibt und
zeigt, womit du gestartet bist). `_template/` ist für
den Agenten **Nur-Lese**: er kopiert daraus ins
Projekt, was dort leben soll, liest die Anleitungen
und Prozess-Vorlagen als Quelle und ruft den Lint von
dort auf — schreibt dort aber nie und löscht es nie.
Nur beim Anheben tauscht er die ganze Quelle gegen den
neuen Stand. Aus dem Projekt gelesen wird nur das
Kopierte: `_template/` bleibt Nachschlage- und
Upgrade-Quelle, bei der Einmal-Kopie zugleich das
Archiv des Stands, mit dem das Projekt begann.

Die Arbeitsfelder, die der Starter abdeckt:

- **Software-Entwicklung in Phasen:** vom Konzept über
  Anforderungen, Funktionsbeschreibung, Architektur,
  Technologie-Wahl und Spezifikation zum Code, zum
  Testen und zur Auslieferung — als Angebot, nicht als
  Zwang (siehe
  [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md)).
- **Dokumentenverarbeitung:** Originale legst du in
  `raw/` ab; sie werden nach `input/` in Text
  umgewandelt und vom Agenten ins `wiki/` übernommen
  („Ingest“). Originale und Umwandlungen werden nie
  verändert.
- **Wiki** als Quelle der Wahrheit (oben).
- **Versionierte Ausgangsdokumente:** alles, was
  jemand anderes empfängt (Stände, Berichte, Übergaben
  an andere Projekte), liegt in `output/`,
  Auswertungen für dich selbst in `overview/` — beide
  mit Versionsnummer und Bearbeiter-Kürzel im
  Dateinamen, nie überschrieben.
- **Versand:** was an Menschen verschickt wird, bekommt
  einen Versandstand-Ordner in `outgoing/` mit
  Anschreiben, erzeugtem PDF oder E-Mail und Kopien der
  Anlagen.

## Die drei Wege

Du startest den Agenten **im Projektordner** und gibst
ihm einen von drei Sätzen; die Sätze stehen zum
Herauskopieren in der `../README.md` unter „Loslegen“
— je ein Unterabschnitt „Neues Projekt“, „Bestehendes
Projekt migrieren“ und „Template aktualisieren“;
daneben nennt die README, was du brauchst (git, einen
Agenten mit Lese-Zugriff auf die Repo-URL, Internet
beim Einrichten). Der Agent liest die zugehörige
Anleitung direkt von der Repo-URL, bevor lokal etwas
liegt, legt dir seine Fragen gesammelt vor — bei einem
neuen Projekt und bei der Migration zuerst, wie der
Starter als `_template/` in dein Projekt kommt: **B**
als verknüpfte Vorlage (empfohlen) oder **A** als
eingefrorene Kopie — und bietet jeden weiteren Schritt
an: Einbindung und die Skripte in `setup/` laufen nur
nach deiner Zustimmung; Commits kündigt er an, statt
zu fragen (den Sicherungs- und den Aufnahme-Commit,
beim Upgrade die Commits je Schritt).

Welcher der beiden ersten Wege gilt, entscheidet, ob
im Ordner schon eine **Wissensbasis** liegt — Dateien,
die Projektwissen tragen (eine README mit Inhalt, ein
Changelog, Aufgabenlisten, Notizen, eine
Instruktionsdatei für den Agenten): dann ist es eine
Migration. Fehlt sie, ist es ein neues Projekt, auch
wenn schon Dateien im Ordner liegen; die bleiben
liegen, und bei Namensgleichheit mit einer
Starter-Datei stellt der Agent die Kollisionsfrage.
Erkennt der Agent den anderen Fall, sagt er es dir.

- **Neues Projekt** — im leeren oder fast leeren
  Projektordner. Der Agent bindet den Starter ein,
  kopiert Regelwerk und vorbereitetes `wiki/` ins
  Projekt, committet den Startstand, stellt dir einen
  gesammelten Fragen-Block (Rolle des Repos, ein Repo
  oder zwei, Kürzel, Commit-Sprache, erste Marke, …),
  setzt die Antworten um und meldet „Bereit für den
  ersten Auftrag.“ Liegen schon Dateien im Ordner,
  deren Namen mit Dateien des Starters kollidieren,
  fragt er je Datei, was damit geschehen soll — nichts
  wird überschrieben. Der ganze Ablauf:
  [Projektstart](Projektstart.md).
- **Bestehendes Projekt migrieren** — im Ordner eines
  Projekts, das sein Wissen bisher in verstreuten
  Dateien sammelt und ohne diese Vorlage arbeitet. Der
  Agent sichert zuerst deinen Alt-Zustand per Commit,
  bindet den Starter ein, kopiert dieselbe Ausstattung
  plus Migrations-Varianten, überführt dann dein
  vorhandenes Wissen Klasse für Klasse ins `wiki/`
  (Anforderungen, Fehler, Entscheidungen, Architektur,
  Changelog, offene Arbeiten …) und lässt die
  Rekonstruktion von zwei Prüfern absichern, bevor du
  sie als Ganzes annimmst. Vorgefundene Dateien bleiben
  unverändert liegen. Findet der Agent keinen
  Software-Bezug, fragt er dich, ob der
  Software-Prozess der richtige ist oder ob du einen
  anderen nennst. Der ganze Ablauf:
  [Migration](Migration.md).
- **Template aktualisieren** (das Projekt auf den
  aktuellen Stand heben) — im Ordner eines Projekts,
  das schon mit diesem Starter oder mit der
  allgemeinen Vorlage arbeitet, mit oder ohne Prozess.
  Der Agent erkennt den Ausgangsstand am
  Herkunfts-Vermerk deines Projekts (dem Abschnitt
  „Herkunft“ in `wiki/Aktivierter-Prozess.md`; ein
  Projekt aus Stand 1.0 hat noch keinen, dann fragt
  er dich nach Vorlage und Version), sichert, ersetzt
  den Inhalt von `_template/` durch den neuen Stand
  **derselben Vorlage**, aus der dein Projekt stammt
  (ein Projekt aus der allgemeinen Vorlage bekommt
  deren neuen Stand, nicht den Starter), stellt
  Formalien um, legt neue Dateien an, legt dir
  Übernahmen in die lebenden Dokumente als Vorschlag
  vor und lässt das Ergebnis absichern. Das Projekt
  behält seinen Prozess. Der ganze Ablauf:
  [Upgrade](Upgrade.md). Findet der Agent dabei oder
  im Betrieb etwas, das die Vorlage selbst verbessern
  würde, hält er es als Ideen-Eintrag in deinem
  Projekt fest; gemeldet wird es als Issue im
  GitHub-Repo des Starters (Adresse in der
  `../README.md`, „Template aktualisieren“).

Alle drei Wege folgen denselben **Grundsätzen**, nach
denen der Agent auch entscheidet, wo eine Anleitung
einen Fall nicht ausdrücklich nennt: **Nichts geht
verloren** (nichts überschreiben, nichts löschen ohne
deinen ausdrücklichen Wunsch). **Alles wird
einsortiert** (Vorgefundenes wird in die Struktur
übertragen oder verlinkt, die Herkunft bleibt
erkennbar). **Im Zweifel fragt er dich** (gesammelt,
nicht einzeln).

## Wie es weiterläuft

**Zusammenarbeit mit dem Agenten.** Der Agent fragt bei
Unklarheit nach, statt zu raten — außer bei
mechanischen Standardaufgaben (Wiki-Pflege, Index,
Commits), die er ohne Rückfrage ausführt, sichtbar
meldet und auf dein Veto zurücknimmt. Bevor er fragt,
prüft er, ob die Antwort aus vorhandenen Dateien
ableitbar ist. Seine strukturierten Meldungen haben
immer dieselben Blöcke: **Erledigt**, **Aktion** (was
er als Nächstes tut, wenn du nicht widersprichst) und
**Frage** (was er wirklich von dir braucht). Prüf- und
Werkzeug-Ergebnisse werden berichtet, nicht zur
Blockade gemacht. Mehr in
[Arbeitsweise](Arbeitsweise.md).

**Register und Fassaden.** Anforderungen,
Fehlermeldungen, Entscheidungen, Ideen, Testfälle,
Berichte und weitere Wissensarten werden in Registern
geführt: eine Fassade als Übersicht, dahinter die
einzelnen Einträge mit Kennung. Entscheidungen kommen
erst mit deinem OK ins Register und werden danach
nicht mehr geändert, sondern durch eine neue
Entscheidung abgelöst — so bleibt datierbar, was wann
galt. Mehr in [Wiki und Register](Wiki-und-Register.md).

**Stände, Freigaben, Marken.** Die Zwischenziele
eines Projekts heißen **Zielmarken** (kurz: Marken):
bei einem Softwaresystem ein Release („1.0“, „1.1“);
eine Marke ist ein Ergebnis, das nach außen geht,
kein Datum. Wenn ein Ergebnis verlässlich sein soll,
wird aus dem lebenden Wissen ein **Stand** in
`output/` gebildet (eingefroren, versioniert, zu genau
einer Marke gehörend) und **für einen Zweck
freigegeben** — etwa „freigegeben für das Zerlegen in
Bausteine“. Eine Freigabe hängt immer an einem Stand,
nie an einem einzelnen Eintrag; mit ihr frieren die
Einträge ein, auf die der Stand verweist — einzige
Freigabe ohne Stand ist der git-Tag, der das Produkt
einer Marke markiert. Was der Agent dir vorlegt, ist
der Stand selbst — einen Entwurf daneben gibt es
nicht; eine Korrektur geht in die Einträge, und der
Agent bildet eine neue Version. Ein Beispiel: Für den
Release „1.0“ entsteht aus dem Register Anforderungen
ein Anforderungen-Stand; ein Prüfer, möglichst ein
zweites KI-Modell, prüft ihn gegen die freigegebenen
Vorgänger derselben Marke (Kettenprüfung), dann gibst
du ihn frei — „für P4 Beschreiben der Funktion“ —,
und die nächste Phase darf darauf aufbauen. Solche
Pflicht-Stände — Stände, die der Prozess für eine
seiner Phasen verlangt — bilden je Marke eine Kette;
das Produkt der Marke, der Code, wird mit einem
git-Tag markiert, und ein Abschluss-Stand hält fest,
was zur Marke gehört. Zur Kette gehören drei Stände,
die ohne Zugang zum Projekt lesbar sind: die
Dokumentation für Entwickler, für Benutzer und je
Umgebung die Betriebs-Anleitung; ob und in welcher
Form eine Marke sie bekommt, fragt dich der Agent
einmal je Marke, sobald das Produkt markiert ist
(Doku-Abfrage).
Phasen, die du für eine Marke nicht brauchst, lässt
du per Verzicht aus. Das Wort „Freigabe“ meint daneben
auch die gebuchte Erlaubnis für einen zusätzlichen
Projektordner (eine Ordner-Freigabe). Mehr — auch zu
Zwischenmarken und Nachträgen, die du beim ersten
Lesen überspringen darfst — in
[Stände, Freigaben und Marken](Staende-Freigaben-Marken.md).

**Referenzprozesse.** Ein Prozess bringt für eine
Projektart Fassaden, Typen und ein eigenes Vorgehen mit.
In diesem Starter sind SP-1 und RP-1 schon eingespielt;
weitere Prozesse liegen in `_template/referenzprozesse/`
als Nur-Lese-Quelle, die meisten als Platzhalter. Was
sie enthalten, wie du einen anderen Prozess wählst und
wie ein Prozess später ergänzt oder gewechselt wird:
[Referenzprozesse](Referenzprozesse.md).

**Mehrere Repos.** Wer das Arbeits-Repo (Wiki,
Register, Historie der Arbeit) vom vorzeigbaren
Produkt-Repo trennen will oder ein System in
Komponenten mit eigenen Projekten zerlegt, findet die
Regeln dafür in
[Zusammenarbeit mehrerer Repos](Mehrere-Repos.md).

## Die Dokumente dieser Erklärung

Für den Anfang genügen diese Einführung und das
Dokument zu deinem Weg; die Dokumente zu Ständen und
Marken und zum Upgrade sind dicht und für das
Nachschlagen geschrieben.

- [Projektstart](Projektstart.md) — was du vorher
  klärst (mit Entscheidungshilfe eingefrorene Kopie
  oder verknüpfte Vorlage), die Einbindung, die Kopie
  der Projektdateien, der Fragen-Block Punkt für
  Punkt, die Umsetzung, der erste Auftrag, was danach
  im Projekt liegt, der Sessionstart und wie Dokumente
  hereinkommen.
- [Migration](Migration.md) — wann ein Projekt ein
  Migrations-Fall ist, die Sicherung, die
  Kollisionsfrage, der Fragen-Block, die Übernahme
  des Wissens Klasse für Klasse, die Absicherung und
  die Gesamt-Annahme, die Restfragen.
- [Upgrade](Upgrade.md) — wie der Agent den
  Ausgangsstand erkennt, die Sicherung, der Tausch von
  `_template/`, die Mechanik per Skript oder von Hand,
  der Delta-Nachzug, der Sprung von 1.x auf 2.0, der
  Herkunfts-Vermerk, die Absicherung, das Upgrade im
  Verbund.
- [Arbeitsweise](Arbeitsweise.md) — die Modi des
  Agenten, das Erledigt/Aktion/Frage-Raster, Rückfragen
  und Briefing, Wahrheits-Hygiene, git, Wächter,
  Prüfungen und Prüfmuster, Recherche, Versand,
  Werkzeuge, die Instruktionsdatei.
- [Wiki und Register](Wiki-und-Register.md) — die
  Ordner und ihre eisernen Regeln, Fassaden und
  Detail-Knoten, was in diesem Starter aktiv ist, der
  Katalog der Typen, die Register und ihr Lebenszyklus,
  Ingest, Versionierung, Lint.
- [Stände, Freigaben und Marken](Staende-Freigaben-Marken.md)
  — die Phasen des Software-Prozesses, was ein Stand
  ist und wie sein Lebenslauf vom ersten Eintrag bis
  zur Freigabe läuft, die Freigabe-Formel,
  Kettenprüfung und Tag der Implementierung, die
  Dokumentation für Entwickler, Benutzer und Betrieb
  mit der Doku-Abfrage, Zielmarken, Zwischenmarken,
  Marken-Wechsel und Abschluss-Stand, Nachträge,
  Scaffolding.
- [Referenzprozesse](Referenzprozesse.md) — Aufbau eines
  Prozess-Pakets, was SP-1 und RP-1 mitbringen, welche
  Prozesse es sonst gibt, die Prozess-Nachfrage, ein
  anderer Prozess beim Start, späteres Hinzufügen oder
  Wechseln, das prozess-eigene Vorgehen.
- [Zusammenarbeit mehrerer Repos](Mehrere-Repos.md) —
  Arbeits-Repo und Produkt-Repo; Koordinator und
  Komponenten mit Startprompt, Übergabe, Nachrichten,
  Lieferungen.
- [Begriffe](Begriffe.md) — die wichtigsten Wörter
  dieser Erklärung in je ein bis zwei Sätzen.

## Wo du im Regelwerk nachliest

Diese Erklärung ersetzt das Regelwerk und die
Anleitungen nicht; sie macht sie lesbar. Verbindlich
ist der Wortlaut in:

- `../INIT.md`, `../migration/MIGRATION.md`,
  `../upgrade/UPGRADE.md` mit
  `../upgrade/1.x-nach-2.0.md` — die drei Anleitungen,
  die der Agent abarbeitet;
- `../MasterPrompt.md` — Ordnerstruktur, Verhalten des
  Agenten, Sessionstart, git, Wahrheits-Hygiene;
- `../Wiki.md` — Ingest, Typen und Katalog, Fassaden,
  Index, Lint, Prozess-Pakete und ihr Einspielen;
- `../Vorgehen.md` — Phasen, Freigaben, Verbund
  mehrerer Repos, Prüf- und Rechercheprozess;
- `../Reviewmuster.md` — Prüfungen durch mehrere
  Modelle;
- `../Outgoing.md` — Versand;
- `../wiki/` — das vorbereitete Wiki samt Regel-Knoten,
  darunter `Aktivierter-Prozess.md` (die
  Vorfestlegungen des Starters), `Init-Choreografie.md`,
  `Einfrieren-und-Abloesen.md`,
  `Lebenslauf-eines-Stands.md`, `Kettenpruefung.md`,
  `Zielmarken.md`, `Glossar.md`,
  `Standarddateien-Katalog.md`, `Vorgehen-RP-1.md`,
  `Marken-RP-1.md`;
- `../referenzprozesse/` — die Prozess-Pakete mit
  ihren Steckbriefen und vollständigen Beschreibungen.
