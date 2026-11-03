# Vorgehen

**Bearbeitungsstand: 2026-10-25**

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
ausgelassen markiert — bei einer Phase mit
Pflicht-Stand als Verzichts-Eintrag für die Marke,
[[Entscheidungen]] Meta „Verzichts-Einträge“; was er
in der Kette bewirkt: [[Kettenpruefung]] §Fehlende
und vertretene Glieder) oder „ja, machen wir jetzt".
Fehlt ein früherer Pflicht-Stand ohne solchen
Verzicht — und ist er nicht abgeleitet entfallen oder
durch ein anderes Glied vertreten ([[Kettenpruefung]]
§Fehlende und vertretene Glieder) —, warnt der Agent
bei der nächsten Freigabe und blockiert nicht
([[Kettenpruefung]] §Kette). Das
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

Fünfzehn generische Phasen als Angebot. Jeder Prozess kann
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
(P1–P15). Der Präfix **F** ist nicht belegt und für
künftige Verwendung frei.

| # | Phase (Aktivität) | Ergebnis-Artefakt |
|---|---|---|
| **P1** | Konzipieren | Konzept-Stand aus den Elementen |
| **P2** | Stand der Technik erfassen | Stand-der-Technik-Bericht |
| **P3** | Anforderungen sammeln | Anforderungs-Register |
| **P4** | Beschreiben der Funktion | Funktionsbeschreibung-Stand aus den Elementen |
| **P5** | Zerlegen in Bausteine | Architektur-Stand aus den Elementen |
| **P6** | Starten von Teilaktivitäten | Teil-Register (Verweise auf Teil-Systeme) |
| **P7** | Auswählen der Technologie | Technologie-Entscheidung(en) |
| **P8** | Spezifizieren | Spezifikation (Bauanleitung) |
| **P9** | Ausarbeiten | Ausarbeitungs-Ergebnis (prozess-spezifisch) |
| **P10** | Testen | Testplan · Testbericht |
| **P11** | Dokumentieren für Entwickler | Entwickler-Doku (selbsttragender Stand) |
| **P12** | Dokumentieren für Benutzer | Benutzer-Doku (selbsttragender Stand) |
| **P13** | Ausliefern | Auslieferungsbeschreibung |
| **P14** | Produzieren | Produktions-Plan · Produktions-Beschreibung |
| **P15** | Betreiben | Betriebs-Anleitung je Umgebung (selbsttragender Stand aus der Auslieferungsbeschreibung der Umgebung) |

**Ergebnis-Artefakt-Regel:** Wo ein etablierter Name
für das Artefakt existiert (Testplan,
Deploy-Stand, Runbook, …), wird dieser
bevorzugt verwendet. Die generische Doppelstruktur
„Plan + Beschreibung" ist Fallback, wenn kein
etablierter Name existiert. „Stand aus den
Elementen“ heißt: Der Inhalt einer Phase entsteht als
Elemente eines Registers im `wiki/`, der Stand ist das
daraus abgeleitete Dokument in `output/` — der Stand
ist das Dokument, die Elemente sind sein Inhalt
(Dreiklang, MasterPrompt §1.5; Ablauf vom ersten
Element bis zur Freigabe: [[Lebenslauf-eines-Stands]]).
Ein Stand hat einen von zwei Graden: **wiki-verweisend**
(die Regel; der Leser hat Repo-Zugang) oder
**selbsttragend** (die Doku-Stände P11, P12 und P15:
aus eingefrorenen Quell-Ständen ausformuliert, am Stück
an Leser ohne Wiki-Zugang; Grade: MasterPrompt §9.6).
Die Doku-Phasen liegen **vor** der Auslieferung, damit
die Freigabe-Ordnung sichert, dass die Dokumentation
zur Auslieferung vorliegt; ob und in welcher Form eine
Marke ihre Doku-Stände erhält, entscheidet die
Doku-Abfrage ([[Kettenpruefung]] §Kette).

**Zwei Aktivitäten P3/P4:** Anforderungen sammeln ist
eine eigene Aktivität (Interviews, Werkstattgespräche,
Beobachtungen — Anforderungen entstehen inkrementell);
Beschreiben der Funktion ist eine andere Aktivität
(aus dem vorliegenden Anforderungs-Bestand die
Elemente der Funktionsbeschreibung erarbeiten, aus
denen der Stand gebildet wird).
Der Übergang „jetzt habe ich genug Anforderungen, jetzt
schreibe ich die Funktionsbeschreibung" ist eine Freigabe des
P3-Artefakts „für Zweck P4 Beschreiben der Funktion".

**Rekursion in P6 — Start von Teilaktivitäten.** Das
Teil-Register in P6 verweist auf Teil-Systeme, die
selbst wieder den Vorgehensrahmen anwenden. Jede
Teilaktivität durchläuft die Phasen mit eigenen
Artefakten und eigener Wissens-Struktur (ein eigenes
Wiki je Teilaktivität; konkret bei Software:
Komponenten-Repositories als eigene Template-Instanzen).

