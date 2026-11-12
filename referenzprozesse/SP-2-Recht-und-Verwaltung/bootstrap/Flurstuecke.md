---
type: facade-bootstrap
fassade: "Flurstuecke"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Flurstücke

_(Ziel: `wiki/Flurstuecke.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden (optional) — vor
der Aktivierungs-Wahl lesen. Beim Merge und später auf
Angebot oder Anweisung:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „aktivieren,
   sobald ein Verfahren Grundstücke zum Gegenstand
   hat“; sonst nicht anbieten). Bei Abwahl bleibt die
   Fassaden-Datei mit `active: false` liegen
   (Reaktivierung liest diese Bootstrap-Datei erneut;
   das Angebot des Agenten ist ein Aktions-Entwurf,
   Wiki.md §3a „Fassaden-Promotion“).
2. Bei Aktivierung die Flurstücke aus Bescheiden,
   Grundbuchauszügen und Katasterunterlagen anlegen
   (Gemarkung, Flur, Flurstücksnummer, Grundbuchblatt,
   Eigentümer, Lage, Fläche); Bescheide als
   [[Eingangsdokumente]] mit Gegenstand Flurstück.
3. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- In einer Serie je Grundstück ist das Flurstück die
  Einheit ([[Serien]]).
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
