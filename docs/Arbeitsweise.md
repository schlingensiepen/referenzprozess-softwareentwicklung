# Arbeitsweise — wie Mensch und Agent zusammenarbeiten

> **Herkunft:** abgeleitet aus `../MasterPrompt.md`
> (Abschnitte 5 bis 9), `../Vorgehen.md` (Abschnitte 1,
> 6, 7, 7b), `../Reviewmuster.md` (Abschnitte 1 bis 4),
> `../Outgoing.md` (Abschnitte 3, 4, 6),
> `../Styleguide.md`, den Anleitungen
> `../migration/MIGRATION.md` (Phase 4) und
> `../upgrade/UPGRADE.md` (Schritt 8) und dem
> vorbereiteten `../wiki/` (`Do-first-mit-Veto.md`,
> `Berichten-statt-Blockieren.md`,
> `Handoff-Prozedur.md`, `Fahrplan-Vorlage.md`,
> `Standarddateien-Katalog.md`, `Kettenpruefung.md`
> Abschnitt „Reviewer-Anteil“,
> `Instruktionsdatei-Pflege.md`). Stand der Quellen:
> Starter-Commit `959026c` (Version 2.0). Dieses
> Dokument ist aus den Quellen abgeleitet und wird bei
> Änderungen der Quellen auf deren Stand nachgezogen
> (zuletzt am 2026-10-28); eigene Inhalte bekommt es
> nicht — Änderungen gehören in die Quellen.

Zurück zur [Einführung](Einfuehrung.md).

## Die Modi des Agenten

Der Agent arbeitet in einem dieser Modi:

- **Standard-Modus.** Bei Unklarheit fragt der Agent
  nach und führt nicht aus. Das gilt besonders für
  inhaltliche Entscheidungen, für Formulierungen in
  Ausgangsdokumenten und für alles mit Außenwirkung.
- **Standardaufgaben.** Mechanisch festgelegte Vorgänge,
  deren Regeln vollständig im Regelwerk stehen, führt
  der Agent **ohne Rückfrage** aus: Wiki-Knoten aus
  eingegangenen Dokumenten anlegen (Ingest), Index und
  Log pflegen, Commits setzen, `Tools.md` nach einer
  Installation nachführen, Berichte von Unteragenten
  und Recherche-Ergebnisse ins Wiki übernehmen, einen
  gewählten Prozess einspielen. Er meldet jeden Schritt
  sichtbar; du kannst per Veto zurücknehmen lassen.
  Diese Befreiung von der Rückfrage gilt nur für die
  Folge-Schritte einer bereits ausgelösten
  Standardaufgabe — sie ist keine Erlaubnis, spontan zu
  handeln. Struktur-Entscheidungen (etwa welche
  Fassaden aktiv sind), register-würdige Entscheidungen,
  dein Terrain (`wiki/Facts.md`, Glossar) und Aufträge
  mit Außenwirkung oder Kosten bleiben immer außen vor:
  dort legt der Agent einen Entwurf vor und wartet.
- **Arbeitsmodus.** Bei großen Mengen (etwa dem ersten
  Einlesen vieler Dokumente) schlägt der Agent vor, in
  den Arbeitsmodus zu wechseln; er gilt nur mit deiner
  Zustimmung. Darin fragt er nicht nach, sondern
  dokumentiert jede Unklarheit in `Offene Fragen.md`
  (Kontext, Frage, was übersprungen wurde, was
  nachzuarbeiten ist), überspringt den betroffenen
  Teilschritt und arbeitet weiter. Am Ende legt er die
  gesammelten Fragen vor. Nur bei **kritischer**
  Unklarheit — wenn ohne Klärung große Teile des
  Ergebnisses falsch würden — verlässt er den Modus von
  selbst. Die Transformation bei einer Migration läuft
  ähnlich, aber nach ihrer eigenen Anleitung: autonom
  bis zur Vorlage der Ergebnisse in der Absicherung —
  deine Prüfung und die Gesamt-Annahme brauchen dich
  —, Ungeklärtes sammelt dort die Auffang-Datei (siehe
  [Migration](Migration.md)).

## Fragen, Fahrplan, Briefing

