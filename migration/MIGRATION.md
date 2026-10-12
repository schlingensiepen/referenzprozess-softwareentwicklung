# MIGRATION — Wissensbasis in ein RP-1-wiki/ überführen

**Du liest dieses Dokument, weil dein Projekt sein
Wissen bisher in verstreuten Dateien sammelt und
jetzt auf das Template-System migriert.** Diese
Anleitung ist dein vollständiger Auftrag — du musst
zu Beginn nichts anderes lesen. Die Regel-Dokumente
des Templates (MasterPrompt.md, Wiki.md …) ziehst du
erst heran, wenn eine Phase dich dorthin schickt:
**Kontext schonen geht vor Vollständigkeit.**

**Start ohne lokale Kopie:** Typischerweise kommst
du über den Start-Satz „Migriere das Projekt in
diesem Verzeichnis nach der Anleitung unter
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung."
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
Schutzregeln aus Schritt 1. `git init` gehört nicht zu dieser
Ausnahme (MasterPrompt §5.3 A1: keine automatische
`git init` in einem gefüllten Ordner).

**Vorrang:** Für den Starter-Fall ersetzt Phase 0
Schritt 2 die allgemeine Bootstrap-Init-Frage aus
MasterPrompt §5.3 (Turn α/β); die Modus-Beschreibung
in MasterPrompt §1 („Anbindungs-Modi") gilt
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
Prozess-Vorlagen `referenzprozesse/` liegen **nur**
in `_template/referenzprozesse/` und werden nicht
ins Projekt kopiert. Ab der Kopie arbeitest du
ausschließlich in deinem Projektverzeichnis.

**Werkzeug-Adaption:** Alle hier beschriebenen
Mechanismen (Subagenten, Reviews, Commits) sind
werkzeug-agnostisch — adaptiere sie auf deine
lokalen Mittel; gleiches Verhalten, eigene Werkzeuge.
Hast du keine Subagenten, arbeite die Aufträge
sequenziell selbst ab. Ein **WorkspaceManager wird
nicht verwendet** (siehe
[[WorkspaceManager-Kontrakt]] §Projekt-Festlegung).

---

## Was du vorfindest

Dein `wiki/` ist **vorbereitet**: es kommt als Kopie
des Starter-`wiki/` (Frisch-Vorlage) **plus
Eintausch der Migrations-Varianten-Dateien aus
`migration/`**, ausgeführt durch
`setup/init-migration.sh` oder manuell nach der
Kopier-Liste (Phase 0 — den Weg wählt der
Anwender). Alle Fassaden
des RP-1-Zuschnitts liegen bereit, die
Init-Bootstraps sind bis auf zwei bewusste Ausnahmen
bereits abgearbeitet, der Typen-Katalog trägt die
SP-1-/RP-1-Anhänge, [[Aktivierter-Prozess]] bucht
die getroffenen Vorfestlegungen. **Du baust kein
wiki — du füllst eines.** Offen sind nur: die
Bootstraps von `Mission Statement` und `Facts`
(Projekt-Identität — füllst du in Phase 3 aus deinem
Wissen), die Fragen aus Phase 1 und die Restfragen
in Phase 5. Bootstraps **deaktivierter** Fassaden
(z.B. `Mission Statement Long` in
`_template/referenzprozesse/base/bootstrap/`) bleiben bewusst
liegen — sie werden erst bei einer Reaktivierung
per Zuruf abgearbeitet.

Die eingetauschten **Varianten-Dateien** (je mit
Grund):

- `devstate_active.md` — startet auf Zielmarke
  „1 — Migriert" mit Phase 0 als erstem Schritt.
- `wiki/Zielmarken.md` — bringt die Marken
  „0 — Alt-Bestand" (current) und „1 — Migriert"
  (in-progress) vorbelegt mit, statt sie beim Init
  zu erfragen.
- `wiki/Aktivierter-Prozess.md` — verweist die
  Rollen-Frage auf den Phase-1-Fragen-Block und
  lockert die MADR-Detail-Knoten-Pflicht für
  migrierte Entscheidungen (Register-Zeilen
  genügen).
- `wiki/Commit-Sprache.md` — schlägt vor, die
  bisherige Sprach-Regelung für die Dauer der
  Migration beizubehalten (reguläre Frage erst in
  Phase 5).
- `wiki/WorkspaceManager-Kontrakt.md` — bucht
  „nicht vorhanden" samt ausdrücklichem WSM-Verbot
  für die Migration.
- `wiki/InterneMechanik.md` — trägt die
  Vorbelegungs-Sektion in der Migrations-Fassung
  (inkl. WSM-Verbots-Zeile).

---

## Phase 0 — Sicherung und Starter-Aufnahme (sofort, vor allem anderen)

Die Reihenfolge ist fest: **(a) Sicherungs-Commit
des Alt-Zustands → (b) Einbindung (mit Modus-Frage)
→ (c) Kopie (Skript oder von Hand, als Angebot)
→ (d) Aufnahme-Commit.** Einbindung und Kopie liegen
beide zwischen den zwei Commits — so trennt die
Historie sauber „vorher" von „Starter da".

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
   >   festen Stand „gepinnt" ist). Braucht beim
   >   Einrichten Internet-Zugriff auf GitHub; wer
   >   dein Projekt später klont, holt die Vorlage
   >   mit `git clone --recursive` mit.
   > - **A — eingefrorene Kopie der Vorlage, die
   >   dauerhaft im Projekt bleibt, damit du immer
   >   siehst, womit du gestartet bist** (technisch
   >   eine Einmal-Kopie ohne Git-Verbindung, die
   >   mit deinem Projekt gespeichert wird, ca.
   >   1,5 MB). Neuere Vorlagen-Stände übernimmst
   >   du später durch bewussten Austausch der
   >   Kopie.

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

   **Herkunft vermerken (beide Modi):** Repo-URL und
   Stand (Modus A: der eben abgelesene Commit/Tag;
   Modus B: der Submodul-Pin aus
   `git submodule status _template`) trägst du nach
   der Kopie (Schritt 3), vor dem Aufnahme-Commit, im
   Feld „Template-Herkunft" von
   [[Aktivierter-Prozess]] ein (kollidierte die Datei
   mit einem Bestands-Dokument: im Phase-1-Fragen-
   Block nachholen).
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
   ist (bzw. dessen Herkunfts-Feld schon trägt).
   Teilweise erfolgt (abgebrochene Kopie) → Angebot
   wie unten; das Skript ergänzt nur Fehlendes und
   listet Vorhandenes als Kollision — Kollisionen,
   deren Inhalt mit der Starter-Datei identisch ist,
   sind keine echten und entfallen aus der Liste.
   Steht `devstate_active.md` schon auf einem
   Migrations-Stand jenseits von Phase 0, ist
   Phase 0 erledigt.

   Fehlt die Kopie, **biete dem Anwender
   die zwei Wege an** und kopiere erst nach seiner
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
   Umgebung). **Kollisionsregel:** eine
   Starter-Datei überschreibt **nie** eine
   gleichnamige Bestands-Datei (typische Kandidaten
   aus der Kopier-Liste: `wiki/index.md`,
   `devstate_active.md`, `MasterPrompt.md`;
   `.gitignore` ist Sonderfall ohne
   Kollisionsmeldung) — bei Namensgleichheit die
   Starter-Datei auslassen und die Kollisions-Liste
   im Fragen-Block (Phase 1) vorlegen. Danach der
   **Aufnahme-Commit** — umfasst Einbindung (bei
   Modus A die komplette Kopie unter `_template/`)
   und Kopie; angekündigt, nicht erfragt:
   `git add -A && git commit -m "Starter aufgenommen"`.
   Es gelten die Schutzregeln aus Schritt 1:
   ignorierte Dateien nie mit `-f`, sensible oder
   sehr große Dateien auslassen und nennen,
   git-Identität erfragen statt setzen, bei
   abweisendem Hook, verlangter Signatur oder
   laufendem Merge anhalten und die Lage
   beschreiben — nie `--no-verify`.
   **Sind Einbindung und Kopie schon erfolgt** (z.B.
   vom Anwender von Hand, README „Oder von Hand
   einrichten"): prüfen, ob der Alt-Zustand noch
   ungesichert ist; wenn ja, alles in einem Commit
   sichern (Regeln aus Schritt 1) und die fehlende
   Trennung als Vermerk in die Commit-Message
   aufnehmen.

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
   | `wiki/` (komplett, inkl. `templates/`) | `wiki/` | Frisch-Vorlage, inkl. deaktivierter Fassaden (z.B. `Mission Statement Long` — Reaktivierung per Zuruf) |
   | `devstate_active.md` | `devstate_active.md` | wird gleich ersetzt (s.u.) |

   **Danach eintauschen** (Variante ersetzt das eben
   kopierte Frisch-Pendant; kollidierte
   Bestands-Dateien bleiben unangetastet):

   | Variante (Starter) | ersetzt (Projekt) |
   |---|---|
   | `migration/devstate_active.md` | `devstate_active.md` |
   | `migration/wiki/Zielmarken.md` | `wiki/Zielmarken.md` |
   | `migration/wiki/Aktivierter-Prozess.md` | `wiki/Aktivierter-Prozess.md` |
   | `migration/wiki/Commit-Sprache.md` | `wiki/Commit-Sprache.md` |
   | `migration/wiki/WorkspaceManager-Kontrakt.md` | `wiki/WorkspaceManager-Kontrakt.md` |
   | `migration/wiki/InterneMechanik.md` | `wiki/InterneMechanik.md` |

   **Kollisions-Fallback für Varianten:** Kollidiert
   ein Varianten-Ziel mit einer Bestands-Datei
   (z.B. ein vorhandenes `wiki/Zielmarken.md` oder
   `devstate_active.md`), wird dort **nicht**
   eingetauscht (Skript wie Handkopie) — die Bestands-Datei bleibt. Stelle
   die Migrations-Vorbelegung dann manuell im
   Bestands-Dokument her, mit der jeweiligen
   Variante als Muster: die Marken „0 — Alt-Bestand"
   (current) und „1 — Migriert" (in-progress) nach
   `_template/migration/wiki/Zielmarken.md` in das
   Bestands-Zielmarken-Dokument eintragen bzw. den
   Stand/Nächste-Schritte-Block nach
   `_template/migration/devstate_active.md`
   nachziehen; wie der übrige Bestands-Inhalt
   solcher Dateien mit der Starter-Fassung
   zusammengeführt wird, entscheidet der Anwender im
   Phase-1-Fragen-Block (Kollisions-Liste, Frage 6).

   **Nie kopiert werden:** `referenzprozesse/`
   (bleibt als Nur-Lese-Vorlage in
   `_template/referenzprozesse/` — Steckbriefe,
   Skelette, `bootstrap/`-Ordner), `README.md`,
   `INIT.md`, `migration/` selbst, `docs/`, `setup/`,
   `LICENSE`, `.git/` — alles in `_template/` lesbar; ein
   etwaiges Bestands-`docs/` bleibt unberührt.
   Diese MIGRATION.md wird ebenfalls **nicht
   kopiert** — du liest sie aus
   `_template/migration/`.

4. Commit-Texte hier und im Folgenden sind
   **sinngemäß in der bisherigen Projektsprache**
   zulässig — die Sprach-Frage kommt erst in
   Phase 1/5.
5. Ab jetzt gilt Commit-Disziplin: jede
   abgeschlossene Phase endet mit einem Commit.

## Phase 1 — Fragen-Block (gesammelt, ein einziger Turn)

Stelle dem Anwender **alle** folgenden Fragen in
einem Block (Fahrplan-Stil: nummeriert, je Punkt
dein Vorschlag zuerst). Frage nichts einzeln nach,
was hier steht — und nichts, was schon vorfestgelegt
ist (siehe [[Aktivierter-Prozess]]).

1. **Wissensbasis-Dateien bestätigen:** Liste alle
   Dateien/Ordner auf, die du als bisherige
   Wissensträger identifizierst (lies dazu nur
   Datei-Namen und Kopfzeilen — bei Dateien ohne
   Überschrift ersatzweise die ersten zwei, drei
   Zeilen —, nicht die Volltexte!). Der Anwender
   streicht/ergänzt.
2. **Eigenes Modell + Gegen-Modell:** Nenne, welches
   Modell du selbst bist, und schlage ein
   **anderes** Modell für das Absicherungs-Review
   vor (mindestens gleichwertig für
   Urteils-Aufgaben). Gibt es keines: Fallback ist
   ein frischer Agent deines eigenen Modells mit
   unabhängigem Kontext — weise ausdrücklich darauf
   hin, dass das die schwächere Absicherung ist.
   Der Anwender bestätigt.
3. **Sprache:** Schlage vor, für die Dauer der
   Migration die bisherige Sprach-Regelung des
   Projekts beizubehalten; die reguläre
   Sprach-Frage des Templates wird in Phase 5
   erneut gestellt. (Begründung: Sprach-Wechsel
   während der Migration vermischt Transformation
   und Übersetzung — das Review könnte Umzugs- und
   Übersetzungsfehler nicht mehr trennen.)
4. **RP-1-Rolle:** Standalone oder Koordinator
   (mehrere Komponenten-Repos unter diesem Projekt)?
   Bei **Koordinator**: kündige an, dass nach der
   Migration (a) der Contract-Index aus
   `_template/referenzprozesse/RP-1-Systementwicklung/wiki/`
   aktiviert wird und
   (b) du das Angebot „Trennung von Werkstatt und
   Produkt" vorlegst
   ([[Two-Repo-Submodul-Muster]]; Konzept-Quelle:
   [[Konzept-Repositories]]). **Empfehlung: Entscheid
   jetzt, Umsetzung erst nach Marke „1 — Migriert"**
   — Repo-Umbau während der Migration vermischt
   zwei Baustellen.
5. **Zielmarken bestätigen:** current
   „0 — Alt-Bestand", in-progress „1 — Migriert"
   (siehe [[Zielmarken]]) — passt das, oder andere
   Benennungen?
6. **Bestands-Ordner:** Liste deine vorhandenen
   Root-Ordner (src/, data/ …) und etwaige
   Kopier-Kollisionen aus Phase 0; schlage vor, die
   Ordner als Freigaben zu buchen — `tools/` ist
   Standard-Ordner (MasterPrompt §1.9) und braucht
   keine Freigabe — in Phase 3 je
   eine DEC-Zeile nach dem Muster
   `### DEC-NNN — Freigabe: Bestands-Ordner src/`
   (Status angenommen, Migrationsdatum,
   Migrations-Marker).

Antworten einarbeiten (Aktivierter-Prozess,
Commit-Sprache, Zielmarken nachführen), dann
**Commit**.

## Phase 2 — Arbeitsmodus

Ab hier arbeitest du **autonom bis zum Ende von
Phase 4** — keine Rückfragen außer bei echten
Blockaden (dann: Berichten statt Blockieren,
weiterarbeiten wo möglich). Ausgabe-Rhythmus: knappe
Erledigt-Blöcke je Etappe. Es gilt das Grundgesetz
oben; außerdem:

- **Keine erfundenen Daten:** Migrierte
  Festlegungen tragen das Migrationsdatum und den
  Marker „Reihenfolge sachlich, nicht historisch
  (Migration)" — niemals rekonstruierte
  Datumsangaben, Zahlen oder Fakten.
  **Einschätzungen sind davon unterschieden und
  erlaubt** (z.B. die Status-Wahl): im Zweifel
  `offen` bzw. `angenommen`; `umgesetzt` oder
  `abgeschlossen` nur mit Beleg in der Quelle —
  sonst konservativ wählen und den Fall in
  `Migrations-Grundlagen` §Ungeklärt notieren.
- **Nichts löschen:** Die alten Wissensbasis-Dateien
  bleiben unverändert liegen (eingefrorene
  Nachweis-Schicht; Verweise aus dem wiki/ zeigen
  auf sie). Aufräumen ist ein Vorhaben **nach**
  Marke 1.

## Phase 3 — Transformation (Wissen → wiki/)

**Mapping** — jede Wissens-Klasse hat genau ein
Ziel. **Eintragsformat, ID-Präfix und Zählung (ab
001) liest du je Ziel aus der `## Meta` der
Fassade** — bei [[Anforderungen]] auch die zwei
Sektionen (funktional / nicht-funktional):

| Wissens-Klasse in deinen Dateien | Ziel |
|---|---|
| Anforderungen, Features, Soll-Verhalten | [[Anforderungen]] (REQ-Zeile; 8-Zustands-Status nach bestem Wissen) |
| Bekannte Fehler, offene Bugs, Workarounds | [[Fehlermeldungen]] (BR-Zeile) |
| Getroffene Festlegungen/Beschlüsse | [[Entscheidungen]] (DEC-Zeile — **ohne** Detail-Knoten-Pflicht; sinnvolle, nicht historische Reihenfolge) |
| Architektur-/Strukturwissen — Soll **und** dokumentierter Ist-Stand | [[Softwaresystemarchitektur]] (Ist als eigener Abschnitt kenntlich) |
| Test-/Prüf-Aufbau | [[Softwaresystemtest-Setup]] |
| Spezifikations-Texte (lebende Fassungen) | [[Spezifikationen]] (SPEC-Zeile + Detail-Knoten je Spezifikation) |
| Fachbegriffe, Definitionen | [[Glossar Review]] als **Vorschläge** — das Glossar ist Anwender-Terrain und wird nie direkt beschrieben; gesammelte Freigabe in Phase 5. Erklärungsbedürftige Sach-Konzepte zusätzlich als concept-Knoten via [[Konzepte]] |
| Betriebs-/Steuerungsregeln, Konventionen, Coding-Style | [[InterneMechanik]] (internal-rule-Knoten) |
| Setup-/Build-/Betriebs-Anleitungen, How-tos | [[InterneMechanik]] (internal-pattern-Knoten, einer je Anleitung) |
| Werkzeug-/Skript-Doku (z.B. tools/) | `Tools.md` im Root (Kopiervorlage: `wiki/templates/Tools-Vorlage.md`) |
| Changelog, Release-Notizen | [[Chronologie]] (verdichtet; Original bleibt als Nachweis liegen) |
| Externe Quellen, Literatur, Links | [[Rechercheartefakte]] (Nachweis-Register) bzw. §Bezüge des jeweiligen Fach-Knotens |
| Offene Fragen an den Anwender | `Offene Fragen.md` im Root (Standarddatei) |
| TODO-/Aufgabenlisten | je Natur: geplant → [[Anforderungen]]; unverbindlich → [[Ideen]]; operativ-kurzfristig → `devstate_active.md` §Nächste Schritte |
| Beteiligte, Zuständigkeiten | [[Ansprechpartner]], [[Personen]], [[Organisationen]] |
| Zeitgeschehen, Meilensteine der Historie | [[Chronologie]] (grobe Epochen genügen) |
| Ideen, Vielleicht-später | [[Ideen]] (IDEA-Zeile) |
| Nutzer-Rollen | [[Verwendungs-Rollen]] |
| Projekt-Identität, Stolpersteine, Einstieg | [[Mission Statement]] + [[Facts]] (dabei deren Bootstrap-Dateien aus `_template/referenzprozesse/base/bootstrap/` abarbeiten — die Quelle ist Nur-Lese, nichts löschen) |
| **Nicht mehr sicher Rekonstruierbares — und alles, was in keine Zeile passt** (Auffangregel: nie verwerfen!) | `wiki/Migrations-Grundlagen.md` — die Datei gibt es **nicht als Vorlage**; du legst sie bei erstem Bedarf im Projekt-wiki nach dieser Aufbau-Beschreibung an: Frontmatter `type: decision`, `id: DEC-NNN` (Nummer der zugehörigen Sammel-Zeile), Sektionen `## Festlegungen` / `## Ungeklärt` / `## Herkunft` / `## Vermerke`; im DEC-Register mit **einer** Zeile `### DEC-NNN — Migrations-Grundlagen als Gesamtpaket angenommen` verankert (die Datei ist deren Detail-Knoten). Einzelpunkte können später zu eigenen DECs befördert werden |

**Vorgehen:** Pro Wissensbasis-Datei ein Durchgang
(bei vielen Dateien: Subagenten, einer je Datei oder
Themen-Bündel). Empfohlener Subagenten-Auftrag —
Platzhalter ersetzen und **die komplette
Mapping-Tabelle sowie den Marker-Wortlaut wörtlich
an den Auftrag anhängen** (der Subagent liest
MIGRATION.md nicht):

> Du bist Migrations-Subagent im Projekt `<Projekt>`.
> Lies NUR die Datei(en) `<Wissensbasis-Dateien>` und
> die Ziel-Fassaden, die du befüllst. Ordne jeden
> Wissens-Baustein exakt einer Zeile der
> angehängten Mapping-Tabelle zu und trage ihn dort
> ein (Eintragsformat, ID-Präfix und Zählung aus
> der `## Meta` der jeweiligen Fassade). Regeln: Quelle
> je Eintrag als Verweis auf die Herkunfts-Datei
> nennen; keine erfundenen Daten (Migrations-Marker
> verwenden); nichts doppelt anlegen — vor jedem
> neuen Eintrag das Ziel-Register auf einen
> bestehenden prüfen (Kollisions-Grep); Unsicheres
> nach `wiki/Migrations-Grundlagen.md` §Ungeklärt.
> KEIN Commit. Rückgabe: Liste der angelegten
> Einträge + Ungeklärtes.

Nach jedem Durchgang: Register-Stände nachführen,
**Commit** (Präfix je Fassade, siehe
[[Commit-Prozedur]]). Am Ende der Phase:
Bestands-Ordner-Freigaben als DEC buchen (Frage 6),
`devstate_active.md` aktualisieren,
Abschluss-Commit.

## Phase 4 — Absicherungs-Review (Gegen-Modell)

1. Beauftrage das in Phase 1 bestätigte
   **Gegen-Modell** als frischen Agenten:
   > Prüfe die Wissens-Migration im Projekt
   > `<Projekt>`: (1) Vollständigkeit — stichprobe
   > jede Wissensbasis-Datei gegen das wiki/: fehlt
   > Substanz? (2) Treue — verfälschen Einträge ihre
   > Quelle? (3) Mapping-Disziplin — alles am
   > richtigen Ort nach MIGRATION.md Phase 3?
   > (4) Register-Hygiene — Formate, Status-Werte,
   > Quell-Verweise, keine erfundenen Daten?
   > Schreibe genau einen Bericht mit
   > Ampel (grün/gelb/rot) und nummerierten
   > Befunden samt Fundstelle. Kein Commit.
2. Den Bericht **zuerst ablegen** (REP-Nummer,
   [[Agent-Berichte]]), dann zusammenfassen.
3. **Regel: grün → weiter. Sonst: Befunde
   nacharbeiten, Commit, erneutes Review
   (Kurz-Re-Check über die Nacharbeit) — Loop bis
   grün.** Jede Runde wird als REP abgelegt.
4. Abschluss-Commit der Phase.

## Phase 5 — Init-Restfragen und Abschluss

Jetzt — und erst jetzt — die verbliebenen
Init-Schritte; was vorfestgelegt ist, wird **nicht**
erneut gefragt:

1. **Glossar-Freigabe:** die in [[Glossar Review]]
   gesammelten Begriffs-Vorschläge gebündelt
   vorlegen; Freigegebenes ins [[Glossar]]
   übernehmen.
2. **Sprach-Frage** regulär stellen (A Projektsprache
   / B Sprache folgt Artefakt / C Englisch) und in
   [[Commit-Sprache]] buchen.
3. **Instruktionsdatei** erzeugen/erneuern (deine
   native Datei, z.B. CLAUDE.md) nach MasterPrompt
   §8.3 — **einschließlich der eisernen Regel „Das
   wiki/ ist die Quelle der Wahrheit"** (Wortlaut
   aus dem Grundgesetz oben).