Beim Start einer Teilaktivität legt der Agent dem
Anwender **zwei Entscheidungen** vor und beginnt nicht
eigenständig:

1. **Übernahme-Art.**
   - **selbstständig (rekursiv):** Die
     Teilaktivität beginnt ihre eigene Kette und legt
     eigene Anforderungen an, die auf die
     Funktionsbeschreibung der Mutter verweisen. Ihre
     Funktionsbeschreibung entsteht in ihrem P4 und
     ist zugleich die „Teil-Funktionsbeschreibung“ aus
     Mutter-Sicht (ein Artefakt, zwei Perspektiven).
     Geeignet für komplexe Teilaktivitäten mit eigenem
     inhaltlichen Anteil oder weiterer Rekursions-Tiefe.
   - **Auftrag (Delegation):** Die Mutter beschreibt
     die Funktion der Teilaktivität und übergibt sie
     beim P6-Start; die Teilaktivität beginnt mit dem
     Zerlegen (P5), die Mutter-SSOT ist Nachschlagewerk
     für Kontext. Geeignet für klar umrissene
     Ausführungs-Aufträge oder kleine atomare Aufgaben,
     bei denen eigene frühe Phasen unverhältnismäßig
     wären.

   Was die Übergabe der Mutter in der Kette der
   Teilaktivität je Art ersetzt oder vertritt:
   [[Kettenpruefung]] §Komponenten-Kette nach
   Übernahme-Art — lesen, bevor die Art vorgeschlagen
   wird. Der Agent schlägt eine Art vor und benennt
   die grundsätzliche Funktion beider Arten sowie ihre
   Vor- und Nachteile in der konkreten Situation; der
   Anwender entscheidet. Die Wahl wird als DEC gebucht
   („Teilaktivität X startet als selbstständig bzw.
   Auftrag, weil Z“) und steht in der Start-Tabelle
   (unten) und im Startprompt der Teilaktivität.

2. **Start und Transport.** Wie der Peer-Agent der
   Teilaktivität gestartet wird und wie Nachrichten
   zwischen den Repos laufen (§3a), wählt der Anwender
   — hier beim Start; die Teilaktivität erhält die Wahl
   mit dem Startprompt. Zwei gleichwertige Varianten:
   - **(a) Peer-Werkzeug:** Empfohlen ist
     `schlingensiepen/peeragent` für den Start mit
     `schlingensiepen/simple-a2a` oder
     `schlingensiepen/skill-a2a` für den Transport;
     zugestellt wird der unveränderte Inhalt der
     Nachrichten-Datei.
   - **(b) Datei-Variante** ohne Werkzeug: Der
     Empfänger liest die Nachricht beim Absender; den
     Anstoß gibt der Anwender oder der
     Nachrichten-Wächter (MasterPrompt §5.3 C8 — was
     er prüft und zu welchen Anlässen er läuft).

   Beide Varianten sind gleichwertig; worin sie sich
   in der Handhabung unterscheiden (persistent oder
   flüchtig, synchron oder asynchron, Sichtbarkeit für
   den Anwender), kann der Agent zur Erläuterung
   nennen.
   Format und Buchung der Nachrichten sind in beiden
   Varianten gleich. Die Empfehlung (a) ist die
   Ausnahme zur werkzeug-agnostischen Werkzeug-Wahl;
   Vorschlag, Wahl und Ort der Wahl in `Tools.md`
   (Kategorie „Peer-Agenten: Start und Transport“, auch
   in der Teilaktivität): §7b.

**Start-Tabelle.** Bevor eine Teilaktivität ein
eigenes Repo erhält, legt der Agent beide
Entscheidungen in einer Tabelle zur Freigabe vor — je
Teilaktivität: Name, Repo-Name, lokaler Pfad, Remote,
Übernahme-Art, Start und Transport. Vorschlagswerte:
Repo-Name `<projekt>-<komponente>`, Ablage als
Nachbarverzeichnis (`../<projekt>-<komponente>`),
Remote nach bekanntem Hoster; der Anwender kann jeden
Wert ändern. Der Repo-Name ist der Qualifizierer in
Verweisen über Repo-Grenzen (§3a); Repo-Name, Pfad und
Remote stehen als Lage in §Komponenten der
Architektur-Fassade (mit SP-1 `Systemarchitektur.md`;
mit RP-1 präzisiert `Vorgehen-RP-1.md` §2 Anmerkung
P6). Aus der freigegebenen Tabelle und dem
freigegebenen Übergabe-Stand entsteht der Startprompt
der Teilaktivität ([[Init-Choreografie]] §Init mit
Startprompt (Komponente)). Die Tabelle gilt in jedem
Prozess, der P6 kennt — auch mit SP-1 allein.

Der Start passiert erst nach diesen Freigaben.

## 3a. Verbund: Schreiben, Nachrichten, Buchen

Gilt, sobald Teilaktivitäten in eigenen Repos laufen
(die Mutter ist der Koordinator, die Teilaktivität
eine Komponente).

