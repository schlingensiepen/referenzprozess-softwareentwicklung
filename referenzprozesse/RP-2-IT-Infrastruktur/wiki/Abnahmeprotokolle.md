---
type: acceptance-protocol-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Abnahmeprotokolle

**Ich bin neu in RP-2.** Diese Fassade entsteht mit der
Wahl von RP-2 (Wiki.md §11 Prozess-Teil-Wikis) — das
Register der Abnahmeprotokolle belegt die Abnahmen am
Ziel nach dem Ausrollen, je freigegebenem Deploy-Stand
einer Umgebung.

## Meta

- **Typ:** `acceptance-protocol-log` — Register aller
  Abnahmeprotokolle (ABN) dieses Repos. Singleton,
  ID-Präfix `ABN-NNN`.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Nachweis, eingefroren ab Anlage:** ein
  Abnahmeprotokoll wird nie abgelöst und nie geändert;
  Nachträge stehen als angehängte Vermerke oder als
  Dateien im Unterordner `nachweis/`
  ([[Einfrieren-und-Abloesen]] §Klassen, §Nachweis).
  **Eine neue Abnahme ist ein neuer Eintrag** — nach
  einem weiteren Deploy-Stand, einem neuen Tag oder als
  Wiederholung; Folge-Version und Nachtrag braucht es
  nicht.
- **Gegenstand:** die Abnahme **am Ziel nach dem
  Ausrollen** zu einem **freigegebenen Deploy-Stand**
  einer Umgebung ([[Katalog-Deploy-Stand]]) — je Testfall
  (TEST-ID) das Ergebnis `bestanden`, `nicht bestanden`
  oder `blockiert`, Ausführender (Mensch oder Agent),
  Zeit. Hinein gehört, was **erst nach dem Ausrollen am
  Ziel** prüfbar ist (Grundsatz nach dem Zeitpunkt,
  [[Vorgehen-RP-2]] §2 Anmerkung P10/P13); was vor der
  Freigabe des Deploy-Stands geprüft wird, steht im
  Testbericht ([[Testberichte]]), gleich wo. Ein nicht
  bestandener Testfall erzeugt einen Eintrag in
  [[Fehlermeldungen]] mit `gefunden_in:` auf dieses
  Abnahmeprotokoll und die TEST-ID.
- **Probe-Rücksicherung:** das Abnahmeprotokoll trägt
  den Beleg des geprüften Rückwegs — eine **durchgeführte
  Probe-Rücksicherung am Ziel** (was zurückgesichert
  wurde, wohin, Ergebnis). Sie ist Bedingung (b) des
  Inbetriebnahme-Tors ([[Vorgehen-RP-2]] §5) und steht
  in **jedem** Abnahmeprotokoll neu, auch zur
  Folge-Version nach einem kleinen Eingriff — dort in
  der Mindestform, die der Agent selbständig durchführt
  und hier verbucht ([[Vorgehen-RP-2]] §5 „Mindestform
  der Probe-Rücksicherung“); ein Verweis auf die Probe
  eines früheren Protokolls genügt nicht; ohne sie
  steht die Bedingung als Einschränkung mit Frist im
  Freigabe-Eintrag der Betriebs-Anleitung. Die Probe
  läuft **vor** der Anlage des Protokolls (es ist ab
  Anlage eingefroren); eine nachgeholte Probe steht in
  einem neuen Protokoll. Das Protokoll nennt die Form
  der Probe: Mindestform oder vollständige
  Rücksicherung. Ein
  Pflicht-Testfall „Wiederherstellung“ ist nicht
  verlangt — der Beleg genügt.
- **Herkunft:** Marke und Herkunft trägt das
  Abnahmeprotokoll im Kopf (Deploy-Stand mit Version,
  Tag des Rezepts, Zielumgebung) — Felder und Format:
  [[Einfrieren-und-Abloesen]] §Stand; lesen beim
  Anlegen. Die Herkunft ist zugleich die Angabe zur
  Reproduzierbarkeit.
- **Wofür es gebraucht wird:** die Freigabe der
  Betriebs-Anleitung der Umgebung hängt am
  Abnahmeprotokoll zum geltenden Deploy-Stand —
  Bedingung (a) des Inbetriebnahme-Tors
  ([[Katalog-Betriebs-Anleitung]] RP-2-Präzisierung;
  [[Kettenpruefung]] §Code-Glieder). Fehlt es, meldet
  das Prüfprogramm (`RP2-L3`, [[Vorgehen-RP-2]] §8). Bei
  kleinen Eingriffen (Ändern, Aktualisieren) genügt ein
  Abnahmeprotokoll je Umgebung ([[Vorgehen-RP-2]] §5,
  Kleine Eingriffe).
- **Nicht Bestandenes:** weist das Abnahmeprotokoll
  nicht bestandene oder blockierte Testfälle aus, legt
  der Agent die Freigabe der Betriebs-Anleitung trotzdem
  vor — mit dem Protokoll und den offenen BUG; der
  Anwender entscheidet ([[Berichten-statt-Blockieren]]);
  gibt er frei, nennt der Freigabe-Eintrag die offenen
  BUG als Einschränkung (wie beim Testbericht, ohne
  Frist). Fehlt dagegen die Probe-Rücksicherung, ist das
  eine fehlende Tor-Bedingung — Einschränkung mit Frist
  ([[Vorgehen-RP-2]] §5).
- **Eintragsformat:** `### ABN-NNN — <Abnahme>` mit
  Feldern Status (`angenommen` ab Anlage, ohne weitere
  Übergänge, [[Register-Lebenszyklus]]) / Datum /
  Marke / Umgebung / Deploy-Stand (mit Version) /
  Ausführender / Probe-Rücksicherung (durchgeführt am
  …, Mindestform oder vollständig / nicht
  durchgeführt) / Ergebnis kurz (bestanden,
  nicht bestanden, blockiert je Anzahl) / Detail
  (Wikilink).
- **`acceptance-protocol`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Abnahmeprotokolle]] —
  lesen beim Anlegen eines `acceptance-protocol`-Knotens.
  Sektionen: Abnahme (wer, wann, Umgebung, Deploy-Stand)
  / Ergebnisse je TEST-ID / Probe-Rücksicherung /
  Fehlermeldungen (erzeugte BUG) / Vermerke (append-only)
  / Bezüge (Fassaden-Eintrag [[Abnahmeprotokolle]]).
  Dateiname `ABN-NNN <Abnahme>.md`.

---

**Bearbeitungsstand:** _(vom Agenten bei jeder Abnahme am
Ziel gepflegt)_

## Abnahmeprotokolle

_(chronologisch nach ID; vom Agenten bei der ersten
Abnahme gefüllt)_
