---
type: catalog
active: true   # kann nicht deaktiviert werden — der Katalog ist Pflicht-Fassade (mandatory)
vormals: Knotentypen
---

# Katalog

## Meta

- **Typ:** `catalog` — Meta-Fassade des Katalogs aller
  im Projekt zulässigen Wiki-Typen. Singleton,
  Pflicht-Fassade. Vormals `Knotentypen.md` (Typ
  `types`).
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  die Detail-Knoten sind die **Katalog-Einträge**
  (`Katalog-<Name>.md`, Typ `catalog-entry`); siehe
  Wiki.md §Kategorisierung der Register.
- **Rolle:** der Katalog sagt, **welche Typen es gibt**;
  je Eintrag stehen Zweck, Pflichtfelder,
  Datei-Konvention und Singleton-Markierung. Was in
  diesem Projekt aktiv ist, steht in [[Fassaden]];
  Struktur-Konventionen der Detail-Knoten
  (Frontmatter-Muster, Sektions-Aufbau) stehen in der
  `## Meta`-Sektion der jeweils indexierenden Fassade.
- **Abgrenzung:** [[InterneMechanik]] sagt, **wie das
  Projekt arbeitet** (Konzepte, Prozeduren, Muster,
  Regeln); der Katalog ergänzt sie um die Typen-Seite.
- **Arten von Einträgen:** **Register-Eintrag** (das
  Tupel aus Fassaden-Typ und Element-Typ eines
  Registers, ein Eintrag je Register; Aufbau:
  Registerblock in den Typ-Konventionen),
  **Dokumenttyp-Eintrag** (ein Stand oder eine
  selbsttragende Ableitung je Eintrag, n:m zu
  Registern; Aufbau: Dokumenttyp-Block in den
  Typ-Konventionen) und **Einzeltyp-Eintrag** (Fassade
  ohne Element, Element ohne Register, Relation,
  Mechanik-Knoten, Template-Quelle). Die Art steht im
  Frontmatter des Eintrags (`art:`). Der Mechanismus
  hinter den Klassen, dem Freeze und den Ständen steht
  einmal in [[Einfrieren-und-Abloesen]]; die
  Reihenfolge der Freigaben in [[Kettenpruefung]] —
  die Einträge nennen nur, was je Typ gilt.
- **Eintrag-Aufbau in dieser Fassade:** je Eintrag eine
  Zeile — Wikilink auf den Katalog-Eintrag und
  Link-Beschreibung (Gegenstand, Zweck, Lese-Moment);
  der Inhalt des Typs steht nur im Eintrag.
- **Erweiterung:** Projekte ergänzen eigene Typen als
  eigene Katalog-Einträge (Abschnitt
  §Projektspezifische Erweiterungen); jeder neue
  Detail-Typ braucht eine indexierende Fassade und
  einen Katalog-Eintrag (Wiki.md §3.5).
- **Prozess-Merge:** ein Prozess bringt seine
  Katalog-Einträge als Dateien mit; beim Merge werden
  sie ins Anwender-`wiki/` kopiert und hier als Zeilen
  verankert (Wiki.md §11.3/§11.4). Ersetzt ein Prozess
  einen Basis-Typ, trägt der ersetzende Eintrag die
  Zeile `Replaces type` (siehe Typ-Konventionen).
- **Klasse:** die Einträge sind lebende Mechanik
  (Klasse außerhalb); Änderungen per DEC.

---

**Bearbeitungsstand:** _(vom Agenten beim Init befüllt und
projektspezifisch erweitert)_

Konzeptuelle Beschreibung der Typen: siehe
`../Wiki.md` §3, §3a.

---

## Typ-Konventionen

Führender Ort der Katalog-Grammatik; Wiki.md §3.0
verweist hierher. Der Template-Lint liest die
Katalog-Einträge nach genau diesen Regeln.

- **Terminologie:** Typ- und Feld-Namen sind englisch
  (Default); deutsche Ausnahmen nur, wenn kein
  sinnvolles englisches Äquivalent besteht.
