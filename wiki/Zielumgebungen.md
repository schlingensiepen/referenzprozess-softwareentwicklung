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
- **Zugriffsstufe und Ausführende (Kann):** je
  Umgebung darf der Eintrag festhalten, **was der
  Agent dort darf** (Zugriffsstufe: lesen, ausführen,
  ändern, keine) und **wer Änderungen ausführt**
  (Mensch oder Agent). Beides ist Arbeitsweise, nicht
  Fachinhalt — wie der Agent an einer Umgebung
  arbeitet, gilt in jedem Projekt, auch ohne
  Infrastruktur-Prozess. In SP-1 Kann-Felder
  (`zugriffsstufe`, `ausfuehrung`,
  [[Katalog-Zielumgebungen]]), kein Nachtrag an
  Bestands-Einträgen; ein Referenzprozess auf SP-1 kann
  sie zur Pflicht machen und Pflichten daran knüpfen.
- **Überführter Betrieb:** ist der Betrieb einer
  Umgebung an ein Infrastruktur-Projekt überführt
  ([[Vorgehen-SP-1]] §2 Anmerkung P13), bleibt ihr
  Eintrag hier und trägt das Feld `uebergeben_an:
  <repo>` (Feldzeile am Eintrag; Kann-Feld,
  [[Katalog-Zielumgebungen]]) — ein Zustand, kein
  Fließtext-Vermerk: neue Deploy-Stände dieser Umgebung
  und ihre Betriebs-Anleitung führt jenes Projekt, hier
  entfallen beide für alle weiteren Marken abgeleitet
  ([[Kettenpruefung]] §Fehlende und vertretene
  Glieder); der zuletzt freigegebene Deploy-Stand bleibt
  als Lieferung gültig.
- **RP-2-Präzisierung** (gilt bei aktivem RP-2): Die
  Zielumgebung ist das **Kernregister der Anlage**; je
  Umgebung sind **Pflicht**: Rolle (was die Umgebung
  ist: Host, Gast, Dienst, Portal), **Zustand mit
  Datum** (`geplant` / `aktiv` / `entkernt` /
  `abgebaut`), **Zugriffsstufe des Agenten**
  (Werteliste: [[Katalog-Zielumgebungen]]
  RP-2-Präzisierung), **Erreichbarkeit aus der Sitzung**
  (wie der Agent sie erreicht: Shell, Konsole,
  Anbieter-API, nur über den Anwender), **wer führt aus**
  (Mensch oder Agent), **Sicherung** und **Überwachung**
  (Verweis auf den Deployment-Eintrag des Aspekts oder
  „keine“), **geteilt mit** (andere Projekte, die
  dieselbe Anlage nutzen), **frühere Kennungen** (gegen
  Verwechslung wiederverwendeter Namen); optional
  Hardware-Hinweise (Garantie, Firmware, Ersatz) und
  die externen Abhängigkeiten der Umgebung
  (`Externe-Abhaengigkeiten.md` (RP-2)). Die Einträge füllt der
  Einstieg „Bestand erfassen“ oder die Vorlage I3
  (`Vorgehen-RP-2.md` §4, §4a). Der Zustand steuert die
  Prüfungen (bei `aktiv` Betriebs-Anleitung, Sicherung
  und Überwachung; bei `abgebaut` keine offenen
  Deployment-Einträge, Deploy-Stand „abgebaut“ —
  `Vorgehen-RP-2.md` §8) und ist Entfall-Grund für die
  Stände dieser Umgebung ([[Kettenpruefung]] §Fehlende
  und vertretene Glieder). Bei der Wiederaufnahme an
  einer geteilten Anlage gleicht der Agent die Tatsachen
  mit dem anderen Projekt ab und meldet Abweichungen
  (Wächter W1). Eintragsformat zusätzlich: Rolle /
  Zustand (seit) / Erreichbarkeit / Sicherung /
  Überwachung / Geteilt mit / Frühere Kennungen /
  Hardware (Kann) / Abhängigkeiten (Kann).
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
  Zugriffsstufe (Kann) / Ausführung (Kann: Mensch oder
  Agent) / Detail (Wikilink, nur wenn Detail-Knoten
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
