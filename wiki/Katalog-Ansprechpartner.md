---
type: catalog-entry
art: einzeltyp
---

# Katalog-Ansprechpartner

Einzeltyp-Eintrag: Fassade `contact-log`
([[Ansprechpartner]]) ohne Element-Typ — führt ihre
Relationen inline (Kategorie b).

### contact-log

- **Zweck:** Register — wer ist wofür zuständig
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: contact-log`
- **Datei:** `wiki/Ansprechpartner.md`
- **Singleton**
- **Abgrenzung der Rollen-Fassaden:** Ansprechpartner =
  Rolle einer **Person im Projekt** („Frau Reiherbach
  ist Sachbearbeiterin für unseren Vorgang bei den
  Stadtwerken“); Geschäftsbeziehungen (mit dem
  Standardprozess Systementwicklung) = **Organisation
  zum Projekt**; Beteiligte (mit dem Standardprozess
  Recht und Verwaltung) = **Rolle im Verfahren mit
  Vertretung** („Müller ist Kläger in Verfahren x“);
  [[Mitgliedschaften]] = **Zugehörigkeit unabhängig
  vom Projekt** („Maier ist Geschäftsführer in der
  Bau-Mich-Auf GmbH“). Dieselbe Bauform — Relation
  Person oder Organisation ↔ etwas —, nicht derselbe
  Gegenstand.
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade — die Fassade
  Ansprechpartner ist in SP-2 **Pflicht ab Stufe 1**):
  - **Sachbearbeiter je Stelle:** zu jeder Stelle mit
    `authority` ([[Organisationen]]) der zuständige
    Sachbearbeiter bzw. die Geschäftsstelle mit
    Durchwahl, Zeichen und Erreichbarkeit; dazu die
    **Vertretung** des Anwenders (Kanzlei,
    Bevollmächtigter) mit Ansprechpartner. **Wechsel**
    werden nicht überschrieben, sondern als neue Zeile
    mit Datum angefügt (die alte Zeile bleibt mit „bis
    <Datum>“), weil Schreiben und Vermerke auf die
    frühere Person verweisen.
  - **Nicht hier:** die Verfahrensrolle eines
    Beteiligten (Kläger, Beklagter, Beigeladener …) und
    seine Vollmacht stehen in der Fassade Beteiligte des
    Prozesses; hier steht, wer bei einer Stelle oder
    Vertretung wofür zuständig ist.
  - **Unverändert:** Inline-Form (Kategorie b) und
    `## Meta` der Fassade [[Ansprechpartner]] gelten
    weiter.
