---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Deploy-Stand

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Deploy-Stand je Umgebung zu Marke M“
der Phase P13 (Kennung `deploy-stand`), abgeleitet aus
dem DEPL-Register ([[Katalog-Deployments]]).
Es gibt ihn je Zielumgebung (warum: Zwei Achsen in
der `## Meta` von [[Deployments]]). Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### deploy-stand

- **Zweck:** „für P13 Ausliefern“ — die Auslieferung
  in diese Umgebung darf den Stand als verlässliche
  Grundlage nehmen; sein freigegebener Stand ist
  Quell-Stand und Vorbedingung der Betriebs-Anleitung
  seiner Umgebung ([[Katalog-Betriebs-Anleitung]]),
  deren Zeitpunkt und Form die Doku-Abfrage
  entscheidet, nicht die Freigabe.
- **Phase:** P13
- **Verbindlichkeit:** pflicht (je Zielumgebung) —
  beim **Koordinator** für alle Komponenten seiner
  §Komponenten-Zeilen, der den Gesamt-Deploy
  verantwortet; eine Komponente bildet ihn nur mit
  eigener Zielumgebung ([[Kettenpruefung]] §Fehlende
  und vertretene Glieder; Standalone: wie der
  Koordinator).
- **Grad:** wiki-verweisend
- **Auslöser:** Standard, je Umgebung (Testbericht
  als Vorbedingung: [[Kettenpruefung]] §Code-Glieder;
  Lint-Anteil DEPL: §Lint-Anteil). In der
  Freigabe-Ordnung stehen Entwickler-Doku und
  Benutzer-Doku vor ihm: fehlt eines ohne Verzicht,
  warnt der Agent, und der Freigabe-Eintrag nennt das
  fehlende Glied als Einschränkung „Doku folgt“ —
  keine Blockade ([[Kettenpruefung]] §Kette,
  Doku-Glieder). Weist der
  Testbericht nicht bestandene oder blockierte
  Testfälle aus, legt der Agent die Freigabe trotzdem
  vor und der Anwender entscheidet — Einschränkung im
  Freigabe-Eintrag und Fehlerstand-Angebot: `## Meta`
  von [[Testberichte]]. Zu einer Marke kann es je
  Umgebung mehrere Deploy-Stände geben — so oft die
  Umgebung anders ausgerollt wird (Konfiguration,
  Zielsystem, Ablauf; auch zur Behebung eines Fehlers
  in der Auslieferung — Fix-Anforderung auf einen
  Deploy, [[Anforderungen]] „Fehlerbehebungen“: sie ist
  mit der Freigabe des Stands umgesetzt) —; je Umgebung
  gilt der jüngste, und jeder weitere Stand derselben
  Umgebung ist der Anlass einer neuen Version ihrer
  Betriebs-Anleitung (Zeile der Doku-Abfrage für diese
  Umgebung nachgestellt: [[Kettenpruefung]] §Kette,
  Doku-Abfrage).
  Weiterer Stand zu einer abgeschlossenen Marke
  (Nachtrag-Fall: eine neue Umgebung, oder eine
  Umgebung mit freigegebenem Deploy-Stand, die anders
  ausgerollt wird): der Stand wird
  als Nachtrag am Marken-Eintrag gebucht, seine
  Freigabe steht als Formel in der Nachtragszeile —
  kein eigener Freigabe-Eintrag, keine Ablösung — und
  wirkt wie jede Deploy-Stand-Freigabe (Pflicht-Freigabe
  dieser Umgebung für Lint und Vollständigkeits-Scan;
  Zeitpunkt und Form der Betriebs-Anleitung dieser
  Umgebung entscheidet die nachgestellte Zeile der
  Doku-Abfrage); sie ist kein Meilenstein-Anlass
  ([[Meilenstein-und-T2]]). Seine Quell-Elemente — die
  DEPL der neuen Umgebung bzw. die neuen DEPL und die
  Nachfolger abgelöster DEPL der anders ausgerollten
  Umgebung, und eine Entscheidung, die
  nur diese Umgebung betrifft — tragen `zielmarke: M`,
  die Marke des ausgelieferten Produkt-Stands
  ([[Katalog-Deployments]], [[Katalog-Entscheidungen]];
  ist nicht eindeutig, ob eine Entscheidung nur die
  Umgebung betrifft, fragt der Agent); braucht das
  Ausrollen eine Änderung an einer SPEC oder am Produkt,
  ist das kein Nachtrag, sondern eine neue Marke. Erneutes
  Ausrollen ohne Änderung ist Betrieb — kein neuer
  Stand, keine Freigabe. Format und Regel:
  [[Zielmarken]] §Meta (Nachtrag) — lesen, bevor ein
  solcher Stand gebildet wird. **Folge-Marke mit
  eigenem Tag** ist weder Betrieb noch Nachtrag: ihr
  Produkt ist neu, der Deploy-Stand der Vormarke (mit
  dem alten Tag in `herkunft`) gilt für sie nicht als
  übernommen — je Umgebung entsteht die
  **Folge-Version** mit eigener Freigabe „für P13
  Ausliefern zu Marke M“, bei unverändertem Ausrollen
  mit unverändertem Text (Empfehlung des Agenten;
  [[Kettenpruefung]] §Kette, Folge-Marke mit eigenem
  Tag). Ohne eigenen Tag bleibt die Übernahme.
