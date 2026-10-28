# INIT — Neues Projekt aus diesem Starter

**Du liest dieses Dokument, weil ein neues Projekt
aus diesem Starter entstehen soll** — typischerweise
nach dem Start-Satz „Richte dieses Verzeichnis als
neues Projekt nach der Anleitung unter
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung
ein.“ oder nach dem Startprompt eines Koordinators,
der mit diesem Satz beginnt (Schritt 3, Rolle
Komponent). Das aktuelle Verzeichnis ist der
Projektordner. Du darfst dieses Dokument **direkt von
der Repo-URL lesen, bevor irgendetwas eingebunden
ist** — das ist der vorgesehene Weg; lokal muss dafür
nichts liegen. Dasselbe gilt für jede Datei, auf die
dieses Dokument verweist, solange `_template/` noch
fehlt: Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`;
Wiki-Verweise `[[Name]]` meinen dabei `wiki/Name.md`.
Ab der Einbindung (Schritt 0) liest du aus
`_template/`, ab der Kopie (Schritt 1) die
Wiki-Knoten aus deinem Projekt-`wiki/`.

Dein Projekt-`wiki/` kommt vorbereitet aus dem
Starter — RP-1 (Entwicklung eines Softwaresystems)
auf SP-1 ist aktiviert, die Vorfestlegungen bucht
[[Aktivierter-Prozess]]. **Du baust kein wiki, du
füllst eines.** Der Starter weiß, dass es andere
Referenzprozesse gibt — das Regelwerk mit allen
Prozessen liegt unter `_template/referenzprozesse/`,
eine abschließende Liste gibt es nicht; passt der
Software-Prozess nicht zum Vorhaben, fragst du
(Schritt 3 Nr. 1). Diese Anleitung ist eine
Kurz-Choreografie — sie regelt nur, was am
Starter-Fall besonders ist; alles Übrige regeln
MasterPrompt §5.3 und [[Init-Choreografie]] (liegt
nach dem Kopier-Schritt als
`wiki/Init-Choreografie.md` in deinem Projekt). Die
Verweise dieses Dokuments auf MasterPrompt-Abschnitte
und Wiki-Knoten sind **Lese-Anweisungen** — die
genannten Abschnitte liest du selbstverständlich (die
Nur-auf-Anweisung-Regel des MasterPrompts betrifft
den regulären Sessionstart, nicht diese
Choreografie).

**Grundgesetz (gilt ab sofort, dauerhaft):** Das
`wiki/` ist die Quelle der Wahrheit. Alles
Besprochene, Entschiedene und Erarbeitete muss dort
abgelegt sein — was nicht im `wiki/` steht, ist
nicht festgelegt. Die laufende Unterhaltung ist
Arbeitsspeicher, nicht Quelle. Daraus folgen zwei
Pflichten: **Lese-Pflicht** (vor jeder Behauptung
über eine Festlegung und vor jeder Frage an den
Anwender im `wiki/` nachschlagen;
Festlegungs-Behauptungen nennen ihre
Register-Nummer) und **Pflege-Pflicht** (Klärungen,
Berichte und Stände im selben Zug ablegen —
Berichte **vor** der Chat-Zusammenfassung). Diese
Regel übernimmst du in Schritt 4 in deine
Instruktionsdatei.

**Nur-Lese-Regel:** `_template/` wird **nie
beschrieben** — du liest daraus (in beiden
Einbindungs-Modi) und löschst es nicht; es bleibt
dauerhaft im Projekt. Die Prozess-Vorlagen
`referenzprozesse/` (Steckbriefe, Skelette,
`bootstrap/`-Ordner) liegen **nur** in
`_template/referenzprozesse/` und werden nicht ins
Projekt kopiert; dasselbe gilt für `tools/` (der
Lint-Kern, den du aus `_template/tools/` aufrufst)
und `upgrade/` (die Anleitung für spätere Stände).

**Keine Ausführung ohne Zustimmung:** `git init`,
Einbindung (Schritt 0) und Kopier-Skript (Schritt 1)
sind Angebote an den Anwender — du nennst, was du
tun willst (bei Kommandos: das exakte Kommando), und
handelst erst nach seiner Antwort. **Einzige
Ausnahme** ist der Aufnahme-Commit in Schritt 2: er
nimmt nur auf, was der Anwender in Schritt 0 und 1
selbst freigegeben hat, und wird in einem Satz
angekündigt, nicht erfragt.

**Vorrang:** Für den Starter-Fall ersetzt Schritt 0
die allgemeine Bootstrap-Init-Frage aus MasterPrompt
§5.3 (Turn α/β); die Modus-Beschreibung in
MasterPrompt §1 („Anbindungs-Modi“) gilt
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
eigenes `.git` ist. Weiter mit Schritt 1.
Sonderfall: `_template/` existiert, ist aber leer
(Submodul nach `git clone` ohne `--recursive`) —
`git submodule update --init` anbieten.

Wenn nein, stelle dem Anwender **als allererste
Frage** die Einbindungs-Frage. Verwende diesen
Wortlaut (Alltagssprache; Fachwörter nur in
Klammern):

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

- **Kein git-Repo?** Fehlt `.git`, gehört
  `git init` mit in dieses Angebot — nie ohne
  Zustimmung (MasterPrompt §5.3 A1: im leeren
  Ordner anbieten). Lehnt der Anwender ab, gilt der
  Fail-Safe aus §5.3 A1: Schritte mit Commit-Anteil
  ruhen, bis ein Repo da ist.
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
  danach `rm -rf _template/.git`. Die Kopie ist ab
  jetzt gewöhnlicher Projekt-Inhalt: Nur-Lese, wird
  mit dem Projekt committet (Schritt 2) und nie
  gelöscht — sie ist das Ur-Versions-Archiv, gegen
  das der Anwender jederzeit diffen kann.

**Herkunft merken (beide Modi):** Repo-URL und Stand
(Modus A: der eben abgelesene Commit/Tag; Modus B:
der Submodul-Pin aus `git submodule status
_template`) und den gewählten Modus schreibst du in
Schritt 4 in den Abschnitt `## Herkunft` von
[[Aktivierter-Prozess]] (Zeilen `Quelle` und
`Anbindungs-Modus`).

