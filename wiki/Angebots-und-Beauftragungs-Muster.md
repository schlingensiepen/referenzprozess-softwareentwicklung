---
type: internal-pattern
---

# Angebots-und-Beauftragungs-Muster

Prüf- und Rechercheangebot samt
Standard-Beauftragungs-Rahmen für Sub-Agenten, dazu
Auftragsliste zur Freigabe und Werkzeug-Dauerfreigabe.
Wortlaut aus MasterPrompt §5.6 hierher verlagert;
die Kurzform im MasterPrompt zeigt auf diesen
Knoten. Moment: bei Prüf-/Recherche-Angeboten,
vor jeder Sub-Agent-Beauftragung, deren Ergebnis
als Bericht entstehen soll, und vor jeder
Auftragsliste zur Freigabe.

### 5.6 Prüf- und Rechercheangebot

Der Agent kann bei Bedarf **Prüf-Subagenten** starten und
**externe Recherche** anbieten. Beides sind generische
Fähigkeiten — welche konkreten Prüfungen und Recherchen an
welchen Prozess-Punkten stattfinden, legt der jeweils
gewählte Prozess fest (SP/RP-Instanz-Dokument).

**Standard-Beauftragungs-Rahmen** (Pflicht für jede
Sub-Agent-Beauftragung, deren Ergebnis als Bericht
entstehen soll — Prüfung, Recherche, Sonder-Auftrag).
Ein Subagenten-Auftrag ist **wiki-verweisend**
(MasterPrompt §9.6): er nennt Einstieg und
freigegebene Stände, der Subagent liest im Wiki, was
er braucht; was der Auftrag weder nennt noch
verlinkt, passiert nicht. Der Auftrag ist eine
Einmal-Instanz — erzeugt, nicht gepflegt:

**Einstieg über freigegebene Stände** (wiki-verweisender
Auftrag, MasterPrompt §9.6):
Grundlagen-Artefakte referenziert der Auftrag als
versionierte, zweck-freigegebene `output/`-Stände
(kanonische Freigabe-Formel, Vorgehen.md §4) —
nicht als lebende Fassaden.

1. **Ziel-Datei explizit im Auftrag:** exakter Pfad
   und Dateiname nach REP-/REC-Konvention plus die
   Pflicht-Frontmatter-Felder des Berichts-Typs (aus
   dem Katalog-Eintrag: [[Katalog-Agent-Berichte]],
   bei Prüfberichten [[Katalog-review-report]];
   Header-Regel in [[Agent-Berichte]]) — „schreibe
   genau diese eine Datei".
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
   nötige Sachkontext. Vorher H3-Handoff (MasterPrompt §9.2) —
   der Subagent liest nur die Platte.
5. **Register-Arbeitsteilung:** die ID vergibt der
   Beauftragende **vor** dem Start, den
   Fassaden-Eintrag trägt er **nach** Rückkehr ein;
   der Subagent schreibt nie ins Register (die Lücke
   „ID vergeben, Knoten fehlt" meldet der
   C7-Wächter).

**Prüf-Subagenten:**

- **Ablauf eines Prüflaufs:** frischer Kontext,
  Standard-Prüfprompt (drei feste Fragen, optional
  eine prozess-spezifische vierte), Zwei-Modelle-Regel,
  Selbst-Triage E/F/A, Reifekriterium mit
  Review-Kette und Fallback bei nur einem Prüfer
  stehen in `Reviewmuster.md` §2 (vier Schleifen) —
  lesen vor jeder Prüf-Beauftragung und vor jedem
  Re-Check. Ein Prüf-Auftrag trägt den
  Standard-Prüfprompt im Wortlaut (Rahmen Punkt 4).
- **Prüfberichte** landen als REP-Detail-Knoten in
  `wiki/` mit Eintrag in der Fassade
  `wiki/Agent-Berichte.md` (Commit-Präfix `Report:`,
  Standardaufgabe Agent-Bericht-Ingest MasterPrompt §5.1.2).
  Abgrenzung: fachliche Analysen ohne Prüf-Charakter
  bleiben versionierte Dateien in `overview/`.

