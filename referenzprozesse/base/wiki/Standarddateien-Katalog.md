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

Agent-spezifisch; jeder Agent erzeugt seine eigene
native Datei. Die Vorlage nennt dafür **keinen
Dateinamen**: Sie weiß nicht, in welchem Harness
(der Umgebung, in der der Agent läuft) sie gelesen
wird. Es gilt:

1. **Nimm die für dich passende.** Der Agent legt die
   Datei an, die **sein eigener Harness beim
   Sessionstart automatisch lädt** — unter dem Namen
   und an dem Ort, den dieser Harness erwartet.
2. **Selbst feststellen.** Welche Datei das ist,
   stellt der Agent selbst fest: aus der Dokumentation
   und der Konvention seines Harness, aus dem, was der
   Harness ihm über sich mitteilt, oder aus einer
   Datei dieser Art, die im Projekt schon liegt. Er
   übernimmt keinen Namen aus einem Beispiel, nur
   weil er dort steht.
3. **Wahl festhalten.** Der Agent hält fest, welche
   Datei er für welchen Harness gewählt hat und woraus
   er das entnommen hat: in `Tools.md`, Kategorie
   „Instruktionsdateien“ (Kopiervorlage
   `wiki/templates/Tools-Vorlage.md`), je Harness ein
   Eintrag. Im Erledigt-Block nennt er die Datei.
4. **Unsicherheit melden.** Kann der Agent nicht
   sicher feststellen, welche Datei sein Harness lädt
   — oder lädt der Harness mehrere Namen —, sagt er
   das dem Anwender, nennt seine Wahl mit Grund und
   trägt „unsicher“ in den Eintrag ein. Der Nachweis
   ist eine zweite Sitzung: Kennt der Agent dort die
   eisernen Regeln, ohne den MasterPrompt gelesen zu
   haben, ist die Datei die richtige.
5. **Eine Datei je Harness.** Lädt ein Harness mehrere
   Dateinamen, legt der Agent eine Datei an. Verlangt
   der Harness eine zweite, verweist sie auf die erste
   und wiederholt deren Inhalt nicht.

Mehrere Instruktionsdateien verschiedener Agenten
dürfen im selben Projekt koexistieren; jeder Agent
pflegt nur seine. Die Datei wird beim Sessionstart
automatisch geladen. Grundsatz, Rolle,
Pflichtabschnitte: MasterPrompt §8.

**Beispiele, keine Regel.** Die folgende Tabelle zeigt,
wie solche Dateien zum Zeitpunkt der Niederschrift bei
einigen Harnesses hießen. Sie ist weder vollständig
noch verbindlich und kann veraltet sein; maßgeblich ist
Punkt 2.

| Harness (Beispiel) | Instruktionsdatei (Beispiel) |
|---|---|
| Claude Code | `CLAUDE.md` |
| Cursor | `.cursorrules` |
| Windsurf | `.windsurfrules` oder `.windsurf/rules` |

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

Dazu führt `Tools.md` die vom Anwender beim Init
gewählten **Kommunikationskanäle** (Abschnitt
„Kommunikationskanäle“; Liste und Angebots-Regel:
`Outgoing.md` §3.2) und die **Ausnahmen der
Geheimnis-Prüfung** (Abschnitt „Ausnahmen der
Geheimnis-Prüfung“: Pfad und Grund je dauerhaftem
Fehlalarm; MasterPrompt §6.3).

**Template:** Kopiervorlage mit den Kategorien
`wiki/templates/Tools-Vorlage.md`. Der Agent legt
`Tools.md` an, sobald das erste Tool installiert oder
die erste Werkzeug-Wahl getroffen wird (Vorgehen.md
§7b) — spätestens mit der Kanal-Frage im Init.

## 2.10 Offene Fragen.md

Persistenz aller offenen Fragen an den Anwender, **in
jedem Modus**: Was nicht im selben Zug beantwortet
wird, steht hier — auch eine Briefing-Kette, aus der
der Anwender ausgestiegen ist (MasterPrompt §5.2). Wird
beim Sessionstart mit hoher Priorität gelesen; eine
unabgeschlossene Kette bietet der Agent zur Fortsetzung
an.