- **Enum-Felder** folgen dem Muster `<typ>_type:`
  (z.B. `document_type`, `organization_type`) — für
  Klassifikation ohne zusätzliche Pflichtfelder,
  wenn alle Instanzen dieselbe Feld-Struktur tragen.
  Ein `subtype:`-Feld ist obsolet und wird nicht
  mehr verwendet.
- **Typ-Abschnitt:** Jeder Typ hat genau einen
  Abschnitt `### <typ>` in genau einem Katalog-Eintrag;
  der Abschnitts-Name ist der Typ-Name ohne Zusatz
  (kein Klammer-Zusatz, keine Gruppen-Überschrift als
  Typ). In einem Register-Eintrag stehen die Abschnitte
  des Fassaden-Typs und der Element-Typen
  nebeneinander. Eine Präzisierung eines Typs durch
  einen Prozess steht als Ergänzung im Abschnitt des
  Typs, nicht als zweiter Abschnitt.
- **Pflichtfeld-Zeile (Pflichtform):**
  `- **Pflichtfelder:** <feldliste>` — genau **eine
  logische Zeile** je Typ-Abschnitt; Fortsetzungszeilen
  mit Einzug gehören dazu, bis zur nächsten Zeile ohne
  Einzug. Felder als `` `name` `` oder
  `` `name: wert` ``, durch Komma getrennt; Feldname
  `[a-z][a-z0-9_-]*`; ein **Festwert nur bei `type`**
  (gleich dem Abschnitts-Typ). Zusätze in Klammern
  hinter einem Feld liest der Lint nicht — ausgenommen
  „Format `PRÄFIX-NNN`“ (ID-Präfix-Muster) und
  `(seit <Marke>)` (neues Pflichtfeld, unten); beide
  sind Lint-lesbar.
  Weitere Zeilen (`Optional`, `Empfohlen`, `Enum-Werte`,
  `Datei`, `Beispielname`, …) sind für den Lint
  unsichtbar. Ein Typ-Abschnitt ohne Pflichtfeld-Zeile
  ist ein Lint-Befund. Ein Listen-Pflichtfeld ist am
  Element auch mit leerer Liste (`[]`) vorhanden; die
  Prüfung „mindestens einer“ gilt je Glied der Kette,
  nicht je Element ([[Kettenpruefung]] §Lint-Anteil).
- **Vererbung:** `- **Extends:** `<eltern-typ>``
  (optional, höchstens einmal je Typ) — Einzel-Vererbung:
  der Kind-Typ erbt alle Pflicht- und Kann-Felder des
  Eltern-Typs, ergänzt eigene Felder und überschreibt
  keine geerbten; der Festwert von `type` ist stets der
  des Kind-Abschnitts. Vererbung ist für echte
  semantische Spezialisierung mit zusätzlichen Feldern
  gedacht; Klassifikation ohne Feld-Änderung nutzt das
  Enum-Feld. Pflichtfeld-Menge eines Typs = eigene
  Felder plus die der Eltern-Kette, Basis-zuerst
  aufgelöst; Vererbungs-Zyklen sind verboten (Befund).
  Auflösungs-Regel beim Anlegen einer Instanz:
  Katalog-Eintrag des Typs prüfen; steht dort
  `Extends`, auch den Eltern-Abschnitt prüfen und
  dessen Pflichtfelder in die Prüfliste aufnehmen.
- **Ersetzung:** `- **Replaces type:** `<alter-typ>``
  (Katalog-Feld `replaces_type`, optional, höchstens
  einmal je Typ) — der Typ dieses Abschnitts ersetzt
  den genannten Typ; eine Ersetzung betrifft genau einen
  Eintrag. **Die Katalog-Zeile führt, das Frontmatter
  spiegelt:** die ersetzende Instanz (Fassade oder
  Element) trägt `replaces_type: <alter-typ>` im
  Frontmatter (Wiki.md §4.1, §11.4); fehlt der Marker
  oder weicht er ab, ist das ein Lint-Befund. Der Lint
  prüft außerdem, dass ein ersetzter Typ im Projekt
  nicht vorkommt — weder als aktive Fassade noch als
  Instanz; eine abgelöste Fassade, die mit
  `active: false` im `wiki/` bleibt (Wiki.md §11.4
  Fassaden), ist kein Befund.
