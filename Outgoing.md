# Outgoing — Versandpipeline

**Bearbeitungsstand: 2026-11-11**

Dieses Dokument beschreibt die vollständige Logik des
`outgoing/`-Ordners und der zugehörigen Versandpipeline.
Es ist eine Teildatei des MasterPrompts und gilt
zusammen mit den Regeln aus `MasterPrompt.md`.

## 1. Abgrenzung zu `output/`

| Aspekt | `output/` | `outgoing/` |
|---|---|---|
| Empfänger | Menschen, andere Agenten und Repos | nur Menschen |
| Inhalt | eingefrorene Übergabe-Stände (z.B. Stellungnahme, Angebot, Bericht; auch Agent-zu-Agent-Übergaben) und Nachrichten im Verbund (`output/nachrichten/`, MasterPrompt §1.5) | Versandstand-Ordner (Anschreiben, Anlagen-Kopien, Versand-Metadaten, erzeugte Artefakte) |
| Versionierung | ja, `_VV_TLA`-Kette | **nein**, Zeitstempel im Ordnernamen reicht |
| Unveränderlichkeit | pro Version | versandter Inhalt ab Erzeugung eingefroren; Ergänzung nur in `nachweis/` und durch angehängte Vermerke (§2) |
| Erzeugung | KI und User iterativ | einmalig aus finalen `output/`-Versionen (als Kopien in den Ordner) |
| Artefakte | `.md` als Arbeitsformat | `Anschreiben.md` als Quelle + `.pdf`, `.eml`, `.docx` + Anlagen-Kopien (erzeugt vom WorkspaceManager, bzw. Agent-Fallback nach §4.1) |

## 2. Dateistruktur — Versandstand-Ordner

Je Versand **ein Ordner** (einheitlich — auch der
Ein-Brief-Fall ohne Anlagen):

```
outgoing/
└── 2026-04-20 14-30 - Stadtwerke Mittelbach - Stellungnahme Angebot 2026-117/
    ├── Anschreiben.md      ← Quelle mit Versand-Frontmatter (§3)
    ├── Anschreiben.pdf     ← erzeugt (post/fax)
    ├── Anschreiben.eml     ← erzeugt (email)
    ├── 2026-04-15 - Vogelsang GbR - Stadtwerke Mittelbach - Stellungnahme - Angebot 2026-117_03_AIG.md
    ├── Leistungsverzeichnis.pdf ← versandte Anlagen-Kopien
    └── nachweis/           ← Belege nach dem Versand, nur hinzufügen
        ├── Nachweise.md    ← Liste der Nachweise (Datum, Datei, Art, Prüfvermerk)
        ├── 2026-04-20 Sendebericht Fax.pdf
        └── 2026-04-23 Empfangsbekenntnis.pdf
```

- **Ordner-Name:** `YYYY-MM-DD HH-mm - <Adressat> -
  <Benennung>/` — der Zeitstempel sortiert
  chronologisch und disambiguiert mehrere Versände
  am selben Tag. Sonderzeichen nach MasterPrompt
  §3.7.
- **`Anschreiben.md`** ist der feste Einstiegspunkt
  je Ordner (Versand-Frontmatter + Brieftext).
- Keine Versionsnummer (`_VV_TLA` entfällt);
  erneuter Versand = neuer Ordner mit neuem
  Zeitstempel.
- **Anlagen liegen als versandte Kopien im Ordner**
  (byte-genauer Versand-Nachweis — `output/` lebt
  weiter, der Ordner friert ein). Die Kopien behalten
  ihren Original-Dateinamen inkl. `_VV_TLA` — damit
  ist die Herkunfts-Version im Namen belegt.
- **Mehrteiler** (z.B. Fax-Seitenlimit): die
  Teil-Sendungen liegen als `Teil-1.pdf`,
  `Teil-2.pdf` … im selben Ordner.
- Erzeugte Artefakte (`.pdf`, `.eml`, `.docx`) liegen
  neben dem `Anschreiben.md` im Ordner.
