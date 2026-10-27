---
type: target-environment-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Zielumgebungen

**Ich bin neu in SP-1.** Diese Fassade entsteht mit der
Wahl von SP-1 (Wiki.md §11 Prozess-Teil-Wikis) — sie
führt die Umgebungen, in die das Ergebnis
ausgeliefert wird.

## Meta

- **Typ:** `target-environment-log` — Register der
  **Zielumgebungen** (z.B. lokal, Test, Produktion
  bei einem Hoster). Singleton, keine ID — eine
  Umgebung trägt einen Namen.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  Einträge leben inline; eine Umgebung mit vielen
  Daten darf einen eigenen Detail-Knoten bekommen.
- **Entität, lebend:** eine Zielumgebung hält nur
  Fakten (Provider, Hosts, Versionen, Verweise auf
  Zugangsdaten — nie die Zugangsdaten selbst). Sie
  wird bei Änderungen überschrieben und im Stand
  kopiert ([[Einfrieren-und-Abloesen]] §Kopien).
  Verlangt eine Umgebung eine Wahl, wird diese als DEC
  in [[Entscheidungen]] gebucht. Ob eine Änderung am
  Eintrag einer Umgebung mit freigegebenem Deploy-Stand
  ein anderes Ausrollen ist — ein weiterer Deploy-Stand
  mit eigener Freigabe, der die neuen Daten kopiert —
  oder Pflege der Entität ohne neuen Stand, entscheidet
  der Anwender je Fall; das Template legt es nicht fest.
  Der Agent weist bei einer solchen Änderung darauf hin,
  dass ein weiterer Deploy-Stand möglich ist, und fragt
  (Frage-Block); er bildet ihn nicht ungefragt und lässt
  ihn nicht ungefragt weg ([[Zielmarken]] §Meta,
  Nachtrag; der Lint liest das nicht).
- **Wofür gelesen:** die Deployment-Festlegungen
  ([[Deployments]]) nennen die Umgebung per
  `umgebung:`; je Umgebung und Marke gibt es einen
  Deploy-Stand, als neue Version fortgeschrieben, wenn
  die Umgebung anders ausgerollt wird — es gilt der
  jüngste ([[Katalog-Deploy-Stand]]); die Abdeckung je
  Komponente und Umgebung prüft [[Kettenpruefung]]
  §Lint-Anteil.
- **Eintragsformat:** `### <Name>` mit Feldern
  Provider / Hosts / Versionen / Zugang (Verweis) /
  Detail (Wikilink, nur wenn Detail-Knoten
  existiert).
- **`target-environment`-Detail-Knoten-Konventionen:**
  Frontmatter `type: target-environment`. Sektionen:
  Provider / Hosts / Versionen / Zugang (nur Verweise)
  / Bezüge (Fassaden-Eintrag [[Zielumgebungen]]).
  Dateiname `<Name>.md` im Title-Case.

---

**Bearbeitungsstand:** _(vom Agenten bei Anlage und laufend
gepflegt — bei Änderungen überschrieben)_

## Umgebungen

_(vom Agenten bei der ersten Zielumgebung gefüllt)_
