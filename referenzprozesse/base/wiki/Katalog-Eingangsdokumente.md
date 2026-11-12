---
type: catalog-entry
art: register
---

# Katalog-Eingangsdokumente

Register-Eintrag: Fassade `input-document-log`
([[Eingangsdokumente]]) mit Element-Typ `document`.

### input-document-log

- **Zweck:** Register aller Eingangsdokumente —
  fokussierte Sicht auf die beim Ingest angelegten
  `document`-Knoten; dazu die Sektion `## Eingangsorte`
  (registrierte Eingangsorte in drei Schichten) und je
  Eintrag der Status `eingelesen`, gegen den der
  Wächter C9 Eingangsordner und Eingangsorte prüft
  (`## Meta` der Fassade)
- **Pflichtfelder:** `type: input-document-log`
- **Präfix:** `—`
- **Datei:** `wiki/Eingangsdokumente.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`). Prozesse können die Fassade zur
  Pflicht machen und je Eintrag Felder ergänzen
  (Zugangsdatum, Zustellart, ausgelöste Frist) — in
  ihrem eigenen Katalog-Eintrag.

### document

- **Zweck:** ein Wiki-Knoten pro eigenständig
  zitierbarem Eingangsdokument
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: document`,
  `document_type` (Enum), `source_text`
  (`input/raw/<datei>.md`), `ingested_at`
- **Empfohlen:** `source_original` (bei Scans),
  `pages` (bei Sammeldokumenten)
- **Beispielname:**
  `2026-03-11 Angebot 2026-117 Sanierung Amselweg.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Eingangsdokumente]].
- **Enum-Werte `document_type`**
  (Domänen-Gruppierung ist reine Sortierhilfe):
  - Rechtsfall: `bescheid`, `urteil`, `einspruch`,
    `kommentar`, `schreiben`, `formular`; bei aktivem
    Referenzprozess Steuer- und Abgabenfall (RP-21)
    dazu `pruefungsanordnung`, `pruefungsbericht`,
    `vollstreckungsankuendigung`, `mahnung`,
    `abrechnung`, `kontoauszug-stelle` — und ein
    `bescheid` ist dort zugleich ein Glied einer
    Bescheidkette (Typ `notice`, `extends: document`;
    Katalog-Eintrag Bescheidketten des Referenzprozesses,
    Ordner `referenzprozesse/RP-21-Steuer-und-Abgabenfall/`)
  - SW-Entwicklung: `spec`, `issue`, `adr-doc`,
    `protocol`, `pr`, `changelog`
  - Produktentwicklung: `brief`, `presentation`,
    `market-research`
  - Wissenschaft: `paper`, `book`, `preprint`,
    `norm`, `standard`, `thesis-doc`
  - Übernommene Konzepte: `proposal`
  - Allgemein: `notiz` (eigene Notiz, Memo,
    Wunschliste, Gesprächsnotiz des Anwenders — eigenes
    Material ohne fremden Absender)
- **Neuer Enum-Wert:** Passt kein Wert, schlägt der
  Agent einen neuen vor; mit der Bestätigung des
  Anwenders ergänzt er ihn hier im Katalog-Eintrag des
  Projekts (Abschnitt §Projektspezifische Erweiterungen
  in [[Katalog]], Wiki.md §3). Eine Entscheidung im
  Register braucht ein neuer Enum-Wert nicht; ein neuer
  **Typ** dagegen schon.