- **Quell-Register und Filter:** DEPL-Elemente der
  Umgebung aus [[Deployments]] (je Umgebung und
  Aspekt, mit `umgebung:` und `komponente:`), dazu die
  SPEC der Pipeline aus [[Spezifikationen]] und die
  Entscheidungen (DEC) zum Deployment aus
  [[Entscheidungen]] — jeweils Elemente der Marke mit
  Status `angenommen`, `in-umsetzung`, `umgesetzt`
  oder `abgeschlossen`, DEPL und SPEC an einer
  vorgelegten, noch nicht freigegebenen Version auch
  `offen` — im Kopf ausgewiesen, mit der Freigabe
  angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung) — (nicht verworfen; für die Marke
  nicht abgelöst — ein Element mit Status `abgelöst`
  gehört dazu, solange sein Nachfolger für die Marke
  nicht gilt, [[Einfrieren-und-Abloesen]] §Stand; mit
  `zielmarke:` dieser oder einer
  früheren Marke, Bestands-Elemente ohne Feld
  eingeschlossen) — und der Tag der
  Implementierung. Kopiert werden die Daten der
  Zielumgebung ([[Zielumgebungen]]: Provider, Hosts,
  Versionen, Verweise auf Zugangsdaten) und die Lage
  aus §Komponenten der Architektur-Fassade.
