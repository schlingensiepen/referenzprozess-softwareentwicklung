---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Kosten

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`cost-log` ([[Kosten]]) mit Element-Typ `cost-item`
(Inline-Einträge mit Detail-Knoten bei gewichtigen
Posten — Hybrid wie [[Katalog-Fristen]]). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### cost-log

- **Zweck:** Register der Kosten-Posten je Verfahren —
  Streitwert, Gerichtskosten, Prozess- bzw.
  Verfahrenskostenhilfe, Beratungshilfe, Erstattung,
  Honorare, Vorschüsse, Kostenrisiko, je mit Träger
- **Pflichtfelder:** `type: cost-log`
- **Präfix:** `—`
- **Datei:** `wiki/Kosten.md`
- **Singleton** — ab Stufe 1 aktivierbar, Vorauswahl
  deaktiviert (Steckbrief § Mitgebrachte Fassaden)
- **Pflicht ab:** Auslöser „Kostenantrag, Prozess- oder
  Verfahrenskostenhilfe, Beratungshilfe, Erstattung im
  Vorverfahren oder Vorschuss“ — tritt er ein, setzt
  der Agent `active: true` ohne weitere Frage
- **Entfällt abgeleitet, wenn:** die Fassade inaktiv
  ist (`active: false`) und der Auslöser nicht
  eingetreten ist

### cost-item

- **Zweck:** ein Kosten-Posten mit Art, Betrag, Träger,
  Status und Grundlage (Detail-Knoten zum Eintrag im
  Register)
- **Klasse:** außerhalb (lebend; Beträge und Stände
  ändern sich am Posten, Entscheidungen über Anträge in
  [[Entscheidungen]])
- **Pflichtfelder:** `type: cost-item`, `verfahren`
  (String-Slug des `case`-Knotens), `cost_type`
  (offene Liste: `streitwert` | `gerichtskosten` |
  `pkh` | `beratungshilfe` | `erstattung` | `honorar` |
  `vorschuss` | `kostenrisiko`), `traeger` (offene
  Liste: `selbst` | `rechtsschutzversicherung` |
  `prozessfinanzierer` | `verband` | `staatskasse` |
  `gegenueber`; der Träger ist ein Eintrag in
  [[Beteiligte]])
- **Empfohlen:** `betrag` (Zahl mit Währung), `status`
  (offene Liste: `offen` | `beantragt` | `festgesetzt`
  | `gezahlt` | `erstattet` | `abgelehnt`)
- **Optional:** `grundlage` (Norm oder
  Gebührentatbestand; Festsetzungsbeschluss als
  String-Slug des Eingangsdokuments), `frist`
  (String-Slug der Zahlungs- oder Antragsfrist,
  [[Fristen]]), `alias`
- **Beispielname:** `VF-001 Kosten kostenrisiko Erste Instanz.md`
- **Kanonizität:** Wahrheit bei Betrag und Status liegt
  in `wiki/Kosten.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Kosten]] (Sektionen Posten und Grundlage / Verlauf
  / Vermerke / Bezüge).
- **RP-20-Präzisierung** (gilt bei aktivem RP-20; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-20-Rechtsfall/`): Kostenregime je
  Gerichtsbarkeit: Beratungshilfe, Prozesskostenhilfe,
  Kostenerstattung im Vorverfahren, Kostenfestsetzung,
  Streitwertbeschwerde; Kostenträger. Einzelheiten in
  `Vorgehen-RP-20.md` §3 „Kosten“.
- **RP-21-Präzisierung** (gilt bei aktivem RP-21; nur
  Verweis — führender Ort ist das Vorgehen des
  Referenzprozesses, Ordner
  `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`):
  Kostenregime Einspruchsverfahren,
  Widerspruchsverfahren der Kommunalabgaben,
  Finanzgericht. Einzelheiten in `Vorgehen-RP-21.md` §3
  „Kosten“.