**Schreibgrundsatz.** Jedes Repo schreibt nur sein
eigener Agent; Lesen beim Nachbarn ist erlaubt, in
beide Richtungen. Rückmeldungen, Befunde, Rückläufe
und Lieferungen laufen als **Nachricht** — eine Datei
im Repo des Absenders (`output/nachrichten/`,
MasterPrompt §1.5). Felder, Quittung und die Buchung
mit `quelle:`: [[Katalog-message]] — lesen vor der
ersten Nachricht und vor jeder Buchung aus einer
Nachricht. Der Empfänger bucht in seine eigenen
Register:

- ein vereinbarter Contract → Contract-Index des
  Koordinators (mit SP-1),
- Lieferung und Marken-Abschluss → Marken-Eintrag
  ([[Zielmarken]], Abschnitt „Zuliefernde
  Komponenten“),
- Befund oder Änderungswunsch → Sammel-Register
  (Anforderungen, Fehlermeldungen oder [[Ideen]]).

**Leitsatz des Koordinators.** Der Koordinator bucht
aus Nachrichten der Komponenten nur, was er für einen
eigenen Stand oder seine Freigabe-Ordnung braucht
([[Kettenpruefung]] §Freigabe-Ordnung des
Koordinators); alles andere liest er beim Nachbarn.
Zwei Buchungsformen: das **Element** (Contract) und
die **Zeile am Marken-Eintrag** (Lieferung,
Marken-Abschluss). Nicht ins Wiki des Koordinators
gehören Zwischenstände, Entscheidungen,
Spezifikationen, Testpläne, Testberichte und
Fehlermeldungen der Komponenten, Quittungen und Kopien
von Nachrichten.

**Änderungswünsche** gehen als Nachricht an das Repo,
das den Gegenstand verantwortet; dort wird
entschieden. Für einen Contract ist das der Provider
— er entscheidet innerhalb der freigegebenen
Grundlagen, im Streitfall der Anwender (mit RP-1:
`Vorgehen-RP-1.md` §9). Für die Grundlagen der Mutter
(Funktionsbeschreibung, Zuschnitt, Übergabe) ist es
der Koordinator; ändert er sie, meldet er den
betroffenen Komponenten einen Rücklauf
([[Kettenpruefung]] §Komponenten-Kette nach
Übernahme-Art).

**Meldepflicht der Komponente.** Eine Lieferung ist
immer eine Nachricht. Je Marke meldet die Komponente
dem Koordinator zweimal, jeweils mit der Erwartung
einer Buchung:

- **Lieferung** — der Tag der Implementierung (P9),
  mit Verweisen auf die freigegebenen Stände, die der
  Koordinator zum Einbau braucht;
- **Marken-Abschluss** — ihr Abschluss-Stand.

Ist ihr Produkt seit dem Tag der Vormarke unverändert
und der Tag übernommen ([[Kettenpruefung]] §Kette,
Übernahme des Tags und der Lieferung), entfällt eine
neue Lieferung: die Komponente meldet die Übernahme
mit ihrem Marken-Abschluss, und der Koordinator bucht
den alten Tag als übernommene Lieferung seiner
Folge-Marke ([[Zielmarken]], Abschnitt „Zuliefernde
Komponenten“).

Die Marke des Koordinators nennt die Meldung nur, wenn
sie nicht aus der Marke der Komponente folgt (am
Marken-Eintrag der Komponente steht sie als
`fuer_marke:`, [[Zielmarken]]). Das Lesen ihrer Stände
ist nur die Prüfung. Weitere Nachrichten sind frei und
werden nicht gebucht.

**Start einer Folge-Marke.** Wechselt der Koordinator
auf eine neue Marke ([[Zielmarken]] §Meta
„Marken-Wechsel-Prozedur“, Schritt 5), nennt er den
Komponenten, deren
Übergabe-Stand für sie weitergilt, die Marke per
Nachricht (ein neuer Übergabe-Stand trägt sie in
seiner `marke`); die Komponente setzt daraus
`fuer_marke:` bei Anlage ihrer Marke ([[Zielmarken]],
Abschnitt „Zuliefernde Komponenten“).

**Rekursion.** Die Regeln gelten je Ebene: Zerlegt eine
Komponente weiter, ist sie für ihre Unter-Komponenten
Koordinator und bleibt nach oben Komponente; sie
liefert nur Tag und Abschluss-Stand (ohne eigene Bauteile an
Stelle des Tags den Verweis auf ihre
Zielmarken-Fassade mit der Marke im Text; Doppelrolle,
Format und Folge-Marke: [[Kettenpruefung]]
§Komponenten-Kette nach Übernahme-Art,
Zwischen-Koordinator). Eine Schnittstelle zwischen
zwei Zweigen (Unter-Komponenten von K1 und K2) liegt
bei der Ebene, die beide kennt; Provider ist dort K1,
und K1 reicht sie per Übergabe weiter.

