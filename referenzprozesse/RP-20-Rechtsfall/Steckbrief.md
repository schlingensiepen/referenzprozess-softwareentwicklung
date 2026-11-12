---
type: process-brief
process: RP-20
vormals: RP-3
status: ausgearbeitet
extends: [SP-2]
---

# RP-20 — Rechtsfall

**Bearbeitungsstand:** 2026-11-11 (Ausarbeitung: Zuschnitt,
Einstieg nach Stufe der Form, Präzisierungen zu SP-2,
Fristenkatalog, Wegweiser-Zuordnung, Join; löst den
Platzhalter ab)

**Vormals:** RP-3 — die Nummer RP-3 bleibt gesperrt und
wird nicht neu vergeben.

**Was ich bin:** Referenzprozess für Rechtsfälle
außerhalb des Abgabenrechts — vom Antrag und vom
Widerspruch bei einer Behörde bis zum Verfahren vor
**Gerichten aller Gerichtsbarkeiten** — Zivil, Arbeit,
Familie und freiwillige Gerichtsbarkeit, Verwaltung,
Soziales, Verfassungsgerichte; die Finanzgerichtsbarkeit
über [RP-21](../RP-21-Steuer-und-Abgabenfall/Steckbrief.md)
— in jeder Rolle des Anwenders und über alle Instanzen,
einschließlich Eilverfahren, Beschwerde und
Prozesskostenhilfe. Dazu gehören die vorgeschalteten
Verwaltungs- und Widerspruchsverfahren sowie Antrag und
Mitwirkung außerhalb des Abgabenrechts (Stufen 1 und 2);
der außergerichtliche Streit als Stufe 2 (offene Liste:
Mängelrüge, Gewährleistung, Rückforderung, Beanstandung
einer Abrechnung, Disput bei einem Zahlungsdienst,
Versicherungsfall, Kündigung) mit Schlichtung,
Güteverfahren, Mediation und Schiedsverfahren — eine
Klage eskaliert auf Stufe 3 im selben Projekt;
zivilrechtliche Zwangsvollstreckung und
Vollstreckungsabwehr sowie Verwaltungsvollstreckung
außerhalb des Abgabenrechts, als Gläubiger oder
Schuldner; Bußgeldbescheid und Strafbefehl als
Betroffener; die Forderungsanmeldung in der Insolvenz;
Strafrecht und Strafverteidigung in Grundzügen (dünner
Wegweiser zum Erkennen und zum Abspalten, nicht zur
Verteidigung im Hauptverfahren); der Auslands- und
EU-Bezug zum Erkennen (Prüfpunkt in P5); die formlosen
Rechtsbehelfe. Private Stellen mit eigenem Verfahren
werden wie Behörden geführt. Rolle auch als
**öffentliche Stelle** mit umgekehrten Voreinstellungen
([[Vorgehen-SP-2]] §Rolle und Interessen). Aufsetzend
auf SP-2: meine Regeln ergänzen und präzisieren SP-2
nur dort, wo eine Gerichtsbarkeit, ein Vorverfahren,
ein Schiedsverfahren oder die Vollstreckung eigene
Marken, Fristen, Rollen und Formen hat. Der
Vorgehensrahmen liegt in [[Vorgehen-RP-20]] und erbt
von [[Vorgehen-SP-2]]; die typischen Marken je Ordnung
in [[Marken-RP-20]], erbend von [[Marken-SP-2]]; die
Fristen im [[Fristenkatalog-RP-20]].

**Abgrenzung zu RP-21:** keine feste Regel. Das Verfahren
beginnt in dem Referenzprozess, in dem es beginnt;
zeigt sich der Bedarf des anderen, bietet der Agent
RP-21 als **Join** in dasselbe Projekt an (§Join unten).
Grenzfälle entscheidet der Anwender mit seinem Agenten
nach der Entscheidungsmatrix ([[Marken-SP-2]] §Stränge).

