---
type: facade-bootstrap
fassade: "Eingangsdokumente"
prozess: "base"
---

# Bootstrap — Eingangsdokumente

_(Ziel: `wiki/Eingangsdokumente.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung und Basis-Vorauswahl dieser Fassade:
Wiki.md §3a („mandatory vs. optional beim Init“) —
vor der Aktivierungs-Wahl lesen. Beim Init:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „aktivieren" —
   besonders wertvoll bei Projekten mit vielen
   Eingangsdokumenten).
2. Bei Aktivierung: **Eingangsorte-Frage** in drei
   Schichten ([[Init-Choreografie]] §Baustein
   Eingangsorte; Muster der Fristensammler-Frage) —
   (a) die Projektordner (`raw/`, `mails/`, weitere
   Eingangsordner) als erste Zeilen in
   `## Eingangsorte` eintragen, ohne Frage; (b) nach
   **weiteren Eingangsorten** fragen (Postfach, Portal,
   Datenraum): je Ort Name, Zugriffsweg, Modus
   (maschinell lesbar | manueller Abruf mit Turnus),
   Zugriff **testen**, Werkzeug in `Tools.md`
   eintragen, Blockade dokumentieren; (c) fragen, ob es
   schon **aktive Lesewege** gibt (Posteingangs-Agent,
   Mail-Konverter, Konnektor, Abruf-Skript) — sie
   registrieren und nutzen, keinen eigenen bauen.
   Danach `### Verankerungen` abarbeiten. Bei Abwahl
   bleibt die Fassaden-Datei mit `active: false`
   liegen (Reaktivierung liest diese Bootstrap-Datei
   erneut). Ob vorhandene Akten beim Init zuerst
   eingelesen werden, sagt der Prozess in seinem
   `index.md`.

### Verankerungen

- Eintrag in [[Fassaden]] prüfen (Status, Kurzform).
- Mit der Aktivierung läuft der Wächter C9
  (Posteingang, MasterPrompt §5.3) — kein eigener
  Schritt, er wirkt nur mit dieser Fassade.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