Die Integrations-Verantwortung liegt bei der
Koordinator-Rolle. Prozess-eigene Vorgehen-Dateien
präzisieren sie für ihre Domäne (bei Software:
Aushandlung der Contracts und Rücklauf-Mechanik,
siehe `Vorgehen-RP-1.md`).

## 4. Freigabe-Regel

Jedes Ergebnis-Artefakt kann **null, eine oder mehrere
Freigaben** tragen — jede Freigabe ist an einen Zweck
gebunden.

**Kernsatz: Eine Freigabe hängt immer an einem
Stand.** Freigegeben wird „Stand X für Zweck Y“ —
immer ein **Stand** des Artefakts, nie die lebende
Fassade und nie ein einzelnes Element. Mit dieser
Freigabe frieren alle Elemente ein, auf die der Stand
verweist — was bis dahin `offen` war, nimmt der Agent
im Freigabe-Zug an; bis dahin leben diese Elemente im
`wiki/`. Der Stand ist damit der einzige übergreifende
Einfrier-Mechanismus und der einzige Ort, an dem eine
Zweck-Freigabe „von … für …“ festgemacht wird. Die
einzige Zweck-Freigabe ohne Stand ist der Tag der
Implementierung („Freigabe per Tag“, unten): Ein Tag
friert selbst ein wie ein Stand und gehört zum Code,
nicht zum `wiki/`.

**Annahme und Freigabe:** Einzelne Elemente kann der
Anwender vorher **annehmen** („ja, so“) — das ist das
Element-OK, und das Element friert damit ein. Eine
**Freigabe für einen Zweck** gibt es nur am Stand. Die
Begriffe bleiben getrennt: Annahme = Element-OK,
Freigabe = Zweck. Zwei weitere Vorgänge heißen
„Freigabe“, sind aber keine Zweck-Freigabe: die
**Ordner-Freigabe** beim Init (MasterPrompt §1.1) ist
eine Erlaubnis, gebucht als Entscheidung ohne Formel;
die **Freigabe eines Contracts** durch Anwender oder
Provider ([[Katalog]], Eintrag `contract`) ist die
Annahme eines Elements durch die zuständige Stelle.
Beide behalten ihren Namen. Der Ablauf vom ersten
Element bis nach der Freigabe eines Stands:
[[Lebenslauf-eines-Stands]] — lesen, sobald in einer
Phase das erste Element entsteht.

**Beispiele:**

- Ein Stand der Gesamt-Funktionsbeschreibung
  (P4-Artefakt) kann freigegeben sein „für P5 Zerlegen
  in Bausteine" (heißt: die Architektur darf ihn als
  verlässliche Grundlage nehmen), ohne schon „für P13
  Ausliefern" freigegeben zu sein.
- Ein Stand der Architektur (P5-Artefakt) wird „für
  P6/P7" freigegeben (Teil-Systeme dürfen ihre eigenen
  Prozesse starten, die Technologie-Auswahl darf ihn
  als Grundlage nehmen); der Übergabe-Stand an eine
  Komponente K trägt eine eigene Freigabe „für den
  Start von K".