**Ableitbarkeit vor Rückfrage.** Bevor der Agent fragt,
prüft er, ob die Antwort aus vorhandenen Dateien
hervorgeht. Nur was nicht ableitbar ist (dein Kürzel,
redaktionelle Stolpersteine, eine Auswahl unter
gleichwertigen Optionen), wird gefragt; alles andere
legt er als Entwurf zur Bestätigung vor.

**Reihenfolge nach Vorfestlegung.** Bleiben mehrere
Fragen, kommt die zuerst, deren Antwort am meisten
anderes festlegt. Nach jeder Antwort entfallen die
Folgefragen, die sich erledigt haben.

**Fahrplan vor der Kette.** Bevor der Agent dich durch
zwei oder mehr zusammenhängende Entscheidungen führt,
zeigt er einen Fahrplan: welche Entscheidungen
anstehen, in welcher Reihenfolge, was wovon abhängt,
was er aufzuschieben vorschlägt — ohne Optionen und
Detailempfehlungen. Erst nach deiner Rückmeldung
beginnt die erste Einzel-Vorlage. Der Grund: Wer eine
Kette von Entscheidungen durchläuft, deren Ende er nicht
kennt, entscheidet nicht wirklich frei. Die
Fragen-Blöcke der drei Anleitungen (Projektstart,
Migration, Upgrade) folgen diesem Muster.

**Briefing-Modus.** Stehen etwa drei oder mehr
Klärpunkte an, zeigt der Agent zuerst die Liste und
bietet an, jeden Punkt einzeln zu briefen und zu
diskutieren — weiter geht es erst auf dein „weiter“.
Die Alternative ist die Klärung aller Punkte im Block.
Du kannst jederzeit wechseln; eine dauerhafte Vorliebe
wird als Projekt-Regel im Wiki gebucht.

## Das Ausgabe-Raster

Strukturierte Meldungen des Agenten (Sessionstart,
Zusammenfassungen, Übergabepunkte) haben immer
dieselben strikt getrennten Blöcke:

```
Erledigt:
- …

Aktion (mache ich als Nächstes, sofern kein Veto):
- …

Frage (brauche ich von dir):
- …
```

Fragen stehen nur im Frage-Block; alles Ableitbare
steht als Entwurf im Aktion-Block. Im laufenden Betrieb
sind es höchstens ein bis zwei echte Fragen pro
Meldung. Interne Phasen- oder Paragraphen-Nummern des
Regelwerks nennt der Agent dir gegenüber nicht — du
siehst nur die Substanz.

## Berichten statt Blockieren

Prüf- und Werkzeug-Ergebnisse (Tests, Lint, sonstige
Prüfungen) werden **berichtet**, nicht zur Blockade der
laufenden Arbeit gemacht. Zwischenstände mit rotem
Ergebnis dürfen committet werden; das Ergebnis steht als
Info-Zeile in Bericht oder Commit-Nachricht, damit in
der Historie sichtbar bleibt, was Zwischenstand und was
ein grüner **Meilenstein** war (mit SP-1 der Abschluss
einer Arbeits-Einheit, etwa eines Scaffolding-Schritts,
oder die Freigabe eines Pflicht-Stands einer nicht
abgeschlossenen Marke — kein Zwischenziel, das ist die
Marke). Harte
Blockaden gibt es nur, wo eine Regel sie ausdrücklich
vorsieht — typisch bei Freigaben mit benannter
Vorbedingung. Die Regel befreit nicht von der Meldung:
fehlende Werkzeuge, rote Ergebnisse und Einschränkungen
stehen im Erledigt-Block; über die Weiterarbeit
entscheidest du.

## Wahrheits-Hygiene

Das `wiki/` ist die Quelle der Wahrheit. Daraus folgen
für den Agenten folgende Pflichten:

- **Lese-Pflicht.** Vor jeder Behauptung über eine
  Festlegung und vor jeder Frage an dich schlägt er im
  Wiki nach. Behauptet er eine Festlegung, nennt er
  ihre Register-Nummer — ohne Nummer ist es eine
  Erinnerung, und Erinnerungen werden erst geprüft,
  dann ausgesprochen.
- **Pflege-Pflicht.** Neue Klärungen, Berichte und
  Stände werden im selben Arbeitsschritt abgelegt —
  Berichte vor der Chat-Zusammenfassung, Fassaden im
  Arbeitsrhythmus.