- **Präfix-Muster:** Register-Element-Typen tragen in
  der Pflichtfeld-Zeile beim Feld `id` den Zusatz
  „Format `PRÄFIX-NNN`“; der Lint prüft Instanz-IDs
  gegen dieses Muster.
- **Neue Pflichtfelder `(seit <Marke>)`:** Ein
  Pflichtfeld, das mit einer Marke des Templates
  hinzukommt, trägt in der Pflichtfeld-Zeile den
  Klammer-Zusatz `(seit <Marke>)` (Lint-lesbar, wie
  das Präfix-Muster) — als eigene Klammer direkt
  hinter dem Feld, ohne weiteren Text; eine
  Erläuterung steht in einer zweiten Klammer danach
  (`` `abgeleitet_von` (seit 2.0) (Liste der …) ``).
  Der Lint verlangt das Feld nur für
  Knoten, deren Stichtags-Feld am oder nach dem
  Stichtag der Marke liegt; für ältere Knoten gibt er
  einen Hinweis aus, keinen Fehler. **Stichtags-Feld
  ist das Anlage-Datum** (dieser Absatz ist der
  führende Ort des Felds): `datum: JJJJ-MM-TT` im
  Frontmatter des Detail-Knotens, bei einem
  Register-Eintrag ohne Detail-Knoten die Zeile
  `- **Angelegt:** JJJJ-MM-TT` im Eintrag — Pflichtfeld
  `(seit 2.0)` an allen Element-Typen, das der Agent
  beim Anlegen zusammen mit `zielmarke:` schreibt und
  nie ändert ([[Zielmarken]] §Meta). Ein Element ohne
  Anlage-Datum gilt dem Lint als Bestand (Hinweis);
  Elemente, die eine Migration übernimmt, bekommen kein
  Anlage-Datum und gelten als Bestand (Wiki.md §11.5).
  Den Stichtag schreibt der Herkunfts-Vermerk in
  [[Aktivierter-Prozess]] (Zeile `Template-Stand`,
  [[Init-Choreografie]] §Phase A0).
- **Klassen-Zeile:** `- **Klasse:** Element` |
  `Nachweis` | `außerhalb` — genau eine im Abschnitt
  jedes Typs eines Elements, eines Nachweises oder
  einer lebenden Quelle (Einzeltypen und Element-Typen
  der Register). Der Fassaden-Typ eines Registers
  trägt stattdessen die Präfix-Zeile; Stände und
  Dokumenttypen haben keine Klasse. Führend für die
  Klasse eines Typs ist diese Zeile in seinem Eintrag;
  was die Klassen bedeuten und nach welchem Kriterium
  sie vergeben werden: [[Einfrieren-und-Abloesen]]
  §Klassen.
- **Freeze-Zeile:** `- **Freeze ab:** Anlage` |
  `angenommen` | `Abschluss` — wo sie Pflicht ist,
  sagt die Tabelle unten. Welcher Wert für welche Art
  von Typ gilt und was ab dem Freeze gilt:
  [[Einfrieren-und-Abloesen]] §Freeze und Ausnahmen.
- **Sammelzustand-Zeile:** `- **Sammelzustand:** ja` |
  `nein` — nur bei Klasse Element. Was `ja` und `nein`
  für Status, Wächter und `trigger` bedeuten:
  [[Einfrieren-und-Abloesen]] §Eintrittsregel.
- **Präfix-Zeile:** `- **Präfix:**` mit dem Präfix in
  Code-Spanne (`` `XXX` ``) oder `` `—` `` (auch der
  Gedankenstrich in Code-Spanne) —
  genau eine am Fassaden-Typ eines Register-Eintrags.
  Sie nennt den ID-Präfix des Registers; das
  Präfix-Muster am `id`-Feld des Element-Typs muss
  dazu passen. `—` steht bei Registern ohne ID-Präfix
  (Entitäten, Inline-Einträge).
