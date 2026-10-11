---
type: internal-concept
---

# Standarddateien-Katalog

Beschreibungs-Katalog der Standarddateien im
Projektroot: Zweck, Mitliefer-Status und
Anlage-Zeitpunkt je Datei. Wortlaut aus MasterPrompt
§2 (Katalog-Teil §2.1–2.14) hierher verlagert; die
Kurzliste „diese Dateien existieren" bleibt in
MasterPrompt §2. Moment: Nachschlag bei Datei-Anlage
und bei Fragen zu einer Standarddatei.

## 2.1 MasterPrompt.md

Dieses Dokument. Wird nur auf Anweisung des Users
gelesen.

## 2.2 Wiki.md, Outgoing.md

Teildateien zu den jeweiligen Themenkomplexen. Werden
bei Bedarf konsultiert.

## 2.3 KI-Agent-Instruktionsdatei

Agent-spezifisch: `CLAUDE.md` (Claude Code),
`.cursorrules` (Cursor), `.windsurfrules` (Windsurf)
etc. Wird bei Sessionstart automatisch geladen.
Details MasterPrompt §8.

**Template:** wird nicht mitgeliefert. Der Agent legt
sie beim Init an (MasterPrompt §5.3).

## 2.4 Styleguide.md

Allgemeine Schreibanweisungen (Tonfall, Anrede,
Formulierung). Mitgeliefert.

## 2.5 Styleguide-project.md

Projektspezifische Schreibanweisungen, die den
allgemeinen Styleguide ergänzen oder überschreiben
(Terminologie, Eigennamen, Fachbegriffe).

**Template:** wird nicht mitgeliefert. Der Agent legt
sie beim Init an.

## 2.6 Styleguide-md.md

Markdown-Konventionen für User-Facing Dateien.
Mitgeliefert. Geltungsbereich in der Datei selbst
präzisiert.

## 2.7 Styleguide-wiki.md

Strukturstandard für Wiki-Knoten. Mitgeliefert.

## 2.7a Styleguide-chat.md

Konventionen für die **Chat-Interaktion** zwischen
Agent und User (Ton, Struktur mehrteiliger
Diskussionen, Auswahlmenüs). Ergänzt die anderen
Styleguides (die schreibende Ausgaben regeln) um
die Gesprächsführung.

**Template:** wird nicht mitgeliefert. Der Agent
legt sie beim Init aus der Kopiervorlage
`wiki/templates/Styleguide-chat-Vorlage.md` an
(Standard-Textbaustein; beim allerersten Init über
die Template-Quelle erreichbar); der User kann sie
danach anpassen.

## 2.8 Fassaden im Wiki

Fassaden im Wiki stellen sich selbst vor — jede
Fassaden-Datei trägt ihre Betriebs-Semantik in der
eigenen `## Meta`-Sektion; Übersicht und
Aktivierungs-Status aller Fassaden führt
`wiki/Fassaden.md` (FassadenLandkarte). Den
Fassaden-Katalog mit mandatory/optional-Einstufung
beschreibt `Wiki.md` §3a.

## 2.9 Tools.md

Verzeichnis aller installierten MCPs und
Agent-Erweiterungen (Skills, Rules, Workflows je nach
Agent) sowie der Projekt-Skripte im Ordner `tools/`
(MasterPrompt §1.9). Details MasterPrompt §7.

**Template:** wird nicht mitgeliefert. Der Agent legt
sie an, sobald das erste Tool installiert wird.

## 2.10 Offene Fragen.md (optional)

Offene Fragen aus dem Arbeitsmodus (MasterPrompt §5.1.3). Wird
beim Sessionstart mit hoher Priorität gelesen.

**Template:** wird nicht mitgeliefert. Der Agent legt
sie beim ersten Eintrag an.

## 2.11 TODO.md

Offene Punkte und Erinnerungen des Users. Die KI
prüft beim Sessionstart und bei relevanten Aufgaben,
fügt aber nur auf Anweisung neue Einträge hinzu.

**Template:** wird nicht mitgeliefert. Der Agent legt
sie beim Init an.

## 2.12 docsources.yml

Quellen-Definition für den WorkspaceManager.
Optional. Details MasterPrompt §1.3.1.

## 2.13 Index-Dateien

Indizes im Root plus einer im Wiki:

- **`index.md`** — Gesamtindex, verlinkt die
  Teilindizes.
- **`index-output.md`** — Metadaten aller
  Ausgangsdokumente in `output/`.
- **`index-overview.md`** — Metadaten aller
  Übersichtsdokumente in `overview/`.
- **`wiki/index.md`** — Wiki-Katalog; siehe
  `Wiki.md`.

**Template:** werden nicht mitgeliefert. Der Agent
legt sie beim Init an.

### Index-Format (für index-output.md und index-overview.md)

Je Eintrag: Dateiname als Überschrift,
Metadaten-Felder (nicht Zutreffendes weglassen) und
eine Kurzzusammenfassung in 4–8 Sätzen. Das
vollständige Eintragsformat samt Regeln liegt als
Kopiervorlage unter
`wiki/templates/Index-Format-Vorlage.md`.

## 2.14 README.md

Der **verzweigende Einstieg** für Ankommende. Die
README erklärt das Projekt nicht, sondern benennt
die zwei, drei tatsächlichen Aufgaben, die anfallen,
und verweist je Aufgabe auf die zugehörige Anweisung
— kurz genug, dass sie vor der Arbeit gelesen wird.
Wo mehrere Einstiegs-Orte üblich sind (z.B. README
und Instruktionsdatei), ist einer führend und die
anderen zeigen darauf. Mitgeliefert; der Agent passt
sie beim Init an das Projekt an.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzform: MasterPrompt §2 (Kurzliste der
  Standarddateien)
- Kopiervorlagen in `wiki/templates/`: §2.7a
  (Styleguide-chat), §2.13 (Index-Format); das
  Tools.md-Gerüst beschreibt MasterPrompt §7.5
