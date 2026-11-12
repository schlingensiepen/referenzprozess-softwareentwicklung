---
type: catalog-entry
art: register
process: SP-2
---

# Katalog-Wegweiser

**Ich bin neu in SP-2.** Register-Eintrag: Fassade
`guide-log` ([[Wegweiser]]) mit Element-Typ `guide`.
Beim Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag
als Datei ins Anwender-`wiki/` kopiert und in
[[Katalog]] verankert.

### guide-log

- **Zweck:** Index aller Wegweiser des Projekts —
  Prüflisten je Verfahrensordnung und je
  Querschnittsthema, mit Gegenstand und Hauptgesetzen
- **Pflichtfelder:** `type: guide-log`
- **Präfix:** `—`
- **Datei:** `wiki/Wegweiser.md`
- **Singleton**; Pflicht ab Stufe 1 (Steckbrief)

### guide

- **Zweck:** Wegweiser durch eine Verfahrensordnung
  (Rechtsbehelfe und Fristen mit Berechnungsregeln und
  Fiktionen, Eilrechtsschutz, Begleitanträge-Checkliste,
  Kosten und Kostenanträge, Begründung, Heilung und
  Nachschieben, Erledigung, Prüfraster eingehender
  Entscheidungen, Sicht der Stelle) oder durch ein
  Querschnittsthema (Zustellung und Fristen,
  Elektronischer Rechtsverkehr, Kosten, Streitbeilegung,
  Vorverfahren, Prüfraster, Strafrecht in Grundzügen,
  Bescheid erlassen, Auslands- und EU-Bezug) — oder der
  **Fristenkatalog eines Referenzprozesses** auf SP-2
  (Grundbestand der Fristen je Ordnung mit Entstehung,
  Wirkung, Berechnungsregel und Fundstelle; kommt mit dem
  Referenzprozess, Ordner `referenzprozesse/RP-2N-…/`);
  jede Normaussage mit Link auf den Anker der Norm in der
  Lesefassung des Normen-Pakets
- **Klasse:** außerhalb (template-eigen: das Upgrade
  ersetzt den Knoten samt Teilaufsätzen, das Projekt
  ändert ihn nicht; eigene Notizen stehen in eigenen
  Knoten und verweisen auf den Wegweiser). **Offene
  Liste** bei den Fristenkatalogen heißt: das Template
  erweitert sie mit jedem Release; Ergänzungen des
  Projekts (Fachgesetz, Landesrecht, Satzung) stehen in
  eigenen Knoten — Projekt-Rechercheartefakt oder
  Konzept — und als `source` an der Frist
- **Pflichtfelder:** `type: guide`, `schluessel`
  (Kürzel der Ordnung wie `zpo`, `fgo`, sprechender
  Slug des Querschnitts wie `kosten`, `pruefraster`,
  oder `fristenkatalog-rp-2N` für den Fristenkatalog
  eines Referenzprozesses; kein Präfix, keine Nummer),
  `normen_rec` (ID des
  Normen-REC, für den der Wegweiser geschrieben ist,
  [[Katalog-Rechercheartefakte]]), `normen_stand`
  (Datum dieses Stands `JJJJ-MM-TT`)
- **Beispielname:** `Wegweiser-ZPO.md` mit
  `Wegweiser-ZPO/Wegweiser-ZPO-02-Rechtsbehelfe-und-Fristen.md`
- **Kanonizität:** der Wegweiser-Knoten führt; die Zeile
  in `wiki/Wegweiser.md` spiegelt ihn (Gegenstand,
  Hauptgesetze).
- **Struktur-Konventionen:** `## Meta` der Fassade
  [[Wegweiser]].
- **Teilaufsätze:** ja — Übersichtsseite
  `wiki/Wegweiser-<X>.md`, Teilaufsätze im
  gleichnamigen Unterordner `wiki/Wegweiser-<X>/` mit
  Dateinamen `Wegweiser-<X>-NN-<Titel>.md` (Wiki.md
  §5.4: Übersicht listet alle, Rücklink und Vor/Zurück
  je Teilaufsatz, Dateinamen unter `wiki/` eindeutig,
  `index.md` führt nur die Übersicht)
- **Kopf:** Zeile „Stand der Normtexte“ mit den
  Stand-Zeilen der zitierten Gesetze und Wikilink auf
  den Normen-REC; Zeile „Hinweis“ mit „Wegweiser, keine
  Rechtsberatung; maßgeblich ist der Normtext“; was
  sich am Normtext nicht belegen lässt, ist als „nicht
  im Paket belegt“ gekennzeichnet
- **Stand und Links:** Das Upgrade bringt Wegweiser und
  Normen-Stand gemeinsam. Nach einem Holen auf Zuruf
  bleiben die Wegweiser auf ihrem Stand, zitiert wird
  aus dem neuen REC; der Wächter meldet die Abweichung.
  `tools/wegweiser-quellen.py --pruefen` prüft Links
  und Anker maschinell; **kein Umschreiben der Links im
  Projekt**. Wo eine Auffälligkeit der Quelle für die
  Arbeit zählt, verweist der Wegweiser auf den Abschnitt
  „Auffälligkeiten der Quelle“ des Normen-REC.
- **Erneuerung:** mit dem Normen-Paket je Release des
  Templates (Upgrade: neuer Normen-REC und neue
  Wegweiser gemeinsam); die Erneuerung des Pakets im
  Release-Ablauf ist Sache des Templates, nicht des
  Projekts.
