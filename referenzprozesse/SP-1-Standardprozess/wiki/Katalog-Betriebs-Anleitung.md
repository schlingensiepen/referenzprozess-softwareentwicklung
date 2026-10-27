---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Betriebs-Anleitung

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: die
Betriebs-Anleitung als selbsttragende Ableitung aus
dem Deploy-Stand (Kennung `betriebs-anleitung`), für
Menschen, die das Produkt ohne Wiki-Zugang betreiben.
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert.

### betriebs-anleitung

- **Zweck:** Installation und Betrieb in einer
  Umgebung so beschreiben, dass ein Fremder sie
  ausführen kann (Verständnis-Check „Kann ein Fremder
  ausführen?“ vor der Veröffentlichung).
- **Phase:** —
- **Verbindlichkeit:** optional
- **Grad:** selbsttragend
- **Auslöser:** Standard — die Freigabe des
  Deploy-Stands „für P11 Ausliefern“
  ([[Katalog-Deploy-Stand]]) oder Zuruf.
- **Quell-Register und Filter:** Quell-Stand ist der
  freigegebene Deploy-Stand der Umgebung; die Marke
  wird aus seiner Herkunftszeile geerbt. Enthält
  alles, was zur Ausführung nötig ist, ohne Verweise
  ins Wiki; den Zuwachs gegenüber der Vormarke zeigen
  die Release-Notes.
- **Pflichtfelder:** `type: betriebs-anleitung`,
  `marke`, `quell_stand` (Deploy-Stand mit Version;
  Herkunftszeile: [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `docs/ops/` im Produkt
  (Ableitungs-Schicht; die Wahrheit bleibt im Wiki).
  Wird nie von Hand nachgezogen, sondern vollständig
  neu abgeleitet (MasterPrompt §9.6).
