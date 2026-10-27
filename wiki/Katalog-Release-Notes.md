---
type: catalog-entry
art: dokumenttyp
---

# Katalog-Release-Notes

Dokumenttyp-Eintrag: Release-Notes als selbsttragende
Ableitung aus dem Abschluss-Stand (Kennung
`release-notes`). Sie zeigen den Zuwachs einer Marke
gegenüber der Vormarke; der Stand selbst ist ein
Voll-Stand ([[Einfrieren-und-Abloesen]] §Stand).

### release-notes

- **Zweck:** den Zuwachs der Marke gegenüber der
  Vormarke nach außen zeigen — für Nutzer, Kunden
  oder die Auslieferung.
- **Phase:** —
- **Verbindlichkeit:** optional
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: der freigegebene
  Abschluss-Stand ([[Katalog-Abschluss-Stand]]). Ein
  Nachtrag zu einer abgeschlossenen Marke — ein weiterer
  Deploy-Stand mit seiner Freigabe ([[Zielmarken]]
  §Meta, Nachtrag) — ist kein Auslöser: Release-Notes
  beschreiben das Produkt, nicht die Auslieferung; aus
  einem Nachtrag entsteht keine neue Version der
  Release-Notes der Marke.
- **Quell-Register und Filter:** Quell-Stand ist der
  Abschluss-Stand der Marke; daraus die Anforderungen
  (REQ), die der Abschluss-Stand dieser Marke über
  seine Stände erfasst und der Abschluss-Stand der
  Vormarke nicht (der Zuwachs; die Stände selbst sind
  Voll-Stände) — die neuen Funktionen (REQ mit
  `requirement_type: functional` oder
  `non-functional`) — auch eine REQ, die einen BUG
  behebt (`behebt:`), steht hier als das, was sie ist.
  Getrennt davon der Teil **Fehlerbehebungen**:
  Fehlermeldungen (BUG) erfasst kein Stand der Kette,
  und die `zielmarke:` eines BUG ist die Marke seiner
  Meldung (= Marke des Produkt-Stands, an dem der Fehler
  beobachtet wurde), nicht der Behebung; sie ist kein
  Filter. Die
  Fehlerbehebungen sind die BUG unter der Marke jeder
  Anforderung, die ihre Liste `fix_requirement:` nennt
  — der Fix-Anforderung (REQ mit `requirement_type:
  fix`, Abschnitt „Fehlerbehebungen“ der Fassade
  `Anforderungen.md`, vom Prozess mitgebracht) oder der
  ablösenden bzw. neuen REQ (`functional` oder
  `non-functional`): jede Anforderung im Zuwachs mit
  `behebt:` mit den BUG, die sie behebt, getrennt von
  den neuen Funktionen; eine ablösende oder neue REQ
  steht in beiden Teilen. Ein BUG ohne
  `fix_requirement:` erscheint nicht. Nennt die Liste
  mehrere Anforderungen — ein Workaround in einer
  Sackgasse und später der echte Fix in der regulären
  Linie —, steht der BUG in den Release-Notes der
  Sackgasse als **Workaround** und in denen der
  regulären Marke als **Behebung**; die Kennzeichnung
  folgt der Frage, ob die Anforderung, unter der er
  steht, ihn für seine Linie behebt: für einen BUG der
  regulären Linie ist eine Anforderung der Sackgasse
  (Zeile `Zwischenmarke: Sackgasse` am Marken-Eintrag,
  [[Zielmarken]] §Meta) ein Workaround, eine Anforderung
  der regulären Linie die Behebung. Behebt allein
  eine Sackgasse einen BUG der regulären Linie — die
  Liste nennt nur Anforderungen mit ihrer `zielmarke:`
  —, führen ihn die Release-Notes der Sackgasse ebenso
  als Workaround, auch wenn kein echter Fix folgt; die
  Release-Notes der regulären Linie führen ihn nicht,
  solange keine Anforderung der regulären Linie ihn
  behebt. Ein BUG mit der Marke der Sackgasse — am Stand
  der Sackgasse beobachtet, ein Fehler des Workarounds
  —, den eine Anforderung der Sackgasse behebt, steht in
  ihren Release-Notes als **Behebung**: er ist für seine
  Linie behoben (SP-1 `Fehlermeldungen.md` §Meta
  „Zielmarke“).
  Ein am ausgelieferten Stand von `2.0` beobachteter
  BUG (`zielmarke: 2.0`), behoben in der vorgezogenen
  Zwischenmarke `2.0.1`, steht in den Release-Notes von
  `2.0.1`; behoben in `2.1`, in denen von `2.1`. Einen
  BUG, den eine **Fix-Anforderung auf einen Deploy**
  behebt (ein Fehler in der Auslieferung, nicht im
  Produkt; `zielmarke: 2.0`, Umsetzung ein weiterer
  Deploy-Stand derselben Umgebung, nach dem Abschluss
  im Nachtrag zu `2.0`; SP-1 `Anforderungen.md`
  „Fehlerbehebungen“), führen **keine** Release-Notes —
  weder die von `2.0` noch die einer Folge-Marke: am
  Produkt hat sich nichts geändert, und Release-Notes
  beschreiben das Produkt. Die Ableitung lässt eine
  Anforderung mit `requirement_type: fix` und
  `umgebung:` aus; der Nachtrag ist kein Auslöser
  (oben). Dokumentiert ist diese Behebung im Nachtrag
  am Marken-Eintrag ([[Zielmarken]] §Meta, Nachtrag)
  und am BUG (`fix_requirement:`); der Fehlerstand
  führt ihn mit seinem Status (SP-1
  `Katalog-Fehlerstand.md`). Beide Teile
  kommen so über die Stände der Kette; ein eigener
  Filter über das BUG-Register entfällt. Die Marke
  wird aus der Herkunftszeile des Abschluss-Stands
  geerbt.
- **Pflichtfelder:** `type: release-notes`, `marke`,
  `quell_stand` (Abschluss-Stand mit Version;
  Herkunftszeile: [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** darf im Produkt liegen (Code-Repo bzw.
  Auslieferung), weil sie keine Verweise ins Wiki
  braucht; sonst `output/`. Wird nie von Hand
  nachgezogen, sondern neu abgeleitet (MasterPrompt
  §9.6).