- **Unveränderlichkeit — Nachweise wachsen nur.** Der
  **versandte Inhalt** des Ordners (`Anschreiben.md`,
  erzeugte Artefakte, Anlagen-Kopien, Teil-Sendungen)
  ist ab Erzeugung eingefroren: Er ist der
  byte-genaue Nachweis dessen, was der Empfänger
  bekommen hat, und wird **nie geändert, nur
  ergänzt** (Grundsatz für Nachweise und
  eingefrorene Stände: [[Einfrieren-und-Abloesen]]
  §Nachweis). Ergänzt wird auf zwei Wegen:
  - durch Dateien im Unterordner **`nachweis/`** —
    Sendebericht, Eingangsbestätigung,
    Empfangsbekenntnis, Zustellnachweis, Quittung
    eines Portals; dort wird nur hinzugefügt, nie
    überschrieben oder gelöscht; jede Ergänzung
    trägt einen datierten Vermerk: das Datum im
    Dateinamen und eine Zeile in der **Liste der
    Nachweise** `nachweis/Nachweise.md` (Datum,
    Datei, Art, Prüfvermerk „gegen das Paket
    geprüft“); diese Liste liegt in `nachweis/`, nicht
    im eingefrorenen `Anschreiben.md`;
  - durch den **angehängten, datierten Vermerk**
    „zurückgezogen am … (<Entscheidung>)“ am Ende des
    `Anschreiben.md` unter dem Brieftext (§6a) — der
    einzige Fall, in dem eine Datei des versandten
    Inhalts eine Ergänzung erhält.

  Das Prüfprogramm meldet eine geänderte Datei im
  eingefrorenen Inhalt; neue Dateien unter
  `nachweis/` und der angehängte Rückzugs-Vermerk sind
  kein Befund. Ein Fehler im Versandten wird nicht im
  Ordner korrigiert: erneuter Versand ist ein neuer
  Ordner, der Rückzug läuft nach §6a.

## 3. YAML-Frontmatter

Das Frontmatter steuert den Versand. Ein
automatisiertes Skript (WorkspaceManager) liest die
`.md`-Datei und findet darin alle Felder, um Briefe zu
drucken, Faxe zu versenden oder Emails zu erzeugen.

### 3.1 Vollständiges Beispiel

```yaml
---
# Template-Auswahl
documentclass: scrlttr2
classoption: [DIN5008B, fromalign=left, foldmarks=true]
lang: de-DE

# Absender
fromname: Vogelsang GbR
fromaddress: |
  Beispielweg 1
  62318 Mittelbach
fromphone: +49 700 123456
fromfax: +49 700 123457
fromemail: kontakt@vogelsang-gbr.example

# Empfänger
toname: Stadtwerke Mittelbach
toaddress: |
  Postfach 123
  62314 Mittelbach
tofax: +49 700 123456-11
toemail: vergabe@stadtwerke-mittelbach.example

# Brief-Metadaten
date: 2026-04-20
subject: Stellungnahme zum Angebot 2026-117 vom 11.03.2026
yourref: 2026-117
myref: ABC-2026-042
opening: Sehr geehrte Damen und Herren,
closing: Mit freundlichen Grüßen
signature: A. Vogelsang

# Anlagen
encl:
  - Stellungnahme (3 Seiten)
  - Leistungsverzeichnis
attachments:
  - 2026-04-15 - Vogelsang GbR - Stadtwerke Mittelbach - Stellungnahme - Angebot 2026-117_03_AIG.md
  - Leistungsverzeichnis.pdf
pruefsumme:
  - "2026-04-15 - Vogelsang GbR - Stadtwerke Mittelbach - Stellungnahme - Angebot 2026-117_03_AIG.md: sha256:3f1a…"
  - "Leistungsverzeichnis.pdf: sha256:9c0e…"

# Versandkanäle
via: [post, fax, email]

# Review (Pflichtfeld, §3.2 und §6 Schritt 3)
review: REP-<NNN>
---

wir nehmen hiermit Stellung zum Angebot …
```

### 3.2 Feldkategorien

#### Template-Auswahl

- **`documentclass`** — identifiziert das Pandoc-
  Template, das der WorkspaceManager nutzt.
  Zentrale Werte siehe §5.
- **`classoption`** — Template-Parameter als Liste.

#### Absender / Empfänger

Standard-scrlttr2-Felder (`from…`, `to…`).

- **Pflicht:** `toname`, `toaddress`.
- **Empfohlen:**
  - `tofax` — für automatischen Fax-Versand, wenn
    vorhanden.
  - `toemail` — für Email-Versand.

#### Brief-Metadaten

`date`, `subject`, `yourref`, `myref`, `opening`,
`closing`, `signature`.

#### Anlagen

