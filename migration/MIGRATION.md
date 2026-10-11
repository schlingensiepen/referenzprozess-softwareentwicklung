# MIGRATION — Wissensbasis in ein RP-1-wiki/ überführen

**Du liest dieses Dokument, weil dein Projekt sein
Wissen bisher in verstreuten Dateien sammelt und
jetzt auf das Template-System migriert.** Diese
Anleitung ist dein vollständiger Auftrag — du musst
zu Beginn nichts anderes lesen. Die Regel-Dokumente
des Templates (MasterPrompt.md, Wiki.md …) ziehst du
erst heran, wenn eine Phase dich dorthin schickt:
**Kontext schonen geht vor Vollständigkeit.**

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
das Repo, aus dem du dieses Dokument liest,
typischerweise als Submodul `_template/` eingebunden
(Modus B) oder als Einmal-Kopie abgelegt (Modus A,
MasterPrompt §1). Er wird **nie beschrieben** und
bleibt dauerhaft nur-lese verfügbar — als
Nachschlage- und Upgrade-Quelle. Ab der Kopie
arbeitest du ausschließlich in deinem
Projektverzeichnis. Ebenso Nur-Lese: dein
mitkopierter Ordner `referenzprozesse/`.

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
`setup/init-migration.sh` (Phase 0). Alle Fassaden
des RP-1-Zuschnitts liegen bereit, die
Init-Bootstraps sind bis auf zwei bewusste Ausnahmen
bereits abgearbeitet, der Typen-Katalog trägt die
SP-1-/RP-1-Anhänge, [[Aktivierter-Prozess]] bucht
die getroffenen Vorfestlegungen. **Du baust kein
wiki — du füllst eines.** Offen sind nur: die
Bootstraps von `Mission Statement` und `Facts`
(Projekt-Identität — füllst du in Phase 3 aus deinem
Wissen), die Fragen aus Phase 1 und die Restfragen
in Phase 5.

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

1. **Einbindung prüfen:** Ist der Starter als
   Submodul `_template/` eingebunden (Modus B) oder
   als Einmal-Kopie erreichbar (Modus A)? Wenn
   nein: dem Anwender die Modus-Wahl anbieten
   (MasterPrompt §1 Anbindungs-Modi) und einbinden.
2. **Ist die Kopie noch nicht erfolgt:** erst den
   Alt-Zustand committen („Sicherung vor
   Wissens-Migration"), **dann**
   `setup/init-migration.sh` aus dem Projektordner
   ausführen. Ist das Skript nicht lauffähig (keine
   sh, Rechte, exotische Umgebung), kopierst du
   selbst nach der **Kopier-Liste** unten — sie ist
   der führende Ort, das Skript ihre
   Implementierung. **Kollisionsregel:** eine
   Starter-Datei überschreibt **nie** eine
   gleichnamige Bestands-Datei (typisch: README.md,
   .gitignore, CLAUDE.md) — bei Namensgleichheit die
   Starter-Datei auslassen und die Kollisions-Liste
   im Fragen-Block (Phase 1) vorlegen. Danach
   zweiter Commit („Starter aufgenommen",
   Aufnahme-Commit). **Ist die Kopie schon erfolgt**
   (z.B. durch den Start-Auftrag): beides in einem
   Commit sichern. Kein git vorhanden → `git init`,
   dann wie beschrieben.

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
   | `referenzprozesse/` (komplett) | `referenzprozesse/` | Nur-Lese-Vorlage inkl. aller `bootstrap/`-Ordner |
   | `wiki/` (komplett, inkl. `templates/`) | `wiki/` | Frisch-Vorlage |
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

   **Nie kopiert werden:** `README.md`, `INIT.md`,
   `migration/` selbst, `docs/`, `setup/`, `LICENSE`,
   `.git/` — alles in `_template/` lesbar; ein
   etwaiges Bestands-`docs/` bleibt unberührt.
   Diese MIGRATION.md wird ebenfalls **nicht
   kopiert** — du liest sie aus
   `_template/migration/`.

3. Commit-Texte hier und im Folgenden sind
   **sinngemäß in der bisherigen Projektsprache**
   zulässig — die Sprach-Frage kommt erst in
   Phase 1/5.
4. Ab jetzt gilt Commit-Disziplin: jede
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
   Datei-Namen und Kopfzeilen, nicht die
   Volltexte!). Der Anwender streicht/ergänzt.
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
   `referenzprozesse/RP-1-Systementwicklung/wiki/`
   (dein mitkopierter Ordner) aktiviert wird und
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
| Projekt-Identität, Stolpersteine, Einstieg | [[Mission Statement]] + [[Facts]] (dabei deren Bootstrap-Dateien aus `referenzprozesse/base/bootstrap/` abarbeiten — die Quelle ist Nur-Lese, nichts löschen) |
| **Nicht mehr sicher Rekonstruierbares — und alles, was in keine Zeile passt** (Auffangregel: nie verwerfen!) | `wiki/Migrations-Grundlagen.md` — Aufbau: Frontmatter `type: decision`, `id: DEC-NNN` (Nummer der zugehörigen Sammel-Zeile), Sektionen `## Festlegungen` / `## Ungeklärt` / `## Herkunft` / `## Vermerke`; im DEC-Register mit **einer** Zeile `### DEC-NNN — Migrations-Grundlagen als Gesamtpaket angenommen` verankert (die Datei ist deren Detail-Knoten). Einzelpunkte können später zu eigenen DECs befördert werden |

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
   `referenzprozesse/RP-1-Systementwicklung/wiki/`
   kopieren, die Bootstrap-Datei aus
   `referenzprozesse/RP-1-Systementwicklung/bootstrap/`
   abarbeiten — beides aus deinem mitkopierten,
   nur-lese Ordner —, [[Fassaden]] nachführen) und
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
   (Starter-Stand <Datum/Commit>)" — ihre Wahrheit
   lebt ab jetzt vollständig in den Buchungen;
   diese Anleitung bleibt in `_template/migration/`
   als Nachschlage-Quelle liegen.
7. Abschluss-Commit. `referenzprozesse/` bleibt
   dauerhaft als Nur-Lese-Nachschlage- und
   Upgrade-Quelle liegen (nicht löschen). Ab hier
   gilt der normale Betrieb nach MasterPrompt —
   beim nächsten Sessionstart läuft der reguläre
   Ablauf (§5.3).
