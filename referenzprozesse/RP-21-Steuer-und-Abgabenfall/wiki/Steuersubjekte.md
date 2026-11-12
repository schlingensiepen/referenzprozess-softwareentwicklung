---
type: taxpayer-log
active: false   # Pflicht ab dem zweiten Subjekt (Auslöser); mit einem Subjekt optional, Aktivierung per Angebot des Agenten oder Anweisung des Anwenders
---

# Steuersubjekte

**Ich bin neu in RP-21.** Diese Fassade entsteht mit der
Wahl von RP-21 (Wiki.md §11 Prozess-Teil-Wikis) und wird
**Pflicht, sobald die Akte ein zweites Steuersubjekt
führt** (Ehegatten, Eltern und Kinder, Gesellschaft und
Gesellschafter, Haftungsschuldner neben dem
Abgabenpflichtigen); bis dahin ist sie optional, und die
Kennzeichen des einen Subjekts stehen am
[[Beteiligte]]-Eintrag.

## Meta

- **Bootstrap/Reaktivierung:** Einmal-Anweisungen in der
  Template-Quelle
  `_template/referenzprozesse/RP-21-Steuer-und-Abgabenfall/bootstrap/Steuersubjekte.md`
  — bei Aktivierung von dort abarbeiten.
- **Typ:** `taxpayer-log` — Entitäts-Register der
  Steuersubjekte (Element-Typ `taxpayer`): je Subjekt
  Person oder Gesellschaft, Kennzeichen (Steuernummer,
  Identifikationsnummer, Kassenzeichen, Zollnummer,
  Aktenzeichen der Stelle) **mit Historie**, zuständige
  Stellen je Abgabenart, Schreibweisen aus der
  Texterkennung. Singleton; Pflicht ab dem zweiten
  Subjekt.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei Kennzeichen und
  Stellen liegt in dieser Fassade — Detail-Knoten
  spiegeln (Wiki.md §1.1a). Ein Steuersubjekt ist eine
  Entität (Klasse außerhalb, lebend): ein neues
  Kennzeichen oder eine neue Stelle ist eine neue Zeile
  der Historie mit Datum und Quelle (Bescheid als
  [[Eingangsdokumente]]), keine Korrektur. Die Person
  selbst steht in [[Personen]] bzw. [[Organisationen]];
  hier steht ihre steuerliche Rolle.
- **Eine Akte je Familie oder Gesellschaftskreis:** alle
  Subjekte eines Kreises werden in einem Projekt
  geführt, nicht in Parallelprojekten — die
  Bescheidketten ([[Bescheidketten]]) hängen am Subjekt,
  die Verfahren ([[Verfahren]]) nennen Subjekt und
  Kette; eine Abspaltung je Subjekt ist die Ausnahme
  nach der Entscheidungsmatrix (eigener
  Vertraulichkeitskreis, gegenläufige Interessen —
  [[Marken-SP-2]] §Stränge).
- **Zuordnung eines Eingangs:** der Agent ordnet jeden
  Bescheid über Kennzeichen **und** Schreibweise dem
  Subjekt zu; eine Schreibweise aus der Texterkennung,
  die noch fehlt, trägt er als neue Schreibweise ein;
  passt kein Subjekt, legt er den Eingang dem Anwender
  mit Vorschlag vor (neues Subjekt oder Zuordnung).
- **Vertraulichkeit:** Kennzeichen sind `intern`
  (Vorgabe); in Dossiers und Erläuterungen für Dritte
  werden sie nur genannt, wenn der Empfänger sie braucht
  ([[Vorgehen-SP-2]] §Vertraulichkeit).
- **Eintragsformat:** `### <Name des Subjekts>` mit
  Feldern Person ([[Personen]] / [[Organisationen]]) /
  Rolle (Abgabenpflichtiger · Haftungsschuldner ·
  Gesamtschuldner · Rechtsnachfolger · Dritter mit
  Mitwirkungspflicht · Organ) / Kennzeichen (Art ·
  Wert · Stelle · gültig ab · gültig bis; aktuelle
  zuerst) / Zuständige Stellen (je Abgabenart) /
  Vertretung ([[Beteiligte]]) / Ketten (Wikilinks in
  [[Bescheidketten]]) / Angelegt (`JJJJ-MM-TT`) / Detail
  (Wikilink).
- **Detail-Knoten-Pflicht:** immer — die Historie der
  Kennzeichen ist eine Tabelle im Knoten. Felder und
  Werte: [[Katalog-Steuersubjekte]] — lesen beim Anlegen.
  Sektionen: Stammdaten und Rolle / Kennzeichen (Tabelle
  mit Historie) / Zuständige Stellen / Schreibweisen /
  Ketten und Verfahren / Vermerke (append-only) / Bezüge.
  Dateiname `Steuersubjekt <Name>.md`.
- **Pflege:** bei Aktivierung (Bestand aus Bescheiden und
  Erklärungen), bei jedem Bescheid mit neuem Kennzeichen
  oder neuer Stelle, bei Rechtsnachfolge, Zuständigkeits-
  wechsel, Namensänderung.

---

**Bearbeitungsstand:** _(vom Agenten bei Aktivierung und
laufend gepflegt)_

## Einträge

_(je Subjekt; der Anwender bzw. das vertretene Subjekt
zuerst)_