**Doku-Pflicht bei Klärung.** Was du mit dem Agenten
im Gespräch klärst, wandert sofort in eine Datei:
eine neue Projekt-Wahrheit ins
Entscheidungs-Register, eine
Begriffs-Klarstellung als Vorschlag ins Glossar-Review,
ein Hinweis gegen ein hartnäckiges Fehlverständnis des
Agenten — nur auf deine ausdrückliche Anweisung — in
`wiki/Facts.md`. Nicht „das machen wir später“: die
Lücke wächst, und der nächste Agent kann die Klärung
nicht wiederherstellen.

**Wahrheits-Hierarchie.** Das Entscheidungs-Register
trägt die Entscheidungs-Wahrheit, die Fassaden tragen
Status und Sollzustand, eingefrorene Stände und
Berichte sind Nachweis. Alle übrigen Dokumente werden
aus dieser Wahrheit gepflegt — nie umgekehrt.

**Handoff.** Vor jedem Übergabe-Moment — Session-Pause,
deine Aufforderung („Speicherpunkt setzen“), Start
eines Unteragenten, Einspielen, Ergänzen oder Wechseln
eines Prozesses — stellt der Agent den Zustand her, in
dem ein fremder Agent allein aus den Dateien nahtlos
übernehmen könnte: offene Klärungen in Dateien
überführen, Fassaden nachziehen, committen.

## Dein Terrain

- **`wiki/Facts.md`** gehört dir. Der Agent trägt dort
  nur auf ausdrückliche Anweisung ein; fehlt ihm etwas,
  schlägt er es vor. Facts trägt **Kondensat** —
  prominente Klarstellungen, die beim Sessionstart mit
  hoher Priorität gelesen werden und Fehlverständnisse
  des Agenten überschreiben. Keine Verweise auf weitere
  Datenmengen, keine Bilanzen, keine Konfiguration.
  Hier stehen auch die Tag-Konvention des Projekts und
  die Pfade, die das Produkt ausmachen.
- **Glossar.** Begriffe kommen nur über
  `wiki/Glossar Review.md` ins Glossar: Vorschlag (von
  dir oder dem Agenten), Dialog über die Felder
  „Kommentar“ und „Rückmeldung AIG“, deine Freigabe
  mit Datum und Kürzel, dann verschiebt der Agent die
  inhaltlichen Felder nach `wiki/Glossar.md`. Ab der
  Freigabe gilt ein Begriff für alles Neue; ändert sich
  seine Bedeutung, bekommt er einen neuen Namen, der
  alte wird als „Vormals“ geführt.
- **`TODO.md`** sind deine offenen Punkte; der Agent
  liest sie beim Sessionstart und ergänzt nur auf
  Anweisung; als Anweisung zählt auch deine Antwort auf
  seine Frage, wann er nach der Bestätigung einer
  ausgelieferten Behebung fragen soll, und deine Antwort
  „später“ auf das Angebot einer Fassade. Bei einer
  Migration legt der Agent die `TODO.md` neu an und
  verlinkt darin deine vorgefundenen Dateien mit
  offenen Arbeiten.

## git

Der Agent arbeitet aktiv mit git:

- **Ein Commit je Zug.** Ein Zug ist eine thematisch
  abgeschlossene Einheit aus mehreren Arbeitsschritten
  — etwa ein Ingest, eine neue Version in `output/`,
  eine Wiki-Änderung, eine Installation. Züge werden
  nicht gebündelt; keine Leer-Commits. Am Session-Ende
  folgt ein Abschluss-Commit für alles, was noch nicht
  erfasst ist.
- **Präfixe.** Jede Commit-Nachricht beginnt mit einem
  Präfix aus einem festen Katalog (`Ingest:`, `Wiki:`,
  `Output:`, `Report:`, `Setup:`, …); der
  Software-Prozess bringt eigene mit (`Anforderungen:`,
  `Architektur:`, `Code:`, `Scaffolding:`,
  `Freigabe:` …), und das Projekt kann weitere
  deklarieren. Die Sprache der Nachrichten legst du
  beim Start fest.
- **Werkzeug-Kadenz.** Bei Commits mit
  prozess-relevanten Änderungen (bei Software: Code)
  lässt der Agent die in `Tools.md` registrierten
  Prüfwerkzeuge laufen und schreibt das Ergebnis als
  Info-Zeilen in die Commit-Nachricht; rote Ergebnisse
  blockieren nicht.
