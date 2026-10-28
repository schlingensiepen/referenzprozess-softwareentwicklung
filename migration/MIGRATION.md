# MIGRATION — Bestehendes Projekt in das wiki/ dieses Starters überführen

**Du liest dieses Dokument, weil dein Projekt sein
Wissen bisher in verstreuten Dateien sammelt und
jetzt auf diese Vorlage migriert.** Diese Anleitung
ist dein vollständiger Auftrag — du musst zu Beginn
nichts anderes lesen. Die Regel-Dokumente der Vorlage
(MasterPrompt.md, Wiki.md …) ziehst du erst heran,
wenn eine Phase dich dorthin schickt: **Kontext
schonen geht vor Vollständigkeit.**

**Start ohne lokale Kopie:** Typischerweise kommst
du über den Start-Satz „Migriere das Projekt in
diesem Verzeichnis nach der Anleitung unter
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung.“
hierher; das aktuelle Verzeichnis ist der
Projektordner. Du darfst dieses Dokument **direkt
von der Repo-URL lesen, bevor irgendetwas
eingebunden ist** — das ist der vorgesehene Weg.
Solange `_template/` fehlt, liest du auch jede
Datei, auf die dieses Dokument verweist, von dort:
Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`
(Wiki-Verweise `[[Name]]` meinen `wiki/Name.md`).
Ab der Einbindung (Phase 0) liest du aus
`_template/`.

**Zwei Warnungen vorab:**

- **Arbeitet das Projekt schon mit dieser Vorlage
  oder mit der allgemeinen Vorlage** — erkennbar an
  `wiki/Aktivierter-Prozess.md` mit einem Abschnitt
  `## Herkunft` oder einem Feld „Template-Herkunft“ —,
  ist das keine Migration, sondern ein Upgrade: Sag
  es dem Anwender und verweise auf den
  Upgrade-Einzeiler der README.
- **Diese Migration führt in den Prozess für
  Softwareentwicklung** (RP-1 auf SP-1). Der Starter
  weiß, dass es andere Referenzprozesse gibt — das
  Regelwerk mit allen Prozessen liegt unter
  `_template/referenzprozesse/`, eine abschließende
  Liste gibt es nicht. Findest du im Vorgefundenen
  keinen Software-Bezug (kein Code, keine
  Software-Anforderungen, keine Architektur) oder bist
  du nicht sicher, fragst du im Fragen-Block (Phase 1
  Nr. 1); besteht der Anwender auf dem
  Software-Prozess, migrierst du damit.

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
  `Migrations-Grundlagen` — nie verwerfen.
- **Im Zweifel fragst du den Anwender.** Gesammelt im
  Fragen-Block (Phase 1); danach arbeitest du autonom
  und berichtest bei echten Blockaden, statt zu
  blockieren. Status-Werte im Zweifel konservativ,
  Ungeklärtes nach `Migrations-Grundlagen` §Ungeklärt.

Feste Regeln stehen nur dort, wo eine Maschine liest
(Lint, Skripte: die Zeile `Template-Stand`, die
Übernahme-Marke, `zielmarke:` und Anlage-Datum, das
Namensschema `-vorgefunden`) oder wo der Anwender
bewusst vom vernünftigen Standard abweicht (neue
`TODO.md` immer, Kollisionsfrage je Datei,
Prozess-Nachfrage). Alles andere sind Beispiele unter
den Grundsätzen.

**Keine Ausführung ohne Zustimmung:** `git init`,
Einbindung und Kopier-Skript in Phase 0 sind
Angebote an den Anwender — du nennst, was du tun
willst (bei Kommandos: das exakte Kommando), und
handelst erst nach seiner Antwort. Ausgenommen sind
genau zwei Commits, die du in einem Satz ankündigst
und ausführst: der Sicherungs-Commit in einem
**bestehenden** Repo (Phase 0 Schritt 1) — er
verändert keine Bestands-Datei — und der
Aufnahme-Commit (Phase 0 Schritt 3), der nur
aufnimmt, was der Anwender in Schritt 2 und 3
freigegeben hat. Für beide gelten dieselben
Schutzregeln aus Schritt 1. `git init` gehört nicht
zu dieser Ausnahme (MasterPrompt §5.3 A1: keine
automatische `git init` in einem gefüllten Ordner).

**Vorrang:** Für den Starter-Fall ersetzt Phase 0
Schritt 2 die allgemeine Bootstrap-Init-Frage aus
MasterPrompt §5.3 (Turn α/β); die Modus-Beschreibung
in MasterPrompt §1 („Anbindungs-Modi“) gilt
unverändert.