- **Dokumenttypen-Zeile:** `- **Dokumenttypen:**
  [[Katalog-<Name>]], …` oder `—` — am Element-Typ
  der Klasse Element: die Dokumenttyp-Einträge, deren
  Stände dieses Register filtern (die Gegenrichtung
  zur Zeile „Quell-Register und Filter“ im
  Dokumenttyp-Eintrag). Die Zeile enthält nur
  Wikilinks auf Dokumenttyp-Einträge, durch Komma
  getrennt, oder `—`; ein Klammerzusatz hinter einem
  Link ist Erläuterung. Über Prozessgrenzen gilt: ein
  Eintrag wird verlinkt, wenn er in jedem Projekt
  vorhanden ist, in dem auch der nennende Eintrag
  liegt — aus demselben Prozess, aus der Basis oder
  aus einem Prozess, den der nennende Prozess erweitert
  (z.B. RP-1 → SP-1). Sonst (Basis → Prozess, oder ein
  Prozess → ein Prozess, der ihn erweitert) wird er
  ohne Wikilink mit Prozess-Kürzel genannt, als
  eigener Satz nach den Links („mit SP-1:
  Testplan.“); der Link entsteht erst mit dem Merge.
- **Registerblock:** Ein Register-Eintrag ist streng
  gleich gebaut — Fassaden-Typ: Zweck · Replaces type
  · Pflichtfelder · Präfix · Datei · Singleton;
  Element-Typ: Zweck · Extends · Replaces type ·
  Klasse · Freeze ab · Sammelzustand · Pflichtfelder ·
  Empfohlen · Optional · Dokumenttypen · Beispielname ·
  Ablage · Kanonizität · Struktur-Konventionen. Ein
  Einzeltyp-Eintrag folgt der Reihenfolge des
  Element-Typs, mit Datei und Singleton vor
  Beispielname. Welche Zeile Pflicht, Kann oder
  verboten ist, sagt die Tabelle unten; fehlt eine
  Kann-Zeile, rücken die folgenden auf.
- **Dokumenttyp-Block:** Ein Dokumenttyp-Eintrag
  (`art: dokumenttyp`) beschreibt genau einen
  Dokumenttyp in einem Abschnitt `### <kennung>`
  (Kennung klein, ohne Umlaut, z.B. `testplan`,
  `deploy-stand`); die Kennung ist der Wert von
  `type:` im Kopf jedes Dokuments dieses Typs. Zeilen
  in fester Reihenfolge: **Zweck** (bei Pflicht-Ständen
  der Freigabe-Zweck „für …“, Vorgehen.md §4;
  Lese-Regel unten) · **Phase** (P<n>,
  `Marken-Abschluss` oder `—`)
  · **Verbindlichkeit** (`pflicht` — der Prozess
  braucht den Stand — oder `optional` — der Anwender
  beauftragt) · **Grad** (`wiki-verweisend` für einen
  Stand, `selbsttragend` für eine Ableitung aus einem
  Stand; Grade: MasterPrompt §9.6) · **Auslöser** (die
  einzige Regelstelle für den Auslöser dieses Typs;
  die Zeile beginnt mit `Standard`,
  `Angebots-Auslöser:` oder `eigener Auslöser:`, siehe
  unten) · **Quell-Register und Filter** (welche
  Register mit welchem Filter in den Stand eingehen
  und was kopiert wird; bei selbsttragenden
  Ableitungen der Quell-Stand) · **Pflichtfelder**
  (die Kopf-Felder des Dokuments: `type: <kennung>`
  und die Herkunftszeile — bei Ständen `marke`,
  `zweck`, `herkunft`, `datum` (seit 2.0), bei
  selbsttragenden Ableitungen
  `marke` und `quell_stand`; Bedeutung der Felder:
  [[Einfrieren-und-Abloesen]] §Stand) · **Ablage**.
  Keine Klassen-, Freeze-, Sammelzustand- oder
  Präfix-Zeile: ein Stand ist das Dokument, in das
  Elemente eingehen; eine selbsttragende Ableitung
  ist ein Nachweis ([[Einfrieren-und-Abloesen]]
  §Stand, §Klassen). Nachweis einer Prüfung ist nie
  ein Dokumenttyp, sondern ein `review-report`.
