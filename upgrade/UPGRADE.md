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
den neuen Stand trägt (Schritt 2), liest du von dort.

Diese Anleitung gilt für jedes Projekt mit einem
Herkunfts-Vermerk — aus diesem Starter oder aus der
allgemeinen Vorlage, mit oder ohne Prozess. **Was in
`_template/` landet, ist der neue Stand derselben
Vorlage, aus der das Projekt stammt**; das Projekt
behält seinen Prozess. Bei einem Projekt aus der
allgemeinen Vorlage ist dieses Dokument nur Anleitung
(das Skript in Schritt 3 gilt für Projekte aus diesem
Starter), das Ziel bleibt die allgemeine Vorlage.
Projekte ohne Software-Prozess gehen denselben Weg;
Schritte, die P-Phasen oder RP-1 voraussetzen,
entfallen dort. Hat das Projekt keinen
Herkunfts-Vermerk und kein `_template/` und sammelt es
sein Wissen in verstreuten Dateien, ist es keine
Upgrade-, sondern ein Migrations-Fall
(`migration/MIGRATION.md`) — sag es dem Anwender.

## Grundsätze

Alles Weitere in dieser Anleitung folgt aus drei
Grundsätzen. Wo ein Fall unten nicht ausdrücklich
steht, entscheiden sie:

- **Nichts geht verloren.** Nichts überschreiben,
  nichts löschen ohne ausdrücklichen Wunsch des
  Anwenders. Darum steht der Sicherungs-Commit vor
  allem anderen, bleibt der alte Stand von `_template/`
  in der Git-Geschichte, überschreibt das Upgrade keine
  bestehende Datei des Projekts (Änderungen daran sind
  Vorschläge, Schritt 5), bleiben Altbestände lesbar
  (Bestandsschutz, die Überführung wird angeboten) und
  bleiben historische Einträge, alte Ablöse-Vermerke
  und alte Ideen-Einträge „Fassaden-Kandidat …,
  vertagt“ unverändert stehen. Darum auch kein Upgrade,
  solange eine Zwischenmarke läuft: zwei Arbeitslinien
  auf einer Struktur, die sich unter beiden ändert —
  verweise auf die Zeit nach der Rückkehr, wenn die
  zurückgestellte Marke wieder `in-progress` ist.
- **Alles wird einsortiert.** Was der neue Stand
  verlangt, überträgst du in die Struktur der Vorlage
  oder verlinkst es; die Herkunft bleibt erkennbar.
  Darum legt das Upgrade neue Dateien des neuen Stands
  an, trägt der Herkunfts-Vermerk die Versionsfolge
  (Zeile `Vorher`), bekommen umbenannte Elemente ihre
  alte Kennung als `alias:`, und was nicht mechanisch
  überführbar ist, steht als Angebot in deinem Bericht
  an den Anwender — nie verwerfen.
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
  eines Nachbar-Repos, dass es noch nicht gehoben ist,
  schreibst du ihm keine Nachricht (es könnte sie weder
  lesen noch quittieren), sondern bittest den Anwender,
  die Sache wie bisher weiterzugeben, und empfiehlst,
  den Nachbarn bald zu heben.

Feste Regeln stehen nur dort, wo eine Maschine liest
(Lint, Skript: die Zeilen `Template-Stand` und `Vorher`
mit der Zuordnungstabelle darunter, `zielmarke:` und
Anlage-Datum neuer Elemente, die Umbenennungen und
Formalien, die das Skript umstellt) oder wo der Anwender
bewusst vom vernünftigen Standard abweicht (dieselbe
Vorlage bleibt die Vorlage; neue Dateien ohne
Rückfrage). Alles andere sind Beispiele unter den
Grundsätzen.

**Keine Ausführung ohne Zustimmung:** Tausch von
`_template/` und Skript sind Angebote an den Anwender —
du nennst, was du tun willst (bei Kommandos: das exakte
Kommando), und handelst erst nach seiner Antwort.
Ausgenommen sind die Commits, die du in einem Satz
ankündigst und ausführst: der Sicherungs-Commit
(Schritt 1) und die Commits je Schritt; für sie gelten
die Schutzregeln aus Schritt 1.

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
  - **2.0-Form:** Abschnitt `## Herkunft` mit den Zeilen
    `Template-Stand` (Version und Stichtag), `Quelle`
    (Repo-URL und Commit bzw. Tag), `Anbindungs-Modus`,
    `Prozess`, `Rolle`, `Übernahme-Art` (Format:
    [[Init-Choreografie]] §Phase A0).
  - **1.x-Form:** Feld „Template-Herkunft“ (Quelle und
    Stand) im Knoten, kein `## Herkunft`; Prozess aus
    „Gewählter Prozess“, Rolle aus „RP-1-Rolle“.
