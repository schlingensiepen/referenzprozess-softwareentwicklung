---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Benutzer-Doku

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Benutzer-Doku zu Marke M“ der Phase
P12 Dokumentieren für Benutzer (Kennung
`benutzer-doku`) — ein **selbsttragender Stand** für
die Benutzer des Produkts, die es ohne Hilfe benutzen
sollen. „Benutzer“, nicht „Anwender“: Anwender ist im
Template die Person, die mit dem Agenten arbeitet;
Benutzer sind die Leser dieses Dokuments. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### benutzer-doku

- **Zweck:** „für P13 Ausliefern“ — ein Fremder kann
  das Produkt ohne Hilfe benutzen: was es leistet, wie
  man es bedient, was es nicht tut. Dieser Satz ist der
  Maßstab für Inhalt und Gliederung; eine feste
  Kapitelliste gibt es nicht. Vor der Vorlage an den
  Anwender ist der Verständnis-Check M6
  (`Reviewmuster.md`) **Pflicht**, Prüffrage „Kann ein
  Fremder das Produkt ohne Hilfe benutzen?“; daneben
  die Kettenprüfung ([[Kettenpruefung]] §Regel:
  Abdeckung gegen die Quell-Stände, nicht gegen die
  Spezifikation; Darstellung ist kein Befund).
- **Phase:** P12
- **Verbindlichkeit:** pflicht — beim **Koordinator**
  bzw. **Standalone-Projekt**, das den Gesamt-Deploy
  verantwortet; eine Komponente führt sie nur mit
  eigener Zielumgebung (unabhängig ausgeliefert:
  [[Kettenpruefung]] §Fehlende und vertretene Glieder).
  Je Marke per Doku-Abfrage verzichtbar oder aus der
  Vormarke übernommen (Auslöser).
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: die **Doku-Abfrage**
  zur Marke, sobald der Tag der Implementierung gesetzt
  ist — sie entscheidet Zeitpunkt (jetzt / später / gar
  nicht als Übernahme oder Verzicht) und Form
  (Änderungsdokument / Einarbeitung / komplett neu);
  Mechanismus, Heuristik und Buchung je Zeile:
  [[Kettenpruefung]] §Kette (Doku-Abfrage) — lesen,
  sobald der Tag gesetzt ist. Vorbedingung der Freigabe
  ist der Testbericht (TRES) der Marke
  ([[Kettenpruefung]] §Code-Glieder); in der
  Freigabe-Ordnung steht der Stand vor dem Deploy-Stand
  — fehlt er ohne Verzicht, wird der Deploy-Stand mit
  der Einschränkung „Doku folgt“ freigegeben (Warnung,
  keine Blockade; ebenda §Kette, Doku-Glieder). Ein
  Stand mit „später“, der erst nach dem Marken-Wechsel
  freigegeben wird, steht als Nachtrag am
  Marken-Eintrag ([[Zielmarken]] §Meta, Nachtrag).
- **Quell-Register und Filter:** Quell-Stände sind die
  freigegebenen Stände derselben Marke — oder die aus
  der Vormarke übernommenen — des Konzepts
  ([[Katalog-Konzept-Stand]]), der Anforderungen
  ([[Katalog-Anforderungen-Stand]]) und der
  Funktionsbeschreibung
  ([[Katalog-Funktionsbeschreibung-Stand]]) sowie der
  Tag der Implementierung — der Tag ist Quell-Stand für
  alles, was nur das Produkt selbst trägt: Aufruf,
  Voraussetzungen (z.B. Laufzeitumgebung), Bedienung,
  Beispielausgaben kommen aus dem getaggten Produkt
  (Code, Hilfe-Ausgabe, Konfiguration), nicht aus
  weiteren Ständen; Architekturdokument und
  Entwickler-Doku sind keine Quell-Stände der
  Benutzer-Doku — `herkunft` nennt sie trotzdem als
  Vorgänger-Stände (alle freigegebenen Pflicht-Stände
  früherer Phasen, [[Einfrieren-und-Abloesen]] §Stand),
  die Abdeckung der Kettenprüfung gilt nur gegen die
  Quell-Stände; bei einer Komponente mit
  eigener Zielumgebung tritt der Übergabe-Stand an die
  Stelle der Glieder, die er vertritt
  ([[Kettenpruefung]] §Fehlende und vertretene
  Glieder). Was der Stand trägt, ist aus diesen
  eingefrorenen Quell-Ständen ausformuliert — keine
  Wikilinks, keine Register-IDs, Begründungen
  ausgeschrieben (MasterPrompt §9.6); eine Übernahme
  unveränderter Kapitel aus der letzten Vollfassung
  (Einarbeitung) und der Zuwachs seit der Vollfassung
  (Änderungsdokument) folgen den Formen der
  Doku-Abfrage. Sprache: projekt-primär Deutsch,
  weitere Sprachen auf Aufforderung (mit RP-1 Zone 3,
  `Vorgehen-RP-1.md` §12).
- **Pflichtfelder:** `type: benutzer-doku`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand — ein selbsttragender Stand nennt seine
  Quell-Stände in `herkunft` und verweist auf keine
  Elemente)
- **Ablage:** `output/`, versioniert (`_VV_TLA`,
  `<Datum> - Benutzer-Doku_VV_TLA.md`; in der
  Zwei-Repo-Standardbelegung in `output/` der
  Werkstatt, [[Two-Repo-Submodul-Muster]]); die
  freigegebene Version zusätzlich als Kopie in
  `docs/user/` des Produkts mit dem Herkunfts-Kopf
  nach SP-1 `index.md` §4.11; die Kopie trägt den
  Dateinamen des Stands mit Version (ebenda: Name der
  Kopie, vorgefundene Ableitung).
- **Herkunft:** `herkunft` führt zusätzlich den Tag der
  Implementierung und den Testbericht (TRES), an dem
  die Freigabe hängt (Eintragsformat:
  [[Einfrieren-und-Abloesen]] §Stand).
- **Änderungsdokument:** trägt zusätzlich das Kopf-Feld
  `basis` mit der Vollfassung, auf die es sich bezieht
  (Stand-Datei mit Version, Form wie im Feld „Verweise“
  eines Freigabe-Eintrags); es ist kumulativ gegenüber
  dieser Vollfassung ([[Kettenpruefung]] §Regel,
  Änderungsdokument).