- **Auslöser-Zeile, Standard:** `Standard` heißt bei
  einem Pflicht-Stand: Freigabe in der Ordnung der
  Kette nach der Kettenprüfung gegen alle
  freigegebenen Vorgänger der Marke
  ([[Kettenpruefung]]); bei einer selbsttragenden
  Ableitung, die das Produkt beschreibt: die Freigabe
  eines Stands „für P11 Ausliefern“ oder Zuruf, davor
  das Pflicht-Angebot des Agenten. Nach `Standard`
  nennt die Zeile nur, was der Typ zusätzlich hat.
  Optionale Stände tragen einen
  `Angebots-Auslöser:`; Ableitungen und Pflicht-Stände
  mit eigenem Anlass (z.B. der Abschluss-Stand in der
  Marken-Wechsel-Prozedur) tragen einen
  `eigener Auslöser:`.
- **Kennung und Dateiname eines Dokumenttyps:**
  Kennung klein, ohne Umlaut, deutsch; Dateiname
  `Katalog-<Name>.md` ohne Umlaut. Stimmt der Name im
  Wortstamm mit dem Namen eines Register-Eintrags
  überein (gleiches Wort, nur Einzahl oder Mehrzahl
  verschieden, z.B. Konzept zu Konzepte,
  Funktionsbeschreibung zu Funktionsbeschreibungen),
  erhält der
  Dokumenttyp den Zusatz `-stand` in der Kennung und
  `-Stand` im Dateinamen (`konzept-stand`,
  `Katalog-Konzept-Stand.md`). Ein Name, der sich durch
  ein eigenes Wort unterscheidet (Architekturdokument,
  Technologie-Entscheidungen, Testplan), braucht den
  Zusatz nicht.

**Zeilen je Art und Klasse** (Pflicht | Kann |
verboten; „Element“ usw. meint die Klasse des
Typ-Abschnitts, auch bei Einzeltypen):

| Zeile | Fassaden-Typ eines Registers | Klasse Element | Klasse Nachweis | Klasse außerhalb | Dokumenttyp |
|---|---|---|---|---|---|
| Zweck | Pflicht | Pflicht | Pflicht | Pflicht | Pflicht |
| Extends | verboten | Kann | Kann | Kann | verboten |
| Replaces type | Kann | Kann | Kann | Kann | verboten |
| Klasse | verboten | Pflicht | Pflicht | Pflicht | verboten |
| Freeze ab | verboten | Pflicht | Pflicht | verboten | verboten |
| Sammelzustand | verboten | Pflicht | verboten | verboten | verboten |
| Pflichtfelder | Pflicht | Pflicht | Pflicht | Pflicht | Pflicht |
| Präfix | Pflicht | verboten | verboten | verboten | verboten |
| Empfohlen, Optional | Kann | Kann | Kann | Kann | verboten |
| Dokumenttypen | verboten | Pflicht | verboten | verboten | verboten |
| Datei | Pflicht | Kann | Kann | Kann | verboten |
| Singleton (Markierung, nur bei Singletons) | Kann | Kann | Kann | Kann | verboten |
| Beispielname, Kanonizität, Struktur-Konventionen | Kann | Kann | Kann | Kann | verboten |
| Ablage | verboten | Kann | Kann | Kann | Pflicht |
| Phase, Verbindlichkeit, Grad, Auslöser, Quell-Register und Filter | verboten | verboten | verboten | verboten | Pflicht |

Datei und Singleton stehen bei einem Einzeltyp, der
eine Fassade ohne Element-Typ ist. „Verboten“ betrifft
die genannten Grammatik-Zeilen; Zusatzzeilen sind
überall erlaubt (Lese-Regel c).

**Lese-Regeln:**

- **(a) Wert einer Zeile:** Der Wert ist das erste
  Wort nach dem Doppelpunkt, ohne Satzzeichen am Ende
  (bei `Phase` das `P<n>`, `Marken-Abschluss` oder
  `—`; bei `Präfix` der Präfix oder `—`, beide in
  Code-Spanne). Ein Klammerzusatz
  danach ist Erläuterung und wird nicht gelesen.
  Eigene Regeln haben die Pflichtfeld-Zeile (oben),
  der Zweck (b) und die Dokumenttypen-Zeile (d).
- **(b) Zweck eines Pflicht-Stands:** Der Freigabe-Zweck
  ist das erste Zitat „für …“ der Zeile; Text danach
  ist Erläuterung. Bei optionalen Ständen und
  selbsttragenden Ableitungen ist der Zweck freier
  Text.
