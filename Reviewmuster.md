# Reviewmuster

**Bearbeitungsstand: 2026-10-25**

Dieses Dokument beschreibt die **Reviewmuster** des
Templates: wie Prüfungen durch mehrere Sub-Agenten
organisiert werden, welche Muster für welche Artefakte
geeignet sind, wie modell-agnostisch über
**Modell-Klassen** ausgewählt wird und wie die
**Review-Kette** bis zur Reife läuft. Es ist eine
Teildatei des MasterPrompts und gilt zusammen mit den
Regeln aus `MasterPrompt.md`.

Verhältnis zu benachbarten Dokumenten:

- **`Vorgehen.md` §7** verweist auf dieses Dokument
  für die Auswahl des Prüf-Musters.
- **MasterPrompt §5.6** nennt die generische
  Prüf-/Recherche-Fähigkeit und verweist für den
  Ablauf eines Prüflaufs (Standard-Prüfprompt,
  Zwei-Modelle-Regel, Selbst-Triage, Reifekriterium)
  hierher, §2.
- **`wiki/Agent-Berichte.md`** regelt die Ablage der
  Prüfberichte (`wiki/REP-NNN — ….md`, flach im
  `wiki/`-Root) und die
  Header der Berichts-Typen (`review-report` für
  Prüfberichte, `convergence-report` für den
  Konvergenz-Bericht nach §2 Schleife 4).
- **[[Angebots-und-Beauftragungs-Muster]]** nennt die
  Auslöser, zu denen der Agent ein Review anbietet
  (nach Änderung, vor Publikation, beim Übertrag ins
  Produkt), und den Beauftragungs-Rahmen der Prüfer.
- **`Vorgehen.md` §4** definiert die kanonische
  Freigabe-Formel; den Aufbau der Freigabe-DECs, die
  den Prüfbericht als Nachweis aufnehmen, führt
  [[Entscheidungen]] Meta „Freigabe-Einträge“.

## 1. Grundhaltung

**Reviews sind Freigabe-vorbereitend.** Bevor ein
Artefakt „für Zweck Y" freigegeben wird
(`Vorgehen.md` §4), prüft ein Set unabhängiger
Prüfer die Freigabe-Reife.

**Kettenprüfung als Prüfanlass.** Vor der Freigabe
eines Pflicht-Stands der Kette führt ein Review nach
diesem Dokument den Reviewer-Anteil der Kettenprüfung
aus; Ergebnis ist ein `review-report`, auf den die
Freigabe des Stands zeigt. Prüfauftrag: Widerspruch
gegen alle freigegebenen Vorgänger, Abdeckung gegen die
Quell-Stände des Dokumenttyp-Eintrags, Unbegründetes
als **neue Sachaussage** — Darstellung (Anleitungen,
Beispiele, Erklärungen) ist kein Befund. Was geprüft
wird und gegen
welche Vorgänger: [[Kettenpruefung]] §Reviewer-Anteil
— lesen vor jeder solchen Freigabe. Bei den drei
Doku-Ständen der Kette läuft daneben M6 (§3) als
Pflicht.

**Berichten statt Blockieren.** Ein Review, das nicht
alle üblichen Prüfer stellen kann (z.B. nur ein
Modell verfügbar statt zwei), wird trotzdem
durchgeführt — mit expliziter Meldung der Einschränkung
in Prüfbericht und Freigabe-DEC. Der Anwender
entscheidet über Weiterarbeit (siehe
[[Berichten-statt-Blockieren]]).

**Prüfberichte** landen flach im `wiki/`-Root als
`wiki/REP-NNN — ….md` (Detail-Typ
`review-report`, erweitert `agent-report`; Fassade
`wiki/Agent-Berichte.md`, Detail-Knoten-Konventionen;
das Wiki ist flach, Unterordner kennt der Lint
nicht). Der Prüfbericht trägt
neben dem Prüf-Modell (`modell`) das Modell, das die
geprüfte Änderung schrieb (`bau_modell`), die Runde
und die Prüfberichte der vorigen Runde — so bleibt die
Zwei-Modelle-Regel und die Kette prüfbar.
Fachliche Analysen, die keinen Aspekt prüfen, gehören
dagegen nach `overview/` (Vorgehen.md §7,
Abgrenzungs-Kriterium).

