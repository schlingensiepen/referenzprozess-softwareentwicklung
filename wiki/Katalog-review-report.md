---
type: catalog-entry
art: einzeltyp
---

# Katalog-review-report

Einzeltyp-Eintrag: Element-Typ `review-report`,
erweitert `agent-report` ([[Katalog-Agent-Berichte]]);
indexiert in der Fassade [[Agent-Berichte]].

### review-report

- **Zweck:** Prüfbericht einer Review-Runde — schreibt
  der Prüfer (Prüfer-Modell ≠ Bau-Modell); bei
  Gegen-Reviews je Befund der Vermerk „übersehen von
  REP-xxx"; Ergebnis der Kettenprüfung vor der
  Freigabe eines Pflicht-Stands ([[Kettenpruefung]]
  §Reviewer-Anteil)
- **Extends:** `agent-report`
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: review-report`,
  `bau_modell` (Modell, das die geprüfte Änderung
  schrieb — auch der koordinierende Agent bei eigenen
  Edits), `runde` (1–3), `vorgaenger` (Liste der
  Prüfberichte der vorigen Runde — Vorgänger ohne
  Ablösung, Definition im [[Katalog]]; in Runde 1
  `—`)
- **Beispielname:**
  `REP-012 — Pruefung-Katalog-Umstellung.md`
- **Kanonizität:** Header führt, Fassade spiegelt —
  die Felder stehen im Frontmatter des Berichts, der
  Eintrag in `wiki/Agent-Berichte.md` zeigt die
  Kurzform; `modell` ist das Prüf-Modell, kein eigenes
  Feld dafür — prüft der Anwender (Ersatzweg (b),
  `Reviewmuster.md` §2 Schleife 2), steht dort
  `anwender`.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Agent-Berichte]].
- **Lint:** jedes Ziel in `vorgaenger` existiert und
  ist vom Typ `review-report`; `modell` ↔ `bau_modell`
  machen die Zwei-Modelle-Regel prüfbar (C7 meldet,
  wenn beide dasselbe Modell nennen; kein Block).
