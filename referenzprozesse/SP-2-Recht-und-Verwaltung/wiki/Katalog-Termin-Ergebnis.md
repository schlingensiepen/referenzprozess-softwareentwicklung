---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Termin-Ergebnis

Dokumenttyp-Eintrag von SP-2: der selbsttragende
Pflicht-Stand „Termin-Ergebnis zu Marke M“ am Glied
**„Termin auswerten“** (Kennung `termin-ergebnis`) —
ein Glied **ohne Phasennummer** nach P13 und vor dem
Marken-Abschluss ([[Kettenpruefung]] §Kette, Glieder
ohne Phasennummer; `Vorgehen.md` §8), **nicht
verzichtbar**, nur bei einer Termin-Marke
([[Marken-SP-2]] §7). Beim Prozess-Merge (Wiki.md
§11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### termin-ergebnis

- **Zweck:** „für den Marken-Abschluss“ — die
  Termin-Marke darf abgeschlossen werden, weil das
  Ergebnis des Termins festgehalten, das Protokoll
  geprüft und die Fristen und Erwartungen aus dem Termin
  gezogen sind.
- **Phase:** —
- **Verbindlichkeit:** pflicht
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: der **Termin hat
  stattgefunden** (Erklärung im Termin als Einreichung
  gebucht, P13); Bildung sofort nach dem Termin,
  Freigabe, sobald das Protokoll als Eingangsdokument
  eingelesen und auf Richtigkeit geprüft ist. Die
  **Fristen und Erwartungen aus dem Termin** legt der
  Agent nicht erst mit dem Stand, sondern **im selben
  Zug nach dem Termin** aus dem Termins- bzw.
  Vertretungsbericht in [[Fristen]] an — sie laufen ab
  dem Termin bzw. der Verkündung (nachgelassene
  Schriftsatzfrist, Widerrufsfrist eines Vergleichs,
  Stellungnahmefristen); fehlt das Protokoll, dazu eine
  Erwartung „Protokoll“ (Frist `für-uns`,
  [[Marken-SP-2]] §7). Nicht
  verzichtbar — ohne dieses Glied blieben Anträge zu
  Protokoll, Protokoll und Fristen aus dem Termin ohne
  Wächter.
- **Quell-Register und Filter:** der Termins- bzw.
  **Vertretungsbericht** an den Anwender (wer war da,
  was wurde erklärt, Hinweise der Stelle, Eindruck); das
  **Protokoll** als Eingangsdokument und Nachweis der
  Erklärung im Termin ([[Eingangsdokumente]]), auf
  Richtigkeit geprüft, bei Bedarf Antrag auf
  Berichtigung als Begleitantrag; Vergleich
  (Widerrufsfrist als Frist, Richtung je nach Seite),
  verkündete Beschlüsse und Hinweise; **Fristen und
  Erwartungen aus dem Termin** ([[Fristen]]:
  nachgelassene Schriftsatzfrist, Stellungnahmefristen,
  Verkündungstermin als Erwartung, Auflagen); Abgleich
  mit Strategie und Eventualplänen ([[Strategie]]:
  ausgelöste Pläne, Linie ändern?). Alles **kopiert**
  (der Anwender liest den Bericht ohne Wiki);
  Verständnis-Check M6 (`Reviewmuster.md`).
- **Pflichtfelder:** `type: termin-ergebnis`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `verfahren`, `termin`, `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); je
  Termin eine Ketten-ID.
- **Pflicht ab Stufe:** 1 (nur Termin-Marke), nicht
  verzichtbar.
- **Entfällt abgeleitet, wenn:** die Marke keine
  Termin-Marke ist.
- **Herkunft:** `herkunft` führt zusätzlich den Tag der
  Termin-Vorbereitung und die Einreichung
  (`muendlich-termin`), auf die das Ergebnis folgt.
- **Wächter:** ein Termin ohne Terminsbericht und ohne
  die Fristen aus dem Termin ist ein Befund
  (`SP2-TERMIN`, [[Vorgehen-SP-2]] §8).
- **Vertraulichkeit:** `intern`; der Abgleich mit der
  Strategie `streng-intern` nach den Quellen.
