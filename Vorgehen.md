# Vorgehen

**Stand:** 2026-08-23

Dieses Dokument beschreibt den **Vorgehensrahmen** des
Templates: wie Projekt-Arbeit in Phasen mit Ergebnis-
Artefakten und zweck-gebundenen Freigaben organisiert
ist. Es ist eine Teildatei des MasterPrompts und gilt
zusammen mit den Regeln aus `MasterPrompt.md`. Es ist
bewusst domänen-neutral — jeder Prozess (SP-1, SP-2, …,
RP-1, RP-2, …) bringt seine eigene
`Vorgehen-<Prozess>.md` mit, die die generischen Phasen
für seine Domäne belegt (§8).

## 1. Grundhaltung

**Phasen sind ein Angebot, kein Zwang.** Der Anwender
darf in beliebiger Reihenfolge an Phasen arbeiten —
Konzeption vor Technologie-Auswahl ist naheliegend,
aber es ist nicht verboten, während der Architektur
schon eine Technologie zu erproben, oder den Deploy zu
planen bevor die Implementierung fertig ist. Konsistent
mit [[Berichten-statt-Blockieren]].

**Phasenmodell als gentle guideline und Checkliste.**
Das Modell zwingt zu nichts. Es dient als Checkliste:
der Agent fragt bei jedem Anlass „hast du das schon
bedacht?" — der Anwender antwortet entweder „ja, dort
und dort" (dann legt der Agent das Artefakt mit dem
Verweis ab und quittiert die Phase) oder „nein,
überspringen" (dann wird die Phase als bewusst
ausgelassen markiert) oder „ja, machen wir jetzt". Das
Modell gibt Leitplanken zur Unterstützung, keine Zwänge.

**Freigaben tragen die Verlässlichkeit.** Wer sich in
einem Artefakt auf ein anderes Artefakt verlässt,
prüft die Freigabe für den konkreten Zweck. Fehlt die
Freigabe oder das Grundlage-Artefakt, warnt der Agent —
er blockiert nicht. Der Anwender entscheidet über
Weiterarbeit.

**Fahrplan vor der Kette.** Bevor der Agent eine
mehrstufige Entscheidungs-Sequenz mit dem Anwender startet
(zwei oder mehr zusammenhängende Entscheidungen), legt er
zuerst einen **Fahrplan** vor: welche Entscheidungen
anstehen, in welcher Reihenfolge, was hängt wovon ab,
was schlägt der Agent zum Aufschieben vor — ausdrücklich
**ohne Optionen und Detailempfehlungen**. Erst nach
Anwender-Rückmeldung startet die erste Einzel-Vorlage.
Grund: Entscheidungen durch eine Kette, deren Ende der
Anwender nicht kennt, sind nicht wirklich autonom.
Konkrete Anleitung siehe [[Fahrplan-Vorlage]].

## 2. Zieldefinition (Vorstufe)

Vor den Phasen steht typischerweise eine
**Zieldefinition** — was soll das Projekt insgesamt
erreichen. Sie entsteht meist im Init und materialisiert
sich im `Mission Statement.md` (Basis-Fassade).

Zieldefinition ist keine Phase im Sinne dieses Rahmens
(hat keine Freigabe-Bindung an nachgelagerte Phasen),
sondern der übergreifende Rahmen, unter dem alle Phasen
stehen.

## 3. Phasen (Standard-Belegung, adaptierbar)

Zwölf generische Phasen als Angebot. Jeder Prozess kann
Phasen umbenennen, weglassen oder ergänzen — dies ist
die Basis-Standard-Belegung.

