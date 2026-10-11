---
type: decision-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Entscheidungen

## Meta

- **Typ:** `decision-log` — Register aller
  Entscheidungen des Projekts (universeller
  Mechanismus: jedes Projekt dokumentiert
  Entscheidungen). Singleton.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  siehe Wiki.md §Kategorisierung der Register.
- **Kanonizität:** die Wahrheit bei
  Entscheidungs-Status liegt in dieser Fassade —
  Detail-Knoten (Typ `decision`) spiegeln
  (Wiki.md §1.1a).
- **Eintragsformat:** `### DEC-NNN — <Gegenstand>` mit
  Feldern Status (8-Zustand: offen | aufgeschoben |
  angenommen | in-umsetzung | umgesetzt | abgeschlossen
  | verworfen | abgelöst durch DEC-XXX) / Datum
  (letzter Statuswechsel) / Auslöser (nur bei
  aufgeschoben oder umgesetzt-wartet-auf-Prüfung) /
  Wahl und Begründung (sobald angenommen) / Verweise /
  Detail (Wikilink, nur wenn Detail-Knoten existiert).
- **Freigabe-Einträge (DEC-214):** Zweck-Freigaben
  werden in der kanonischen Formel gebucht: „Stand x
  von ⟨Artefakt⟩, freigegeben für Zweck Z
  [zu Marke M]" — ungenannt gilt die aktuelle
  `in-progress`-Zielmarke; der Eintrag verweist auf
  den exakten versionierten `output/`-Stand.
- **Kollisions-Grep vor Anlage (DEC-212):** vor
  jeder neuen Entscheidung das Register nach
  thematisch verwandten Einträgen durchsuchen; der
  neue Eintrag nennt die geprüften Nachbarn
  (Nachbarschafts-Zeile); widerspricht er einem
  bestehenden, wird erst geklärt (Ablösung oder
  Vermerk), dann gebucht — nie beides stehen
  lassen.
- **Detail-Knoten-Pflicht:** sobald verworfene
  Alternativen, Vermerke, Nachweise oder ausführliche
  Wahl-Begründung anfallen. Einzeilige Einträge
  brauchen keinen Detail-Knoten.
- **`decision`-Detail-Knoten-Konventionen:** Frontmatter
  `type: decision`, `id: DEC-NNN`, `status`
  (8-Zustand), `status_date`, optional `trigger` (Datum
  oder Zielmarken-Bezeichnung, [[Zielmarken]]; nur
  bei aufgeschoben/umgesetzt-wartet-auf-Prüfung),
  `zielmarke` (Marken-Bezeichnung; nur wenn
  verschoben oder für eine Marke geplant),
  `supersedes:` und `superseded-by:` (immer als
  Listen mit DEC-ID-Werten, z.B. `- DEC-012`;
  `superseded-by:` nur bei abgelöst).
  Sektionen: Entscheidung (gewählte Option und
  Begründung) / Verworfene Alternativen / Nachweis (bei
  abgeschlossen mit Umsetzungsarbeit) / Verweise /
  Vermerke (append-only) / Bezüge (Fassaden-Eintrag
  [[Entscheidungen]]). Dateiname
  `DEC-NNN <Gegenstand>.md`.
- **Regeln für Entscheidungs-Einträge:**
  1. **Unveränderlichkeit nach `angenommen`:** der
     Inhalt eines DEC ist eingefroren, sobald der
     Status `angenommen` erreicht. Ausgenommen sind
     nur der YAML-Header (Status,
     Beziehungs-Listen), der sichtbare Kopf-Vermerk
     bei Ablösung, die `## Vermerke`-Sektion
     (append-only) sowie Tippfehler- und
     tote-Verweis-Korrekturen. Alles andere ist ein
     neuer DEC — nur so bleibt datierbar, was wann
     galt.
  2. **Vollständige Ersetzung:** ein Ablöse-DEC
     beantwortet die Frage vollständig neu,
     einschließlich der unverändert bleibenden
     Teile. „Teilweise überholt" oder „gilt weiter
     außer Absatz X" ist unzulässig.
  3. **Ablöse-Beziehungen als Listen, in beide
     Richtungen:** `supersedes:` und
     `superseded-by:` werden immer als Listen mit
     DEC-ID-Werten geführt — auch bei einem
     einzelnen Eintrag — und in beiden Richtungen
     gepflegt (eine Revision kann mehrere alte DECs
     zusammenführen, ein alter DEC in mehrere neue
     zerfallen).
  4. **Nummern nie wiederverwenden:** eine vergebene
     DEC-Nummer bleibt beim Dokument, auch wenn es
     verworfen wurde; Lücken bleiben. Zitierte
     Nummern dürfen nie still umgedeutet werden.
  5. **Sichtbarer Ablöse-Vermerk am Dokumentanfang:**
     wird ein DEC abgelöst, kommt nach dem Titel,
     vor dem ersten Inhalts-Abschnitt der
     Kopf-Banner
     `> **⚠ Abgelöst durch [[DEC-XXX]]** (YYYY-MM-DD)`
     — der Frontmatter-Rückverweis allein wird von
     menschlichen Lesern regelmäßig übersehen.
  6. **Verworfene Alternativen als Pflichtteil:**
     jeder DEC benennt die ernsthaft betrachteten
     Optionen und begründet je verworfener Option,
     warum sie es nicht geworden ist — sonst wird
     die verworfene Lösung später erneut
     vorgeschlagen.

---

**Stand:** _(vom Agenten beim Ingest und laufend
gepflegt)_

Eine chronologische Liste — keine Trennung offen /
getroffen, der Status trägt die Unterscheidung.

## Einträge

_(chronologisch nach ID)_
