---
type: catalog-entry
art: einzeltyp
---

# Katalog-process-brief

Einzeltyp-Eintrag: Infrastruktur-Typ der
Template-Quelle (nie kopiert).

### process-brief

- **Zweck:** Prozess-Steckbrief — schlanke
  Selbstvorstellung für das Init-Angebot; einziger Ort
  der Prozess-Felder (Vererbungs-Metadaten) des
  Prozesses
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: process-brief`, `process`,
  `status` (`ausgearbeitet`/`geplant`), `extends`
  (Liste, höchstens ein Element)
- **Beispielname:** `Steckbrief.md`
- **Ablage:** `referenzprozesse/<P>/Steckbrief.md`;
  Template-Quelle, nie ins Anwender-wiki kopiert
  (Wiki.md §11, §11.2).
- **Kann-Feld:** `vormals` (frühere Kennung eines
  umbenannten Prozesses, z.B. `vormals: RP-3`; die alte
  Nummer bleibt gesperrt und wird nicht neu vergeben)
- **Ausbaustufen und „Pflicht ab“:** Ein Prozess darf
  im Steckbrief **Ausbaustufen** deklarieren (etwa
  1 Vorgang, 2 Streit, 3 Gericht) — eine Lage, die von
  außen kommt und das Projekt eskaliert. Dann nennt
  der Steckbrief je mitgebrachter Fassade und je
  Dokumenttyp das Feld **„Pflicht ab“**: `Stufe n`
  (die Pflicht gilt ab dieser Ausbaustufe) oder ein
  **Auslöser** (ein Ereignis, etwa „Schnitt in
  Komponenten“). Ohne das Feld gilt die Pflicht ab
  Start. Unterhalb der Stufe entfällt die Pflicht
  abgeleitet ([[Kettenpruefung]] §Fehlende und
  vertretene Glieder); wie der Prozess die Teile
  unterhalb der Stufe ausliefert, sagt sein
  Steckbrief. Der Herkunfts-Vermerk in
  [[Aktivierter-Prozess]] trägt die Zeile
  `Ausbaustufe` nur bei Prozessen mit Stufen (aktuelle
  Stufe mit Datum; [[Init-Choreografie]] §Phase A0);
  das Prüfprogramm liest „Stufe n“ gegen diese Zeile,
  einen Auslöser liest es nicht — den meldet der Agent
  als Hinweis, wenn das Ereignis eintritt. Der Wechsel
  der Stufe ist eine Entscheidung des Anwenders nach
  [[Zuschnitt-aendern]]; der Agent meldet den Anlass
  („Bescheid belastend — Stufe 2?“). Prozesse ohne Stufen
  deklarieren keine: wo der Anwender die Strenge selbst
  wählt (Entwicklung: Verzicht, schmaler Zuschnitt,
  Doku-Abfrage, Init-Auswahl), gilt der Verzicht.