**Aktivitäts-Verb-Konvention:** Phasen und Vorgangs-
Bezeichnungen werden als **Aktivität** ausgedrückt —
Verb im Infinitiv, wenn nötig mit klärendem Substantiv.
Beispiele: „Konzipieren", „Boot entwerfen", „Rakete
starten", „Zerlegen in Bausteine". Nicht als Substantiv-
Zustand („Konzeption", „Entwurf", „Zerlegung"). Grund:
Aktivitäten sagen, was der Anwender oder Agent **tut**;
Substantive lassen offen, ob es das Ergebnis oder die
Handlung meint. Konstruktionsmethodisch etabliertes
Muster; gilt auch für Anleitungs-Titel und Prozess-
Aktivitäts-Beschreibungen jenseits der Phasen-Namen.

**Präfix-Konvention:** Phasen tragen das Präfix **P**
(P1–P12). Der Präfix **F** ist nicht belegt und für
künftige Verwendung frei.

| # | Phase (Aktivität) | Ergebnis-Artefakt |
|---|---|---|
| **P1** | Konzipieren | Konzept-Dokument |
| **P2** | Stand der Technik erfassen | Stand-der-Technik-Bericht |
| **P3** | Anforderungen sammeln | Anforderungs-Register |
| **P4** | Spezifizieren der Funktion | Gesamtspezifikation |
| **P5** | Zerlegen in Bausteine | Architektur-Beschreibung |
| **P6** | Starten von Teilaktivitäten | Teil-Register (Verweise auf Teil-Systeme) |
| **P7** | Auswählen der Technologie | Technologie-Entscheidung(en) |
| **P8** | Ausarbeiten | Ausarbeitungs-Ergebnis (prozess-spezifisch) |
| **P9** | Testen | Testplan · Testbericht |
| **P10** | Ausliefern | Auslieferungsbeschreibung |
| **P11** | Produzieren | Produktions-Plan · Produktions-Beschreibung |
| **P12** | Betreiben | Betriebs-Plan · Betriebs-Beschreibung |

**Ergebnis-Artefakt-Regel:** Wo ein etablierter Name
für das Artefakt existiert (Testplan,
Deploymentbeschreibung, Runbook, …), wird dieser
bevorzugt verwendet. Die generische Doppelstruktur
„Plan + Beschreibung" ist Fallback, wenn kein
etablierter Name existiert.

**Zwei Aktivitäten P3/P4:** Anforderungen sammeln ist
eine eigene Aktivität (Interviews, Werkstattgespräche,
Beobachtungen — Anforderungen entstehen inkrementell);
Spezifizieren der Funktion ist eine andere Aktivität
(den vorliegenden Anforderungs-Bestand zu einem
geschlossenen Spezifikations-Dokument zusammenschreiben).
Der Übergang „jetzt habe ich genug Anforderungen, jetzt
schreibe ich die Spezifikation" ist eine Freigabe des
P3-Artefakts „für Zweck P4 Spezifizieren".

**Rekursion in P6 — Start von Teilaktivitäten.** Das
Teil-Register in P6 verweist auf Teil-Systeme, die
selbst wieder den Vorgehensrahmen anwenden. Jede
Teilaktivität durchläuft die Phasen mit eigenen
Artefakten und eigener Wissens-Struktur (Teil-Wikis
nach Modell B; konkret bei Software:
Komponenten-Repositories als eigene Template-Instanzen).

Beim Start einer Teilaktivität legt der Agent dem
Anwender **drei Entscheidungen** vor und beginnt nicht
eigenständig:

1. **Übernahme-Modus.**
   - **Modus A (rekursiv selbstständig, Standard):**
     Teilaktivität startet bei P1 und arbeitet sich
     durch; Übernahme aus Mutter-SSOT als Aktivität in
     P2/P3 („Stand der Technik für meine Teilaktivität
     übernehmen", „Anforderungen an mich übernehmen");
     eigene Teil-Gesamtspezifikation entsteht in P4
     der Teilaktivität. Diese ist gleichzeitig die
     „Teil-Spezifikation" aus Mutter-Sicht (ein
     Artefakt, zwei Perspektiven). Der Agent empfiehlt
     A für komplexe Teilaktivitäten mit eigenem
     inhaltlichen Anteil oder mit weiterer Rekursions-
     Tiefe.
   - **Modus B (Delegation mit Auftrag):** Mutter
     erstellt die Teil-Spezifikation und übergibt beim
     P6-Start. Teilaktivität startet effektiv bei P5
     mit vorliegender Spezifikation; Mutter-SSOT ist
     Nachschlagewerk für Kontext. Der Agent empfiehlt
     B für klar umrissene Ausführungs-Aufträge oder
     kleine atomare Aufgaben, wo eigene frühe Phasen
     unverhältnismäßig wären.

   Die Modus-Wahl wird als DEC-Freigabe gebucht
   („Teilaktivität X startet in Modus Y, weil Z"),
   damit der Beschluss nachvollziehbar bleibt.

2. **Start-Werkzeug für den Peer-Agenten.** Der Agent
   listet aus seinen **eigenen Runtime-Fähigkeiten**
   (was die Umgebung ihm an Werkzeugen bietet)
   diejenigen auf, die zum Starten eines Peer-Agenten
   geeignet sind. Er nennt sie neutral (was können sie,
   mit welchen Trade-offs — persistent oder flüchtig,
   synchron oder asynchron, mit welcher Anwender-
   Sichtbarkeit), fragt den Anwender, welches
   verwendet werden soll, und wartet auf Entscheidung.
   Was der Agent nicht als Werkzeug in seiner Runtime
   hat, bietet er nicht an — analog zum Muster des
   Prüf- und Rechercheangebots (MasterPrompt §5.6)
   für projekt-registrierte Werkzeuge, aber hier
   bezogen auf die Runtime-Werkzeuge der Agent-Umgebung.

3. **Kommunikations-Werkzeug mit dem Peer-Agenten.**
   Analog getrennt — welche Werkzeuge der Runtime
   stehen für die laufende Kommunikation mit dem
   Peer-Agenten zur Verfügung (persistent oder
   flüchtig, synchron oder asynchron). Der Agent
   listet auf, benennt Trade-offs, Anwender
   entscheidet.

Der Start passiert erst nach diesen drei Freigaben.

## 3a. SSOT-Wächter

Der Agent einer Aktivität, die Teilaktivitäten startet,
bleibt **Wächter seiner SSOT** — die Teilaktivitäten
haben Nur-Lese-Zugriff auf Mutter-Artefakte.
Änderungswünsche einer Teilaktivität (neue Anforderung
entdeckt, Widerspruch zur Mutter-Spezifikation gefunden,
Contract-Anpassung nötig) gehen als **Rücklauf an den
Mutter-Agenten**. Dieser entscheidet, aktualisiert die
Mutter-SSOT, informiert die anderen Teilaktivitäten
über den geänderten Stand.

Die Wächter-Rolle ist Moderator- und Integrations-
Verantwortung — sie liegt bei der Koordinator-Rolle
des Entwicklungs-Projekts. Prozess-eigene
Vorgehen-Dateien präzisieren die Wächter-Rolle für
ihre Domäne (bei Software: Contract-Änderungen mit
Rücklauf-Mechanik, siehe `Vorgehen-RP-1.md`).

## 4. Freigabe-Regel

Jedes Ergebnis-Artefakt kann **null, eine oder mehrere
Freigaben** tragen — jede Freigabe ist an einen Zweck
gebunden.

**Beispiele:**

- Die Gesamtspezifikation (P4-Artefakt) kann freigegeben
  sein „für P5 Zerlegen in Bausteine" (heißt: die
  Architektur darf sie als verlässliche Grundlage
  nehmen), ohne schon „für P10 Ausliefern" freigegeben
  zu sein.
