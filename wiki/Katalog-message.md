---
type: catalog-entry
art: einzeltyp
---

# Katalog-message

Einzeltyp-Eintrag: Nachweis-Typ `message` ohne
Register — eine Nachricht zwischen Repos im Verbund
(Koordinator und Komponenten). Es gibt keine
indexierende Fassade und keinen Index; die Nachrichten
liegen als Dateien beim Absender.

### message

- **Zweck:** Nachricht eines Repos an ein oder mehrere
  Nachbar-Repos — Rückmeldung, Befund, Änderungswunsch,
  Rücklauf, Lieferung, Meldung eines vereinbarten
  Contracts, Quittung. Der Empfänger bucht daraus in
  seine eigenen Register; wer was bucht und warum nur
  der eigene Agent schreibt: Vorgehen.md §3a
- **Klasse:** Nachweis
- **Freeze ab:** Anlage (eine Korrektur ist eine neue
  Nachricht mit `antwort_auf:`)
- **Pflichtfelder:** `type: message`, `id` (Format
  `MSG-NNN`), `von` (Repo-Name des Absenders), `an`
  (Liste der Repo-Namen der Empfänger), `datum`, `art`
  (Freitext), `erwartet` (`buchung` | `antwort` |
  `keine`)
- **Optional:** `bezug` (Liste qualifizierter Verweise
  auf eingefrorene Knoten, z.B. `<koordinator>/CON-003`,
  ein Tag oder ein Stand), `antwort_auf`
  (`<absender>/MSG-NNN` der Nachricht, auf die diese
  antwortet oder die sie korrigiert), `fuer_marke`
  (`<koordinator>:<marke>` — in einer Lieferung oder
  einem Marken-Abschluss nur, wenn die Marke des
  Koordinators nicht aus der Marke der Komponente
  folgt; in der Nachricht des Koordinators zum Start
  seiner Folge-Marke die Marke, für die die Komponente
  weiter liefert — Vorgehen.md §3a, [[Zielmarken]]
  §Meta „Zuliefernde Komponenten“; der Lint prüft das
  Format)
- **Beispielname:** `MSG-007 — Lieferung-Tag-v1-2.md`
- **Ablage:** `output/nachrichten/` im Repo des
  Absenders, ohne `_VV_TLA` (nicht versioniert,
  MasterPrompt §1.5); keine Kopie beim Empfänger.
- **Struktur-Konventionen:** Frontmatter mit den
  Feldern, darunter der Text der Nachricht. Anlagen
  stehen als Verweis in `bezug`, nicht als Kopie.
- **Nummer:** höchste vorhandene MSG-Nummer im eigenen
  `output/nachrichten/` plus 1; Nummern werden nie
  wiederverwendet.
- **`art`:** Lese-Hinweis für den Empfänger, keine
  feste Liste und keine Richtungsregel (z.B.
  `lieferung`, `marken-abschluss`, `contract`,
  `befund`, `aenderungswunsch`, `ruecklauf`,
  `quittung`). Was eine Nachricht verlangt, sagt allein
  `erwartet`. Festgelegt ist es für den Rücklauf und
  die Nachricht an registrierte Consumer: beide tragen
  `erwartet: antwort`; die Quittung sagt, dass
  der Empfänger seine Stände geprüft hat. Die fehlende
  Quittung meldet C8 wie jede offene Nachricht.
- **Buchung mit `quelle:`:** Jede Buchung beim
  Empfänger trägt `quelle: <absender>/MSG-NNN` — am
  gebuchten Element (z.B. Contract), in der Zeile am
  Marken-Eintrag ([[Zielmarken]], Zuliefernde
  Komponenten), in einer Consumer-Registrierung oder am
  Eintrag im Sammel-Register (Befund, Änderungswunsch).
  Die Buchung ist idempotent **je `quelle:` und
  Gegenstand**: steht zu einer `quelle:` schon eine
  Buchung desselben Gegenstands, entfällt die zweite;
  eine Meldung, die mehrere Gegenstände trägt, ergibt
  je Gegenstand eine Buchung (der Marken-Abschluss mit
  übernommenem Tag: je eine Zeile am Marken-Eintrag
  für Abschluss-Stand und alten Tag — [[Zielmarken]]).
- **Quittung:** Bei `erwartet: buchung` oder
  `erwartet: antwort` antwortet der Empfänger mit einer
  eigenen Nachricht mit `antwort_auf:
  <absender>/MSG-NNN` — bei `buchung` nach der Buchung,
  mit dem gebuchten Knoten in `bezug`. Bei mehreren
  Empfängern quittiert jeder Empfänger einzeln. Die
  Quittung selbst trägt `erwartet: keine` und wird
  nicht gebucht.
- **Fire-and-Forget:** Jede Nachricht und jede Quittung
  ist eine Datei; der Absender wartet nicht. Wer aktiv
  wird, findet beim Sessionstart alles beim Absender
  vor und bucht. Ein Posteingangs-Register gibt es
  nicht: offen ist eine Nachricht, solange zu
  `erwartet: buchung` keine Buchung mit ihrer
  `quelle:` und zu `buchung` oder `antwort` keine
  Quittung mit ihrem `antwort_auf:` besteht. Offene
  Nachrichten meldet der Nachrichten-Wächter C8
  (MasterPrompt §5.3 Phase C; Aktivierung und
  Anlässe dort).
- **Transport:** Peer-Werkzeug oder Datei-Variante, die
  Wahl und ihr Ort: Vorgehen.md §3 (Start und
  Transport); Format und Buchung sind in beiden
  Varianten gleich.
- **Lint:** prüft Präfix-Muster und Eindeutigkeit der
  MSG-Nummern, keine Register-Lücken. Er erkennt
  offene Nachrichten für C8: beim Absender die
  fehlende Quittung je Empfänger, beim Empfänger die
  fehlende Buchung. Eine `quelle:` oder Nachricht, die
  er mangels Lesezugriff auf den Nachbarn nicht
  auflösen kann, meldet er als Hinweis, nicht als
  Fehler.