- **`encl`** — menschlich lesbare Liste für den
  Anlagen-Vermerk im Brief.
- **`attachments`** — die Anlagen-Dateien **im
  Versandstand-Ordner** (relative Namen; die Kopien
  werden bei Ordner-Anlage aus `output/` bzw. der
  Quelle hereinkopiert und behalten ihren
  Original-Dateinamen inkl. Versions-Suffix).
  Erlaubte Formate: `.md`, `.pdf` und andere, die der
  WorkspaceManager mit-ausliefern oder als
  MIME-Anhang beigeben kann.
- **`pruefsumme`** — je Anlage eine Zeile
  `<Dateiname>: <Verfahren>:<Wert>` (z.B. `sha256:`),
  gesetzt bei der Erzeugung des Versandstands über die
  Kopien im Ordner. Das Feld ist Basis in jedem
  Prozess, der versendet: Es belegt, dass die Kopie im
  Ordner die versandte Datei ist, und erlaubt den
  Abgleich mit dem freigegebenen Paket; Prozesse mit
  Einreichungs-Pflichten nutzen es für ihre
  Paketprüfung. Ohne Anlagen entfällt das Feld.

#### Versandkanäle

- **`via`** — Liste der vorgesehenen Kanäle. Die
  Kanal-Liste ist **eine Liste der Basis**, offen mit
  Grundbestand; die Basis teilt sie nicht auf
  Prozesse auf (Kanäle sind Infrastruktur, nicht
  Fachliches — was ein Kanal fachlich bedeutet, etwa
  formgerechte Einreichung oder Zustellung, sagt der
  Prozess). Grundbestand der **ausgehenden Kanäle**:
  `post`, `einschreiben`, `fax`, `email`, `bote`,
  `persoenlich`, `plattform` (Portal oder
  Vergabeplattform), `datenraum`, `mjp` (Mein
  Justizpostfach), `bea` (besonderes elektronisches
  Anwaltspostfach), `elster`, `behoerdenportal`,
  `erklaerung-zu-protokoll` (Geschäftsstelle oder
  Rechtsantragsstelle), `muendlich-termin` (Erklärung
  im Termin), `anwalt-zu-anwalt` (Zustellung von
  Anwalt zu Anwalt), `hybridpost` (Hybrid- bzw.
  E-Post) sowie weitere sichere Übermittlungswege
  (Behördenpostfach, Bürger- und
  Organisationenpostfach, Postfach eines
  Nutzerkontos, De-Mail soweit angeboten). **Eingehende
  Wege** (für das Register der Eingangsdokumente,
  Zustellart): zusätzlich Zustellung durch
  Gerichtsvollzieher, Empfangsbekenntnis,
  Bereitstellung zum Abruf, öffentliche Zustellung,
  Telefonat oder Gespräch als Aktenvermerk.
  Der WorkspaceManager erzeugt für `post`, `fax` und
  `email` das passende Artefakt (§4); Kanäle ohne
  Artefakt-Erzeugung gelten als **manuell** — der
  Mensch versendet, der Agent hält Kanal und Nachweis
  fest. `einschreiben` steht gleichrangig, ohne
  Kennzeichnung. Versendet wird immer durch einen
  Menschen.
- **Welche Kanäle ein Projekt nutzt, legt der
  Anwender fest.** Der Init bietet die ganze Liste an
  und fragt nach den Kanälen des Projekts
  ([[Init-Choreografie]] §Init-Fragen); die Wahl steht
  in `Tools.md` §Kommunikationskanäle. Beim Versand
  schlägt der Agent die gewählten Kanäle vor; jeder
  andere Kanal der Liste bleibt auf Zuruf nutzbar.
  Trägt eine Stelle einen geprüften Versandweg mit
  **Seiten- oder Anlagengrenze** (etwa Fax), richtet
  sich das Paket danach (Teil-Sendungen, §2); wo der
  Prozess solche Grenzen je Stelle führt, sagt sein
  Katalog.

#### Review

- **`review`** — **Pflichtfeld** vor der
  Artefakt-Erzeugung (§6 Schritt 3): entweder der
  Verweis auf den Prüf-Bericht (`REP-NNN`, ggf.
  mehrere) oder `verzichtet` (bewusste
  Anwender-Entscheidung nach Angebot, mit benanntem
  Impact im Angebots-Dialog; im Verfahrens-Prozess
  kein zulässiger Wert, §6b). Ein
  Versandstand-Ordner ohne gefülltes `review:`-Feld
  ist ein Wächter-Befund (MasterPrompt §5.3 C7) —
  gemeldet, nicht blockiert.

