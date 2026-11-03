# INIT — Neues Projekt aus diesem Starter

**Du liest dieses Dokument, weil ein neues Projekt
aus diesem Starter entstehen soll** — typischerweise
nach dem Start-Satz „Richte dieses Verzeichnis als
neues Projekt nach der Anleitung unter
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung
ein.“ oder nach dem Startprompt eines Koordinators,
der mit diesem Satz beginnt (Rolle Komponent,
Schritt 3). Das aktuelle Verzeichnis ist der
Projektordner. Du darfst dieses Dokument und jede
Datei, auf die es verweist, **direkt von der Repo-URL
lesen, bevor irgendetwas eingebunden ist** (Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`;
Wiki-Verweise `[[Name]]` meinen `wiki/Name.md`); ab
der Einbindung (Schritt 0) liest du aus `_template/`,
ab der Kopie (Schritt 1) die Wiki-Knoten aus deinem
Projekt-`wiki/`.

Dein Projekt-`wiki/` kommt vorbereitet aus dem
Starter — RP-1 (Entwicklung eines Softwaresystems)
auf SP-1 ist aktiviert, die Vorfestlegungen bucht
[[Aktivierter-Prozess]]. **Du baust kein wiki, du
füllst eines.** Der Starter weiß, dass es andere
Referenzprozesse gibt (Regelwerk unter
`_template/referenzprozesse/`, keine abschließende
Liste); passt der Software-Prozess nicht zum
Vorhaben, fragst du (Schritt 3 Nr. 1). Diese
Anleitung regelt nur, was am Starter-Fall besonders
ist; alles Übrige regeln MasterPrompt §5.3 und
[[Init-Choreografie]]. Ihre Verweise auf
MasterPrompt-Abschnitte und Wiki-Knoten sind
**Lese-Anweisungen**.

## Grundsätze

Alles Weitere folgt aus drei Grundsätzen. Wo ein Fall
unten nicht ausdrücklich steht, entscheiden sie:

- **Nichts geht verloren.** Nichts überschreiben,
  nichts löschen ohne ausdrücklichen Wunsch des
  Anwenders. Darum überschreibt keine Starter-Datei
  eine vorgefundene, und der Aufnahme-Commit nimmt
  nur die Starter-Kopie und `_template/` auf —
  Vorgefundenes kommt erst nach der Kollisionsfrage
  ins Repo.
- **Alles wird einsortiert.** Vorgefundenes
  überträgst du in die Struktur der Vorlage oder
  verlinkst es; die Herkunft bleibt erkennbar.
- **Im Zweifel fragst du den Anwender.** Gesammelt im
  Fragen-Block (Schritt 3).

Feste Regeln stehen nur dort, wo eine Maschine liest
(Lint: der Herkunfts-Vermerk, `zielmarke:` und
Anlage-Datum) oder wo der Anwender bewusst vom
vernünftigen Standard abweicht (Kollisionsfrage,
Prozess-Nachfrage). Alles andere sind Beispiele unter
den Grundsätzen.

**Kollisionsfrage** (Regel, gilt für jede vorgefundene
Datei und jeden vorgefundenen Ordner, deren Name mit
etwas kollidiert, das der Init kopiert — Schritt 1 —
oder anlegt — Schritt 4 und 5: `TODO.md`,
`README.md`, Instruktionsdatei, `Tools.md`; „Datei des
Inits“ unten meint beides): Du stellst im Fragen-Block
(Nr. 11) je Fall die Frage mit drei Möglichkeiten und
gibst eine Empfehlung mit Grund; der Anwender darf
gesammelt antworten („alles wie empfohlen“, „überall
(c)“):

- **(a) umbenennen und nur verlinken** — die Datei
  bleibt umbenannt und unverändert liegen, die Datei
  des Inits wird kopiert bzw. angelegt und verlinkt
  sie;
- **(b) komplett integrieren** — ihr Inhalt geht in
  die Datei des Inits oder an den Ort im Wiki, den du
  vorschlägst; **gelöscht wird nur auf ausdrücklichen
  Wunsch** — sonst fragst du nach und lässt die Datei
  bis dahin umbenannt liegen; du empfiehlst nie von
  dir aus das Löschen;
- **(c) integrieren und alte Fassung behalten** —
  Inhalt wie (b), die Datei zusätzlich wie (a).

Namensschema: `<Name>-vorgefunden.<Endung>` im selben
Ordner, für einen Ordner `<Name>-vorgefunden/` — du
schlägst vor, der Anwender bestätigt oder nennt einen
anderen Namen. Reihenfolge: erst umbenennen, dann
einspielen, dann buchen (Schritt 4). Inhaltsgleiche
Dateien sind keine Kollision; `.gitignore` wird nur
kopiert, wenn keine vorhanden ist.

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
Regel übernimmst du in Schritt 4 in deine
Instruktionsdatei.

**Nur-Lese-Regel:** `_template/` wird **nie
beschrieben** und nie gelöscht; es bleibt dauerhaft
im Projekt. `referenzprozesse/`, `tools/` (der
Lint-Kern, den du aus `_template/tools/` aufrufst)
und `upgrade/` liegen **nur** dort.

**Keine Ausführung ohne Zustimmung:** `git init`,
Einbindung (Schritt 0) und Kopier-Skript (Schritt 1)
sind Angebote — du nennst das exakte Kommando und
handelst erst nach der Antwort. Einzige Ausnahme ist
der Aufnahme-Commit (Schritt 2): angekündigt, nicht
erfragt. Für den Starter-Fall ersetzt Schritt 0 die
Bootstrap-Init-Frage aus MasterPrompt §5.3; die
Modus-Beschreibung in MasterPrompt §1 gilt
unverändert.

---

## 0. Einbindung (allererster Schritt)

**Ist die Einbindung schon erfolgt?** Ja, wenn
`_template/` existiert und `_template/INIT.md` sowie
`_template/MasterPrompt.md` enthält — dann Modus
feststellen: **Modus B**, wenn `.gitmodules` einen
Eintrag für `_template` trägt
(`git submodule status _template`); **Modus A**,
wenn `_template/` ein gewöhnlicher Ordner ohne
eigenes `.git` ist. Weiter mit Schritt 1. Ist
`_template/` leer (Submodul nach `git clone` ohne
`--recursive`): `git submodule update --init`
anbieten.

Wenn nein, stelle dem Anwender **als allererste
Frage** die Einbindungs-Frage mit diesem Wortlaut:

> Wie soll die Vorlage in dein Projekt kommen? Sie
> landet in beiden Fällen im Ordner `_template/` und
> wird dort nie verändert.
>
> - **B — verknüpfte Vorlage, die du später gezielt
>   aktualisieren kannst** (empfohlen; technisch ein
>   git-Submodul, das auf einen festen Stand
>   „gepinnt“ ist). Braucht beim Einrichten
>   Internet-Zugriff auf GitHub; wer dein Projekt
>   später klont, holt die Vorlage mit
>   `git clone --recursive` mit.
> - **A — eingefrorene Kopie der Vorlage, die
>   dauerhaft im Projekt bleibt, damit du immer
>   siehst, womit du gestartet bist** (technisch eine
>   Einmal-Kopie ohne Git-Verbindung, die mit deinem
>   Projekt gespeichert wird, ca. 3 MB). Neuere
>   Vorlagen-Stände übernimmst du später durch
>   bewussten Austausch der Kopie.

Nach der Antwort nennst du die exakten Kommandos und
führst sie nach Zustimmung aus (Repo-URL
`https://github.com/schlingensiepen/referenzprozess-softwareentwicklung`):

- **Kein git-Repo?** Fehlt `.git`, gehört `git init`
  mit in dieses Angebot (MasterPrompt §5.3 A1). Lehnt
  der Anwender ab, ruhen alle Schritte mit
  Commit-Anteil, bis ein Repo da ist (Fail-Safe §5.3
  A1).
- **Modus B:**
  `git submodule add https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template`.
  Schlägt das fehl (kein Netz, URL nicht erreichbar):
  melden; der Anwender entscheidet — erneut
  versuchen, andere URL, Modus A oder Abbruch.
- **Modus A:**
  `git clone --depth 1 https://github.com/schlingensiepen/referenzprozess-softwareentwicklung _template`,
  dann die Herkunft ablesen
  (`git -C _template rev-parse HEAD` und
  `git -C _template describe --tags --always`),
  danach `rm -rf _template/.git`. Die Kopie ist
  gewöhnlicher Projekt-Inhalt: Nur-Lese, wird mit dem
  Projekt committet (Schritt 2) und nie gelöscht —
  das Ur-Versions-Archiv.

**Herkunft merken (beide Modi):** Repo-URL, Stand
(Modus A: der abgelesene Commit/Tag; Modus B: der
Submodul-Pin aus `git submodule status _template`)
und Modus schreibst du in Schritt 4 in den
Herkunfts-Vermerk.

## 1. Projektdateien anlegen (Angebot)

**Ist die Kopie schon erfolgt?** Prüfe die
Marker-Dateien gegen ihr Gegenstück in `_template/`
(z.B. `cmp -s <datei> _template/<datei>`):
`MasterPrompt.md`, `devstate_active.md`,
`wiki/Fassaden.md`, `wiki/Init-Choreografie.md`.
Alle vorhanden und inhaltsgleich → weiter mit
Schritt 2. Sonst (keine, teilweise oder abweichend)
das Angebot unten; das Skript ergänzt nur Fehlendes
und listet Vorhandenes.

**Biete dem Anwender die zwei Wege an** und kopiere
erst nach seiner Zustimmung:

- **(a) Kopier-Skript** (empfohlen: deterministisch,
  überschreibt nichts, listet Kollisionen), aus dem
  Projektordner: `sh _template/setup/init-frisch.sh`
- **(b) Von Hand nach der Kopier-Liste** aus
  `_template/`; die Liste ist der führende Ort, das
  Skript ihre Implementierung — (b) ist zugleich der
  Fallback, wenn das Skript nicht lauffähig ist.

**Kopier-Liste:**

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
| `wiki/` (komplett, inkl. `templates/`) | `wiki/` | vorbereitetes `wiki/`, inkl. deaktivierter Fassaden (Reaktivierung per Zuruf) |
| `devstate_active.md` | `devstate_active.md` | Frisch-Fassung |

**Nie kopiert werden:** `referenzprozesse/`,
`tools/` (du rufst `_template/tools/lint.sh` auf und
trägst es so in `Tools.md` ein, Schritt 4),
`upgrade/`, `README.md` (die des Starters; die
Projekt-README legst du in Schritt 5 neu an — das ist
für diesen Starter das „Anpassen“ der mitgelieferten
README aus [[Init-Choreografie]] §Phase A0 und
[[Standarddateien-Katalog]] §2.14), `INIT.md`,
`migration/`, `docs/`, `setup/`, `LICENSE`, `.git/`.

**Kollisionen** — die Liste des Skripts (bzw. deiner
Handkopie) ist der Eingang der Kollisionsfrage
(Grundsätze; Nr. 11): die kollidierende Starter-Datei
bleibt bis zur Antwort ausgelassen. Beispiele: Ein
vorgefundenes `wiki/`, das nicht aus diesem Starter
stammt (kein inhaltsgleiches
`wiki/Init-Choreografie.md`), ist **eine** Kollision
auf Ordner-Ebene — nichts wird hineinkopiert. Das
Skript sieht nur die Kopier-Liste; was du in
Schritt 4 und 5 anlegst — `TODO.md`, `README.md`,
Instruktionsdatei, `Tools.md` — prüfst du selbst
gegen den Ordner und nimmst es in dieselbe Frage auf.
Ein Verzeichnis mit gewachsener Wissensbasis ist kein
Fall für diesen Weg, sondern für die Migration
(`migration/MIGRATION.md`); sag es dem Anwender.

## 2. git-Prüfung

- Kein Repo (in Schritt 0 abgelehnt)? `git init`
  erneut anbieten; ohne Repo gilt der Fail-Safe.
- Modus B: Submodul eingebunden und gepinnt
  (`git submodule status`)? Modus A: `_template/`
  ohne eigenes `.git`?
- **Aufnahme-Commit** des kopierten Stands samt
  Einbindung (Modus A einschließlich der Kopie unter
  `_template/`). Vorher `git status --porcelain`
  lesen: Liegen außer den kopierten Dateien und
  `_template/` andere Dateien im Ordner, nimmst du nur
  die kopierten und `_template/` auf (`git add
  _template <kopierte Pfade>` — das Skript nennt die
  Pfade am Ende) und nennst dem Anwender
  den Rest — er kommt nach der Kollisionsfrage mit dem
  ersten eigenen Commit (Schritt 5) ins Repo; sonst
  `git add -A && git commit -m "Setup: Starter-Stand aufgenommen"`.
  Ignorierte Dateien bleiben ignoriert (nie
  `git add -f`); fehlende git-Identität erfragst du,
  statt sie zu setzen; bei abweisendem Hook oder
  verlangter Signatur hältst du an und beschreibst
  die Lage — nie `--no-verify`.
- Das Remote-Ziel ist Punkt im Fragen-Block — nicht
  jetzt einrichten.

## 3. Fragen-Block

**Übersicht zuerst:** Zeige dem Anwender die Punkte
unten als Fahrplan (je Punkt eine Zeile mit dem, was
feststeht oder ableitbar ist, MasterPrompt §5.1.0)
und biete den Briefing-Modus an: wählt er ihn,
stellst du die Fragen einzeln, sonst alle in
**einem** Block (nummeriert, je Punkt dein Vorschlag
zuerst; Ableitbares als Entwurf, nicht abfragen).
Dieser Block ersetzt die Turns 1 und 2 der
[[Init-Choreografie]] §Phase D; was dort Turn 3 und
die Folge-Turns tun, ist Schritt 4 (einschließlich
Konzept-Angebot und Mission-Statement-Dialog).
Frage nichts, was vorfestgelegt ist
([[Aktivierter-Prozess]]); die Fassaden-Auswahl ist
Starter-Vorauswahl ([[Fassaden]]; deaktivierte
Fassaden werden per Zuruf reaktiviert —
[[Geschaeftsbeziehungen]] empfiehlt der Prozess bei
Produktentwicklung, [[Fehlermeldungen]] setzt
[[Anforderungen]] voraus).

**Mit Startprompt (Rolle Komponent):** Was der
Startprompt des Koordinators vorgibt, legst du als
abgeleitet vor und fragst es nicht — Rolle Komponent,
eigener Repo-Name, Pfad und Remote, Koordinator-Pfad,
**Übernahme-Art**, Start und Transport, Verweis auf
den **Übergabe-Stand** ([[Init-Choreografie]] §Init
mit Startprompt). Den Referenzprozess gibt der
Startprompt **nicht** vor (Nr. 1). Seine Form: eine
Markdown-Datei in `output/` des Koordinators
(Einmal-Instanz, kein Wiki-Knoten), die mit dem
Start-Satz der README beginnt und danach die Angaben
der Tabelle in [[Init-Choreografie]] §Init mit
Startprompt in deren Reihenfolge nennt, je Angabe
eine Zeile; die Rolle heißt darin „Komponent“ wie im
Herkunfts-Vermerk.

1. **Prozess-Nachfrage** — nur, wenn der
   Software-Prozess nach dem, was du bis hierher
   weißt (Startprompt und Übergabe-Stand, Originale
   in `raw/`, Aussagen des Anwenders), nicht zum
   Vorhaben passt oder du nicht sicher bist: „Bist du
   sicher, dass das der richtige Prozess ist? Ich
   erkenne nicht, dass er zum Vorhaben passt — willst
   du mir einen anderen nennen?“ Keine Liste. Das ist
   die Nachfrage, die [[Init-Choreografie]] §Init mit
   Startprompt der Init-Anleitung der Vorlage
   zuweist. Nennt der Anwender einen anderen Prozess,
   richtest du das Projekt damit ein (Schritt 4);
   bleibt er beim Software-Prozess, geht es damit
   weiter. Ergibt sich der Zweifel erst aus Nr. 8,
   fragst du vor der Umsetzung nach. _Legt vorab
   fest:_ ob das vorbereitete `wiki/` gefüllt oder
   ersetzt wird.
2. **Ein Repo oder zwei?** ([[Init-Choreografie]]
   §Baustein Ein-/Zwei-Repo-Frage;
   [[Two-Repo-Submodul-Muster]]). _Legt vorab fest:_
   ob ein Produkt-Repo entsteht und wo die
   selbsttragenden Dokumente liegen.
3. **WorkspaceManager verfügbar?** — beide Rollen
   ([[Init-Choreografie]] §Baustein
   WorkspaceManager-Frage); füllt die
   Betriebs-Konfiguration des
   [[WorkspaceManager-Kontrakt]].
4. **Bearbeiter-TLA** (MasterPrompt §4.2).
5. **Commit-Sprache** — reguläres Menü (A
   Projektsprache / B Sprache folgt Artefakt / C
   Englisch; Vorauswahl bei Codeprojekten: B).
6. **Ersatzweg für Prüfungen ohne zweites Modell** —
   nur, wenn du aus deiner Umgebung kein Werkzeug
   nennen kannst, über das ein zweites Modell prüft:
   (a) Ein-Modell-Weg (dasselbe Modell in frischem
   Kontext, Einschränkung „Prüf-Modell = Bau-Modell“
   im Freigabe-Eintrag) oder (b) Anwender als Prüfer
   (`Reviewmuster.md` §2 Schleife 2). _Legt vorab
   fest:_ wie jede Prüfung läuft, die Prüf-Modell ≠
   Bau-Modell verlangt; Eintrag in `Tools.md`
   §Prüf-Werkzeuge.
7. **Rolle** des Projekts: Standalone, Koordinator
   oder Komponent (SP-1 `index.md` §5); entfällt mit
   Startprompt. Bei „Koordinator“: ankündigen, dass
   du den Contract-Index aktivierst (Schritt 4).
   _Legt vorab fest:_ die Zeilen `Rolle` und
   `Übernahme-Art` des Herkunfts-Vermerks und damit
   die Kette ([[Kettenpruefung]]).
8. **Mission/Auftrag** des Projekts — speist
   [[Mission Statement]] und [[Facts]].
9. **Bezeichnung der ersten Marke** — Vorschlag die
   typische Marke des Prozesses aus [[Marken-RP-1]]
   („1.0“, Benennung z.B. „Erster Release“);
   ableitbar aus Aufruf-Prompt oder Startprompt (bei
   einer Komponente dazu `fuer_marke:` aus dem
   Übergabe-Stand). _Legt vorab fest:_ die
   `in-progress`-Marke, die danach fest bleibt
   ([[Zielmarken]] §Meta).
10. **Remote-Ziel**, falls nicht aus Schritt 2 oder
    dem Startprompt ableitbar.
11. **Kollisionsfrage** aus Schritt 1 und für die
    Dateien, die Schritt 4 und 5 anlegen, falls es
    Kollisionen gab — je Datei oder Ordner (a), (b)
    oder (c) mit Empfehlung und Namensvorschlag
    (Regel in den Grundsätzen). _Legt vorab fest:_
    die Reihenfolge in Schritt 4.

## 4. Umsetzung der Antworten

Reihenfolge: Kollisionen auflösen, erste Marke
anlegen, dann buchen — jedes neue Element trägt beim
Anlegen `zielmarke:` mit dieser Marke und sein
Anlage-Datum ([[Zielmarken]] §Meta; `datum:` im
Detail-Knoten bzw. `- **Angelegt:** JJJJ-MM-TT` im
Register-Eintrag).

- **Kollisionen** (Nr. 11): umbenennen — `git mv` für
  eine versionierte Datei; beim Init ist sie meist
  noch nicht versioniert (Schritt 2), dann `mv`, und
  sie kommt mit dem ersten eigenen Commit (Schritt 5)
  ins Repo. Dann die ausgelassenen Starter-Dateien
  einspielen (Skript erneut — es ergänzt nur
  Fehlendes — oder von Hand). Bei (a) und (c)
  verlinkt die Starter-Datei die umbenannte mit
  Link-Beschreibung; hat sie keinen Platz dafür
  (`wiki-vorgefunden/`, Instruktionsdatei), steht der
  Link in der Projekt-README unter den Einstiegen
  (Schritt 5), bei der Instruktionsdatei zusätzlich in
  der neuen; die neue `TODO.md` (Schritt 5) verlinkt
  die umbenannte. Bei (b) und (c) überträgst du den
  Inhalt an den vereinbarten Ort. Links in
  vorgefundenen Dateien ziehst du nicht nach; bricht
  einer, nennst du die Stelle.
- **Anderer Prozess** (Nr. 1): das vorbereitete
  `wiki/` wird ersetzt — Basis-Wiki aus
  `_template/referenzprozesse/base/wiki/` und
  Prozess-Merge nach [[Init-Choreografie]] §Phase A0
  und §Baustein Prozess-Angebot (ein geplanter
  Prozess: Basis-Only-Modus), Ablauf ab dort wie der
  Init der allgemeinen Vorlage
  (`_template/MasterPrompt.md` §5.3); der Starter
  bleibt `_template/`. Von den Punkten unten entfällt,
  was RP-1 oder SP-1 voraussetzt (Rollen,
  Contract-Index); Herkunft, erste Marke, `Tools.md`,
  Instruktionsdatei und die Buchungen in
  [[Commit-Sprache]] (aus dem Basis-Bootstrap
  `InterneMechanik.md`) und
  [[WorkspaceManager-Kontrakt]] (Basis-Wiki) bleiben.
  Wo bei Rolle Komponent die eigene Zeile, die Lage
  des Koordinators und die Nachbarn stehen, wenn es
  keine [[Softwaresystemarchitektur]] gibt, legt die
  Vorlage nicht fest — du fragst den Anwender
  (Grundsätze).
- **Erste Marke** nach dem Bootstrap
  `_template/referenzprozesse/base/bootstrap/Zielmarken.md`:
  Marken-Dreiklang mit der Bezeichnung aus Nr. 9,
  Zustand `in-progress`; bei einer Komponente die
  Zeile `fuer_marke:`. **Keine Marke trägt
  `current`**, solange keine abgeschlossen ist.
- **Herkunft** in [[Aktivierter-Prozess]]
  `## Herkunft` (Format: [[Init-Choreografie]]
  §Phase A0): `Template-Stand: 2.1 seit JJJJ-MM-TT`
  (Tag des Inits — der Stichtag, den der Lint liest),
  `Quelle` und `Anbindungs-Modus` aus Schritt 0,
  `Rolle` aus Nr. 7 bzw. dem Startprompt,
  `Übernahme-Art` (nur bei Rolle Komponent, sonst
  „—“). Keine Zeile `Vorher` — die schreibt nur ein
  Upgrade.
- **Buchungen:** [[Commit-Sprache]],
  [[WorkspaceManager-Kontrakt]]
  (Betriebs-Konfiguration); die Freigaben der Ordner
  aus dem SP-1-Steckbrief §Mitgebrachte Ordner als
  je ein Eintrag in [[Entscheidungen]] nach dem
  Muster `### DEC-NNN — Freigabe: Ordner src/` (wie
  in der Migration; der Gegenstand nennt den Ordner,
  nicht „freigegeben“ — das Wort liest der Lint als
  Stand-Freigabe), je mit `zielmarke:` und
  Anlage-Datum; die Wahl aus Nr. 2 nach
  [[Two-Repo-Submodul-Muster]].
- **`Tools.md`** aus `wiki/templates/Tools-Vorlage.md`:
  Prüf-Werkzeuge und Ersatzweg aus Nr. 6
  (§Prüf-Werkzeuge), `_template/tools/lint.sh` als
  Template-Werkzeug (§Projekt-Skripte, keine Kopie),
  bei einer Komponente Start und Transport aus dem
  Startprompt (§Peer-Agenten).
- **Rolle Koordinator:** Contract-Index aktivieren —
  Skelett und Bootstrap aus
  `_template/referenzprozesse/SP-1-Standardprozess/`
  (Quelle Nur-Lese), [[Fassaden]] nachführen; dazu
  die eigene Zeile in §Komponenten von
  [[Softwaresystemarchitektur]] (Lage im eigenen Repo
  — daran erkennt der Lint das eigene Repo; die
  Komponenten kommen mit P5 und P6 hinzu,
  [[Kettenpruefung]] §Freigabe-Ordnung des
  Koordinators).
  **Rolle Komponent:** eigene Zeile und Lage des
  Koordinators in §Komponenten von
  [[Softwaresystemarchitektur]]; Kette nach
  [[Kettenpruefung]] §Komponenten-Kette.
- **Mission/Facts-Bootstraps** aus
  `_template/referenzprozesse/base/bootstrap/`
  abarbeiten. Die Aktivierungs-Wahl des
  Mission-Statement-Bootstraps ist Starter-Vorauswahl
  (die Fassade ist aktiv), du fragst sie nicht. Am
  Ende dieses Schritts, nach den Buchungen: erst das
  **Konzept-Angebot** ([[Init-Choreografie]] §Baustein
  Konzept-Angebot; ohne Netz entfällt das Listing,
  ohne Subagenten die Empfehlungs-Stufe — mit
  Vermerk), dann der **Mission-Statement-Setup-Dialog**
  (§Baustein Mission-Statement-Setup-Dialog; Entwurf
  aus Nr. 8 und [[Facts]] §Projekteinstieg).
- **Instruktionsdatei** anlegen (deine native Datei,
  z.B. `CLAUDE.md`) nach MasterPrompt §8.3 /
  [[Instruktionsdatei-Pflege]], einschließlich des
  Grundgesetzes oben; dazu `Styleguide-project.md`
  und `Styleguide-chat.md` (Kopiervorlage
  `wiki/templates/Styleguide-chat-Vorlage.md`).

## 5. Abschluss

Kein Selbst-Abbau — dieses Dokument liegt nur im
Starter und bleibt in `_template/` lesbar.

- **Standarddateien**, die der Starter nicht
  mitliefert ([[Standarddateien-Katalog]]): die
  **Projekt-README** (Kurzbeschreibung, Einstiege,
  Instruktionsdatei; Verweis auf
  `_template/docs/Einfuehrung.md` und für spätere
  Stände auf `_template/README.md` §Template
  aktualisieren) und **`TODO.md`**
  (offene Punkte des Anwenders; sie verlinkt eine in
  Schritt 4 umbenannte `TODO-vorgefunden.md`).
- **Chronologie-Eintrag** „Projekt aus
  referenzprozess-softwareentwicklung angelegt
  (Template-Stand 2.1 seit <Datum>, Quelle
  <Commit/Tag>, Modus A/B)“ — Werte wie im
  Herkunfts-Vermerk.
- `devstate_active.md` nachführen (Zielmarke,
  nächste Schritte).
- **Lint:** `sh _template/tools/lint.sh` aus dem
  Projekt-Root ohne FEHLER (Stichtag aus dem
  Herkunfts-Vermerk).
- **Erster eigener Commit**, danach Push aufs Remote
  aus dem Fragen-Block (Remote-Einrichtung nur auf
  die dort gegebene Anweisung).

Ab hier gilt der normale Betrieb nach MasterPrompt
(§5.3).

---

**Bleibt Verweis (steht bewusst nicht hier):**
Fassaden-Auswahl-Mechanik, Ablauf von Konzept-Angebot
und Mission-Statement-Setup (Zeitpunkt: Schritt 4),
Startprompt-Tabelle → [[Init-Choreografie]];
Sessionstart-Phasen A–E, Commit-Regeln,
Ordner-Semantik → MasterPrompt.
