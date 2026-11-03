---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Deployments

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`deployment-description-log` ([[Deployments]]) mit
Element-Typ `deployment-description`. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### deployment-description-log

- **Zweck:** Register aller Deployment-Festlegungen
  dieses Repos, je Zielumgebung und Aspekt; speist den
  Deploy-Stand der Phase P13. Geführt beim
  Koordinator für alle Komponenten seiner
  §Komponenten-Zeilen; bei einer Komponente nur mit
  eigener Zielumgebung (`## Meta` von [[Deployments]])
- **Pflichtfelder:** `type: deployment-description-log`
- **Präfix:** `DEPL`
- **Datei:** `wiki/Deployments.md`
- **Singleton**

### deployment-description

- **Zweck:** Installation und Betrieb einer Komponente
  in einer Zielumgebung, für einen Aspekt
  (Detail-Knoten zum DEPL-Eintrag im Register)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** offen (Vorstatus `offen` ohne
  `aufgeschoben`; Annahme einzeln oder im Freigabe-Zug
  des ersten Stands, der das Element verweist —
  [[Einfrieren-und-Abloesen]] §Eintrittsregel)
- **Pflichtfelder:** `type: deployment-description`,
  `id` (Format `DEPL-NNN`), `status` (Werte nach
  [[Register-Lebenszyklus]]), `status_date`, `datum`
  (seit 2.0) (Anlage-Datum `JJJJ-MM-TT`, nie geändert;
  [[Katalog]] §Typ-Konventionen),
  `umgebung` (Name aus [[Zielumgebungen]]),
  `komponente` (Name aus der Spalte „Komponente“ in
  §Komponenten der Architektur-Fassade, für die eigene
  Zeile auch der Repo-Name; Standalone: das eigene Repo;
  bei der DEPL einer Unter-Komponente eines
  Zwischen-Koordinators ohne eigene Zielumgebung dessen
  Name — die Unter-Komponente steht im Kurzsatz als
  „<Name> aus <repo>“, [[Deployments]] §Meta),
  `abgeleitet_von` (Liste der ARC, SPEC und DEC;
  Lint-Anteil: [[Kettenpruefung]]), `zielmarke` (seit
  2.0) (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  bei einer Umgebung, die zu einer abgeschlossenen
  Marke nachgetragen wird, die Marke des nachgetragenen
  Deploy-Stands — die Marke dessen, was ausgerollt
  wird; ist sie nicht eindeutig, fragt der Agent —,
  die Ausnahme vom Satz „beim Anlegen die
  `in-progress`-Marke“ wie beim BUG; wird eine Umgebung
  mit freigegebenem Deploy-Stand anders ausgerollt,
  tragen die neuen DEPL und die Nachfolger abgelöster
  DEPL ebenso die Marke des nachgetragenen Stands —
  eine Patch-Marke gibt es nur bei einer Änderung an
  Produkt oder Spezifikation; Bestand ohne Feld:
  [[Zielmarken]] §Meta)
- **Optional:** `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste). Kein
  `trigger`: Sammelzustand `offen` ohne
  `aufgeschoben`, nichts zu reaktivieren.
- **Dokumenttypen:** [[Katalog-Deploy-Stand]]
- **Beispielname:** `DEPL-001 Datenbank auf Produktion.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Deployments.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Deployments]].
