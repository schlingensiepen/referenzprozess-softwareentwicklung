---
type: process-procedure
process: RP-1
extends: [SP-1]
---

# RP-1 — Marken (Softwaresystem-Entwicklung)

**Bearbeitungsstand:** 2026-10-25

## 1. Erbschaft

RP-1 erbt das Marken-Dokument von SP-1
([[Marken-SP-1]]; Basis: [[Marken]]) und schärft es
für Softwaresysteme.

## 2. Typische Marke

Die Marke eines Softwaresystems ist ein **Release**:
eine Ausbaustufe des Systems, die ausgeliefert oder
deployt wird. Ihr Produkt ist der Code mit Unit- und
automatisierten Integrationstests ([[Vorgehen-RP-1]]
§2, Zeile P9), markiert durch den Tag der
Implementierung im Repo, das den Code trägt
([[Vorgehen-RP-1]] §3). Erste Marke: „1.0“ (Vorschlag
des Agenten beim Init, Benennung z.B. „Erster
Release“). Beim Koordinator ist die Marke der Release
des Gesamtsystems; die Komponenten liefern ihre Tags zu
dieser Marke ([[Vorgehen-RP-1]] §8).

## 3. Benennung: Marke ist nicht Produkt-Version

Die Marke „1.1“ und die Produkt-Version „v1.1.0“ sind
zwei Dinge ([[Zielmarken]] §Meta, Abgrenzungen): die
Marke ordnet Stände, Freigaben und Abschluss-Stand; die
Produkt-Version ist der Tag-Name nach der
Tag-Konvention in `wiki/Facts.md` §Allgemeine Fakten
([[Vorgehen-RP-1]] §3). Innerhalb einer Marke kann es
mehrere Tags geben (eine Tag-Korrektur vor dem
Marken-Wechsel ist ein neuer Tag mit neuer Freigabe, die
die alte ablöst — [[Vorgehen-RP-1]] §3; nach dem Wechsel
bei unverändertem Code ein Nachtrag „Tag korrigiert“ am
Marken-Eintrag, der die neue Tag-Freigabe zu derselben
Marke enthält, die alte bleibt stehen — [[Zielmarken]]
§Meta, Nachtrag); ein übernommener Tag der Vormarke gilt
für die Folge-Marke weiter, wenn der Code unverändert
ist ([[Kettenpruefung]] §Kette, Übernahme des Tags).
Der Tag einer Zwischenmarke sitzt auf ihrem eigenen
Zweig ab dem Tag der Vormarke; die Zweig-Konvention
steht in `wiki/Facts.md` neben der Tag-Konvention
([[Zielmarken]] §Meta, Zwischenmarke — Tag und
Produkt-Repo).
Release-Notes zu einer Marke entstehen aus ihrem
Abschluss-Stand ([[Katalog-Release-Notes]]).

## 4. Schnitt

Neuer Release, neue Marke; ein Hotfix nach dem
Abschluss ist eine Patch-Marke („2.0.1“) mit eigenem
Tag und Abschluss-Stand; ein Deploy desselben Tags in
eine weitere Zielumgebung ist ein Nachtrag an der
abgeschlossenen Marke, kein neuer Release
([[Marken-SP-1]] §3). Das Marken-Dokument legt keine
Release-Kadenz fest; die Marke folgt dem Ergebnis,
nicht dem Kalender.

## 5. Bezüge

- SP-1-Marken (direkte Erbschaft): [[Marken-SP-1]];
  Basis: [[Marken]]
- Produkt, Tag und Tag-Freigabe: [[Vorgehen-RP-1]]
  §2, §3, §8
- Register und Abgrenzungen: [[Zielmarken]] §Meta
- Kette und Übernahme: [[Kettenpruefung]] §Kette