**Grundgesetz dieser Migration (gilt ab sofort,
dauerhaft):** Das `wiki/` ist die Quelle der
Wahrheit. Alles Besprochene, Entschiedene und
Erarbeitete muss dort abgelegt sein — was nicht im
`wiki/` steht, ist nicht festgelegt. Die laufende
Unterhaltung ist Arbeitsspeicher, nicht Quelle.
Daraus folgen zwei Pflichten: **Lese-Pflicht** (vor
jeder Behauptung über eine Festlegung und vor jeder
Frage an den Anwender im `wiki/` nachschlagen;
Festlegungs-Behauptungen nennen ihre Register-Nummer)
und **Pflege-Pflicht** (Klärungen, Berichte und
Stände im selben Zug ablegen — Berichte **vor** der
Chat-Zusammenfassung). Diese Regel übernimmst du in
Phase 5 in deine Instruktionsdatei.

**Quelle ist Nur-Lese:** Quelle ist der Starter —
das Repo, aus dem du dieses Dokument liest, nach
Phase 0 unter `_template/` eingebunden — als
Submodul (Modus B) oder als Einmal-Kopie, die mit
dem Projekt committet wird (Modus A, MasterPrompt
§1). Er wird **nie beschrieben**, nie gelöscht und
bleibt dauerhaft nur-lese verfügbar — als
Nachschlage- und Upgrade-Quelle, bei Modus A
zugleich als Ur-Versions-Archiv. Die
Prozess-Vorlagen `referenzprozesse/`, der Lint-Kern
`tools/` und die Anleitungen liegen **nur** in
`_template/` und werden nicht ins Projekt kopiert.
Ab der Kopie arbeitest du ausschließlich in deinem
Projektverzeichnis.

**Werkzeug-Adaption:** Alle hier beschriebenen
Mechanismen (Subagenten, Reviews, Commits) sind
werkzeug-agnostisch — adaptiere sie auf deine
lokalen Mittel; gleiches Verhalten, eigene Werkzeuge.
Hast du keine Subagenten, arbeite die Aufträge
sequenziell selbst ab. Für die Dauer der Migration
übernimmst du Konvertierung und Outgoing-Erzeugung
selbst und startest keinen WorkspaceManager (siehe
[[WorkspaceManager-Kontrakt]] §Betriebs-Konfiguration;
die reguläre Frage kommt in Phase 5).

---

## Was du vorfindest

Dein `wiki/` ist **vorbereitet**: es kommt als Kopie
des Starter-`wiki/` (Frisch-Vorlage) **plus
Eintausch der Migrations-Varianten aus
`migration/`**, ausgeführt durch
`setup/init-migration.sh` oder von Hand nach der
Kopier-Liste (Phase 0 — den Weg wählt der Anwender).
Alle Fassaden des Software-Zuschnitts liegen bereit,
[[Aktivierter-Prozess]] bucht die Vorfestlegungen,
der [[Katalog]] trägt die mitgebrachten Einträge.
**Du baust kein wiki — du füllst eines.** Offen sind
nur: die Bootstraps von `Mission Statement` und
`Facts` (Projekt-Identität — füllst du in Phase 3
aus deinem Wissen), die Fragen aus Phase 1 und die
Restfragen in Phase 5. Bootstraps **deaktivierter**
Fassaden bleiben liegen — sie werden erst bei einer
Reaktivierung per Zuruf abgearbeitet
([[Geschaeftsbeziehungen]] empfiehlt der Prozess bei
Produktentwicklung; [[Fehlermeldungen]] setzt
[[Anforderungen]] voraus).

Die eingetauschten **Varianten** — jede ist das
Frisch-Pendant plus genau einem Unterschied, hier der
Grund:

- `devstate_active.md` — die nächsten Schritte zeigen
  auf diese Anleitung; die Zielmarke ist bis zur
  Übernahme-Marke offen.
- `wiki/Zielmarken.md` — keine Marke, wie im
  Frisch-Pendant; die Bearbeitungsstand-Zeile nennt
  als erste Marke die Übernahme-Marke, die du in
  Phase 1 anlegst, statt der Marke des Inits.
- `wiki/Aktivierter-Prozess.md` — die Zeile
  `Template-Stand` schreibt die Migration mit dem
  Übernahme-Tag; die Rolle entscheidet der Anwender
  im Fragen-Block der Migration.
- `wiki/Commit-Sprache.md` — Vorschlag, die
  bisherige Sprach-Regelung des Projekts für die
  Dauer der Migration beizubehalten; reguläre Frage
  in Phase 5.
- `wiki/WorkspaceManager-Kontrakt.md` —
  Betriebs-Konfiguration für die Dauer der Migration:
  nicht vorhanden, du übernimmst selbst; reguläre
  Frage in Phase 5.
- `wiki/InterneMechanik.md` — die Vorbelegungs-Sektion
  verweist auf diese Anleitung statt auf `INIT.md`.

---

## Phase 0 — Sicherung und Starter-Aufnahme (sofort, vor allem anderen)

Die Reihenfolge ist fest: **(a) Sicherungs-Commit
des Alt-Zustands → (b) Einbindung (mit Modus-Frage)
→ (c) Kopie (Skript oder von Hand, als Angebot)
→ (d) Aufnahme-Commit.** Einbindung und Kopie liegen
beide zwischen den zwei Commits — so trennt die
Historie sauber „vorher“ von „Starter da“.

