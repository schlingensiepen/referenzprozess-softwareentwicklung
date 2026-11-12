---
type: operations-journal-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Betriebsjournal

**Ich bin neu in RP-2.** Diese Fassade entsteht mit der
Wahl von RP-2 (Wiki.md §11 Prozess-Teil-Wikis) — das
Betriebsjournal hält je Zielumgebung fest, was wann wo
gelaufen ist; es ist der markenfreie Betriebsteil des
Prozesses.

## Meta

- **Typ:** `operations-journal-log` — Register aller
  Journal-Einträge (JNL) dieses Repos, **je
  Zielumgebung eine eigene Liste**. Singleton, ID-Präfix
  `JNL-NNN` (eine Nummernfolge über alle Umgebungen).
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  Einträge leben inline; ein Lauf mit langem Protokoll
  darf einen Detail-Knoten bekommen.
- **Markenfrei, je Zielumgebung:** das Journal hängt an
  der Zielumgebung ([[Zielumgebungen]]), nicht an einer
  Marke — eine eigene Liste je Anlage unter `###
  <Umgebung>`, nicht die allgemeine Chronologie. Ein
  Eintrag nennt die Marke nur über den Rezept-Tag.
- **Ein Eintrag je Lauf:** **jeder Skriptlauf an einer
  Anlage** — auch der Wiederholungslauf ohne Änderung —
  ist ein Eintrag mit Rezept-Tag, Skript, Ausführendem
  (Mensch oder Agent), Vorab-Sicherung, Ergebnis und dem
  Feld **„Abweichung vom Stand: ja/nein“**: hat der
  Lauf etwas verändert, was der geltende Deploy-Stand
  der Umgebung nicht beschreibt? Dazu Prüfungen
  (Ist-Prüfung bei Wiederaufnahme, Re-Inventur),
  Störungen und Beobachtungen; Leichtform
  **Kurzstörung** (eine Zeile: was, wann, behoben
  oder offen — ohne Fehlermeldung, solange kein
  Produkt-Stand sich falsch verhält). **Kein neues DEPL
  je Lauf**; erneutes Ausrollen ohne Änderung ist
  Betrieb und steht nur hier ([[Marken-RP-2]] §3). Grund
  aus realen Infrastruktur-Projekten: ein Wiederholungslauf setzte eine
  Sicherheitseinstellung still zurück und blieb
  wochenlang unbemerkt, weil der Lauf nirgends stand.
- **Nachweis, eingefroren ab Anlage:** ein
  Journal-Eintrag wird nie geändert; eine Korrektur ist
  ein angehängter Vermerk ([[Einfrieren-und-Abloesen]]
  §Klassen).
- **Anwender-OK:** ein schreibender Lauf an einer
  produktiven Umgebung nennt den Entscheidungseintrag
  des OK (`eingriff-ok`) oder das stehende OK
  (`stehendes-ok`), unter das er fällt
  ([[Vorgehen-RP-2]] §5). Führt der Mensch aus, steht
  er als Ausführender; der Agent hat den Befehl vorher
  vorgelegt und danach verifiziert.
- **Wofür gelesen:** die Prüfung `RP2-L4` meldet, wenn
  ein Journal-Eintrag **mit Abweichung** jünger ist als
  der geltende Deploy-Stand derselben Zielumgebung —
  nicht nach jedem Wiederholungslauf
  ([[Vorgehen-RP-2]] §8); dann ist ein weiterer
  Deploy-Stand oder eine Marke der Art Ändern fällig.
  Der Journal-Eintrag des Abschalt-Laufs nennt im Feld
  `vorab_sicherung` die Sicherung, die das Abschalt-Tor
  vor der Freigabe in der Re-Inventur benannt hat
  ([[Vorgehen-RP-2]] §5); ein Abnahmeprotokoll darf die
  Läufe nennen, die es abnimmt
  ([[Katalog-Abnahmeprotokolle]]).
- **Eintragsformat:** unter `### <Umgebung>` je Eintrag
  `#### JNL-NNN — <Lauf oder Ereignis in einem Satz>` mit
  Feldern Art (Lauf / Prüfung / Störung / Kurzstörung /
  Beobachtung) / Datum und Zeit / Rezept-Tag / Skript
  (Pfad in `deploy/`) / Ausführender (Mensch mit Name
  oder Agent) / OK (DEC des Eingriffs oder des stehenden
  OK; entfällt bei lesenden Läufen und außerhalb
  produktiver Umgebungen) / Vorab-Sicherung (was, wohin;
  oder „keine“ mit Grund) / Ergebnis / Abweichung vom
  Stand (ja / nein; bei ja: was) / Detail (Wikilink,
  nur wenn Detail-Knoten existiert).
- **`operations-journal-entry`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Betriebsjournal]] —
  lesen beim Anlegen. Sektionen: Lauf (wer, wann, wo,
  OK) / Protokoll / Abweichung vom Stand / Vermerke
  (append-only) / Bezüge (Fassaden-Eintrag
  [[Betriebsjournal]]). Dateiname `JNL-NNN <Lauf>.md`.

---

**Bearbeitungsstand:** _(vom Agenten bei jedem Lauf
gepflegt)_

## Einträge je Umgebung

_(vom Agenten beim ersten Lauf gefüllt: je Zielumgebung
ein Abschnitt `### <Umgebung>`, darunter die Einträge
`#### JNL-NNN` chronologisch nach ID)_
