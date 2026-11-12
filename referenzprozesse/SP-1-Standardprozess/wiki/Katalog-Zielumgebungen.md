---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Zielumgebungen

**Ich bin neu in SP-1.** Register-Eintrag:
Entitäts-Fassade `target-environment-log`
([[Zielumgebungen]]) mit dem Entitäts-Typ
`target-environment`. Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### target-environment-log

- **Zweck:** Register der Zielumgebungen, in die das
  Ergebnis ausgeliefert wird (lebende Fakten)
- **Pflichtfelder:** `type: target-environment-log`
- **Präfix:** `—` (Umgebungen tragen einen Namen,
  keine ID)
- **Datei:** `wiki/Zielumgebungen.md`
- **Singleton**

### target-environment

- **Zweck:** einzelne Zielumgebung mit ihren Fakten
  (Provider, Hosts, Versionen, Verweise auf
  Zugangsdaten) — Detail-Knoten zum Eintrag der
  Fassade
- **Klasse:** außerhalb (Entität; im Stand kopiert)
- **Pflichtfelder:** `type: target-environment`
- **Optional:** `zugriffsstufe` (**Zugriffsstufe des
  Agenten** — was der Agent in dieser Umgebung darf:
  etwa `lesen`, `ausfuehren`, `aendern`, `keine`;
  freier Wert, im Projekt einheitlich), `ausfuehrung`
  (**wer führt aus** — `mensch` oder `agent`: wer
  Änderungen an der Umgebung tatsächlich vornimmt).
  Beide sind Arbeitsweise und gelten in jedem Projekt,
  auch ohne Infrastruktur-Prozess; in SP-1 Kann-Felder,
  kein Nachtrag an Bestands-Einträgen (`## Meta` von
  [[Zielumgebungen]]). Ein Referenzprozess auf SP-1
  kann sie zur Pflicht machen und weitere Felder
  hinzufügen (Präzisierung in diesem Eintrag). Dazu
  `uebergeben_an` (**übergebener Betrieb** — `<repo>`
  des Betriebs-Projekts, das den Betrieb dieser
  Umgebung führt; gesetzt am Übergabe-Punkt der
  Überführung, [[Vorgehen-SP-1]] §2 Anmerkung P13 (a),
  am Inline-Eintrag als Feldzeile `- **uebergeben_an:**
  <repo>` oder im Frontmatter des Detail-Knotens).
  Das Feld ist ein **Zustand** des Eintrags: für diese
  Umgebung entfallen neue Deploy-Stände (P13) und die
  Betriebs-Anleitung (P15) in allen weiteren Marken
  **abgeleitet** — wie bei `abgebaut` —, das
  Prüfprogramm verlangt für sie weder Deploy-Stand noch
  DEPL-Deckung noch Betriebs-Anleitung
  ([[Kettenpruefung]] §Fehlende und vertretene Glieder,
  Zeile „P13, P15 je übergebener Umgebung“); der
  zuletzt freigegebene Deploy-Stand bleibt als
  Lieferung gültig. Die Verzichts-DEC auf P15 für die
  Marke des Übergabe-Punkts ist der Beleg der
  Entscheidung; nennt keine diese Umgebung, meldet das
  Prüfprogramm einen Hinweis, nicht sperrend.
- **Beispielname:** `Produktion Hoster A.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Zielumgebungen.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Zielumgebungen]].
- **RP-2-Präzisierung** (gilt bei aktivem RP-2):
  **Pflichtfelder** zusätzlich: `rolle` (Host, Gast,
  Dienst, Portal — frei), `zustand` (`geplant` |
  `aktiv` | `entkernt` | `abgebaut`) mit `zustand_seit`
  (`JJJJ-MM-TT`), `zugriffsstufe`, `erreichbarkeit`
  (wie der Agent die Umgebung aus der Sitzung erreicht:
  Shell, Konsole, Anbieter-API, nur über den Anwender —
  frei), `ausfuehrung` (`mensch` | `agent`), `sicherung`
  und `ueberwachung` (DEPL-ID des Aspekts oder `keine`),
  `geteilt_mit` (Liste anderer Projekte oder leer),
  `fruehere_kennungen` (Liste oder leer). **Optional**
  zusätzlich: `hardware` (Garantie, Firmware, Ersatz),
  `abhaengigkeiten` (Liste aus
  `Externe-Abhaengigkeiten.md` (RP-2)). **Werteliste der
  Zugriffsstufe** in RP-2 (`zugriffsstufe`):
  `keine` — der Agent erreicht die Umgebung nicht, er
  bereitet Befehle vor, der Mensch führt aus; `lesen` —
  nur lesende Befehle (Ist-Aufnahme, Prüfungen);
  `ausfuehren` — darf Skripte des Rezepts ausführen,
  ändert nichts außerhalb des Rezepts; `aendern` — darf
  auch außerhalb des Rezepts eingreifen (Konfiguration
  von Hand, Zugänge). Jeder schreibende Lauf an einer
  produktiven Umgebung braucht unabhängig von der Stufe
  das Anwender-OK (`Vorgehen-RP-2.md` §5). Eine
  Umgebung im Zustand `geplant` hat noch keinen
  Deployment-Eintrag; das Prüfprogramm verlangt die
  DEPL-Deckung erst ab `aktiv`. Der Zustand
  `abgebaut` ist Entfall-Grund für die Stände dieser
  Umgebung und wird mit dem Deploy-Stand „abgebaut“
  zusammen gesetzt ([[Katalog-Deploy-Stand]]
  RP-2-Präzisierung; `RP2-L7A`, `RP2-L7B` in
  `Vorgehen-RP-2.md` §8); ebenso ist `uebergeben_an`
  (oben, SP-1) Entfall-Grund für neue Deploy-Stände und
  die Betriebs-Anleitung der Umgebung. Grund aus realen
  Infrastruktur-Projekten: Rechte
  des Agenten standen an mehreren Orten widersprüchlich,
  wiederverwendete Kennungen führten zu Verwechslungen,
  geteilte Hosts trugen in zwei Projekten verschiedene
  Tatsachen.