1. **Sicherung zuerst** — den unveränderten
   Alt-Zustand committen, **vor** der Einbindung:
   - **Kein git-Repo** (`.git` fehlt): biete
     `git init` an und warte auf Zustimmung — keine
     automatische `git init` in einem gefüllten
     Ordner (MasterPrompt §5.3 A1). Lehnt der
     Anwender ab, gilt dort der Fail-Safe: die
     Migration ruht, bis ein Repo da ist.
   - **git-Identität:** sind `git config user.name`
     und `git config user.email` leer, frage den
     Anwender danach — setze sie nicht selbst und
     erfinde keine Werte.
   - **Vorab prüfen** mit `git status --porcelain`:
     Ist nichts zu committen (sauberer Stand), gilt
     der aktuelle `HEAD` als Sicherung — kein leerer
     Commit. **Ignorierte Dateien**
     (`.gitignore`) bleiben ignoriert — nie
     `git add -f`. **Offensichtlich sensible
     Dateien** unter den ungetrackten (z.B. `.env`,
     `*.pem`, `*.key`, `id_rsa*`, `*.p12`,
     `credentials*`, Dateien mit `secret`/`token` im
     Namen) und sehr große Dateien (> 50 MB) nimmst
     du **nicht** ungeprüft auf: du lässt sie aus
     und nennst sie dem Anwender mit dem Hinweis,
     sie selbst zu committen oder in `.gitignore`
     einzutragen. Bereits gestagte Änderungen
     gehören zum Alt-Zustand und kommen mit.
   - **Ankündigen und ausführen** (ein Satz, keine
     Rückfrage), exaktes Kommando:
     `git add -A && git commit -m "Sicherung vor Wissens-Migration"`
     — bei ausgelassenen Dateien je Datei ein
     Ausschluss: `git add -A -- . ':!<pfad>'`, dann
     derselbe `git commit`. Hat der Anwender eben
     `git init` zugestimmt, gilt das auch als
     Zustimmung zu diesem ersten Commit — keine
     zweite Rückfrage.
   - **Wenn der Commit nicht glatt durchläuft —
     anhalten, nicht umgehen:** laufender Merge
     oder Rebase (`.git/MERGE_HEAD` bzw.
     `.git/rebase-*`), ein abweisender Hook oder
     verlangte Signatur, eingebettete fremde Repos
     (Unterordner mit eigenem `.git`, die `git add`
     als Submodul-Platzhalter aufnehmen würde): du
     committest nicht, beschreibst dem Anwender die
     Lage und wartest auf seine Entscheidung. Nie
     `--no-verify`, nie Signatur abschalten, nie
     fremde `.git`-Ordner löschen.
2. **Einbindung (Einbindungs-Frage):** **Ist die
   Einbindung schon erfolgt?** Ja, wenn `_template/`
   existiert und `_template/migration/MIGRATION.md`
   sowie `_template/MasterPrompt.md` enthält — dann
   Modus feststellen: **Modus B**, wenn
   `.gitmodules` einen Eintrag für `_template` trägt
   (`git submodule status _template`); **Modus A**,
   wenn `_template/` ein gewöhnlicher Ordner ohne
   eigenes `.git` ist; weiter mit Schritt 3.
   Sonderfall: `_template/` leer (Submodul nicht
   initialisiert) → `git submodule update --init`
   anbieten. Wenn nein, stelle dem Anwender jetzt
   die **Einbindungs-Frage** mit diesem Wortlaut
   (Alltagssprache; Fachwörter nur in Klammern):

   > Wie soll die Vorlage in dein Projekt kommen?
   > Sie landet in beiden Fällen im Ordner
   > `_template/` und wird dort nie verändert.
   >
   > - **B — verknüpfte Vorlage, die du später
   >   gezielt aktualisieren kannst** (empfohlen;
   >   technisch ein git-Submodul, das auf einen
   >   festen Stand „gepinnt“ ist). Braucht beim
   >   Einrichten Internet-Zugriff auf GitHub; wer
   >   dein Projekt später klont, holt die Vorlage
   >   mit `git clone --recursive` mit.
   > - **A — eingefrorene Kopie der Vorlage, die
   >   dauerhaft im Projekt bleibt, damit du immer
   >   siehst, womit du gestartet bist** (technisch
   >   eine Einmal-Kopie ohne Git-Verbindung, die
   >   mit deinem Projekt gespeichert wird, ca.
   >   3 MB). Neuere Vorlagen-Stände übernimmst du
   >   später durch bewussten Austausch der Kopie.

   **Erst nach der Antwort einbinden** — nach dem
   Sicherungs-Commit, vor dem Aufnahme-Commit; das
   exakte Kommando nennst du vorher:
   - **Modus B:**
     `git submodule add https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template`.
     Schlägt das fehl (kein Netz, URL nicht
     erreichbar): melden; der Anwender entscheidet —
     erneut versuchen, andere URL, Modus A oder
     Abbruch.
   - **Modus A:**
     `git clone --depth 1 https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template`,
     dann die Herkunft ablesen
     (`git -C _template rev-parse HEAD` und
     `git -C _template describe --tags --always`),
     danach `rm -rf _template/.git`. Die Kopie ist
     ab jetzt gewöhnlicher Projekt-Inhalt:
     Nur-Lese, wird im Aufnahme-Commit mit dem
     Projekt committet und nie gelöscht — sie ist
     das Ur-Versions-Archiv, gegen das der Anwender
     jederzeit diffen kann.

   **Herkunft vermerken (beide Modi):** Nach der
   Kopie (Schritt 3), vor dem Aufnahme-Commit,
   schreibst du in den Abschnitt `## Herkunft` von
   [[Aktivierter-Prozess]] (Format:
   [[Init-Choreografie]] §Phase A0
   „Herkunfts-Vermerk“): `Template-Stand: 2.0 seit
   JJJJ-MM-TT` mit dem **Übernahme-Tag** — dem Tag
   des Aufnahme-Commits; das Datum ist der Stichtag,
   den der Lint liest, und zugleich das Datum in der
   Bezeichnung der Übernahme-Marke (Phase 1) —,
   `Quelle` (Repo-URL und Commit/Tag; Modus A der
   abgelesene Stand, Modus B der Submodul-Pin aus
   `git submodule status _template`) und
   `Anbindungs-Modus: A` bzw. `B`. Keine Zeile
   `Vorher` — die schreibt nur ein Upgrade. Liegt
   `wiki/Aktivierter-Prozess.md` wegen einer
   Kollision noch nicht vor, holst du den Vermerk
   nach der Kollisionsfrage (Phase 1) nach.
