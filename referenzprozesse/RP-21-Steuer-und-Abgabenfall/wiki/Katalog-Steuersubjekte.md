---
type: catalog-entry
art: register
process: RP-21
---

# Katalog-Steuersubjekte

**Ich bin neu in RP-21.** Register-Eintrag:
Entitäts-Fassade `taxpayer-log` ([[Steuersubjekte]]) mit
dem Entitäts-Typ `taxpayer` (Steuersubjekt). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### taxpayer-log

- **Zweck:** Register der Steuersubjekte der Akte —
  Personen und Gesellschaften, für die Bescheide
  ergehen oder Pflichten bestehen — mit Kennzeichen,
  zuständigen Stellen und Schreibweisen; eine Akte je
  Familie oder Gesellschaftskreis statt Parallelprojekten
- **Pflichtfelder:** `type: taxpayer-log`
- **Präfix:** `—` (Schlüssel ist der Name des Subjekts;
  Kennzeichen stehen am Knoten)
- **Datei:** `wiki/Steuersubjekte.md`
- **Singleton** — Vorauswahl aktiv ab dem zweiten
  Subjekt (Steckbrief § Mitgebrachte Fassaden); mit
  einem Subjekt optional (der Agent bietet an)
- **Pflicht ab:** Auslöser „zweites Subjekt“ — sobald
  Bescheide oder Pflichten für ein zweites Subjekt in
  der Akte liegen
- **Entfällt abgeleitet, wenn:** die Fassade inaktiv
  ist (`active: false`) und die Akte nur ein Subjekt
  führt (dessen Kennzeichen stehen dann am
  [[Beteiligte]]-Eintrag)

### taxpayer

- **Zweck:** ein Steuersubjekt mit Stammdaten — Person
  oder Gesellschaft, Kennzeichen (Steuernummer,
  Identifikationsnummer, Kassenzeichen, Zollnummer,
  Aktenzeichen der Stelle) mit Historie, zuständige
  Stellen, Schreibweisen aus der Texterkennung
  (Detail-Knoten zum Eintrag der Fassade)
- **Klasse:** außerhalb (Entität, lebend; Kennzeichen
  werden fortgeschrieben, jede Änderung mit Datum und
  Quelle; im Stand kopiert)
- **Pflichtfelder:** `type: taxpayer`, `person`
  (String-Slug des [[Personen]]- oder
  [[Organisationen]]-Knotens; das Subjekt ist die
  steuerliche Rolle dieser Person), `kennzeichen`
  (Liste von Einträgen `art` · `wert` · `stelle` ·
  `gueltig_ab` · `gueltig_bis`; `art` offene Liste:
  `steuernummer` | `identifikationsnummer` |
  `kassenzeichen` | `zollnummer` | `aktenzeichen` |
  `wirtschafts-identifikationsnummer` |
  `umsatzsteuer-identifikationsnummer`), `stellen`
  (Liste der String-Slugs der zuständigen
  [[Organisationen]] mit `authority`, je Abgabenart)
- **Empfohlen:** `rolle` (offene Liste:
  `abgabenpflichtiger` | `haftungsschuldner` |
  `gesamtschuldner` | `rechtsnachfolger` |
  `mitwirkungspflichtiger-dritter` | `organ`),
  `schreibweisen` (Liste der Namens- und
  Kennzeichen-Schreibweisen, wie sie in Bescheiden und
  aus der Texterkennung vorkommen — damit der Agent
  einen Eingang dem Subjekt zuordnet), `kreis` (Familie
  oder Gesellschaftskreis als Freitext oder Slug; alle
  Subjekte eines Kreises in einer Akte)
- **Optional:** `vertretung` (String-Slug des
  Vertretungs-Eintrags in [[Beteiligte]]:
  Bevollmächtigter, Steuerberater, gesetzlicher
  Vertreter), `verfahren` (Liste der String-Slugs der
  `case`-Knoten), `ketten` (Liste der Ketten-Schlüssel
  in [[Bescheidketten]]), `vertraulich` (`offen` |
  `intern` | `streng-intern`; Vorgabe `intern`),
  `alias`
- **Beispielname:** `Steuersubjekt Beispiel GmbH.md`,
  `Steuersubjekt Elternteil A.md`
- **Kanonizität:** Wahrheit bei den Kennzeichen und
  Stellen liegt in `wiki/Steuersubjekte.md`
  (Wiki.md §1.1a); der Personen- bzw.
  Organisationen-Knoten hält die Stammdaten der Person,
  nicht die steuerlichen Kennzeichen.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Steuersubjekte]] (Sektionen Stammdaten und Rolle /
  Kennzeichen (Tabelle mit Historie) / Zuständige
  Stellen / Schreibweisen / Ketten und Verfahren /
  Vermerke / Bezüge).
- **Bezugsfelder anderer Typen:** Bescheide nennen das
  Subjekt im Feld `subjekt` ([[Katalog-Bescheidketten]]);
  Beteiligte-Einträge verweisen auf das Subjekt, wenn
  die steuerliche Rolle von der Rolle im Verfahren
  abweicht.