- Die Architektur (P5-Artefakt) kann freigegeben sein
  „für P6 Starten von Teilaktivitäten" (Teil-Systeme
  dürfen ihre eigenen Prozesse starten), ohne schon
  „für P7 Auswählen der Technologie" freigegeben zu
  sein (weil noch offene Fragen).

**Kanonische Freigabe-Formel (DEC-214):** jede
Zweck-Freigabe lautet vollständig „**Stand x von
⟨Artefakt⟩, freigegeben für Zweck Z [zu Marke M]**".
Der Zweck-Katalog sind die P-Phasen in ihren
Tätigkeits-Namen (P4 Spezifizieren, P5 Zerlegen in
Bausteine, P10 Ausliefern, …); freie Zwecke
(Subagenten-Beauftragung, Versand, Anwender-Test)
bleiben zulässig. Die Marken-Koordinate ist implizit:
ungenannt gilt die aktuelle `in-progress`-Zielmarke,
explizit nur bei Abweichung ([[Zielmarken]]).

**Stand-Zwang:** eine Zweck-Freigabe bindet sich
immer an einen **versionierten `output/`-Stand**;
Artefakte mit lebendem Wissens-Kern (Fassaden,
lebende Knoten) erhalten diesen Stand spätestens im
Freigabe-Zug (MasterPrompt §1.5
Zweigleisigkeits-Regel).

