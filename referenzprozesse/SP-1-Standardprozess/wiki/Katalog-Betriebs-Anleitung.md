---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Betriebs-Anleitung

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Betriebs-Anleitung je Umgebung zu Marke
M“ der Phase P15 Betreiben (Kennung
`betriebs-anleitung`, Dokumentname „Betriebs-Anleitung“;
nicht „Betriebs-Handbuch“, „Betriebs-Plan“ oder
„Betriebs-Beschreibung“, [[Glossar]]) — ein
**selbsttragender Stand** aus dem Deploy-Stand der
Umgebung, für Menschen, die das Produkt in dieser
Umgebung ohne Wiki-Zugang betreiben. Es gibt ihn je
Zielumgebung wie den Deploy-Stand. Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### betriebs-anleitung

- **Zweck:** „für P15 Betreiben“ — Installation und
  Betrieb in dieser Umgebung so beschreiben, dass ein
  Fremder sie ausführen kann. Dieser Satz ist der
  Maßstab für Inhalt und Gliederung. Vor der Vorlage an
  den Anwender ist der Verständnis-Check M6
  (`Reviewmuster.md`) **Pflicht**, Prüffrage „Kann ein
  Fremder das Produkt ausführen?“; daneben die
  Kettenprüfung ([[Kettenpruefung]] §Regel: Abdeckung
  gegen den Deploy-Stand ihrer Umgebung; Darstellung
  ist kein Befund).
- **Phase:** P15
- **Verbindlichkeit:** pflicht (je Zielumgebung) —
  beim **Koordinator** bzw. **Standalone-Projekt** für
  jede Umgebung, für die es einen freigegebenen
  Deploy-Stand führt; eine Komponente nur mit eigener
  Zielumgebung ([[Kettenpruefung]] §Fehlende und
  vertretene Glieder). Je Marke und Umgebung per
  Doku-Abfrage verzichtbar (Verzichts-DEC mit
  `phase: P15` und `umgebung:`) oder — nur ohne eigenen
  Tag der Marke — aus der Vormarke übernommen
  (Auslöser); mit eigenem Tag ist die Betriebs-Anleitung
  der Vormarke für die Marke überholt und wird als
  Folge-Version derselben Ketten-ID mit eigener
  Freigabe fortgeführt ([[Kettenpruefung]] §Kette,
  Folge-Marke mit eigenem Tag).
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: die **Doku-Abfrage**
  zur Marke, Zeile je Zielumgebung — sie entscheidet
  Zeitpunkt (jetzt / später / gar nicht als Übernahme
  oder Verzicht) und Form (Änderungsdokument /
  Einarbeitung / komplett neu); Mechanismus, Heuristik
  und Buchung je Zeile: [[Kettenpruefung]] §Kette
  (Doku-Abfrage) — lesen, sobald der Tag gesetzt ist.
  Hat die Marke einen eigenen Tag, stellt die Abfrage
  die Zeile ohne die Wahl „gar nicht (Übernahme)“; bei
  unverändertem Betrieb empfiehlt der Agent „jetzt,
  Einarbeitung“ mit leerem Zuwachs als Folge-Version
  (ebenda, Folge-Marke mit eigenem Tag).
  Der Stand steht **hinter** seinem Quell-Stand: er
  wird erst nach der Freigabe des Deploy-Stands seiner
  Umgebung freigegeben — „jetzt“ heißt nach diesem
  Deploy-Stand und vor dem Marken-Abschluss, „später“
  heißt als Nachtrag nach dem Marken-Wechsel
  ([[Zielmarken]] §Meta, Nachtrag); eine Einschränkung
  „Doku folgt“ am Deploy-Stand gibt es für ihn nicht.
  Kommt eine Zielumgebung später hinzu oder entsteht
  zu einer Umgebung ein weiterer Deploy-Stand — vor
  oder nach dem Marken-Abschluss —, stellt der Agent
  die Zeile für diese Umgebung mit der Vorlage dieses
  Deploy-Stands nach; ein weiterer Deploy-Stand
  derselben Umgebung ist der Anlass einer neuen
  Version ihrer Betriebs-Anleitung ([[Kettenpruefung]]
  §Kette, Doku-Abfrage).
- **Quell-Register und Filter:** Quell-Stand ist der
  freigegebene Deploy-Stand der Umgebung
  ([[Katalog-Deploy-Stand]]) — Vorbedingung der
  Freigabe —, darin die Kopie der Zielumgebung
  (Provider, Hosts, Versionen, Verweise auf
  Zugangsdaten; [[Einfrieren-und-Abloesen]] §Kopien);
  die lebende Entität liest der Stand nicht. Enthält
  alles, was zur Ausführung nötig ist, ohne Verweise
  ins Wiki — keine Wikilinks, keine Register-IDs,
  Begründungen ausgeschrieben (MasterPrompt §9.6);
  den Zuwachs gegenüber der Vormarke zeigen die
  Release-Notes, ein Änderungsdokument sagt, wie das
  Geänderte betrieben wird.
- **Pflichtfelder:** `type: betriebs-anleitung`,
  `marke` (aus dem Deploy-Stand), `zweck`, `herkunft`,
  `datum`, `umgebung` (die Zielumgebung dieses
  Stands) (Herkunftszeile und Datum des Stands:
  [[Einfrieren-und-Abloesen]] §Stand — ein
  selbsttragender Stand nennt seinen Quell-Stand in
  `herkunft` und verweist auf keine Elemente)
- **Ablage:** `output/`, versioniert (`_VV_TLA`); der
  Name trägt die Umgebung als Gegenstand
  (`<Datum> - Betriebs-Anleitung - <Umgebung>_VV_TLA.md`),
  so dass jeder Umgebungs-Stand seine eigene Ketten-ID
  hat ([[Einfrieren-und-Abloesen]] §Stand, Dateiname);
  eine neue Version derselben Umgebung zu derselben
  Marke zählt `VV` hoch. In der
  Zwei-Repo-Standardbelegung in `output/` der Werkstatt
  ([[Two-Repo-Submodul-Muster]]); die freigegebene
  Version zusätzlich als Kopie in `docs/ops/` des
  Produkts mit dem Herkunfts-Kopf nach SP-1 `index.md`
  §4.11; die Kopie trägt den Dateinamen des Stands mit
  Version (ebenda: Name der Kopie, vorgefundene
  Ableitung).
- **Herkunft:** `herkunft` führt den Deploy-Stand der
  Umgebung mit Version (Eintragsformat:
  [[Einfrieren-und-Abloesen]] §Stand).
- **Änderungsdokument:** trägt zusätzlich das Kopf-Feld
  `basis` mit der Vollfassung, auf die es sich bezieht
  (Stand-Datei mit Version, Form wie im Feld „Verweise“
  eines Freigabe-Eintrags); es ist kumulativ gegenüber
  dieser Vollfassung ([[Kettenpruefung]] §Regel,
  Änderungsdokument).