## 2. Mechanik jedes Reviews — Vier Schleifen

Jeder einzelne Review-Lauf hat vier ineinander
liegende Wiederholungs-Ebenen. Von innen nach außen:

### Schleife 1 — Fragen-Schleife innerhalb eines Prüfer-Laufs

Der Prüfer beantwortet für das vorgelegte Artefakt
den **Standard-Prüfprompt** — drei feste Fragen plus
optional eine prozess-spezifische vierte (dieser
Abschnitt ist der führende Ort des Wortlauts; ein
Prüf-Auftrag trägt ihn,
[[Angebots-und-Beauftragungs-Muster]]):

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
   „Ist die Funktionsbeschreibung frei von Technologie-
   Vorannahmen?"; Beispiel Ausführungs-
   Selbstgenügsamkeit in §3 M2: „Könntest du das
   umsetzen ohne Annahme?").

Der Prüfer startet mit **frischem Kontextfenster** —
keine Vorbelastung durch die Erzeugungs-Session.

### Schleife 2 — Prüfer-Schleife pro Runde (Zwei-Modelle-Regel)

Pro Prüfrunde laufen **mindestens zwei unabhängige
Prüfer parallel**. „Unabhängig" heißt:

- verschiedene **Modelle** (nicht zweimal dasselbe
  Modell, auch nicht zwei Läufe desselben Modells) —
  Kern der Zwei-Modelle-Regel; bei Menschen zwei
  Personen, die nicht am Text mitgeschrieben haben
- verschiedene **Kontextfenster** (jeder für sich frisch)
- die Standard-Fragen 1–4 sind gesetzt, Prompt-
  Formulierungs-Varianten sind zulässig

**Fallback ohne zweites Modell** (gilt für jede
Prüfung, die Prüf-Modell ≠ Bau-Modell verlangt:
Kettenprüfung vor der Freigabe eines Stands,
Code-Review, diese Prüfer-Schleife):

1. **Erster Weg:** ein zweites Modell über ein
   Werkzeug — Peer-Agent oder externes Modell;
   Werkzeug-Wahl nach Vorgehen.md §7b, dokumentiert in
   `Tools.md` (§Prüf-Werkzeuge).
2. **Ersatzweg, wenn kein Werkzeug verfügbar ist:**
   der beim Init gewählte Weg aus `Tools.md`
   ([[Init-Choreografie]] §Init-Fragen) —
   (a) **Ein-Modell-Weg:** dasselbe Modell prüft in
   frischem Kontext; der `review-report` trägt
   `modell` = `bau_modell` (der Trigger-Hygiene-Wächter
   C7 meldet das, MasterPrompt §5.3), und der
   Freigabe-Eintrag nennt die Einschränkung
   „Prüf-Modell = Bau-Modell“ ([[Entscheidungen]] Meta
   „Freigabe-Einträge“); (b) **Anwender als Prüfer:**
   eine Person, die nicht mitgeschrieben hat, prüft;
   der `review-report` hält ihr Urteil fest und trägt
   `modell: anwender` — C7 meldet nur, wenn `modell`
   und `bau_modell` dasselbe Modell nennen, hier also
   nicht.

In beiden Ersatzwegen (a) und (b) nach §1 „Berichten
statt Blockieren" im Erledigt-Block melden und trotzdem
vorlegen; die Freigabe bleibt Sache des Anwenders.

**Absicherungs-Review nach Upgrade und Migration**
(Upgrade und Migration des Templates nach der Anleitung
des Starters; ein Prozess-Upgrade nach Wiki.md §11.5 B
nur, wenn es bestehende Einträge migriert — ein reines
Hinzufügen eines Prozesses ohne Migration bekommt das
normale Review-Angebot): Upgrade und
Migration erzeugen viel mechanische Kleinarbeit,
deshalb läuft das Absicherungs-Review in zwei Stufen
mit Review-Kette bis zur Reife, Runden-Obergrenze und
Konvergenz-Bericht (Schleife 4).

