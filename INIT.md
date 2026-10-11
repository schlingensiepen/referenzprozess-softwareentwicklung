# INIT — Neues Projekt aus diesem Starter

**Du liest dieses Dokument, weil ein neues Projekt
diesen Starter als `_template/` eingebunden (oder
einmalig kopiert) hat.** Dein Projekt-`wiki/` kommt
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

**Nur-Lese-Regel:** `_template/` (bzw. die
Modus-A-Kopie-Quelle) wird **nie beschrieben** —
du liest daraus. Ebenso Nur-Lese: das ins Projekt
kopierte `referenzprozesse/`.

---

## 1. Kopier-Schritt prüfen/nachholen

Lief `setup/init-frisch.sh` schon? Erkennbar daran,
dass dein Projekt ein `wiki/` mit gefüllter
[[Fassaden]]-Landkarte und ein `devstate_active.md`
trägt. Wenn nicht: jetzt
`_template/setup/init-frisch.sh` aus dem
Projektordner ausführen. Ist das Skript nicht
lauffähig (keine sh, Rechte, exotische Umgebung),
kopierst du selbst nach dieser **Kopier-Liste** —
sie ist der führende Ort, das Skript ihre
Implementierung:

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
| `wiki/` (komplett, inkl. `templates/`) | `wiki/` | vorbefülltes Frisch-wiki, inkl. deaktivierter Fassaden (z.B. `Mission Statement Long` — Reaktivierung per Zuruf) |
| `devstate_active.md` | `devstate_active.md` | Frisch-Fassung |

**Nie kopiert werden:** `README.md`, `INIT.md`,
`migration/`, `docs/`, `setup/`, `LICENSE`, `.git/`.

**Kollisionsregel:** nie eine vorhandene
Projekt-Datei überschreiben — bei Namensgleichheit
die Starter-Datei auslassen und die Kollisions-Liste
im Fragen-Block (Schritt 3) vorlegen.

## 2. git-Prüfung

- Existiert im Projektordner ein Repo? Wenn nein:
  `git init`.
- Modus B: ist das Submodul `_template/` eingebunden
  und gepinnt (`git submodule status`)? Modus A: die
  Kopie-Quelle als Notiz für die Chronologie
  festhalten.
- **Erst-Sicherungs-Commit** des kopierten Stands
  (z.B. „Setup: Starter-Stand aufgenommen").
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
   `referenzprozesse/base/bootstrap/` arbeitest du
   danach ab.
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
   `referenzprozesse/RP-1-Systementwicklung/`
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
- Mission/Facts-Bootstraps abarbeiten (aus dem ins
  Projekt kopierten
  `referenzprozesse/base/bootstrap/` — Quelle
  Nur-Lese, nichts löschen).
- **Instruktionsdatei** anlegen (deine native Datei,
  z.B. `CLAUDE.md`) nach MasterPrompt §8.3 /
  [[Instruktionsdatei-Pflege]] — einschließlich der
  eisernen Regel „Das `wiki/` ist die Quelle der
  Wahrheit" (Wortlaut aus dem Grundgesetz oben).

## 5. Abschluss

Kein Selbst-Abbau nötig — dieses Dokument liegt nur
im Starter und bleibt dort lesbar.

- **Projekt-README** anlegen:
  Projekt-Kurzbeschreibung, Regelwerks-Einstieg,
  Verweis auf die Erklär-Doku in `_template/docs/`
  (bzw. der Modus-A-Kopie-Quelle).
- Chronologie-Eintrag „Projekt aus
  referenzprozess-softwareentwicklung initialisiert
  (Starter-Stand <Datum/Commit>)".
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
