---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Systemarchitektur

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`system-architecture-overview` ([[Systemarchitektur]])
mit dem Element-Typ `architecture-description` (ARC)
und den Entitäts-Typen `system-component` und `system`.
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert. Mit RP-1: der Eintrag
`Katalog-Softwaresystemarchitektur` ersetzt
Fassaden-Typ und `system-component`.

### system-architecture-overview

**abgelöst durch software-system-architecture-overview (aus Prozess RP-1)**

- **Zweck:** Fassade der Systemarchitektur — Register
  der Architektur-Festlegungen (ARC) und lebende
  Übersicht (Zweck und Abgrenzung, Komponenten mit
  Lage, Beziehungen, Verantwortungen,
  Design-Prinzipien)
- **Pflichtfelder:** `type: system-architecture-overview`
- **Präfix:** `ARC`
- **Datei:** `wiki/Systemarchitektur.md`
- **Singleton**

### architecture-description

- **Zweck:** Architektur-Festlegung — Struktur-
  Beschreibung ohne Alternativen-Abwägung (Zuschnitt
  und Zuständigkeit einer Komponente, Kommunikation
  über Contracts, Lage); verhält sich zu DEC wie FUNC
  zu DEC (Detail-Knoten zum ARC-Eintrag der Fassade)
- **Klasse:** Element
- **Freeze ab:** angenommen
- **Sammelzustand:** offen (Vorstatus `offen` ohne
  `aufgeschoben`; Annahme einzeln oder im Freigabe-Zug
  des ersten Stands, der das Element verweist —
  [[Einfrieren-und-Abloesen]] §Eintrittsregel)
- **Pflichtfelder:** `type: architecture-description`,
  `id` (Format `ARC-NNN`), `status` (Werte nach
  [[Register-Lebenszyklus]]), `status_date`, `datum`
  (seit 2.0) (Anlage-Datum `JJJJ-MM-TT`, nie geändert;
  [[Katalog]] §Typ-Konventionen),
  `abgeleitet_von` (Liste der DEC und FUNC, auf die
  sich die Festlegung stützt), `zielmarke` (seit 2.0)
  (Marken-Bezeichnung: beim Anlegen die
  `in-progress`-Marke, für Geplantes die spätere Marke;
  Bestand ohne Feld: [[Zielmarken]] §Meta)
- **Optional:** `supersedes` (Liste),
  `superseded_by` (Liste), `ueberlagert` (Liste; nur
  an einem Element einer Sackgasse, [[Katalog]]
  §Typ-Konventionen), `alias` (Liste);
  **`provider`** und **`consumer`** (Liste) am
  ARC-Element, aus dem ein Contract abgeleitet wird —
  Komponenten-Namen aus der Spalte „Komponente“ in
  §Komponenten der Fassade (nicht der Repo-Name, den
  CON und Contract-Index führen; Abbildung beider
  Formen: [[Katalog-Contract-Index]]);
  Pflicht an einem solchen Element, weil der Lint vom
  CON über `abgeleitet_von:` hierher folgt und die
  Consumer-Registrierungen und `provider:` des CON
  dagegen prüft ([[Katalog-Contract-Index]]). Kein
  `trigger`: Sammelzustand `offen` ohne
  `aufgeschoben`, nichts zu reaktivieren.
- **Dokumenttypen:** [[Katalog-Architekturdokument]],
  [[Katalog-Uebergabe]]
- **Beispielname:** `ARC-001 Zuschnitt in Komponenten.md`
- **Kanonizität:** Wahrheit bei Status-Drift liegt in
  `wiki/Systemarchitektur.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Systemarchitektur]].
- **Cross-Repo-Adressierung:** `<repo>/ARC-NNN`
  (Qualifizierer Repo-Name).

### system-component

**abgelöst durch software-system-component (aus Prozess RP-1)**

- **Zweck:** einzelne Komponente des Systems (Modul,
  Baugruppe, Dienst) — Detail-Knoten zur Zeile in
  §Komponenten der Fassade; Name und Lage stehen dort
- **Klasse:** außerhalb (Entität; die Lage wird im
  Stand kopiert)
- **Pflichtfelder:** `type: system-component`
- **Optional:** `system_component_type` — Enum-Feld
  (Konvention `<typ>_type`): `service` | `library` |
  `component` | `module` | `baugruppe` (erweiterbar)
- **Beispielname:** `Auth Modul.md`, `Sensorik Baugruppe.md`
- **Kanonizität:** Wahrheit bei Drift liegt in
  `wiki/Systemarchitektur.md` (Wiki.md §1.1a).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Systemarchitektur]].
- **Register:** §Komponenten der Fassade
  [[Systemarchitektur]] — eine Zeile je Komponente mit
  Lage; Detail-Knoten-Pflicht nach der
  Anlage-Schwelle in deren `## Meta` (eigener
  Bearbeiter/Peer-Agent, Contract oder eigenes Repo →
  Pflicht).

### system

- **Zweck:** das entwickelte System als Ganzes oder
  ein relevantes Umsystem/Nachbar-System
  (Detail-Knoten zur Systemarchitektur-Fassade)
- **Klasse:** außerhalb
- **Pflichtfelder:** `type: system`
- **Beispielname:** `Lagerverwaltung.md`,
  `Umsystem ERP.md`
- **Kanonizität:** Kanonizität und Indexierung über
  die Fassade [[Systemarchitektur]] (§Zweck und
  Abgrenzung bzw. §Beziehungen) — es gibt kein
  eigenes Systeme-Register.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Systemarchitektur]].