**Kanonische Freigabe-Formel:** jede
Zweck-Freigabe lautet vollständig „**Stand x von
⟨Artefakt⟩, freigegeben für Zweck Z [zu Marke M]**";
x ist die Version `VV_TLA` ohne den führenden
Unterstrich des Dateinamens (`01_ABC` für
`…_01_ABC.md`) — in der Nachtragszeile eines
Deploy-Stands oder eines Doku-Stands steht an ihrer
Stelle die Stand-Datei
mit Version ([[Zielmarken]] §Meta „Nachtrag“) —,
⟨Artefakt⟩ der Dokumenttyp — als
Dokumentname des Stands, als Typ-Kennung oder als Name
seines Katalog-Eintrags. Beispiel: „Stand 01_ABC von
Spezifikation, freigegeben für P9 Ausarbeiten zu
Marke 1.0“. Die Formel wird wörtlich eingehalten:
sie ist das Kennzeichen, an dem der Lint
Freigabe-Einträge erkennt ([[Entscheidungen]] Meta
„Freigabe-Einträge“). Das Wort „Zweck“ darf dabei
entfallen („freigegeben für P5 Zerlegen in
Bausteine“); der Tätigkeits-Name gehört zur
kanonischen Form, sein Fehlen ist kein Fehler. Wie
der Lint die Formel liest und was er bei einer
Abweichung meldet: [[Kettenpruefung]] §Lint-Anteil.
Beim Tag der Implementierung (Glied P9, Freigabe per
Tag) steht an Stelle der Version der Tag-Name und an
Stelle des Dokumenttyps „Implementierung“ (Wortlaut
unter „Freigabe per Tag“ unten); welche Nachweise der
Eintrag dann nennt: [[Entscheidungen]] Meta
„Freigabe-Einträge“.
Der Zweck-Katalog sind die P-Phasen in ihren
Tätigkeits-Namen (P4 Beschreiben der Funktion, P5 Zerlegen in
Bausteine, P8 Spezifizieren, P9 Ausarbeiten, P10 Testen,
P13 Ausliefern, P15 Betreiben, …); wo ein Stand zwei Phasen zugleich
trägt, nennt der Zweck beide („für P2/P3", „für
P6/P7"); die Übergabe an eine Komponente K trägt „für
den Start von K"; der Abschluss-Stand „für den
Marken-Abschluss". Welchen Zweck ein Pflicht-Stand
trägt, steht in seinem Dokumenttyp-Eintrag im
[[Katalog]]. Freie Zwecke
(Subagenten-Beauftragung, Versand, Anwender-Test)
bleiben zulässig. Die Marke einer Freigabe mit
Stand-Datei trägt der Stand in seinem Kopf (`marke`,
[[Einfrieren-und-Abloesen]] §Stand); der Zusatz „zu
Marke M“ wiederholt sie nur und steht bei der Buchung,
wenn sie nicht die `in-progress`-Marke ist, so dass ein
älterer Eintrag auch nach einem Marken-Wechsel
eindeutig bleibt ([[Kettenpruefung]] §Regel). **Eine
Freigabe ohne Stand-Datei nennt die Marke immer** („zu
Marke M“) — die Freigabe per Tag (unten) wie jede
andere Freigabe, die nicht auf einen Stand in `output/`
zeigt: ohne Stand-Datei ist der Eintrag die einzige
Quelle ihrer Marke, eine ungenannte Marke gibt es bei
Freigaben nicht ([[Zielmarken]] §Meta „Freigaben“; der
Lint meldet eine Freigabe ohne Stand-Datei und ohne
Marke als Fehler).

**Freigabe per Tag (Glied P9):** Der Freigabe-Eintrag
lautet „**Stand <Tag-Name> von Implementierung,
freigegeben für P10 Testen zu Marke M**“ — ⟨Artefakt⟩
ist „Implementierung“ (das Glied P9), der Zweck P10;
daran erkennt der Lint den Tag, ein anderer Eintrag
mit einem Wert ohne Versions-Muster ist keine
Tag-Freigabe; in einem Projekt ohne Prozess entfällt
diese Freigabe, der Abschluss-Stand führt und
bestätigt den Tag ([[Kettenpruefung]] §Kette, Projekt
ohne Prozess). Der Zusatz „zu Marke M“ steht hier
**immer**: eine Tag-Freigabe hat keine Stand-Datei,
aus deren Kopf die Marke zu lesen wäre (oben). Der
Tag-Name folgt
einer Projekt-Konvention, die in `wiki/Facts.md`
§Allgemeine Fakten steht — daneben die Pfade des
Produkts, an denen „unverändert“ für die Übernahme
des Tags gemessen wird ([[Kettenpruefung]] §Kette);
der Agent fragt beides vor dem ersten Tag ab, wenn es
fehlt. Der Tag-Name ist nicht die
Marken-Bezeichnung. Den Tag setzt der Agent nach
dem OK des Anwenders im Repo, das das Produkt trägt
— in jedem Projekt, auch ohne Code (Begriff Produkt:
[[Glossar]]; [[Kettenpruefung]] §Kette); gepusht wird
nur auf Anfrage (MasterPrompt §6.4). Ein gesetzter Tag wird nie
verschoben oder gelöscht: eine Korrektur ist ein neuer
Tag mit neuer Freigabe, die alte Freigabe wird
abgelöst — ohne Prozess gibt es keine Tag-Freigabe,
dort führt der Abschluss-Stand den neuen Tag als neue
Version (vor seiner Freigabe ohne abzulösende Freigabe,
nach ihr mit erneuter Freigabe); nach dem
Marken-Wechsel prüft der Agent — mit und ohne Prozess —
die Pfade des Produkts
zwischen altem und neuem Tag: bei gleichem Inhalt setzt
er den neuen Tag nach dem OK des Anwenders und bucht am
Marken-Eintrag den Nachtrag „Tag korrigiert“ (mit
Prozess enthält der Nachtrag die neue Tag-Freigabe zu
derselben Marke in der Formel oben — der Nachtrag ist
ihr Träger, einen eigenen Freigabe-Eintrag gibt es
nach dem Wechsel nicht; die alte
Tag-Freigabe bleibt stehen und wird nicht abgelöst, der
Lint liest die Freigabe im Nachtrag), bei
anderem Inhalt gehört die Korrektur in eine Patch-Marke
([[Kettenpruefung]] §Kette, Tag-Korrektur ohne Prozess
und mit Prozess nach dem Wechsel; Format des Nachtrags:
[[Zielmarken]] §Meta
„Nachtrag“). **Patch-Marke bei laufender Folge-Marke:**
Läuft die nächste Marke schon, zieht der Agent die
Patch-Marke als Zwischenmarke vor und stellt die
laufende Marke zurück — vorher kündigt er dem Anwender
an, dass die laufende Marke ruht, dass neue Elemente
bis zum Wechsel der Zwischenmarke deren Marke in
`zielmarke:` erhalten, dass jede Freigabe ohne
Stand-Datei ihre Marke ausdrücklich nennt und Stände
ihre Marke im Kopf tragen, dass Arbeit an der
zurückgestellten Marke diese ausdrücklich nennt
(Elemente mit `zielmarke: 2.1`, Freigaben „zu Marke
2.1“), dass die Arbeit am Produkt auf einem eigenen
Zweig ab dem Tag der Vormarke läuft (Zweig-Konvention
in `wiki/Facts.md` neben der Tag-Konvention, vor der
ersten Zwischenmarke abgefragt; der Tag der
Zwischenmarke sitzt auf dem Zweig) und dass er danach
zu ihr zurückkehrt; bei größeren
Anpassungswünschen fragt er, ob die Arbeit nicht
besser auf dem Planweg in der laufenden Marke
weitergeht; und er fragt ausdrücklich, ob die
Zwischenmarke Vorgänger der zurückgestellten Marke
oder Sackgasse ist, und nennt die Folgen beider Fälle
(ein Vorgänger-Zweig wird bei der Rückkehr
zurückgeführt, ein Sackgassen-Zweig bleibt stehen);
erst nach dem OK des Anwenders legt er sie an. Die
Antwort darf der Anwender ändern, bis in der
Zwischenmarke zum ersten Mal abgelöst oder überlagert
wird; danach ist sie fest. Eine zweite Korrektur
gleicher Art nimmt der Agent mit derselben Ankündigung
in dieselbe Zwischenmarke auf, eine andere Art folgt
als eigene Zwischenmarke nach dem Abschluss der ersten
— die zurückgestellte Marke kehrt erst nach der
letzten zurück. In
Fällen, die diese Regeln nicht abdecken, fragt er den
Anwender. In einer Sackgasse löst er kein Element ab,
das außerhalb gilt, sondern überlagert es nur für die
Sackgasse (`ueberlagert:`); trifft eine Überlagerung
einen schon freigegebenen oder übernommenen Stand,
fragt er, ob eine neue Version entsteht oder der Stand
bleibt; und bevor die Sackgasse abgeschlossen ist, legt
er ihre Inhalte vor und fragt, ob Teile davon in die
reguläre Linie übernommen werden — Übernahme statt
Umhängen, das übernommene Element löst ab, was in der
zurückgestellten Marke gerade gilt. Bei der Rückkehr
aus einem Vorgänger legt er jedes Element vor, das
zwei für die zurückgestellte Marke geltende Nachfolger
hat, und der Anwender wählt (Fälle, Folgen,
Überlagerung, Rückfragen, doppelte Nachfolger und
Rückkehr: [[Zielmarken]] §Meta „Zwischenmarke“ — lesen,
bevor eine Zwischenmarke angelegt wird). Liegen Werkstatt und Produkt in zwei Repos,
nennt `herkunft` den Tag als `<produkt-repo>/<tag>`
([[Einfrieren-und-Abloesen]] §Stand). Vorbedingungen
des Tags: [[Kettenpruefung]] §Code-Glieder. Mit dem
gesetzten Tag legt der Agent die Doku-Abfrage vor,
wenn der Prozess Doku-Glieder führt (mit SP-1 die
Phasen P11, P12, P15; [[Kettenpruefung]] §Kette,
Doku-Abfrage).

**Stand-Zwang:** eine Zweck-Freigabe bindet sich
immer an einen **versionierten `output/`-Stand**;
Artefakte mit lebendem Wissens-Kern (Fassaden,
lebende Knoten) erhalten diesen Stand spätestens im
Freigabe-Zug. **Die Vorlage an den Anwender ist
dieser Stand** — Entwurfs-Dokumente neben dem Stand
gibt es nicht, weder im Scratch noch als eigene
Versionskette; was der Anwender vor der Bildung liest,
sind die Elemente im `wiki/` über die Register-Fassade
als Lese-Klammer. Eine Korrektur zwischen Vorlage und
Freigabe geht in die Elemente, der Agent bildet eine
neue Version derselben Ketten-ID, die vorige bleibt
ohne Freigabe liegen, die Freigabe trifft die jüngste.
Wie aus Fassade und Elementen ein Stand
wird (Dreiklang, Herkunftszeile, Kopien):
[[Einfrieren-und-Abloesen]] §Stand — lesen vor der
Bildung eines Stands; der Ablauf im Ganzen:
[[Lebenslauf-eines-Stands]]; Ablage in `output/`:
MasterPrompt §1.5.

**Kettenprüfung vor der Freigabe eines Pflicht-Stands:**
die Freigabe eines Pflicht-Stands der Kette setzt die
Kettenprüfung voraus; sie läuft **vor der Vorlage** an
den Anwender, der den Prüfbericht mit dem Stand
erhält, und nach einer Korrektur als neue Runde nur
über die geänderten Elemente. Regel, Ordnung der
Freigaben
(Warnung bei fehlendem Vorgänger, harte Tag-Bedingung
des Testplan-Stands), Lint- und Reviewer-Anteil:
[[Kettenpruefung]] — lesen vor jeder solchen
Freigabe. Den Prüfer stellt zuerst ein zweites Modell
über ein Werkzeug (Werkzeug-Wahl §7b, `Tools.md`);
ohne Werkzeug gilt der beim Init gewählte Ersatzweg
aus `Tools.md` (`Reviewmuster.md` §2 Schleife 2).

**Freigabe-Buchung:** Jede Freigabe wird als
DEC-Eintrag in der kanonischen Formel gebucht; sein
Pflichtfeld `zielmarke:` trägt die Marke der Freigabe
(die aus dem Kopf des Stands bzw. aus „zu Marke M“),
nicht ohne Weiteres die beim Buchen laufende Marke;
eine erneute Freigabe desselben Gegenstands ist ein
neuer Eintrag, der den früheren ablöst — Ausnahme:
Freigaben im Nachtrag zu einer abgeschlossenen Marke,
die Tag-Freigabe im Nachtrag „Tag korrigiert“ nach dem
Marken-Wechsel (oben, „Freigabe per Tag“), die
Freigabe eines nachgetragenen Deploy-Stands und die
Freigabe eines Doku-Stands, der in der Doku-Abfrage
„später“ erhielt ([[Kettenpruefung]] §Kette) — sie
stehen als Formel im Nachtrag am Marken-Eintrag, nicht
als eigener Eintrag, und lösen nichts ab
([[Zielmarken]] §Meta „Nachtrag“, Formate dort;
[[Entscheidungen]] Meta „Freigabe-Einträge“, Ausnahme);
Aufbau
des Eintrags (Verweise, Nachweise, Einschränkung,
Ablösung, Zielmarke): [[Entscheidungen]] Meta
„Freigabe-Einträge“ — lesen vor der Buchung.
Freigaben sind unabhängig voneinander — eine Freigabe
„für Zweck A" impliziert nicht Freigabe „für Zweck B".

**Änderung nach der Freigabe:** eine Freigabe gilt für
ihren eingefrorenen Stand und wird nicht
zurückgenommen. Wird danach ein verwiesenes Element
abgelöst und gilt der Nachfolger für die Marke des
Stands, oder ist ein Vorgänger-Stand überholt (neue
Iteration), ist der Stand überholt — eine Ablösung,
die erst ab einer späteren Marke gilt, überholt ihn
nicht; die Antwort ist ein neuer Stand,
dessen Freigabe-DEC die alte per `supersedes:` ablöst.
Regel und Erkennung: [[Einfrieren-und-Abloesen]]
§Überholt-Regel — lesen, wenn sich nach einer Freigabe
etwas ändert. Prozess-eigene `Vorgehen-<Prozess>.md`
präzisieren die Anwendung (z.B. Meldung beim
Iterieren).

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
Funktionsbeschreibung). Zusätzlicher Auslöser: der
**Zielmarken-Wechsel** — beim Wechsel des
`in-progress`-Zeigers prüft der Agent (Lint-Lauf)
gesammelt, welche Stände der abzuschließenden Marke
überholt sind (Schritt 3) und welche ihrer Stände für
die Übernahme gegen die neue Marke überholt sind
(Schritt 5) — bei der Rückkehr aus einer
Zwischenmarke, die Vorgänger ist, auch welche Elemente
zwei für die zurückgestellte Marke geltende Nachfolger
haben (Fehler `NACHFOLGER-DOPPELT`, Schritt 1; ebenso,
wenn der Nachfolger-DEPL eines Nachtrags ein DEPL
ablöst, das die laufende Folge-Marke schon abgelöst
hat) —, und
legt Befunde vor; im Vollständigkeits-Scan (Schritt 1)
legt er auch die offenen Fehlermeldungen früherer
Marken der Kette vor, über die beim Abschluss
entschieden wird
(Wechsel-Prozedur, `## Meta` der Fassade
[[Zielmarken]]; kein eigener Mechanismus, sondern
diese Bezugsprüfung als gebündelter Lauf).

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
(Basis-Anlässe im MasterPrompt, Abschnitt
„Wächter-Trigger";
prozess-eigene Trigger wie T2 in den
Prozess-Templates).