## 1. Projektdateien anlegen (Angebot)

**Ist die Kopie schon erfolgt?** Prüfe die
Marker-Dateien gegen ihr Gegenstück in `_template/`
(z.B. `cmp -s <datei> _template/<datei>`):
`MasterPrompt.md`, `devstate_active.md`,
`wiki/Fassaden.md` und `wiki/Init-Choreografie.md`.

- **Alle vorhanden und inhaltsgleich** → Kopie
  erfolgt, weiter mit Schritt 2.
- **Keine vorhanden** → Kopie fehlt, Angebot unten.
- **Teilweise vorhanden oder abweichend** (z.B.
  abgebrochene Kopie, eigene Dateien gleichen
  Namens) → Angebot unten; das Skript ergänzt nur
  Fehlendes und listet Vorhandenes. Vorhandene
  Dateien, deren Inhalt mit der Starter-Datei
  identisch ist, sind keine Kollision und entfallen
  aus der Liste.

Wenn die Kopie fehlt, **biete dem Anwender die zwei
Wege an** und kopiere erst nach seiner Zustimmung:

- **(a) Kopier-Skript ausführen** (empfohlen:
  deterministisch, überschreibt nichts, listet
  Kollisionen). Das exakte Kommando, aus dem
  Projektordner:
  `sh _template/setup/init-frisch.sh`
