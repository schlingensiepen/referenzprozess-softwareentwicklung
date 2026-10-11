---
type: internal-concept
---

# Versionsketten

Versionsketten-Detail der `_VV_TLA`-Versionierung:
Beispiel-Kette und Ketten-Regeln, Unveränderlichkeit
versionierter Dokumente, Was-zählt-als-neue-Version.
Wortlaut aus MasterPrompt §4.3–4.5 hierher verlagert;
Grundprinzip (§4.1), Bearbeiterkürzel (§4.2),
Markdown-Arbeitsformat (§4.6) und Snapshots (§4.7)
bleiben im MasterPrompt. Moment: bei Output-Erzeugung
in `output/` und `overview/`.

## Versionskette

Die Versionskette wechselt zwischen Bearbeitern:

```
Dokument_01_AIG.docx   ← KI erstellt Entwurf
Dokument_02_ABC.docx   ← User überarbeitet
Dokument_03_AIG.docx   ← KI arbeitet weiter
Dokument_04_ABC.docx   ← User finalisiert
```

Regeln:

- Die KI verwendet immer die nächste freie
  Versionsnummer und das Kürzel `AIG`.
- Wenn der User eine Version erstellt hat, arbeitet
  die KI auf dieser Basis weiter.
- Es gibt keine Lücken in der Versionsnummerierung.
- Vor Weiterarbeit prüft die KI, ob eine neuere
  Version mit User-TLA vorliegt.

**Snapshots in `overview/`** folgen derselben
Versionskette — siehe `Wiki.md`.

## Unveränderlichkeit versionierter Dokumente

Dokumente, die der Versionierung unterliegen
(`output/` und `overview/`), werden **nie
überschrieben und nie gelöscht**. Jede Änderung
erzeugt eine **neue Version**.

## Was zählt als neue Version

Eine neue Version entsteht bei:

- Inhaltlichen Änderungen
- Korrekturen (Rechtschreibung, Formatierung)
- Weiterbearbeitung durch einen anderen Bearbeiter

Keine neue Version entsteht bei:

- Lesen oder Analysieren
- Verschieben oder Kopieren ohne Änderung

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzformen: MasterPrompt §4.3–4.5;
  Grundprinzip und TLA: MasterPrompt §4.1/§4.2
- Namensschema `_VV_TLA`: MasterPrompt §3.1
- Snapshots aus dem Wiki: MasterPrompt §4.7,
  `Wiki.md`
