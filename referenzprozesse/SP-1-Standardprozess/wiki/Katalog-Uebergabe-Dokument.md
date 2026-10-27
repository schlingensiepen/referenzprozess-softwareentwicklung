---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Übergabe-Dokument

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: das
Übergabe-Dokument ohne Lesezugriff als selbsttragende
Ableitung aus dem Übergabe-Stand (Kennung
`uebergabe-dokument`), für eine Komponente, die das
Wiki des Koordinators nicht lesen kann. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### uebergabe-dokument

- **Zweck:** die Komponente K startet ihren eigenen
  Prozess, ohne das Wiki des Koordinators lesen zu
  können.
- **Phase:** —
- **Verbindlichkeit:** optional (nur auf Anlass)
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: die Freigabe des
  Übergabe-Stands an K ([[Katalog-Uebergabe]]), wenn K
  keinen Lesezugriff auf das Wiki des Koordinators
  hat.
- **Quell-Register und Filter:** Quell-Stand ist der
  freigegebene Übergabe-Stand an K; die Marke wird aus
  seiner Herkunftszeile geerbt. Enthält, was der
  Übergabe-Stand verweist und kopiert, ohne Verweise
  ins Wiki.
- **Pflichtfelder:** `type: uebergabe-dokument`,
  `marke`, `quell_stand` (Herkunftszeile:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`). Wird
  nie von Hand nachgezogen, sondern neu abgeleitet
  (MasterPrompt §9.6).
