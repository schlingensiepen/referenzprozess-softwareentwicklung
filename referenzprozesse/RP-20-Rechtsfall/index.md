---
type: process-mapping
---

# RP-20 Rechtsfall

**Bearbeitungsstand:** 2026-11-11 (Ausarbeitung; löst den
Platzhalter ab)

Ich bin die **volle Definition** des Referenzprozesses
RP-20 — Template-Quelle, nie ins Anwender-`wiki/`
kopiert. Die Kurzform mit den Deklarationen steht im
[[Steckbrief]]; was beim Merge ins Projekt kommt, steht
in §6.

## 1. Ich bin RP-20

Ich bin der Referenzprozess für **Verfahren vor Gerichten
aller Gerichtsbarkeiten** außer der Finanzgerichtsbarkeit,
für die vorgeschalteten Verwaltungs- und
Widerspruchsverfahren, für Antrag und Mitwirkung
außerhalb des Abgabenrechts, für den außergerichtlichen
Streit mit Schlichtung, Güteverfahren, Mediation und
Schiedsverfahren, für Zwangsvollstreckung und
Vollstreckungsabwehr, für Bußgeldbescheid und
Strafbefehl als Betroffener und für die
Forderungsanmeldung in der Insolvenz — in jeder Rolle
des Anwenders, auch als öffentliche Stelle, über alle
Instanzen. Strafrecht in Grundzügen, formlose
Rechtsbehelfe und der Auslands- und EU-Bezug gehören
zum Erkennen und zum Abspalten dazu ([[Steckbrief]]
„Was ich bin“).

SP-2 kann allein stehen; RP-20 kommt obendrauf, sobald
ein Verfahren eine **Ordnung** hat — eine
Verfahrensordnung mit eigenen Rechtsbehelfen, Fristen,
Rollenbezeichnungen und Formen. Dann liefert RP-20, was
SP-2 bewusst offen lässt: die typischen Marken und
Enden je Ordnung ([[Marken-RP-20]]), den Fristenkatalog
([[Fristenkatalog-RP-20]]), die Voreinstellungen für
Anlagen-Schema, Vertretungszwang, Rollen,
Prüfperspektiven, Kanäle und Kostenregime
([[Vorgehen-RP-20]]). Steuern und Abgaben führt
[RP-21](../RP-21-Steuer-und-Abgabenfall/index.md);
beide sind Join-Partner (§4.9).

**Wichtig:** RP-20 ist **kein Rechtsgutachten und keine
Rechtsberatung**. Die Rechtskenntnis kommt aus den
Wegweisern des Templates, dem Fristenkatalog und dem
Normen-Paket; was dort nicht steht, recherchiert der
Agent als Rechercheartefakt und prüft es an der
Primärquelle. **Der Anwender entscheidet; der Agent
handelt nie selbst nach außen.**

## 2. Rolle dieser Datei und wie RP-20 auf SP-2 aufsetzt

RP-20 erbt vollständig von SP-2 (`extends: [SP-2]`),
der seinerseits nur von der Basis erbt. Alles, was ein
Verfahren trägt — Marke, Produkt, Tag, Kette der
Pflicht-Stände mit juristischen Namen, Posteingang,
„Immer ein Wecker“, Prüfen vor jedem Versand,
Gegenperspektive, Stränge, Vertraulichkeit,
Ausbaustufen, Normtexte mit Wegweisern — kommt aus
SP-2 (`../SP-2-Recht-und-Verwaltung/index.md`) und der
Basis. RP-20 **präzisiert**, **benennt nichts um** (die
Phasen behalten die SP-2-Namen; ein Referenzprozess
dürfte umbenennen, RP-20 braucht es nicht) und bringt
**keine eigenen Fassaden, Typen, Präfixe oder
Mechanik-Knoten** mit.

Die Präzisierungen stehen an einem Ort: [[Vorgehen-RP-20]]
§3 ist der führende Ort der Fassaden-Präzisierungen; die
SP-2-Katalog-Einträge der betroffenen Fassaden verweisen
dorthin (Block „RP-20-Präzisierung“). Diese Datei
(`index.md`) erklärt Architektur und Init-Fragen; sie
ist Template-Quelle und wird nicht kopiert.