3. **Projektdateien anlegen (Angebot):** **Ist die
   Kopie schon erfolgt?** Ein eigenes `wiki/` oder
   `devstate_active.md` im Bestand beweist nichts —
   maßgeblich ist der Vergleich mit `_template/`
   (z.B. `cmp -s <datei> <quelle>`): erfolgt, wenn
   `MasterPrompt.md` und `wiki/Init-Choreografie.md`
   inhaltsgleich zu `_template/MasterPrompt.md` bzw.
   `_template/wiki/Init-Choreografie.md` sind **und**
   `wiki/Aktivierter-Prozess.md` inhaltsgleich zu
   `_template/migration/wiki/Aktivierter-Prozess.md`
   ist (bzw. seinen Herkunfts-Vermerk schon trägt).
   Teilweise erfolgt (abgebrochene Kopie) → Angebot
   wie unten; das Skript ergänzt nur Fehlendes und
   listet Vorhandenes — Dateien, deren Inhalt mit
   der Starter-Datei identisch ist, sind keine
   Kollision und entfallen aus der Liste. Steht
   `devstate_active.md` schon auf einem
   Migrations-Stand jenseits von Phase 0, ist
   Phase 0 erledigt.

   Fehlt die Kopie, **biete dem Anwender die zwei
   Wege an** und kopiere erst nach seiner
   Zustimmung — **(a)** das Kopier-Skript ausführen
   (empfohlen: deterministisch, überschreibt nichts,
   listet Kollisionen); das exakte Kommando, aus dem
   Projektordner:
   `sh _template/setup/init-migration.sh` — oder
   **(b)** du kopierst selbst aus `_template/` nach
   der **Kopier-Liste** unten — sie ist der führende
   Ort, das Skript ihre Implementierung; (b) ist
   zugleich der Fallback, wenn das Skript nicht
   lauffähig ist (keine sh, Rechte, exotische
   Umgebung).

   **Kollisionen** (gleichnamige vorgefundene Dateien
   oder Ordner, typisch `wiki/`, `devstate_active.md`,
   `TODO.md`, eine Instruktionsdatei): Skript wie
   Handkopie überschreiben nichts, lassen die
   kollidierende Starter-Datei aus und listen sie —
   auch ein Varianten-Ziel, das kollidiert, wird nicht
   eingetauscht. Ein vorgefundenes `wiki/`, das nicht
   aus diesem Starter stammt (kein inhaltsgleiches
   `wiki/Init-Choreografie.md`), ist **eine** Kollision
   auf Ordner-Ebene: nichts wird hineinkopiert, keine
   Variante dorthin getauscht. Die Liste ist der
   Eingang der Kollisionsfrage im Fragen-Block (Phase 1
   Nr. 8); erst nach der Antwort benennst du um
   (bestätigter Name) und spielst die ausgelassenen
   Starter-Dateien samt Varianten ein — Skript erneut
   ausführen (es ergänzt nur Fehlendes und tauscht die
   Varianten) oder von Hand. `.gitignore` ist kein
   Kollisionsfall — sie wird nur kopiert, wenn keine
   vorhanden ist.

   Danach der **Aufnahme-Commit** — umfasst
   Einbindung (bei Modus A die komplette Kopie unter
   `_template/`), Kopie und Herkunfts-Vermerk;
   angekündigt, nicht erfragt:
   `git add -A && git commit -m "Starter aufgenommen"`.
   Es gelten die Schutzregeln aus Schritt 1:
   ignorierte Dateien nie mit `-f`, sensible oder
   sehr große Dateien auslassen und nennen,
   git-Identität erfragen statt setzen, bei
   abweisendem Hook, verlangter Signatur oder
   laufendem Merge anhalten und die Lage
   beschreiben — nie `--no-verify`.
   **Sind Einbindung und Kopie schon erfolgt** (z.B.
   vom Anwender von Hand): prüfen, ob der
   Alt-Zustand noch ungesichert ist; wenn ja, alles
   in einem Commit sichern (Regeln aus Schritt 1)
   und die fehlende Trennung als Vermerk in die
   Commit-Message aufnehmen.

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

   **Nie kopiert werden:** `referenzprozesse/`
   (bleibt als Nur-Lese-Vorlage in
   `_template/referenzprozesse/` — Steckbriefe,
   Skelette, `bootstrap/`-Ordner), `tools/`
   (Template-Werkzeug: du rufst
   `_template/tools/lint.sh` auf), `upgrade/`,
   `README.md`, `INIT.md`, `migration/` selbst,
   `docs/`, `setup/`, `LICENSE`, `.git/` — alles in
   `_template/` lesbar; ein etwaiges Bestands-`docs/`
   bleibt unberührt. Diese MIGRATION.md wird
   ebenfalls **nicht kopiert** — du liest sie aus
   `_template/migration/`.