1. **Stufe 1 — maschinelle Vorprüfung, immer:** zwei
   unabhängige Prüfer verschiedener Modelle, möglichst
   beide ungleich dem ausführenden Modell, das zweite
   Modell über ein Werkzeug (erster Weg oben). Gibt es
   nur ein Modell, prüfen frische Agenten desselben
   Modells in neuem Kontext — ausdrücklich als
   schwächere Absicherung benannt (`modell` =
   `bau_modell`, Meldung wie im Ein-Modell-Weg). Die
   Vorprüfung läuft bis zur Reife, bevor Stufe 2
   beginnt.
2. **Stufe 2 — der Anwender, wenn er Prüfer ist:** Hat
   der Anwender beim Init den Ersatzweg (b) „Anwender
   als Prüfer“ gewählt, prüft er danach das Ergebnis
   der Vorprüfung; sein Urteil hält ein eigener
   `review-report` mit `modell: anwender` fest. Beim
   Ein-Modell-Weg (a) endet das Review mit Stufe 1.

Der Ersatzweg aus `Tools.md` ersetzt die Vorprüfung
also nicht, er folgt ihr nach; den Ablauf im Einzelnen
führt die Upgrade- bzw. Migrations-Anleitung des
Starters; beim Prozess-Upgrade mit Migration läuft es
als Schritt 9 des Ablaufs in Wiki.md §11.5 B (nach dem
Commit).

Modell-Auswahl erfolgt über **Klassen** — siehe §5.

### Schleife 3 — Triage-Schleife (Selbst-Triage E/F/A)

**Der Prüfer schlägt die Einstufung vor, der
Koordinator entscheidet.** Jeder Prüfer stuft seine
Befunde im Prüfbericht selbst ein (Selbst-Triage
E/F/A); nach Vorlage der Prüfberichte triagiert der
**koordinierende Agent** (oder der Anwender bei
Grenzfällen) jeden Befund abschließend:

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

### Schleife 4 — Runden-Schleife (Review-Kette bis zur Reife)

Die **Review-Kette** heißt: **Prüfen → Einarbeiten →
Re-Check**, bis das Reifekriterium erfüllt ist.
Solange eine Prüfrunde noch entscheidungsbedürftige
Befunde liefert, folgt eine weitere Runde: Befunde
einarbeiten, Artefakt aktualisieren → neue Runde
starten (wieder unabhängige Prüfer, wieder frischer
Kontext; der Re-Check-Bericht nennt die Prüfberichte
der vorigen Runde als Vorgänger). **Bei einem Stand**
(abgeleitetes Register-Dokument in `output/`) heißt
„einarbeiten“: Die Befunde gehen in die Elemente im
`wiki/`, der Agent bildet eine neue Version derselben
Ketten-ID, und die neue Runde prüft nur die geänderten
Elemente ([[Lebenslauf-eines-Stands]] Schritt 6,
[[Kettenpruefung]] §Regel). Auf diese Kette
verweisen die Review-Angebote vor Publikation und beim
Übertrag ins Produkt
([[Angebots-und-Beauftragungs-Muster]]) und die
Freigabe abgeleiteter Dokumente. Die Runden-Schleife
kennt **zwei Varianten** der Abbruch-Bedingung:

- **Standard-Reifekriterium (K=1)** — eine Prüfrunde
  liefert keine E-Befunde mehr; F- und A-Befunde
  zählen nicht dagegen. Der Basis-Fall jedes Reviews
  (M1–M4).
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

**Runden-Obergrenze mit Eskalations-Ausgang.** Liefert
die Review-Kette nach der **dritten Runde** weiterhin
entscheidungsbedürftige Befunde, endet sie mit einem
**Konvergenz-Bericht** an den Anwender statt mit einer
Freigabe (Detail-Typ `convergence-report`, schreibt der
Koordinator; Inhalt: die wiederkehrenden Befunde und ob
ihre Ursache im Artefakt oder in einer Regel bzw.
Entscheidung liegt). Ein Befund, der nach Nacharbeit in
gleicher Form wiederkehrt, geht **sofort** an den
Anwender, ohne die dritte Runde abzuwarten. Der
Konvergenz-Bericht endet mit festen
**Handlungsoptionen**:

