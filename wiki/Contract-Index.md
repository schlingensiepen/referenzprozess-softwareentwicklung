---
type: contract-index
active: false   # Vorauswahl deaktiviert; aktiv nur beim Koordinator — Aktivierung bei Rolle Koordinator oder per Zuruf
---

# Contract-Index

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis); sie ist
optional und wird vorausgewählt, sobald ein Schnitt in
Komponenten stattfindet.

## Meta

- **Typ:** `contract-index` — Register aller Contracts
  (CON) zwischen Komponenten. Singleton, ID-Präfix
  `CON-NNN`. Aktiv nur beim **Koordinator**: dort
  liegen die CON-Elemente samt Versionskette; der
  Provider führt kein CON-Register. Zerlegt eine
  Komponente weiter, ist sie für ihre
  Unter-Komponenten Koordinator und führt deren CON.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Entstehung und Buchung:** Die Existenz einer
  Schnittstelle folgt aus dem Zuschnitt (ARC in der
  Architektur-Fassade; das ARC-Element nennt
  `provider:` und `consumer:`, der CON stützt sich per
  `abgeleitet_von:` darauf). Den Inhalt verhandelt der
  Provider in seinem P4 und gibt ihn frei — was gilt,
  wenn der Übergabe-Stand dieses Glied vertritt:
  [[Katalog-Contract-Index#Rollen eines CON in der Kette]];
  jeden vereinbarten Stand meldet er per Nachricht. Der
  Koordinator bucht den gemeldeten Stand direkt als
  `angenommen` (eingefroren) mit `quelle:` auf die
  Meldung des Providers ([[Katalog-message]]; die
  Meldung trägt bei einer Erst-CON auch die
  Anwender-Freigabe). Den Inhalt der Schnittstelle
  übernimmt der Koordinator aus dem Text der Meldung
  in das CON-Element; dort ist er ab der Buchung
  eingefroren. Entwürfe leben beim Provider,
  nie in diesem Register. Wie der Provider aushandelt
  und freigibt, präzisiert der aktive Prozess (mit
  RP-1: `Vorgehen-RP-1.md` §9/§10).
- **Identität und Nachfolge:** die feste Identität
  trägt der Contract-Name. Eine neue Version ist ein
  **Nachfolge-CON** — ein neues Element mit
  `supersedes:` (ersetzt) oder `vorgaenger:` (parallel
  gültig); eine Rücknahme eines angenommenen CON gibt
  es nicht. So entsteht die Versionskette in diesem
  Register (Feldregeln: [[Katalog-Contract-Index]]).
  **Außerkraftsetzung eines parallel gültigen
  Vorgängers:** Wird ein Vorgänger, der neben seinem
  Nachfolger weitergalt (`vorgaenger:`), später außer
  Kraft gesetzt, bucht der Koordinator die
  Außerkraftsetzung beidseitig — `supersedes:` am
  Nachfolger und `superseded_by:` am Vorgänger (Status
  des Vorgängers `abgelöst`). Fällt ein CON ohne
  Nachfolger weg, bekommt er den Status
  `abgeschlossen` ohne `superseded_by:`, und der
  Koordinator meldet den Wegfall den registrierten
  Consumern per Nachricht (mit RP-1 präzisiert:
  `Vorgehen-RP-1.md` §9 „Contract-Wegfall“).
  Erst diese Buchung macht die Stände der Consumer des
  alten CON überholt ([[Einfrieren-und-Abloesen]]
  §Überholt-Regel liest `superseded_by:`) — ein
  gewollter Nacharbeits-Auslöser; die Nachricht an die
  registrierten Consumer meldet die Außerkraftsetzung
  wie die Ablösung.
- **Consumer-Registrierungen:** Wer einen CON nutzt,
  steht lebend in seinem Eintrag in dieser Fassade,
  nicht am eingefrorenen Element — je Registrierung
  wer (Repo-Name im Verbund oder Bezeichnung eines
  externen Nutzers, z.B. bei API, Library, Shared
  Code), seit wann und `quelle:`; eine Abmeldung ist
  ebenfalls ein Eintrag. Der Koordinator bucht eine
  Anmeldung mit Zustimmung des Providers, gemeldet per
  Nachricht ([[Katalog-message]]). Kommt nur ein Nutzer
  hinzu, wird er registriert; einen Nachfolge-CON gibt
  es nur bei einer Inhaltsänderung (sonst würden die
  Stände aller bisherigen Consumer überholt). Ein
  Nachfolge-CON beginnt mit leerer Consumer-Liste — wer umsteigt,
  registriert sich neu; so bleibt sichtbar, wer noch
  eine ältere, parallel gültige Version nutzt.
  **Lint:** jede Komponente, die das ARC-Element des
  Zuschnitts als `consumer:` nennt, ist am daraus
  abgeleiteten CON registriert (Weg und Felder:
  [[Katalog-Contract-Index]]); externe Consumer
  brauchen keinen ARC-Bezug.
- **Status:** nur `angenommen`, `abgelöst` und
  `abgeschlossen` (außer Kraft); kein `offen`, kein
  `aufgeschoben`, kein `trigger` (Eintritts-Register,
  [[Register-Lebenszyklus]]). Ob eine Schnittstelle
  umgesetzt ist, zeigen SPEC und Tag beim Provider.
- **Kanonizität:** die Wahrheit bei Status liegt in
  dieser Fassade — Detail-Knoten (Typ `contract`)
  spiegeln (Wiki.md §1.1a, [[Register-Grundmuster]]).
- **Eintragsformat:** `### CON-NNN — <Contract-Name>`
  mit Feldern Provider (Komponente) / Status +
  status_date / Quelle (Meldung des Providers) /
  Vorgänger bzw. Ablösung (bei Nachfolge-CON) /
  Angelegt (Anlage-Datum `JJJJ-MM-TT`, Pflichtfeld
  seit 2.0 am Eintrag ohne Detail-Knoten, sonst
  `datum:` im Detail-Knoten; [[Katalog]]
  §Typ-Konventionen) /
  Zielmarke ([[Zielmarken]]; Pflichtfeld, kanonisch
  hier) / Detail
  (Wikilink, nur wenn Detail-Knoten existiert) /
  Consumer (je Registrierung eine Zeile: wer, seit,
  `quelle:`).
- **Verweise:** Stände von Provider und Consumern
  verweisen auf `<koordinator>/CON-NNN`; welche Rolle
  ein CON in welcher Phase hat:
  [[Katalog-Contract-Index#Rollen eines CON in der Kette]].
- **Commit-Präfix:** Änderungen laufen unter dem
  Basis-Präfix `Wiki:` (kein eigener Präfix —
  Änderungen sind selten).

---

**Bearbeitungsstand:** _(vom Agenten bei der Buchung eines CON und
laufend gepflegt)_

## Contracts

_(chronologisch nach Contract-ID; vom Agenten beim
ersten Contract gefüllt)_