- **Anbindungs-Modus:** **B**, wenn `.gitmodules` einen
  Eintrag für `_template` trägt (`git submodule status
  _template` zeigt den Pin; die Version aus `git -C
  _template describe --tags --always`); **A**, wenn
  `_template/` ein gewöhnlicher Ordner ohne eigenes
  `.git` ist (Version aus der Zeile `Quelle` bzw. dem
  Feld „Template-Herkunft“; fehlt sie, aus
  `_template/README.md` oder dem Vergleich mit den
  Release-Tags der Vorlage).
- **Vorlage:** aus der Zeile `Quelle` bzw. dem Feld
  „Template-Herkunft“, bei Modus B zusätzlich aus der
  Submodul-URL. Nennt sie diesen Starter
  (`referenzprozess-softwareentwicklung`), ist das
  Skript nutzbar; nennt sie die allgemeine Vorlage,
  gehst du den Weg von Hand mit deren neuem Stand.
- **Fallback — Ausgangsstand erfragen:** Ist die
  Version nicht ablesbar (ungefülltes Feld, kein
  `_template/`), frage den Anwender nach dem Stand, mit
  dem das Projekt angelegt wurde; Anhaltspunkt ist ein
  Diff der Regelwerks-Dateien des Projekts gegen den
  Tag `release-1.0` der Vorlage. **Fehlt `_template/`**
  (ein 1.0-Projekt direkt aus der allgemeinen Vorlage),
  fragst du nach Vorlage und Einbindung wie beim Init
  (Einbindungs-Frage aus `INIT.md` Schritt 0, Modus A
  oder B) und legst `_template/` in Schritt 2 an. Ist
  die Herkunft auch dann nicht erkennbar, fragst du.
- **Laufende Marke und Zwischenmarke:** aus
  [[Zielmarken]] — welche Marke `in-progress` trägt und
  ob es eine Zwischenmarke ist (Grundsätze oben); hat
  das Projekt keine `in-progress`-Marke, benennt der
  Anwender sie jetzt (Schritt 4).
- **Angebot der zwei Wege** (Projekt aus diesem
  Starter): **(a)** das Skript `setup/upgrade.sh` für
  die Mechanik (empfohlen: deterministisch, ändert
  Inhalte nicht, listet Treffer für dich) oder **(b)**
  dieselben Schritte von Hand nach Schritt 3; (b) ist
  zugleich der Fallback, wenn das Skript nicht lauffähig
  ist. Der Anwender wählt.

## 1. Sicherung

Den unveränderten Ausgangszustand committen, **vor** dem
Tausch — angekündigt, nicht erfragt:
`git add -A && git commit -m "Sicherung vor Upgrade auf Template-Stand 2.0"`.
Schutzregeln: Ist nichts zu committen, gilt der aktuelle
`HEAD` als Sicherung (kein leerer Commit); ignorierte
Dateien bleiben ignoriert (nie `git add -f`);
offensichtlich sensible oder sehr große Dateien (> 50 MB)
unter den ungetrackten lässt du aus und nennst sie;
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
  Commit und Tag ablesen (`git -C <Ordner> rev-parse
  HEAD`, `git -C <Ordner> describe --tags --always`),
  dann `_template/` durch die Kopie ohne `.git` ersetzen.
  Die alte Kopie bleibt in der Git-Geschichte des
  Sicherungs-Commits — das Ur-Versions-Archiv geht nicht
  verloren. Bei einem Projekt aus diesem Starter
  übernimmt das Skript den Tausch (Schritt 3, Aufruf aus
  dem Klon).
- **Ohne `_template/`** (Fallback aus Schritt 0):
  Einbindung nach der Antwort des Anwenders wie in
  `INIT.md` Schritt 0, mit dem neuen Stand.

Danach ein eigener Commit „Vorlage auf Stand 2.0
gesetzt“ (bei Modus A einschließlich der kompletten
Kopie). Ab hier liest du Anleitung und Regelwerk aus
`_template/`.

## 3. Mechanik: Skript oder von Hand

Die folgenden Schritte sind reine Mechanik — Inhalte
ändern sie nicht. Für ein Projekt aus diesem Starter
führt sie `sh <neuer Stand>/setup/upgrade.sh --vorher
<alte Version>` aus (aus dem Projektordner; `<neuer
Stand>` ist der Klon aus Schritt 2 oder, wenn
`_template/` den neuen Stand schon trägt,
`_template`); `--nur-pruefen` zeigt vorher, was es
täte. Von Hand gehst du dieselbe Liste durch; sie ist
der führende Ort, das Skript ihre Implementierung.

