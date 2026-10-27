---
type: catalog-entry
art: einzeltyp
---

# Katalog-convergence-report

Einzeltyp-Eintrag: Element-Typ `convergence-report`,
erweitert `agent-report` ([[Katalog-Agent-Berichte]]);
indexiert in der Fassade [[Agent-Berichte]].

### convergence-report

- **Zweck:** Konvergenz-Bericht einer Review-Kette —
  schreibt der Koordinator, nur wenn nach der
  Runden-Obergrenze keine Reife erreicht ist;
  Eskalations-Ausgang an den Anwender
- **Extends:** `agent-report`
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: convergence-report`,
  `runden` (Anzahl der durchlaufenen Runden),
  `ampel_beginn` (Ampel zu Beginn der Kette),
  `berichte` (Liste aller `review-report` der Kette)
- **Beispielname:**
  `REP-015 — Konvergenz-Katalog-Umstellung.md`
- **Kanonizität:** Header führt, Fassade spiegelt —
  die Felder stehen im Frontmatter des Berichts, der
  Eintrag in `wiki/Agent-Berichte.md` zeigt die
  Kurzform.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Agent-Berichte]].
- **Hinweis:** `ampel` (geerbt) ist die Ampel am Ende
  der Kette.
- **Lint:** jedes Ziel in `berichte` existiert und ist
  vom Typ `review-report`.