4. Bei **Koordinator-Entscheid** aus Phase 1:
   Contract-Index aktivieren (Skelett aus
   `_template/referenzprozesse/RP-1-Systementwicklung/wiki/`
   kopieren, die Bootstrap-Datei aus
   `_template/referenzprozesse/RP-1-Systementwicklung/bootstrap/`
   abarbeiten — beides Nur-Lese-Quelle —,
   [[Fassaden]] nachführen) und
   das **Werkstatt/Produkt-Angebot**
   vorlegen ([[Two-Repo-Submodul-Muster]]) —
   Entscheid als DEC buchen, Umsetzung als erstes
   Vorhaben der nächsten Marke einplanen.
5. **Marken-Wechsel** (der erste echte!): die
   Wechsel-Prozedur aus [[Zielmarken]] `## Meta`
   ausführen — Vollständigkeits-Scan über offene
   Migrations-Reste, Zeiger nachführen (current →
   „1 — Migriert"), neue in-progress-Marke vom
   Anwender erfragen, Wechsel als DEC buchen.
6. **Abschluss-Buchung (kein Selbst-Abbau —
   MIGRATION.md liegt nicht in deinem Projekt):**
   Chronologie-Eintrag „Migration abgeschlossen" +
   DEC-Vermerk „Migration abgeschlossen
   (Starter-Stand <Commit/Tag>, wie in
   [[Aktivierter-Prozess]] vermerkt)" — ihre Wahrheit
   lebt ab jetzt vollständig in den Buchungen;
   diese Anleitung bleibt in `_template/migration/`
   als Nachschlage-Quelle liegen.
7. Abschluss-Commit. `_template/` (samt
   `_template/referenzprozesse/`) bleibt dauerhaft
   als Nur-Lese-Nachschlage- und Upgrade-Quelle
   liegen (nicht löschen) — bei Modus A zugleich als
   Ur-Versions-Archiv. Ab hier
   gilt der normale Betrieb nach MasterPrompt —
   beim nächsten Sessionstart läuft der reguläre
   Ablauf (§5.3).
