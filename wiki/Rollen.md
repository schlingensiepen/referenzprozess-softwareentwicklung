---
type: role-log
active: true   # Pflicht durch SP-1 (der Konzept-Stand kopiert die Rollen; Wiki.md §3a) — beim Starter-Bau aktiviert; führend: wiki/Fassaden.md
---

# Rollen

## Meta

- **Typ:** `role-log` — Register der
  Rollen-Definitionen: Rollen im Prozess, den das
  Ergebnis des Projekts unterstützt (z.B.
  Sachbearbeiter, Antragsteller, Freigeber,
  Endnutzer) — domänen-agnostisch. Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Art der Rolle:** Feld `rolle_art` am `role`-Knoten
  (erweiterbares Enum). Der aktive Prozess nennt seine
  Werte — mit SP-1 `verwendungsrolle` (Rolle im
  Nutzer-Prozess des Entwicklungs-Ergebnisses). Nicht
  in dieses Register gehören die Rollen der
  Projekt-Arbeit selbst (Anwender, Agent, Reviewer,
  Sub-Agent; mit SP-1 auch Koordinator, Komponent,
  Standalone) — das sind Konstanten der Mechanik.
- **Klasse:** außerhalb — die Definitionen sind lebend;
  ein Stand kopiert die Rollen, auf die er verweist
  ([[Einfrieren-und-Abloesen]] §Kopien).
- **Kanonizität und führender Ort:** die Wahrheit bei
  Status und Kurzbeschreibung liegt in dieser Fassade;
  Detail-Knoten (Typ `role`) spiegeln (Wiki.md §1.1a).
  Rollen-Definitionen leben nur hier — Bedarfe
  ([[Bedarfe]]), Szenarien ([[Szenarien]]) und ihre
  Spezialisierungen durch einen Prozess referenzieren
  Rollen per `rollen:`-Frontmatter-Feld und definieren
  sie nicht inline neu. Taucht beim Ausformulieren
  eine neue Rolle auf, wird sie **zuerst** hier
  angelegt und **dann** referenziert.
- **Wer eine Rolle innehat**, ist eine Relation
  (Muster wie [[Mitgliedschaften]]), keine
  Rollen-Definition.
- **Eintragsformat:** `### <Rollen-Name>` (alphabetisch
  sortiert) mit Feldern Art (`rolle_art`) / Status
  (`aktiv` oder `verworfen`; die Status-Achse der
  Ketten-Register gilt nicht, Klasse außerhalb) /
  Datum (letzter Statuswechsel) /
  Kurzbeschreibung / Verwendet in ([[…]] —
  Rückverweis-Sammler auf die referenzierenden Knoten)
  / Detail (Wikilink, nur wenn Detail-Knoten
  existiert).
- **`role`-Detail-Knoten-Konventionen:**
  Frontmatter-Felder: [[Katalog-Rollen]] — lesen beim
  Anlegen eines `role`-Knotens. Body: ausformulierte
  Beschreibung (Verantwortlichkeiten,
  Verhaltens-Muster, typische Aufgaben, Abgrenzungen
  zu ähnlichen Rollen). Rückverlinkung ist
  Standardaufgabe im selben Vorgang — Vor- und
  Rückverweise werden gemeinsam gepflegt.
- **Prozess-Ergänzungen:** ein Prozess darf am
  `role`-Knoten Felder ergänzen (mit RP-1
  `system_abbildung:` für die technische Abbildung der
  Rolle im entwickelten System); ein eigenes Register
  entsteht dadurch nicht.

---

**Bearbeitungsstand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

## Einträge

_(Rollen alphabetisch sortiert)_
