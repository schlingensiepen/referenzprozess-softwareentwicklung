# UPGRADE — Projekt auf den aktuellen Stand der Vorlage heben

**Du liest dieses Dokument, weil ein Projekt, das schon
mit einer Vorlage arbeitet, auf deren aktuellen Stand
gehoben werden soll** — typischerweise nach dem
Start-Satz „Hebe das Projekt in diesem Verzeichnis auf
den aktuellen Stand nach der Anleitung unter
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.“
Das aktuelle Verzeichnis ist der Projektordner. Du
darfst dieses Dokument **direkt von der Repo-URL
lesen** (Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`,
auch für jede Datei, auf die es verweist; Wiki-Verweise
`[[Name]]` meinen `wiki/Name.md`); sobald `_template/`
den neuen Stand trägt (Schritt 2), liest du von dort —
bei einem Projekt aus der allgemeinen Vorlage aus dem
Lese-Klon (Absatz „Projekt aus der allgemeinen
Vorlage“ unten).

Diese Anleitung gilt für jedes Projekt, das aus einer
Vorlage stammt — aus diesem Starter oder aus der
allgemeinen Vorlage, mit oder ohne Prozess, mit
Herkunfts-Vermerk oder (Stand 1.0) ohne. **Was in
`_template/` landet, ist der neue Stand derselben
Vorlage, aus der das Projekt stammt**; das Projekt
behält seinen Prozess. Für ein Projekt aus der
allgemeinen Vorlage ist dieses Dokument nur Anleitung
(Absatz unten); Schritte, die P-Phasen oder RP-1
voraussetzen, entfallen ohne Software-Prozess. Hat
das Projekt weder Herkunfts-Vermerk noch `_template/`
und sammelt es sein Wissen in verstreuten Dateien, ist
es ein Migrations-Fall (`migration/MIGRATION.md`) —
sag es dem Anwender.

## Grundsätze

Alles Weitere in dieser Anleitung folgt aus drei
Grundsätzen. Wo ein Fall unten nicht ausdrücklich
steht, entscheiden sie:

- **Nichts geht verloren.** Nichts überschreiben,
  nichts löschen ohne ausdrücklichen Wunsch des
  Anwenders. Darum der Sicherungs-Commit vor allem
  anderen, der alte Stand von `_template/` in der
  Git-Geschichte, keine überschriebene Projekt-Datei
  (Änderungen sind Vorschläge, Schritt 5), lesbare
  Altbestände mit Überführungs-Angebot. Darum auch
  kein Upgrade (und kein Prozess-Upgrade), solange eine
  Zwischenmarke läuft: zwei Arbeitslinien auf einer
  Struktur, die sich unter beiden ändert — verweise auf
  die Zeit nach der Rückkehr, wenn die zurückgestellte
  Marke wieder `in-progress` ist.
- **Alles wird einsortiert.** Was der neue Stand
  verlangt, überträgst du in die Struktur der Vorlage
  oder verlinkst es; die Herkunft bleibt erkennbar.
  Darum neue Dateien des neuen Stands, die
  Versionsfolge im Herkunfts-Vermerk (Zeile `Vorher`),
  die alte Kennung als `alias:`, und was nicht
  mechanisch überführbar ist, steht als Angebot in
  deinem Bericht — nie verwerfen.
- **Im Zweifel fragst du den Anwender.** Gesammelt in
  der Übersicht (Schritt 0) und mit den Vorschlägen
  (Schritt 5); danach arbeitest du autonom und
  berichtest bei echten Blockaden. Ist die Quelle der
  eigenen Vorlage nicht erreichbar (privates Git, kein
  Netz), meldest du das und hältst an — der Anwender
  nennt eine andere Quelle (etwa einen lokalen Klon
  derselben Vorlage), stellt den Zugang her oder lässt
  das Upgrade; du wechselst nicht von dir aus auf eine
  andere Vorlage. Erkennst du am Herkunfts-Vermerk
  eines Nachbar-Repos (Lage aus §Komponenten; Zeile
  `Template-Stand` fehlt oder nennt eine ältere
  Version), dass es noch nicht gehoben ist, schreibst du ihm keine Nachricht
  (es könnte sie weder lesen noch quittieren), sondern
  bittest den Anwender, die Sache wie bisher
  weiterzugeben, und empfiehlst, den Nachbarn bald zu
  heben.

Feste Regeln stehen nur dort, wo eine Maschine liest
(Lint, Skript: die Zeilen `Template-Stand` und `Vorher`
mit der Zuordnungstabelle darunter, `zielmarke:` und
Anlage-Datum neuer Elemente, die Umbenennungen und
Formalien, die das Skript umstellt) oder wo der Anwender
bewusst vom vernünftigen Standard abweicht (dieselbe
Vorlage bleibt die Vorlage; neue Dateien ohne
Rückfrage). Alles andere sind Beispiele unter den
Grundsätzen.

**Projekt aus der allgemeinen Vorlage** — die Regel
„dieselbe Vorlage bleibt die Vorlage“ in Orten:

- **Anleitung und Sprung-Dateien** (diese Datei und
  `upgrade/<alt>-nach-<neu>.md`, Schritt 6) liest du ab
  Schritt 0
  aus einem Klon des Starters außerhalb des Projekts,
  nur zum Lesen — dem **Lese-Klon** (`git clone
  --depth 1 <Repo-URL oben> <Ordner außerhalb>`; nach
  dem Upgrade löschst du ihn), denn die allgemeine
  Vorlage trägt weder `upgrade/` noch `setup/` noch
  `INIT.md`. Wo diese Anleitung `_template/upgrade/…`
  oder `_template/INIT.md` nennt, liest du dort; das
  Skript entfällt, du gehst den Weg von Hand.
- **Neue Dateien** (Schritt 3 und 4) kommen aus dem
  neuen `_template/` nach dem Merge-Ablauf `Wiki.md`
  §11.3: die Basis aus `referenzprozesse/base/wiki/`,
  dazu `referenzprozesse/<Prozess>/wiki/` des aktiven
  Prozesses (ohne Prozess nur die Basis); welche
  Fassaden der Prozess voraussetzt, sagt sein
  Steckbrief §Mitgebrachte Fassaden. Wo diese
  Anleitung `_template/wiki/` nennt, sind das diese
  Ordner. Dasselbe gilt für ein Projekt aus diesem
  Starter mit einem anderen Prozess.
- **Ohne Herkunfts-Vermerk oder ohne `_template/`**
  (Stand 1.0): Schritt 0.

**Zustimmung:** Die Übersicht in Schritt 0 mit deinem
Vorschlag für den Weg ist die eine Frage vor der
Arbeit; mit der Antwort des Anwenders führst du
Tausch, Skript und Schritte aus — der Anwender stößt
nur an. Jedes Kommando nennst du vorher exakt; Commits
kündigst du in einem Satz an (Sicherungs-Commit,
Commits je Schritt; Schutzregeln aus Schritt 1).

**Werkzeug-Adaption:** Subagenten, Reviews und Commits
sind werkzeug-agnostisch — adaptiere sie auf deine
lokalen Mittel; ohne Subagenten arbeitest du die
Aufträge sequenziell selbst ab.

---

## 0. Ausgangsstand erkennen

Lies, bevor du etwas tust, und lege dem Anwender das
Ergebnis als Übersicht vor (je Punkt eine Zeile): alte
und neue Version, Anbindungs-Modus, Vorlage, Prozess,
Rolle, laufende Marke, offene Zwischenmarke, dein
Vorschlag für den Weg (Skript oder von Hand).

- **Herkunfts-Vermerk** in `wiki/Aktivierter-Prozess.md`:
  - **2.0-Form** (seit 2.0, unverändert in 2.1):
    Abschnitt `## Herkunft` mit den Zeilen
    `Template-Stand` (Version und Stichtag), `Quelle`
    (Repo-URL und Commit bzw. Tag), `Anbindungs-Modus`,
    `Prozess`, `Rolle`, `Übernahme-Art` (Format:
    [[Init-Choreografie]] §Phase A0); nach einem
    früheren Upgrade darunter eine Zeile `Vorher` mit
    Vermerk.
  - **1.x-Form:** Feld „Template-Herkunft“ (Quelle und
    Stand) im Knoten, kein `## Herkunft`; Prozess aus
    „Gewählter Prozess“, Rolle aus „RP-1-Rolle“ —
    fehlt die Zeile, fragst du.
  - **Ohne Vermerk** (Stand 1.0 kannte ihn nicht):
    Vorlage und Version erfragst du (Grundsätze);
    Anhaltspunkt ist ein Diff der Regelwerks-Dateien
    des Projekts gegen die Stände der Vorlage.
- **Anbindungs-Modus:** **B**, wenn `.gitmodules` einen
  Eintrag für `_template` trägt (`git submodule status
  _template` zeigt den Pin); **A**, wenn `_template/`
  ein gewöhnlicher Ordner ohne eigenes `.git` ist.
- **Alte Version:** aus der Zeile `Template-Stand`
  (2.0-Form). Ein 1.x-Stand nennt sie nicht; Anker ist
  dann der Commit der Herkunft — das Feld
  „Template-Herkunft“, in Modus B der Pin des
  Submoduls **vor** dem Tausch: liegt er genau auf
  einem Release-Tag der Quelle (`release-1.0`,
  `release-1.1`; `git ls-remote --tags <Quelle>` bzw.
  `git -C _template tag --points-at <Pin>`), ist das
  die alte Version; in Modus B liest das Skript sie so
  selbst, in Modus A gibst du die abgelesene Version
  dem Skript mit `--vorher` (dort liest es nur die
  Zeile `Template-Stand`). Sonst fragst du den
  Anwender, mit welchem Stand das Projekt angelegt
  wurde (Anhaltspunkt: Diff der Regelwerks-Dateien
  gegen die Stände der Vorlage), und gibst seine
  Angabe dem Skript ebenso mit `--vorher`; weiß er es
  nicht genau, gilt seine Angabe (etwa `1.x`) — das
  Skript schreibt keine geratene Version. Nennt
  `Template-Stand` die
  Zielversion schon, ist es kein Sprung — ohne Zeile
  `Vorher` trägt das Projekt den Stand seit seiner
  Anlage, mit `Vorher` ist der Sprung vollzogen —:
  frage, ob ein neuerer Commit derselben Version
  nachgezogen werden soll (Tausch, Schritt 2, und
  Delta-Nachzug, Schritt 5); das Skript hält ohne
  `Vorher` an und legt mit `Vorher` nur neue Dateien
  an (Wiederholungslauf).
- **Vorlage:** aus der Zeile `Quelle` bzw. dem Feld
  „Template-Herkunft“, bei Modus B zusätzlich aus der
  Submodul-URL. Nennt sie diesen Starter
  (`referenzprozess-softwareentwicklung`), ist das
  Skript nutzbar; nennt sie die allgemeine Vorlage,
  gehst du den Weg von Hand mit deren neuem Stand.
- **Fehlt `_template/`** (ein 1.0-Projekt direkt aus
  der allgemeinen Vorlage): du fragst nach Vorlage und
  Einbindung wie beim Init (Einbindungs-Frage aus
  `INIT.md` Schritt 0, Modus A oder B — mit der Quelle
  aus dem Herkunfts-Vermerk bzw. der Antwort des
  Anwenders statt der dortigen Repo-URL) und legst
  `_template/` in Schritt 2 an. Ist die Herkunft auch
  dann nicht erkennbar, fragst du.
- **Laufende Marke und Zwischenmarke:** aus
  [[Zielmarken]] — welche Marke `in-progress` trägt und
  ob es eine Zwischenmarke ist (Grundsätze oben); hat
  das Projekt keine `in-progress`-Marke, benennt der
  Anwender sie jetzt (Schritt 4).
- **Angebot der zwei Wege** (Projekt aus diesem
  Starter mit dessen Software-Prozess RP-1 auf SP-1):
  **(a)** das Skript `setup/upgrade.sh` für die
  Mechanik (empfohlen: deterministisch, ändert Inhalte
  nicht, listet Treffer für dich; Aufruf nach dem
  Tausch aus `_template/setup/`, Schritt 3; eine
  Vorschau davor aus einem Klon, ebenda) oder
  **(b)** dieselben Schritte von Hand nach Schritt 3;
  (b) ist zugleich der Fallback, wenn das Skript nicht
  lauffähig ist. Der Anwender wählt. Trägt das Projekt
  einen anderen Prozess, hält das Skript an: Weg (b),
  neue Dateien aus `_template/referenzprozesse/` wie
  im Absatz zur allgemeinen Vorlage.

## 1. Sicherung

Den unveränderten Ausgangszustand committen, **vor** dem
Tausch — angekündigt, nicht erfragt:
`git add -A && git commit -m "Sicherung vor Upgrade auf Template-Stand 2.1"`.
Schutzregeln: Ist nichts zu committen, gilt der aktuelle
`HEAD` als Sicherung (kein leerer Commit); ignorierte
Dateien bleiben ignoriert (nie `git add -f`);
offensichtlich sensible oder sehr große Dateien (> 50 MB)
unter den ungetrackten lässt du aus und nennst sie (das
Skript nennt sie ebenfalls und lässt sie unberührt);
fehlt die git-Identität, fragst du danach; bei
laufendem Merge oder Rebase, abweisendem Hook oder
verlangter Signatur hältst du an und beschreibst die
Lage — nie `--no-verify`.

## 2. `_template/` durch den neuen Stand ersetzen

Der neue Stand ist der aktuelle Stand **derselben
Vorlage** (Quelle aus Schritt 0). Das exakte Kommando
nennst du vorher:

- **Modus B:** Submodul neu setzen —
  `git submodule update --init --remote -- _template`
  (auf einen bestimmten Stand: `git -C _template fetch
  origin && git -C _template checkout <Tag oder
  Commit>`). Schlägt das fehl: melden und anhalten
  (Grundsätze).
- **Modus A:** Kopie tauschen — den neuen Stand
  außerhalb des Projekts klonen
  (`git clone --depth 1 <Quelle> <Ordner außerhalb>`),
  Commit und Tag ablesen (`git -C <Ordner> describe
  --tags --always`), dann `_template/` durch die Kopie
  ohne `.git` ersetzen. Die alte Kopie bleibt in der
  Git-Geschichte des Sicherungs-Commits.
- **Ohne `_template/`** (Schritt 0): Einbindung nach
  der Antwort des Anwenders wie in `INIT.md` Schritt 0,
  mit dem neuen Stand und der Quelle aus Schritt 0.

Danach ein eigener Commit „Vorlage auf Stand 2.1
gesetzt“ (bei Modus A einschließlich der kompletten
Kopie). Ab hier liest du Regelwerk und neue Dateien
aus `_template/` und die Anleitung aus
`_template/upgrade/` (allgemeine Vorlage: Lese-Klon).

## 3. Mechanik: Skript oder von Hand

Die folgenden Schritte sind reine Mechanik — Inhalte
ändern sie nicht. Für ein Projekt aus diesem Starter
führt sie `sh _template/setup/upgrade.sh` aus (mit
`--vorher <alte Version>`, wenn Schritt 0 sie
ermittelt hat — abgelesen oder erfragt; ohne die
Angabe hält das Skript bei einem 1.x-Stand in Modus A
an) — aus dem Projektordner, nach dem Tausch und
seinem Commit (Schritt 2); `--nur-pruefen`
zeigt vorher, was es täte, auch vor der Sicherung —
vor dem Tausch aus einem Klon des Starters außerhalb
des Projekts (`sh <Klon>/setup/upgrade.sh
--nur-pruefen`), weil das alte `_template/` eines
1.x-Projekts das Skript nicht hat. Aus dem Klon ohne
`--nur-pruefen` führt es nur den Tausch aus und hält
für den Commit aus Schritt 2 an; `--help` nennt die
übrigen Optionen. Ein zweiter Lauf ändert nichts
mehr. Von Hand gehst du dieselbe Liste durch; sie ist
der führende Ort, das Skript ihre Implementierung.

| Schritt | Was geschieht |
|---|---|
| Vorprüfung | Sicherungs-Commit vorhanden (keine Änderung an getrackten Dateien; ungetrackte Dateien, die Schritt 1 ausgelassen hat, bleiben unberührt und werden genannt), kein laufender Merge; `_template/` trägt den neuen Stand, Modus erkannt; Vorlage ist dieser Starter, Prozess RP-1 auf SP-1; alte Version bekannt (Schritt 0) |
| Tausch | geschehen in Schritt 2 — das Skript stellt nur fest, dass `_template/` den neuen Stand trägt |
| Umbenennungen | Dateinamen nach der Tabelle der Sprung-Datei §1 (aus 1.x: `Rollen.md`, `Katalog.md`, Umlaute → ae/oe/ue/ss; aus 2.0: keine); per `git mv`, nie über eine vorhandene Datei |
| Neue Dateien | jede Datei des neuen Stands, die im Projekt fehlt (Root-Regelwerk, `wiki/` samt Katalog-Einträgen, Mechanik-Knoten, Fassaden, Vorlagen; `.gitignore` nur, falls keine da ist), wird angelegt und gesammelt gemeldet — Fassaden, die der aktive Prozess voraussetzt, aktiv, optionale deaktiviert (`active: false`) mit Hinweis an den Anwender, abgelöste nur als Hintergrund; eine bestehende Datei wird nie überschrieben; eine so angelegte Fassade trägt im Frontmatter-Kommentar „beim Upgrade angelegt“ |
| Formalien | Frontmatter nach der Tabelle der Sprung-Datei §1 (aus 1.x), einschließlich `supersedes:` am Nachfolger einer Ablösung; aus 2.0 keine |
| Herkunft | Zeile `Template-Stand: 2.1 seit <Tag des Upgrades>` neu, darunter `Vorher: <alte Version> (bis <Tag des Upgrades>)`; eine frühere `Vorher`-Zeile bleibt darunter stehen; 1.x-Form wird zur 2.0-Form (Schritt 7 füllt die übrigen Zeilen) |
| Trefferliste | alles, was du kontext-bewusst nachziehst (Schritt 6): aus 1.x Wikilinks auf umbenannte Dateien, `SPEC`-/`BR`-Kennungen, Pflegezeilen „Stand:“, Marken-Zeiger, Altknoten, Contract-Fassungen, alte Ablöse-Vermerke; aus 2.0 Verzichts-DECs und Freigaben mit alten Phasennummern, vorgefundenes `docs/`; dazu die Delta-Liste der bestehenden Dateien, eingeteilt nach Schritt 5 |
| Lint-Kern | `sh _template/tools/lint.sh` aus dem Projekt-Root — als Trefferliste; maßgeblich ist der Lauf in Schritt 8 |

Danach Commit „Upgrade: Mechanik“ (entfällt, wenn der
Lauf nichts geändert hat — das Skript sagt es).

## 4. Pflicht-Fassaden und laufende Marke — vor dem Lint

[[Zielmarken]] und [[Entscheidungen]] sind in jedem
Projekt Pflicht; fehlen sie, hat Schritt 3 sie als neue
Dateien angelegt (von Hand kopierst du sie aus
`_template/wiki/`); sind sie deaktiviert (in 1.1 war
[[Zielmarken]] abwählbar), aktivierst du sie
(Reaktivierung nach ihrem Bootstrap). Trägt nach der
Umstellung der Zustand-Zeilen (Sprung-Datei §2) keine
Marke `in-progress`, legst du die vom Anwender benannte
laufende Marke jetzt an (Marken-Dreiklang, Zustand
`in-progress`; [[Zielmarken]] §Meta) — **vor jeder
Buchung**, weil jedes neue Element sie in `zielmarke:`
trägt. Fassaden, die der aktive Prozess voraussetzt,
sind aktiv (Landkarte [[Fassaden]] nachführen). Ohne
Prozess gilt nur die Pflicht der Basis.

## 5. Delta-Nachzug der lebenden Dokumente

Vergleiche je Datei, die es im Projekt **und** im neuen
Stand gibt, die Fassung unter `_template/` mit der
lebenden Kopie (Root-Regelwerk `MasterPrompt.md`,
`Wiki.md`, `Vorgehen.md`, `Reviewmuster.md`,
`Outgoing.md`, Styleguides; Fassaden-`## Meta`,
Mechanik-Knoten, Vorlagen) und lege Übernahmen **als
Vorschlag** vor — gesammelt, je Datei mit dem, was sich
ändert und was projekt-eigen bleibt ([[Init-Choreografie]]
§Phase A0 „Delta-Nachzug“). Eine bestehende Datei
ändert sich nie automatisch; projekt-eigene Einträge
bleiben, Regelwerks-Text wird übernommen — bei einer
Fassade also der Kopf (`## Meta`, Regeltext) aus der
Vorlage, die Einträge aus dem Projekt; Trennpunkt ist
die Überschrift des Eintrags-Abschnitts am
Zeilenanfang (in [[Zielmarken]] `## Marken`), nicht
ihre erste Erwähnung — `## Meta` nennt sie schon im
Text. Nennt die Gliederung des neuen Kopfs einen
Eintrags-Abschnitt, den das Projekt noch nicht hat
(SP-1 2.0: `## Fehlerbehebungen` in [[Anforderungen]]),
legst du ihn leer an — er ist Regelwerks-Text, kein
Projekt-Teil (G2). Neue Dateien
sind keine Übernahmen (Schritt 3). Regel für die
Vorlage: Gleicht die lebende Kopie dem alten Stand der
Vorlage (Modus A: `_template/` im Sicherungs-Commit;
Modus B: der Pin des Submoduls vor dem Tausch,
`git -C _template show <Pin>:<Datei>`; ohne altes
`_template/`: der alte Stand der Quelle über ihr
Release-Tag, `git clone --branch release-<alt>
--depth 1 <Quelle> <Ordner außerhalb>`), hat das
Projekt sie nie verändert — solche Dateien schlägst du
als eine Gruppe zur Übernahme vor; nur Dateien mit
projekt-eigenen Änderungen einzeln (das Skript teilt
die Delta-Liste so ein). Dazu:

- **Instruktionsdatei** (`CLAUDE.md` o.ä.) nach
  MasterPrompt §8.3 / [[Instruktionsdatei-Pflege]]
  nachziehen.
- **§Komponenten** von [[Softwaresystemarchitektur]]
  in der 2.0-Form und bei Rolle Komponent die
  Übernahme-Art: Sprung-Datei §2.
- `Tools.md`: `_template/tools/lint.sh` als
  Template-Werkzeug (§Projekt-Skripte) und die
  Prüf-Werkzeuge mit Ersatzweg (§Prüf-Werkzeuge; die
  Frage aus `INIT.md` Schritt 3 Nr. 6, falls noch nicht
  gebucht — Schritt 8 braucht sie); fehlt die Datei
  (1.x), legst du sie aus
  `wiki/templates/Tools-Vorlage.md` an.

Nach der Antwort umsetzen, Commit „Upgrade:
Delta-Nachzug“.

## 6. Versions-spezifische Schritte

Je Sprung eine Datei `upgrade/<alt>-nach-<neu>.md`; du
gehst alle Sprünge von der alten Version bis zur neuen
in einem Upgrade nacheinander durch — jede Datei mit
den Phasennummern ihres Ziel-Stands, die nächste bildet
sie weiter ab:

- **aus 2.0:** `upgrade/2.0-nach-2.1.md` (Phasen-
  Zuordnung mit den Doku-Phasen P11 und P12, Lesung
  alter Freigaben und Verzichts-DECs, Doku-Abfrage für
  die laufende Marke, Vorstatus `offen`, neue Dateien);
- **aus 1.0 oder 1.1:** zuerst `upgrade/1.x-nach-2.0.md`
  (Phasen-Zuordnung, `SPEC` → `FUNC`, `BR` → `BUG`,
  Katalog statt `Knotentypen.md`, Bestandsschutz, was
  die Trefferliste aus Schritt 3 verlangt), danach
  `upgrade/2.0-nach-2.1.md` (dort Abschnitt 4).

Wikilinks und Kennungen ziehst du **kontext-bewusst**
nach — kein `sed`. Danach Commit.

## 7. Herkunft nachführen

Abschnitt `## Herkunft` von [[Aktivierter-Prozess]]
(Format: [[Init-Choreografie]] §Phase A0
„Herkunfts-Vermerk“):

- `- **Template-Stand:** 2.1 seit JJJJ-MM-TT` — der Tag
  des Upgrades; er ist der Stichtag, den der Lint liest
  (neue Pflichtfelder gelten als Fehler nur für
  Elemente ab diesem Tag; alte Phasennummern liest er
  nur an Einträgen vor diesem Tag um, Sprung-Datei
  `2.0-nach-2.1.md` §3).
- `- **Vorher:** <alte Version> (bis JJJJ-MM-TT)` —
  direkt darunter; frühere `Vorher`-Zeilen bleiben
  stehen. Direkt unter der Zeile steht als Vermerk die
  Zuordnungstabelle alt → neu, die die Sprung-Datei
  vorgibt (Phasennummern; je durchlaufenem Sprung ein
  Vermerk in der Reihenfolge der Sprünge, Wortlaut in
  der jeweiligen Sprung-Datei §2). Ins
  Entscheidungs-Register kommt kein Eintrag.
- `Quelle` (Repo-URL und Commit bzw. Tag des neuen
  Stands), `Anbindungs-Modus`, `Prozess`, `Rolle`,
  `Übernahme-Art` — aus Schritt 0 bzw. 5; bei der
  1.x-Form wird das Feld „Template-Herkunft“ zur Zeile
  `Quelle`; ohne Vermerk (Stand 1.0) legst du den
  Abschnitt mit den Antworten aus Schritt 0 an.

Commit „Upgrade: Herkunft“.

## 8. Absicherungs-Review (zweistufig)

1. **Lint:** `sh _template/tools/lint.sh` aus dem
   Projekt-Root ohne FEHLER; Hinweise zum Bestand sind
   erwartet (Liste: Sprung-Datei §5) — jeden anderen
   Hinweis begründet dein Bericht.
2. **Stufe 1 — maschinelle Vorprüfung:** zwei Prüfer
   verschiedener Modelle als frische Agenten,
   unabhängig voneinander (möglichst beide ungleich
   deinem eigenen; aus `Tools.md` §Prüf-Werkzeuge; gibt
   es nur ein Modell: frische Agenten desselben Modells,
   ausdrücklich als schwächere Absicherung benannt):
   > Prüfe das Upgrade im Projekt `<Projekt>` auf
   > Template-Stand 2.1: (1) Vollständigkeit — jede
   > Position aus `<Anleitungs-Ort>/UPGRADE.md`
   > Schritt 3 bis 7 und aus den Sprung-Dateien
   > `<Anleitungs-Ort>/<alt>-nach-<neu>.md` des Wegs
   > (aus 2.0: `2.0-nach-2.1.md`; aus 1.x: `1.x-nach-2.0.md`
   > und `2.0-nach-2.1.md`) umgesetzt oder
   > als Angebot berichtet? (2) Treue — Inhalte
   > unverändert, nur Formalien und Kennungen
   > umgestellt, Altbestände lesbar? (3) Links —
   > Wikilinks heil, `alias:` gesetzt? (4) Herkunft
   > und Marken — `Template-Stand`, `Vorher`,
   > Zuordnungstabelle, laufende Marke, neue Elemente
   > mit `zielmarke:` und Anlage-Datum, Bestand ohne
   > beides? Dazu `sh _template/tools/lint.sh` aus dem
   > Projekt-Root: keine FEHLER. Schreibe genau einen
   > Bericht mit Ampel (grün/gelb/rot) und nummerierten
   > Befunden samt Fundstelle. Kein Commit.
   `<Anleitungs-Ort>` ist `_template/upgrade`, bei
   einem Projekt aus der allgemeinen Vorlage der
   Lese-Klon mit `/upgrade`.
   Jeden Bericht zuerst ablegen ([[Agent-Berichte]]),
   dann zusammenfassen. **Beide grün → weiter. Sonst:
   nacharbeiten, Commit, Kurz-Re-Check beider Prüfer —
   höchstens drei Runden**; danach ein
   Konvergenz-Bericht an den Anwender statt Grün
   (`convergence-report`, [[Agent-Berichte]]:
   wiederkehrende Befunde, Ursache,
   Handlungsoptionen); ein Befund, der in gleicher
   Form wiederkehrt, geht sofort an ihn.
3. **Stufe 2 — der Anwender, wenn er Prüfer ist:** Hat
   das Projekt den Ersatzweg „Anwender als Prüfer“
   gebucht, prüft er jetzt das Ergebnis der Vorprüfung;
   sein Urteil hält ein eigener `review-report` mit
   `modell: anwender` fest. Beim Ein-Modell-Weg endet
   das Review mit Stufe 1.
4. Dasselbe Review läuft bei einem **Prozess-Upgrade**
   (Hinzufügen oder Wechsel eines Prozesses, Wiki.md
   §11.5), wenn es bestehende Einträge migriert.
5. Abschluss-Commit „Upgrade auf Template-Stand 2.1
   abgeschlossen“; `devstate_active.md` nachführen.

## Verbund

Jedes Repo hebt sich selbst, es gibt keine feste
Reihenfolge; gemischter Betrieb mit noch nicht gehobenen
Nachbarn ist zulässig (zum Umgang mit ihnen: Grundsätze
oben). Übergabe-Stände für bereits laufende Komponenten
entstehen nur auf Zuruf des Anwenders, nicht
automatisch. Was mit alten Contract-Einträgen
geschieht, steht in `1.x-nach-2.0.md`.

## Danach

Ab dem Upgrade gilt für die laufende Marke die normale
Kette: fehlende Pflicht-Stände meldet die
[[Kettenpruefung]] vor der nächsten Freigabe, du bietest
sie an. Jedes neue Element trägt `zielmarke:` und sein
Anlage-Datum; der Bestand bleibt ohne beides — nichts
wird nachgetragen. Diese Anleitung liegt nur im
Starter (`_template/upgrade/` bzw. Lese-Klon) und
wird nicht kopiert. Ab hier gilt der normale Betrieb
nach MasterPrompt.