## 6. Rechercheprozess

Recherche ist eine generische Fähigkeit (MasterPrompt
§5.6), die primär in **P2 Stand der Technik erfassen**
lebt — das ist die strukturelle Heimat. Recherche kann
aber in jeder Phase ausgelöst werden (z.B. R7 Best
Practices Toolchain in P7 Auswählen der Technologie,
R10 Fehlerbilder in P15 Betreiben).

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

## 7b. Werkzeug-Wahl

**Werkzeuge vorschlagen, Anwender wählt.** Jedes
Angebot an einer Phase, das ein Werkzeug braucht,
beginnt mit der Werkzeug-Wahl. Der Agent schlägt vor:

- verfügbare Werkzeuge (in seiner Umgebung vorhanden
  oder in `Tools.md` registriert),
- installierbare Werkzeuge — installiert wird nur mit
  Zustimmung des Anwenders (MasterPrompt §7;
  Frage-Momente und Startkatalog: [[MCP-Setup]], lesen,
  wenn ein Werkzeug fehlt),
- immer auch eine Variante **ohne** Werkzeug.

Der Anwender wählt. Die Wahl steht in `Tools.md` in der
passenden Kategorie, auch die Wahl „ohne Werkzeug“
(Kopiervorlage mit den Kategorien:
`wiki/templates/Tools-Vorlage.md`).

