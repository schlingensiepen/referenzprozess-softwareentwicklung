---
type: catalog-entry
art: register
process: RP-2
---

# Katalog-Abnahmeprotokolle

**Ich bin neu in RP-2.** Register-Eintrag: Fassade
`acceptance-protocol-log` ([[Abnahmeprotokolle]]) mit
Element-Typ `acceptance-protocol` — das zweite
Nachweis-Register neben [[Katalog-Testberichte]] (SP-1).
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### acceptance-protocol-log

- **Zweck:** Register aller Abnahmeprotokolle dieses
  Repos (Abnahmen am Ziel nach dem Ausrollen, je
  freigegebenem Deploy-Stand einer Umgebung)
- **Pflichtfelder:** `type: acceptance-protocol-log`
- **Präfix:** `ABN`
- **Datei:** `wiki/Abnahmeprotokolle.md`
- **Singleton**
- **Kanonizität:** kanonisch für die Kurzform aller
  ABN-Einträge (Wiki.md §1.1a); ein ABN ist Nachweis,
  eingefroren ab Anlage.

### acceptance-protocol

- **Zweck:** Ergebnis einer Abnahme am Ziel zu einem
  freigegebenen Deploy-Stand einer Umgebung, je
  TEST-ID, mit dem Beleg der Probe-Rücksicherung
  (Detail-Knoten zum ABN-Eintrag im Register)
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: acceptance-protocol`, `id`
  (Format `ABN-NNN`), `status` (`angenommen` ab Anlage,
  ohne weitere Übergänge; [[Register-Lebenszyklus]]),
  `status_date`, `marke` (geerbt aus dem Deploy-Stand;
  ein BUG aus diesem Protokoll trägt sie als Marke der
  Meldung, [[Katalog-Fehlermeldungen]]), `umgebung`
  (Name aus [[Zielumgebungen]]), `herkunft` (Liste:
  Deploy-Stand mit Version, Tag des Rezepts; Inhalt und
  Format: [[Einfrieren-und-Abloesen]] §Stand), `datum`,
  `ausfuehrender` (`mensch` oder `agent`, bei Mensch der
  Name), `probe_ruecksicherung` (`ja` mit Datum und
  Form — `ja 2026-11-12 (mindestform)` oder
  `ja 2026-11-12 (vollstaendig)` — oder
  `nein` — der Beleg des geprüften Rückwegs für das
  Inbetriebnahme-Tor, in jedem Protokoll neu, auch zur
  Folge-Version; die Mindestform, die der Agent
  selbständig durchführt, zählt als `ja`: `## Meta` von
  [[Abnahmeprotokolle]], [[Vorgehen-RP-2]] §5)
- **Optional:** `alias` (Liste; Wiki.md §4.1),
  `journal` (Liste der JNL-Einträge der Läufe, die
  abgenommen wurden, [[Katalog-Betriebsjournal]])
- **Beispielname:** `ABN-001 Abnahme Dateidienst Produktion.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Abnahmeprotokolle.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Abnahmeprotokolle]].
- **Nachweis wächst nur:** ein Abnahmeprotokoll wird
  nach der Anlage nie geändert, nur ergänzt — durch
  einen angehängten, datierten Vermerk oder durch
  Dateien im Unterordner `nachweis/` neben dem Protokoll
  (Logauszüge, Screenshots; nur hinzufügen, nie
  überschreiben oder löschen). Eine weitere Abnahme ist
  ein neues Abnahmeprotokoll ([[Einfrieren-und-Abloesen]]
  §Nachweis).
- **Grundsatz nach dem Zeitpunkt:** hinein gehört, was
  erst nach dem Ausrollen am Ziel prüfbar ist; was vor
  der Freigabe des Deploy-Stands geprüft wird, gehört in
  den Testbericht, auch wenn es am Ziel geprüft wird
  ([[Vorgehen-RP-2]] §2 Anmerkung P10/P13). Der Prüfort
  eines Testfalls ([[Katalog-Testfaelle]]
  RP-2-Präzisierung) entscheidet das nicht.
- **Vorbedingung:** das Abnahmeprotokoll zum geltenden
  Deploy-Stand ist Vorbedingung der Freigabe der
  Betriebs-Anleitung derselben Umgebung
  ([[Katalog-Betriebs-Anleitung]] RP-2-Präzisierung;
  [[Kettenpruefung]] §Code-Glieder).