- **Kein eigenmächtiger Push.** Der Agent pusht nur auf
  Anfrage in bestehende Remotes; neue Remotes richtet
  er nur auf ausdrückliche Anweisung ein.
- **Keine Geheimnisse.** Zugangsdaten, Schlüssel und
  Tokens gehören in keine committete Datei, sondern in
  Umgebungsvariablen oder eine von `.gitignore`
  ausgeschlossene lokale Datei — der Ausschluss wird
  gesichert, bevor der erste Wert hineingeschrieben
  wird. Bei den Sicherungs-Commits von Migration und
  Upgrade lässt der Agent offensichtlich sensible
  Dateien aus und nennt sie dir.

Die Versionsnummern in den Dateinamen von `output/` und
`overview/` dokumentieren fachliche Stände; git
dokumentiert den technischen Verlauf. Beide Ebenen sind
unabhängig.

## Wächter

Zu festen Anlässen prüft der Agent Register und
Zustände und **meldet** Befunde, ohne zu blockieren.
Beim Sessionstart: fehlende oder veraltete Umwandlungen,
Dokumente ohne Wiki-Knoten, abgelaufene Fristen (sie
werden umgetragen und gemeldet), fällig gewordene
aufgeschobene Register-Einträge, überholte Stände,
Dubletten und Status-Drift im Wiki, veraltete Fassaden,
Ordner ohne Freigabe, Commit-Präfixe außerhalb des
Katalogs, Berichte ohne Datei, Freigaben ohne
Prüfbericht, versäumte Handoffs, Serien gleichartiger
Knoten ohne eigene Fassade, offene Recherche-Angebote.
Weitere Anlässe sind deine Anfrage („was ist offen“),
der erste Input an einem neuen Tag und der Abschluss
eines Meilensteins. Bei leerem Befund gibt es keine
Ausgabe.

## Prüfungen und Recherche

Der Agent kann **Prüf-Unteragenten** starten und
**externe Recherche** anbieten. Beides sind Angebote an
dich, keine Automatismen:

- Vor einer Freigabe prüft ein Prüfer die Reife des
  Artefakts. Grundregel: **Prüf-Modell ungleich
  Bau-Modell** — zuerst über ein Werkzeug, das ein
  zweites KI-Modell bereitstellt; sonst der beim Start
  gewählte Ersatzweg (dasselbe Modell in frischem
  Kontext, mit sichtbarer Einschränkung in der
  Freigabe, oder du als Prüfer). Das Standard-Prüfmuster
  setzt dafür zwei unabhängige Prüfer ein. Welche
  Prüfmuster es gibt und wie Runden bis zur Reife
  laufen: unten, „Prüfmuster und Review-Kette“.
- **Umbau-Reviews** sind Pflicht vor der Freigabe
  struktureller Umbauten (Register-Neuordnung,
  Ablösung von Entscheidungen mit inhaltlicher Wirkung):
  Baseline-Commit, Delta-Notiz, Review des
  Unterschieds, Freigabe nur bei grüner **Ampel** (dem
  Gesamturteil des Prüfers: grün, gelb oder rot).
- Berichte von Unteragenten werden unverändert als
  Wiki-Knoten übernommen und im Register
  `wiki/Agent-Berichte.md` geführt; Recherche-Ergebnisse
  ebenso in `wiki/Rechercheartefakte.md` — extern
  beschafftes Wissen ist Nachweis, nicht Wahrheit; ob es
  ins Projekt übernommen wird, entscheidest du.
  Quellen, die der Agent beschafft, archiviert er unter
  `research/`, getrennt von deinen Eingängen in `raw/`.
- Der Agent bietet Reviews von sich aus an: nach einer
  Änderung, vor jeder Veröffentlichung, beim Übertrag
  ins Produkt-Repo. Nach einer
  [Migration](Migration.md), nach einem
  [Upgrade](Upgrade.md) und nach dem Einspielen eines
  Prozesses in ein laufendes Projekt, wenn dabei
  bestehende Einträge migriert werden, läuft ohne
  Angebot ein **Absicherungs-Review in zwei Stufen**:
  zuerst prüfen zwei Agenten maschinell bis zur Reife
  (zwei Modelle, sonst frische Agenten desselben
  Modells als schwächere Absicherung; höchstens drei
  Runden, dann ein Konvergenz-Bericht an dich), danach
  du — wenn das Projekt den Ersatzweg „Anwender als
  Prüfer“ gebucht hat (gewählt beim Projektstart, im
  Fragen-Block der Migration oder beim Upgrade).

