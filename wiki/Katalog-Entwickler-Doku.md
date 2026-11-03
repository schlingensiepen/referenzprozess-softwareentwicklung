---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Entwickler-Doku

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Entwickler-Doku zu Marke M“ der Phase
P11 Dokumentieren für Entwickler (Kennung
`entwickler-doku`) — ein **selbsttragender Stand** für
Menschen, die das Produkt ohne Wiki-Zugang ändern
sollen. Beim Prozess-Merge (Wiki.md §11.3) wird dieser
Eintrag als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert.

### entwickler-doku

- **Zweck:** „für P13 Ausliefern“ — ein Fremder kann
  das Produkt ohne Rückfrage ändern: Aufbau,
  Entscheidungen und ihre Gründe, Einstieg und Build,
  Schnittstellen. Dieser Satz ist der Maßstab für
  Inhalt und Gliederung; eine feste Kapitelliste gibt
  es nicht. Vor der Vorlage an den Anwender ist der
  Verständnis-Check M6 (`Reviewmuster.md`) **Pflicht**,
  Prüffrage „Kann ein Fremder das Produkt ohne
  Rückfrage ändern?“; daneben die Kettenprüfung
  ([[Kettenpruefung]] §Regel: Abdeckung gegen die
  Quell-Stände, Darstellung ist kein Befund).
- **Phase:** P11
- **Verbindlichkeit:** pflicht — bei einer
  **Komponente** die Entwickler-Doku für ihr Bauteil
  (letztes Glied ihrer Kette; die Lieferung an den, der
  P13 führt), beim **Koordinator** die Gesamtsicht, die
  die Entwickler-Doku der Komponenten aufnimmt — als
  Kopie der ausgelieferten Datei oder als Anhang,
  selbsttragend —; Standalone: wie der Koordinator
  ([[Kettenpruefung]] §Fehlende und vertretene Glieder,
  §Komponenten-Kette nach Übernahme-Art). Je Marke per
  Doku-Abfrage verzichtbar oder aus der Vormarke
  übernommen (Auslöser).
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
  der Vormarke übernommenen — des Architekturdokuments
  ([[Katalog-Architekturdokument]]), der
  Technologie-Entscheidungen
  ([[Katalog-Technologie-Entscheidungen]]) und der
  Spezifikation sowie der Tag (unten); **beim
  Koordinator** zusätzlich die freigegebenen
  Entwickler-Doku-Stände seiner Komponenten für diese
  Marke, qualifiziert als `<repo>/<Dateiname mit
  Version>` — Quell-Stände aus den Komponenten-Repos,
  gegen die die Kettenprüfung Abdeckung und
  Widerspruch prüft ([[Kettenpruefung]] §Regel);
  fehlen Spezifikation oder Technologie-Entscheidungen
  (abgeleitet entfallen, [[Kettenpruefung]] §Fehlende
  und vertretene Glieder), genügen die übrigen
  Quell-Stände. Im Einzelnen: Architekturdokument,
  Technologie-Entscheidungen und der
  Spezifikation ([[Katalog-Spezifikation-Stand]]) sowie
  der Tag der Implementierung; bei einer Komponente
  tritt der Übergabe-Stand an die Stelle der Glieder,
  die er vertritt ([[Kettenpruefung]] §Fehlende und
  vertretene Glieder). Was der Stand trägt, ist aus
  diesen eingefrorenen Quell-Ständen ausformuliert —
  keine Wikilinks, keine Register-IDs, Begründungen
  ausgeschrieben (MasterPrompt §9.6); eine Übernahme
  unveränderter Kapitel aus der letzten Vollfassung
  (Einarbeitung) und der Zuwachs seit der Vollfassung
  (Änderungsdokument) folgen den Formen der
  Doku-Abfrage. Sprache: der erklärende Text in der
  Projektsprache; mit RP-1 ist die aus Docstrings
  erzeugte API-Doku Zone 1 (Englisch) und **Teil der
  Entwickler-Doku, nicht ihr Ersatz**
  (`Vorgehen-RP-1.md` §12).
- **Pflichtfelder:** `type: entwickler-doku`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand — ein selbsttragender Stand nennt seine
  Quell-Stände in `herkunft` und verweist auf keine
  Elemente)
- **Ablage:** `output/`, versioniert (`_VV_TLA`,
  `<Datum> - Entwickler-Doku_VV_TLA.md`; in der
  Zwei-Repo-Standardbelegung in `output/` der
  Werkstatt, [[Two-Repo-Submodul-Muster]]); die
  freigegebene Version zusätzlich als Kopie in
  `docs/developer/` des Produkts mit dem Herkunfts-Kopf
  nach SP-1 `index.md` §4.11; die Kopie trägt den
  Dateinamen des Stands mit Version (ebenda: Name der
  Kopie, vorgefundene Ableitung).
- **Herkunft:** `herkunft` führt zusätzlich den Tag der
  Implementierung und den Testbericht (TRES), an dem
  die Freigabe hängt; beim Koordinator die
  aufgenommenen Entwickler-Doku-Stände der Komponenten
  mit Version, qualifiziert als `<repo>/<Dateiname>`
  wie jeder Bezug über Repo-Grenzen (Eintragsformat:
  [[Einfrieren-und-Abloesen]] §Stand).
- **Änderungsdokument:** trägt zusätzlich das Kopf-Feld
  `basis` mit der Vollfassung, auf die es sich bezieht
  (Stand-Datei mit Version, Form wie im Feld „Verweise“
  eines Freigabe-Eintrags); es ist kumulativ gegenüber
  dieser Vollfassung ([[Kettenpruefung]] §Regel,
  Änderungsdokument).