**Freigabe-Buchung:** Jede Freigabe wird als
DEC-Eintrag in der kanonischen Formel gebucht.
Freigaben sind unabhängig voneinander — eine Freigabe
„für Zweck A" impliziert nicht Freigabe „für Zweck B".

**Freigabe-Rücknahme:** wenn ein Artefakt sich ändert
(neue Iteration), verlieren bisherige Freigaben ihre
Gültigkeit für die geänderten Teile. Konkrete Regel je
Prozess in Prozess-eigener `Vorgehen-<Prozess>.md`.

**Delegation an den Agenten bei automatisierbaren
Vorbedingungen.** Wenn die Vorbedingungen einer Freigabe
automatisch prüfbar sind (Beispiel: Tests-grün-Zustand,
Lint-frei-Zustand, Schema-Konformität), bietet der Agent
dem Anwender an, die Delegation an sich selbst zu
übernehmen — wenn alle automatisch prüfbaren Nachweise
grün sind, kann der Agent die Freigabe automatisch
buchen. Anwender kann per Standing-Freigabe generell
automatisieren lassen oder pro Freigabe entscheiden.
Die Delegations-Regel ersetzt keine substantielle
inhaltliche Prüfung (die weiterhin durch Prüf-Subagenten
oder Personen erfolgt) — sie automatisiert nur das, was
tatsächlich automatisierbar ist. Prozess-eigene
`Vorgehen-<Prozess>.md`-Dateien präzisieren, welche
Freigaben delegierbar sind und welche substantielle
Prüfung verlangen.

## 5. Wächter-Trigger T4 „Freigabe-Bezugsprüfung"

**Auslöser:** Der Agent bezieht sich beim Bearbeiten
eines Artefakts auf ein Artefakt aus einer anderen
Phase (typisch: P5-Architektur bezieht sich auf P4-
Spezifikation). Zusätzlicher Auslöser: der
**Zielmarken-Wechsel** — beim Wechsel des
`in-progress`-Zeigers prüft ein Subagent gesammelt,
welche Freigaben auf die abgeschlossene Marke zu
fixieren sind (Wechsel-Prozedur, `## Meta` der
Fassade Zielmarken; kein eigener Mechanismus,
sondern diese Bezugsprüfung als gebündelter Lauf).

**Prüfung:** Existiert das Grundlage-Artefakt? Ist es
für den konkreten Zweck freigegeben (Freigabe „für
Phase X" oder „für Zweck X")?

**Reaktion:**

- **Beides ja:** stille Weiterarbeit.
- **Grundlage-Artefakt existiert, aber keine passende
  Freigabe:** Warnung mit Text-Vorlage — „Grundlage-
  Artefakt für Zweck X ist nicht freigegeben. Willst
  du (a) trotzdem weiterarbeiten (explorativ), (b)
  erst die Freigabe erwirken, oder (c) den Bezug
  überdenken?"
- **Grundlage-Artefakt existiert noch nicht:** Warnung
  mit Text-Vorlage — „Grundlage-Artefakt für Phase X
  existiert noch nicht — freigegeben-für-Zweck kann
  nicht geprüft werden. Willst du (a) trotzdem
  weiterarbeiten (explorativ), (b) erst die Grundlage
  anlegen, oder (c) den Bezug überdenken?"

