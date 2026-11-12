---
type: catalog-entry
art: einzeltyp
---

# Katalog-Aktenzeichen

Einzeltyp-Eintrag: Fassade `file-number-log`
([[Aktenzeichen]]) ohne Element-Typ (Inline-Fassade).

### file-number-log

- **Zweck:** Register aller Aktenzeichen im Projekt
  (generisches Referenznummern-Register: Aktenzeichen,
  Ticket-, Bestell- und Vorgangsnummern). Zuordnung:
  ein Aktenzeichen gehört zum `document`-Knoten
  (jedes Eingangs- oder Ausgangsdokument trägt seines)
  und in Prozessen mit eigenem Fall-Typ auch zu dessen
  Knoten; Pflicht und Ersatz-Schlüssel ohne
  Aktenzeichen regelt der Prozess in seinem Steckbrief.
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: file-number-log`
- **Datei:** `wiki/Aktenzeichen.md`
- **Singleton**
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade — die Fassade
  Aktenzeichen ist in SP-2 **Pflicht ab Stufe 1**):
  - **Zuordnung zum Verfahren:** jedes Aktenzeichen
    gehört zu genau einem Verfahren (`case`-Knoten der
    Fassade Verfahren des Prozesses) und zu jedem
    Eingangs- oder Ausgangsdokument, das es trägt; der
    Eintrag nennt Stelle, Verfahren (`VF-NNN`) und das
    Datum, ab dem das Zeichen gilt. Ohne Aktenzeichen
    trägt das Verfahren den Ersatz-Schlüssel `VF-NNN`
    allein, bis eines vorliegt; mit dem ersten
    Aktenzeichen wird dieses der sprechende Schlüssel,
    die Register-ID bleibt.
  - **Umbenennung und Verbindung:** vergibt eine Stelle
    ein neues Zeichen (Instanzwechsel, Abgabe an eine
    andere Stelle, Umschreibung), bleibt das alte
    Zeichen als Eintrag mit „bis <Datum>“ und Verweis
    auf das neue stehen (`alias`-Logik: gleicher Inhalt,
    neue Kennung); werden Verfahren verbunden oder
    getrennt, nennt der Eintrag die beteiligten
    Verfahren und die Entscheidung der Stelle als
    Eingangsdokument. Verweise in Schreiben nennen stets
    das Zeichen, das die Stelle zum Zeitpunkt des
    Schreibens führte.
  - **Nicht hier:** interne Kennungen der Vertretung
    stehen an der Schriftsatz-Zeile des Prozesses, nicht
    als Aktenzeichen.
  - **Unverändert:** generisches Referenznummern-Register
    und `## Meta` der Fassade [[Aktenzeichen]] gelten
    weiter.
