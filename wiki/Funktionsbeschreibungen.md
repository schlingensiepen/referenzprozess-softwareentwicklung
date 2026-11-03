---
type: function-description-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Funktionsbeschreibungen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — das
Register der Funktionsbeschreibungen ist das Artefakt
der Phase P4 „Beschreiben der Funktion“.

## Meta

- **Typ:** `function-description-log` — Register aller
  Funktionsbeschreibungen dieses Repos. Singleton,
  ID-Präfix `FUNC-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Gegenstand:** die **Außensicht** — was das System
  leistet: Verhalten, Qualitäten, Schnittstellen nach
  außen; entsteht in P4 **vor dem Schnitt** in
  Bausteine (P5) und ist frei von Technologie- und
  Bau-Vorgaben. Die Bauanleitung ist nicht Gegenstand
  dieser Fassade, sondern der [[Spezifikationen]]
  (P8).
- **Verortung je Repo:** jedes Repo führt seine eigenen
  Funktionsbeschreibungen — der Koordinator und das
  Standalone-Projekt die
  **Gesamt-Funktionsbeschreibung**, jede Komponente
  ihre **Teil-Funktionsbeschreibung** (bei
  Übernahme-Art Auftrag vertritt der Übergabe-Stand
  des Koordinators dieses Glied: [[Kettenpruefung]]
  §Fehlende und vertretene Glieder). „Gesamt“ und
  „Teil“ sind Rolle des Repos und Eigenschaft des
  Stands, kein Merkmal je Element. Die Kette
  entsteht über qualifizierte Verweise
  (`<repo>/FUNC-NNN`, Qualifizierer = Repo-Name);
  kein geteilter Kanonizitäts-Split nötig.
- **Contract-Bezug:** die Teil-Funktionsbeschreibung
  einer Komponente nennt die Contracts, die sie als
  Provider anbietet, als Verweise
  `<koordinator>/CON-NNN` (Register
  [[Contract-Index]]); sie sind Teil ihrer Außensicht
  und damit Glied ihres P4. Wo der Consumer und die
  übrigen Phasen auf einen CON verweisen:
  [[Katalog-Contract-Index#Rollen eines CON in der Kette]]
  — lesen bei einem Schnitt in Komponenten.
- **Eintritt und Lese-Klammer:** ein FUNC-Element legt
  der Agent als `offen` an; es bleibt bearbeitbar, bis
  es einzeln angenommen wird oder mit der Freigabe des
  ersten Stands, der es verweist
  ([[Einfrieren-und-Abloesen]] §Eintrittsregel). Bis
  zur Bildung des Stands ist **diese Fassade die
  Lese-Klammer** der Phase P4 — sie listet jedes
  Element mit Link und Status, und der Agent benennt
  sie dem Anwender so; Ablauf bis zur Freigabe:
  [[Lebenslauf-eines-Stands]].
- **Freigabe:** freigegeben wird ein Stand, beim
  Koordinator wie bei einer Komponente mit demselben
  Zweck „für P5 Zerlegen in Bausteine“; Filter, Ablage
  in `output/` und Herkunftszeile:
  [[Katalog-Funktionsbeschreibung-Stand]] — lesen vor
  der Freigabe. Der Freigabe-Eintrag im
  Entscheidungs-Register nennt Stand und Zweck.
- **Eintragsformat:** `### FUNC-NNN — <Kurzsatz>` mit
  Feldern Gegenstand (nur der beschriebene Gegenstand,
  z.B. „Dienst Usage“, „Datenmodell“ — nicht „Gesamt“
  oder „Teil“: das ist die Rolle des Repos, §Verortung
  je Repo) /
  Status + status_date / Angelegt (Anlage-Datum
  `JJJJ-MM-TT`, Pflichtfeld seit 2.0 am Eintrag ohne
  Detail-Knoten, sonst `datum:` im Detail-Knoten;
  [[Katalog]] §Typ-Konventionen) / Zielmarke
  ([[Zielmarken]];
  Pflichtfeld, kanonisch hier) / Detail (Wikilink). Ein
  Freigabestand steht nur im Freigabe-Eintrag, nicht
  im Element-Eintrag.
- **Kanonizität:** die Wahrheit beim Status liegt in
  dieser Fassade — Detail-Knoten (Typ
  `function-description`) spiegeln (Wiki.md §1.1a,
  [[Register-Grundmuster]]).
- **Detail-Knoten-Konventionen:** Frontmatter-Felder:
  [[Katalog-Funktionsbeschreibungen]] — lesen beim
  Anlegen eines `function-description`-Knotens.
  Sektionen frei nach beschriebenem
  Gegenstand (Verhalten, Qualitäten, Schnittstellen
  nach außen, Contract-Bezug). Dateiname
  `FUNC-NNN <Kurzsatz>.md`.
- **Pflege:** bei Anlage und Statuswechsel.

---

**Bearbeitungsstand:** _(vom Agenten bei Anlage und laufend
gepflegt)_

## Funktionsbeschreibungen

_(chronologisch nach ID; vom Agenten bei der ersten
Funktionsbeschreibung gefüllt)_