## 4. Erzeugte Artefakte

Der WorkspaceManager erzeugt je nach `via` (bzw. Agent-
Fallback nach §4.1, falls kein WorkspaceManager
verfügbar):

- **`post`** → `.pdf` (druckfertig)
- **`fax`** → `.pdf` plus Fax-Header mit `tofax`
- **`email`** → `.eml` mit `toemail` als Empfänger,
  HTML-Body aus Markdown-Konvertierung und
  `attachments` als MIME-Anhänge

**Die KI sorgt nur dafür, dass die `.md`-Quelle
stimmt.** Ob, wie und wann tatsächlich versendet wird,
ist nicht Teil des KI-Auftrags.

### 4.1 Fallback ohne WorkspaceManager

Wenn der User keinen WorkspaceManager für die
Outgoing-Erzeugung hat (Init-Frage MasterPrompt §5.3
Phase D, Vermerk im `internal-rule`-Knoten
[[WorkspaceManager-Kontrakt]]), übernimmt der Agent die
Erzeugung der Versand-Artefakte selbst mit seinen
Tools und APIs:

- **PDF/DOCX:** Pandoc direkt aufrufen, sofern
  verfügbar; alternativ eine Pandoc-fähige Skill/MCP.
  Fallback auf ein installiertes LaTeX oder Typst.
- **`.eml`:** MIME-Zusammenbau aus Frontmatter +
  Markdown → HTML (Pandoc oder ein
  Markdown-Renderer).
- **Templates:** Der Agent nutzt bekannte
  Standard-Templates (KOMA-Script `scrlttr2` mit
  `DIN5008B.lco` bei `documentclass: scrlttr2`,
  `letter-pro` bei `documentclass: typst-letter`
  etc.) — sofern die Toolchain vorhanden ist.

Regeln bleiben unverändert:

- Erzeugte Artefakte landen **im Versandstand-Ordner
  neben dem `Anschreiben.md`**.
- Regelbasierte Auswahl über `via` und
  `documentclass`.
- **On demand** — der Agent erzeugt nur, was
  angefordert ist; nicht prophylaktisch für alle
  `outgoing/`-Dateien.

Wenn eine benötigte Toolchain (z.B. Pandoc mit
KOMA-Script) beim User nicht installiert ist, weist
der Agent darauf hin und bittet um Installation
oder um Umschalten auf ein anderes `documentclass`,
das mit vorhandenen Tools erzeugbar ist.

## 5. Pandoc-Templates — zentrale Bereitstellung

Pandoc-Templates werden **zentral vom Workspace-
Manager** bereitgestellt, nicht pro Projekt. Das
Template-Verzeichnis liegt außerhalb des Projektroots.

Das Frontmatter-Feld `documentclass` wählt das Template
aus. Beispielhafter Katalog:

| `documentclass` | Zweck | Toolchain |
|---|---|---|
| `scrlttr2` | DIN-5008-Brief | Pandoc + KOMA-Script `scrlttr2` + `DIN5008B.lco` |
| `typst-letter` | Moderner Brief | Pandoc → Typst, `letter-pro` |
| `email-plain` | Reine Email | Pandoc MD → HTML → `.eml` |

Der Katalog gilt projektübergreifend. Projekte, die
ein zusätzliches Template brauchen, ergänzen es im
zentralen WorkspaceManager-Bestand.

## 6. Workflow

1. In `output/` entsteht der inhaltliche Entwurf
   (z.B. Stellungnahme, Angebot, Bericht) mit
   `_VV_TLA`-Kette bis zur finalen Version.
2. User oder KI legt den **Versandstand-Ordner** an
   (`YYYY-MM-DD HH-mm - <Adressat> - <Benennung>/`):
   - `Anschreiben.md` mit Versand-Metadaten im
     YAML-Frontmatter und Anschreibentext im Body
   - die finalen Versionen als **Kopien** in den
     Ordner (Original-Dateinamen bleiben), via
     `attachments` gelistet