## Prüfmuster und Review-Kette

Jedes Review läuft nach festen Regeln, die
`../Reviewmuster.md` im Wortlaut führt:

- **Standard-Prüfprompt.** Jeder Prüfer beantwortet für
  das vorgelegte Artefakt dieselben Fragen: Was leitet
  er daraus als Auftrag ab? Wie würde er konkret
  vorgehen? Welche Widersprüche, Lücken und
  Mehrdeutigkeiten findet er — ausdrücklich ohne
  Probleme zu erfinden? Ein Prozess kann eine vierte,
  fachliche Frage ergänzen. Der Prüfer startet mit
  leerem Kontext, unbelastet von der Erzeugung.
- **Zwei-Modelle-Regel.** Je Prüfrunde prüfen
  mindestens zwei unabhängige Prüfer parallel —
  verschiedene Modelle, je ein frischer Kontext. Fehlt
  ein zweites Modell, gilt der beim Start gewählte
  Ersatzweg (oben), mit Meldung der Einschränkung.
- **Triage.** Der Prüfer stuft jeden Befund selbst ein
  — **E** entscheidungsbedürftig (muss vor der Freigabe
  behandelt werden), **F** Formulierung, **A**
  akzeptabel — und der koordinierende Agent (oder du
  bei Grenzfällen) entscheidet die Einstufung
  abschließend; Abweichungen begründet er.
- **Review-Kette: Prüfen → Einarbeiten → Re-Check.**
  Liefert eine Runde noch E-Befunde, folgt nach dem
  Einarbeiten eine neue Runde mit frischen Prüfern.
  Reif ist ein Artefakt, wenn eine Runde keinen
  E-Befund mehr liefert; bei hohem Risiko (Sicherheit,
  Compliance, Auslieferung an Dritte) erst, wenn zwei
  oder drei Runden in Folge keinen neuen E-Befund
  bringen. Kehrt ein Befund nach dem Einarbeiten
  unverändert wieder, legt der Agent ihn dir sofort
  vor, ohne die dritte Runde abzuwarten. Nach der
  dritten Runde ohne Reife endet die Kette nicht mit
  einer Freigabe, sondern mit einem
  **Konvergenz-Bericht** an dich — mit den
  wiederkehrenden Befunden, der Frage, ob ihre Ursache
  im Artefakt oder in einer Regel liegt, und deinen
  Optionen: eine weitere Runde nach Anpassung, die
  Änderung der Regel oder Entscheidung, eine
  Notfall-Freigabe, den Abbruch oder das Zurückstellen.
  Eine **Notfall-Freigabe** ohne Reife gibt es nur als
  deine Entscheidung danach, gebucht mit der Zusage, sie
  durch einen reifen Stand abzulösen.
- **Muster.** Der Agent schlägt das Muster vor, du
  wählst: der Standard-Prüfprompt mit zwei Modellen ist
  immer die Basis; für Anker-Artefakte (Grundlage für
  Weiterarbeit, Dokumente nach außen) kommt ein
  erweitertes Muster hinzu, das in vier Reviews den
  Bestand des Artefakts (vollständig und wohlgeformt),
  seine innere Stimmigkeit und seine Übereinstimmung
  mit der Grundlage prüft und zuletzt fragt:
  „Könntest du das umsetzen, ohne etwas anzunehmen,
  das nicht im Artefakt steht?“; für die Prüfung eines
  Prüfberichts oder einer einzelnen Behauptung die
  **Gegenprüfung** (Widerlegen zuerst); bei vielen
  unabhängigen Bewertungs-Dimensionen ein
  **Perspektiven-Panel**; bei offenen Design-Fragen ein
  **Richter-Panel** (mehrere Vorschläge, dann Auswahl);
  für Dokumente, die ohne Zugang zum Projekt tragen
  müssen, der **Verständnis-Check** durch einen Leser
  ohne Repo-Zugang. Die gewählten Muster stehen im
  Freigabe-Eintrag.