- **Pflichtfelder:** `type: deploy-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (seit 2.0) (Herkunftszeile und
  Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand), `umgebung` (die Zielumgebung dieses Stands)
- **Ablage:** `output/`, versioniert (`_VV_TLA`); der
  Name trägt die Umgebung als Gegenstand
  (`<Datum> - Deploy-Stand - <Umgebung>_VV_TLA.md`),
  so dass jeder Umgebungs-Stand seine eigene Ketten-ID
  hat ([[Einfrieren-und-Abloesen]] §Stand, Dateiname);
  ein weiterer Stand derselben Umgebung zu derselben
  Marke ist eine neue Version dieser Ketten-ID (`VV`
  zählt hoch), es gilt die jüngste ([[Zielmarken]]
  §Meta, Nachtrag); in einer Folge-Marke mit eigenem
  Tag wird dieselbe Ketten-ID als Folge-Version mit
  `marke:` der Folge-Marke fortgeführt — der einzige
  Fall einer neuen Version über die Marken-Grenze, es
  gilt die jüngste je Marke ([[Einfrieren-und-Abloesen]]
  §Stand).
  In der Zwei-Repo-Standardbelegung bleibt er in
  `output/` der Werkstatt ([[Two-Repo-Submodul-Muster]]).
- **Herkunft:** `herkunft` führt zusätzlich den Tag
  der Implementierung und den Testbericht (TRES), an
  dem die Freigabe hängt — immer den Tag und den
  Testbericht der eigenen Marke, nie den der Vormarke
  (Eintragsformat: [[Einfrieren-und-Abloesen]] §Stand).
- **Ausgeliefert an (Kann-Feld):** `ausgeliefert_an`
  (Liste) nennt Empfänger oder Umgebungen **außerhalb
  des Projekts**, an die dieser Stand ausgeliefert
  wurde — Kunden, Betriebs-Projekte, fremde Rechner;
  fehlt das Feld oder ist es leer, betrifft der Stand
  nur eine projekt-eigene Umgebung. Das Feld ist die
  Empfänger-Liste für den Rückzug eines fehlerhaft
  verteilten Stands ([[Lebenslauf-eines-Stands]]
  §Rückzug eines verteilten Stands, Schritt „Wer hat
  es“); fehlt es, kennt der Agent die Empfänger nicht.
- **Rückzug:** eines ausgelieferten Stands —
  [[Lebenslauf-eines-Stands]] §Rückzug eines
  verteilten Stands; lesen, sobald ein Fehler an einem
  ausgelieferten Stand gemeldet wird.
- **Nachweise:** der freigegebene Deploy-Stand ist
  eingefroren; was zur ausgelieferten Fassung später
  kommt — die Abnahmebestätigung des Empfängers, ein
  Protokoll der Inbetriebnahme — ändert nichts am Stand
  und kommt daneben: als angehängter, datierter Vermerk
  oder als Datei im Unterordner `nachweis/` neben dem
  Stand, in dem nur hinzugefügt wird
  ([[Einfrieren-und-Abloesen]] §Nachweis).
- **Überführungs-Frage:** beim **ersten** Deploy-Stand
  einer Zielumgebung fragt der Agent, ob der Betrieb
  dieser Umgebung in ein Infrastruktur-Projekt
  überführt, mit Bausteinen aus RP-2 hier behalten
  oder wie bisher behalten wird — [[Vorgehen-SP-1]] §2
  Anmerkung P13; lesen, bevor der erste Deploy-Stand
  einer Umgebung vorgelegt wird.
- **RP-2-Präzisierung** (gilt bei aktivem RP-2): Der
  Deploy-Stand führt seine Deployment-Einträge **je
  Aspekt** (Installation, Betrieb, Sicherung und
  Wiederherstellung, Überwachung, Zugang —
  [[Katalog-Deployments]] RP-2-Präzisierung), damit
  jedes Kapitel der Betriebs-Anleitung eine Quelle hat;
  fehlt ein Aspekt, meldet das Inbetriebnahme-Tor bei
  der Freigabe der Betriebs-Anleitung
  ([[Katalog-Betriebs-Anleitung]] RP-2-Präzisierung).
  Der Tag in `herkunft` ist der Tag des Rezepts. Nach
  dem Ausrollen tritt das **Abnahmeprotokoll** als
  Nachweis neben den Stand (`Abnahmeprotokolle.md` (RP-2),
  Grundsatz nach dem Zeitpunkt: `Vorgehen-RP-2.md` §2
  Anmerkung P10/P13); es ändert den Stand nicht. Bei der
  Marken-Art **Abbauen** hat der Stand die Gestalt
  **„abgebaut“**: je Umgebung ein Deploy-Stand mit Zweck
  „für P13 Ausliefern“ — ausgeliefert wird der Abbau —,
  der festhält, dass in der Umgebung nichts mehr gilt,
  und **keine Deployment-Einträge** führt
  (Quell-Register leer, im Kopf ausgewiesen mit dem
  Feld `gestalt: abgebaut` — nur an dieser Gestalt,
  dort Pflicht; das Prüfprogramm liest es am geltenden
  Deploy-Stand der Umgebung); die
  Zielumgebung bekommt zugleich den Zustand `abgebaut`
  mit Datum ([[Katalog-Zielumgebungen]]
  RP-2-Präzisierung), das Prüfprogramm meldet, wenn nur
  eines von beiden gesetzt ist. Bedingung seiner
  Freigabe ist das **Abschalt-Tor** (Verifikation,
  Re-Inventur, Vorab-Sicherung — führender Ort
  `Vorgehen-RP-2.md` §5; Ablauf des Abbaus
  `Marken-RP-2.md` §4). Startet das RP-2-Projekt aus
  einer Überführung, entsteht sein erster Deploy-Stand
  für die übernommene Umgebung mit dem ersten getaggten
  Rezept; Zielumgebung und Lieferbeziehung kommen aus
  dem Startprompt (`Vorgehen-RP-2.md` §7).