- **(b) Manuell nach der Kopier-Liste** — du
  kopierst selbst nach der folgenden Tabelle aus
  `_template/`; sie ist der führende Ort, das
  Skript nur ihre Implementierung. (b) ist zugleich
  der Fallback, wenn das Skript nicht lauffähig ist
  (keine sh, Rechte, exotische Umgebung).

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

**Nie kopiert werden:** `referenzprozesse/` (bleibt
als Nur-Lese-Vorlage in `_template/referenzprozesse/`
— Steckbriefe, Skelette, `bootstrap/`-Ordner),
`tools/` (Template-Werkzeug: du rufst
`_template/tools/lint.sh` auf und trägst es so in
`Tools.md` §Projekt-Skripte ein, Schritt 4),
`upgrade/`, `README.md`, `INIT.md`, `migration/`,
`docs/`, `setup/`, `LICENSE`, `.git/`.

**Kollisionen** — gleichnamige Dateien oder Ordner,
die im Projektordner schon liegen. Es gelten die
Grundsätze:

- **Nichts geht verloren:** nichts überschreiben,
  nichts löschen ohne ausdrücklichen Wunsch des
  Anwenders.
- **Alles wird einsortiert:** in die Struktur der
  Vorlage übertragen oder verlinken; die Herkunft
  bleibt erkennbar.
- **Im Zweifel fragst du den Anwender.**

Das Skript überschreibt nichts, lässt die
kollidierenden Starter-Dateien aus und listet sie;
die Liste ist der Eingang der Kollisionsfrage im
Fragen-Block (Schritt 3 Nr. 11): je Datei (a), (b)
oder (c) mit deiner Empfehlung. Erst nach der Antwort
benennst du um und spielst die ausgelassenen
Starter-Dateien ein (Schritt 4). `.gitignore` ist
kein Kollisionsfall — sie wird nur kopiert, wenn
keine vorhanden ist. Ein Verzeichnis mit gewachsener
Wissensbasis ist kein Fall für diesen Weg, sondern
für die Migration (`migration/MIGRATION.md`); sag es
dem Anwender, wenn du so etwas vorfindest.

## 2. git-Prüfung

- Existiert im Projektordner ein Repo? Wenn nein
  (in Schritt 0 abgelehnt oder übersprungen):
  `git init` erneut anbieten, nur nach Zustimmung
  ausführen; ohne Repo gilt der Fail-Safe aus
  MasterPrompt §5.3 A1.
- Modus B: ist das Submodul `_template/` eingebunden
  und gepinnt (`git submodule status`)? Modus A: ist
  `_template/` ein gewöhnlicher Ordner ohne eigenes
  `.git`?
- **Aufnahme-Commit** des kopierten Stands samt
  Einbindung — bei Modus A einschließlich der
  kompletten Kopie unter `_template/`. Vorher
  `git status --porcelain` ansehen: Liegen außer
  den kopierten Dateien und `_template/` noch
  andere Dateien im Ordner, nimmst du nur die
  freigegebenen auf (`git add _template <kopierte
  Pfade>`) und nennst dem Anwender den Rest;
  sonst
  `git add -A && git commit -m "Setup: Starter-Stand aufgenommen"`.
  Ignorierte Dateien bleiben ignoriert (nie
  `git add -f`). Fehlt die git-Identität
  (`git config user.name` / `user.email` leer),
  fragst du den Anwender danach und setzt sie nicht
  selbst. Läuft der Commit nicht glatt durch
  (abweisender Hook, verlangte Signatur), hältst du
  an und beschreibst die Lage — nie
  `--no-verify`.
- Das Remote-Ziel (eigenes GitHub-Repo o.ä.) ist
  Punkt im Fragen-Block — nicht jetzt einrichten.

## 3. Fragen-Block