**Nicht ausgelöst:** bei Selbst-Referenz innerhalb
derselben Phase (Iteration ist normal).

T4 ergänzt das bestehende Wächter-Trigger-Modell
(T1/T3 im MasterPrompt, Abschnitt „Wächter-Trigger";
prozess-eigene Trigger wie T2 in den
Prozess-Templates).

## 6. Rechercheprozess

Recherche ist eine generische Fähigkeit (MasterPrompt
§5.6), die primär in **P2 Stand der Technik erfassen**
lebt — das ist die strukturelle Heimat. Recherche kann
aber in jeder Phase ausgelöst werden (z.B. R7 Best
Practices Toolchain in P7 Auswählen der Technologie,
R10 Fehlerbilder in P12 Betreiben).

**Rechercheartefakte** werden als Wiki-Detail-Knoten
in der Basis-Fassade `wiki/Rechercheartefakte.md`
ingested (Präfix `REC-`).

Wo konkret welche R-Themen an welche Phasen gebunden
sind, definiert die Prozess-eigene
`Vorgehen-<Prozess>.md`.

## 7. Prüfprozess

Prüfungen sind eine generische Fähigkeit (MasterPrompt
§5.6). Prüfungen entstehen typischerweise vor
Freigaben — d.h. bevor ein Artefakt „für Zweck X"
freigegeben wird, prüft ein oder mehrere Prüfer
(Sub-Agenten oder Personen) die Freigabe-Reife.

**Prüfberichte** — die einen bestimmten Aspekt eines
Artefakts überprüfen — werden als Wiki-Detail-Knoten
in die Basis-Fassade `wiki/Agent-Berichte.md` ingested
(Detail-Typ `agent-report`, Präfix `REP-`).

**Zur Abgrenzung:** Fachliche Analysen, die eine
Sachverhalts-Darstellung liefern (nicht einen Aspekt
prüfen), bleiben als versionierte Datei in `overview/`
mit `_VV_TLA` (Präfix `Analyse:` oder prozess-
spezifisch). Kriterium: ein Sub-Agent-Ergebnis ist nur
dann ein Prüfbericht, wenn es einen konkreten Aspekt
gegen Kriterien prüft; eine fachliche Darstellung ist
deshalb noch lange kein Prüfbericht.

**Verhältnis zur Delegations-Regel (§4):** Prüfungen,
die substantielles Urteil verlangen (Anforderungs-
Deckung, Widerspruchsfreiheit, semantische Konsistenz),
bleiben Prüf-Subagenten oder Personen vorbehalten.
Automatisch prüfbare Vorbedingungen (Tests grün, Lint
frei, Schema konform) können nach der Delegations-
Regel an den Agenten übertragen werden — sie sind
Vor-Nachweise, keine substantielle Prüfung.

**Wahl des Prüfmusters** — welches Multi-Agent-Muster
für welchen Artefakt-Typ passt (Standard-Prüfprompt,
Trias plus Ausführungs-Selbstgenügsamkeit,
Adversarial Verify, Perspektive-Panel, Judge Panel),
welche Modell-Klassen dafür sinnvoll sind und wann
das Erschöpfungs-Reifekriterium (K≥2 statt K=1)
angebracht ist, regelt `Reviewmuster.md` als eigene
Basis-Wurzel-Datei. Der Agent schlägt beim Review-
Auftrag Muster und Prüfer-Paare vor; der Anwender
entscheidet.

**Umbau-Reviews als Pflicht bei strukturellen Umbauten.**
Wird eine Kaskade, eine DEC-Ablösung mit inhaltlicher
Wirkung, eine Fassaden-Migration, eine Register-
Neuordnung oder eine Rollen-Ebenen-Änderung
angestoßen, ist ein **Umbau-Review**
verpflichtend vor der Umbau-Freigabe. Vier-Schritt-
Mechanik: Baseline-Commit vor Start → Delta-Notiz
während Umbau → Sub-Agent-Review (`git diff <baseline>..HEAD`
gegen Delta-Notiz) → Freigabe nur bei grüner Ampel.
Sichert, dass Umbauten keine stille Substanz-Erosion
verursachen. Details und Klassifikations-Schema
(a')/(b')/(c')/(d') siehe `Reviewmuster.md §3 M2
Achse B`.

