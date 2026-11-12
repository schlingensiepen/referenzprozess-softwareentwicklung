---
type: catalog-entry
art: register
---

# Katalog-Rechercheartefakte

Register-Eintrag: Fassade `research-artifact-log`
([[Rechercheartefakte]]) mit Element-Typ
`research-artifact`.

### research-artifact-log

- **Zweck:** Register aller Rechercheartefakte —
  extern beschafftes Wissen als Nachweis, nicht
  Wahrheit
- **Pflichtfelder:** `type: research-artifact-log`
- **Präfix:** `REC`
- **Datei:** `wiki/Rechercheartefakte.md`
- **Singleton, Basis-Fassade** (optional; Default
  `active: true`)
- **Kanonizität:** ein REC ist Nachweis, eingefroren
  ab Anlage; die Fassaden-Zeile spiegelt den
  Detail-Knoten (`## Meta` der Fassade, Wiki.md
  §1.1a).
- **SP-2-Präzisierung** (gilt bei aktivem SP-2): Das
  Register führt auch die **Normen-REC** (ein
  Rechercheartefakt je Stand des Normen-Pakets, unten
  im Abschnitt `research-artifact`). Die Zeile des
  mitgelieferten Stands trägt der Merge von SP-2 ein
  (Bootstrap der SP-2-Fassade `Wegweiser`) — mit
  „Übernommen als DEC: offen“, bis die Übernahme des
  Stands als Arbeitsgrundlage entschieden ist; ein
  selbst geholter Stand bekommt seine Zeile beim
  Anlegen wie jeder REC.

### research-artifact

- **Zweck:** Ergebnis einer externen Recherche als
  zitierfähiger Nachweis — extern beschafftes
  Wissen ist Nachweis, nicht Wahrheit
- **Klasse:** Nachweis
- **Freeze ab:** Anlage
- **Pflichtfelder:** `type: research-artifact`,
  `id` (Format `REC-NNN`), `titel`, `quelle_liste`
  (Liste; je Quelle Herkunfts-URL **und** Archiv-Pfad
  unter `research/REC-NNN - <Kurzsatz>/`, sofern
  archiviert), `datum`
- **Optional:** `marke` (Marke, zu der die Recherche
  gehört), `alias` (Liste; Wiki.md §4.1)
- **Beispielname:** `REC-001 — Vergleich
  Lizenzmodelle.md`
- **Kanonizität:** Nachweis, eingefroren ab Anlage;
  der Detail-Knoten führt, die Fassaden-Zeile in
  `wiki/Rechercheartefakte.md` spiegelt ihn.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Rechercheartefakte]].
- **SP-2-Präzisierung** (gilt bei aktivem SP-2) —
  **Normen-REC:** die Normtexte des Normen-Pakets sind
  Rechercheartefakte, **einer je Paket-Stand** (nicht
  je Gesetz); Normtexte sind keine eingeführten
  Dokumente, sondern Nachweis, nie Wahrheit, nur
  ergänzt.
  - **Felder:** `titel` „Normen-Paket Stand
    JJJJ-MM-TT“, `datum` (Abrufdatum), `quelle_liste`
    je Gesetz mit Herkunfts-URL, Stand-Zeile und
    Archiv-Pfad, `alias` `normen-<stand>`; Kann-Feld
    **`mitgeliefert: template`** kennzeichnet den vom
    Template mitgelieferten Stand — fehlt es, ist der
    REC projekt-eigen (selbst geholter Stand).
  - **Nummern:** mitgelieferte Stände tragen Nummern
    ab **`REC-9001`** (reservierter Bereich); selbst
    geholte Stände bekommen die nächste freie Nummer
    des Projekts.
  - **Ablage:** `research/REC-NNN - Normen-Paket Stand
    JJJJ-MM-TT/` mit `JJJJ-MM-TT <kuerzel>.xml`, `.pdf`
    (digital erzeugter Beleg, kein Scan), `.md`
    (Lesefassung mit Ankern je Norm) und
    `manifest.tsv` (Prüfsummen, Abrufzeit, Stand-Zeile,
    Zählung); das **Datum des Stands führt** in den
    Dateinamen, ein neuer Stand liegt neben dem alten.
    `raw/` und `input/raw/` bleiben frei; der Abgleich
    C1 (MasterPrompt) greift für Normtexte nicht;
    Herkunft (Quelle, Stand, Werkzeug, Prüfsummen) ist
    im Knoten sichtbar.
  - **Abschnitt „Auffälligkeiten der Quelle“:**
    Pflicht-Abschnitt des Detail-Knotens;
    `tools/normen-holen.py` füllt ihn aus seinen
    Hinweisen (Titel-Abweichung, Slug geändert,
    fehlende Stand-Zeile, Quellvermerk „dokumentarisch
    noch nicht abschließend bearbeitet“, Normen ohne
    amtliche Überschrift, Prüfung der PDF-Signatur);
    menschliche Funde werden als Vermerk angehängt.
    Die Wegweiser von SP-2 (Typ `guide`,
    `Katalog-Wegweiser`) verweisen auf den Abschnitt,
    wo eine Auffälligkeit für die Arbeit zählt.
  - **Freeze und Erneuerung:** eingefroren ab Anlage
    wie jeder REC; ein **neuer Stand ist ein neuer
    REC** neben dem alten (Erneuerung mit dem Upgrade
    oder Holen auf Zuruf mit dem Werkzeug), kein
    bestehender wird geändert; die Übernahme eines
    Stands als Arbeitsgrundlage ist **eine**
    Entscheidung je Stand (Feld „Übernommen als DEC“),
    nicht eine je Gesetz.
  - **Werkzeuge:** `tools/normen-holen.py` (holt und
    legt ab, schreibt den Knoten),
    `tools/wegweiser-quellen.py --pruefen` (prüft die
    Links der Wegweiser auf die Anker der
    Lesefassungen); Aufruf und Ablage:
    `tools/README.md`.
