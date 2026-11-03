---
type: process-procedure
process: SP-1
extends: []
---

# SP-1 — Marken

**Bearbeitungsstand:** 2026-10-25

## 1. Erbschaft

Was eine Marke ist, was sie abschließt und wann eine
neue beginnt, steht in der Basis: [[Marken]] (Begriff:
[[Glossar]] „Marke“; Register, Zustände, Zeiger und
Wechsel-Prozedur: [[Zielmarken]] §Meta). Dieses
Dokument schärft das für Entwicklungsprojekte.

## 2. Typische Marke

Die Marke eines Entwicklungsprojekts ist eine
**Ausbaustufe des Systems, die ausgeliefert wird** —
ihr Produkt ist das Ergebnis von P9 Ausarbeiten
([[Vorgehen-SP-1]] §2, Zeile P9 und Anmerkung P9;
welche Art Produkt, sagt der Referenzprozess der
Domäne). Die erste Marke ist die erste auslieferbare
Ausbaustufe: der Agent schlägt beim Init die Bezeichnung
**„1.0“** vor (Benennung z.B. „Erst-Auslieferung“),
die Bezeichnung nennt der Anwender.

## 3. Schnitt

- Jede weitere Auslieferung einer geänderten
  Ausbaustufe ist eine neue Marke („1.1“, „2.0“); eine
  Fehlerbehebung nach dem Abschluss eine Patch-Marke
  („2.0.1“); dieselbe Ausbaustufe in einer weiteren
  Zielumgebung ein Nachtrag an der abgeschlossenen
  Marke, ebenso ein Doku-Stand, der in der Doku-Abfrage
  „später“ erhielt und erst nach dem Wechsel
  freigegeben wird ([[Marken]] §Wann eine neue Marke
  beginnt; [[Kettenpruefung]] §Kette, Doku-Abfrage).
- Je Marke gilt die Kette der Pflicht-Stände mit Tag
  und Abschluss-Stand ([[Kettenpruefung]] §Kette);
  Phasen mit Pflicht-Stand, die eine Marke nicht
  braucht, fallen per Verzicht je Marke aus — nie der
  Tag (P9) —, und manche Glieder fehlen ohne Verzicht
  (ebenda, §Fehlende und vertretene Glieder).
- Bei einem Schnitt in Komponenten (P6) ist die Marke
  des Koordinators die Marke des Systems; jede
  Komponente führt eigene Marken mit `fuer_marke:` auf
  die Marke des Koordinators ([[Zielmarken]] §Meta,
  Zuliefernde Komponenten).

## 4. Benennung

Versions-artig („1.0“, „1.1“, „2.0“, Patch „2.0.1“);
die Benennung darf ein Codename oder ein sprechender
Name sein ([[Zielmarken]] §Meta, Marken-Dreiklang).
Die Marke ist nicht die Version des Produkts und nicht
die Version eines Stands (ebenda, Abgrenzungen).

## 5. Marke und Meilenstein-Vorgang

Die Zielmarke ist der Horizont, auf den hingearbeitet
wird; der **Meilenstein-Vorgang** ist eine
abgeschlossene Arbeits-Einheit innerhalb einer Marke
(SP-1-`index.md` §4.3, Abgrenzung §4.9). Der
Marken-Abschluss ist ein Meilenstein (Anlass);
erreicht ist er mit dem gebuchten Zielmarken-Wechsel,
der damit
die T2-Runde des Wächters auslöst
([[Meilenstein-und-T2]]). Beide
Ebenen bleiben; eine Arbeits-Einheit wird nicht zur
Marke, nur weil sie abgeschlossen ist. Die Freigabe
jedes Pflicht-Stands der Kette — auch der Doku-Stände
P11, P12 und P15 — ist ein eigener Meilenstein-Anlass.
Eine Freigabe im
Nachtrag zu einer abgeschlossenen Marke (§3: dieselbe
Ausbaustufe in einer weiteren Zielumgebung; ein
Doku-Stand mit „später“; die
Tag-Korrektur) ist kein Meilenstein-Anlass — die Marke
ist abgeschlossen, ihr Meilenstein mit dem Wechsel
erreicht ([[Meilenstein-und-T2]]).

## 6. Bezüge

- Basis: [[Marken]], [[Zielmarken]] §Meta
- Produkt und Phase P9: [[Vorgehen-SP-1]] §2
- Kette, Verzicht, Komponenten: [[Kettenpruefung]]
- Meilenstein-Vorgang und T2: [[Meilenstein-und-T2]],
  SP-1-`index.md` §4.3
- RP-1-Schärfung:
  `_template/referenzprozesse/RP-1-Systementwicklung/wiki/Marken-RP-1.md`
