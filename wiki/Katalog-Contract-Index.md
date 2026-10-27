---
type: catalog-entry
art: register
process: SP-1
---

# Katalog-Contract-Index

**Ich bin neu in SP-1.** Register-Eintrag: Fassade
`contract-index` ([[Contract-Index]]) mit Element-Typ
`contract`. Beim Prozess-Merge (Wiki.md §11.3) wird
dieser Eintrag als Datei ins Anwender-`wiki/` kopiert
und in [[Katalog]] verankert. Mit RP-1 präzisiert das
Vorgehen die Aushandlung; einen eigenen Typ legt RP-1
nicht an.

### contract-index

- **Zweck:** Register aller Contracts zwischen
  Komponenten; aktiv nur beim Koordinator, der die
  CON-Elemente samt Versionskette führt (der Provider
  führt kein CON-Register)
- **Pflichtfelder:** `type: contract-index`
- **Präfix:** `CON`
- **Datei:** `wiki/Contract-Index.md`
- **Singleton**

### contract

- **Zweck:** vereinbarte Schnittstelle zwischen
  Komponenten (Schnittstelle, Protokoll, Zusagen) —
  Detail-Knoten zum Eintrag im Contract-Index des
  Koordinators; gebucht aus der Meldung des Providers
- **Klasse:** Element
- **Freeze ab:** angenommen (Freigabe durch den
  Provider; gebucht direkt als `angenommen`)
- **Sammelzustand:** nein
- **Pflichtfelder:** `type: contract`, `id` (Format
  `CON-NNN`), `status` (`angenommen`, `abgelöst`,
  `abgeschlossen`), `status_date`, `datum` (seit 2.0)
  (Anlage-Datum `JJJJ-MM-TT`, nie geändert; [[Katalog]]
  §Typ-Konventionen), `quelle` (seit 2.0)
  (Meldung des Providers, die die Freigabe trägt:
  `<provider>/MSG-NNN`, [[Katalog-message]]),
  `provider` (seit 2.0) (Repo-Name der Komponente, die
  den CON verantwortet; ändert sich nur per
  Nachfolge-CON), `abgeleitet_von` (seit 2.0) (Liste;
  das ARC-Element des Zuschnitts, aus dem die
  Schnittstelle folgt — es trägt `provider:` und
  `consumer:`, [[Katalog-Systemarchitektur]]),
  `zielmarke` (seit 2.0) (Marken-Bezeichnung: beim
  Anlegen die `in-progress`-Marke, für Geplantes die
  spätere Marke; Bestand ohne Feld: [[Zielmarken]]
  §Meta).
- **Optional:** `vorgaenger` (Liste: parallel
  geltender Vorgänger ohne Ablösung — Definition im
  [[Katalog]]), `supersedes` (Liste), `superseded_by`
  (Liste), `ueberlagert` (Liste; nur an einem Element
  einer Sackgasse, [[Katalog]] §Typ-Konventionen),
  `alias` (Liste). Kein `trigger`:
  Eintritts-Register ohne `offen`/`aufgeschoben`.
- **Dokumenttypen:** [[Katalog-Uebergabe]],
  [[Katalog-Funktionsbeschreibung-Stand]],
  [[Katalog-Technologie-Entscheidungen]],
  [[Katalog-Spezifikation-Stand]] (der CON geht
  jeweils als Verweis `<koordinator>/CON-NNN` ein)
- **Beispielname:** `CON-001 Terminal-API.md`
- **Kanonizität:** Status kanonisch im
  [[Contract-Index]] des Koordinators (Wiki.md §1.1a),
  ebenso die Consumer-Registrierungen (lebend); der
  Inhalt und `provider` sind ab `angenommen`
  eingefroren und ändern sich nur per Nachfolge-CON.
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Contract-Index]].
- **Cross-Repo-Adressierung:** `<koordinator>/CON-NNN`
  (Qualifizierer Repo-Name; gleiches Muster wie
  `terminal/REQ-014`).
- **Lint:** folgt vom CON über `abgeleitet_von:` zum
  ARC-Element und prüft, dass jeder dort genannte
  Consumer im [[Contract-Index]] registriert ist und
  `provider:` am CON mit dem ARC-Element übereinstimmt
  (eigene Zeile, damit die Pflichtfeld-Zeile oben nur
  die Pflichtfelder trägt — der Lint liest sie wörtlich).
- **Namensformen:** `provider:`/`consumer:` am
  ARC-Element nennen den Komponenten-Namen (Spalte
  „Komponente“ in §Komponenten der
  Architektur-Fassade); `provider:` am CON und die
  Consumer-Registrierungen im Contract-Index nennen
  den Repo-Namen. Der Lint bildet beide über die Zeile
  in §Komponenten aufeinander ab.

## Rollen eines CON in der Kette

Ein CON hat je Phase eine eigene Rolle mit eigenem
Zweck. Dieser Abschnitt ist der führende Ort; die
Phasentabellen der Prozesse und [[Kettenpruefung]]
verweisen hierher.

- **Beim Koordinator (P5, P6):** die Existenz der
  Schnittstelle folgt aus dem Zuschnitt (ARC im
  Architekturdokument, das selbst keine CON filtert);
  in der Übergabe an eine Komponente (P6) gehen die
  angenommenen CON ein, an denen sie beteiligt ist
  ([[Katalog-Uebergabe]]).
- **P4 der Provider-Komponente:** Außensicht dessen,
  was sie anbietet — dort verhandelt; der CON darf
  Protokoll und Format festlegen. Der
  Funktionsbeschreibung-Stand des Providers verweist
  auf `<koordinator>/CON-NNN`. Bei Übernahme-Art
  **Auftrag** vertritt der Übergabe-Stand dieses Glied
  ([[Kettenpruefung]] §Fehlende und vertretene
  Glieder): Die CON, die er nennt, gelten als
  verhandelt; ein neuer CON oder eine Änderung über
  den Übergabe-Stand hinaus ist ein **Rücklauf an den
  Koordinator** (mit RP-1: `Vorgehen-RP-1.md` §10).
- **P7 der Consumer-Komponente:** Einengung der
  Technologie-Wahl; der Technologie-Entscheidungs-Stand
  verweist auf `<koordinator>/CON-NNN`.
- **P8 jeder beteiligten Komponente:** Bauvorgabe; der
  Spezifikations-Stand filtert die CON, an denen die
  Komponente als Provider oder Consumer beteiligt ist.
  **Abdeckung:** jeder CON, für den die Komponente
  Provider ist, wird von mindestens einer SPEC
  umgesetzt (geprüft in der Kettenprüfung des
  Spezifikations-Stands; bei einem Verzicht auf P8
  entfällt die Prüfung mit dem Stand —
  [[Kettenpruefung]] §Fehlende und vertretene
  Glieder).
- **Consumer-Prüfung:** verweist ein Stand einer
  Komponente auf `<koordinator>/CON-NNN`, ist dieser
  CON Vorgänger in der Kettenprüfung (allgemein für
  Verweise auf den Koordinator: [[Kettenpruefung]]
  §Komponenten-Kette nach Übernahme-Art); freigegeben
  wird ein Consumer-Stand erst, wenn der CON beim
  Koordinator gebucht ist. Weiterarbeiten darf die
  Komponente vorher. Wer als Consumer registriert ist:
  [[Contract-Index]] (Meta, Consumer-Registrierungen).