- **(c) Zusatzzeilen:** Eine Zeile, die der
  Registerblock bzw. der Dokumenttyp-Block nicht nennt
  (z.B. Enum-Werte, Lint-Hinweise,
  Cross-Repo-Adressierung, Prozess-Präzisierung,
  Ableitung nach außen), steht am Ende des Abschnitts,
  nach allen Zeilen des Blocks. Der Lint liest sie
  nicht.
- **(d) Dokumenttypen-Zeile:** Wikilinks auf
  Dokumenttyp-Einträge oder `—`; Nennung über
  Prozessgrenzen wie bei der Dokumenttypen-Zeile oben
  beschrieben.

**Weitere Typ-Konventionen:**

- **`vorgaenger:`** (Definition für alle Typen): ein
  Vorgänger **ohne Ablösung** — der Vorgänger bleibt
  gültig (CON: parallel geltendes Element;
  `review-report`: Prüfberichte der vorigen Runde).
  Gegenstück ist `supersedes:` (Ablösung, Listen
  beidseitig). Umbenennung mit gleichem Inhalt ist
  weder das eine noch das andere, sondern ein
  `alias:`. Die Frontmatter-Regeln (Wiki.md §4.1)
  verweisen für `vorgaenger:` hierher.
- **`ueberlagert:`** (alle Element-Typen): Liste wie
  `supersedes:`, aber einseitig und nur an einem
  Element mit der `zielmarke:` einer Sackgasse — es
  ersetzt das genannte Element nur für die Sackgasse,
  das überlagerte Element bleibt unverändert. Format
  und Lesart: [[Zielmarken]] §Meta „Zwischenmarke“.
- **Lint-Richtung:** vom `type:` eines Knotens zum
  Abschnitt gleichen Namens in den Katalog-Einträgen —
  bei Register-Einträgen zum Fassaden- bzw.
  Element-Typ im Tupel, bei Dokumenten in `output/`
  zum Dokumenttyp-Abschnitt. Lesebereich im Projekt:
  alle Katalog-Einträge in `wiki/`. Der Lint liest nur
  die oben genannten Zeilen (Pflichtfelder, Extends,
  Replaces type, Präfix-Muster, `(seit <Marke>)`,
  Klasse, Freeze ab, Sammelzustand, Präfix,
  Dokumenttypen, Dokumenttyp-Block); Wertlisten
  (Enums, Formate außer dem Präfix-Muster) und
  Inhalte prüft er nicht. Welche dieser Zeilen der
  Lint-Kern (`tools/lint.sh`) bereits auswertet, sagt
  seine Liste „Nicht geprüft“.

---

## Einträge

### Register-Einträge

Je Register ein Eintrag mit Fassaden-Typ und
Element-Typ.

- [[Katalog-Katalog]] — dieser Katalog und seine
  Einträge (`catalog`, `catalog-entry`); lesen, wenn ein
  Eintrag angelegt oder geprüft wird.
- [[Katalog-Chronologie]] — Zeitachse und gewichtige
  Ereignisse (`timeline`, `event`); lesen beim Ingest
  und bei Ereignis-Knoten.
- [[Katalog-Fristen]] — Fälligkeiten und gewichtige
  Fristen (`deadline-log`, `deadline`); lesen beim
  Ingest und im Frist-Lebenszyklus.
- [[Katalog-Konzepte]] — Sach-Wissens-Anker
  (`concept-log`, `concept`); lesen vor dem Anlegen
  eines Konzept-Knotens.
- [[Katalog-Zielmarken]] — Planungs-Horizonte mit
  Zeigern (`target-mark-log`, `target-mark`); lesen bei
  Marken-Planung und `zielmarke:`-Feld.
- [[Katalog-Rollen]] — Rollen-Definitionen
  (`role-log`, `role`); lesen, bevor eine Rolle
  angelegt oder per `rollen:` referenziert wird.
- [[Katalog-Bedarfe]] — Bedarfe als Vorstufe der
  Anforderungen (`need-log`, `need`); lesen beim
  Anlegen eines NEED-Eintrags.