**Übersicht zuerst:** Zeige dem Anwender vor den
Fragen den Init-Fahrplan — die Punkte unten in dieser
Reihenfolge, je Punkt eine Zeile mit dem, was schon
feststeht oder ableitbar ist (MasterPrompt §5.1.0) —
und biete den Briefing-Modus an: Wählt der Anwender
ihn, stellst du die Fragen einzeln; sonst alle in
**einem** Block (Fahrplan-Stil: nummeriert, je Punkt
dein Vorschlag zuerst; Ableitbares als Entwurf
vorlegen, nicht abfragen). Die Reihenfolge folgt der
Vorfestlegungs-Stärke: die Antwort, die am meisten
anderes festlegt, zuerst. Frage nichts, was schon
vorfestgelegt ist (siehe [[Aktivierter-Prozess]]); die
Fassaden-Auswahl entfällt als Frage — sie ist
Starter-Vorauswahl (siehe [[Fassaden]]). Hinweis an
den Anwender: deaktivierte Fassaden werden per Zuruf
reaktiviert; [[Geschaeftsbeziehungen]] (Kunden,
Wettbewerber, Partner) empfiehlt der Prozess bei
Produktentwicklung; [[Fehlermeldungen]] setzt
[[Anforderungen]] voraus — eine Behebung ist eine
Fix-Anforderung (Abschnitt „Fehlerbehebungen“ in
[[Anforderungen]]).

**Mit Startprompt (Rolle Komponent):** Was der
Startprompt des Koordinators vorgibt, legst du als
abgeleitet vor und fragst es nicht — Rolle Komponent,
eigener Repo-Name, Pfad und Remote, Koordinator-Pfad,
**Übernahme-Art** (selbstständig oder Auftrag),
Start und Transport, Verweis auf den
**Übergabe-Stand**; was du daraus ableitest, steht in
[[Init-Choreografie]] §Init mit Startprompt. Den
Referenzprozess gibt der Startprompt **nicht** vor
(Nr. 1).

1. **Prozess-Nachfrage** — nur, wenn der
   Software-Prozess nach dem, was du bis hierher
   weißt (Startprompt und Übergabe-Stand, Originale
   in `raw/`, Aussagen des Anwenders), nicht zum
   Vorhaben passt oder du nicht sicher bist. Dann
   fragst du: „Bist du sicher, dass das der richtige
   Prozess ist? Er passt nicht zum Auftrag — willst
   du mir einen anderen nennen?“ Keine Liste. Nennt
   der Anwender einen anderen Prozess, richtest du
   das Projekt nach dem allgemeinen Regelwerk im
   Starter mit diesem Prozess ein (Schritt 4); bleibt
   er beim Software-Prozess, geht es damit weiter.
   Ergibt sich der Zweifel erst aus der Antwort zu
   Nr. 8, stellst du die Nachfrage vor der Umsetzung
   nach. _Legt vorab fest:_ ob das vorbereitete
   `wiki/` gefüllt oder durch den gewählten Prozess
   ersetzt wird.
2. **Ein Repo oder zwei?** — „Ein Repo mit allem
   oder ein zweites Repo für das Produkt?“
   ([[Init-Choreografie]] §Baustein
   Ein-/Zwei-Repo-Frage; was „zweites Repo“
   einrichtet: [[Two-Repo-Submodul-Muster]]).
   _Legt vorab fest:_ ob ein Produkt-Repo entsteht
   und wo die selbsttragenden Dokumente liegen.
3. **WorkspaceManager verfügbar?** — beide Rollen,
   Konvertierung und Outgoing-Erzeugung
   ([[Init-Choreografie]] §Baustein
   WorkspaceManager-Frage); füllt die
   Betriebs-Konfiguration des
   [[WorkspaceManager-Kontrakt]]. _Legt vorab fest:_
   ob du Konvertierung und Outgoing-Erzeugung selbst
   übernimmst.
4. **Bearbeiter-TLA** (dreibuchstabiges Kürzel für
   die Versionierung, MasterPrompt §4.2).
5. **Commit-Sprache** — reguläres Menü (A
   Projektsprache / B Sprache folgt Artefakt / C
   Englisch; Vorauswahl bei Codeprojekten: B).
