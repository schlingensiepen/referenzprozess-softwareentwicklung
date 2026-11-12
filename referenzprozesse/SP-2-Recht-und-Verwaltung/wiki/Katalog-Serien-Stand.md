---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Serien-Stand

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand „Serie
zu Marke M“ der Phase P14 (Kennung `serien-stand`),
abgeleitet aus dem Register [[Serien]]
([[Katalog-Serien]]) — nur bei einer **Serie**
(Massenverfahren, Briefwelle, Strang-Form F1 der
Entscheidungsmatrix, [[Marken-SP-2]] §9). Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### serien-stand

- **Zweck:** „für P13 Einreichen“ — die Einreichung je
  Einheit darf Manifest, Freigabevermerk und
  Signaturstatus je Einheit als verlässliche Grundlage
  nehmen.
- **Phase:** P14
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard; Tag der Fassung (Vorlage der
  Serie) gesetzt, Prüfplan freigegeben; die Freigabe
  erfolgt für die Serie als Ganzes mit Freigabevermerk
  je Einheit.
- **Quell-Register und Filter:** `series-unit`-Elemente
  der Marke aus [[Serien]] mit Status `angenommen` oder
  an einer vorgelegten, noch nicht freigegebenen
  Version auch `offen` — im Kopf ausgewiesen, mit der
  Freigabe angenommen ([[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung); je Einheit (Grundstück,
  Bescheid, Vertrag, Verbraucher, Person, Zeitraum)
  Manifest, Freigabevermerk, Signatur- und
  Versandstatus; die getaggte Vorlage der Serie
  ([[Katalog-Schriftsatz]]) und das Manifest je Einheit
  aus dem Gliederungs-Stand; Empfänger je Einheit aus
  [[Beteiligte]] und [[Organisationen]].
- **Pflichtfelder:** `type: serien-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); die
  Einreichungs-Stände folgen je Empfänger
  ([[Katalog-Einreichung-Stand]]).
- **Pflicht ab Stufe:** 1, nur bei einer Serie.
- **Entfällt abgeleitet, wenn:** die Fassade Serien
  inaktiv ist oder die Marke kein `series-unit`-Element
  trägt.
- **Vertraulichkeit:** `intern`; die Einheiten selbst
  sind `offen` gegenüber ihrem Empfänger.
