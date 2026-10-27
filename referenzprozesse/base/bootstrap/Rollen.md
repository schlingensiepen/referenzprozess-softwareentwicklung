---
type: facade-bootstrap
fassade: "Rollen"
prozess: "base"
---

# Bootstrap — Rollen

_(Ziel: `wiki/Rollen.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/base/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Einstufung, Basis-Vorauswahl und Pflicht-Fall
dieser Fassade: Wiki.md §3a („mandatory vs. optional
beim Init“) — vor der Aktivierungs-Wahl lesen.
Beim Init:

1. Aktivierungs-Wahl als `active: true|false` im
   Frontmatter setzen — außerhalb des Pflicht-Falls
   als Ja/Nein-Frage mit Empfehlung „aktivieren, wenn das
   Ergebnis Nutzer in benannten Rollen hat".
2. Bei Aktivierung: die Werte von `rolle_art`, die der
   aktive Prozess nennt, in der `## Meta` bestätigen;
   dann `### Verankerungen` abarbeiten. Bei Abwahl
   bleibt die Fassaden-Datei mit `active: false`
   liegen (Reaktivierung liest diese Bootstrap-Datei
   erneut).

### Verankerungen

- Eintrag in [[Fassaden]] von „deaktiviert" auf
  „aktiv" umsetzen und unter „Aktive Fassaden“
  führen (Kurzform-Erklärung, Wikilink, Kategorie
  `Basis`).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