3. **Pflicht-Review-Angebot** (vor jeder
   Artefakt-Erzeugung, ohne Ausnahme): der Agent
   bietet ein Review des Versandstands an —
   Minimum Zwei-Modelle-Regel, bei gewichtigen
   Dokumenten ein Muster nach `Reviewmuster.md`
   (Vorschlag im Angebot). Durchführung ist
   Anwender-Entscheid; „ohne Review versenden" ist
   zulässig, wird aber mit benanntem Impact
   angeboten und als `review: verzichtet`
   dokumentiert (nicht im Verfahrens-Prozess: dort
   gibt es keinen Verzicht auf die Prüfung, §6b).
   Ergebnis eines Reviews landet als
   REP-Knoten (MasterPrompt §5.6), das
   `review:`-Feld verweist darauf; Befunde werden
   vor der Erzeugung eingearbeitet (neue
   `output/`-Version → Kopie im Ordner
   aktualisieren, solange noch nichts erzeugt ist).
4. Der WorkspaceManager verarbeitet je Ordner das
   `Anschreiben.md` und legt die Artefakte (`.pdf`,
   `.eml`, `.docx`) daneben ab; bei Kanal-Limits
   (z.B. Fax-Seitenlimit) als Teil-Sendungen
   `Teil-N.pdf` im selben Ordner.
5. Der versandte Inhalt des Versandstand-Ordners ist
   ab Erzeugung **eingefroren** (§2). Muss später
   erneut versendet werden, entsteht ein neuer Ordner
   mit neuem Zeitstempel.
6. **Nachweise nach dem Versand** (Sendebericht,
   Eingangsbestätigung, Empfangsbekenntnis,
   Zustellnachweis, Quittung eines Portals) legt der
   Agent oder der Anwender in `nachweis/` des Ordners
   ab, mit Datum im Dateinamen und Zeile in
   `nachweis/Nachweise.md` (§2); der Agent prüft den
   Nachweis gegen das Paket. Erwartet das Projekt vom
   Empfänger eine Reaktion, läuft sie als Frist mit
   `richtung: für-uns` ([[Katalog-Fristen]]).

## 6a. Rückzug eines fehlerhaft versandten Stands

Stellt sich ein versandter Stand als fehlerhaft heraus
(falsche Anlage, falscher Adressat, falscher Inhalt),
gilt das Basis-Grundmuster **Rückzug eines verteilten
Stands** — führender Ort [[Lebenslauf-eines-Stands]]
§Rückzug: Fehler festhalten, Empfänger ermitteln
(hier: die Versandstand-Ordner), Anwender-Entscheidung
Rückzug / Berichtigung / Ersatz als Entscheidung,
Folge-Versand an alle Empfänger, Vermerk am alten
Stand, Erwartung „Bestätigung“ je Empfänger. Für
`outgoing/` heißt das:

- Der **Folge-Versand** ist ein neuer
  Versandstand-Ordner je Empfänger (Rücknahme-Schreiben,
  Berichtigung oder Ersatz); sein
  `Anschreiben.md` verweist auf den zurückgezogenen
  Ordner und auf die Entscheidung.
- Am alten Ordner wird nichts geändert; das
  `Anschreiben.md` erhält den **angehängten Vermerk**
  „zurückgezogen am JJJJ-MM-TT (<Entscheidung>)“, ggf.
  mit Verweis auf den Folge-Versand (§2).
- Je Empfänger legt der Agent die Erwartung
  „Bestätigung“ als Frist `richtung: für-uns` an; der
  Eingang der Bestätigung erfüllt sie.
- Ein zurückgezogener Stand ohne Folge-Versand an alle
  Empfänger ist ein Befund des Prüfprogramms (Stufe:
  [[Kettenpruefung]] §Lint-Anteil, Schwere-Tabelle).

Ein Prozess kann den Rückzug für seine Dokumente
eingrenzen (etwa: eine Prozesshandlung im Verfahren
wird nie über diesen Ablauf zurückgenommen); das steht
in seiner `Vorgehen-<Prozess>.md`.

## 6b. SP-2-Teil (gilt bei aktivem SP-2)

Im Verfahrens-Prozess trägt der Versandstand zusätzlich
(führender Ort: `Vorgehen-SP-2.md` §6 Versand und
Einreichung):

- **Zugang maßgeblich, nicht Absendung.** Der
  Versandstand-Ordner ist der Nachweis dessen, was
  hinausging; **eingereicht** ist eine Fassung erst mit
  dem Einreichungsnachweis und dem gebuchten Zugang
  (Datum, Art) im Register Einreichungen des
  Prozesses — der Einreichungs-Stand je Empfänger
  (Phase P13) setzt beides voraus.