Bei einem Join gilt zwischen RP-20 und RP-21 der zuerst
aktive Prozess ([[Zuschnitt-aendern]] §Join).

## 3. Konkrete Instanzen der Basis + SP-2

### 3.1 RP-20-Präzisierungen an SP-2-Fassaden

Keine neue Fassade. Die Tabelle im [[Steckbrief]]
§Mitgebrachte Fassaden nennt je SP-2-Fassade, was
RP-20 ergänzt, und verweist auf den Abschnitt in
[[Vorgehen-RP-20]]. Merge-Regel: der Agent liest beim
Merge die Präzisierungen und schreibt die
Voreinstellungen (Anlagen-Schema, Vertretungszwang,
Rollen, Perspektiven, Kostenregime) in die Felder bzw.
`## Meta`-Sektionen der betroffenen Fassaden des
Projekts — als Vorschlag mit Quelle, der Anwender
bestätigt oder ändert.

### 3.2 RP-20-Wissensknoten

[[Fristenkatalog-RP-20]] (Typ `guide`, Teilaufsätze im
gleichnamigen Unterordner): Grundbestand der Fristen je
Gerichtsbarkeit, Vorverfahren, Schiedsverfahren und
Vollstreckung, prozessual, materiell und Nachlauf. Er
ist template-eigen wie die Wegweiser — das Upgrade
ersetzt ihn mit dem Normen-Stand, das Projekt ändert
ihn nicht. „Offene Liste“ heißt: das Template erweitert
den Katalog mit jedem Release; projekt-eigene
Fristenregeln (Fachgesetz, Landesrecht, Satzung) stehen
in eigenen Knoten — Projekt-Rechercheartefakt oder
Konzept — und als `source` an der Frist
([[Vorgehen-SP-2]] §Normtexte; Regel der Wegweiser).
Beim Merge kopiert der Agent Übersicht und Teilaufsätze
nach `wiki/` und trägt die Zeile im Index [[Wegweiser]]
ein ([[Steckbrief]] §Mitgebrachte Wissensknoten,
Merge-Anweisung).

### 3.3 RP-20-Präfixe

Keine neuen (Steckbrief §Mitgebrachte Präfixe).

## 4. RP-20-eigene Mechanismen

Die Mechanismen im Einzelnen stehen in
[[Vorgehen-RP-20]] (führender Ort); hier die Landkarte:

### 4.1 Einstieg nach Stufe der Form

Zuordnung der Formen im Zuschnitt zu den Stufen 2 und 3
([[Steckbrief]] §Einstieg nach Stufe der Form, offene
Liste mit Grundbestand). Der Agent erkennt die Form aus
dem ersten Eingangsdokument oder der Antwort auf die
Init-Frage und schlägt die Stufe vor; der Anwender
bestätigt.

### 4.2 Vertretung und Mandat

Vertretungszwang je Instanz und Handlung als Feld am
Verfahren, Quelle im Wegweiser der Ordnung; bei
Vertretungszwang die Teilaktivität `auftrag` ohne Repo
an die Vertretung; Ende und Wechsel der Vertretung mit
Pflicht-Prüfung; zwei Zählungen an der Schriftsatz-Zeile
([[Vorgehen-RP-20]] §4).

### 4.3 Anlagen-Schema und Baustein „Akte zerlegen“

Voreinstellung des Nummerierungsschemas je
Gerichtsbarkeit und Rolle; die Gerichts- oder
Behördenakte wird nach dem Inhaltsverzeichnis
geschnitten und als Eingangsdokumente mit Blattzahl
geführt ([[Vorgehen-RP-20]] §3, §5).

### 4.4 Kanäle mit Abrufpflicht

Jeder eröffnete Kanal mit Bereitstellung zum Abruf ist
ab der Stufe, in der er eröffnet ist, P15-Pflicht mit
Abrufturnus; Erklärung zu Protokoll und im Termin,
Zustellung von Anwalt zu Anwalt, Fax mit Seitengrenze
([[Vorgehen-RP-20]] §6).

### 4.5 Prüfperspektiven je Rolle

