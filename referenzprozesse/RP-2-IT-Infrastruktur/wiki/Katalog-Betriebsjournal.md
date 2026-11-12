---
type: catalog-entry
art: register
process: RP-2
---

# Katalog-Betriebsjournal

**Ich bin neu in RP-2.** Register-Eintrag: Fassade
`operations-journal-log` ([[Betriebsjournal]]) mit
Element-Typ `operations-journal-entry`. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### operations-journal-log

- **Zweck:** markenfreies Register aller Läufe,
  Prüfungen, Störungen und Beobachtungen an den
  Zielumgebungen dieses Repos, je Zielumgebung eine
  Liste
- **Pflichtfelder:** `type: operations-journal-log`
- **Präfix:** `JNL`
- **Datei:** `wiki/Betriebsjournal.md`
- **Singleton**
- **Kanonizität:** kanonisch für die Kurzform aller
  JNL-Einträge (Wiki.md §1.1a); ein JNL ist Nachweis,
  eingefroren ab Anlage.

### operations-journal-entry

- **Zweck:** ein Lauf an einer Anlage (auch der
  Wiederholungslauf ohne Änderung), eine Prüfung, eine
  Störung oder Kurzstörung, eine Beobachtung — mit
  Rezept-Tag, Skript, Ausführendem, Vorab-Sicherung,
  Ergebnis und der Angabe, ob der Lauf vom geltenden
  Deploy-Stand abweicht (Detail-Knoten zum JNL-Eintrag
  im Register)
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: operations-journal-entry`,
  `id` (Format `JNL-NNN`), `status` (`angenommen` ab
  Anlage, ohne weitere Übergänge;
  [[Register-Lebenszyklus]]), `status_date`, `datum`,
  `umgebung` (Name aus [[Zielumgebungen]]), `art`
  (`lauf` | `pruefung` | `stoerung` | `kurzstoerung` |
  `beobachtung`), `ausfuehrender` (`mensch` oder
  `agent`, bei Mensch der Name), `abweichung` (`ja` |
  `nein` — hat der Lauf etwas verändert, was der
  geltende Deploy-Stand der Umgebung nicht beschreibt;
  bei `ja` im Text, was); **bei der Art `lauf` zusätzlich
  Pflicht:** `rezept_tag` (Tag des Rezepts), `skript`
  (Pfad in `deploy/`), `vorab_sicherung` (was, wohin;
  oder `keine` mit Grund), `ergebnis` (kurz) — bei den
  übrigen Arten sind diese Felder optional; **bei einem
  schreibenden Lauf an einer produktiven Umgebung
  zusätzlich Pflicht:** `ok` (DEC des Anwender-OK —
  `eingriff-ok` — oder des stehenden OK —
  `stehendes-ok` —, unter das der Lauf fällt,
  [[Vorgehen-RP-2]] §5; das Prüfprogramm liest die
  Bedingung nicht, der Agent prüft sie vor dem Lauf)
- **Optional:** `rezept_tag`, `skript`,
  `vorab_sicherung`, `ergebnis` (bei den Arten
  `pruefung`, `stoerung`, `kurzstoerung`,
  `beobachtung`; bei `lauf` Pflicht, oben), `ok` (bei
  Läufen ohne Schreibzugriff oder an nicht produktiven
  Umgebungen; sonst Pflicht, oben), `bug` (Liste der BUG, die aus einer Störung
  entstanden sind, [[Katalog-Fehlermeldungen]]), `alias`
  (Liste; Wiki.md §4.1)
- **Beispielname:** `JNL-012 Aktualisierung Dateidienst Produktion.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Betriebsjournal.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Betriebsjournal]].
- **Kein neues DEPL je Lauf:** ein Lauf ändert die
  Deployment-Einträge nicht; weicht er vom geltenden
  Deploy-Stand ab (`abweichung: ja`), ist ein weiterer
  Deploy-Stand oder eine Marke der Art Ändern fällig,
  und das Prüfprogramm meldet, bis der Stand nachgezogen
  ist (`RP2-L4`, [[Vorgehen-RP-2]] §8).
- **Kurzstörung:** die Leichtform einer Störung — ein
  Journal-Eintrag der Art `kurzstoerung`, keine
  Fehlermeldung, solange sich kein Produkt-Stand falsch
  verhält; wird daraus eine Störung mit Ursache und
  Klärungsstand, entsteht der BUG
  ([[Katalog-Fehlermeldungen]] RP-2-Präzisierung) und
  der Eintrag nennt ihn in `bug`.