6. **Ersatzweg für Prüfungen ohne zweites Modell** —
   nur, wenn du aus deiner Umgebung kein Werkzeug
   nennen kannst, über das ein zweites Modell prüft
   (Peer-Agent, externes Modell): (a) Ein-Modell-Weg
   (dasselbe Modell prüft in frischem Kontext,
   Einschränkung „Prüf-Modell = Bau-Modell“ im
   Freigabe-Eintrag) oder (b) Anwender als Prüfer
   (`Reviewmuster.md` §2 Schleife 2, Fallback).
   _Legt vorab fest:_ wie jede Prüfung läuft, die
   Prüf-Modell ≠ Bau-Modell verlangt; Eintrag in
   `Tools.md` §Prüf-Werkzeuge.
7. **Rolle** des Projekts im Prozess: Standalone,
   Koordinator oder Komponent (Rollen: SP-1
   `index.md` §5). Entfällt mit Startprompt (Rolle
   Komponent, Übernahme-Art aus dem Startprompt).
   Bei „Koordinator“: ankündigen, dass du den
   Contract-Index aus
   `_template/referenzprozesse/SP-1-Standardprozess/`
   aktivierst (Skelett und Bootstrap, Schritt 4).
   _Legt vorab fest:_ die Zeilen `Rolle` und
   `Übernahme-Art` des Herkunfts-Vermerks und damit
   die Kette, nach der der Lint Pflicht-Stände
   verlangt ([[Kettenpruefung]]).
8. **Mission/Auftrag** des Projekts — speist
   [[Mission Statement]] und [[Facts]]; deren
   Bootstrap-Dateien aus
   `_template/referenzprozesse/base/bootstrap/`
   arbeitest du danach ab.
9. **Bezeichnung der ersten Marke** — Vorschlag die
   typische Marke des Prozesses aus [[Marken-RP-1]]
   („1.0“, Benennung z.B. „Erster Release“);
   ableitbar aus Aufruf-Prompt oder Startprompt (bei
   einer Komponente dazu `fuer_marke:` aus dem
   Übergabe-Stand). _Legt vorab fest:_ die
   Bezeichnung der `in-progress`-Marke, die danach
   fest bleibt ([[Zielmarken]] §Meta); angelegt wird
   sie in Schritt 4, vor jeder Buchung.
10. **Remote-Ziel** (GitHub-Repo des Anwenders),
    falls nicht aus Schritt 2 oder dem Startprompt
    ableitbar.
11. **Kollisionsfrage** aus Schritt 1, falls es
    Kollisionen gab — je Datei oder Ordner die drei
    Möglichkeiten, mit deiner Empfehlung und Grund;
    der Anwender darf gesammelt antworten („alles
    wie empfohlen“, „überall (c)“):
    - **(a) umbenennen und nur verlinken:** die
      vorgefundene Datei wird umbenannt und bleibt
      unverändert liegen; die Starter-Datei wird
      angelegt und verlinkt sie.
    - **(b) komplett integrieren:** ihr Inhalt geht
      vollständig in die Starter-Datei bzw. an den
      Ort im Wiki, den du vorschlägst; eine alte
      Fassung bleibt nicht als eigene Datei.
      **Gelöscht wird nur auf ausdrücklichen
      Wunsch** — nennt die Antwort das Löschen
      nicht, fragst du nach und lässt die Datei bis
      dahin umbenannt liegen; deine Empfehlung lautet
      nie von sich aus auf Löschen.
    - **(c) integrieren, alte Fassung behalten:**
      Inhalt wie (b), die vorgefundene Datei
      zusätzlich wie (a) umbenannt behalten und
      verlinkt.

    **Namensschema** (du schlägst vor, der Anwender
    bestätigt oder nennt einen anderen Namen):
    `<Name>-vorgefunden.<Endung>` im selben Ordner,
    für einen Ordner `<Name>-vorgefunden/` — z.B.
    `TODO-vorgefunden.md`, `wiki-vorgefunden/`.