Entscheidende oder vermittelnde Stelle, öffentliche
Stelle gegen ihre Pflichten bzw. „Adressat“,
Gegenperspektive; Voreinstellung je Rolle
([[Vorgehen-RP-20]] §7).

### 4.6 Vollstreckung

Titel und Klausel, Maßnahmen als Gläubiger oder
Schuldner, Rechtsbehelfe, Vollstreckungsschutz,
Sicherheitsleistung, Vollstreckung gegen die
öffentliche Hand, Drittschuldner; Forderungskonto aus
SP-2 ([[Vorgehen-RP-20]] §8).

### 4.7 Abspaltungen, Sammelverfahren Dritter, Rechtsauskünfte

Typische Abspaltungen nach der Entscheidungsmatrix;
Sammelverfahren Dritter als fremde Marke mit
Anmeldefrist; Rechtsauskünfte nur mit Primärquelle
([[Vorgehen-RP-20]] §10, §11).

### 4.8 Kleine Fälle

Wie SP-2 ([[Vorgehen-SP-2]] §2 „Kleine Fälle“); RP-20
ändert die Kette nicht ([[Vorgehen-RP-20]] §12).

### 4.9 Join mit RP-21

[[Steckbrief]] §Join. Anlass im laufenden Projekt: eine
Bescheidkette je Zeitraum und Abgabenart, eine Klage
vor dem Finanzgericht aus derselben Sache, die Abwehr
einer Abgabenvollstreckung. Der Agent bietet an, der
Anwender entscheidet, Buchung als Entscheidung; nur die
neuen Start-Fragen von RP-21 werden gestellt (§5 dort).

### 4.10 Abgrenzungen ähnlicher Strukturen

- **Vollstreckung aus einem Titel (RP-20) ≠
  Abgabenvollstreckung (RP-21):** die Vollstreckung aus
  einem zivilen Titel und die Verwaltungsvollstreckung
  außerhalb des Abgabenrechts gehören zu RP-20; die
  Abgabenvollstreckung und ihre Abwehr zu RP-21.
- **Streitverkündung ≠ Abspaltung:** die
  Streitverkündung ist ein Schriftsatz im Verfahren; der
  Folgeprozess ist die Abspaltung ([[Marken-SP-2]]
  §Stränge).
- **Formloser Rechtsbehelf ≠ Rechtsbehelf:** ohne eigene
  Frist, hemmt nichts; die förmliche Frist bleibt unter
  Wache ([[Marken-SP-2]] §Formlose Rechtsbehelfe).
- **Eilsache ≠ neue Marke:** vorgezogene Marke
  ([[Marken-SP-2]] §Frist und Marke).

## 5. Prozess-spezifische Init-Fragen

RP-20 stellt seine Fragen **zusätzlich** zu den
SP-2-Init-Fragen (`../SP-2-Recht-und-Verwaltung/index.md`
§4.6), geordnet nach Vorfestlegungs-Stärke; vor jeder
Frage gilt die Ableitbarkeits-Prüfung (MasterPrompt
§5.1.0) — aus dem ersten Eingangsdokument, einem
Startprompt der Abspaltung oder vorhandenen Akten lässt
sich das meiste ablesen. Beim Join nach RP-21 werden nur
diese Fragen gestellt.

1. **Ordnung und Instanz** — welche Verfahrensordnung
   (Zivil, Arbeit, Familie, Verwaltung, Soziales,
   Verfassung; Vorverfahren; Schlichtung, Mediation,
   Schiedsverfahren; Vollstreckung; Bußgeld und
   Strafbefehl; Insolvenz) und welche Instanz bzw.
   Stufe des Vorverfahrens. _Legt vorab fest:_ den
   Wegweiser der Ordnung, den Teilaufsatz des
   Fristenkatalogs, die typischen Marken und Enden
   ([[Marken-RP-20]]), die Rollenbezeichnungen, das
   Kostenregime; zusammen mit der SP-2-Frage „wer hat
   begonnen“ die Stufe der Form.
