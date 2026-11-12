---
type: facade-bootstrap
fassade: "Wegweiser"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Wegweiser

_(Ziel: `wiki/Wegweiser.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status und Einstufung dieser Fassade: Steckbrief
§ Mitgebrachte Fassaden (Pflicht ab Stufe 1,
template-eigen); was mandatory für den Merge
bedeutet: Wiki.md §3a, §11.3 — vor den Schritten
lesen. Beim Merge:

1. `active: true` bestätigen (Default; die Fassade ist
   ab Stufe 1 Pflicht).
2. Die Wegweiser-Knoten (`wiki/Wegweiser-*.md`) mit
   ihren Teilaufsätzen (`wiki/Wegweiser-*/`) kommen
   unverändert aus dem Prozess-Ordner ins
   Anwender-`wiki/` — sie gehören dem Template, das
   Projekt ändert sie nicht ([[Katalog-Wegweiser]]).
3. Der Normen-REC kommt mit: der Ordner
   `research/REC-9001 - Normen-Paket Stand 2026-11-05/`
   (Normtexte, `manifest.tsv`) in das Projekt-`research/`,
   der Knoten `wiki/REC-9001 — Normen-Paket Stand
   2026-11-05.md` ins Anwender-`wiki/`. Beide sind
   eingefroren; nichts wird umbenannt.
4. Die Werkzeuge `tools/normen-holen.py`,
   `tools/normen-liste.tsv`, `tools/wegweiser-quellen.py`,
   `tools/frist-rechnen.py` und `tools/README.md` kommen
   in das Projekt-`tools/`.
5. `### Verankerungen` abarbeiten; danach einmal
   `python3 tools/wegweiser-quellen.py --pruefen` laufen
   lassen (Soll: 0 FEHLER).

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status `aktiv`, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Zeile des mitgelieferten Normen-REC in
  [[Rechercheartefakte]] eintragen (Form nach deren
  `## Meta` „Eintragsformat“; Präzisierung
  [[Katalog-Rechercheartefakte]]):
  `### REC-9001 — Normen-Paket Stand 2026-11-05` mit
  Quelle gesetze-im-internet.de, Datum 2026-11-05 /
  Frage „Welcher Stand der Bundesgesetze des
  Normen-Pakets gilt als Arbeitsgrundlage?“ /
  Kern-Ergebnis „31 Bundesgesetze als Lesefassung mit
  Ankern, Prüfsummen im Manifest; mitgeliefert mit dem
  Template“ / Übernommen als DEC: **offen** / Detail
  [[REC-9001 — Normen-Paket Stand 2026-11-05]].
- Die Übernahme des Stands als Arbeitsgrundlage ist eine
  **Entscheidung je Paket-Stand**: der Init stellt die
  Rückfrage („Normen-Paket Stand 2026-11-05 übernehmen?“
  — Init-Frage 9 des Prozesses, `index.md` §4.6;
  Voreinstellung: ja) und bucht die Antwort in [[Entscheidungen]]; danach
  das Feld „Übernommen als DEC“ der Register-Zeile
  vervollständigen. Keine stillschweigende Übernahme.
- Die Werkzeuge aus `tools/` in `Tools.md` unter
  „Projekt-Skripte“ registrieren (Zweck und Aufruf aus
  `tools/README.md`): `normen-holen.py` — Holen eines
  neuen Stands als Rechercheartefakt, Nachladen von
  Bundesrecht außerhalb des Pakets (ein Lauf legt einen
  neuen Stand an; ein bestehender ist eingefroren);
  `wegweiser-quellen.py` — Prüfung der Wegweiser-Links;
  `frist-rechnen.py` — Fristende und Wochentag maschinell
  (Aufruf `python3 tools/frist-rechnen.py JJJJ-MM-TT
  "1 Monat"`, `--heute`; Landesfeiertage legt der Agent
  je Projekt als Datei an und übergibt sie mit
  `--feiertage`, siehe `tools/README.md`).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
