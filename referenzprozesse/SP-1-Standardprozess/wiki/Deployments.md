---
type: deployment-description-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Deployments

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — das
Register der Deployments speist den Deploy-Stand der
Phase P13 „Ausliefern“.

## Meta

- **Typ:** `deployment-description-log` — Register
  aller Deployment-Festlegungen (DEPL) dieses Repos:
  wie eine Komponente in **einer** Zielumgebung
  installiert und betrieben wird, je Umgebung und
  Aspekt. Singleton, ID-Präfix `DEPL-NNN`.
- **Wer führt die DEPL:** der **Koordinator** für alle
  Komponenten seiner §Komponenten-Zeilen (er
  verantwortet den Gesamt-Deploy und die Deploy-Stände
  je Zielumgebung); eine Komponente führt eigene DEPL
  nur mit eigener Zielumgebung
  ([[Kettenpruefung]] §Fehlende und vertretene
  Glieder). Standalone: wie der Koordinator.
  **Unter-Komponenten eines Zwischen-Koordinators:**
  Hat der Zwischen-Koordinator keine eigene
  Zielumgebung, bucht der übergeordnete Koordinator
  ihre DEPL unter der Zeile des Zwischen-Koordinators
  (`komponente:` = dessen Name in seiner §Komponenten)
  und nennt die Unter-Komponente im Kurzsatz des
  Eintrags als „<Name> aus <repo>“ (ohne `/`, damit der
  Kurzsatz zugleich Dateiname des Detail-Knotens sein
  kann); sie bekommt keine
  eigene Zeile beim übergeordneten Koordinator. Mit
  eigener Zielumgebung führt der Zwischen-Koordinator
  die DEPL für sich und seine Unter-Komponenten selbst
  (sein Teilbaum; dort sind sie Zeilen seiner
  §Komponenten). Führender Ort: [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art
  (Zwischen-Koordinator).
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Zwei Achsen:** die Architektur
  ([[Systemarchitektur]]) gilt je Marke
  umgebungsunabhängig; Deployments gibt es je
  Zielumgebung, mehrere je Marke. Die Umgebungen
  selbst (Provider, Hosts, Versionen) stehen lebend in
  [[Zielumgebungen]].
- **Abgrenzung:** eine Wahl mit Alternativen
  (z.B. Hoster, Verfahren) ist eine DEC in
  [[Entscheidungen]]; die Pipeline ist Code, ihre
  Bauanleitung eine SPEC in [[Spezifikationen]]. Ein
  DEPL-Element stützt sich per `abgeleitet_von:` auf
  ARC, SPEC und DEC.
- **Eintritt und Lese-Klammer:** DEPL-Elemente dürfen
  jederzeit entstehen; der Agent legt sie als `offen`
  an, sie bleiben bearbeitbar, bis sie einzeln
  angenommen werden oder mit der Freigabe des
  Deploy-Stands, der sie verweist, und sind ab dann
  eingefroren ([[Einfrieren-und-Abloesen]]
  §Eintrittsregel). Bis zur Bildung des Deploy-Stands
  ist diese Fassade die Lese-Klammer der Phase P13
  ([[Lebenslauf-eines-Stands]]). Eine später
  hinzukommende Umgebung für eine bereits
  ausgelieferte Marke ist zulässig (Nachtrag:
  [[Zielmarken]]); ihre DEPL tragen die Marke des
  nachgetragenen Deploy-Stands, nicht die laufende
  Marke ([[Katalog-Deployments]]). Wird eine Umgebung,
  die zu der Marke schon einen freigegebenen
  Deploy-Stand hat, anders ausgerollt, ist das ein
  weiterer Deploy-Stand derselben Umgebung — nach dem
  Abschluss ein weiterer Nachtrag, keine Patch-Marke —;
  die neuen DEPL und die Nachfolger abgelöster DEPL
  tragen ebenso die Marke des nachgetragenen Stands.
  Erneutes Ausrollen ohne Änderung ist Betrieb und
  braucht kein neues DEPL ([[Zielmarken]] §Meta,
  Nachtrag).
- **Abdeckung:** welche DEPL je Komponente und
  Umgebung vorhanden sein müssen — [[Kettenpruefung]]
  §Lint-Anteil; lesen vor der Bildung eines
  Deploy-Stands. Der Lint prüft die Abdeckung im Repo,
  das die DEPL führt: beim Koordinator für alle Zeilen
  in §Komponenten je Zielumgebung, bei einer
  Komponente mit eigener Zielumgebung für die eigene
  Zeile, bei einem Zwischen-Koordinator mit eigener
  Zielumgebung für die eigene Zeile und seine
  Unter-Komponenten. Eine DEPL für eine
  Unter-Komponente, die unter der Zeile des
  Zwischen-Koordinators gebucht ist, zählt für diese
  Zeile.
- **Kanonizität:** die Wahrheit beim Status liegt in
  dieser Fassade — Detail-Knoten (Typ
  `deployment-description`) spiegeln (Wiki.md §1.1a,
  [[Register-Grundmuster]]).
- **Eintragsformat:** `### DEPL-NNN — <Kurzsatz>` mit
  Feldern Umgebung / Komponente / Status +
  status_date / Gestützt auf (ARC, SPEC, DEC) /
  Angelegt (Anlage-Datum `JJJJ-MM-TT`, Pflichtfeld
  seit 2.0 am Eintrag ohne Detail-Knoten, sonst
  `datum:` im Detail-Knoten; [[Katalog]]
  §Typ-Konventionen) /
  Zielmarke ([[Zielmarken]]; Pflichtfeld, kanonisch
  hier) / Detail
  (Wikilink, nur wenn Detail-Knoten existiert).
- **`deployment-description`-Detail-Knoten-
  Konventionen:** Frontmatter-Felder:
  [[Katalog-Deployments]] — lesen beim Anlegen eines
  `deployment-description`-Knotens. Sektionen:
  Installation / Betrieb / Voraussetzungen / Vermerke
  (append-only) / Bezüge (Fassaden-Eintrag
  [[Deployments]]). Keine Zugangsdaten im Wiki — nur
  Verweise darauf. Dateiname `DEPL-NNN <Kurzsatz>.md`.

---

**Bearbeitungsstand:** _(vom Agenten bei Anlage und laufend
gepflegt)_

## Deployments

_(chronologisch nach ID; vom Agenten beim ersten
Deployment gefüllt)_