| Schritt | Was geschieht |
|---|---|
| Vorprüfung | Sicherungs-Commit vorhanden (`git status --porcelain` leer), kein laufender Merge; `_template/` und Modus erkannt; Vorlage ist dieser Starter |
| Tausch | Modus B Submodul neu setzen, Modus A Kopie ersetzen (Schritt 2); nicht erreichbare Quelle → Abbruch mit Meldung |
| Umbenennungen | `wiki/Verwendungs-Rollen.md` → `wiki/Rollen.md`; `wiki/Knotentypen.md` → `wiki/Katalog.md` (Dateiwechsel; Inhalt kommt in Schritt 5 und 6); Dateinamen mit Umlaut oder ß → ae/oe/ue/ss (z.B. `Projekt-Praefixe.md`, `Geschaeftsbeziehungen.md`); per `git mv`, nie über eine vorhandene Datei |
| Neue Dateien | jede Datei des neuen Stands, die im Projekt fehlt (Root-Regelwerk, `wiki/` samt Katalog-Einträgen, Mechanik-Knoten, Fassaden, Vorlagen), wird angelegt und gesammelt gemeldet — Fassaden, die der aktive Prozess voraussetzt, aktiv, optionale deaktiviert (`active: false`) mit Hinweis an den Anwender; eine bestehende Datei wird nie überschrieben |
| Formalien | im Frontmatter `subtype:` → `requirement_type:`, `superseded-by:` → `superseded_by:`, Status `umgesetzt-wartet-auf-Prüfung` → `umgesetzt` mit Vermerk „Prüfung offen“, `rolle_art: verwendungsrolle` an `role`-Knoten (Details: `1.x-nach-2.0.md`) |
| Herkunft | Zeile `Template-Stand: 2.0 seit <Tag des Upgrades>` neu, darunter `Vorher: <alte Version> (bis <Tag des Upgrades>)`; 1.x-Form wird zur 2.0-Form (Schritt 7 füllt die übrigen Zeilen) |
| Trefferliste | alles, was du kontext-bewusst nachziehst (Schritt 6): Wikilinks auf umbenannte Dateien, `SPEC`-/`BR`-Kennungen, Pflegezeilen „Stand:“, Altknoten, Contract-Fassungen, alte Ablöse-Vermerke, Delta-Liste der bestehenden Dateien |
| Lint-Kern | `sh _template/tools/lint.sh` aus dem Projekt-Root — als Trefferliste; maßgeblich ist der Lauf in Schritt 8 |

Danach Commit „Upgrade: Mechanik“.

## 4. Pflicht-Fassaden und laufende Marke — vor dem Lint

[[Zielmarken]] und [[Entscheidungen]] sind in jedem
Projekt Pflicht; fehlen sie, hat Schritt 3 sie als neue
Dateien angelegt, von Hand kopierst du sie aus
`_template/wiki/`. Trägt keine Marke `in-progress`,
legst du die vom Anwender benannte laufende Marke jetzt
an (Marken-Dreiklang, Zustand `in-progress`; [[Zielmarken]]
§Meta) — **vor jeder Buchung**, weil jedes neue Element
sie in `zielmarke:` trägt. Fassaden, die der aktive
Prozess voraussetzt, sind aktiv (Landkarte [[Fassaden]]
nachführen). Ohne Prozess gilt nur die Pflicht der
Basis.

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
bleiben, Regelwerks-Text wird übernommen. Neue Dateien
sind keine Übernahmen (Schritt 3). Dazu:

- **Instruktionsdatei** (`CLAUDE.md` o.ä.) nach
  MasterPrompt §8.3 / [[Instruktionsdatei-Pflege]]
  nachziehen.
- **Rolle Koordinator:** die Spalten Pfad und Remote in
  §Komponenten von [[Softwaresystemarchitektur]] als
  Vorschlag ergänzen (Werte aus den
  Nachbarverzeichnissen); bestehende Inhalte der Tabelle
  bleiben. **Rolle Komponent:** die Übernahme-Art aus
  der gebuchten Modus-Wahl ableiten (Komponenten-Modus A
  → selbstständig, Modus B → Auftrag) und zur
  Bestätigung vorlegen; ist nichts gebucht, fragen.