## 4. Umsetzung der Antworten

Reihenfolge: zuerst die Kollisionen auflösen, dann
die erste Marke anlegen, dann buchen — jedes neue
Element trägt beim Anlegen `zielmarke:` mit dieser
Marke und sein Anlage-Datum ([[Zielmarken]] §Meta;
`datum:` im Detail-Knoten bzw. die Zeile
`- **Angelegt:** JJJJ-MM-TT` im Register-Eintrag).

- **Kollisionen** nach der Antwort aus Nr. 11:
  umbenennen per `git mv` (Inhalt unverändert), dann
  die ausgelassenen Starter-Dateien aus `_template/`
  einspielen, bei (a) und (c) die umbenannte Datei
  aus der Starter-Datei verlinken (mit
  Link-Beschreibung; eine umbenannte `TODO.md` aus
  der neuen `TODO.md`, Schritt 5); bei (b) und (c)
  den Inhalt an den vereinbarten Ort übertragen.
  Links in den vorgefundenen Dateien ziehst du nicht
  nach; bricht dadurch einer, nennst du die Stelle.
- **Anderer Prozess** (Nr. 1): das vorbereitete
  `wiki/` aus Schritt 1 wird nicht gefüllt, sondern
  ersetzt — Basis-Wiki aus
  `_template/referenzprozesse/base/wiki/` und
  Prozess-Merge nach [[Init-Choreografie]] §Phase A0
  und §Baustein Prozess-Angebot (ein geplanter
  Prozess im Basis-Only-Modus), Ablauf ab dort wie
  der Init der allgemeinen Vorlage
  (`_template/MasterPrompt.md` §5.3); der Starter
  bleibt `_template/`, spätere Stände kommen über
  seinen Upgrade-Weg. Die Punkte unten gelten dann
  sinngemäß für den gewählten Prozess.
- **Erste Marke** anlegen — Bootstrap
  `_template/referenzprozesse/base/bootstrap/Zielmarken.md`
  abarbeiten: ein Eintrag im Marken-Dreiklang mit
  der Bezeichnung aus Nr. 9, Zustand `in-progress`;
  bei einer Komponente die Zeile `fuer_marke:`.
  **Keine Marke trägt `current`**, solange keine
  abgeschlossen ist ([[Zielmarken]] §Meta); den
  Zeiger setzt erst der erste Marken-Wechsel.
- **Herkunft** in [[Aktivierter-Prozess]]
  `## Herkunft` (Format: [[Init-Choreografie]]
  §Phase A0 „Herkunfts-Vermerk“): `Template-Stand:
  2.0 seit JJJJ-MM-TT` (Tag des Inits — der Stichtag,
  den der Lint liest), `Quelle` (Repo-URL und
  Commit/Tag aus Schritt 0), `Anbindungs-Modus: A`
  bzw. `B`, `Rolle` aus Nr. 7 bzw. dem Startprompt,
  `Übernahme-Art` (nur bei Rolle Komponent, sonst
  „—“). Keine Zeile `Vorher` — die schreibt nur ein
  Upgrade.
- **Buchungen** in die vorbereiteten Knoten:
  [[Commit-Sprache]], [[WorkspaceManager-Kontrakt]]
  (Betriebs-Konfiguration); die Freigaben der
  Ordner, die der SP-1-Steckbrief unter
  §Mitgebrachte Ordner deklariert, als Einträge in
  [[Entscheidungen]] — erst jetzt, nach der ersten
  Marke, je mit `zielmarke:` und Anlage-Datum; die
  Wahl aus Nr. 2 nach [[Two-Repo-Submodul-Muster]]
  (im Ein-Repo-Fall nur die Buchung).