## Einstieg nach Stufe der Form

Die Ausbaustufen (1 Vorgang, 2 Streit, 3 Gericht)
deklariert SP-2 ([SP-2-Steckbrief](../SP-2-Recht-und-Verwaltung/Steckbrief.md)
§Ausbaustufen); RP-20 deklariert keine eigenen. Die
Stufe beginnt dort, wo das Verfahren beginnt. Ein vom
Gegenüber eingeleitetes Verfahren beginnt auf der Stufe
seiner Form — Zuordnung der Formen im Zuschnitt von
RP-20 (offene Liste):

| Form des Einstiegs | Stufe |
|---|---|
| Bußgeldbescheid; belastender Verwaltungsakt; Maßnahme der Verwaltungsvollstreckung; Schiedsverfahren (Verfahren vor einer privaten Stelle); Forderungsanmeldung beim Insolvenzverwalter | **2** |
| Strafbefehl; Verfahren nach Einspruch gegen den Bußgeldbescheid; Zwangsvollstreckung aus einem Titel; gerichtliche Verfahren zum Schiedsspruch; Feststellungsklage in der Insolvenz; jede Klage, jeder Mahn- oder Vollstreckungsbescheid, jeder Eilantrag bei Gericht | **3** |

_Grundbestand (offene Liste) — fachliche Gegenlesung ausstehend._

Der Init setzt die Stufe aus der Antwort auf die zweite
SP-2-Init-Frage (`../SP-2-Recht-und-Verwaltung/index.md`
§4.6); die RP-20-Fragen dazu stehen in [[index]] §5.
Ausgeliefert wird immer die volle Fassung; was die Stufe
nicht braucht, liegt mit `active: false` bereit.

**Was ich kann:**

- Ein Verfahren vor Gericht, im Vorverfahren, vor einer
  Schlichtungs-, Mediations- oder Schiedsstelle oder in
  der Vollstreckung nach dem SP-2-Rahmen führen und je
  Ordnung die **typischen Marken, Ereignis-Marken und
  Enden** vorschlagen — in der Folge, die die Ordnung
  kennt ([[Marken-RP-20]]).
- **Fristen aus dem Fristenkatalog** ziehen: jede Frist
  mit Entstehung, Wirkung, Berechnungsregel und
  Fundstelle auf den Normen-Stand; prozessual,
  materiell, Nachlauf ([[Fristenkatalog-RP-20]]; Felder
  und Wecker-Pflicht: [[Katalog-Fristen]],
  [[Vorgehen-SP-2]] §Fristen).
- **Vertretungszwang** je Instanz und Handlung am
  Verfahren führen, bei Vertretungszwang die
  Teilaktivität `auftrag` an die Vertretung vorsehen
  (einreichungsfertige Entwürfe, die Vertretung reicht
  ein), Ende und Wechsel der Vertretung mit
  Pflicht-Prüfung von Fristen und Zustellungsadressat
  ([[Vorgehen-RP-20]] §4).
- **Zwei Zählungen** führen: die eigene Versionskette
  und die Kennung der Vertretung an derselben
  Schriftsatz-Zeile ([[Vorgehen-RP-20]] §4).
- Das **Anlagen-Schema** je Gerichtsbarkeit und Rolle
  voreinstellen; eine **Gerichts- oder Behördenakte
  zerlegen** (Baustein) und als Eingangsdokumente mit
  Blattzahl führen ([[Vorgehen-RP-20]] §3, §5).
- **Prüfperspektiven** je Rolle voreinstellen —
  entscheidende oder vermittelnde Stelle, öffentliche
  Stelle gegen ihre Pflichten bzw. „Adressat“,
  Gegenperspektive ([[Vorgehen-RP-20]] §7).
- **Kanäle mit Abrufpflicht** je eröffnetem Postfach als
  P15-Pflicht, Erklärung zu Protokoll und im Termin,
  Zustellung von Anwalt zu Anwalt, Fax mit Seitengrenze
  ([[Vorgehen-RP-20]] §6).