**Multi-Agent-Reviews nach `Reviewmuster.md`:** Für
substantielle Prüfungen wählt der Agent Muster
(M1–M6), Modell-Klassen und Reifekriterium-Variante
nach `Reviewmuster.md` und schlägt konkrete
Prüfer-Paare aus den in `Tools.md` registrierten
Sub-Agent-Werkzeugen vor.

**Review-Angebote — Auslöser.** Reviews sind
Angebots-Sache ([[Berichten-statt-Blockieren]]); der
Agent bietet sie zu folgenden Auslösern von sich aus
an. Prüfer-Modell ≠ Bau-Modell gilt bei jedem Angebot
(Bau-Modell ist das Modell, das die Änderung schrieb —
auch der koordinierende Agent bei eigenen Edits).

- **Nach einer Änderung:** Review im passenden Umfang
  anbieten — Kurzform (ein Prüfer, Standard-Prüfprompt)
  bei kleinen Änderungen, Muster nach
  `Reviewmuster.md` bei substantiellen.
- **Nach Upgrade und Migration** (Upgrade und Migration
  des Templates nach der Anleitung des Starters; ein
  Prozess-Upgrade nach Wiki.md §11.5 B nur, wenn es
  bestehende Einträge migriert — sonst gilt „Nach einer
  Änderung“): kein Angebot, sondern ein
  **Absicherungs-Review** in zwei Stufen — zuerst die
  maschinelle Vorprüfung durch Agenten bis zur Reife
  (zwei Modelle über ein Werkzeug, sonst frische
  Agenten desselben Modells in neuem Kontext als
  schwächere Absicherung), danach der Anwender, wenn er
  beim Init den Ersatzweg „Anwender als Prüfer“ gewählt
  hat (`Reviewmuster.md` §2 Schleife 2,
  „Absicherungs-Review nach Upgrade und Migration“).
- **Vor jeder Publikation** — Push in ein geteiltes
  oder öffentliches Remote, Sichtbarkeits-Wechsel des
  Repos, Neu-Ableitung eines selbsttragenden Dokuments
  (MasterPrompt §9.6): **Pflicht-Angebot** analog zum
  Versand (unten). Verzicht ist Anwender-Entscheid und
  wird mit benanntem Impact dokumentiert. Vor der
  Neu-Ableitung eines selbsttragenden Dokuments schlägt
  der Agent zusätzlich den Verständnis-Check vor
  (`Reviewmuster.md` §3 M6 — Leser ohne Repo-Zugang
  prüft, ob das Dokument ohne Repo-Zugang trägt).
- **Pflicht-Angebot vor Versand:** Bevor aus einem
  Versandstand (`outgoing/`) Artefakte erzeugt werden,
  **muss** der Agent ein Review anbieten (Minimum
  Zwei-Modelle-Regel; Ablauf und `review:`-Pflichtfeld:
  `Outgoing.md` §3.2/§6). Verzicht ist
  Anwender-Entscheid mit benanntem Impact
  (`review: verzichtet`). Für `output/`-Freigabestände
  gilt keine zusätzliche Pflicht — dort greift die
  Freigabe-Mechanik (Basis-Prüfung an Phasen mit
  Freigabe-Zweck).
- **Übertrag ins Produkt** (Projekte mit getrenntem
  Produkt-Repo, [[Two-Repo-Submodul-Muster]]): Das ist
  die Verschärfung des Pflicht-Angebots vor Publikation
  für dasselbe Ereignis — **eine** Regel, nicht zwei
  Angebote. Der Agent bietet **mit Nachdruck** ein
  **Voll-Review** an (Muster nach `Reviewmuster.md`,
  Reifekriterium erfüllt) — oder fragt gleich, ob das
  **immer so** laufen soll; bei Ja wird das Voll-Review
  als **Standing-Freigabe** eingerichtet, nach dem
  Muster der Kadenz-Ausführung in MasterPrompt §6.1
  (still ausführen, Ergebnis immer zeigen; im
  Einzelfall vom Anwender abschaltbar). Das
  Voll-Review umfasst **alle** beim Übertrag erzeugten
  Dokumente; Code und Tests deckt die
  [[Kettenpruefung]] ab (Tests grün plus Code-Review
  als Kettenprüfung des Glieds P9, Vorbedingung des
  Tags; §Code-Glieder).