**Werkzeug-agnostisch.** Regeln und Anleitungen des
Templates nennen Produkte nur als Beispiele; welches
Werkzeug ein Projekt nutzt, steht nur in `Tools.md`.
Ausnahme sind Start und Transport von Peer-Agenten:
dort nennt die Empfehlung konkrete Werkzeuge,
gleichwertig mit einer Variante ohne Werkzeug (§3).

**Ordner zwischen Repos.** Das Template baut keinen
eigenen Mechanismus, um Ordner zwischen Repos
abzugleichen. Braucht ein Projekt einen Ordner aus
einem anderen Repo oder stellt es einen für ein
anderes Repo bereit, fragt der Agent, ob der Anwender
ein Werkzeug dafür hat (z.B. einen WorkspaceManager),
und bietet an, es gemeinsam einzurichten. Die Wahl
steht wie jede Werkzeug-Wahl in `Tools.md`.

Auftragsliste zur Freigabe (Aufträge mit Außenwirkung,
Kosten oder Kontingent-Verbrauch) und
Werkzeug-Dauerfreigabe:
[[Angebots-und-Beauftragungs-Muster]] — lesen vor dem
ersten Auftrag an ein gewähltes Werkzeug.

## 8. Prozess-Template-eigene `Vorgehen-<Prozess>.md`