- **Kosten und Beweisangebote** je Gerichtsbarkeit und
  Kostenregime, **Vollstreckung** als Gläubiger oder
  Schuldner mit dem Forderungskonto ([[Vorgehen-RP-20]]
  §3, §8).
- Typische **Abspaltungen** und **Sammelverfahren
  Dritter** erkennen; **Rechtsauskünfte** nur mit
  Primärquelle ([[Vorgehen-RP-20]] §10, §11).
- Beim Init als Referenzprozess auf SP-2 vorgeschlagen
  werden (Streit um eine Leistung oder einen Status),
  im laufenden Projekt den Join mit RP-21 anbieten.

**Was ich mitbringe:**

- **Keine eigenen Fassaden und keine eigenen Typen.**
  RP-20 nutzt die Fassaden und Typen von SP-2 und der
  Basis und **präzisiert** sie — Deklaration unten,
  §„Mitgebrachte Fassaden“; führender Ort der
  Präzisierungen ist [[Vorgehen-RP-20]] §3.
- **Wissensknoten** [[Fristenkatalog-RP-20]] (Typ
  `guide` wie die Wegweiser, mit Teilaufsätzen) —
  Deklaration unten, §„Mitgebrachte Wissensknoten“.
- **Prozess-Knoten** [[Vorgehen-RP-20]] und
  [[Marken-RP-20]] (`process-procedure`).
- **Baustein „Akte zerlegen“** ([[Vorgehen-RP-20]] §5).
- **Präfixe:** keine neuen; **Mechanik:** keine eigenen
  Knoten — Deklarationen unten.

## Mitgebrachte Fassaden

RP-20 bringt keine neue Fassade mit und löst keine
SP-2-Fassade ab. Was ein Typ ist, steht nur in seinem
SP-2- oder Basis-Katalog-Eintrag; was RP-20 je Fassade
ergänzt, steht in [[Vorgehen-RP-20]] §3 (lesen bei
Anlage oder Pflege der Fassade unter RP-20) und gilt,
sobald RP-20 aktiv ist:

| Fassade (Herkunft) | RP-20-Präzisierung | Wo |
|---|---|---|
| [[Verfahren]] (SP-2) | Voreinstellung `anlagen_schema` je Gerichtsbarkeit und Rolle; `vertretungszwang` je Instanz und Handlung aus dem Wegweiser der Ordnung; Instanzenzug je Ordnung | [[Vorgehen-RP-20]] §3, §4 |
| [[Beteiligte]] (SP-2) | Rollen-Grundbestand je Gerichtsbarkeit (Beteiligtenbezeichnungen), Vertretung und Beiordnung, Zustellungsbevollmächtigter | [[Vorgehen-RP-20]] §3 |
| [[Anlagen]] (SP-2) | Nummernvergabe nach dem voreingestellten Schema; Verweis auf die Gerichts- bzw. Behördenakte mit Blattzahl | [[Vorgehen-RP-20]] §3, §5 |
| [[Einreichungen]] (SP-2) | Kanäle mit Abrufpflicht, Erklärung zu Protokoll und im Termin, Zustellung von Anwalt zu Anwalt, Fax mit Seitengrenze; Standard der Erwartung je Stellen-Typ | [[Vorgehen-RP-20]] §6 |
| [[Kosten]] (SP-2) | Kostenregime je Gerichtsbarkeit: Beratungshilfe, PKH, Kostenerstattung im Vorverfahren, Kostenfestsetzung, Streitwertbeschwerde | [[Vorgehen-RP-20]] §3 |
| [[Beweisangebote]] (SP-2) | Beweisarten und Beweisanträge je Ordnung; Einwendungsfrist gegen Gutachten | [[Vorgehen-RP-20]] §3 |
| [[Forderungskonto]] (SP-2) | Titel und Klausel, Vollstreckungsmaßnahmen, Drittschuldner, Sicherheitsleistung | [[Vorgehen-RP-20]] §8 |
| [[Fristen]] (Basis, SP-2-Präzisierung) | Berechnungsregeln und Bezeichnungen aus dem [[Fristenkatalog-RP-20]] | [[Fristenkatalog-RP-20]] |
| [[Eingangsdokumente]] (Basis, SP-2-Präzisierung) | Ergebnis des Bausteins „Akte zerlegen“: je Dokument ein Eintrag mit Blattzahl | [[Vorgehen-RP-20]] §5 |

