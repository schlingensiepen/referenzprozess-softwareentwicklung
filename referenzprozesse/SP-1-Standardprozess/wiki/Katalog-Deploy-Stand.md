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
