# Outgoing — Versandpipeline

**Stand: 23.08.2026**

Dieses Dokument beschreibt die vollständige Logik des
`outgoing/`-Ordners und der zugehörigen Versandpipeline.
Es ist eine Teildatei des MasterPrompts und gilt
zusammen mit den Regeln aus `MasterPrompt.md`.

## 1. Abgrenzung zu `output/`

| Aspekt | `output/` | `outgoing/` |
|---|---|---|
| Inhalt | eingefrorene Übergabe-Stände (z.B. Stellungnahme, Angebot, Bericht; auch Agent-zu-Agent-Übergaben) | Versandstand-Ordner (Anschreiben, Anlagen-Kopien, Versand-Metadaten, erzeugte Artefakte) |
| Versionierung | ja, `_VV_TLA`-Kette | **nein**, Zeitstempel im Ordnernamen reicht |
| Unveränderlichkeit | pro Version | ganzer Ordner ab Erzeugung |
| Erzeugung | KI und User iterativ | einmalig aus finalen `output/`-Fassungen (als Kopien in den Ordner) |
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
    └── Leistungsverzeichnis.pdf ← versandte Anlagen-Kopien
```

- **Ordner-Name:** `YYYY-MM-DD HH-mm - <Adressat> -
  <Benennung>/` — der Zeitstempel sortiert
  chronologisch und disambiguiert mehrere Versände
  am selben Tag. Sonderzeichen nach MasterPrompt
  §3.7.
- **`Anschreiben.md`** ist der feste Einstiegspunkt
  je Ordner (Versand-Frontmatter + Brieftext).
- Keine Versionsnummer (`_VV_TLA` entfällt) — ein
  Versandstand-Ordner ist als Ganzes unveränderlich;
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

# Versandkanäle
via: [post, fax, email]

# Review (Pflichtfeld, §3.2 und §6 Schritt 3)
review: REP-012
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

#### Versandkanäle

- **`via`** — Liste der vorgesehenen Kanäle. Erlaubte
  Werte: `post`, `fax`, `email`. Der WorkspaceManager
  erzeugt pro genanntem Kanal das passende Artefakt.

#### Review

- **`review`** — **Pflichtfeld** vor der
  Artefakt-Erzeugung (§6 Schritt 3): entweder der
  Verweis auf den Prüf-Bericht (`REP-NNN`, ggf.
  mehrere) oder `verzichtet` (bewusste
  Anwender-Entscheidung nach Angebot, mit benanntem
  Impact im Angebots-Dialog). Ein
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
   `_VV_TLA`-Kette bis zur finalen Fassung.
2. User oder KI legt den **Versandstand-Ordner** an
   (`YYYY-MM-DD HH-mm - <Adressat> - <Benennung>/`):
   - `Anschreiben.md` mit Versand-Metadaten im
     YAML-Frontmatter und Anschreibentext im Body
   - die finalen Fassungen als **Kopien** in den
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
   dokumentiert. Ergebnis eines Reviews landet als
   REP-Knoten (MasterPrompt §5.6), das
   `review:`-Feld verweist darauf; Befunde werden
   vor der Erzeugung eingearbeitet (neue
   `output/`-Fassung → Kopie im Ordner
   aktualisieren, solange noch nichts erzeugt ist).
4. Der WorkspaceManager verarbeitet je Ordner das
   `Anschreiben.md` und legt die Artefakte (`.pdf`,
   `.eml`, `.docx`) daneben ab; bei Kanal-Limits
   (z.B. Fax-Seitenlimit) als Teil-Sendungen
   `Teil-N.pdf` im selben Ordner.
5. Der Versandstand-Ordner ist ab Erzeugung als
   Ganzes **unveränderlich**. Muss später erneut
   versendet werden, entsteht ein neuer Ordner mit
   neuem Zeitstempel.

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
  (inkl. `_VV_TLA` — Herkunfts-Beleg im Namen).

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
