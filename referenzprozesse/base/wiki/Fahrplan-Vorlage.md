---
type: internal-pattern
---

# Fahrplan-Vorlage

**Zweck:** eine kurze **Übersicht**, die dem
Anwender vor einer **mehrstufigen
Entscheidungs-Sequenz** zeigt, welche
Entscheidungen anstehen — bevor die erste
Einzel-Vorlage kommt. Wer sich durch eine Kette
von Entscheidungen navigieren soll, deren Ende er
nicht kennt, entscheidet nicht wirklich autonom.
Der Fahrplan macht die Kette sichtbar, bevor sie
ihn erreicht.

## Wann anwenden

Vor jeder Anwender-Interaktion, die aus **zwei oder
mehr zusammenhängenden Entscheidungen** besteht.
Beispiele:

- **Sessionstart-Init** (MasterPrompt §5.3:
  Turn-Sequenz mit dem Anwender — der Init-Fahrplan
  in Turn 0 ist die erste Anwendung).
- **Scaffolding-Vorlauf** mit mehreren
  Einrichtungs-Entscheidungen (Zweck, Stack,
  Lizenz, Sichtbarkeit, Repo-Aufteilung).
- **Freigabe-Kette** nach einer Phase mit mehreren
  Zweck-Freigaben, die zusammen entschieden werden
  (Vorgehen.md).
- **Design-Runde** mit mehreren zusammenhängenden
  Design-Fragen.

**Nicht anwenden:** bei Einzel-Entscheidungen oder
wenn die Kette sehr kurz (2 Punkte) und
selbst-erklärend ist.

## Was der Fahrplan enthält

**Verpflichtend:**

1. **Liste der anstehenden Entscheidungen** — je
   Punkt ein Ein-Zeilen-Titel.
2. **Reihenfolge** — chronologisch, wie der Agent
   sie vorlegen würde.
3. **Abhängigkeiten** — je Punkt kurz: hängt ab
   von … (Punkt-Nr. oder externer Voraussetzung).
4. **Aufschub-Vorschläge des Agenten** — wo der
   Agent empfiehlt, einen Punkt zu vertagen und
   warum (typisch: fehlende Grundlage, keine
   Dringlichkeit).
5. **Nur beim Init-Fahrplan — Ordner-Briefing:**
   vor der Entscheidungs-Liste zeigt der Agent die
   Ordner-Landkarte, damit der Anwender die
   folgenden Init-Fragen einordnen kann
   (Kurzfassung — verbindlich ist MasterPrompt §1):

   - `raw/` — Originaldokumente, unveränderlich
     (§1.2)
   - `input/` — Volltext-Konvertierungen, erzeugt
     der WorkspaceManager (§1.3)
   - `research/` — Recherche-Archiv des Agenten
     (§1.8)
   - `wiki/` — alles lebende Projektwissen (§1.4)
   - `output/` — eingefrorene Übergabe-Stände,
     versioniert (§1.5)
   - `overview/` — eingefrorene
     Selbst-Auswertungen (§1.6)
   - `outgoing/` — Versandstand-Ordner; daraus
     erzeugt der **WorkspaceManager** PDF/EML/DOCX,
     ohne ihn der Agent selbst (§1.7) — darauf
     zielt die spätere WorkspaceManager-Frage.
6. **Nur beim Init-Fahrplan — Zielmarken-Vorstellung**
   ([[Zielmarken]]): der Agent stellt den
   Mechanismus kurz vor (benannte
   Planungs-Horizonte mit den Zeigern `current` und
   `in-progress`; Marken-Dreiklang Bezeichnung /
   Benennung / Beschreibung) und kündigt an, dass
   nach der Fassaden-Auswahl eine
   **Erst-Definition** ansteht, sofern die Fassade
   aktiviert wird. Keine Marken-Vorschläge im
   Fahrplan selbst (Verbote unten) — die
   Erst-Definition läuft im Bootstrap der Fassade.

**Verboten:**

- **Keine Optionen pro Punkt** — der Fahrplan
  ordnet, die Optionen kommen in der
  Einzel-Vorlage.
- **Keine Detailempfehlungen** — der Fahrplan sagt
  nicht „ich empfehle Python", er sagt „Stack-Wahl
  steht an, hängt von Zweck-Klärung ab".

**Grund für die Verbote:** wenn der Fahrplan schon
Optionen und Empfehlungen enthält, wird er zur
Sammelvorlage und der Anwender muss durch alles
auf einmal — genau das Problem, das der Fahrplan
lösen soll, kehrt zurück.

## Anwender-Reaktion

Nach Vorlage des Fahrplans kann der Anwender:

- **streichen** — Punkt X ist nicht relevant,
  entfällt.
- **umsortieren** — Reihenfolge ändern (z.B.
  Punkt Y vor Punkt X).
- **vorziehen** — jetzt sofort entscheiden, ohne
  die Einzel-Vorlage abzuwarten (typisch bei
  Trivial-Entscheidungen, die im Fahrplan schon
  klar sind).
- **pauschal aufschieben** — mehrere Punkte auf
  später, ohne Auslöser (dann greift die
  wiederkehrende Wächter-Erinnerung beim
  Sessionstart).
- **einzeln aufschieben mit Auslöser** — „Punkt X
  später, Auslöser: sobald Y entschieden ist"
  (dann ruht der Punkt und wird erst bei
  Auslöser-Feuerung wieder vorgelegt).
- **freigeben** — „der Fahrplan passt, mach in
  dieser Reihenfolge".

Erst nach dieser Rückmeldung startet der Agent mit
der ersten Einzel-Vorlage.

## Ausgabe-Format

Der Fahrplan wird im **Frage-Block** des
Erledigt/Aktion/Frage-Rasters vorgelegt. Beispiel:

> **Frage — Fahrplan zum Scaffolding-Vorlauf:**
> Folgende Entscheidungen stehen an. Bitte gib
> Rückmeldung (streichen, umsortieren, vorziehen,
> aufschieben, freigeben):
>
> 1. Projektzweck und Zielgruppe — unabhängig
> 2. Lizenz und Repo-Sichtbarkeit — unabhängig
> 3. Sprache und Stack — hängt an 1
> 4. Repo-Aufteilung Werkstatt/Produkt — hängt an 2
>
> Vorschlag Reihenfolge: 1 → 2 (unabhängige
> zuerst) → 3 → 4 (mit Kopplung).

## Verhältnis zu anderen Mustern

- **Prüf-/Recherche-Angebots-Tabelle (MasterPrompt
  §5.6):** dort bietet der Agent eine Tabelle mit
  Was/Warum/Womit/Aufwand + „Keine Recherche" als
  Option. Ähnliche Struktur, aber ein
  **Einzel-Angebot** pro Recherche-Thema, kein
  Ketten-Fahrplan. Die Fahrplan-Vorlage ordnet
  Ketten, das Angebots-Muster füllt Einzel-Punkte.
- **Erledigt/Aktion/Frage-Raster:** der Fahrplan
  wird als Frage vorgelegt (siehe Ausgabe-Format
  oben).
- **Reviewmuster.md §4 Muster-Auswahl:** bei
  Multi-Agent-Reviews wird ebenfalls vor der
  Ausführung ein Muster/Klasse/Erschöpfungs-
  Kriterium gewählt — das ist strukturell ein
  Mini-Fahrplan innerhalb des Review-Auftrags.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Verweisender Rahmen: Vorgehen.md §1
  (Grundhaltung)
- Init-Verwendung: [[Init-Choreografie]] (Turn 0
  „Init-Fahrplan"; Kern-Kurzform MasterPrompt §5.3)
