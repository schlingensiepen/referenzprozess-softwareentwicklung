---
type: process-procedure
process: RP-2
extends: [SP-1]
---

# RP-2 — Marken (IT-Infrastruktur)

**Bearbeitungsstand:** 2026-11-11

## 1. Erbschaft

RP-2 erbt das Marken-Dokument von SP-1 ([[Marken-SP-1]];
Basis: [[Marken]]) und schärft es für Anlagen: Was eine
Marke ist, abschließt und wann eine neue beginnt, steht
dort; hier stehen die **Arten** einer RP-2-Marke, der
Unterschied zwischen Rezept und Umgebung und der Ablauf
des Abbaus.

## 2. Typische Marke und Marken-Arten

Die Marke einer Anlage ist ein **Zustand, den die Anlage
erreicht** — ihr Produkt ist das Rezept der Phase P9
([[Vorgehen-RP-2]] §2, Anmerkung P9), markiert durch den
Tag des Rezepts; je Zielumgebung hält ein Deploy-Stand
fest, was dort gilt. Jede RP-2-Marke hat eine **Art**,
die der Agent beim Anlegen vorschlägt und die im Namen
oder in der Begründung der Marke steht — **kein Feld
`art:`** (das wäre eine Änderung der Basis):

| Art | Wofür | Typische Marke | Kern |
|---|---|---|---|
| **Aufbauen** | neue Anlage oder neuer Dienst | „Dienst X produktiv“ | P1–P15 |
| **Ändern** | Erweiterung, Härtung, Umbau | „Zugänge gehärtet“ | P3, P8–P10, P13, P15 (Folge-Version); P7 bei neuer Technologie; Rest übernommen |
| **Aktualisieren** | neue Fremd-Version, OS-Upgrade, neuer Pin | „Version N ausgerollt“ | P7 (neuer Pin), P9, P10, P13, P15 (Folge-Version); Rest übernommen |
| **Abbauen** | Umzug der Inhalte, Abschaltung | „Quelle abgebaut“ | Re-Inventur (P2), Tag der Rückbau-Skripte (P9), Testplan und Testbericht der Verifikation (P10), Deploy-Stand „abgebaut“ mit Abschalt-Tor (P13) — §4 |

Welche Phasen je Art Pflicht sind, zeigt die Matrix in
[[Vorgehen-RP-2]] §3; der Agent schlägt je Art Verzichte
(Verzichts-Entscheidung je Marke) und Übernahmen aus der
Vormarke vor, der Anwender entscheidet. Erste Marke:
nach dem Einstieg „Bestand erfassen“ ([[Vorgehen-RP-2]]
§4) in der Regel „Aufbauen“ oder „Ändern“; Benennung
nennt der Anwender, der Agent schlägt „1.0“ vor
([[Marken-SP-1]] §2).

## 3. Rezept oder Umgebung

- **Ändern und Aktualisieren ändern das Rezept:** neuer
  Tag und **Folge-Versionen** von Testplan, Deploy-Stand
  und Betriebs-Anleitung wie in SP-1 ([[Kettenpruefung]]
  §Kette, Folge-Marke mit eigenem Tag). Bei
  Aktualisieren ist auch die Spezifikation betroffen,
  wenn sie die Fremd-Version nennt: nach dem Pin-Wechsel
  ist sie überholt und wird Folge-Version — das ist die
  Lesart von „Ü, sofern nicht überholt“ in der Matrix;
  nennt sie keine Version, bleibt sie übernommen.
- **Ändert sich nur die Umgebung,** nicht das Rezept
  (andere Parameter, neuer Host), ist das keine neue
  Marke, sondern ein **weiterer Deploy-Stand**
  derselben Marke oder, nach dem Abschluss, ein
  **Nachtrag** ([[Marken-SP-1]] §3; [[Zielmarken]] §Meta,
  Nachtrag).
- **Erneutes Ausrollen ohne Änderung ist Betrieb:** kein
  Stand, keine Freigabe, nur ein Eintrag im
  [[Betriebsjournal]].
- **Eine Störung, die eine Änderung verlangt,** erzeugt
  eine Fix-Anforderung ([[Fehlermeldungen]]) und damit
  eine Marke der Art Ändern; eine Fehlerbehebung nach
  dem Abschluss ist eine Patch-Marke ([[Marken-SP-1]] §3).

