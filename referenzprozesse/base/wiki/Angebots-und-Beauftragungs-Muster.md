---
type: internal-pattern
---

# Angebots-und-Beauftragungs-Muster

Prüf- und Rechercheangebot samt
Standard-Beauftragungs-Rahmen für Sub-Agenten.
Wortlaut aus MasterPrompt §5.6 hierher verlagert;
die Kurzform im MasterPrompt zeigt auf diesen
Knoten. Moment: bei Prüf-/Recherche-Angeboten und
vor jeder Sub-Agent-Beauftragung, deren Ergebnis
als Bericht entstehen soll.

### 5.6 Prüf- und Rechercheangebot

Der Agent kann bei Bedarf **Prüf-Subagenten** starten und
**externe Recherche** anbieten. Beides sind generische
Fähigkeiten — welche konkreten Prüfungen und Recherchen an
welchen Prozess-Punkten stattfinden, legt der jeweils
gewählte Prozess fest (SP/RP-Instanz-Dokument).

**Standard-Beauftragungs-Rahmen** (Pflicht für jede
Sub-Agent-Beauftragung, deren Ergebnis als Bericht
entstehen soll — Prüfung, Recherche, Sonder-Auftrag;
der Subagent kennt diesen MasterPrompt nicht — was
nicht im Auftrag steht, passiert nicht):

**Einstieg über freigegebene Stände (DEC-214):**
Grundlagen-Artefakte referenziert der Auftrag als
versionierte, zweck-freigegebene `output/`-Stände
(kanonische Freigabe-Formel, Vorgehen.md §4) —
nicht als lebende Fassaden.

1. **Ziel-Datei explizit im Auftrag:** exakter Pfad
   und Dateiname nach REP-/REC-Konvention plus
   Frontmatter-Minimum (`type`, `id`, `model`,
   `date`, `ampel`) — „schreibe genau diese eine
   Datei".
2. **Schreibgrenzen:** nur diese eine Datei, kein
   Commit, nichts anderes anfassen; Prüf-Objekte
   ausdrücklich als read-only benennen.
3. **Rückgabe-Text ist Zusammenfassung, nicht
   Träger:** Ampel plus wenige Sätze — das Ergebnis
   lebt in der Datei.
4. **Inhalts-Bausteine je Auftrags-Typ:**
   Prüf-Aufträge tragen den Standard-Prüfprompt,
   Recherche-Aufträge den Standard-Recherche-Prompt
   (unten); immer dabei: Ehrlichkeits-Regeln und der
   nötige Sachkontext. Vorher T3-Handoff (§9.2) —
   der Subagent liest nur die Platte.
5. **Register-Arbeitsteilung:** die ID vergibt der
   Beauftragende **vor** dem Start, den
   Fassaden-Eintrag trägt er **nach** Rückkehr ein;
   der Subagent schreibt nie ins Register (die Lücke
   „ID vergeben, Knoten fehlt" meldet der
   C7-Wächter).

**Prüf-Subagenten:**

- Frischer Kontext (kein Vorwissen aus der Session).
- **Zwei-Modelle-Regel bei substantiellen Prüfungen:** zwei
  unabhängige Prüfer (nicht zwei Läufe desselben Modells);
  bei Menschen zwei Personen, die nicht am Text
  mitgeschrieben haben.
- **Standard-Prüfprompt (drei feste Fragen):**
  1. Was leitest du daraus als deinen Auftrag ab? (Nicht:
     fasse zusammen.)
  2. Wie würdest du auf dieser Grundlage konkret vorgehen?
     Mit einem realistischen Beispiel, das je Lauf wechselt.
  3. Welche Widersprüche, Lücken und Mehrdeutigkeiten
     findest du? Ausdrücklich mit der Aufforderung, **keine
     Probleme zu erfinden** und saubere Bereiche als sauber
     zu benennen.

  Prozess-spezifische Vierte Frage kann im jeweiligen
  Instanz-Dokument definiert werden (z.B. bei RP-1:
  Technologieagnostik).
- **Selbst-Triage E/F/A** durch den Prüfer:
  entscheidungsbedürftig / Formulierungs-Fix / akzeptabel.
- **Reifekriterium** (gilt für **alle** Prüfläufe): eine
  Prüfrunde liefert keine entscheidungsbedürftigen Befunde
  mehr; Formulierungsfehler und bereits akzeptierte Punkte
  zählen nicht dagegen.
- **Modell wechseln** wo möglich (nicht dasselbe Modell
  zweimal für dieselbe Prüfung).
- **Fallback:** steht nur ein Prüfer zur Verfügung, meldet
  der Agent das im Erledigt-Block und legt trotzdem vor
  (siehe [[Berichten-statt-Blockieren]]) — die Freigabe
  bleibt Sache des Anwenders.
- **Prüfberichte** landen als REP-Detail-Knoten in
  `wiki/` mit Eintrag in der Fassade
  `wiki/Agent-Berichte.md` (Commit-Präfix `Report:`,
  Standardaufgabe Agent-Bericht-Ingest §5.1.2).
  Abgrenzung: fachliche Analysen ohne Prüf-Charakter
  bleiben versionierte Dateien in `overview/`.