2. **Vertretungszwang und Vertretung** — ob in dieser
   Instanz und für die anstehende Handlung
   Vertretungszwang gilt (Vorschlag aus dem Wegweiser
   der Ordnung, Teilaufsatz „Vertretung und
   Anwaltszwang“); wer vertritt (Eintrag in
   [[Beteiligte]]), ob eine Beiordnung oder ein
   Zustellungsbevollmächtigter im Spiel ist. _Legt vorab
   fest:_ Feld `vertretungszwang` am Verfahren, ob P6
   „Mandat erteilen“ ansteht, wer einreicht, ob die zwei
   Zählungen zu führen sind.
3. **Anlagen-Schema** — die Voreinstellung je
   Gerichtsbarkeit und Rolle ([[Vorgehen-RP-20]] §3) als
   Vorschlag; eine gerichtliche Anordnung geht vor.
   _Legt vorab fest:_ Feld `anlagen_schema` am
   Verfahren.
4. **Akte vorhanden?** — liegt eine Gerichts- oder
   Behördenakte (Akteneinsicht, Verwaltungsvorgang) vor,
   läuft der Baustein „Akte zerlegen“ zuerst
   ([[Vorgehen-RP-20]] §5), vor allen anderen
   Einlesungen; Fristen aus der Akte werden sofort
   gemeldet. _Legt vorab fest:_ den Posteingang der
   ersten Marke.
5. **Kostenregime** — Prozesskostenhilfe,
   Beratungshilfe, Rechtsschutzversicherung,
   Kostenerstattung im Vorverfahren; nur, wenn
   [[Kosten]] aktiv wird. _Legt vorab fest:_ die
   Kosten-Posten des Grundbestands, die Erwartung
   „Deckungszusage“.

Weitere RP-20-Fragen entstehen aus dem Verlauf (etwa der
Instanzwechsel) und werden als Rückfrage in der Marke
gestellt, nicht im Init.

## 6. Rollen und Dateien

### 6.1 Rolle des Anwenders im Verfahren

Wie SP-2 (`../SP-2-Recht-und-Verwaltung/index.md` §5.1):
Rolle und Verfahrensgrundsatz steuern Stimme,
Freigabeweg, Prüfperspektiven und die Voreinstellungen
der Marken. RP-20 liefert je Gerichtsbarkeit die
Rollenbezeichnungen und je Rolle die Voreinstellungen
([[Vorgehen-RP-20]] §3, §7; [[Marken-RP-20]] §6).

### 6.2 Dateien des Prozess-Ordners

| Datei / Ordner | Zweck | Beim Merge |
|---|---|---|
| `Steckbrief.md` | Kurzform, Deklarationen, Einstieg nach Stufe der Form, Wegweiser-Zuordnung, Join | Template-Quelle, nicht kopiert |
| `index.md` | diese volle Definition mit den Init-Fragen | Template-Quelle, nicht kopiert |
| `wiki/Vorgehen-RP-20.md`, `wiki/Marken-RP-20.md` | Präzisierungen je Phase und Fassade, Vertretung, Akte zerlegen, Kanäle, Vollstreckung; Marken, Ereignis-Marken, Enden und Folgen je Ordnung | kopiert (`process-procedure`) |
| `wiki/Fristenkatalog-RP-20.md` mit `wiki/Fristenkatalog-RP-20/` | Fristenkatalog mit Teilaufsätzen je Ordnung | kopiert; template-eigen, das Upgrade ersetzt; Zeile in [[Wegweiser]] |

RP-20 bringt keine `bootstrap/`-Dateien mit, weil es
keine Fassade mitbringt; die Voreinstellungen schreibt
der Agent beim Merge nach §3.1 in die SP-2-Fassaden des
Projekts.

## 7. Bezüge

- Kurzform: [[Steckbrief]]
- Vorgehen: [[Vorgehen-RP-20]]; Marken: [[Marken-RP-20]];
  Fristen: [[Fristenkatalog-RP-20]]
- Elternprozess: `../SP-2-Recht-und-Verwaltung/index.md`,
  [[Vorgehen-SP-2]], [[Marken-SP-2]]
- Basis: `Vorgehen.md`, `Outgoing.md`, [[Kettenpruefung]],
  [[Init-Choreografie]], [[Zuschnitt-aendern]]
- Join-Partner: `../RP-21-Steuer-und-Abgabenfall/index.md`