- **Bezugs-Rolle „Gegenstand":** worauf
  sich ein Dokument bezieht (der Gegenstand eines
  Bescheids, einer Bestellung, eines Angebots), ist
  ein **Verweis-Feld im Body** (Wikilink auf das
  betroffene Wissenselement beliebigen Typs) — kein
  eigener Entity-Typ.
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade — die Fassade
  Eingangsdokumente ist in SP-2 **Pflicht ab Stufe 1**
  und wird als **Posteingang** geführt):
  - **Zusätzliche Pflichtfelder je Eingangsdokument:**
    `zugang` (Zugangsdatum `YYYY-MM-DD` — der Tag, an
    dem das Dokument zugegangen oder bekanntgegeben
    ist, nicht der Tag des Einlesens; Bekanntgabe-
    Fiktion je Kanal nach dem Fristenkatalog des
    Prozesses), `zustellart` (offene Liste:
    `zustellungsurkunde` | `empfangsbekenntnis` |
    `einschreiben` | `einfacher-brief` |
    `bereitstellung-zum-abruf` | `oeffentliche-
    zustellung` | `gerichtsvollzieher` | `uebergabe` |
    `muendlich` | `unbekannt` — die Voreinstellung,
    wenn weder das Dokument noch der Anwender die
    Zustellart nennt; der Agent fragt nach und rechnet
    Fristen bis zur Klärung mit der Variante, die
    früher endet), `case` (String-Slug des Verfahrens,
    wie an Fristen und Ereignissen — der Dateiname
    des `case`-Knotens ohne `.md`, seine `id` oder ein
    `alias`, kein frei gebildetes Wort; **Pflicht ab
    Verfahrensbeginn:** solange das Projekt keinen
    `case`-Knoten führt, **fehlt das Feld** — der
    Agent setzt keinen Platzhalter und legt kein
    Verfahren an, nur um es zu füllen. Beginnt ein
    Verfahren, trägt der Agent dessen Kennung an den
    Eingangsdokumenten nach, die dazu gehören: als
    **neues Kopf-Feld** mit dem angehängten, datierten
    Vermerk „Feld `case` nachgetragen am
    ⟨JJJJ-MM-TT⟩“ — der Nachweis wächst, keine
    bestehende Zeile wird geändert,
    [[Einfrieren-und-Abloesen]] §Nachweis. Ein
    Dokument, das zu keinem Verfahren gehört, bleibt
    ohne das Feld), und je
    Eintrag in der Fassade die **ausgelöste Frist,
    Marke oder der Eventualplan** (Felder Frist /
    Marke / Eventualplan im Register-Eintrag; eines
    davon oder „keine, geprüft“). Der Status
    `eingelesen` gilt erst, wenn Fristen gezogen,
    Eventualpläne gegen Auslöser geprüft, eine
    eingehende Entscheidung nach dem Prüfraster ihrer
    Art geprüft und ein Begehren — jemand will etwas
    von uns — nach dem Prüfraster geprüft sind
    (Vorgehen des Prozesses, §Prüfen);
    jede fremde Tatsachenbehauptung bekommt eine
    Stellung (SP-2 Katalog-Sachverhalt).
  - **Zusätzliche `document_type`-Werte** (Gruppe
    Rechtsfall, ergänzt): `schriftsatz` (Schriftsatz
    des Gegenübers oder der Stelle; der Knoten ist
    zugleich `submission`, SP-2 Katalog-Schriftsaetze),
    `beschluss`, `verfuegung` (prozessleitende
    Verfügung), `einspruchsentscheidung`, `bescheid`
    (bereits Basis), `vermerk` (Aktenvermerk über eine
    mündliche Mitteilung — Telefonat, Gespräch,
    Auskunft am Schalter; der Vermerk ist das
    Eingangsdokument). Ein **Protokoll eines Termins**
    ist ein Eingangsdokument (`document_type:
    protocol`) und zugleich der **Nachweis** der im
    Termin abgegebenen Erklärung (Kanal
    `muendlich-termin`, SP-2 Katalog-Einreichungen).
  - **Kann-Feld `vertraulich`** (`offen` | `intern` |
    `streng-intern`): die Vertraulichkeitsstufe des
    Eingangs; ein Stand erbt die höchste Stufe seiner
    Quellen, der Versandstand prüft sie gegen den
    Empfänger.
  - **Status rechtskräftig / bestandskräftig:** an
    einer eingegangenen Entscheidung (`urteil`,
    `beschluss`, `bescheid`, `einspruchsentscheidung`)
    trägt der Register-Eintrag das Feld Kraft
    (`rechtskraeftig` | `bestandskraeftig`, mit Datum,
    Tenor in Kurzform und Reichweite) als angehängten
    Vermerk — Quelle für die Prüfung jedes Begehrens
    und den Nachlauf; kein eigenes Register.
  - **Eingangsorte:** bestehende Akten werden beim Init
    zuerst eingelesen, laufende Fristen sofort gemeldet;
    das elektronische Postfach des Verfahrens ist ab der
    Stufe, in der es eröffnet ist, ein Pflicht-
    Eingangsort mit Abrufturnus.
  - **Unverändert:** `source_text`, `ingested_at`,
    Freeze ab Anlage, Wächter C9 (Dateivergleich) und
    `## Meta` der Fassade [[Eingangsdokumente]] gelten
    weiter.
