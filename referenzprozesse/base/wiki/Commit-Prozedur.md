---
type: internal-procedure
---

# Commit-Prozedur

**Checkliste vor jedem Commit** — vier Fragen. Die
Regel-Substanz steht in den verwiesenen Orten; diese
Prozedur bündelt nur den Moment (Muster analog
[[Git-Bestandsaufnahme]] für den Sessionstart).

1. **Zug sauber geschnitten?** Ein Commit = ein Zug
   (thematisch abgeschlossene Einheit); Züge werden
   nicht gebündelt und nicht zersplittert
   (MasterPrompt §6.1).
2. **Präfix gewählt?** Aus dem Basis-Katalog (siehe
   §Basis-Präfix-Katalog unten), den Präfixen des aktivierten
   Prozesses (Prozess-Steckbrief §„Mitgebrachte
   Präfixe", DEC-208) oder den
   deklarierten [[Projekt-Präfixe]]n. Ein freies
   Präfix ohne Deklaration ist Abweichung — lieber
   in einem Satz deklarieren als driften.
3. **Sprache korrekt?** Nach [[Commit-Sprache]]
   (beim Init festgelegt — z.B. Wiki-Präfixe und
   -Beschreibungen projektsprachlich, Code-nahe
   englisch).
4. **Kadenz-Zeile nötig?** Berührt der Commit Code
   und sind Kadenz-Werkzeuge registriert (Tools.md
   §Kadenz-Werkzeuge): Werkzeuge ausführen, Ergebnis
   als Info-Zeile in die Commit-Message
   (MasterPrompt §6.1;
   [[Berichten-statt-Blockieren]] — rot blockiert
   nicht). Doku-only-Commits laufen ohne Kadenz.

Der Sessionstart-Wächter „Trigger-Hygiene"
(MasterPrompt §5.3, C7) macht Abweichungen sichtbar;
er blockiert nicht und schreibt keine Historie um.

## Basis-Präfix-Katalog

Der vollständige Basis-Katalog der Commit-Präfixe
(Wortlaut aus MasterPrompt §6.2 hierher verlagert;
Format, Sprach-Regel sowie Prozess- und
Projekt-Präfix-Deklaration stehen weiter dort):

| Präfix | Zweck |
|---|---|
| `Ingest:` | Wiki-Knoten aus Ingest |
| `Output:` | neue Version in `output/` |
| `Overview:` | neue Version oder Snapshot in `overview/` |
| `Outgoing:` | neue Datei in `outgoing/` |
| `Wiki:` | redaktionelle Wiki-Änderung (Detail-Knoten) |
| `Facts:` | Änderung an `wiki/Facts.md` |
| `Chronologie:` | Änderung an `wiki/Chronologie.md` |
| `Fristen:` | Änderung an `wiki/Fristen.md` |
| `Aktenzeichen:` | Änderung an `wiki/Aktenzeichen.md` |
| `Ansprechpartner:` | Änderung an `wiki/Ansprechpartner.md` |
| `Glossar:` | Änderung an `wiki/Glossar.md` |
| `Glossar-Review:` | Änderung an `wiki/Glossar Review.md` |
| `Konzepte:` | Änderung an `wiki/Konzepte.md` oder `concept`-Detail-Knoten |
| `Zielmarken:` | Änderung an `wiki/Zielmarken.md` (Marken, Zeiger, Zuordnungen) |
| `Ideen:` | Änderung an `wiki/Ideen.md` oder IDEA-Detail-Knoten |
| `Entscheidungen:` | Änderung an `wiki/Entscheidungen.md` oder DEC-Detail-Knoten |
| `InterneMechanik:` | Änderung an `wiki/InterneMechanik.md` oder `internal-*`-Detail-Knoten |
| `Prüfung:` | Prüf-Artefakte, die versioniert in `overview/` bleiben (Standard-Ablage der Prüfberichte ist `Report:`, siehe MasterPrompt §5.6) |
| `Report:` | Agent-Bericht: REP-Detail-Knoten und `wiki/Agent-Berichte.md` (MasterPrompt §5.6) |
| `Recherche:` | Rechercheartefakt aus externer Recherche: REC-Detail-Knoten und `wiki/Rechercheartefakte.md` (MasterPrompt §5.6) |
| `Mission:` | Änderung an `wiki/Mission Statement*.md` |
| `Fragen:` | Änderung an `Offene Fragen.md` |
| `Setup:` | Tools, Konfiguration, Instruktionsdatei |
| `Prozess-Merge:` | Merge des Prozess-Teil-Wikis beim Init nach Prozess-Wahl (Wiki.md §11.3) |
| `Prozess-Upgrade:` | Prozess-Upgrade mit Migration bestehender Instanzen (Wiki.md §11.5) |
| `Sonstiges:` | was nicht in obige fällt |

_(Kein Fassaden-Knoten —
`internal-procedure`-Detail-Knoten, indexiert über
[[InterneMechanik]].)_

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzformen: MasterPrompt §6.2
  (Basis-Präfix-Katalog-Zeiger), §5.3 C7
  (Commit-Hygiene-Wächter)
