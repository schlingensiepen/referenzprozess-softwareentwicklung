# Reviewmuster

**Stand:** 2026-08-23

Dieses Dokument beschreibt die **Reviewmuster** des
Templates: wie Prüfungen durch mehrere Sub-Agenten
organisiert werden, welche Muster für welche Artefakte
geeignet sind und wie modell-agnostisch über
**Modell-Klassen** ausgewählt wird. Es ist eine
Teildatei des MasterPrompts und gilt zusammen mit den
Regeln aus `MasterPrompt.md`.

Verhältnis zu benachbarten Dokumenten:

- **`Vorgehen.md` §7** verweist auf dieses Dokument
  für die Auswahl des Prüf-Musters.
- **MasterPrompt §5.6** bleibt die generische
  Prüf-/Recherche-Basis-Fähigkeit (Standard-Prüfprompt,
  Zwei-Modelle-Regel, Selbst-Triage, Reifekriterium).
  Reviewmuster präzisiert und strukturiert diese Basis.
- **`wiki/Agent-Berichte.md`** regelt die Ablage der
  Prüfberichte (`wiki/agent-berichte/REP-…`).
- **`Vorgehen.md` §4** definiert das Format der
  Freigabe-DECs (kanonische Formel: „Stand x von
  ⟨Artefakt⟩, freigegeben für Zweck Z [zu Marke
  M]"), die die Prüfer als Nachweis aufnehmen.

## 1. Grundhaltung

**Reviews sind Freigabe-vorbereitend.** Bevor ein
Artefakt „für Zweck Y" freigegeben wird
(`Vorgehen.md` §4), prüft ein Set unabhängiger
Prüfer die Freigabe-Reife.

**Berichten statt Blockieren.** Ein Review, das nicht
alle üblichen Prüfer stellen kann (z.B. nur ein
Modell verfügbar statt zwei), wird trotzdem
durchgeführt — mit expliziter Meldung der Einschränkung
in Prüfbericht und Freigabe-DEC. Der Anwender
entscheidet über Weiterarbeit (siehe
[[Berichten-statt-Blockieren]]).

**Prüfberichte** landen in
`wiki/agent-berichte/REP-NNN — …md` (Detail-Typ
`agent-report`, Fassade `wiki/Agent-Berichte.md`).
Fachliche Analysen, die keinen Aspekt prüfen, gehören
dagegen nach `overview/` (Vorgehen.md §7,
Abgrenzungs-Kriterium).

## 2. Mechanik jedes Reviews — Vier Schleifen

Jeder einzelne Review-Lauf hat vier ineinander
liegende Wiederholungs-Ebenen. Von innen nach außen:

### Schleife 1 — Fragen-Schleife innerhalb eines Prüfer-Laufs

Der Prüfer beantwortet für das vorgelegte Artefakt
den **Standard-Prüfprompt** aus MasterPrompt §5.6 —
drei feste Fragen plus optional eine prozess-spezifische
vierte:

1. Was leitest du daraus als deinen Auftrag ab?
   (Nicht: fasse zusammen.)
2. Wie würdest du auf dieser Grundlage konkret
   vorgehen? Mit realistischem Beispiel, das je Lauf
   wechselt.
3. Welche Widersprüche, Lücken und Mehrdeutigkeiten
   findest du? Ausdrücklich mit der Aufforderung,
   **keine Probleme zu erfinden** und saubere Bereiche
   als sauber zu benennen.
4. *Prozess-spezifisch* (Beispiel RP-1 P4:
   „Ist die Spezifikation frei von Technologie-
   Vorannahmen?"; Beispiel Ausführungs-
   Selbstgenügsamkeit in §3 M2: „Könntest du das
   umsetzen ohne Annahme?").

Der Prüfer startet mit **frischem Kontextfenster** —
keine Vorbelastung durch die Erzeugungs-Session.

### Schleife 2 — Prüfer-Schleife pro Runde (Zwei-Modelle-Regel)

Pro Prüfrunde laufen **mindestens zwei unabhängige
Prüfer parallel**. „Unabhängig" heißt:

- verschiedene **Modelle** (nicht zweimal dasselbe
  Modell) — Kern der Zwei-Modelle-Regel
  (MasterPrompt §5.6)
- verschiedene **Kontextfenster** (jeder für sich frisch)
- die Standard-Fragen 1–4 sind gesetzt, Prompt-
  Formulierungs-Varianten sind zulässig

Fallback: nur ein Modell mit passender Klasse
verfügbar → nach §1 „Berichten statt Blockieren"
melden, trotzdem vorlegen (mit „Ein-Prüfer-Warnung"
in der Freigabe-DEC).

Modell-Auswahl erfolgt über **Klassen** — siehe §5.

### Schleife 3 — Triage-Schleife (Selbst-Triage E/F/A)

Nach Vorlage der Prüfberichte triagiert der
**koordinierende Agent** (oder der Anwender bei
Grenzfällen) jeden Befund:

- **E — Entscheidungsbedürftig:** substantieller
  Widerspruch, echte Lücke, blockierende
  Mehrdeutigkeit → muss adressiert werden vor Freigabe.
- **F — Formulierung:** Wortlaut-Präzisierung, kein
  sachlicher Konflikt → kann adressiert werden oder
  als Beobachtung stehen bleiben.
- **A — Akzeptabel:** kein Handlungsbedarf, Prüfer
  hat die Absicht des Artefakts nur nicht getroffen.

Die Triage ist **eigene Denkarbeit**, kein blindes
Übernehmen der Prüf-Befunde. Der Koordinator kann
E-Befunde eines Prüfers als F oder A werten, wenn der
andere Prüfer widerspricht oder der Kontext dagegen
steht — muss die Abweichung aber begründen (als
Triage-Vermerk im Prüfbericht oder in der Freigabe-DEC).

### Schleife 4 — Runden-Schleife (Reifekriterium)

Solange eine Prüfrunde noch entscheidungsbedürftige
Befunde liefert, folgt eine weitere Runde: Artefakt
aktualisieren → neue Runde starten (wieder unabhängige
Prüfer, wieder frischer Kontext). Die Runden-Schleife
kennt **zwei Varianten** der Abbruch-Bedingung:

- **Standard-Reifekriterium (K=1)** — eine Prüfrunde
  liefert keine E-Befunde mehr. Für den Basis-Fall
  jedes Reviews (M1–M4).
- **Erschöpfungs-Reifekriterium (K≥2)** — K
  konsekutive Runden liefern keinen neuen E-Befund
  (K=2 typisch, K=3 bei Höchst-Risiko). Für Long-Tail-
  Absicherung: Sicherheits-Reviews, Compliance-
  Prüfungen, Auslieferungs-Reviews an Dritte,
  Contract-Reviews mit vielen Konsumenten.

Wahl der Variante ist eine **Prüf-Parameter-
Entscheidung**, nicht ein anderes Muster. Der Anwender
(oder der Agent bei Standing-Freigabe) legt sie beim
Review-Auftrag fest.

Reifekriterium ist **nicht optional**. Wer eine
Freigabe ohne erfüllte Reife bucht, dokumentiert das
als „Notfall-Freigabe" mit expliziter Rücknahme-
Bereitschaft (siehe `Vorgehen.md` §4 Freigabe-
Rücknahme).

## 3. Muster-Katalog

Fünf etablierte Muster. **M1 ist immer** (Basis-
Absicherung). **M2** für Anker-Artefakte. **M3–M5**
gezielt bei besonderen Risiken oder Fragestellungen.

### M1 — Standard-Prüfprompt (Zwei-Modelle-Regel)

**Zweck:** Basis-Absicherung eines Artefakts. Ein
Artefakt wird von zwei unabhängigen Prüfern mit dem
Standard-Prüfprompt (§2 Schleife 1) geprüft.

**Ablauf:** Vier Schleifen (§2) mit Standard-
Reifekriterium (K=1).

**Wann einsetzen:** jedes Artefakt vor jeder Freigabe.
Der Basis-Fall.

**Modell-Klassen (§5):** typischerweise K-SEMANTIK
plus K-STRUKTUR oder K-URTEIL — hängt am Artefakt-Typ.

### M2 — Trias plus Ausführungs-Selbstgenügsamkeit

**Zweck:** Anker-Absicherung — für Artefakte, die als
**Grundlage für Weiterarbeit** dienen (Spezifikationen,
Architekturen, Contracts, Deploy-Beschreibungen,
Konsolidierungen, Auslieferungs-Dokumente an Dritte).

**Ablauf:** Vier hintereinandergeschaltete Reviews,
jedes intern nach M1-Mechanik (Vier Schleifen):

1. **Fileinventur** — Ist der Artefakt-Bestand
   vollständig und wohl-geformt? Datei-Bestand gegen
   erwartete Menge, Frontmatter-konform, keine
   Waisen, keine unerwarteten Extras.
2. **Innere Konsistenz** — Ist der Bestand
   widerspruchsfrei zu sich selbst? Verweise
   auflösbar, Register-Feld-Konsistenz, keine
   internen Widersprüche.
3. **Äußere Konsistenz** — Deckt sich der Bestand
   mit dem Referenz-Artefakt? Prüfung gegen externe
   Wahrheit (Grundlage-Artefakt, Quelle, andere
   Wahrheits-Schicht). Deckt Drift auf.
4. **Ausführungs-Selbstgenügsamkeit** — Der Prüfer
   wird als **hypothetischer Umsetzer** positioniert
   und beantwortet die Kern-Frage:
   > „Könntest du auf Basis dieses Artefakts allein
   > die Umsetzung anfangen, ohne eine Annahme treffen
   > zu müssen, die nicht im Artefakt steht?"
   Jede Annahme-Nennung des Prüfers ist eine
   **Artefakt-Lücke**, die vor Freigabe geschlossen
   werden muss.

Die vier Reviews können **sequenziell** laufen (weil
frühere Fehler in Fileinventur die späteren Reviews
sinnlos machen können) oder **parallel starten** und
sequenziell terminieren, wenn Wartezeit ein Problem ist.

**Beispiel Spezifikation vs. Anforderungs-Register:**
Fileinventur prüft „sind alle Register-Einträge
strukturell in Ordnung"; Innere Konsistenz prüft „ist
die Spezifikation in sich widerspruchsfrei"; Äußere
Konsistenz prüft „sind alle nicht-verworfenen
Anforderungen in der Spezifikation adressiert";
Selbstgenügsamkeit prüft „könnte jemand die
Umsetzung starten ohne Rückfrage?".

**Wann einsetzen:**

- Artefakte, auf denen andere Artefakte oder andere
  Menschen aufbauen (Anker-Rolle)
- Dokumente nach außen (Auslieferungen an Dritte,
  Handbücher, Deploy-Anleitungen)
- Konsolidierte Wahrheiten nach Destillation
  (Register nach großen Umbauten, zusammengeführte
  Wahrheits-Dokumente)

**Wann nicht:** Zwischen-Artefakte im Fluss, die keine
Grundlage für Weiterarbeit sind (Recherche-Notizen,
Konzept-Skizzen, iterative Zwischenstände).

**Modell-Klassen (§5):** Fileinventur → K-STRUKTUR;
Innere Konsistenz → K-SEMANTIK; Äußere Konsistenz →
K-LANGKONTEXT (für den Referenz-Abgleich); Ausführungs-
Selbstgenügsamkeit → K-URTEIL.

**Referenz-Achsen der Äußeren Konsistenz.** Die dritte
Prüfung (Äußere Konsistenz) hat zwei gleichwertige
Ausprägungen — je nach Referenz-Grundlage:

- **Achse A: Externe Quelle.** Das Artefakt wird gegen
  ein externes Ursprungs- oder Rohdokument geprüft
  (z.B. externer Referenzprozess-Text, Anwender-
  Anforderungs-Dokument). Prüfung: „Ist alles aus
  der Quelle im Artefakt aufgehoben?" Jeder Quell-
  Bestandteil wird klassifiziert:
  **(a)** bewusst abgewichen oder weggelassen
  (dokumentiert), **(b)** im Artefakt nachweisbar
  aufgehoben, **(c)** verloren ohne Ersatz und ohne
  Erklärung — Alarm, **(d)** Bedeutungsverschiebung.
- **Achse B: git-Vor-Zustand (Umbau-Review).** Bei
  **strukturellen Umbauten** (Kaskaden-Änderung, DEC-
  Ablösung mit inhaltlicher Wirkung, Fassaden-
  Migration, Register-Neuordnung, Rollen-Ebenen-
  Änderung) wird der Vor-Umbau-Zustand
  (Baseline-Commit) als Referenz herangezogen. Prüfung:
  „Ist alles vor dem Umbau Vorhandene entweder im neuen
  Stand aufgehoben oder bewusst weggelassen?"
  Klassifikation analog mit Bezug auf eine begleitende
  Delta-Notiz (siehe unten): **(a')** in der Delta-Notiz
  als bewusst erklärt, **(b')** im neuen Stand
  nachweisbar aufgehoben (Verweis auf Zielort),
  **(c')** Verlust ohne Ersatz und ohne Erklärung —
  Alarm, **(d')** Bedeutungsverschiebung. Voraussetzung
  für die Freigabe eines strukturellen Umbaus
  (Umbau-Review-Pflicht, `Vorgehen.md` §7).

**Umbau-Review-Vier-Schritt-Mechanik** (Achse B):
Baseline-Commit vor Start → Delta-Notiz während des
Umbaus (was wandert wohin, was fällt bewusst weg) →
Post-Umbau-Sub-Agent vergleicht `git diff` gegen Delta-
Notiz und klassifiziert (a')/(b')/(c')/(d') → Freigabe
nur bei grüner Ampel (grün nur, wenn keine (c')- und
(d')-Befunde offen sind).

### M3 — Adversarial Verify (Refutation-First)

**Zweck:** Prüfung des Prüfers oder Absicherung
einzelner Behauptungen. N Sub-Agenten (typisch 3) mit
explizitem Auftrag „**versuche zu widerlegen**;
Zweifelsfall = widerlegt". Mehrheit widerlegt →
Befund fällt.

**Ablauf:** N parallele Prüfer mit Refutation-Prompt
statt Standard-Prüfprompt. Kein Reifekriterium in der
Runden-Schleife nötig — die Mehrheit entscheidet.

**Wann einsetzen:**

- Wenn ein M1-/M2-Prüfbericht selbst geprüft werden
  soll (findet der Prüfer echte Fehler oder plausible
  Scheinfehler?)
- Für hoch-strittige Design-Entscheidungen mit einer
  klaren Behauptung, die verifiziert werden soll
- Für einzelne Sicherheits-Befunde, bei denen der
  False-Positive-Preis niedrig ist

**Wann nicht:** für ganze Artefakte — zu teuer und
falsches Werkzeug (M1/M2 sind konstruktiv, M3 ist
destruktiv).

**Modell-Klassen (§5):** N verschiedene
K-SEMANTIK-Prüfer, oder K-STRUKTUR wenn die
Behauptung strukturell ist.

### M4 — Perspektive-Panel (Multi-Lens)

**Zweck:** Multi-Dimensions-Bewertung eines Artefakts.
N Prüfer, jeder mit einer anderen Lens (z.B.
Korrektheit, Sicherheit, Performance, Wartbarkeit,
Kosten, Lizenz). Prüft dasselbe Artefakt aus
unterschiedlichen Blickwinkeln.

**Ablauf:** N parallele Prüfer, jeder mit Lens-
spezifischem Prompt-Zusatz. Ergebnisse werden nach
Lens strukturiert konsolidiert, nicht zu einem
Gesamturteil verschmolzen.

**Wann einsetzen:**

- Technologie-Entscheidungen (P7)
- Architektur-Reviews (P5)
- Deploy-Reviews (P10)
- Alle Artefakte mit vielen orthogonalen
  Bewertungs-Dimensionen

**Wann nicht:** für formal-strukturelle Prüfungen
(dort will man Konvergenz, nicht Divergenz — M1
reicht).

**Modell-Klassen (§5):** je Lens die passende Klasse;
oft K-SEMANTIK für inhaltliche Lenses und K-BREITE
für kreativ-alternative Lenses.

### M5 — Judge Panel (N Vorschläge, dann Auswahl)

**Zweck:** Statt ein Artefakt zu prüfen: **N
unabhängige Vorschläge generieren** lassen, dann
Judges bewerten und synthetisieren.

**Ablauf:** Zwei Phasen — (a) N unabhängige
Vorschlags-Erzeuger mit unterschiedlichen Angeln
(MVP-first, risk-first, user-first, …); (b) M Judges,
die die Vorschläge nach Kriterien scoren; (c)
Synthese aus dem Gewinner plus grafted-in-ideas aus
den Runner-ups.

**Wann einsetzen:**

- Offene Design-Fragen mit mehreren gangbaren Wegen
  („welche Architektur passt?", „welches Datenmodell?")
- Nicht am Ende einer Phase, sondern **statt** einer
  Einzel-Entwicklung

**Wann nicht:** wenn nur ein plausibler Weg existiert
oder das Artefakt schon vorliegt (dann M1/M2).

**Modell-Klassen (§5):** Erzeuger K-BREITE (Vielfalt);
Judges K-URTEIL.

## 4. Muster-Auswahl

Die Wahl des Musters ist eine Anwender-Entscheidung
mit Agent-Vorschlag. Der Agent schlägt vor:

1. **M1 immer** als Basis vor jeder Freigabe.
2. **M2 zusätzlich**, wenn eines der folgenden
   Kriterien zutrifft:
   - Artefakt dient als Grundlage für Weiterarbeit
     durch andere Artefakte oder Menschen
   - Artefakt geht als Dokument nach außen
   - Artefakt ist eine Konsolidierung nach
     Destillations-Prozess
3. **M3 statt M1** für Prüfung eines Prüfberichts
   oder für Verifikation einer einzelnen Behauptung.
4. **M4 statt/zusätzlich zu M1**, wenn das Artefakt
   viele orthogonale Bewertungs-Dimensionen hat.
5. **M5 statt Einzel-Entwicklung**, wenn die
   Design-Frage offen ist und mehrere Wege gangbar sind.

**Erschöpfungs-Reifekriterium (K≥2 in Schleife 4)
wählen** bei Sicherheits-, Compliance- und
Auslieferungs-Reviews. Standard-Reifekriterium (K=1)
sonst.

Die Wahl wird als Absatz in die Freigabe-DEC
aufgenommen („Prüfmuster: M2 mit K=1; Prüfer nach
Klasse K-STRUKTUR: Modell A; Klasse K-URTEIL:
Modell B").

## 5. Modell-Klassen (Agenten-agnostisch)

Das Template ist **agenten-agnostisch** — Prüfer
werden nicht über konkrete Modell-Namen ausgewählt,
sondern über **Modell-Klassen** mit Eigenschaften.
Der Agent liest aus `Tools.md`, welche Modelle in
seiner Runtime verfügbar sind und welche Klassen sie
belegen, und schlägt konkrete Modelle nur beim
Review-Auftrag vor. In Regeln und Anleitungen tauchen
nur Klassen auf, keine Modell-Namen.

**Klassen-Katalog** (erweiterbar):

| Klasse | Bedeutung |
|---|---|
| **K-STRUKTUR** | Stark bei formalen Aspekten — Regel-Konformität, Frontmatter, Verweis-Auflösung, Register-Konsistenz. Für Fileinventur, strukturelle Konsistenz-Checks. |
| **K-LANGKONTEXT** | Gut bei langen Texten und großen Kontextfenstern — kann mehrere große Dateien gleichzeitig überblicken. Für Äußere Konsistenz (Referenz-Abgleich), Cross-File-Konsistenz. |
| **K-SEMANTIK** | Stark bei semantischer Konsistenz und Widerspruchserkennung — versteht Sachlogik, findet inhaltliche Konflikte. Für Innere Konsistenz, Widerspruchs-Reviews, Standard-Prüfprompt. |
| **K-URTEIL** | Stark bei komplexem urteilsbedürftigem Denken — kann als hypothetischer Umsetzer agieren, Annahme-Kandidaten erkennen, Alternativen abwägen. Für Ausführungs-Selbstgenügsamkeit, Judge-Rollen, Design-Bewertungen. |
| **K-BREITE** | Kreative Vielfalt, Alternativen-Generierung — nicht Prüfung, sondern Vorschlag. Für M5 Judge-Panel-Erzeuger, für kreative Lenses in M4. |
| **K-ROBUST** | Zuverlässig bei präziser Reproduktion und mechanischen Aufgaben — kleine Iteration, wenig Halluzination. Für Massen-Iteration bei Erschöpfungs-Reifekriterium, für Refutation-Läufe in M3. |

**Verankerung der Klassen-Zuordnung:** in
`Tools.md`, Kategorie „Sub-Agent-Werkzeuge",
Unter-Sektion „Verfügbare Modelle mit Klassen".
Beispielhaft:

```
## Sub-Agent-Werkzeuge

### Zum Starten eines Sub-Agenten
- <Werkzeug-Name> — <Trade-offs: persistent/flüchtig, sync/async, Sichtbarkeit>

### Zur Kommunikation mit einem laufenden Sub-Agenten
- <Werkzeug-Name> — <Trade-offs>

### Verfügbare Modelle mit Klassen
- <Modell-A> — Klassen: K-STRUKTUR, K-LANGKONTEXT
- <Modell-B> — Klassen: K-SEMANTIK, K-URTEIL
- <Modell-C> — Klassen: K-ROBUST, K-BREITE
```

**Auswahl-Algorithmus des Agenten:** beim Review-
Auftrag ermittelt der Agent aus dem gewählten Muster
(§3) die geforderten Klassen, filtert die verfügbaren
Modelle in `Tools.md` nach diesen Klassen, schlägt dem
Anwender konkrete Prüfer-Paare vor und wartet auf
Entscheidung. Ist eine geforderte Klasse nicht
verfügbar, meldet der Agent nach §1 „Berichten statt
Blockieren" und schlägt eine Ersatz-Klasse mit
Einschränkungs-Vermerk vor.

**Fallback-Regeln (typisch):**

- K-URTEIL nicht verfügbar → K-SEMANTIK mit
  Selbstgenügsamkeits-Warnung
- K-LANGKONTEXT nicht verfügbar → K-SEMANTIK mit
  Datei-Häppchen-Prompt
- K-BREITE nicht verfügbar → mehrere K-SEMANTIK-Läufe
  mit unterschiedlichen Angeln

**Klassen-Katalog-Erweiterung:** Neue Klassen können
per DEC hinzugefügt werden (z.B. K-CODE für Code-
spezifische Prüfungen, K-SPRACHE für Übersetzungs-
Prüfungen). Die Basis-Klassen K-STRUKTUR/K-LANGKONTEXT/
K-SEMANTIK/K-URTEIL/K-BREITE/K-ROBUST decken den
allgemeinen Prüf-Bedarf ab.

## 6. Prozess-Template-eigene Reviewmuster-Ergänzungen

Prozess-Templates (SP-1, RP-1, …) können in ihrer
`Vorgehen-<Prozess>.md` **zusätzliche** Zuordnungen
festlegen — welches Muster an welcher Phase Pflicht
ist, welche Klassen-Anforderungen strenger sind.
Beispiele:

- **RP-1 P4 Spezifizieren:** M2 Pflicht (Spezifikation
  ist Anker); hochwertiger Prüfer (K-URTEIL) für
  Selbstgenügsamkeit; Erschöpfungs-Reifekriterium K=2.
- **RP-1 P8 Ausarbeiten (Implementierung):** M4
  Perspektive-Panel mit Lenses Korrektheit,
  Sicherheit, Testabdeckung; K-SEMANTIK für alle.
- **RP-1 P10 Ausliefern:** M2 Pflicht mit
  Erschöpfungs-Reifekriterium K=3 (Auslieferung
  nach außen).

Ohne prozess-eigene Präzisierung gilt der Basis-
Vorschlag aus §4 (Agent empfiehlt, Anwender entscheidet).

## 7. Bezüge

- Generische Prüf-/Recherche-Basis-Fähigkeit:
  MasterPrompt §5.6 (Standard-Prüfprompt,
  Zwei-Modelle-Regel, Selbst-Triage, Reifekriterium).
- Verweisender Rahmen: `Vorgehen.md` §7 (Prüfprozess,
  Umbau-Review-Pflicht) und §4 (Freigabe-Regel,
  Freigabe-DEC-Format).
- Prüfbericht-Ablage: `wiki/Agent-Berichte.md`
  (Detail-Typ `agent-report`, Präfix `REP-`).
- Fachliche Analysen (Abgrenzung zu Prüfberichten):
  versionierte Dateien in `overview/` (siehe
  `Vorgehen.md` §7).
- Werkzeug-Registrar: `Tools.md` (Kategorie
  „Sub-Agent-Werkzeuge").
- Wiki-Knoten: [[Berichten-statt-Blockieren]].