1. weitere Runde nach Anpassung von Auftrag oder
   Artefakt;
2. Änderung an Regel oder Entscheidung, wenn die
   Ursache dort liegt;
3. Notfall-Freigabe mit Ablöse-Bereitschaft,
   gebucht als Entscheidung mit Verweis auf den
   Konvergenz-Bericht;
4. Abbruch oder Zurückstellen.

Die Obergrenze ist **keine Erlaubnis zur
Notfall-Freigabe** — Ausgang der Kette ist Reife oder
Eskalation.

Reifekriterium ist **nicht optional**. Eine
**Notfall-Freigabe** ohne erfüllte Reife gibt es
**ausschließlich als Entscheidung des Anwenders** nach
Vorlage des Konvergenz-Berichts — nie als Ausweg des
Agenten. Sie wird als „Notfall-Freigabe" mit expliziter
Ablöse-Bereitschaft gebucht: ein reifer Stand löst sie
später per `supersedes:` ab (`Vorgehen.md` §4
„Änderung nach der Freigabe“).

## 3. Muster-Katalog

Folgende etablierte Muster. **M1 ist immer** (Basis-
Absicherung). **M2** für Anker-Artefakte. **M3–M5**
gezielt bei besonderen Risiken oder Fragestellungen.
**M6** für Dokumente, die ohne Repo-Zugang tragen
müssen.

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
**Grundlage für Weiterarbeit** dienen (Funktionsbeschreibungen, Spezifikationen,
Architekturen, Contracts, Deploy-Stände,
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
  Handbücher, Betriebs-Anleitungen)
- Konsolidierte Wahrheiten nach einer Konsolidierung
  (Handoff-Kondensation, Register-Umbau: Register nach
  großen Umbauten, zusammengeführte Wahrheits-Dokumente)

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
- Deploy-Reviews (P13)
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

### M6 — Verständnis-Check (Leser ohne Repo-Zugang)

**Zweck:** Prüfen, ob ein **selbsttragendes Dokument**
(MasterPrompt §9.6: alles, was am Stück an Empfänger
ohne Wiki-Zugang geht — die selbsttragenden
Doku-Stände Entwickler-Doku, Benutzer-Doku und
Betriebs-Anleitung, Release-Notes, Übergabe-Dokument
ohne Lesezugriff) ohne Repo-Zugang trägt. Der Prüfer
spielt
den Zielnutzer: er bekommt nur das Dokument, nicht das
Wiki.

**Ablauf:** Ein Prüfer mit frischem Kontextfenster und
**ohne Lesezugriff auf das Repo** — nur das zu prüfende
Dokument, read-only. Er liefert: (1) Nacherzählung
dessen, was er als Auftrag oder Inhalt versteht, in
eigenen Worten; (2) Durchspiel der beschriebenen
Schritte im Scratchpad, soweit das Dokument Handlungen
beschreibt; (3) Liste der **Rate-Stellen** — wo er ohne
Vorwissen raten müsste — nach Schwere, je mit
Fundstelle und Schärfungs-Vorschlag; (4) Verbots-Check:
sind Verbote und Grenzen klar, begründet, ohne
Fehlbedienungs-Risiko? Jede Rate-Stelle ist eine
Dokument-Lücke. Danach die Review-Kette nach §2
Schleife 4.