- **`Tools.md`** aus `wiki/templates/Tools-Vorlage.md`
  anlegen: die Prüf-Werkzeuge deiner Umgebung und
  der Ersatzweg aus Nr. 6 (§Prüf-Werkzeuge),
  `_template/tools/lint.sh` als Template-Werkzeug
  (§Projekt-Skripte, nur lesen, keine Kopie ins
  Projekt-`tools/`), bei einer Komponente Start und
  Transport aus dem Startprompt (§Peer-Agenten).
- **Rolle Koordinator:** Contract-Index aktivieren —
  Skelett aus
  `_template/referenzprozesse/SP-1-Standardprozess/wiki/`
  ins Projekt-`wiki/`, Bootstrap aus
  `_template/referenzprozesse/SP-1-Standardprozess/bootstrap/`
  abarbeiten (Quelle Nur-Lese), [[Fassaden]]
  nachführen (`active: true`, Zeile nach „Aktive
  Fassaden“). **Rolle Komponent:** eigene Zeile und
  die Lage des Koordinators in §Komponenten von
  [[Softwaresystemarchitektur]]; Kette nach
  [[Kettenpruefung]] §Komponenten-Kette nach
  Übernahme-Art.
- **Mission/Facts-Bootstraps** abarbeiten (aus
  `_template/referenzprozesse/base/bootstrap/` —
  Quelle Nur-Lese, nichts löschen).
- **Instruktionsdatei** anlegen (deine native Datei,
  z.B. `CLAUDE.md`) nach MasterPrompt §8.3 /
  [[Instruktionsdatei-Pflege]] — einschließlich der
  eisernen Regel „Das `wiki/` ist die Quelle der
  Wahrheit“ (Wortlaut aus dem Grundgesetz oben);
  dazu `Styleguide-project.md` und
  `Styleguide-chat.md` (Kopiervorlage
  `wiki/templates/Styleguide-chat-Vorlage.md`).

## 5. Abschluss

Kein Selbst-Abbau nötig — dieses Dokument liegt nur
im Starter und bleibt in `_template/` lesbar;
`_template/` bleibt in beiden Modi dauerhaft im
Projekt.

- **Standarddateien** anlegen, die der Starter nicht
  mitliefert ([[Standarddateien-Katalog]]): die
  **Projekt-README** (Projekt-Kurzbeschreibung,
  Einstiege, Instruktionsdatei; Verweis auf die
  Erklärung in `_template/docs/Einfuehrung.md` und
  für spätere Stände auf `_template/README.md`) und
  **`TODO.md`** (offene Punkte des Anwenders; bei
  Kollision (a) oder (c) mit dem Link auf
  `TODO-vorgefunden.md`).
- **Chronologie-Eintrag** „Projekt aus
  referenzprozess-softwareentwicklung angelegt
  (Template-Stand 2.0 seit <Datum>, Quelle <Commit/
  Tag>, Modus A/B)“ — Werte wie im Herkunfts-Vermerk.
- `devstate_active.md` nachführen (Zielmarke,
  nächste Schritte).
- **Lint:** `sh _template/tools/lint.sh` aus dem
  Projekt-Root ohne FEHLER (den Stichtag liest er aus
  dem Herkunfts-Vermerk).
- **Erster eigener Commit**, danach Push aufs
  Remote aus dem Fragen-Block (Remote-Einrichtung
  nur auf die dort gegebene Anweisung).

Ab hier gilt der normale Betrieb nach MasterPrompt —
beim nächsten Sessionstart läuft der reguläre
Ablauf (§5.3).

---

**Bleibt Verweis (steht bewusst nicht hier):**
Fassaden-Auswahl-Mechanik, Konzept-Angebot,
Mission-Statement-Setup-Detail, Phase-D-Turn-Logik,
Startprompt-Tabelle → [[Init-Choreografie]];
Sessionstart-Phasen A–E, Commit-Regeln,
Ordner-Semantik → MasterPrompt.
