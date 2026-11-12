---
type: internal-rule
---

# Git-Hygiene

**Regel:** Was in einen Commit kommt, wählt der Agent
ausdrücklich; lokale Einstellungs- und Cache-Dateien
kommen nie ins Repo; Prüf-Haken werden nicht umgangen.
Lesen vor jedem Commit — ergänzt die
[[Commit-Prozedur]] (Zug, Präfix, Sprache, Kadenz) um
die Auswahl der Dateien.

1. **`git add` nur mit ausdrücklichen Pfaden.**
   Sammel-Befehle (`git add -A`, `git add .`,
   `git add -u`, `git commit -a`) nehmen geänderte
   getrackte Dateien mit, die nicht zum Zug gehören.
   Vor einem Sammel-Add `git status -s` lesen und
   jeden `??`-Eintrag bewerten. **`raw/` und `input/`
   werden in jedem Projekt versioniert:** Neue Dateien
   dort sind Ergänzungen des Anwenders oder
   Konvertierungen und werden committet; die beiden
   Ordner stehen nicht in `.gitignore`. Bei Unsicherheit
   über eine einzelne Datei fragen statt zurückrollen.
   „Nicht anfassen“ heißt: Inhalt und Namen nicht
   ändern — nicht: aus der Versionierung halten.
2. **Nie committen:** lokale Einstellungs-Dateien der
   Agenten-Umgebung (etwa `settings.local.json`),
   Cache- und Zeitstempel-Dateien von Werkzeugen,
   Sicherungskopien, die ein Werkzeug anlegt; dazu
   Zugangsdaten nach MasterPrompt §6.3. Was im Projekt
   dazugehört, steht in `.gitignore`.
3. **Kein `--no-verify`.** Prüf-Haken werden nicht
   umgangen; ein roter Haken wird behoben oder dem
   Anwender vorgelegt.

**Warum:** Ein Sammel-Add nimmt Dateien mit, die nicht
zum Zug gehören, und ein Commit ist danach schwer zu
entwirren; „nicht anfassen“ mit „nicht versionieren“
zu verwechseln, rollt legitime Ergänzungen des Anwenders
zurück.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Commit je Zug, Präfix, Sprache: [[Commit-Prozedur]],
  MasterPrompt §6
- Geheimnisse: MasterPrompt §6.3
- Schwester-Regel: [[Keine-Wiederherstellung-ohne-Absicht]]
