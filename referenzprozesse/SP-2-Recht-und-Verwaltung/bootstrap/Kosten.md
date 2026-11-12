---
type: facade-bootstrap
fassade: "Kosten"
prozess: "SP-2-Recht-und-Verwaltung"
---

# Bootstrap — Kosten

_(Ziel: `wiki/Kosten.md`. Ausführung beim Init/Merge
bzw. bei Reaktivierung — Wiki.md §11.3/§3a. Diese
Datei wird nie ins Anwender-wiki kopiert; sie liegt
in beiden Modi unter
`_template/referenzprozesse/SP-2-Recht-und-Verwaltung/bootstrap/` —
Wiki.md §11 „`bootstrap/`“, MasterPrompt §1.)_

_(Einmal-Anweisungen. Die Betriebs-Semantik steht
dauerhaft im `## Meta` der Fassade; diese Datei wird
nie ins Anwender-wiki kopiert.)_

Status, Einstufung und Vorauswahl dieser Fassade:
Steckbrief § Mitgebrachte Fassaden (ab Stufe 1 aktivierbar; Pflicht ab Auslöser) — vor
der Aktivierungs-Wahl lesen. Beim Merge und später auf
Angebot oder Anweisung:

1. Aktivierungs-Wahl des Anwenders als
   `active: true|false` im Frontmatter setzen
   (Ja/Nein-Frage mit Empfehlung „aktivieren,
   sobald Kostenantrag, Prozess- oder
   Verfahrenskostenhilfe, Beratungshilfe, Erstattung
   im Vorverfahren oder ein Vorschuss ins Spiel kommt“
   — mit diesem Auslöser ist die Fassade Pflicht und
   der Agent setzt `active: true` ohne weitere Frage;
   Init-Frage „Vertretung und Kostenträger“,
   SP-2-`index.md` §4.6 Frage 3). Bei Abwahl bleibt die
   Fassaden-Datei mit `active: false` liegen
   (Reaktivierung liest diese Bootstrap-Datei erneut;
   das Angebot des Agenten ist ein Aktions-Entwurf,
   Wiki.md §3a „Fassaden-Promotion“).
2. Bei Aktivierung je Verfahren den Posten
   `kostenrisiko` anlegen und die Posten aus der Akte
   (Streitwert, Gerichtskosten, Vorschüsse, Honorare,
   PKH- oder Beratungshilfe-Stand) mit Träger
   eintragen; Kostenträger als Einträge in
   [[Beteiligte]]; Deckungsanfrage als Erwartung,
   Deckungszusage als Zusage in [[Fristen]].
3. Bei Aktivierung `### Verankerungen` abarbeiten.

### Verankerungen

- Eintrag in [[Fassaden]] anlegen: Kurzform-Erklärung,
  Wikilink, Status, Kategorie
  `Prozess-mitgebracht (SP-2)`.
- Die Aktivierung dieser Fassade legt keine
  `internal-*`-Knoten an. Projekt-eigene
  Steuerungs-Regeln (Dauerfreigaben, gewünschte
  Abweichungen vom Template) entstehen unabhängig
  davon als `internal-rule` in [[InterneMechanik]].