4. Commit-Texte hier und im Folgenden sind
   **sinngemäß in der bisherigen Projektsprache**
   zulässig — die Sprach-Frage kommt erst in
   Phase 1/5.
5. Ab jetzt gilt Commit-Disziplin: jede
   abgeschlossene Phase endet mit einem Commit.

## Phase 1 — Fragen-Block (gesammelt, ein einziger Turn)

Zeige dem Anwender zuerst die Übersicht der Punkte
unten (je eine Zeile) und biete den Briefing-Modus an
(MasterPrompt §5.1.0): wählt er ihn, stellst du die
Fragen einzeln, sonst **alle** in einem Block
(Fahrplan-Stil: nummeriert, je Punkt dein Vorschlag
zuerst). Frage nichts einzeln nach, was hier steht —
und nichts, was schon vorfestgelegt ist (siehe
[[Aktivierter-Prozess]]).

1. **Prozess-Nachfrage** — nur ohne Software-Bezug
   oder bei Zweifel (Warnung oben): „Bist du sicher,
   dass das der richtige Prozess ist? Er passt nicht
   zum Vorgefundenen — willst du mir einen anderen
   nennen?“ Keine Liste. Nennt der Anwender einen
   anderen Prozess, geht die Transformation in die
   Struktur dieses Prozesses; der Starter bleibt
   `_template/`:
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
   Dateien/Ordner auf, die du als bisherige
   Wissensträger identifizierst (lies dazu nur
   Datei-Namen und Kopfzeilen — bei Dateien ohne
   Überschrift ersatzweise die ersten zwei, drei
   Zeilen —, nicht die Volltexte!), und kennzeichne
   darunter die Dateien mit **offenen Arbeiten**
   (Aufgabenlisten, Roadmaps, TODO-Abschnitte) — sie
   verlinkt die neue `TODO.md` (Phase 3). Der
   Anwender streicht/ergänzt.
3. **Prüf-Modelle:** Nenne, welches Modell du selbst
   bist, und schlage für die maschinelle Vorprüfung
   (Phase 4) **zwei Prüfer verschiedener Modelle**
   vor, möglichst beide ungleich deinem eigenen, das
   zweite über ein Werkzeug (Peer-Agent, externes
   Modell). Gibt es nur ein Modell: frische Agenten
   desselben Modells in neuem Kontext — weise
   ausdrücklich darauf hin, dass das die schwächere
   Absicherung ist. Dazu die Wahl des **Ersatzwegs**
   für alle späteren Prüfungen ohne zweites Modell:
   (a) Ein-Modell-Weg oder (b) Anwender als Prüfer —
   bei (b) prüft der Anwender in Phase 4 nach der
   Vorprüfung selbst. Die Wahl trägst du in
   `Tools.md` §Prüf-Werkzeuge ein, sobald die Datei
   steht (Phase 3). Der Anwender bestätigt.
4. **Sprache:** Schlage vor, für die Dauer der
   Migration die bisherige Sprach-Regelung des
   Projekts beizubehalten; die reguläre Sprach-Frage
   wird in Phase 5 gestellt. (Sprach-Wechsel während
   der Migration vermischt Transformation und
   Übersetzung — das Review könnte Umzugs- und
   Übersetzungsfehler nicht mehr trennen.)