## 4. Abbauen

Die Marken-Art Abbauen nutzt die vorhandenen Phasen —
keine eigene Phase, kein eigener Dokumenttyp:

1. **Re-Inventur (P2):** Bestandsbericht der Umgebung
   vor dem Abbau ([[Vorgehen-RP-2]] §2 Anmerkung P2);
   zugleich Wächter-Anlass W2 vor destruktiven Schritten
   ([[Vorgehen-RP-2]] §8).
2. **Rückbau-Skripte (P9):** Tag des Rezepts, das den
   Abbau ausführt (Umzug der Inhalte, Abschaltung).
3. **Verifikation (P10):** Testplan mit den
   Verifikations-Testfällen — Trockenlauf, Prüfsumme
   gegen das Ziel, Pre-Flight am Ziel (Dienste, Ports,
   Zeitpläne, Namensauflösung) — und der Testbericht als
   Nachweis. Alle sind vor der Freigabe prüfbar, deshalb
   Testbericht nach dem Grundsatz nach dem Zeitpunkt
   ([[Vorgehen-RP-2]] §2 Anmerkung P10/P13), keine
   Ausnahme.
4. **Deploy-Stand „abgebaut“ (P13)** je Umgebung, Zweck
   „für P13 Ausliefern“ — ausgeliefert wird der Abbau.
   Er hält fest, dass in der Umgebung **nichts mehr
   gilt**, und führt **keine Deployment-Einträge**
   ([[Katalog-Deploy-Stand]] RP-2-Präzisierung). Die
   Zielumgebung bekommt den **Zustand `abgebaut`** mit
   Datum ([[Katalog-Zielumgebungen]] RP-2-Präzisierung);
   das Prüfprogramm achtet darauf, dass beides zusammen
   gesetzt ist (L7B), und meldet eine abgebaute
   Zielumgebung mit einem Deployment-Eintrag, der weder
   abgelöst noch abgeschlossen ist, als FEHLER (L7A;
   [[Vorgehen-RP-2]] §8).
5. **Verzichte:** P11 und P12 per Verzicht je Phase, P15
   per Verzicht je abgebauter Umgebung; die
   Betriebs-Anleitung der Umgebung ist mit dem Abbau
   gegenstandslos ([[Kettenpruefung]] §Fehlende und
   vertretene Glieder).

**Abschalt-Tor** — Bedingung der Freigabe des
Deploy-Stands „abgebaut“ (keine eigene Freigabe):
Verifikation bestanden, Re-Inventur vom selben Tag,
Vorab-Sicherung benannt — Bedingungen und Belege im
führenden Ort [[Vorgehen-RP-2]] §5 „Abschalt-Tor“. Der
Journal-Eintrag des Abschalt-Laufs nennt die
Vorab-Sicherung später im Feld `vorab_sicherung`
([[Betriebsjournal]]). Eine große Datenmenge beim Umzug
ist ein eigenes Datenmigrations-Projekt (RP-6); RP-2
baut danach ab.

## 5. Benennung

Versions-artig wie SP-1 („1.0“, „1.1“, Patch „1.1.1“)
oder sprechend nach dem erreichten Zustand („Dienst X
produktiv“, „Quelle abgebaut“); die Marke ist nicht die
Version der Fremd-Software, die das Rezept pinnt, und
nicht die Version eines Stands ([[Zielmarken]] §Meta,
Abgrenzungen). Innerhalb einer Marke kann es mehrere
Tags geben (Korrektur vor dem Marken-Wechsel: neuer Tag
mit neuer Freigabe, die die alte ablöst — wie
[[Marken-SP-1]]).

## 6. Bezüge

- SP-1-Marken (direkte Erbschaft): [[Marken-SP-1]];
  Basis: [[Marken]]
- Phasen, Matrix, Tore, Prüfungen: [[Vorgehen-RP-2]]
- Register und Abgrenzungen: [[Zielmarken]] §Meta
- Kette, Folge-Version, Verzicht: [[Kettenpruefung]]
- Deploy-Stand „abgebaut“: [[Katalog-Deploy-Stand]];
  Zustand der Zielumgebung: [[Katalog-Zielumgebungen]]