Jedes Prozess-Template (SP-1, SP-2, …, RP-1, RP-2, …)
bringt eine eigene Vorgehen-Datei mit disjunktem
Datei-Namen mit — konkret `Vorgehen-SP-1.md`,
`Vorgehen-RP-1.md` usw. (disjunkte Dateinamen über
alle Prozesse, wie bei den mitgebrachten
Katalog-Einträgen). Die Basis-Datei heißt schlicht
`Vorgehen.md` und lebt im Basisrahmen-Root; die
Prozess-eigenen Dateien haben den Prozess-Kürzel im
Namen. Grund: beim Merge der Prozess-Teil-Wikis in das
Anwender-Wiki (Wiki.md §11.3) würden gleichnamige
Dateien kollidieren. Jede Prozess-
Vorgehen-Datei:

- **verweist** auf diese Basis-Datei für die Grund-
  Regeln,
- **belegt** die Phasen mit prozess-spezifischen Namen
  und Artefakten,
- **bindet** R-Themen (Recherche), S-Punkte
  (Prüfungen) und ggf. Scaffolding-Vorlagen (§7a) an
  konkrete Phasen,
- **präzisiert** ggf. die Anwendung der Überholt-Regel
  (§4 „Änderung nach der Freigabe“) und
  Delegations-Kriterien,
- **dokumentiert** Abweichungen (weggelassene Phasen,
  neue Phasen, umbenannte Phasen).

Nach demselben Muster bringt jedes Prozess-Template
sein **Marken-Dokument `Marken-<Prozess>.md`** mit
(`Marken-SP-1.md`, `Marken-RP-1.md`; Basis-Knoten
[[Marken]]): typische Marke der Projektart, ihr Produkt
(Zeile P9 der Phasentabelle), Schnitt und Benennung;
es ergänzt oder schärft das Marken-Dokument des
zugrundeliegenden Prozesses. Beide Dokumente tragen den
Typ `process-procedure` ([[Katalog-process-procedure]])
und werden beim Merge ins Anwender-`wiki/` kopiert
(Wiki.md §11); der Init liest aus dem Marken-Dokument
die typische Marke als Vorschlag für die erste Marke
([[Init-Choreografie]] §Init-Fassaden-Auswahl).

Ein RP adaptiert die Vorgehen-Datei des
zugrundeliegenden SP (aus `extends:`-Beziehung),
präzisiert für seine Domäne.

## 9. Bezüge

- `MasterPrompt.md` — Rahmen aller Teildateien;
  §5.6 Prüf- und Rechercheangebot (generische
  Recherche- und Prüf-Fähigkeit, Kurzform); Abschnitt
  „Wächter-Trigger" (Basis-Anlässe, die T4 ergänzt).
- `Reviewmuster.md` — Multi-Agent-Reviewmuster:
  Vier-Schleifen-Mechanik (§2: Standard-Prüfprompt,
  Zwei-Modelle-Regel, Selbst-Triage, Reifekriterium),
  Muster-Katalog M1–M6, Modell-Klassen, Umbau-Reviews
  (§3 M2 Achse B).
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
- `Tools.md` — Werkzeuge des Projekts und die
  Werkzeug-Wahlen nach §7b (Kopiervorlage
  `wiki/templates/Tools-Vorlage.md`).