5. **Rolle** des Projekts im Prozess: Standalone,
   Koordinator (mehrere Komponenten-Repos unter
   diesem Projekt) oder Komponent (Rollen: SP-1
   `index.md` §5). Bei **Koordinator**: kündige an,
   dass du in Phase 5 den Contract-Index aus
   `_template/referenzprozesse/SP-1-Standardprozess/`
   aktivierst. Die Frage „ein Repo oder zwei“ kommt
   für jede Rolle in Phase 5.
6. **Übernahme-Marke:** Die Migration legt als erste
   Marke des Projekts `Uebernahme-JJJJ-MM-TT` an
   (Datum = Übernahme-Tag aus dem Herkunfts-Vermerk;
   Benennung „Übernahme des vorgefundenen Stands“).
   Erfrage die Beschreibung: die vorgefundene
   Version, falls es eine gibt (z.B. „ausgeliefert
   als 3.4“).
7. **Bestands-Ordner:** Liste deine vorhandenen
   Root-Ordner (src/, data/ …); schlage vor, sie in
   Phase 3 als Freigaben zu buchen — je ein
   Eintrag in [[Entscheidungen]] nach dem Muster
   `### DEC-NNN — Freigabe: Bestands-Ordner src/`
   mit `zielmarke:` der Übernahme-Marke und
   Anlage-Datum. `tools/` ist Standard-Ordner
   (MasterPrompt §1.9) und braucht keine Freigabe.
8. **Kollisionsfrage** aus Phase 0, falls es
   Kollisionen gab — je Datei oder Ordner die drei
   Möglichkeiten, mit deiner Empfehlung und Grund;
   der Anwender darf gesammelt antworten („alles wie
   empfohlen“, „überall (c)“):
   - **(a) umbenennen und nur verlinken:** die
     vorgefundene Datei wird umbenannt und bleibt
     unverändert liegen, ihr Inhalt wird nicht
     übertragen; die Starter-Datei wird angelegt und
     verlinkt sie.
   - **(b) komplett integrieren:** ihr Inhalt geht
     vollständig an seinen Ort (Mapping Phase 3 bzw.
     in die Starter-Datei); eine alte Fassung bleibt
     nicht als eigene Datei. **Gelöscht wird nur auf
     ausdrücklichen Wunsch** — nennt die Antwort das
     Löschen nicht, fragst du nach und lässt die
     Datei bis dahin umbenannt liegen; deine
     Empfehlung lautet nie von sich aus auf Löschen.
   - **(c) integrieren, alte Fassung behalten:**
     Inhalt wie (b), die vorgefundene Datei
     zusätzlich wie (a) umbenannt behalten und
     verlinkt.

   **Namensschema** (du schlägst vor, der Anwender
   bestätigt oder nennt einen anderen Namen):
   `<Name>-vorgefunden.<Endung>` im selben Ordner,
   für einen Ordner `<Name>-vorgefunden/` — z.B.
   `TODO-vorgefunden.md`, `CLAUDE-vorgefunden.md`,
   `wiki-vorgefunden/`. Für eine vorgefundene
   `TODO.md` empfiehlst du (c): ihre Punkte werden
   einsortiert, die Datei bleibt als
   `TODO-vorgefunden.md` und die neue `TODO.md`
   verlinkt sie.

**Antworten einarbeiten:** Kollisionen auflösen
(`git mv` nach dem bestätigten Schema, dann die
ausgelassenen Starter-Dateien und Varianten aus
`_template/` einspielen — Skript erneut oder von Hand;
bei (a) und (c) verlinkt die Starter-Datei die
umbenannte; hat sie keinen Platz dafür — Ordner
`wiki-vorgefunden/`, Instruktionsdatei —, steht der
Link in `Migrations-Grundlagen` §Herkunft und bei der
Instruktionsdatei zusätzlich in der neuen
Instruktionsdatei (Phase 5); Links in vorgefundenen
Dateien ziehst du nicht nach — bricht dadurch einer,
notierst du die Stelle für den Bericht zur
Gesamt-Annahme); bei einem anderen Prozess das
`wiki/` umbauen (Nr. 1); Rolle in
[[Aktivierter-Prozess]] (Zeile `Rolle`;
`Übernahme-Art` nur bei Komponent), [[Commit-Sprache]]
nachführen; die **Übernahme-Marke** in
[[Zielmarken]] anlegen (Marken-Dreiklang, Zustand
`in-progress`; keine Marke trägt `current`, bis die
erste abgeschlossen ist) — sie entsteht **vor dem
ersten neuen Eintrag**, weil jedes neue Element sie
in `zielmarke:` trägt. Dann **Commit**.

## Phase 2 — Arbeitsmodus

Ab hier arbeitest du **autonom bis zum Ende von
Phase 4** — keine Rückfragen außer bei echten
Blockaden (dann: Berichten statt Blockieren,
weiterarbeiten wo möglich). Ausgabe-Rhythmus: knappe
Erledigt-Blöcke je Etappe. Es gelten das Grundgesetz
und die Grundsätze oben; außerdem:

- **Übernommenes ist Bestand, Neues trägt die
  Marke.** Elemente, die du aus dem Vorgefundenen
  übernimmst (Anforderungen, Fehler, Entscheidungen,
  Architektur, Deployments, Testfälle, Bedarfe,
  Szenarien, Contracts), tragen **kein** `zielmarke:`
  und **kein** Anlage-Datum — sie sind Bestand und
  gelten ab ihrer Annahme für jede Marke; der Lint
  meldet das fehlende Feld als Hinweis, nachgetragen
  wird nichts. Das Status-Datum ist der Tag deiner
  Buchung. Was die Migration selbst **neu** anlegt —
  die Freigaben der Bestands-Ordner, die Entscheidung
  „Migrations-Grundlagen als Gesamtpaket angenommen“,
  die Entscheidungen aus den Restfragen in Phase 5 —,
  trägt `zielmarke:` mit der Übernahme-Marke und sein
  Anlage-Datum.
- **Keine erfundenen Daten:** niemals rekonstruierte
  Datumsangaben, Zahlen oder Fakten.
  **Einschätzungen sind davon unterschieden und
  erlaubt** (z.B. die Status-Wahl): Status nach dem,
  was Code oder Vorgefundenes belegt (etwa
  `umgesetzt`); im Zweifel `offen` bzw. `angenommen`
  und den Fall in `Migrations-Grundlagen` §Ungeklärt
  notieren.
- **Nichts löschen:** Die alten Wissensbasis-Dateien
  bleiben unverändert liegen (eingefrorene
  Nachweis-Schicht; Verweise aus dem wiki/ zeigen
  auf sie). Aufräumen ist ein Vorhaben **nach** der
  Übernahme-Marke.

## Phase 3 — Transformation (Wissen → wiki/)

**Mapping** — jede Wissens-Klasse hat genau ein
Ziel. **Eintragsformat, ID-Präfix und Zählung (ab
001) liest du je Ziel aus der `## Meta` der
Fassade** — bei [[Anforderungen]] auch die
Sektionen; die Vorstufen Bedarf und Szenario haben
mit RP-1 die Form der User-Story bzw. des Use Case
([[Bedarfe]], [[Szenarien]] §Meta).

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
**Commit** (Präfix je Fassade, siehe
[[Commit-Prozedur]]). Am Ende der Phase:

- **Neue `TODO.md`** anlegen (Standarddatei, offene
  Punkte des Anwenders) — immer, auch wenn das
  Projekt keine Aufgabenliste hatte. Sie verlinkt
  jede vorgefundene Datei mit offenen Arbeiten
  (Nr. 2 des Fragen-Blocks), je mit einer kurzen
  Angabe, was die Datei enthält und wohin ihre Punkte
  eingeordnet wurden; eine umbenannte
  `TODO-vorgefunden.md` steht darunter.
- Bestands-Ordner-Freigaben als DEC buchen (Nr. 7),
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
   > richtigen Ort nach MIGRATION.md Phase 3?
   > (4) Register-Hygiene — Formate, Status-Werte,
   > Quell-Verweise, Bestand ohne `zielmarke:` und
   > Anlage-Datum, Neues mit beidem, keine erfundenen
   > Daten? Dazu `sh _template/tools/lint.sh` aus dem
   > Projekt-Root: keine FEHLER. Schreibe genau einen
   > Bericht mit Ampel (grün/gelb/rot) und
   > nummerierten Befunden samt Fundstelle. Kein
   > Commit.
2. Jeden Bericht **zuerst ablegen** (REP-Nummer,
   [[Agent-Berichte]]), dann zusammenfassen.
3. **Regel: beide grün → weiter. Sonst: Befunde
   nacharbeiten, Commit, erneutes Review beider
   Prüfer (Kurz-Re-Check über die Nacharbeit) —
   höchstens drei Runden.** Liefert die dritte Runde
   weiterhin entscheidungsbedürftige Befunde, endet
   die Vorprüfung mit einem **Konvergenz-Bericht** an
   den Anwender (`convergence-report`,
   [[Agent-Berichte]]: wiederkehrende Befunde,
   Ursache, Handlungsoptionen) statt mit Grün; ein
   Befund, der nach Nacharbeit in gleicher Form
   wiederkehrt, geht sofort an den Anwender.
4. **Stufe 2 — der Anwender, wenn er Prüfer ist:**
   Hat der Anwender in Phase 1 den Ersatzweg (b)
   gewählt, prüft er jetzt das Ergebnis der
   Vorprüfung; sein Urteil hält ein eigener
   `review-report` mit `modell: anwender` fest. Beim
   Ein-Modell-Weg (a) endet das Review mit Stufe 1.