**Wann einsetzen:** **Pflicht** vor der Vorlage der
drei Doku-Stände der Kette an den Anwender — über das
ganze Dokument, auch bei Einarbeitung und
Änderungsdokument —, mit der Prüffrage je Typ:
Entwickler-Doku „Kann ein Fremder das Produkt ohne
Rückfrage ändern?“, Benutzer-Doku „Kann ein Fremder
das Produkt ohne Hilfe benutzen?“, Betriebs-Anleitung
„Kann ein Fremder das Produkt ausführen?“; der
M6-Bericht ist Nachweis im Freigabe-Eintrag
([[Entscheidungen]] Meta „Freigabe-Einträge“). Für
übrige selbsttragende Dokumente ein Vorschlag: vor der
Neu-Ableitung schlägt der Agent M6 im Pflicht-Angebot
vor Publikation vor
([[Angebots-und-Beauftragungs-Muster]]); vor jeder
Veröffentlichung eines
Einstiegs (README, Start-Anleitung).

**Wann nicht:** für wiki-verweisende Dokumente — dort
ist ein Leser mit Repo-Zugang vorausgesetzt, und
Wikilinks sind kein Befund.

**Modell-Klassen (§5):** K-URTEIL (hypothetischer
Nutzer); bei Durchspiel mit Skript-Läufen zusätzlich
K-ROBUST.

## 4. Muster-Auswahl

Die Wahl des Musters ist eine Anwender-Entscheidung
mit Agent-Vorschlag. Der Agent schlägt vor:

1. **M1 immer** als Basis vor jeder Freigabe.
2. **M2 zusätzlich**, wenn eines der folgenden
   Kriterien zutrifft:
   - Artefakt dient als Grundlage für Weiterarbeit
     durch andere Artefakte oder Menschen
   - Artefakt geht als Dokument nach außen
   - Artefakt ist eine Konsolidierung nach einem
     Handoff oder Register-Umbau
3. **M3 statt M1** für Prüfung eines Prüfberichts
   oder für Verifikation einer einzelnen Behauptung.
4. **M4 statt/zusätzlich zu M1**, wenn das Artefakt
   viele orthogonale Bewertungs-Dimensionen hat.
5. **M5 statt Einzel-Entwicklung**, wenn die
   Design-Frage offen ist und mehrere Wege gangbar sind.
6. **M6 zusätzlich zu M1**, wenn das Artefakt ein
   selbsttragendes Dokument ist (Neu-Ableitung,
   Einstieg nach außen) — bei den drei Doku-Ständen
   der Kette (Entwickler-Doku, Benutzer-Doku,
   Betriebs-Anleitung) keine Wahl, sondern Pflicht
   (§3 M6).

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

- **RP-1 P4 Beschreiben der Funktion:** M2 Pflicht (Funktionsbeschreibung
  ist Anker); hochwertiger Prüfer (K-URTEIL) für
  Selbstgenügsamkeit; Erschöpfungs-Reifekriterium K=2.
- **RP-1 P9 Ausarbeiten (Implementierung):** M4
  Perspektive-Panel mit Lenses Korrektheit,
  Sicherheit, Testabdeckung; K-SEMANTIK für alle.
- **RP-1 P13 Ausliefern:** M2 Pflicht mit
  Erschöpfungs-Reifekriterium K=3 (Auslieferung
  nach außen).

Ohne prozess-eigene Präzisierung gilt der Basis-
Vorschlag aus §4 (Agent empfiehlt, Anwender entscheidet).

## 7. Bezüge

- Generische Prüf-/Recherche-Fähigkeit:
  MasterPrompt §5.6 (Kurzform mit Verweis auf §2
  hier).
- Verweisender Rahmen: `Vorgehen.md` §7 (Prüfprozess,
  Umbau-Review-Pflicht) und §4 (Freigabe-Regel,
  Freigabe-DEC-Format).
- Prüfbericht-Ablage: `wiki/Agent-Berichte.md`
  (Detail-Typen `review-report` und
  `convergence-report`, beide erweitern
  `agent-report`; Präfix `REP-`).
- Review-Auslöser und Beauftragungs-Rahmen:
  [[Angebots-und-Beauftragungs-Muster]].
- Fachliche Analysen (Abgrenzung zu Prüfberichten):
  versionierte Dateien in `overview/` (siehe
  `Vorgehen.md` §7).
- Werkzeug-Registrar: `Tools.md` (Kategorie
  „Sub-Agent-Werkzeuge").
- Wiki-Knoten: [[Berichten-statt-Blockieren]].