**Template:** wird als **Rumpf** mitgeliefert
(Platzhalter-Grundsatz, Wiki.md §3a) und beim Init
unverändert ins Projekt-Root übernommen; der Agent
trägt ab der ersten offenen Frage ein. Ein Upgrade legt
die Datei nur an, wo sie fehlt.

## 2.11 TODO.md

Offene Punkte und Erinnerungen des Anwenders. Die KI
prüft beim Sessionstart und bei relevanten Aufgaben,
fügt aber nur auf Anweisung neue Einträge hinzu. Als
Anweisung gilt auch die Antwort des Anwenders auf die
Frage, wann der Agent ihm eine offene Frage erneut
stellen soll (Datum oder Anlass): Diese Wiedervorlage
trägt der Agent ohne weitere Rückfrage ein, führt sie
fort, bis der Anwender die Frage entschieden hat, und
erledigt sie mit dieser Entscheidung. **Keine
Erwartungen an Dritte:** Was ein Dritter uns schuldet
(Antwort, Entscheidung, Lieferung, Bestätigung), ist
keine Wiedervorlage, sondern eine Frist mit
`richtung: für-uns` in `wiki/Fristen.md`
([[Katalog-Fristen]]); hier stehen nur eigene Fragen
und Erinnerungen. Abläufe: die
Nachfrage nach der Bestätigung einer ausgelieferten
Behebung — bei der Freigabe des Deploy-Stands wie nach
einer Antwort „noch nicht“ — in SP-1 `Anforderungen.md`
„Fehlerbehebungen“; das vertagte Angebot einer Fassade
— die Antwort „Später“ samt Zeitpunkt — in `Wiki.md`
§3a „Fassaden-Promotion“.

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
sie beim Init an das Projekt an: die mitgelieferte
README ist die des Templates — ihre Links auf `docs/`
und `referenzprozesse/…` zeigen im Projekt-Root ins
Leere, weil beides in `_template/` bleibt. Der Agent
ersetzt sie durch das Projekt (Zweck, Einstiege,
Instruktionsdatei) und verweist für die Erklärung der
Vorlage auf `_template/docs/Einfuehrung.md` bzw. für
den Update-Weg auf `_template/README.md` §Template
aktualisieren; der Startweg „Lies … und setze das
Projekt auf“ entfällt in der Projekt-README, ebenso
die Zeile „Version der Vorlage“ (mit welchem Stand das
Projekt arbeitet, steht im Herkunfts-Vermerk).

## 2.15 devstate_active.md

**Einstieg jedes Projekts.** Wer das Projekt
erschließen will — ein anderer Agent, ein
abgespaltenes Projekt über den Übergabe-Punkt
([[Zuschnitt-aendern]]), ein Mensch —, beginnt hier.
Die Datei trägt den aktuellen Stand in wenigen Sätzen
(erste Zeile „Zielmarke: <Bezeichnung der
in-progress-Marke>“ — die Fassade [[Zielmarken]] führt
den Zeiger, diese Datei verweist nur), die nächsten
Schritte, Blockaden und Risiken und die Verweise, über
die sich das Projekt erschließen lässt. Sie ist eine
Root-Session-Datei, kein Wiki-Knoten; ihre Pflege
gehört zur Doku-Pflicht (MasterPrompt §9.1). Den
ausführlichen Zustandsbericht (Marken, Komponenten,
Stände) füllt der aktive Prozess nach seiner
`Vorgehen-<Prozess>.md` (mit SP-1 der Gesamtstand des
Koordinators; ein Verfahrens-Prozess nennt Verfahren,
Stelle, Aktenzeichen, Stufe, laufende Marke, offene
Fristen).

**Template:** wird als **Rumpf** mitgeliefert
(Platzhalter-Grundsatz, Wiki.md §3a); der Init füllt den
Kopf (Projekt, Prozess) mit der ersten Marke
([[Init-Choreografie]] Phase D Turn 3). Ein Upgrade legt
die Datei nur an, wo sie fehlt.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzform: MasterPrompt §2 (Kurzliste der
  Standarddateien)
- Kopiervorlagen in `wiki/templates/`: §2.7a
  (Styleguide-chat), §2.13 (Index-Format); das
  Tools.md-Gerüst beschreibt MasterPrompt §7.5