- **Nachweise der Kanäle:** Sendebericht (Fax),
  Empfangsbekenntnis (Zustellung von Anwalt zu Anwalt,
  Gericht), Quittung bzw. Prüfprotokoll des Portals
  (beA, MJP, ELSTER, Behördenportal, weitere sichere
  Übermittlungswege), Eingangsbestätigung der Stelle,
  bei `muendlich-termin` das Protokoll — alle in
  `nachweis/` mit Zeile in `Nachweise.md` (§2); der
  Agent prüft sie gegen das Paket (Dateinamen,
  Seitenzahl, Prüfsummen) und bucht Zugang und Nachweis
  in der Einreichung.
- **Prüfsummen-Abgleich:** das Feld `pruefsumme` je
  Anlage (§3.2) wird gegen das freigegebene Paket des
  Schriftsatzes (Anlagenverzeichnis `## Anlagen` des
  Schriftsatz-Knotens) geprüft; eine Abweichung ist
  FEHLER und sperrt den Versandstand; nach dem Versand
  erkannt, meldet der Wächter sie mit der Prüfung des
  Rückzugs (§6a).
- **`review`-Inhalt:** der Verweis auf den Prüfbericht
  des Prüfplans (Phase P10) beim Marken-Schriftsatz;
  bei jedem anderen ausgehenden Dokument der Prüfbericht
  der inhaltlichen Prüfung — in SP-2 ist ein leeres
  `review` FEHLER, nicht nur Befund (§3.2 gilt für
  Projekte ohne SP-2 weiter). **Kein Verzicht auf die
  Prüfung:** „ohne Review versenden“ (§6 Schritt 3)
  gibt es in SP-2 nicht; `review: verzichtet` zählt
  nicht als Eintrag und ist derselbe FEHLER.
- **Vertraulichkeits-Prüfung gegen den Empfänger:** kein
  Inhalt im Paket darf eine höhere Stufe
  (`vertraulich`) tragen, als der Empfänger erhalten
  darf; Verstoß ist FEHLER.
- **Seiten- und Anlagengrenze je Stelle** aus dem
  geprüften Versandweg (Organisationen mit `authority`):
  Teil-Sendungen `Teil-N.pdf` mit Nachweis je Teil.
- **Grenze des Rückzugs:** eine Prozesshandlung wird nie
  über §6a zurückgenommen, nur über Strategie und
  Anwender-Entscheidung (`Vorgehen-SP-2.md` §12).

## 7. Namenskonvention

Der **Versandstand-Ordner** heißt:

```
YYYY-MM-DD HH-mm - <Adressat> - <Benennung>/
```

- Zeitstempel mit Uhrzeit — disambiguiert mehrere
  Versände am selben Tag ohne weitere Pflichtfelder.
- `<Benennung>` frei nach MasterPrompt-§3.1-Geist
  (Dokumentname/Betreff/Gegenstand nach Bedarf),
  **ohne Versionsteil** (`_VV_TLA` entfällt — der
  Ordner ist der Stand).
- Im Ordner: `Anschreiben.md` als fester Name;
  Anlagen-Kopien behalten ihre Original-Dateinamen
  (inkl. `_VV_TLA` — Herkunfts-Beleg im Namen);
  Belege nach dem Versand im Unterordner `nachweis/`
  mit Datum im Dateinamen, dazu die Liste
  `nachweis/Nachweise.md` (§2).

Sonderzeichen werden gemäß MasterPrompt §3.7 ersetzt.

## 8. Commit-Regeln

`outgoing/`-Änderungen werden mit Präfix `Outgoing:`
committet (siehe MasterPrompt §6.2).

## 9. Quellen

Hintergrund-Recherche zu Pandoc, KOMA-Script und
Typst:

- [benedictdudel/pandoc-letter-din5008](https://github.com/benedictdudel/pandoc-letter-din5008)
- [JensErat/pandoc-scrlttr2](https://github.com/JensErat/pandoc-scrlttr2)
- [KOMA-Script DIN5008A.lco](https://komascript.de/DIN5008A.lco)
- [Sematre/typst-letter-pro](https://github.com/Sematre/typst-letter-pro)
- [Pandoc User's Guide](https://pandoc.org/MANUAL.html)