Jedes dieser Reviews läuft als Review-Kette Prüfen →
Einarbeiten → Re-Check bis zur Reife
(`Reviewmuster.md` §2 Schleife 4).

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
     (Archiv-Schritt nach MasterPrompt §1.8).
- **Bei Zustimmung**: Recherche durchführen; Ergebnis als
  **Rechercheartefakt** `wiki/REC-NNN — <Kurzsatz>.md`
  ablegen, mit Quellen und Datum, plus Eintrag in der
  Fassade `wiki/Rechercheartefakte.md` (Commit-Präfix
  `Recherche:`, Standardaufgabe Recherche-Ingest
  MasterPrompt §5.1.2). **Quellen archivieren:** alles, worauf ein
  Zitat oder eine Übernahme-Buchung sich stützt, als
  Kopie nach `research/REC-NNN - <Kurzsatz>/` (MasterPrompt §1.8)
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
Recherche-Werkzeuge nennt der Agent beim Init in
Phase D Turn 1 aus seiner Umgebung im Erledigt-Block
(Liste oder Vermerk „keine verfügbar") und trägt sie
mit der ersten Wahl in `Tools.md` ein
([[Init-Choreografie]] §Phase D).

### Auftragsliste zur Freigabe

Welche Aufträge eine Auftragsliste brauchen, steht in
den Grenzen von [[Do-first-mit-Veto]]. Die Liste nennt
je Auftrag:

| Inhalt/Ziel | Werkzeug/Dienst | Quellen | Zeitplan/Staffelung | Retry-Regel | erwartete Kosten/Kontingent | Ablageort |
|---|---|---|---|---|---|---|

- **Quellen:** worauf sich der Auftrag stützt.
- **Freigabe als Ganzes:** der Anwender gibt die Liste
  frei, nicht jeden Auftrag einzeln.
- **Abweichungen im Lauf** — Fehlschlag jenseits der
  Retry-Regel, Mehrkosten — meldet der Agent, bevor er
  weitermacht.

**Werkzeug-Dauerfreigabe.** Der Agent fragt den
Anwender **immer**, spätestens nach der ersten
freigegebenen Auftragsliste für ein Werkzeug: „Willst
du dieses Werkzeug ab jetzt komplett freigeben?“ Bei
Ja bucht er die Dauerfreigabe als `internal-rule` in
[[InterneMechanik]] (Form: `## Meta` der Fassade).
Weitere Aufträge mit diesem Werkzeug laufen dann ohne
Vorab-Liste und erscheinen im Erledigt-Block;
Meldungen zu Mehrkosten und Fehlschlägen bleiben. Der
Anwender kann die Dauerfreigabe jederzeit widerrufen;
danach gilt wieder die Auftragsliste.

Welches Werkzeug ein Auftrag nutzt, wählt der Anwender
vorher (Vorgehen.md §7b).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Verweis mit Link-Beschreibung: MasterPrompt §5.6
- Ablauf eines Prüflaufs (Standard-Prüfprompt,
  Zwei-Modelle-Regel, Triage, Reife):
  `Reviewmuster.md` §2
- Nachbar-Muster: [[Fahrplan-Vorlage]] (ordnet
  Ketten; dieses Muster füllt Einzel-Angebote und
  Beauftragungen)
- Review-Muster, Modell-Klassen und Review-Kette:
  Reviewmuster.md
- Prüfbericht-Header und Fassaden-Kurzform:
  [[Agent-Berichte]]
- Zwei-Repo-Projekte (Übertrag ins Produkt):
  [[Two-Repo-Submodul-Muster]]
