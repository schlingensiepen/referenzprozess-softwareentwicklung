---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Anlagen

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`exhibit-log` ([[Anlagen]]) mit Element-Typ `exhibit`
(Schlüssel Verfahren + externe Nummer nach dem Schema
des Verfahrens, kein Präfix). Beim Prozess-Merge
(Wiki.md §11.3) wird dieser Eintrag als Datei ins
Anwender-`wiki/` kopiert und in [[Katalog]] verankert.

### exhibit-log

- **Zweck:** Register aller Anlagen je Verfahren —
  Nummernvergabe nur hier, fortlaufend ohne
  Wiederverwendung; im Entwurf temporäre IDs `temp-`,
  endgültige lückenlose Nummern beim Tag
- **Pflichtfelder:** `type: exhibit-log`
- **Präfix:** `—` (Schlüssel ist die externe Nummer
  nach dem Schema des Verfahrens)
- **Datei:** `wiki/Anlagen.md`
- **Singleton**
- **Pflicht ab:** Stufe 1

### exhibit

- **Zweck:** eine Anlage — ein Dokument oder Ding, das
  in einem Schriftsatz unter einer Nummer eingeführt
  wird; Quelle mit Prüfsumme, Beweisthema, Form,
  Verwendung (Detail-Knoten zum Eintrag im Register,
  Kategorie a mit Inline-Einträgen zulässig)
- **Klasse:** Element
- **Freeze ab:** angenommen (mit der Freigabe des
  Einreichungs-Stands; nach der Einreichung ist die
  Nummer unveränderlich)
- **Sammelzustand:** offen
- **Pflichtfelder:** `type: exhibit`, `verfahren`
  (String-Slug des `case`-Knotens), `nummer` (externe
  Nummer nach `anlagen_schema` des Verfahrens; im
  Entwurf `temp-<slug>`, projektweit eindeutig),
  `status` (`offen` | `angenommen` | abgelöst;
  [[Einfrieren-und-Abloesen]] §Eintrittsregel),
  `status_date`, `datum`, `zielmarke`, `quelle`
  (String-Slug des Dokuments oder Dings, das die
  Anlage ist), `pruefsumme` (Prüfsumme der Datei;
  bei `aktenverweis` entfällt sie), `verwendung`
  (`geplant` | `eingefuehrt` | `zurueckgenommen` |
  `ersetzt`; Zustands-Achse am eingefrorenen Element)
- **Empfohlen:** `schriftsatz` (String-Slug des
  Schriftsatzes, in dem die Anlage eingeführt wird,
  [[Schriftsaetze]]), `beweisthema` (ein Satz; Verweis
  auf TAT-ID in [[Sachverhalt]] oder `evidence`-Knoten
  in [[Beweisangebote]])
- **Optional:** `form` (`anlage` | `aktenverweis`;
  Vorgabe `anlage`; bei `aktenverweis` die Blattzahl
  im Feld `blatt`), `blatt`, `ersetzt_durch`
  (String-Slug der ersetzenden Anlage), `supersedes`,
  `superseded_by`, `alias`, `vertraulich` (`offen` |
  `intern` | `streng-intern`)
- **Dokumenttypen:** [[Katalog-Einreichung-Stand]]
- **Beispielname:** `VF-001 Anlage K 7 Mietvertrag.md`
- **Kanonizität:** jedes Dokument einmal in
  `wiki/Anlagen.md`; Nummer und Verwendung liegen dort
  (Wiki.md §1.1a), die `## Anlagen`-Abschnitte der
  Schriftsätze spiegeln.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Anlagen]] (Sektionen Quelle und Prüfsumme /
  Beweisthema / Verwendung / Vermerke / Bezüge).
- **`temp-`-Regel:** `temp-` ist das einzige zulässige
  Präfix temporärer Nummern; ein `temp-` in einem
  getaggten Schriftsatz, Anlagenverzeichnis oder
  Versandpaket ist FEHLER und sperrt Tag und
  Versandstand ([[Kettenpruefung]] §Lint-Anteil;
  Paketprüfung in [[Vorgehen-SP-2]] §Versand). Die
  Umschreibung auf endgültige Nummern beim Tag ist
  maschinell (Text, Verzeichnis, Paket).
- **RP-20-Präzisierung** (gilt bei aktivem RP-20; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-20-Rechtsfall/`): Nummernvergabe
  nach dem voreingestellten Schema; Verweis auf die
  Gerichts- oder Behördenakte mit Blattzahl statt
  Neueinreichung. Einzelheiten in `Vorgehen-RP-20.md` §3
  „Anlagen“ und §5 „Akte zerlegen“.