**Multi-Agent-Reviews nach `Reviewmuster.md`:** Für
substantielle Prüfungen wählt der Agent Muster
(M1–M5), Modell-Klassen und Reifekriterium-Variante
nach `Reviewmuster.md` und schlägt konkrete
Prüfer-Paare aus den in `Tools.md` registrierten
Sub-Agent-Werkzeugen vor.

**Pflicht-Angebot vor Versand:** Bevor aus einem
Versandstand (`outgoing/`) Artefakte erzeugt werden,
**muss** der Agent ein Review anbieten (Minimum
Zwei-Modelle-Regel; Ablauf und `review:`-Pflichtfeld:
`Outgoing.md` §3.2/§6). Verzicht ist
Anwender-Entscheid mit benanntem Impact
(`review: verzichtet`). Für `output/`-Freigabestände
gilt keine zusätzliche Pflicht — dort greift die
Freigabe-Mechanik (Basis-Prüfung an Phasen mit
Freigabe-Zweck).

**Externe Recherche:**

- **Vor dem Angebot** prüft der Agent, welche Werkzeuge er
  tatsächlich hat — Kategorie „Recherche-Werkzeuge" in
  `Tools.md`. Was er nicht hat, bietet er nicht an.
- **Standard-Angebotsformat** (Tabelle):
  | Was ich recherchieren will | Warum | Womit | Aufwand |
  Zusätzlich eine Zeile **„Keine Recherche"** mit benanntem
  Impact als gleichwertige Option. Sind in `Tools.md`
  **dedizierte Recherche-Tools** registriert, führt die
  Tabelle sie als gleichwertige Alternativ-Zeile zur
  Sub-Agent-Recherche — auch extern bediente Tools (z.B.
  NotebookLM): der Agent formuliert Frage und
  Quellen-Rahmen, der Anwender fährt die Recherche, das
  Ergebnis kommt als Fremdaussage in den normalen
  Rechercheartefakt-Ingest.
- **Standard-Recherche-Prompt** (fester Auftrag an den
  Recherche-Subagenten, Gegenstück zum
  Standard-Prüfprompt — die Bausteine gelten sinngemäß
  auch für Aufträge an extern bediente Tools):
  1. **Frage + Verwendungszweck** — die Recherche-Frage
     präzise, plus der nächste Schritt, für den die
     Antwort gebraucht wird; „reicht" bemisst sich an
     diesem Schritt, nicht an abstrakter
     Vollständigkeit.
  2. **Quellen-Rahmen** — erlaubte Werkzeuge und
     Quellen, grober Aufwands-Rahmen.
  3. **Erwartungs-Blindheit** — der Auftrag enthält die
     Frage und den nötigen Sachkontext, aber nicht die
     erhoffte Antwort (keine Leitfrage, die das Ergebnis
     präjudiziert).
  4. **Ehrlichkeits-Regeln** — Fund und Nicht-Fund
     strikt trennen; „nichts Belastbares gefunden" ist
     ein gültiges Ergebnis; nichts erfinden; jede
     Aussage mit Quelle und Datum unmittelbar am Zitat.
  5. **Liefer-Format** — Rückgabe in der
     Rechercheartefakt-Sektions-Struktur (Frage /
     Recherche-Verlauf / Fundstellen / Ergebnis, siehe
     `## Meta` der Fassade [[Rechercheartefakte]]),
     damit der Ingest mechanisch ist; zitierte
     Quellen mit Aufbewahrungs-Wert als Downloads
     bzw. Markdown-Snapshots mitliefern
     (Archiv-Schritt nach §1.8).
- **Bei Zustimmung**: Recherche durchführen; Ergebnis als
  **Rechercheartefakt** `wiki/REC-NNN — <Kurzsatz>.md`
  ablegen, mit Quellen und Datum, plus Eintrag in der
  Fassade `wiki/Rechercheartefakte.md` (Commit-Präfix
  `Recherche:`, Standardaufgabe Recherche-Ingest
  §5.1.2). **Quellen archivieren:** alles, worauf ein
  Zitat oder eine Übernahme-Buchung sich stützt, als
  Kopie nach `research/REC-NNN - <Kurzsatz>/` (§1.8)
  — die `quelle_liste` führt URL **und** Archiv-Pfad;
  ein flüchtiger Link allein ist kein Nachweis.
- **Ergebnisse sind Fremdaussagen** — als solche
  gekennzeichnet, mit Quelle. Die **Übernahme** der Aussagen
  ins Projekt ist eine User-Entscheidung, wird als
  DEC-Eintrag gebucht (Artefakt als Nachweis).
- **„Keine Recherche"** ist eine zulässige Antwort — sie
  wird mit dem benannten Impact als DEC-Eintrag festgehalten.
- **Umfangreiche Fundstellen** (Handbücher, Normtexte,
  Spezifikationen) werden von Subagenten ausgewertet, nicht
  vollständig gelesen.

**Init-Verzahnung:** Verfügbare Prüf- und
Recherche-Werkzeuge werden in Phase B registriert (§5.3)
und in Phase D Turn 1 im Erledigt-Block genannt (Liste
oder Vermerk „keine verfügbar").

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzform: MasterPrompt §5.6
- Nachbar-Muster: [[Fahrplan-Vorlage]] (ordnet
  Ketten; dieses Muster füllt Einzel-Angebote und
  Beauftragungen)
- Review-Muster und Modell-Klassen: Reviewmuster.md
