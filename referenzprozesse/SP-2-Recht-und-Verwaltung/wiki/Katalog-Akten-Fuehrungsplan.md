---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Akten-Fuehrungsplan

Dokumenttyp-Eintrag von SP-2: der selbsttragende
Pflicht-Stand „Akten-Führungsplan je Stelle zu Marke M“
der Phase P15 (Kennung `akten-fuehrungsplan`) — wie das
Verfahren bei dieser Stelle **geführt** wird: Abrufturnus
je Kanal mit Bereitstellung zum Abruf, Fristenblick,
Wiedervorlagen, Zuständigkeiten. Nach der Bauform der
Betriebs-Anleitung je Umgebung eines
Entwicklungsprozesses, ohne Vererbung: es gibt ihn **je
Stelle bzw. Verfahren**; die Stelle vertritt die
Zielumgebung. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert.

### akten-fuehrungsplan

- **Zweck:** „für den Betrieb des Verfahrens“ — wer das
  Verfahren bei dieser Stelle führt (der Anwender, eine
  Vertretung, ein Nachfolger), darf den Plan als
  vollständige Anleitung nehmen: wann abgerufen wird,
  welche Fristen laufen, was wiedervorgelegt wird.
- **Phase:** P15
- **Verbindlichkeit:** pflicht
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: die **Doku-Abfrage**
  je Marke, sobald der Tag gesetzt ist, mit der Zeile
  Akten-Führungsplan **je Stelle** ([[Kettenpruefung]]
  §Kette, Doku-Glieder; [[Vorgehen-SP-2]] §2) —
  Vorbedingung ist der freigegebene Einreichungs-Stand
  dieser Stelle; beim ersten Verfahren bei einer Stelle
  ist „jetzt“ die Empfehlung, danach meist „später“ als
  Folge-Version.
- **Quell-Register und Filter:** der geprüfte
  Versandweg der Stelle aus [[Organisationen]]
  (`authority`: Kanal, Postfach, Grenzen) mit dem
  **Abrufturnus** je Kanal mit Bereitstellung zum Abruf
  ab der Stufe, in der er eröffnet ist (Gerichts-,
  Anwalts-, Behörden-, Bürger- und Organisationenpostfach,
  Steuer- und Behördenportal); die Eingangsorte aus
  [[Eingangsdokumente]] `## Eingangsorte`; die offenen
  Fristen und Erwartungen des Verfahrens aus [[Fristen]]
  mit Zeitbudget (Fristenblick); die Wiedervorlagen
  (Sachstand prüfen, Rollen-Prüfung, Verjährung des
  Titels); die Ansprechpartner der Stelle
  ([[Ansprechpartner]]); die Eventualpläne mit Auslöser
  ([[Strategie]], nur bis zur Vertraulichkeitsstufe des
  Lesers). Alles **kopiert**; Verständnis-Check M6
  (`Reviewmuster.md`) vor der Freigabe.
- **Pflichtfelder:** `type: akten-fuehrungsplan`,
  `marke`, `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand), `stelle` (die Stelle bzw. das Verfahren
  dieses Plans), `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); der
  Name trägt die Stelle als Gegenstand
  (`<Datum> - Akten-Fuehrungsplan - <Stelle>_VV_TLA.md`);
  in einer Folge-Marke mit eigenem Tag wird dieselbe
  Ketten-ID als **Folge-Version** fortgeführt — der
  Plan wächst mit dem Verfahren ([[Vorgehen-SP-2]] §2).
- **Pflicht ab Stufe:** 1, nach Doku-Abfrage.
- **Entfällt abgeleitet, wenn:** kein Einreichungs-Stand
  bei dieser Stelle freigegeben ist.
- **Herkunft:** `herkunft` führt zusätzlich den
  Einreichungs-Stand der Stelle, auf dem der Plan
  aufsetzt.
- **Wächter:** ein überschrittener Abrufturnus ist ein
  Befund (`SP2-ABRUF`, [[Vorgehen-SP-2]] §8); der
  Plan nennt den Turnus, der Wächter liest ihn aus den
  Eingangsorten.
- **Nachlauf:** nach dem Ende des Verfahrens führt die
  Marke „Nachlauf“ den Plan als Folge-Version mit den
  Wiedervorlagen des Nachlaufs ([[Vorgehen-SP-2]] §11).
- **Vertraulichkeit:** `intern`; Eventualpläne nur bis
  zur Stufe des Lesers.
