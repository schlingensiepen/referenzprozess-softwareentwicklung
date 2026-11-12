---
type: catalog-entry
art: register
---

# Katalog-Fristen

Register-Eintrag: Fassade `deadline-log` ([[Fristen]])
mit Element-Typ `deadline`.

### deadline-log

- **Zweck:** Fälligkeitsübersicht mit Sektionen
  Offen/Erledigt/Abgelaufen
- **Pflichtfelder:** `type: deadline-log`
- **Präfix:** `—`
- **Datei:** `wiki/Fristen.md`
- **Singleton**

### deadline

- **Zweck:** gewichtige Frist mit Kontext,
  Teilschritten, Historie (Hybrid zu Fristen)
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: deadline`, `status`
  (`offen`/`erfuellt`/`abgelaufen`), `due`
  (`YYYY-MM-DD`), `richtung` (seit 2.2) (`gegen-uns` |
  `für-uns`; Vorgabe `gegen-uns`)
- **Empfohlen:** `case`, `source` (String-Slugs, keine
  Wikilinks — Wiki.md §4.1; `case` nennt den
  `case`-Knoten mit seinem Dateinamen ohne `.md`,
  seiner `id` oder einem `alias` — dagegen gleicht das
  Prüfprogramm ab)
- **Optional:** `fulfilled_at` (bei `erfuellt`),
  `erfuellt_durch` (Wikilink-Slug des Eingangsdokuments,
  das eine Erwartung erfüllt hat)
- **Beispielname:**
  `2026-05-15 Frist Bindefrist Angebot 2026-117.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Fristen.md`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Fristen]].
- **Richtung:** `gegen-uns` — wir müssen handeln (die
  Regel; Pflicht, deren Ablauf uns trifft).
  `für-uns` — ein anderer muss handeln, uns wird etwas
  geschuldet, oder der Ablauf der Frist wirkt für uns
  (Sperrfrist, nach deren Ablauf wir handeln dürfen;
  Bekanntgabe-Fiktion; Verjährung eines Anspruchs gegen
  uns; Wartefrist). Ein Projekt, das auf einen älteren
  Template-Stand gehoben wird, bekommt an Fristen ohne
  Feld die Vorgabe `gegen-uns` eingetragen
  (maschinell gelesenes Feld). Das Feld gilt mit
  denselben Werten auch für eine **Zusage** in
  Prozessen, die Zusagen führen: wir schulden =
  `gegen-uns`, uns wird geschuldet = `für-uns`.
- **Erwartung an Dritte = Frist `für-uns`.** Was ein
  Dritter uns schuldet — Antwort einer Behörde,
  Entscheidung eines Gerichts, Lieferung eines Partners,
  Bestätigung eines Empfängers nach einem Rückzug
  ([[Lebenslauf-eines-Stands]] §Rückzug) — ist eine
  Frist mit `richtung: für-uns` in diesem Register,
  kein Abschnitt in `TODO.md` und kein eigener Typ.
  Kommt der erwartete Eingang, setzt der Agent die
  Frist auf `erfuellt` mit Link auf das
  Eingangsdokument (`erfuellt_durch`). Läuft sie ab,
  schlägt der Agent eine Sachstandsanfrage oder
  Erinnerung vor (Aktions-Entwurf) — kein eigener
  Wächter, der Ablauf meldet der vorhandene
  Frist-Lebenszyklus-Check (MasterPrompt §5.3 C4) mit
  der Richtung im Text. Warum so: Was erwartet wird,
  läuft so immer sichtbar in der Pipeline („wir
  erwarten Rückmeldung von …“), und was bei Ablauf
  einer Frist passiert, ist allgemein geregelt.
  Die Wiedervorlage in `TODO.md` bleibt für eigene
  Fragen und Erinnerungen des Agenten
  ([[Standarddateien-Katalog]] §2.11).
- **Gleiche Feldnamen in allen Prozessen.** Prozesse
  erweitern die Frist um eigene Felder (etwa
  Entstehung, Wirkung, Zeitbudget als spätester Tag zum
  Handeln, sperrende Frist); solche Felder stehen im
  Katalog-Eintrag des Prozesses, **nicht hier**. Die
  Basis legt fest: ein Feld hat in allen Prozessen
  denselben Namen, die Werteliste steht je Prozess in
  dessen Katalog-Eintrag. Der gemeinsame
  Fristen-Wächter der Basis (C4) prüft ein Zeitbudget
  überall, wo ein Prozess das Feld deklariert hat — aus
  jedem Anlass, nicht nur beim Review.
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade — die Fassade Fristen
  ist in SP-2 **Pflicht ab Stufe 1** und führt):
  - **Zusätzliche Pflichtfelder an jeder Frist**
    (gleiche Feldnamen in allen Prozessen, Werteliste
    hier): **`entstehung`** — `gesetzlich` |
    `gerichtlich` (gerichtlich oder behördlich gesetzt)
    | `vertraglich` (vertraglich oder tariflich) |
    `selbst-gesetzt` | `zusage` (wir schulden oder uns
    wird geschuldet, mit `richtung`) | `erwartung`
    (Eingang eines Dritten, `richtung: für-uns`; jede
    Einreichung legt eine an, SP-2 Katalog-Einreichungen);
    **`wirkung`** — die Folge der Versäumung:
    `rechtsverlust` | `praeklusion` | `kostenfolge` |
    `verzoegerung`; dazu **`verlaengerbar`** — `ja` |
    `nein` — und **`wiedereinsetzung`** (Wiedereinsetzung
    möglich) — `ja` | `nein`. Drei eigene Felder, je
    eine Zeile im Frontmatter (ein Wert je Feld, damit
    der Kopf gültiges YAML bleibt; die Werte `ja` und
    `nein` liest das Prüfprogramm als Wörter):
    `wirkung: rechtsverlust`, `verlaengerbar: nein`,
    `wiedereinsetzung: ja` (im Register-Eintrag der
    Fassade die Felder „Wirkung“, „Verlängerbar“ und
    „Wiedereinsetzung“);
    **`zeitbudget`** — der späteste Zeitpunkt
    (`YYYY-MM-DD`), zu dem die fristwahrende Handlung
    beginnen muss, mit Puffer für Prüfung, Freigabe und
    Kanal; der gemeinsame Fristen-Wächter prüft ihn aus
    jedem Anlass (oben). **Frist mit Rechtsverlust:**
    bei einer Frist mit `wirkung: rechtsverlust` und
    `verlaengerbar: nein` eskaliert der Wächter gestuft vor dem
    Ablauf (HINWEIS, keine Sperre), an der Wirkung,
    nicht am Wort (in der ZPO heißt sie Notfrist, in
    anderen Ordnungen anders); die Runden-Obergrenze
    der Prüfung ist zusätzlich an das Zeitbudget
    gebunden.
  - **Bezeichnungen** (Feld Typ der Fassade) sind eine
    offene Liste mit Grundbestand aus den Wegweisern
    des Prozesses: Notfrist, gesetzliche Rechtsbehelfs-
    und Ausschlussfrist, Begründungsfrist, richterliche
    bzw. behördliche Frist, Präklusionsfrist,
    Sperrfrist, Wiedereinsetzungsfrist, Widerrufsfrist,
    materielle Ausschlussfrist, Verjährung mit Hemmung
    und Neubeginn, vertragliche und tarifliche
    Ausschlussfrist, Zusage, Erwartung.
  - **Entstehen und Rechnen:** jede Frist entsteht beim
    Einlesen des auslösenden Dokuments oder aus einer
    Berechnungsregel des Fristenkatalogs, nie aus dem
    Gedächtnis; Regel, Quelle und auslösendes
    Eingangsdokument stehen an der Frist (`source`);
    Datum und Wochentag rechnet das Werkzeug des
    Prozesses, `tools/frist-rechnen.py`, nicht das
    Modell (Fristende, Verschiebung bei Wochenende und
    bundeseinheitlichen Feiertagen nach dem Wegweiser
    „Zustellung und Fristen“; Landesfeiertage lädt der
    Agent je Projekt nach). **Unbestimmte
    Fristen** („unverzüglich“, „angemessen“) führt der
    Agent als selbst gesetzte Frist mit Begründung und
    kurzem Zeitbudget, `entstehung` bleibt `gesetzlich`.
    **Materielle Fristen** (Verjährung, Ausschluss-,
    Abrechnungs-, Schutzfristen) werden aus dem
    Sachverhalt berechnet (`source` nennt die Tatsache,
    SP-2 Katalog-Sachverhalt). Berechnungsregeln,
    Bekanntgabe-Fiktion je Kanal und Abrufpflicht
    stehen in den **Fristenkatalogen** — Wissensknoten
    je Referenzprozess (je Gerichtsbarkeit, Vorverfahren,
    Schiedsverfahren, Vollstreckung; je Abgabenart und
    Ordnung) — und im Wegweiser „Zustellung und
    Fristen“ des Prozesses; hier nur der Verweis.
  - **Richtung beim Anlegen:** `richtung` steht an
    jeder Frist, auch wo der Ablauf für uns wirkt
    (Sperrfrist vor der Untätigkeitsklage, Wartefrist
    vor der Vollstreckung, Verjährung eines Anspruchs
    gegen uns). Der Fristenkatalog nennt die Richtung
    in der Spalte Entstehung, wo sie nicht `gegen-uns`
    ist; „`richtung` je nach Seite“ setzt der Agent aus
    der Rolle des Anwenders im Verfahren. Bleibt die
    Richtung unklar, **fragt er den Anwender einmal**
    und trägt die Antwort an der Frist ein; bis zur
    Antwort gilt die Vorgabe `gegen-uns`, weil sie den
    Wecker schärfer stellt.
  - **Immer ein Wecker:** jeder aktive Fall hat
    mindestens eine offene Frist in diesem Register
    (gleich welcher Entstehung); ausgenommen sind Fälle,
    die abgeschlossen sind oder auf Anwender-Wort ruhen
    (Feld `ruht_auf` am `case`); der Wächter meldet
    „Kein Wecker gestellt“ als HINWEIS; erledigt der
    Agent die letzte offene Frist, fragt er im selben
    Zug nach der nächsten und schlägt sonst „Sachstand
    prüfen“ vor (Standard vier Wochen). Ruhen,
    Aussetzung und Unterbrechung sind Zustände von
    Verfahren und Marke, nie der Frist.
  - **Eskalation, Ablauf, Fristwahrung und Optionen:**
    Vorgehen des Prozesses, §Fristen — führender Ort
    dafür, was der Agent mit einer Frist tut (Warum des
    Weckers; gestufte Eskalation vor dem Ablauf; nach
    dem Ablauf Heilung, Entfall oder neuer Angriff;
    Wiedervorlage bei `für-uns`; Zeitbudget als
    generelle Anweisung mit den fristwahrenden
    Optionen); lesen, sobald ein Zeitbudget erreicht ist
    oder eine Frist abläuft.
  - **Unverändert:** `richtung`, `status`, `due`,
    Erwartung an Dritte als Frist `für-uns`,
    Register-Mechanik und `## Meta` der Fassade
    [[Fristen]] gelten weiter.
