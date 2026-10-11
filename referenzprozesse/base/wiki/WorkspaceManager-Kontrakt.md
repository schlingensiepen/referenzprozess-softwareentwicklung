---
type: internal-rule
---

# WorkspaceManager-Kontrakt

Zwei Sektionen mit klarer Trennung: der
**Kontrakt** (mitgeliefert — Wortlaut aus
MasterPrompt §1.3.1 hierher verlagert) und die
**Betriebs-Konfiguration** (beim Init gefüllt; die
InterneMechanik-Bootstrap-Liste sah diesen Knoten
bislang als reine Init-Anlage vor — er wird nun
mitgeliefert und beim Init nur noch gefüllt).
Moment: bei Konvertierungs- und Versand-Fragen
sowie beim Konfigurations-Sync (MasterPrompt §5.3
Phase B).

## Kontrakt: docsources.yml und WorkspaceManager

Die Datei `docsources.yml` im Projektroot definiert,
aus welchen Quellen Eingangsdokumente stammen. Der
WorkspaceManager liest sie und konvertiert die
Originaldokumente in Markdown-Dateien.

Das Verzeichnis `raw/` wird automatisch als Quelle
behandelt — die konvertierten Dateien landen in
`input/raw/`.

Weitere Quellen werden in `docsources.yml` definiert:

```yaml
sources:
- name: projektquelle
  path: C:\Users\anna\My Drive\Projektquelle
```

Die konvertierten Dateien landen in `input/<name>/` —
im Beispiel in `input/projektquelle/`.

**Konvertierung ist 1:1.** Der Konverter erzeugt
pro Originaldatei genau eine Markdown-Datei. Enthält
ein Original mehrere eigenständige Dokumente
(Sammeldokument, z.B. gescannter Stapel-Scan), wird
das erst beim **Ingest** durch den Agent aufgetrennt
(siehe `Wiki.md` §2.1) — nicht durch den Konverter.

**Trigger.** Der WorkspaceManager wird **vom User
gestartet**, nicht vom Agent. Wenn der Agent
Konvertierungs-Bedarf erkennt (z.B. beim Drift-Check
im Sessionstart Phase C1), bittet er den User, den
WorkspaceManager laufen zu lassen — er stößt ihn
nicht selbst an.

**Fallback ohne WorkspaceManager.** Wenn der User
keinen WorkspaceManager hat (Init-Frage in §5.3
Phase D), übernimmt der Agent die Konvertierung
selbst mit den ihm verfügbaren Tools und APIs
(native PDF-Verarbeitung des Modells, installierte
MCPs für Konvertierung, ansonsten LLM-basierte
Volltext-Extraktion aus dem Original). Regeln gelten
unverändert:

- Konvertierung ist 1:1 pro Originaldatei.
- Basename bleibt erhalten
  (`raw/scan_2025_03.pdf` → `input/raw/scan_2025_03.md`).
- Ergebnis landet in `input/raw/` (für `raw/`-Quellen)
  bzw. `input/<name>/` (für externe Quellen aus
  `docsources.yml`).
- `raw/` und `input/` bleiben ansonsten unverändert
  (eiserne Regel).

Der Agent macht die Konvertierung nur **on demand**
— nicht prophylaktisch alle Dateien in `raw/`
konvertieren, sondern nur, was für die aktuelle
Aufgabe benötigt wird.

**Lebenszyklus.** Wird eine Datei in `raw/`
gelöscht, hat das **keine weiteren Folgen** für die
abgeleitete Datei in `input/raw/` oder für
Wiki-Knoten — die Kopien bleiben bestehen. `raw/`
ist als unveränderliches Archiv konzipiert; der User
löscht dort im Regelfall nicht. Wenn Original und
Kopie divergieren (Original entfernt), wird die
Provenienz-Kette an dieser Stelle historisch
"unvollständig" — das ist bewusst akzeptiert.

## Betriebs-Konfiguration

_(beim Init gefüllt — Init-Frage „WorkspaceManager
verfügbar?", siehe [[Init-Choreografie]]; getrennt
pro Rolle)_

- **Konvertierung** (`raw/`/externe Quellen →
  `input/`): _(vorhanden — User startet bei Bedarf |
  nicht vorhanden — Agent übernimmt selbst)_
- **Outgoing-Erzeugung** (PDF/EML/DOCX via Pandoc):
  _(vorhanden — User startet bei Bedarf |
  nicht vorhanden — Agent übernimmt selbst)_

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzform: MasterPrompt §1.3.1 (Ordner-Regel
  und Überblick: §1.3)
- Outgoing-Fallback analog: Outgoing.md
