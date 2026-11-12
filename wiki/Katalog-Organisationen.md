---
type: catalog-entry
art: register
---

# Katalog-Organisationen

Register-Eintrag: Fassade `organization-log`
([[Organisationen]]) mit Element-Typ `organization`.

### organization-log

- **Zweck:** Register aller `organization`-Knoten
- **Pflichtfelder:** `type: organization-log`
- **Präfix:** `—`
- **Datei:** `wiki/Organisationen.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)

### organization

- **Zweck:** Organisation mit Stammdaten und Rollen
  (Basis-Entity)
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: organization`,
  `organization_type` (Enum: `company`, `team`,
  `abteilung`, `division`, `institution`,
  `publisher`, … — erweiterbar)
- **Optional:** `parent_organization` (String-Slug
  der übergeordneten Organisation;
  Unterorganisationen rekursiv über dieses Feld)
- **Beispielname:** `Stadtwerke Mittelbach.md`
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Organisationen]].
- **SP-2-Präzisierung** (gilt bei aktivem SP-2; kein
  neuer Typ, keine neue Fassade — die Fassade
  Organisationen ist in SP-2 **Pflicht ab Stufe 1**):
  - **Stellen:** jedes Gegenüber mit eigenem Verfahren
    — Gericht, Behörde, Körperschaft, Kammer, Träger,
    auch Schlichtungs-, Güte-, Mediations- und
    Schiedsstellen und private Stellen mit eigenem
    Verfahren — ist ein `organization`-Knoten mit der
    Relation `authority` (Organisation ↔ Zuständigkeit:
    „Stelle X ist zuständig für Y“; Relation inline im
    Knoten, Felder `zustaendig_fuer` und
    `instanz`). **Die Stelle vertritt die
    Zielumgebung:** was in der Systementwicklung die
    Umgebung ist, in die ausgeliefert wird, ist im
    Verfahren die Stelle, bei der eingereicht wird.
  - **Geprüfter Versandweg je Stelle** (Sektion
    `## Versandweg` im Knoten, Pflicht an jeder Stelle
    mit `authority`): Kanal (aus dem Kanal-Grundbestand
    von Outgoing.md; eröffnete elektronische Postfächer
    zuerst), Nummer bzw. Adresse, Postfach-Kennung,
    **Seiten- und Anlagengrenze** je Kanal (bei
    Überschreitung Teilsendungen mit Nachweis je Teil —
    sonst kommen Anlagen nicht an), Standard der
    Erwartung (Wochen bis zur Rückmeldung, Vorgabe für
    die automatische Erwartung je Einreichung,
    SP-2 Katalog-Einreichungen), Prüfvermerk (wann und
    wie der Weg geprüft wurde — Testsendung,
    Impressum, Auskunft). Der Agent schlägt beim
    Versand den geprüften Weg vor; ein ungeprüfter Weg
    ist ein Hinweis im Prüfplan.
  - **Sachbearbeiter und Vertretung** je Stelle stehen
    in [[Ansprechpartner]], nicht hier.
  - **Unverändert:** `organization_type`,
    `parent_organization`, Register-Mechanik und
    `## Meta` der Fassade [[Organisationen]] gelten
    weiter.