## Versand

Was an Menschen verschickt wird (Post, Fax, E-Mail),
bekommt einen **Versandstand-Ordner** in `outgoing/`:
je Versand ein Ordner mit Zeitstempel, Adressat und
Benennung, darin das Anschreiben, die daraus erzeugten
Artefakte (PDF, E-Mail, DOCX) und Kopien der
tatsächlich versandten Anlagen. Den Ordner legst du
oder der Agent an; die Artefakte erzeugt der
WorkspaceManager, fehlt er, erzeugt sie der Agent mit
seinen Mitteln. Damit endet der Auftrag des Agenten:
Er sorgt dafür, dass die Quelle stimmt und die
Artefakte bereitliegen — ob, wie und wann tatsächlich
versendet wird, liegt bei dir, außerhalb des
Projekts. Ein Versandstand-Ordner ist ab Erzeugung als
Ganzes unveränderlich und wird nicht versioniert — ein
erneuter Versand ist ein neuer Ordner. Vor jeder
Erzeugung bietet der Agent ohne Ausnahme ein **Review**
des Versandstands an; „ohne Review versenden“ ist
zulässig, wird aber mit benanntem Risiko angeboten und
im Anschreiben als Verzicht vermerkt. Übergaben an
andere Projekte oder Agenten laufen nicht über
`outgoing/`, sondern als Stände in `output/`.
Einzelheiten (Aufbau des Anschreibens, Kanäle, Ablauf)
stehen in `../Outgoing.md`.

## Werkzeuge

**Erweiterungen** des Agenten — je nach Agent heißen
sie MCP-Server (angebundene Werkzeug-Dienste), Skills,
Regeln oder Workflows — installiert der Agent **nicht
eigenmächtig**; er fragt und darf aktiv vorschlagen,
was zum Projekt passt. Jede Installation und jede
Werkzeug-Wahl steht in `Tools.md`, nach Kategorien aus
einer mitgelieferten Kopiervorlage; dort steht auch
der Lint des Starters als Template-Werkzeug, das der
Agent aus `_template/tools/` aufruft.

**Werkzeuge vorschlagen, du wählst.** Braucht ein
Angebot ein Werkzeug, schlägt der Agent verfügbare und
installierbare Werkzeuge vor — und immer eine Variante
**ohne** Werkzeug. Das Regelwerk nennt Produkte nur als
Beispiele; welches Werkzeug dein Projekt nutzt, steht
nur in `Tools.md`. Aufträge mit Außenwirkung, Kosten
oder Kontingent-Verbrauch legt der Agent vorher als
**Auftragsliste** zur Freigabe vor; du kannst einem
Werkzeug eine jederzeit widerrufbare Dauerfreigabe
geben.

## Styleguides

Beim Schreiben hält der Agent die Reihenfolge
`Styleguide-project.md` (dein Projekt), dann
`Styleguide.md` (allgemein), dann der formatspezifische
Styleguide (`Styleguide-md.md` für Dateien, die du
liest, `Styleguide-wiki.md` für Wiki-Knoten) ein. Für
das Gespräch gilt `Styleguide-chat.md`. Der
mitgelieferte `Styleguide.md` setzt Deutsch als
Projektsprache und einen sachlichen, bestimmten Ton;
eine andere Projektsprache legst du in
`Styleguide-project.md` fest, das vorgeht.

## Die Instruktionsdatei

Jeder Agent erzeugt aus dem MasterPrompt seine eigene
Instruktionsdatei (`CLAUDE.md`, `.cursorrules`,
`.windsurfrules`, …) — alle sind abgeleitete Sichten
auf dieselbe Quelle. Sie wird beim Start automatisch
geladen und enthält verbindlich: Projekt-Identifikation,
eiserne Regeln (darunter das Grundgesetz „das `wiki/`
ist die Quelle der Wahrheit“), Verweise ins Regelwerk,
Arbeitsmodi und git-Regeln, Projektsprache,
projektspezifische Besonderheiten und eine automatisch
erzeugte Konfigurations-Übersicht mit Warnhinweis
(Änderungen gehören in die Quellen im Wiki). Ändert
sich der MasterPrompt — etwa nach einem Upgrade —,
zieht jeder Agent nur seine eigene Datei nach.