- [[Katalog-Szenarien]] — Szenarien als Vorstufe der
  Anforderungen (`scenario-log`, `scenario`); lesen
  beim Anlegen eines SCEN-Eintrags.
- [[Katalog-InterneMechanik]] — Steuerungs-Wissen des
  Projekts (`internal-machinery-log`, `internal-concept`,
  `internal-procedure`, `internal-pattern`,
  `internal-rule`); lesen vor jedem neuen
  Mechanik-Knoten.
- [[Katalog-Ideen]] — unverbindliche Ideen mit
  8-Zustands-Status (`idea-log`, `idea`); lesen bei
  IDEA-Einträgen.
- [[Katalog-Entscheidungen]] — Entscheidungen mit
  Freeze und Ablösung (`decision-log`,
  `decision`; SP-1-Präzisierung MADR); lesen vor jeder
  DEC-Buchung.
- [[Katalog-Eingangsdokumente]] — Eingangsdokumente mit
  Dokumenttyp-Enum (`input-document-log`, `document`);
  lesen beim Ingest.
- [[Katalog-Agent-Berichte]] — Sub-Agent-Berichte
  (`agent-report-log`, `agent-report`); lesen bei
  Sub-Agent-Rückkehr. Prüf- und Konvergenz-Berichte:
  [[Katalog-review-report]], [[Katalog-convergence-report]].
- [[Katalog-Rechercheartefakte]] — externe Recherche
  als Nachweis (`research-artifact-log`,
  `research-artifact`); lesen nach Recherche-Abschluss.
- [[Katalog-Personen]] — Personen-Entities
  (`person-log`, `person`); lesen beim Ingest.
- [[Katalog-Orte]] — Orts-Entities (`place-log`,
  `place`); lesen beim Ingest.
- [[Katalog-Organisationen]] — Organisations-Entities
  mit Typ-Enum (`organization-log`, `organization`);
  lesen beim Ingest.
- [[Katalog-Dinge]] — physische Dinge mit Abgrenzung
  (`thing-log`, `thing`); lesen beim Ingest.
- [[Katalog-Mitgliedschaften]] — Relation
  Person↔Organisation (`member-log`, `member`); lesen
  bei Mitgliedschafts-Relationen.

### Dokumenttyp-Einträge

Je Dokumenttyp ein Eintrag (Dokumenttyp-Block). Die
Basis bringt die Marken-Typen mit; die Glieder der
Kette P1–P11 bringt der aktive Prozess als
Dokumenttyp-Einträge mit (Abschnitt
§Prozess-mitgebrachte Einträge). Reihenfolge und
Prüfung der Freigaben: [[Kettenpruefung]].

- [[Katalog-Abschluss-Stand]] — Pflicht-Stand beim
  Marken-Abschluss (`abschluss-stand`); lesen, wenn
  eine Marke abgeschlossen wird.
- [[Katalog-Release-Notes]] — selbsttragende
  Ableitung aus dem Abschluss-Stand (`release-notes`,
  optional); lesen, wenn der Zuwachs einer Marke nach
  außen gezeigt werden soll.
- [[Katalog-Uebersicht-gueltiger-DECs]] — optionaler
  Stand über die gültigen Entscheidungen
  (`dec-uebersicht`); lesen, wenn eine externe Prüfung
  oder Übergabe den Entscheidungsstand braucht.

### Einzeltyp-Einträge

**Fassaden ohne Element-Typ:**

- [[Katalog-Mission-Statement]] — Projekt-Überblick
  Kurzform (`mission`); lesen, wenn der Überblick
  angelegt oder geändert wird.
- [[Katalog-Mission-Statement-Long]] — Projekt-Überblick
  Langform (`mission-long`); lesen, wenn die Langform
  angelegt oder geändert wird.
- [[Katalog-Facts]] — Projekteinstieg und
  Anwender-Fakten (`facts`); lesen, wenn Anwender-Fakten
  nachgetragen werden.
- [[Katalog-Fassaden]] — FassadenLandkarte
  (`facade-registry`); lesen, wenn eine Fassade
  aktiviert, deaktiviert oder neu angelegt wird.
- [[Katalog-Aktenzeichen]] — Aktenzeichen-Register
  (`file-number-log`); lesen, wenn ein Aktenzeichen
  aufgenommen wird.