5. **Gesamt-Annahme:** Lege dem Anwender den Bericht
   über die unsicheren Stellen vor — Ungeklärtes aus
   `Migrations-Grundlagen`, konservativ gewählte
   Status, durch Umbenennung gebrochene Links in
   vorgefundenen Dateien. Der Anwender bestätigt die
   Rekonstruktion als Ganzes; damit buchst du die
   Register-Zeile `### DEC-NNN — Migrations-Grundlagen
   als Gesamtpaket angenommen` (Status `angenommen`,
   `zielmarke:` Übernahme-Marke, Anlage-Datum; die
   Datei aus Phase 3 ist ihr Detail-Knoten).
   Sammel-Register dürfen `offen` bleiben.
6. Abschluss-Commit der Phase.

## Phase 5 — Init-Restfragen und Abschluss

Jetzt — und erst jetzt — die verbliebenen
Init-Schritte; was vorfestgelegt ist, wird **nicht**
erneut gefragt. Entscheidungen aus diesen Fragen
werden wie alles Neue gebucht: `zielmarke:` der
Übernahme-Marke, Anlage-Datum.

1. **Glossar-Freigabe:** die in [[Glossar Review]]
   gesammelten Begriffs-Vorschläge gebündelt
   vorlegen; Freigegebenes ins [[Glossar]]
   übernehmen.
2. **Sprach-Frage** regulär stellen (A Projektsprache
   / B Sprache folgt Artefakt / C Englisch) und in
   [[Commit-Sprache]] buchen.
3. **WorkspaceManager verfügbar?** — beide Rollen
   ([[Init-Choreografie]] §Baustein
   WorkspaceManager-Frage); Antwort in die
   Betriebs-Konfiguration des
   [[WorkspaceManager-Kontrakt]] (ersetzt die
   Migrations-Vorbelegung).
4. **Ein Repo oder zwei?** ([[Init-Choreografie]]
   §Baustein Ein-/Zwei-Repo-Frage; Einrichtung nach
   [[Two-Repo-Submodul-Muster]]) — Entscheid jetzt,
   Umsetzung als erstes Vorhaben nach der
   Übernahme-Marke: Repo-Umbau während der Migration
   vermischt zwei Baustellen.
5. **Instruktionsdatei** erzeugen (deine native
   Datei, z.B. `CLAUDE.md`) nach MasterPrompt §8.3 /
   [[Instruktionsdatei-Pflege]] — **einschließlich der
   eisernen Regel „Das wiki/ ist die Quelle der
   Wahrheit“** (Wortlaut aus dem Grundgesetz oben).
   Eine vorgefundene Instruktionsdatei ist ein
   Kollisionsfall aus Phase 1 (umbenannt und
   verlinkt bzw. integriert).
6. Bei **Koordinator** aus Phase 1: Contract-Index
   aktivieren — Skelett aus
   `_template/referenzprozesse/SP-1-Standardprozess/wiki/`
   ins Projekt-`wiki/`, Bootstrap aus
   `_template/referenzprozesse/SP-1-Standardprozess/bootstrap/`
   abarbeiten (Quelle Nur-Lese), [[Fassaden]]
   nachführen.
7. **Kein Marken-Wechsel:** Die Übernahme-Marke
   bleibt `in-progress`, keine Marke trägt `current`;
   in der Migration entstehen keine Stände. Erste
   Aufgabe danach: die Pflicht-Stände der Marke
   ableiten und nach [[Kettenpruefung]] zur Freigabe
   vorlegen; der Abschluss läuft regulär über den
   Abschluss-Stand und die Wechsel-Prozedur
   ([[Zielmarken]] §Meta), danach trägt die
   Übernahme-Marke `current`.
8. **Abschluss-Buchung (kein Selbst-Abbau —
   MIGRATION.md liegt nicht in deinem Projekt):**
   Chronologie-Eintrag „Migration abgeschlossen
   (Template-Stand 2.0 seit <Übernahme-Tag>, Quelle
   <Commit/Tag>, Modus A/B)“ — Werte wie im
   Herkunfts-Vermerk; die Wahrheit der Migration lebt
   ab jetzt vollständig in den Buchungen. Eine
   vorgefundene README bleibt; schlage dem Anwender
   vor, dort die Einstiege zu ergänzen
   (Instruktionsdatei, `wiki/`, Erklärung in
   `_template/docs/Einfuehrung.md`).
9. **Lint:** `sh _template/tools/lint.sh` aus dem
   Projekt-Root ohne FEHLER (den Stichtag liest er
   aus dem Herkunfts-Vermerk; Hinweise zu Bestand
   ohne Feld sind erwartet).
10. Abschluss-Commit. `_template/` (samt
    `_template/referenzprozesse/`) bleibt dauerhaft
    als Nur-Lese-Nachschlage- und Upgrade-Quelle
    liegen (nicht löschen) — bei Modus A zugleich als
    Ur-Versions-Archiv. Ab hier gilt der normale
    Betrieb nach MasterPrompt — beim nächsten
    Sessionstart läuft der reguläre Ablauf (§5.3).
