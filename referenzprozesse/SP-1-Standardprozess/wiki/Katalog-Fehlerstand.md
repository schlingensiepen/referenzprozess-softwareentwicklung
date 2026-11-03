---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Fehlerstand

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
optionale Stand „Fehlerstand zu Marke M“ (Kennung
`fehlerstand`), abgeleitet aus dem BUG-Register
([[Katalog-Fehlermeldungen]]). Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### fehlerstand

- **Zweck:** frei, vom Anwender benannt — in der Regel
  „für die Entscheidung über die Auslieferung“: welche
  Fehler zur Marke bekannt, behoben, offen oder
  verschoben sind.
- **Phase:** —
- **Verbindlichkeit:** optional
- **Grad:** wiki-verweisend
- **Auslöser:** Angebots-Auslöser: der Agent bietet
  den Stand vor P13 Ausliefern an (vor der Freigabe
  des ersten Deploy-Stands der Marke); sonst auf
  Zuruf (Prüfung eines optionalen Stands:
  [[Kettenpruefung]] §Regel).
- **Quell-Register und Filter:** [[Fehlermeldungen]] —
  die BUG, die nach der Marken-Regel für die Marke M
  gelten, allein über die Marke der Meldung
  ([[Einfrieren-und-Abloesen]] §Stand): jeder BUG, dessen
  `zielmarke:` M oder eine frühere Marke der
  Vormarken-Kette nennt (die Marke der Meldung: die
  Marke des Produkt-Stands, an dem der Fehler beobachtet
  wurde, [[Fehlermeldungen]] §Meta; ein BUG, der am
  Stand einer Sackgasse beobachtet wurde, gilt nur für
  sie und steht in keinem Fehlerstand der regulären
  Linie), Bestands-BUG
  ohne Feld eingeschlossen — in allen Zuständen,
  gruppiert nach Status (der Stand ist ein Voll-Stand).
  „Zu M behoben“ ist kein zweiter Filter: ein zu M
  behobener BUG gilt für M, weil seine Marke der Meldung
  nicht nach der Marke der Behebung liegt; ein am Stand
  von `2.0` beobachteter und in der Zwischenmarke
  `2.0.1` behobener BUG steht im Fehlerstand zu `2.0.1`
  wie in dem zu `2.1`. Ein offener BUG aus `2.0` steht so
  im Fehlerstand zu `2.1`. „Steht im Fehlerstand zu M“
  heißt: gehört nach diesem Filter dazu — ein schon
  gebildeter Fehlerstand einer abgeschlossenen Marke
  bleibt unverändert, der BUG wirkt in den
  Fehlerständen späterer Marken; der Pflicht-Ort der
  Entscheidung über offene BUG früherer Marken ist der
  Vollständigkeits-Scan des Marken-Wechsels
  ([[Zielmarken]] §Meta, Schritt 1), der Fehlerstand
  bleibt das optionale Angebot. Ein BUG der regulären
  Linie, den allein eine
  Sackgasse behebt, steht im Fehlerstand der regulären
  Marke als offener BUG — mit seinem Status und der
  Sackgassen-Anforderung aus `fix_requirement:` als
  **Workaround** gekennzeichnet, nicht als Behebung
  ([[Fehlermeldungen]] §Meta „Zielmarke“). Ein BUG, den
  eine Fix-Anforderung auf einen Deploy behebt (Fehler
  in der Auslieferung, [[Anforderungen]]
  „Fehlerbehebungen“), steht hier wie jeder BUG seiner
  Marke mit seinem Status — der Fehlerstand und der
  Nachtrag am Marken-Eintrag zeigen diese Behebung;
  Release-Notes führen ihn nicht
  ([[Katalog-Release-Notes]]). Mit Herkunft
  aus Tests (`gefunden_in:` auf Testbericht und
  TEST-ID), soweit vorhanden.
- **Pflichtfelder:** `type: fehlerstand`, `marke`,
  `zweck`, `herkunft`, `datum` (seit 2.0) (Herkunftszeile:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