Wo konkret welche Prüfungen an welchen Phasen ansitzen,
definiert die Prozess-eigene `Vorgehen-<Prozess>.md`.

## 7a. Scaffolding-Baustein

Ein Prozess-Vorgehen **kann** eine Scaffolding-Phase
definieren: die gebündelte Klärung der Setup-
Entscheidungen eines Projekts, bevor die erste
Fachlogik entsteht. Wenn ein Prozess das tut, gilt der
generische Dreischritt:

1. **Fahrplan** — vor der ersten Vorlage erhält der
   Anwender die Übersicht über die anstehende
   Entscheidungs-Sequenz nach [[Fahrplan-Vorlage]]:
   Reihenfolge, Abhängigkeiten, Aufschub-Vorschläge —
   ohne Optionen oder Detail-Empfehlungen. Der Anwender
   kann streichen, umsortieren, vorziehen, aufschieben.
2. **Vorlagen-Kette** — die Setup-Entscheidungen werden
   in nummerierten **Vorlagen** (V1…Vn) gebündelt
   vorgelegt; jede Vorlage fasst zusammengehörige
   Entscheidungen, die Kette folgt den Abhängigkeiten.
   Welche Vorlagen es gibt und was sie bündeln,
   definiert die Prozess-eigene `Vorgehen-<Prozess>.md`.

   **Zuschnitt-Regel:** Ein Punkt ist eine
   **Entscheidung** — ein Eintrag, der aus der Vorlage
   im Register entsteht; gezählt werden die
   entstehenden Einträge, nicht die angesprochenen
   Themen. Eine Vorlage bündelt Punkte, die man
   sinnvoll **gemeinsam** abwägt, und umfasst
   **höchstens drei bis vier**. **Getrennt** werden
   Punkte, die sich ohne eine andere Entscheidung nicht
   sinnvoll abwägen lassen — der abhängige folgt
   später (Verzeichnisstruktur und Werkzeuge setzen den
   Stack voraus und gehören nicht in dieselbe Vorlage
   wie er). Lose Kopplung ist dagegen **kein**
   Trenn-Grund (eine stackübliche `.gitignore` lässt
   sich schreiben, bevor das Build-Werkzeug im Detail
   feststeht). Die Regel verhindert beide Fehlformen:
   die **Punkt-für-Punkt-Befragung** (jede Entscheidung
   einzeln) und die **Sammelvorlage mit ungeklärten
   Vorentscheidungen** (Abwägung unmöglich, weil die
   Grundlage fehlt).

   **Aufschub-Auslöser-Benennungsregel:** Entsteht ein
   Eintrag bei seiner Entscheidung, kommt aber erst in
   einer späteren Vorlage sinnvoll dran, wird er sofort
   aufgeschoben — und als Auslöser wird die **Vorlage
   benannt, in der er tatsächlich drankommt**, nicht
   die Entscheidung, von der er inhaltlich abhängt
   (für die `.gitignore` also „V5 Werkzeugkette", nicht
   „Entscheidung 3"). Sonst feuert der Auslöser zu früh
   und der Agent greift den Eintrag sofort wieder auf.
   Der Eintrag ruht, bis der Auslöser feuert, und hält
   den Scaffolding-Commit nicht auf.
3. **Scaffolding-Commit** — sobald keine Scaffolding-
   Entscheidung mehr aussteht (jede ist umgesetzt,
   abgeschlossen, aufgeschoben, verworfen oder
   abgelöst), setzt der Agent den Commit mit der
   Marker-Message `Initial project scaffolding`.
   Er markiert den Nullpunkt der **Fachlogik**, nicht
   des Repositories — vorher wird bereits committet
   (Entscheidungen, Register, Dokumente); strikt einer
   pro Repository.

**Vorlagen als dritter Angebots-Typ.** Scaffolding-
Vorlagen (V) stehen strukturell neben den Recherche-
Angeboten (R, §6) und den Prüf-/Review-Mustern (M, §7):
alle drei sind **Angebote, die an Phasen des Vorgehens
hängen**. Die Kataloge bleiben in ihren Wurzel-Dateien
(R: MasterPrompt §5.6 Prüf- und Rechercheangebot,
M: `Reviewmuster.md`, V: Prozess-eigene
`Vorgehen-<Prozess>.md`). Jedes Prozess-Vorgehen führt
die Phasen-Bindung als **eine einheitliche „Angebote
an Phasen"-Tabelle** mit Typ-Spalte R/M/V — nicht als
getrennte Tabellen je Angebots-Typ.

**Zweistufigkeits-Grenze.** Der Scaffolding-Commit
trennt Stufe 1 (schmale, setup-relevante Skizzen vor
dem Commit) von Stufe 2 (systematische Vollerfassung
danach).

Prozesse ohne Setup-Charakter (z.B. reine
Dokumenten-Prozesse) lassen den Baustein weg und
dokumentieren das als Abweichung (§8).

## 8. Prozess-Template-eigene `Vorgehen-<Prozess>.md`

Jedes Prozess-Template (SP-1, SP-2, …, RP-1, RP-2, …)
bringt eine eigene Vorgehen-Datei mit disjunktem
Datei-Namen mit — konkret `Vorgehen-SP-1.md`,
`Vorgehen-RP-1.md` usw. (analog `Knotentypen-Anhang.md`-
Konvention). Die Basis-Datei heißt schlicht
`Vorgehen.md` und lebt im Basisrahmen-Root; die
Prozess-eigenen Dateien haben den Prozess-Kürzel im
Namen. Grund: beim Modell-B-Merge in das Anwender-Wiki
würden gleichnamige Dateien kollidieren. Jede Prozess-
Vorgehen-Datei:

- **verweist** auf diese Basis-Datei für die Grund-
  Regeln,
- **belegt** die Phasen mit prozess-spezifischen Namen
  und Artefakten,
- **bindet** R-Themen (Recherche), S-Punkte
  (Prüfungen) und ggf. Scaffolding-Vorlagen (§7a) an
  konkrete Phasen,
- **präzisiert** ggf. Freigabe-Rücknahme-Regeln und
  Delegations-Kriterien,
- **dokumentiert** Abweichungen (weggelassene Phasen,
  neue Phasen, umbenannte Phasen).

Ein RP adaptiert die Vorgehen-Datei des
zugrundeliegenden SP (aus `extends:`-Beziehung),
präzisiert für seine Domäne.

## 9. Bezüge

- `MasterPrompt.md` — Rahmen aller Teildateien;
  §5.6 Prüf- und Rechercheangebot (generische
  Recherche- und Prüf-Fähigkeit, Standard-Prüfprompt,
  Zwei-Modelle-Regel); Abschnitt „Wächter-Trigger"
  (T1/T3, die T4 ergänzt).
- `Reviewmuster.md` — Multi-Agent-Reviewmuster:
  Vier-Schleifen-Mechanik, Muster-Katalog M1–M5,
  Modell-Klassen, Umbau-Reviews (§3 M2 Achse B).
- `Wiki.md` — Logik des `wiki/`-Layers (Fassaden,
  Detail-Knoten, Ingestion).
- Fassaden im `wiki/`: `wiki/Rechercheartefakte.md`
  (Rechercheartefakte, Präfix `REC-`),
  `wiki/Agent-Berichte.md` (Prüfberichte, Präfix
  `REP-`), `wiki/Entscheidungen.md` (Freigabe-DECs).
- Wiki-Knoten: [[Fahrplan-Vorlage]],
  [[Berichten-statt-Blockieren]].
- Prozess-eigene `Vorgehen-<Prozess>.md` —
  Phasen-Belegung, „Angebote an Phasen"-Tabelle,
  Abweichungen.