- [[Katalog-Ansprechpartner]] — Zuständigkeiten
  (`contact-log`); lesen, wenn eine Zuständigkeit
  eingetragen wird.
- [[Katalog-Glossar]] — freigegebene Terminologie
  (`glossary`); lesen, wenn ein Begriff freigegeben
  oder nachgeschlagen wird.
- [[Katalog-Glossar-Review]] — Glossar-Vorschläge in
  Bearbeitung (`glossary-review`); lesen, wenn ein
  Begriff vorgeschlagen oder geprüft wird.

**Element-Typen ohne eigenes Register:**

- [[Katalog-review-report]] — Prüfbericht einer
  Review-Runde, erweitert `agent-report`
  (`review-report`); lesen, wenn ein Prüfer berichtet.
- [[Katalog-convergence-report]] — Konvergenz-Bericht
  nach der Runden-Obergrenze, erweitert `agent-report`
  (`convergence-report`); lesen, wenn eine Review-Kette
  ohne Reife endet.
- [[Katalog-message]] — Nachricht zwischen Repos im
  Verbund (`message`, Präfix MSG, ohne Fassade, Ablage
  `output/nachrichten/` des Absenders); lesen, bevor
  eine Nachricht geschrieben oder aus ihr gebucht wird.
- [[Katalog-case]] — laufendes Verfahren (Rechtsfall,
  `case`); lesen, wenn ein Verfahren angelegt wird;
  bleibt bis zur SP-2-Ausarbeitung in der Basis.
- [[Katalog-argument]] — Argumentationslinie
  (Rechtsfall, `argument`); lesen, wenn eine
  Argumentationslinie angelegt wird; bleibt bis zur
  SP-2-Ausarbeitung in der Basis.

**Relations ohne Register:**

- [[Katalog-evidence]] — Beweismittel-Beziehung
  (`evidence`); lesen, wenn eine Quelle als
  Beweismittel verknüpft wird.

**Infrastruktur-Typen der Template-Quelle** (brauchen
keine indexierende Fassade; nur die beim Merge
kopierten landen im Anwender-wiki):

- [[Katalog-process-procedure]] — Vorgehen und
  Marken eines Prozesses (`process-procedure`:
  `Vorgehen-<P>.md`, `Marken-<P>.md`); wird beim
  Merge kopiert; lesen beim Merge und wenn das
  Vorgehen oder die Marken eines Prozesses angepasst
  werden.
- [[Katalog-process-brief]] — Prozess-Steckbrief
  (`process-brief`); Template-Quelle, nie kopiert;
  lesen bei der Prozess-Wahl, der Vererbungs-Prüfung
  (Wiki.md §11.2) und beim Merge.
- [[Katalog-process-mapping]] — Prozess-Landkarte
  `index.md` (`process-mapping`); Template-Quelle, nie
  kopiert; lesen bei der Prozess-Wahl und beim Merge.
- [[Katalog-facade-bootstrap]] — Einmal-Anweisungen je
  Fassade (`facade-bootstrap`); Template-Quelle, nie
  kopiert; lesen bei der Bootstrap-Abarbeitung nach dem
  Merge (Wiki.md §11.3).

### Prozess-mitgebrachte Einträge

_(beim Prozess-Merge ergänzt — je mitgebrachtem
Eintrag eine Zeile wie oben, mit Zusatz
„(Prozess-mitgebracht (<Prozess>))“; Wiki.md §11.3.
Prozess-spezifische Typen werden nicht in der Basis
geführt. Das gilt für Register-, Dokumenttyp- und
Einzeltyp-Einträge gleichermaßen; die
Dokumenttyp-Einträge der Kette P1–P11 bringt SP-1
mit, RP-1 präzisiert sie als Ergänzung im jeweiligen
Abschnitt.)_

### Projektspezifische Erweiterungen

_(Projekte ergänzen hier Zeilen für eigene
Katalog-Einträge, die über den Standardkatalog
hinausgehen. Eintrag nach den Typ-Konventionen oben;
jeder neue Detail-Typ braucht eine indexierende Fassade
und einen Katalog-Eintrag.)_

_(vom User oder Agenten bei Bedarf gefüllt)_