Vorauswahl der SP-2-Fassaden unter RP-20: [[Kosten]]
und [[Beweisangebote]] bietet der Agent ab Stufe 2
aktiv an (Gerichtsverfahren tragen fast immer Kosten
und Beweisfragen); [[Forderungskonto]] mit der ersten
Vollstreckungs-Marke. Die Einstufung „Pflicht ab“ bleibt
die des SP-2-Steckbriefs.

## Mitgebrachte Wissensknoten

| Knoten | Typ | Gegenstand | Beim Merge |
|---|---|---|---|
| [[Fristenkatalog-RP-20]] mit Teilaufsätzen in `wiki/Fristenkatalog-RP-20/` | `guide` ([[Katalog-Wegweiser]]; Wissensknoten des Templates: das Upgrade ersetzt ihn mit dem Normen-Stand, das Projekt ändert ihn nicht) | Grundbestand der Fristen je Gerichtsbarkeit, Vorverfahren, Schiedsverfahren und Vollstreckung — prozessual, materiell, Nachlauf; jede Zeile mit Entstehung, Wirkung, Berechnungsregel und Fundstelle auf den Normen-Stand | **Merge-Anweisung:** Übersicht und Teilaufsätze nach `wiki/` kopieren; eine Zeile im Index [[Wegweiser]] eintragen (Wikilink, Gegenstand, Hauptgesetze) — die Zeile entsteht nur mit dem Merge dieses Referenzprozesses; Kopf „Stand der Normtexte“ wie bei den Wegweisern; `tools/wegweiser-quellen.py --pruefen` prüft seine Links mit, sobald der Lauf Fristenkataloge einschließt |

Der Fristenkatalog ist **kein eigenes Register und keine
Fassade**: die Frist eines Falls entsteht in [[Fristen]]
aus einer Berechnungsregel des Katalogs oder beim
Einlesen des auslösenden Dokuments, nie aus dem
Gedächtnis ([[Katalog-Fristen]] SP-2-Präzisierung).
**Offene Liste** heißt: das Template erweitert den
Katalog mit jedem Release; Ergänzungen des Projekts
(Fachgesetz, Landesrecht, Satzung) stehen in eigenen
Knoten — als Projekt-Rechercheartefakt oder Konzept —
und als `source` an der Frist, nie im Katalog selbst
(Regel der Wegweiser, [[Katalog-Wegweiser]]).

## Wegweiser-Zuordnung

Das Normen-Paket kommt vollständig mit SP-2 ins
Projekt; die Zuordnung hier ist eine **Lesehilfe**,
keine Auslieferungs-Grenze. Für RP-20 zählen die
Wegweiser [[Wegweiser-ZPO]], [[Wegweiser-ArbGG]],
[[Wegweiser-FamFG]], [[Wegweiser-VwGO]],
[[Wegweiser-SGG]], [[Wegweiser-Vorverfahren]] (ohne den
Teilaufsatz zum Einspruch nach der Abgabenordnung),
[[Wegweiser-Verfassungsbeschwerde]],
[[Wegweiser-Bussgeld-und-Strafbefehl]],
[[Wegweiser-Strafrecht-Grundzuege]],
[[Wegweiser-Insolvenz]], [[Wegweiser-Streitbeilegung]]
und die Querschnitte [[Wegweiser-Kosten]],
[[Wegweiser-Zustellung-und-Fristen]],
[[Wegweiser-Elektronischer-Rechtsverkehr]],
[[Wegweiser-Pruefraster]], [[Wegweiser-Bescheid-erlassen]]
(Anwender als öffentliche Stelle),
[[Wegweiser-Auslands-und-EU-Bezug]]; Einstieg
[[Wegweiser-Verfahrensordnungen]]. [[Wegweiser-FGO]]
gehört zu RP-21 und bleibt im Projekt verfügbar.

