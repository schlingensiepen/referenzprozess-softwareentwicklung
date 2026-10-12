# INIT — Neues Projekt aus diesem Starter

**Du liest dieses Dokument, weil ein neues Projekt
aus diesem Starter entstehen soll** — typischerweise
nach dem Start-Satz „Richte dieses Verzeichnis als
neues Projekt nach der Anleitung unter
https://github.com/schlingensiepen/referenzprozess-softwareentwicklung
ein." Das aktuelle Verzeichnis ist der
Projektordner. Du darfst dieses Dokument **direkt
von der Repo-URL lesen, bevor irgendetwas
eingebunden ist** — das ist der vorgesehene Weg;
lokal muss dafür nichts liegen. Dasselbe gilt für
jede Datei, auf die dieses Dokument verweist,
solange `_template/` noch fehlt: Raw-Pfad
`https://raw.githubusercontent.com/schlingensiepen/referenzprozess-softwareentwicklung/main/<pfad>`;
Wiki-Verweise `[[Name]]` meinen dabei
`wiki/Name.md`. Ab der Einbindung (Schritt 0) liest
du aus `_template/`, ab der Kopie (Schritt 1) die
Wiki-Knoten aus deinem Projekt-`wiki/`.

Dein Projekt-`wiki/` kommt
vorbereitet aus dem Starter — RP-1 (Entwicklung
eines Softwaresystems) auf SP-1 ist aktiviert, die
Vorfestlegungen bucht [[Aktivierter-Prozess]].
**Du baust kein wiki, du füllst eines.** Diese
Anleitung ist eine Kurz-Choreografie — sie regelt
nur, was am Starter-Fall besonders ist; alles
Übrige regeln MasterPrompt §5.3 und
[[Init-Choreografie]] (liegt nach dem Kopier-Schritt
als `wiki/Init-Choreografie.md` in deinem Projekt).
Die Verweise dieses Dokuments auf
MasterPrompt-Abschnitte und Wiki-Knoten sind
**Lese-Anweisungen** — die genannten Abschnitte
liest du selbstverständlich (die
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
Projekt kopiert.

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
MasterPrompt §1 („Anbindungs-Modi") gilt
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
>   „gepinnt" ist). Braucht beim Einrichten
>   Internet-Zugriff auf GitHub; wer dein Projekt
>   später klont, holt die Vorlage mit
>   `git clone --recursive` mit.
> - **A — eingefrorene Kopie der Vorlage, die
>   dauerhaft im Projekt bleibt, damit du immer
>   siehst, womit du gestartet bist** (technisch eine
>   Einmal-Kopie ohne Git-Verbindung, die mit deinem
>   Projekt gespeichert wird, ca. 1,5 MB). Neuere
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

**Herkunft vermerken (beide Modi):** Repo-URL und
Stand (Modus A: der eben abgelesene Commit/Tag;
Modus B: der Submodul-Pin aus
`git submodule status _template`) trägst du nach der
Kopie (Schritt 1) im Feld „Template-Herkunft" von
[[Aktivierter-Prozess]] ein.

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
  Fehlendes und listet Vorhandenes als Kollision.
  Kollisionen, deren Inhalt mit der Starter-Datei
  identisch ist, sind keine echten Kollisionen und
  entfallen aus der Liste.

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
| `wiki/` (komplett, inkl. `templates/`) | `wiki/` | vorbefülltes Frisch-wiki, inkl. deaktivierter Fassaden (z.B. `Mission Statement Long` — Reaktivierung per Zuruf) |
| `devstate_active.md` | `devstate_active.md` | Frisch-Fassung |

**Nie kopiert werden:** `referenzprozesse/` (bleibt
als Nur-Lese-Vorlage in `_template/referenzprozesse/`
— Steckbriefe, Skelette, `bootstrap/`-Ordner),
`README.md`, `INIT.md`, `migration/`, `docs/`,
`setup/`, `LICENSE`, `.git/`.

**Kollisionsregel:** nie eine vorhandene
Projekt-Datei überschreiben — bei Namensgleichheit
die Starter-Datei auslassen und die Kollisions-Liste
im Fragen-Block (Schritt 3) vorlegen.

## 2. git-Prüfung

- Existiert im Projektordner ein Repo? Wenn nein
  (in Schritt 0 abgelehnt oder übersprungen):
  `git init` erneut anbieten, nur nach Zustimmung
  ausführen; ohne Repo gilt der Fail-Safe aus
  MasterPrompt §5.3 A1.
- Modus B: ist das Submodul `_template/` eingebunden
  und gepinnt (`git submodule status`)? Modus A: ist
  `_template/` ein gewöhnlicher Ordner ohne eigenes
  `.git`? Ist die Template-Herkunft in
  [[Aktivierter-Prozess]] eingetragen (Schritt 0)?
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

## 3. Fragen-Block (ein einziger Turn)

Stelle dem Anwender **alle** folgenden Fragen in
einem Block (Fahrplan-Stil: nummeriert, je Punkt
dein Vorschlag zuerst — Ableitbares als Entwurf
vorlegen, nicht abfragen). Frage nichts, was schon
vorfestgelegt ist (siehe [[Aktivierter-Prozess]]);
die Fassaden-Auswahl entfällt als Frage — sie ist
Starter-Vorauswahl (siehe [[Fassaden]]), Hinweis:
Reaktivierung deaktivierter Fassaden per Zuruf.

1. **Mission/Auftrag** des Projekts — speist
   [[Mission Statement]] und [[Facts]]; deren
   Bootstrap-Dateien aus
   `_template/referenzprozesse/base/bootstrap/`
   arbeitest du danach ab.
2. **Erste Zielmarken** aus dem Auftrag
   (Marken-Dreiklang nach [[Zielmarken]] `## Meta`;
   Zeiger current/in-progress setzen).
3. **Commit-Sprache** — reguläres Menü
   (A Projektsprache / B Sprache folgt Artefakt /
   C Englisch; Vorauswahl bei Codeprojekten: B).
4. **Bearbeiter-TLA** (dreibuchstabiges Kürzel für
   die Versionierung, MasterPrompt §4.2).
5. **WorkspaceManager-Verfügbarkeit** — füllt die
   Betriebs-Konfiguration des
   [[WorkspaceManager-Kontrakt]] (Konvertierung und
   Outgoing-Erzeugung, je: vorhanden / Agent
   übernimmt selbst).
6. **RP-1-Rolle:** Standalone oder Koordinator?
   Bei „Koordinator": Contract-Index-Aktivierung aus
   `_template/referenzprozesse/RP-1-Systementwicklung/`
   ankündigen und das Werkstatt/Produkt-Angebot
   vorlegen ([[Two-Repo-Submodul-Muster]]).
7. **Remote-Ziel** (GitHub-Repo des Anwenders),
   falls nicht aus Schritt 2 ableitbar.
8. **Kollisions-Liste** aus Schritt 1, falls es
   Kollisionen gab (je Datei: Projekt-Fassung
   behalten oder manuell zusammenführen?).

## 4. Umsetzung der Antworten

- Buchungen in die vorbereiteten Knoten:
  [[Commit-Sprache]], [[WorkspaceManager-Kontrakt]]
  (Betriebs-Konfiguration), [[Zielmarken]] (Marken +
  Zeiger), RP-1-Rolle in [[Aktivierter-Prozess]].
- Mission/Facts-Bootstraps abarbeiten (aus
  `_template/referenzprozesse/base/bootstrap/` —
  Quelle Nur-Lese, nichts löschen).
- **Instruktionsdatei** anlegen (deine native Datei,
  z.B. `CLAUDE.md`) nach MasterPrompt §8.3 /
  [[Instruktionsdatei-Pflege]] — einschließlich der
  eisernen Regel „Das `wiki/` ist die Quelle der
  Wahrheit" (Wortlaut aus dem Grundgesetz oben).

## 5. Abschluss

Kein Selbst-Abbau nötig — dieses Dokument liegt nur
im Starter und bleibt in `_template/` lesbar;
`_template/` bleibt in beiden Modi dauerhaft im
Projekt.

- **Projekt-README** anlegen:
  Projekt-Kurzbeschreibung, Regelwerks-Einstieg,
  Verweis auf die Erklär-Doku in `_template/docs/`.
- Chronologie-Eintrag „Projekt aus
  referenzprozess-softwareentwicklung initialisiert
  (Starter-Stand <Commit/Tag>, Modus A/B)" — Stand
  wie in [[Aktivierter-Prozess]] vermerkt.
- DEC-Zeile für die Init-Entscheide (Anbindungs-
  Modus, Commit-Sprache, Rolle, Zielmarken) im
  Entscheidungs-Register.
- `devstate_active.md` nachführen (Zielmarke,
  nächste Schritte).
- **Erster eigener Commit**, danach Push aufs
  Remote aus dem Fragen-Block (Remote-Einrichtung
  nur auf die dort gegebene Anweisung).

Ab hier gilt der normale Betrieb nach MasterPrompt —
beim nächsten Sessionstart läuft der reguläre
Ablauf (§5.3).

---

**Bleibt Verweis (steht bewusst nicht hier):**
Fassaden-Auswahl-Mechanik, Konzept-Angebot,
Mission-Statement-Setup-Detail, Phase-D-Turn-Logik →
[[Init-Choreografie]]; Sessionstart-Phasen A–E,
Commit-Regeln, Ordner-Semantik → MasterPrompt.
