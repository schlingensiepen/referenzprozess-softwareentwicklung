---
type: catalog-entry
art: dokumenttyp
process: SP-1
---

# Katalog-Spezifikation-Stand

**Ich bin neu in SP-1.** Dokumenttyp-Eintrag: der
Pflicht-Stand „Spezifikation zu Marke M“ der Phase P8
(Kennung `spezifikation-stand`), abgeleitet aus dem
SPEC-Register ([[Katalog-Spezifikationen]]). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### spezifikation-stand

- **Zweck:** „für P9 Ausarbeiten“ — die Ausarbeitung
  darf die Bauanleitung als verlässliche Grundlage
  nehmen.
- **Phase:** P8
- **Verbindlichkeit:** pflicht (dort, wo gebaut wird;
  Verzicht auf P8: [[Kettenpruefung]] §Fehlende und
  vertretene Glieder;
  Koordinator: §Freigabe-Ordnung des Koordinators)
- **Grad:** wiki-verweisend
- **Auslöser:** Standard (Lint-Anteil FUNC → SPEC:
  [[Kettenpruefung]] §Lint-Anteil).
- **Quell-Register und Filter:** [[Spezifikationen]]
  — SPEC der Marke mit Status `angenommen`,
  `in-umsetzung`, `umgesetzt` oder `abgeschlossen`, an
  einer vorgelegten, noch nicht freigegebenen Version
  auch `offen` — im Kopf ausgewiesen, mit der Freigabe
  angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung) —
  (nicht verworfen; für die Marke nicht abgelöst —
  eine SPEC mit Status `abgelöst` gehört dazu, solange
  ihr Nachfolger für die Marke nicht gilt,
  [[Einfrieren-und-Abloesen]] §Stand; mit `zielmarke:`
  dieser oder einer früheren Marke, Bestands-Elemente
  ohne Feld eingeschlossen; Bauanleitung, umsetzbar
  ohne Fachkenntnis); dazu die
  Contracts, an denen die Komponente beteiligt ist,
  als Provider wie als Consumer, jeweils als Verweis
  `<koordinator>/CON-NNN`. Kopiert werden
  referenzierte Glossar-Einträge.
- **Pflichtfelder:** `type: spezifikation-stand`,
  `marke`, `zweck`, `herkunft`, `datum` (seit 2.0)
  (Herkunftszeile und Datum des Stands:
  [[Einfrieren-und-Abloesen]] §Stand)
- **Ablage:** `output/`, versioniert (`_VV_TLA`).
- **Nächstes Glied:** wie der Tag der Implementierung
  (P9) auf diesem Stand freigegeben wird —
  [[Kettenpruefung]] §Code-Glieder.
- **Contracts:** welche CON dieser Stand bei einer
  Komponente abdecken muss —
  [[Katalog-Contract-Index#Rollen eines CON in der Kette]];
  lesen vor der Kettenprüfung dieses Stands.