## Mitgebrachte Präfixe

_(Führender Deklarations-Ort — beim Prozess-Merge liest
der Agent diese Sektion, Wiki.md §11.3 Schritt 6.)_

RP-20 führt die SP-2-Präfixe `Freigabe:` und
`devstate:` unverändert fort und bringt **keine eigenen
Commit-Präfixe** mit.

## Mitgebrachte Mechanik

_(Führender Deklarations-Ort, Wiki.md §11.3 Schritt 7.)_

RP-20 bringt **keine eigenen `internal-*`-Knoten** mit.
Der SP-2-Knoten [[devstate-SP-2]] gilt unverändert; die
RP-20-Betriebs-Mechanik (Vertretung und Mandat, zwei
Zählungen, Akte zerlegen, Kanäle, Vollstreckung) liegt
in [[Vorgehen-RP-20]]. Eigene Wächter-Zeilen bringt
RP-20 nicht mit; die SP-2-Prüfungen `SP2-VERTRETUNG`,
`SP2-ABRUF`, `SP2-ANLAGE`, `SP2-TEMP` und `SP2-TERMIN`
decken seine Präzisierungen ([[Vorgehen-SP-2]] §Wächter).

## Mitgebrachte Begriffe

_(Führender Deklarations-Ort — beim Prozess-Merge
übernimmt der Agent die Einträge des Glossar-Anhangs
in `wiki/Glossar.md` des Projekts, Wiki.md §11.3
Schritt 2, „Glossar-Anhang“.)_

RP-20 bringt den Glossar-Anhang
`Glossar-Anhang-RP-20.md` (`wiki/` des Prozess-Ordners)
mit — die Begriffe, die nur RP-20 benutzt: „Akte
zerlegen“, „Sammelverfahren Dritter“ und „Stufe der
Form“. Der Anhang von SP-2 kommt über die
`extends:`-Kette dazu. Die Einträge gelten als
freigegeben mit dem Template-Stand; der Anhang selbst
wird nicht ins Projekt kopiert. Ein vorhandener Eintrag
gleichen Namens wird nicht überschrieben, sondern dem
Anwender vorgelegt.

## Join

RP-20 und RP-21 sind Join-Partner; beide
`extends: [SP-2]`, keiner erbt vom anderen. Zeigt sich
in einem Rechtsfall der Bedarf des Steuer- und
Abgabenfalls (eine Bescheidkette je Zeitraum und
Abgabenart, eine Klage vor dem Finanzgericht aus
derselben Sache), bietet der Agent RP-21 als Join an —
im laufenden Projekt oder schon beim Init
([[Zuschnitt-aendern]] §Join; [[Init-Choreografie]]
§Join): Merge des zweiten Prozess-Teil-Wikis, nur die
neuen Start-Fragen, bei Widerspruch gilt der zuerst
aktive Prozess, das Upgrade zieht beide. Der Join ist
ein Angebot — nie ohne Entscheidung des Anwenders
([[Zuschnitt-aendern]] §Rückfrage-Pflicht).

**Setzt voraus:** SP-2 (Recht und Verwaltung, siehe
[SP-2-Steckbrief](../SP-2-Recht-und-Verwaltung/Steckbrief.md)).

**Volle Definition:** [[index]] · Vorgehen:
[[Vorgehen-RP-20]] · Marken: [[Marken-RP-20]] ·
Fristen: [[Fristenkatalog-RP-20]]