- `Tools.md`: `_template/tools/lint.sh` als
  Template-Werkzeug (§Projekt-Skripte) und die
  Prüf-Werkzeuge mit Ersatzweg (§Prüf-Werkzeuge; die
  Frage aus `INIT.md` Schritt 3 Nr. 6, falls noch nicht
  gebucht — Schritt 8 braucht sie).

Nach der Antwort umsetzen, Commit „Upgrade:
Delta-Nachzug“.

## 6. Versions-spezifische Schritte

Je Sprung eine Datei `upgrade/<alt>-nach-<neu>.md`; für
den Sprung aus 1.0 oder 1.1: **`upgrade/1.x-nach-2.0.md`**
(Phasen-Zuordnung, `SPEC` → `FUNC`, `BR` → `BUG`,
Katalog statt `Knotentypen.md`, Bestandsschutz, was die
Trefferliste aus Schritt 3 verlangt). Wikilinks und
Kennungen ziehst du **kontext-bewusst** nach — kein
`sed`. Danach Commit.

## 7. Herkunft nachführen

Abschnitt `## Herkunft` von [[Aktivierter-Prozess]]
(Format: [[Init-Choreografie]] §Phase A0
„Herkunfts-Vermerk“):

- `- **Template-Stand:** 2.0 seit JJJJ-MM-TT` — der Tag
  des Upgrades; er ist der Stichtag, den der Lint liest
  (neue Pflichtfelder gelten als Fehler nur für
  Elemente ab diesem Tag).
- `- **Vorher:** <alte Version> (bis JJJJ-MM-TT)` —
  direkt darunter; frühere `Vorher`-Zeilen bleiben
  stehen. Direkt unter der Zeile steht als Vermerk die
  Zuordnungstabelle alt → neu, die die Sprung-Datei
  vorgibt (für 1.x → 2.0: Phasennummern). Ins
  Entscheidungs-Register kommt kein Eintrag.
- `Quelle` (Repo-URL und Commit bzw. Tag des neuen
  Stands), `Anbindungs-Modus`, `Prozess`, `Rolle`,
  `Übernahme-Art` — aus Schritt 0 bzw. 5; bei der
  1.x-Form wird das Feld „Template-Herkunft“ zur Zeile
  `Quelle`.

Commit „Upgrade: Herkunft“.

## 8. Absicherungs-Review (zweistufig)

1. **Lint:** `sh _template/tools/lint.sh` aus dem
   Projekt-Root ohne FEHLER; Hinweise zum Bestand
   (Altknoten, abgeschlossene Marken ohne
   Abschluss-Stand, alte Ablöse-Vermerke, Elemente ohne
   Feld) sind erwartet — jeden anderen Hinweis
   begründet dein Bericht.
2. **Stufe 1 — maschinelle Vorprüfung:** zwei Prüfer
   verschiedener Modelle als frische Agenten,
   unabhängig voneinander (möglichst beide ungleich
   deinem eigenen; aus `Tools.md` §Prüf-Werkzeuge; gibt
   es nur ein Modell: frische Agenten desselben Modells,
   ausdrücklich als schwächere Absicherung benannt):
   > Prüfe das Upgrade im Projekt `<Projekt>` auf
   > Template-Stand 2.0: (1) Vollständigkeit — jede
   > Position aus `_template/upgrade/UPGRADE.md`
   > Schritt 3 bis 7 und aus
   > `_template/upgrade/1.x-nach-2.0.md` umgesetzt oder
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
   Jeden Bericht zuerst ablegen ([[Agent-Berichte]]),
   dann zusammenfassen. **Beide grün → weiter. Sonst:
   nacharbeiten, Commit, Kurz-Re-Check beider Prüfer —
   höchstens drei Runden**; danach ein
   Konvergenz-Bericht an den Anwender statt Grün; ein
   Befund, der in gleicher Form wiederkehrt, geht
   sofort an ihn.
3. **Stufe 2 — der Anwender, wenn er Prüfer ist:** Hat
   das Projekt den Ersatzweg „Anwender als Prüfer“
   gebucht, prüft er jetzt das Ergebnis der Vorprüfung;
   sein Urteil hält ein eigener `review-report` mit
   `modell: anwender` fest. Beim Ein-Modell-Weg endet
   das Review mit Stufe 1.
4. Dasselbe Review läuft bei einem **Prozess-Upgrade**
   (Hinzufügen oder Wechsel eines Prozesses, Wiki.md
   §11.5), wenn es bestehende Einträge migriert.
5. Abschluss-Commit „Upgrade auf Template-Stand 2.0
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
wird nachgetragen. Diese Anleitung liegt nur in
`_template/upgrade/` und wird nicht kopiert. Ab hier
gilt der normale Betrieb nach MasterPrompt.
