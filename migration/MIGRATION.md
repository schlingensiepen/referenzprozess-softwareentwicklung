# MIGRATION — Bestehendes Projekt in das wiki/ dieses Starters überführen

**Du liest dieses Dokument, weil dein Projekt sein
Wissen bisher in verstreuten Dateien sammelt und
jetzt auf diese Vorlage migriert.** Diese Anleitung
ist dein Auftrag; die Regel-Dokumente der Vorlage
(MasterPrompt.md, Wiki.md …) ziehst du erst heran,
wenn eine Phase dich dorthin schickt: **Kontext
schonen geht vor Vollständigkeit.**

**Start ohne lokale Kopie:** Typischerweise kommst
du über den Start-Satz „Migriere das Projekt in
diesem Verzeichnis nach der Anleitung unter
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.“
hierher; das aktuelle Verzeichnis ist der
Projektordner. Du darfst dieses Dokument und jede
Datei, auf die es verweist, **direkt von der
Repo-URL lesen, bevor irgendetwas eingebunden ist**
(Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`;
Wiki-Verweise `[[Name]]` meinen `wiki/Name.md`). Ab
der Einbindung (Phase 0) liest du aus `_template/`.

**Zwei Warnungen vorab:**

- **Arbeitet das Projekt schon mit dieser Vorlage
  oder mit der allgemeinen Vorlage** — erkennbar an
  `wiki/Aktivierter-Prozess.md` mit einem Abschnitt
  `## Herkunft` oder einem Feld „Template-Herkunft“,
  bei Stand 1.0 ohne Vermerk an `MasterPrompt.md` und
  `Wiki.md` im Root neben einem `wiki/` mit
  `Aktivierter-Prozess.md` —,
  ist das keine Migration, sondern ein Upgrade: Sag
  es dem Anwender und verweise auf den
  Upgrade-Einzeiler der README (`upgrade/UPGRADE.md`).
- **Diese Migration führt in den Prozess für
  Softwareentwicklung** (RP-1 auf SP-1). Der Starter
  weiß, dass es andere Referenzprozesse gibt
  (Regelwerk unter `_template/referenzprozesse/`,
  keine abschließende Liste). Findest du im
  Vorgefundenen keinen Software-Bezug (kein Code,
  keine Software-Anforderungen, keine Architektur)
  oder bist du nicht sicher, fragst du im
  Fragen-Block (Phase 1 Nr. 1); besteht der Anwender
  auf dem Software-Prozess, migrierst du damit.

## Grundsätze

Alles Weitere in dieser Anleitung folgt aus drei
Grundsätzen. Wo ein Fall unten nicht ausdrücklich
steht, entscheiden sie:

- **Nichts geht verloren.** Nichts überschreiben,
  nichts löschen ohne ausdrücklichen Wunsch des
  Anwenders. Darum steht der Sicherungs-Commit vor
  allem anderen, bleibt jede vorgefundene Datei
  unverändert liegen (Umbenennen per `git mv` ist die
  einzige Änderung), überschreibt keine Starter-Datei
  eine vorgefundene, und auch die Antwort „komplett
  integrieren“ bei einer Kollision löscht nichts, bis
  der Anwender das Löschen ausdrücklich sagt.
- **Alles wird einsortiert.** Was du vorfindest,
  überträgst du in die Struktur der Vorlage oder
  verlinkst es; die Herkunft bleibt erkennbar. Darum
  nennt jeder übertragene Eintrag seine
  Herkunfts-Datei, bleiben Nachweise (alte
  Testergebnisse, Original-Changelogs,
  Betriebs-Anleitungen für Menschen) liegen und werden
  verlinkt statt übertragen, verlinkt die neue
  `TODO.md` jede Datei mit offenen Arbeiten, und was
  in keine Zeile des Mappings passt, kommt nach
  `Migrations-Grundlagen` — nie verwerfen. Ziel ist
  die oberste Schicht: so sähe das Projekt heute aus,
  hätte es immer mit der Vorlage gearbeitet; frühere
  Versionen, Marken und Stände baust du nicht nach.
- **Im Zweifel fragst du den Anwender.** Gesammelt im
  Fragen-Block (Phase 1); danach arbeitest du autonom
  und berichtest bei echten Blockaden, statt zu
  blockieren. Status-Werte im Zweifel konservativ,
  Ungeklärtes nach `Migrations-Grundlagen` §Ungeklärt.

Feste Regeln stehen nur dort, wo eine Maschine liest
(Lint, Skripte: die Zeile `Template-Stand`, die
Übernahme-Marke, `zielmarke:` und Anlage-Datum, die
Frontmatter von `Migrations-Grundlagen`) oder wo der
Anwender bewusst vom vernünftigen Standard abweicht
(neue `TODO.md` immer, Kollisionsfrage,
Prozess-Nachfrage). Alles andere sind Beispiele unter
den Grundsätzen.

**Kollisionsfrage** (Regel, gilt für jede vorgefundene
Datei und jeden vorgefundenen Ordner, deren Name mit
etwas kollidiert, das die Migration kopiert oder
anlegt — typisch `wiki/`, `devstate_active.md`,
`TODO.md`, eine Instruktionsdatei): Du stellst im
Fragen-Block (Phase 1 Nr. 8) je Fall die Frage mit
drei Möglichkeiten und gibst eine Empfehlung mit
Grund; der Anwender darf gesammelt antworten („alles
wie empfohlen“, „überall (c)“):

- **(a) umbenennen und nur verlinken** — die Datei
  bleibt umbenannt und unverändert liegen, ihr Inhalt
  wird nicht übertragen; die Starter-Datei wird
  angelegt und verlinkt sie;
- **(b) komplett integrieren** — ihr Inhalt geht
  vollständig an seinen Ort (Mapping Phase 3 bzw. in
  die Starter-Datei); **gelöscht wird nur auf
  ausdrücklichen Wunsch** — sonst fragst du nach und
  lässt die Datei bis dahin umbenannt liegen; du
  empfiehlst nie von dir aus das Löschen;
- **(c) integrieren und alte Fassung behalten** —
  Inhalt wie (b), die Datei zusätzlich wie (a).

Namensschema: `<Name>-vorgefunden.<Endung>` im selben
Ordner, für einen Ordner `<Name>-vorgefunden/` — du
schlägst vor, der Anwender bestätigt oder nennt einen
anderen Namen. Reihenfolge: erst umbenennen, dann die
ausgelassene Starter-Datei einspielen, dann buchen.
Inhaltsgleiche Dateien sind keine Kollision;
`.gitignore` wird nur kopiert, wenn keine vorhanden
ist. Beispiele: Für eine vorgefundene `TODO.md`
empfiehlst du (c) — Punkte einsortiert, Datei als
`TODO-vorgefunden.md`, von der neuen `TODO.md`
verlinkt. Hat die Starter-Datei keinen Platz für einen
Link (Ordner `wiki-vorgefunden/`, Instruktionsdatei),
steht er in `Migrations-Grundlagen` §Herkunft und bei
der Instruktionsdatei zusätzlich in der neuen.

**Keine Ausführung ohne Zustimmung:** `git init`,
Einbindung und Kopier-Skript (Phase 0) sind Angebote
— du nennst das exakte Kommando und handelst erst
nach der Antwort. Ausgenommen sind genau zwei
Commits, die du in einem Satz ankündigst: der
Sicherungs-Commit in einem **bestehenden** Repo
(Phase 0 Schritt 1) — er verändert keine
Bestands-Datei — und der Aufnahme-Commit (Phase 0
Schritt 3), der nur aufnimmt, was der Anwender
freigegeben hat. `git init` gehört nicht dazu
(MasterPrompt §5.3 A1: kein `git init` ungefragt in
einem gefüllten Ordner). Für den Starter-Fall ersetzt
Phase 0 Schritt 2 die Bootstrap-Init-Frage aus
MasterPrompt §5.3; die Modus-Beschreibung in
MasterPrompt §1 gilt unverändert.

**Grundgesetz (gilt ab sofort, dauerhaft):** Das
`wiki/` ist die Quelle der Wahrheit — was nicht im
`wiki/` steht, ist nicht festgelegt; die laufende
Unterhaltung ist Arbeitsspeicher. Daraus folgen
**Lese-Pflicht** (vor jeder Behauptung über eine
Festlegung und vor jeder Frage an den Anwender im
`wiki/` nachschlagen; Festlegungs-Behauptungen nennen
ihre Register-Nummer) und **Pflege-Pflicht**
(Klärungen, Berichte und Stände im selben Zug ablegen
— Berichte **vor** der Chat-Zusammenfassung). Diese
Regel übernimmst du in Phase 5 in deine
Instruktionsdatei.

**Quelle ist Nur-Lese:** Quelle ist der Starter, nach
Phase 0 unter `_template/` eingebunden (Submodul,
Modus B, oder Einmal-Kopie, Modus A — MasterPrompt
§1). Er wird **nie beschrieben**, nie gelöscht und
bleibt dauerhaft als Nachschlage- und Upgrade-Quelle,
bei Modus A zugleich als Ur-Versions-Archiv.
`referenzprozesse/`, `tools/` (Lint-Kern) und die
Anleitungen liegen **nur** dort. Ab der Kopie
arbeitest du ausschließlich im Projektverzeichnis.

**Werkzeug-Adaption:** Subagenten, Reviews und
Commits sind werkzeug-agnostisch — adaptiere sie auf
deine lokalen Mittel; ohne Subagenten arbeitest du
die Aufträge sequenziell selbst ab. Für die Dauer der
Migration übernimmst du Konvertierung und
Outgoing-Erzeugung selbst und startest keinen
WorkspaceManager ([[WorkspaceManager-Kontrakt]]
§Betriebs-Konfiguration; die reguläre Frage kommt in
Phase 5).

---

## Was du vorfindest

Dein `wiki/` ist **vorbereitet**: Kopie des
Starter-`wiki/` (Frisch-Vorlage) **plus Eintausch der
Migrations-Varianten aus `migration/`**, ausgeführt
durch `setup/init-migration.sh` oder von Hand nach der
Kopier-Liste (Phase 0). Alle Fassaden des
Software-Zuschnitts liegen bereit,
[[Aktivierter-Prozess]] bucht die Vorfestlegungen, der
[[Katalog]] trägt die mitgebrachten Einträge. **Du
baust kein wiki — du füllst eines.** Offen sind nur:
die Bootstraps von `Mission Statement` und `Facts`
(füllst du in Phase 3 aus deinem Wissen), die Fragen
aus Phase 1 und die Restfragen in Phase 5. Bootstraps
**deaktivierter** Fassaden bleiben liegen — bis zu
einer Reaktivierung per Zuruf
([[Geschaeftsbeziehungen]] empfiehlt der Prozess bei
Produktentwicklung; [[Fehlermeldungen]] setzt
[[Anforderungen]] voraus).

Die eingetauschten **Varianten** — jede ist das
Frisch-Pendant plus genau einem Unterschied:

- `devstate_active.md` — die nächsten Schritte zeigen
  auf diese Anleitung; die Zielmarke ist bis zur
  Übernahme-Marke offen.
- `wiki/Zielmarken.md` — die Bearbeitungsstand-Zeile
  nennt als erste Marke die Übernahme-Marke, die du
  in Phase 1 anlegst, statt der Marke des Inits.
- `wiki/Aktivierter-Prozess.md` — die Zeile
  `Template-Stand` schreibt die Migration mit dem
  Übernahme-Tag; die Rolle entscheidet der Anwender
  im Fragen-Block.
- `wiki/Commit-Sprache.md` — Vorschlag, die bisherige
  Sprach-Regelung für die Dauer der Migration
  beizubehalten; reguläre Frage in Phase 5.
- `wiki/WorkspaceManager-Kontrakt.md` —
  Betriebs-Konfiguration für die Dauer der Migration:
  nicht vorhanden, du übernimmst selbst; reguläre
  Frage in Phase 5.
- `wiki/InterneMechanik.md` — die Vorbelegungs-Sektion
  verweist auf diese Anleitung statt auf `INIT.md`.

---

## Phase 0 — Sicherung und Starter-Aufnahme (sofort, vor allem anderen)

Die Reihenfolge ist fest: **(a) Sicherungs-Commit des
Alt-Zustands → (b) Einbindung (mit Modus-Frage) →
(c) Kopie (Skript oder von Hand, als Angebot) →
(d) Aufnahme-Commit.** So trennt die Historie sauber
„vorher“ von „Starter da“.

1. **Sicherung zuerst** — den unveränderten
   Alt-Zustand committen, **vor** der Einbindung:
   - **Kein git-Repo** (`.git` fehlt): `git init`
     anbieten und auf Zustimmung warten. Lehnt der
     Anwender ab, ruht die Migration, bis ein Repo da
     ist (MasterPrompt §5.3 A1). Die Zustimmung zu
     `git init` gilt auch für den ersten Commit.
   - **Schutzregeln** (gelten für jeden Commit dieser
     Anleitung): Ist nichts zu committen
     (`git status --porcelain` leer — oder es bleiben
     nur Dateien, die du nach dem nächsten Satz
     auslässt), gilt der aktuelle `HEAD` als Sicherung
     — kein leerer Commit. Ignorierte Dateien bleiben ignoriert (nie
     `git add -f`). **Offensichtlich sensible
     Dateien** unter den ungetrackten (`.env`,
     `*.pem`, `*.key`, `id_rsa*`, `*.p12`,
     `credentials*`, Namen mit `secret`/`token`) und
     sehr große Dateien (> 50 MB) nimmst du **nicht**
     auf: du lässt sie aus und nennst sie dem Anwender
     (selbst committen oder in `.gitignore`
     eintragen). Bereits gestagte Änderungen gehören
     zum Alt-Zustand. Fehlt die git-Identität
     (`user.name`/`user.email`), fragst du danach —
     setze sie nicht selbst. Bei laufendem Merge oder
     Rebase, abweisendem Hook, verlangter Signatur
     oder eingebetteten fremden Repos (Unterordner mit
     eigenem `.git`) committest du nicht, beschreibst
     die Lage und wartest — nie `--no-verify`, nie
     Signatur abschalten, nie fremde `.git`-Ordner
     löschen.
   - **Ankündigen und ausführen** (ein Satz):
     `git add -A && git commit -m "Sicherung vor Wissens-Migration"`
     — bei ausgelassenen Dateien je Datei ein
     Ausschluss: `git add -A -- . ':!<pfad>'`, dann
     derselbe `git commit`.
2. **Einbindung:** Prüfung, ob sie schon erfolgt ist
   (`_template/` mit `_template/migration/MIGRATION.md`
   und `_template/MasterPrompt.md`), Modus-Erkennung,
   Einbindungs-Frage mit dem festen Wortlaut und die
   Kommandos für Modus B (`git submodule add …`) und
   Modus A (`git clone --depth 1 …`, Herkunft ablesen,
   `rm -rf _template/.git`) stehen in `INIT.md`
   Schritt 0 — du liest sie von dort und wendest sie
   hier an; der Sonderfall `_template/` leer ebenso.
   Eingebunden wird **erst nach der Antwort** — nach
   dem Sicherungs-Commit, vor dem Aufnahme-Commit.
3. **Projektdateien anlegen (Angebot):** **Ist die
   Kopie schon erfolgt?** Ein eigenes `wiki/` oder
   `devstate_active.md` im Bestand beweist nichts —
   maßgeblich ist der Vergleich mit `_template/`
   (`cmp -s <datei> <quelle>`): erfolgt, wenn
   `MasterPrompt.md` und `wiki/Init-Choreografie.md`
   inhaltsgleich zu ihrem Gegenstück unter
   `_template/` sind **und** `wiki/Aktivierter-Prozess.md`
   inhaltsgleich zu
   `_template/migration/wiki/Aktivierter-Prozess.md`
   ist (bzw. seinen Herkunfts-Vermerk schon trägt).
   Teilweise erfolgt → Angebot wie unten; das Skript
   ergänzt nur Fehlendes. Steht `devstate_active.md`
   schon jenseits von Phase 0, ist Phase 0 erledigt.

   Fehlt die Kopie, **biete die zwei Wege an** und
   kopiere erst nach Zustimmung — **(a)** das
   Kopier-Skript (empfohlen: deterministisch,
   überschreibt nichts, listet Kollisionen — bei einer
   Migration typisch eine vorgefundene
   `devstate_active.md`, deren Starter-Variante dann
   ausbleibt), aus dem
   Projektordner: `sh _template/setup/init-migration.sh`
   — oder **(b)** von Hand aus `_template/` nach der
   **Kopier-Liste** unten; sie ist der führende Ort,
   das Skript ihre Implementierung und (b) der
   Fallback, wenn das Skript nicht lauffähig ist.

   **Kollisionen:** Skript wie Handkopie lassen die
   kollidierende Starter-Datei aus und listen sie —
   auch ein Varianten-Ziel, das kollidiert, wird nicht
   eingetauscht; die Liste ist der Eingang der
   Kollisionsfrage (Grundsätze; Phase 1 Nr. 8).
   Beispiel: Ein vorgefundenes `wiki/`, das nicht aus
   diesem Starter stammt (kein inhaltsgleiches
   `wiki/Init-Choreografie.md`), ist **eine** Kollision
   auf Ordner-Ebene — nichts wird hineinkopiert, keine
   Variante dorthin getauscht. Nach der Antwort
   benennst du um und lässt das Skript erneut laufen
   (es ergänzt nur Fehlendes und tauscht die
   Varianten) oder kopierst von Hand.

   **Herkunft vermerken (beide Modi):** Nach der
   Kopie, vor dem Aufnahme-Commit, schreibst du in den
   Abschnitt `## Herkunft` von [[Aktivierter-Prozess]]
   (Format: [[Init-Choreografie]] §Phase A0):
   `Template-Stand: 2.0 seit JJJJ-MM-TT` mit dem
   **Übernahme-Tag** — dem Tag des Aufnahme-Commits;
   er ist der Stichtag, den der Lint liest, und das
   Datum in der Bezeichnung der Übernahme-Marke
   (Phase 1) —, `Quelle` (Repo-URL und Commit/Tag;
   Modus A der abgelesene Stand, Modus B der
   Submodul-Pin aus `git submodule status _template`)
   und `Anbindungs-Modus: A` bzw. `B`. Keine Zeile
   `Vorher` — die schreibt nur ein Upgrade. Liegt
   `wiki/Aktivierter-Prozess.md` wegen einer Kollision
   noch nicht vor, holst du den Vermerk nach der
   Kollisionsfrage nach.

   Danach der **Aufnahme-Commit** — Einbindung (bei
   Modus A die komplette Kopie unter `_template/`),
   Kopie und Herkunfts-Vermerk; angekündigt, nicht
   erfragt, mit den Schutzregeln aus Schritt 1:
   `git add -A && git commit -m "Starter aufgenommen"`.
   **Sind Einbindung und Kopie schon erfolgt** (vom
   Anwender von Hand): ist der Alt-Zustand noch
   ungesichert, alles in einem Commit sichern und die
   fehlende Trennung in der Commit-Message vermerken.

   **Kopier-Liste** (Quelle: Starter-Root):

   | Quelle (Starter) | Ziel (Projekt) | Bemerkung |
   |---|---|---|
   | `MasterPrompt.md` | `MasterPrompt.md` | Regelwerk |
   | `Wiki.md` | `Wiki.md` | Teildatei |
   | `Vorgehen.md` | `Vorgehen.md` | Teildatei |
   | `Reviewmuster.md` | `Reviewmuster.md` | Teildatei |
   | `Outgoing.md` | `Outgoing.md` | Teildatei |
   | `Styleguide.md` | `Styleguide.md` | Styleguide |
   | `Styleguide-md.md` | `Styleguide-md.md` | Styleguide |
   | `Styleguide-wiki.md` | `Styleguide-wiki.md` | Styleguide |
   | `.gitignore` | `.gitignore` | nur wenn im Projekt keine existiert |
   | `wiki/` (komplett, inkl. `templates/`) | `wiki/` | Frisch-Vorlage, inkl. deaktivierter Fassaden (Reaktivierung per Zuruf) |
   | `devstate_active.md` | `devstate_active.md` | wird gleich ersetzt (s.u.) |

   **Danach eintauschen** (Variante ersetzt das eben
   kopierte Frisch-Pendant):

   | Variante (Starter) | ersetzt (Projekt) |
   |---|---|
   | `migration/devstate_active.md` | `devstate_active.md` |
   | `migration/wiki/Zielmarken.md` | `wiki/Zielmarken.md` |
   | `migration/wiki/Aktivierter-Prozess.md` | `wiki/Aktivierter-Prozess.md` |
   | `migration/wiki/Commit-Sprache.md` | `wiki/Commit-Sprache.md` |
   | `migration/wiki/WorkspaceManager-Kontrakt.md` | `wiki/WorkspaceManager-Kontrakt.md` |
   | `migration/wiki/InterneMechanik.md` | `wiki/InterneMechanik.md` |

   **Nie kopiert werden:** `referenzprozesse/`,
   `tools/` (du rufst `_template/tools/lint.sh` auf),
   `upgrade/`, `README.md`, `INIT.md`, `migration/`
   samt dieser MIGRATION.md, `docs/`, `setup/`,
   `LICENSE`, `.git/` — alles in `_template/` lesbar;
   ein Bestands-`docs/` bleibt unberührt.

4. Commit-Texte sind bis zur Sprach-Frage (Phase 5)
   **sinngemäß in der bisherigen Projektsprache**
   zulässig. Ab jetzt endet jede abgeschlossene Phase
   mit einem Commit.

## Phase 1 — Fragen-Block (gesammelt, ein einziger Turn)

Zeige dem Anwender zuerst die Übersicht der Punkte
unten (je eine Zeile) und biete den Briefing-Modus an
(MasterPrompt §5.1.0): wählt er ihn, stellst du die
Fragen einzeln, sonst **alle** in einem Block
(nummeriert, je Punkt dein Vorschlag zuerst). Frage
nichts einzeln nach, was hier steht — und nichts, was
vorfestgelegt ist ([[Aktivierter-Prozess]]).

1. **Prozess-Nachfrage** — nur ohne Software-Bezug
   oder bei Zweifel (Warnung oben): „Bist du sicher,
   dass das der richtige Prozess ist? Ich erkenne
   nicht, dass er zum Vorgefundenen passt — willst du
   mir einen anderen nennen?“ Keine Liste. Nennt der
   Anwender einen anderen Prozess, geht die
   Transformation in die Struktur dieses Prozesses;
   der Starter bleibt `_template/`:
   - Das kopierte Software-`wiki/` ersetzt du durch
     das Basis-Wiki und die Skelette des gewählten
     Prozesses aus `_template/referenzprozesse/` nach
     [[Init-Choreografie]] §Phase A0 und §Baustein
     Prozess-Angebot (ein geplanter Prozess:
     Basis-Only-Modus).
   - `Aktivierter-Prozess` und `Commit-Sprache`
     entstehen neu aus dem Basis-Bootstrap
     `InterneMechanik.md`; in den Herkunfts-Vermerk
     übernimmst du `Template-Stand`, `Quelle` und
     `Anbindungs-Modus` aus der Variante, `Prozess` ist
     der gewählte, `Rolle` kommt aus Nr. 5; in
     `Commit-Sprache` trägst du den Vorschlag aus Nr. 4
     ein.
   - Von den übrigen Varianten gilt der jeweilige
     Unterschied sinngemäß für ihr Pendant im neuen
     `wiki/`: `devstate_active.md`, `Zielmarken`
     (Übernahme-Marke), `WorkspaceManager-Kontrakt`
     (du übernimmst selbst), `InterneMechanik` (Verweis
     auf diese Anleitung).
   - Im Mapping (Phase 3) nimmt eine Zeile, deren Ziel
     es im gewählten Prozess nicht gibt, die Fassade
     dieses Prozesses mit demselben Zweck; fehlt eine
     solche, greift die Auffangregel
     `Migrations-Grundlagen`.
2. **Wissensbasis-Dateien bestätigen:** Liste alle
   Dateien/Ordner, die du als bisherige Wissensträger
   identifizierst (lies dazu nur Datei-Namen und
   Kopfzeilen, nicht die Volltexte), und kennzeichne
   die Dateien mit **offenen Arbeiten**
   (Aufgabenlisten, Roadmaps, TODO-Abschnitte) — sie
   verlinkt die neue `TODO.md` (Phase 3). Der
   Anwender streicht/ergänzt.
3. **Prüf-Modelle:** Nenne, welches Modell du selbst
   bist, und schlage für die Vorprüfung (Phase 4)
   **zwei Prüfer verschiedener Modelle** vor,
   möglichst beide ungleich deinem eigenen, das
   zweite über ein Werkzeug (Peer-Agent, externes
   Modell). Gibt es nur ein Modell: frische Agenten
   desselben Modells in neuem Kontext — ausdrücklich
   als schwächere Absicherung benannt. Dazu die Wahl
   des **Ersatzwegs** für alle späteren Prüfungen ohne
   zweites Modell: (a) Ein-Modell-Weg oder (b)
   Anwender als Prüfer — bei (b) prüft der Anwender in
   Phase 4 nach der Vorprüfung selbst. Eintrag in
   `Tools.md` §Prüf-Werkzeuge (Phase 3).
4. **Sprache:** Schlage vor, für die Dauer der
   Migration die bisherige Sprach-Regelung
   beizubehalten; die reguläre Frage kommt in Phase 5
   (ein Wechsel während der Migration vermischt
   Transformation und Übersetzung).
5. **Rolle** des Projekts: Standalone, Koordinator
   (mehrere Komponenten-Repos unter diesem Projekt)
   oder Komponent (SP-1 `index.md` §5). Bei
   **Koordinator**: ankündigen, dass du in Phase 5 den
   Contract-Index aktivierst. Bei **Komponent**
   zusätzlich die Übernahme-Art (selbstständig oder
   Auftrag). „Ein Repo oder zwei“ kommt für jede Rolle
   in Phase 5.
6. **Übernahme-Marke:** Die Migration legt als erste
   Marke `Uebernahme-JJJJ-MM-TT` an (Datum =
   Übernahme-Tag aus dem Herkunfts-Vermerk; Benennung
   „Übernahme des vorgefundenen Stands“). Erfrage die
   Beschreibung: die vorgefundene Version, falls es
   eine gibt (z.B. „ausgeliefert als 3.4“).
7. **Bestands-Ordner:** Liste die vorhandenen
   Root-Ordner (src/, data/ …); schlage vor, sie in
   Phase 3 als Freigaben zu buchen — je ein Eintrag in
   [[Entscheidungen]] nach dem Muster
   `### DEC-NNN — Freigabe: Bestands-Ordner src/`
   mit `zielmarke:` der Übernahme-Marke und
   Anlage-Datum. `tools/` ist Standard-Ordner
   (MasterPrompt §1.9) und braucht keine Freigabe.
   Die mitgebrachten Ordner des Prozesses (SP-1-
   Steckbrief §Mitgebrachte Ordner: `src/`, `tests/`,
   `ci/`, `deploy/`, `docs/`) buchst du in Phase 3
   ebenso als Freigaben, wie es der Init tut (Wiki.md
   §11.3 Schritt 2) — ein vorgefundener Ordner gleichen
   Namens ist Bestand unter dieser Freigabe. Ein
   vorgefundenes `docs/` ist handgeschrieben, die
   Freigabe deklariert `docs/` als aus dem Wiki
   abgeleitet: wie beides zusammengeht, fragst du den
   Anwender (Grundsätze).
8. **Kollisionsfrage** aus Phase 0, falls es
   Kollisionen gab, und für jede vorgefundene Datei,
   deren Name eine Datei trägt, die die Migration erst
   später anlegt (`TODO.md`, Instruktionsdatei,
   Standarddateien im Root wie `Tools.md` und
   `Offene Fragen.md`) — je Datei oder Ordner (a), (b)
   oder (c) mit Empfehlung und Namensvorschlag (Regel
   in den Grundsätzen).

**Antworten einarbeiten:** Kollisionen auflösen
(`git mv` nach dem bestätigten Schema, dann die
ausgelassenen Starter-Dateien und Varianten einspielen
— Skript erneut oder von Hand —, Links nach der Regel;
Links in vorgefundenen Dateien ziehst du nicht nach —
bricht einer, notierst du die Stelle für den Bericht
zur Gesamt-Annahme); bei einem anderen Prozess das
`wiki/` umbauen (Nr. 1); Rolle in
[[Aktivierter-Prozess]] (`Übernahme-Art` nur bei
Komponent), [[Commit-Sprache]] nachführen; die
**Übernahme-Marke** in [[Zielmarken]] anlegen
(Marken-Dreiklang, Zustand `in-progress`; keine Marke
trägt `current`, bis die erste abgeschlossen ist) —
**vor dem ersten neuen Eintrag**, weil jedes neue
Element sie in `zielmarke:` trägt. Dann **Commit**.

## Phase 2 — Arbeitsmodus

Ab hier arbeitest du **autonom bis zur Vorlage in
Phase 4** (Stufe 2 und Gesamt-Annahme brauchen den
Anwender) — keine Rückfragen außer bei echten
Blockaden (Berichten statt Blockieren). Ausgabe:
knappe Erledigt-Blöcke je Etappe. Es gelten das
Grundgesetz und die Grundsätze; außerdem:

- **Übernommenes ist Bestand, Neues trägt die
  Marke.** Elemente aus dem Vorgefundenen
  (Anforderungen, Fehler, Entscheidungen,
  Architektur, Deployments, Testfälle, Bedarfe,
  Szenarien, Contracts) tragen **kein** `zielmarke:`
  und **kein** Anlage-Datum — sie gelten ab ihrer
  Annahme für jede Marke; der Lint meldet das
  fehlende Feld als Hinweis, nachgetragen wird
  nichts. Das Status-Datum ist der Tag deiner
  Buchung. Was die Migration **neu** anlegt (die
  Freigaben der Bestands-Ordner, die Entscheidung
  „Migrations-Grundlagen als Gesamtpaket angenommen“,
  die Entscheidungen aus Phase 5), trägt `zielmarke:`
  mit der Übernahme-Marke und sein Anlage-Datum.
- **Keine erfundenen Daten:** niemals rekonstruierte
  Datumsangaben, Zahlen oder Fakten. Einschätzungen
  sind erlaubt (etwa die Status-Wahl: nach dem, was
  Code oder Vorgefundenes belegt; im Zweifel `offen`
  bzw. `angenommen` und der Fall nach
  `Migrations-Grundlagen` §Ungeklärt).
- **Nichts löschen:** Die alten Wissensbasis-Dateien
  bleiben unverändert liegen (eingefrorene
  Nachweis-Schicht). Aufräumen ist ein Vorhaben
  **nach** der Übernahme-Marke.

## Phase 3 — Transformation (Wissen → wiki/)

**Mapping** — jede Wissens-Klasse hat genau ein
Ziel. **Eintragsformat, ID-Präfix und Zählung (ab
001) liest du je Ziel aus der `## Meta` der
Fassade** — bei [[Anforderungen]] auch die
Sektionen; Bedarf und Szenario haben mit RP-1 die
Form der User-Story bzw. des Use Case ([[Bedarfe]],
[[Szenarien]] §Meta).

| Wissens-Klasse in deinen Dateien | Ziel |
|---|---|
| Anforderungen, Features, Soll-Verhalten | [[Anforderungen]] (REQ; Status nach Beleg) |
| Wünsche mit Begründung; beschriebene Abläufe | [[Bedarfe]] (NEED) bzw. [[Szenarien]] (SCEN); eine daraus folgende REQ mit `abgeleitet_von:` |
| Bekannte Fehler, offene Bugs, Workarounds | [[Fehlermeldungen]] (BUG; `offen`, solange nicht bestätigt) |
| Spezifikations-Texte, Funktions-Beschreibungen (Außensicht) | [[Funktionsbeschreibungen]] (FUNC — der Standard); nur was eine Bauanleitung für die Umsetzung ist → [[Spezifikationen]] (SPEC) |
| Getroffene Festlegungen/Beschlüsse | [[Entscheidungen]] (DEC; Technologie-Festlegungen mit `decision_type: technologie`; sinnvolle, nicht historische Reihenfolge) |
| Architektur-/Strukturwissen — Soll **und** dokumentierter Ist-Stand | [[Softwaresystemarchitektur]] (ARC-Elemente; Komponenten als Entitäten in §Komponenten; Ist als eigener Abschnitt kenntlich) |
| Schnittstellen zwischen Komponenten | nur bei Rolle Koordinator: CON im [[Contract-Index]]; sonst ARC bzw. SPEC |
| Installation und Betrieb je Umgebung | [[Deployments]] (DEPL) und [[Zielumgebungen]]; Betriebs-Anleitungen für Menschen bleiben als Nachweis liegen und werden selbsttragend neu in `docs/ops/` erzeugt |
| Test-/Prüf-Aufbau | [[Softwaresystemtest-Setup]] (lebend) |
| Testfälle | [[Testfaelle]] (TEST) |
| Alte Testergebnisse | kein Testbericht — Nachweise in [[Rechercheartefakte]]; der erste Testbericht entsteht im ersten Testdurchgang danach |
| Fachbegriffe, Definitionen | [[Glossar Review]] als **Vorschläge** — das Glossar ist Anwender-Terrain und wird nie direkt beschrieben; gesammelte Freigabe in Phase 5. Erklärungsbedürftige Sach-Konzepte zusätzlich als concept-Knoten via [[Konzepte]] |
| Betriebs-/Steuerungsregeln, Konventionen, Coding-Style | [[InterneMechanik]] (internal-rule-Knoten) |
| Entwickler-How-tos, Setup-/Build-Anleitungen | [[InterneMechanik]] (internal-pattern-Knoten, einer je Anleitung) |
| Werkzeug-/Skript-Doku (z.B. tools/) | `Tools.md` im Root (Kopiervorlage `wiki/templates/Tools-Vorlage.md`; dort auch `_template/tools/lint.sh` als Template-Werkzeug und der Ersatzweg aus Phase 1) |
| Changelog, Release-Notizen | [[Chronologie]] (verdichtet; Original bleibt als Nachweis liegen und wird verlinkt) |
| Externe Quellen, Literatur, Links | [[Rechercheartefakte]] (Nachweis-Register) bzw. §Bezüge des jeweiligen Fach-Knotens |
| Offene Fragen an den Anwender | `Offene Fragen.md` im Root (Standarddatei) |
| Offene Arbeiten (Aufgabenlisten, Roadmaps, TODO-Abschnitte) | je Punkt: geplant → [[Anforderungen]]; unverbindlich → [[Ideen]]; operativ-kurzfristig → `devstate_active.md` §Nächste Schritte — **und** die Datei wird aus der neuen `TODO.md` verlinkt (unten) |
| Beteiligte, Zuständigkeiten | [[Ansprechpartner]], [[Personen]], [[Organisationen]] |
| Zeitgeschehen, Meilensteine der Historie | [[Chronologie]] (grobe Epochen genügen) |
| Ideen, Vielleicht-später | [[Ideen]] (IDEA) |
| Nutzer-Rollen | [[Rollen]] (`rolle_art: verwendungsrolle`) |
| Projekt-Identität, Stolpersteine, Einstieg | [[Mission Statement]] + [[Facts]] (dabei deren Bootstrap-Dateien aus `_template/referenzprozesse/base/bootstrap/` abarbeiten — die Quelle ist Nur-Lese, nichts löschen) |
| **Nicht mehr sicher Rekonstruierbares — und alles, was in keine Zeile passt** (nie verwerfen!) | `wiki/Migrations-Grundlagen.md` — die Datei gibt es **nicht als Vorlage**; du legst sie bei erstem Bedarf im Projekt-wiki an: Frontmatter `type: decision`, `id: DEC-NNN` (die nächste freie Nummer, reserviert für die Gesamt-Annahme), `status: angenommen` (das Register kennt kein `offen`), `status_date:` (Anlage-Datum; mit der Gesamt-Annahme deren Tag), `datum:` (Anlage), `zielmarke:` (Übernahme-Marke) — bis zur Register-Zeile meldet der Lint den Hinweis `REG-OHNE-EINTRAG`, das ist erwartet; Sektionen `## Festlegungen` / `## Ungeklärt` / `## Herkunft` (dort auch die Umbenennungen aus der Kollisionsfrage) / `## Vermerke`. Die Register-Zeile `### DEC-NNN — Migrations-Grundlagen als Gesamtpaket angenommen` buchst du mit der Gesamt-Annahme nach Phase 4; Einzelpunkte können später zu eigenen DECs befördert werden |

**Vorgehen:** Pro Wissensbasis-Datei ein Durchgang
(bei vielen Dateien: Subagenten, einer je Datei oder
Themen-Bündel). Empfohlener Subagenten-Auftrag —
Platzhalter ersetzen und **die komplette
Mapping-Tabelle sowie die Bestands-Regel aus Phase 2
wörtlich an den Auftrag anhängen** (der Subagent
liest MIGRATION.md nicht):

> Du bist Migrations-Subagent im Projekt `<Projekt>`.
> Lies NUR die Datei(en) `<Wissensbasis-Dateien>` und
> die Ziel-Fassaden, die du befüllst. Ordne jeden
> Wissens-Baustein exakt einer Zeile der
> angehängten Mapping-Tabelle zu und trage ihn dort
> ein (Eintragsformat, ID-Präfix und Zählung aus
> der `## Meta` der jeweiligen Fassade). Regeln:
> Quelle je Eintrag als Verweis auf die
> Herkunfts-Datei nennen; übernommene Elemente ohne
> `zielmarke:` und ohne Anlage-Datum (Bestand);
> keine erfundenen Daten; nichts doppelt anlegen —
> vor jedem neuen Eintrag das Ziel-Register auf einen
> bestehenden prüfen (Kollisions-Grep); Unsicheres
> nach `wiki/Migrations-Grundlagen.md` §Ungeklärt.
> KEIN Commit. Rückgabe: Liste der angelegten
> Einträge + Ungeklärtes.

Nach jedem Durchgang: Register-Stände nachführen,
**Commit** (Präfix je Fassade, [[Commit-Prozedur]]).
Am Ende der Phase:

- **Neue `TODO.md`** anlegen (Standarddatei, offene
  Punkte des Anwenders) — immer, auch wenn das
  Projekt keine Aufgabenliste hatte; eine vorgefundene
  `TODO.md` ist nach der Kollisionsfrage schon
  umbenannt. Sie verlinkt
  jede vorgefundene Datei mit offenen Arbeiten
  (Nr. 2 des Fragen-Blocks), je mit einer kurzen
  Angabe, was die Datei enthält und wohin ihre Punkte
  eingeordnet wurden; eine umbenannte
  `TODO-vorgefunden.md` steht darunter.
- Ordner-Freigaben als DEC buchen — Bestands-Ordner
  und mitgebrachte Ordner (Nr. 7) —,
  `Tools.md` um den Ersatzweg ergänzen,
  `devstate_active.md` aktualisieren,
  Abschluss-Commit.

## Phase 4 — Absicherungs-Review (zweistufig)

1. **Stufe 1 — maschinelle Vorprüfung:** Beauftrage
   die in Phase 1 bestätigten **zwei Prüfer** als
   frische Agenten, unabhängig voneinander:
   > Prüfe die Wissens-Migration im Projekt
   > `<Projekt>`: (1) Vollständigkeit — stichprobe
   > jede Wissensbasis-Datei gegen das wiki/: fehlt
   > Substanz? (2) Treue — verfälschen Einträge ihre
   > Quelle? (3) Mapping-Disziplin — alles am
   > richtigen Ort nach `_template/migration/MIGRATION.md`
   > Phase 3? (4) Register-Hygiene — Formate,
   > Status-Werte, Quell-Verweise, Bestand ohne
   > `zielmarke:` und Anlage-Datum, Neues mit beidem,
   > keine erfundenen Daten? (5) Herkunft und
   > Festlegungen — `Template-Stand` mit Übernahme-Tag,
   > Übernahme-Marke `in-progress`, Ordner-Freigaben,
   > neue `TODO.md` mit Links, Kollisionen nach Schema
   > umbenannt, unverändert und verlinkt? Dazu
   > `sh _template/tools/lint.sh` aus dem
   > Projekt-Root: keine FEHLER. Schreibe genau einen
   > Bericht mit Ampel (grün/gelb/rot) und
   > nummerierten Befunden samt Fundstelle. Kein
   > Commit.
2. Jeden Bericht **zuerst ablegen** (REP-Nummer,
   [[Agent-Berichte]]), dann zusammenfassen.
3. **Beide grün → weiter. Sonst: Befunde
   nacharbeiten, Commit, Kurz-Re-Check beider Prüfer
   — höchstens drei Runden.** Danach endet die
   Vorprüfung mit einem **Konvergenz-Bericht** an den
   Anwender (`convergence-report`, [[Agent-Berichte]]:
   wiederkehrende Befunde, Ursache,
   Handlungsoptionen) statt mit Grün; ein Befund, der
   nach Nacharbeit in gleicher Form wiederkehrt, geht
   sofort an den Anwender.
4. **Stufe 2 — der Anwender, wenn er Prüfer ist:**
   Beim Ersatzweg (b) aus Phase 1 prüft er jetzt das
   Ergebnis der Vorprüfung; sein Urteil hält ein
   eigener `review-report` mit `modell: anwender`
   fest. Beim Ein-Modell-Weg (a) endet das Review mit
   Stufe 1.
5. **Gesamt-Annahme:** Lege dem Anwender den Bericht
   über die unsicheren Stellen vor — Ungeklärtes aus
   `Migrations-Grundlagen`, konservativ gewählte
   Status, durch Umbenennung gebrochene Links in
   vorgefundenen Dateien. Der Anwender bestätigt die
   Rekonstruktion als Ganzes; damit buchst du die
   Register-Zeile `### DEC-NNN — Migrations-Grundlagen
   als Gesamtpaket angenommen` (Status `angenommen`,
   `zielmarke:` Übernahme-Marke, Anlage-Datum; die
   Datei aus Phase 3 ist ihr Detail-Knoten, ihr
   `status_date` wird der Tag der Annahme).
   Sammel-Register dürfen `offen` bleiben.
6. Abschluss-Commit der Phase.

## Phase 5 — Init-Restfragen und Abschluss

Jetzt — und erst jetzt — die verbliebenen
Init-Schritte; Vorfestgelegtes wird **nicht** erneut
gefragt. Entscheidungen aus diesen Fragen werden wie
alles Neue gebucht: `zielmarke:` der Übernahme-Marke,
Anlage-Datum.

1. **Glossar-Freigabe:** die in [[Glossar Review]]
   gesammelten Vorschläge gebündelt vorlegen;
   Freigegebenes ins [[Glossar]] übernehmen.
2. **Sprach-Frage** regulär stellen (A Projektsprache
   / B Sprache folgt Artefakt / C Englisch) und in
   [[Commit-Sprache]] buchen.
3. **WorkspaceManager verfügbar?** — beide Rollen
   ([[Init-Choreografie]] §Baustein
   WorkspaceManager-Frage); Antwort in die
   Betriebs-Konfiguration des
   [[WorkspaceManager-Kontrakt]] (ersetzt die
   Vorbelegung).
4. **Ein Repo oder zwei?** ([[Init-Choreografie]]
   §Baustein Ein-/Zwei-Repo-Frage;
   [[Two-Repo-Submodul-Muster]]) — Entscheid jetzt,
   Umsetzung als erstes Vorhaben nach der
   Übernahme-Marke.
5. **Instruktionsdatei** erzeugen (deine native
   Datei, z.B. `CLAUDE.md`) nach MasterPrompt §8.3 /
   [[Instruktionsdatei-Pflege]], einschließlich des
   Grundgesetzes oben; eine vorgefundene
   Instruktionsdatei ist ein Kollisionsfall aus
   Phase 1 — die neue verlinkt die umbenannte.
6. Bei **Koordinator** aus Phase 1: Contract-Index
   aktivieren — Skelett und Bootstrap aus
   `_template/referenzprozesse/SP-1-Standardprozess/`
   (Quelle Nur-Lese), [[Fassaden]] nachführen.
7. **Kein Marken-Wechsel:** Die Übernahme-Marke
   bleibt `in-progress`, keine Marke trägt `current`;
   in der Migration entstehen keine Stände. Erste
   Aufgabe danach: die Pflicht-Stände der Marke
   ableiten und nach [[Kettenpruefung]] zur Freigabe
   vorlegen; der Abschluss läuft regulär über
   Abschluss-Stand und Wechsel-Prozedur
   ([[Zielmarken]] §Meta).
8. **Abschluss-Buchung:** Chronologie-Eintrag
   „Migration abgeschlossen (Template-Stand 2.0 seit
   <Übernahme-Tag>, Quelle <Commit/Tag>, Modus A/B)“
   — Werte wie im Herkunfts-Vermerk. Eine
   vorgefundene README bleibt; schlage dem Anwender
   vor, dort die Einstiege zu ergänzen
   (Instruktionsdatei, `wiki/`, Erklärung in
   `_template/docs/Einfuehrung.md`, Update-Weg in
   `_template/README.md` §Template aktualisieren).
9. **Lint:** `sh _template/tools/lint.sh` aus dem
   Projekt-Root ohne FEHLER (Stichtag aus dem
   Herkunfts-Vermerk; Hinweise zu Bestand ohne Feld
   sind erwartet).
10. Abschluss-Commit. `_template/` bleibt dauerhaft
    liegen (nicht löschen). Ab hier gilt der normale
    Betrieb nach MasterPrompt (§5.3); diese Anleitung
    liegt nicht in deinem Projekt, kein Selbst-Abbau.
