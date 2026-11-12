# Werkzeuge des Prozesses Recht und Verwaltung

Werkzeuge in Python 3 (ab 3.8), nur Standardbibliothek, kein Zusatzpaket:

- `tools/normen-holen.py` lädt Bundesgesetze von
  <https://www.gesetze-im-internet.de/> (XML und PDF), wandelt das XML
  **mechanisch, ohne Sprachmodell** in Markdown und legt einen Paket-Stand
  als Rechercheartefakt ab. Der Gesetzestext wird weder umformuliert noch
  gekürzt oder „korrigiert“; jede Zeile des Markdowns entsteht
  deterministisch aus einem Element des XML.
- `tools/wegweiser-quellen.py` prüft die Links der Wegweiser auf die Anker
  der Lesefassungen und erzeugt auf Wunsch die Liste aller zitierten Normen.
- `tools/frist-rechnen.py` rechnet aus Ereignis- bzw. Zugangsdatum und
  Fristangabe das Fristende mit Wochentag, verschiebt bei Wochenende und
  bundeseinheitlichem Feiertag und gibt das heutige Datum mit Wochentag aus
  — damit das Modell nie selbst mit Daten rechnet (Abschnitt
  „frist-rechnen“).

Alle kommen mit dem Prozess ins Projekt-`tools/` und werden in `Tools.md`
unter „Projekt-Skripte“ mit Zweck und Aufruf registriert. Der Anwender
braucht Python 3 zum Erneuern, Nachladen, Prüfen und Fristenrechnen; zum
Lesen der Wegweiser und Normtexte nicht.

## Ablage: ein Rechercheartefakt je Paket-Stand

Normtexte sind extern beschafftes Wissen — **Nachweis, nicht Wahrheit** —
und liegen deshalb als Rechercheartefakt, **eines je Stand des Pakets**
(nicht je Gesetz). Ein Stand ist ab Anlage eingefroren; ein neuer Stand ist
ein neues Rechercheartefakt neben dem alten (Nachweise wachsen nur). `raw/`
und `input/raw/` bleiben frei: Normtexte sind keine eingeführten Dokumente.

```
tools/normen-holen.py                                  das Lade-Werkzeug
tools/normen-liste.tsv                                 Eingabe: Liste der Gesetze
tools/wegweiser-quellen.py                             Prüfung der Wegweiser-Links
tools/frist-rechnen.py                                 Fristende und Wochentag
tools/README.md                                        diese Datei
research/REC-NNN - Normen-Paket Stand JJJJ-MM-TT/      ein Ordner je Stand
    JJJJ-MM-TT <kuerzel>.xml                           amtliches XML (aus xml.zip entpackt)
    JJJJ-MM-TT <kuerzel>.pdf                           PDF der Quelle (digital erzeugter Beleg, kein Scan)
    JJJJ-MM-TT <kuerzel>.md                            Lesefassung mit Ankern je Norm
    JJJJ-MM-TT <kuerzel> <bild>                        Bilddateien aus dem ZIP (selten)
    manifest.tsv                                       Prüfsummen, Abrufzeit, Stand-Zeile, Zählung je Gesetz
    JJJJ-MM-TT normen-holen.log                        Lauf-Log des einen Laufs
wiki/REC-NNN — Normen-Paket Stand JJJJ-MM-TT.md        Detail-Knoten des Rechercheartefakts
```

Das **Datum des Stands führt** im Ordnernamen (hinter der Nummer) und vorn in
jedem Dateinamen, damit niemand sucht. Das mitgelieferte Paket trägt eine
Nummer ab `REC-9001` (reservierter Bereich) und im Knoten das Kennzeichen
`mitgeliefert: template`; ein selbst geholter Stand bekommt die nächste freie
Nummer des Projekts und kein Kennzeichen. Das ZIP der Quelle wird nicht
gespeichert; seine Prüfsumme steht im Manifest.

**Der Knoten** `wiki/REC-NNN — Normen-Paket Stand JJJJ-MM-TT.md` wird vom
Werkzeug angelegt (Frontmatter mit `quelle_liste` je Gesetz, Abschnitte
Frage, Recherche-Verlauf, Fundstellen, Ergebnis, Auffälligkeiten der Quelle,
Vermerke, Bezüge). Den Abschnitt **„Auffälligkeiten der Quelle“** füllt das
Werkzeug zwischen zwei Markierungen aus seinen Hinweisen — Titel-Abweichung,
geänderter Slug, fehlende Stand-Zeile, Quellvermerk „dokumentarisch noch nicht
abschließend bearbeitet“, Gesetze ohne amtliche Paragraphenüberschriften,
Prüfung der PDF-Signatur, mehrere Abrufdaten in einem Stand — einmal, am Ende
des Laufs, der den Stand anlegt; danach fasst das Werkzeug den Knoten nicht
mehr an. Menschliche Funde kommen als Vermerk in den Abschnitt „Vermerke“. Die
Übernahme eines Stands als Arbeitsgrundlage ist eine Entscheidung je Stand
(Register-Zeile, Feld „Übernommen als DEC“).

## Gesetzesliste `tools/normen-liste.tsv`

Tab-getrennt, UTF-8, eine Kopfzeile:

| Spalte | Inhalt |
| --- | --- |
| `kuerzel` | Dateiname des Gesetzes im Paket: `a–z`, `0–9`, `_`, `-` (keine Umlaute), z. B. `sgb10` |
| `slug` | Pfad auf gesetze-im-internet.de, z. B. `ao_1977` für `https://www.gesetze-im-internet.de/ao_1977/` |
| `titel` | Titel genau wie im Inhaltsverzeichnis `gii-toc.xml` |
| `gruppe` | freie Gruppierung (Prozessordnung, Verwaltungsverfahren, Kosten, …) |

Die Slugs sind nicht immer naheliegend (`ao_1977`, `sgb_10`,
`vwzg_2005`, `gkg_2004`, `berathig` für das Beratungshilfegesetz). Sie
wurden über das Inhaltsverzeichnis
<https://www.gesetze-im-internet.de/gii-toc.xml> ermittelt (Titel und
Link auf `…/<slug>/xml.zip`). Das Werkzeug prüft sie bei jedem Lauf
erneut dagegen:

- Slug steht im Inhaltsverzeichnis → verwendet; weicht der Titel ab,
  Hinweis `TITEL-ABWEICHUNG`.
- Slug fehlt, der Titel ergibt genau einen Treffer → der gefundene Slug
  wird verwendet, Hinweis `SLUG-GEAENDERT` mit dem neuen Wert zum
  Nachtragen in der Liste.
- sonst Fehler `SLUG-UNBEKANNT`.

**Ein weiteres Gesetz aufnehmen** (Bundesrecht außerhalb des Pakets, etwa
ein Fachgesetz mit eigener Frist): Titel in `gii-toc.xml` suchen, Slug aus
dem Link ablesen, Zeile ergänzen, `--liste-pruefen` laufen lassen, dann mit
`--nur <kuerzel>` holen — das Ergebnis ist ein neues Rechercheartefakt des
Projekts (nächste freie Nummer, heutiges Datum). Gescannte Normen (etwa eine
Satzung) holt das Werkzeug nie; der Anwender bringt sie als gewöhnliches
Eingangsdokument über `raw/` ein. Landesrecht kommt nur als Verweis oder als
eigenes Rechercheartefakt aus der amtlichen Quelle, nicht über das Werkzeug.

## Aufruf `normen-holen.py`

```
python3 tools/normen-holen.py [--nur KUERZEL[,…]] [--liste-pruefen]
                              [--rec REC-NNN] [--stand JJJJ-MM-TT] [--mitgeliefert]
                              [--liste DATEI] [--ziel ORDNER] [--log DATEI]
python3 tools/normen-holen.py --help
```

| Option | Wirkung |
| --- | --- |
| (keine) | alle Gesetze der Liste als neuen Stand von heute: neuer Ordner mit der nächsten freien Nummer, Manifest, Log und Knoten |
| `--nur vwgo,ao` | nur diese Kürzel — das Ergebnis ist trotzdem ein eigener, abgeschlossener Stand |
| `--liste-pruefen` | nur die Slugs gegen `gii-toc.xml` prüfen (eine Anfrage); legt keinen Stand an |
| `--rec REC-NNN` | Nummer des neuen Rechercheartefakts (Vorgabe: nächste freie Projekt-Nummer unterhalb von 9001); eine vergebene Nummer wird abgelehnt |
| `--stand JJJJ-MM-TT` | Datum des neuen Stands im Ordner- und Dateinamen (Vorgabe: heute); ein Datum, zu dem schon ein Ordner liegt, wird abgelehnt |
| `--mitgeliefert` | Kennzeichen `mitgeliefert: template` in den Knoten setzen (Erneuerung des Pakets im Template) |
| `--liste` | andere Gesetzesliste (Vorgabe `tools/normen-liste.tsv`) |
| `--ziel` | Projekt-Wurzel mit `research/` und `wiki/` (Vorgabe: Elternordner von `tools/`) |
| `--log` | Log-Datei (Vorgabe `<neuer REC-Ordner>/<Stand> normen-holen.log`); nie im Ordner eines bestehenden Stands |

Langer Lauf im Hintergrund, z. B.:

```
nohup python3 tools/normen-holen.py >/dev/null 2>&1 &
tail -f "research/REC-"*" - Normen-Paket Stand $(date +%F)/$(date +%F) normen-holen.log"
```

**Eingefroren — ein Lauf, ein Stand.** Ein Lauf legt genau einen neuen
REC-Ordner an und schreibt nur dorthin (Dateien, Manifest, Log) sowie einmal
den neuen Knoten. Liegt der Ordner des genannten Stands schon vor — gleich
ob mit Knoten, Register-Zeile oder Kennzeichen `mitgeliefert` oder ohne —,
bricht das Werkzeug mit Aufruf-Fehler ab („Stand … liegt vor und ist
eingefroren; neuer Stand braucht einen neuen Ordner“) und schreibt nichts.
Es gibt keinen Schalter zum Überschreiben, kein Fortsetzen eines Laufs
desselben Tages, kein Nachbessern einzelner Gesetze und kein Neu-Konvertieren
eines bestehenden Stands; auch `--log` darf nicht in den Ordner eines
bestehenden Stands zeigen. Ein geänderter Konverter, ein nachgeholtes Gesetz
oder ein Fehler im Lauf führt zu einem **neuen Stand** (neuer Lauf, neuer
REC); der alte bleibt, wie er ist. Das Manifest wird nach jedem Gesetz
geschrieben, der Knoten am Ende des Laufs. Abbruch (Strg-C) oder ein
Gesetz mit FEHLER lässt den angefangenen Ordner stehen (Status im Manifest,
bei Abbruch ohne Knoten); das Werkzeug löscht nie — den Rest eines
abgebrochenen Laufs entfernt der Anwender von Hand und startet neu.

**Netz.** Nur `https://www.gesetze-im-internet.de/` (andere Hosts und
Umleitungen dorthin werden abgelehnt). User-Agent `normen-holen/1.1`,
höchstens eine Anfrage je 1,1 s, Zeitlimit 60 s je Anfrage, bis zu fünf
Versuche mit exponentiellem Backoff (2, 4, 8, 16 s; `Retry-After` wird
bei 429/503 beachtet). HTTP 404 und andere 4xx werden nicht wiederholt.
Je Gesetz drei Anfragen (xml.zip, Startseite, PDF), dazu einmal das
Inhaltsverzeichnis.

**PDF.** Der Dateiname der Quelle schwankt (`VwGO.pdf`, `BJNR…pdf`, …); das
Werkzeug liest den PDF-Link aus dem HTML der Startseite
`https://www.gesetze-im-internet.de/<slug>/` und legt die Datei unter
`JJJJ-MM-TT <kuerzel>.pdf` ab.

## Prüfungen

Ein Gesetz ist erst `fertig`, wenn alle Prüfungen bestehen:

1. **ZIP-Integrität:** `xml.zip` lesbar, CRC aller Mitglieder korrekt
   (`testzip`), genau eine XML-Datei, nur unbedenkliche Dateinamen.
2. **XML wohlgeformt** (Parser der Standardbibliothek).
3. **Normenzahl:** jedes `<norm>` des XML wird eingeordnet als Rahmen
   (das erste `<norm>` mit dem Langtitel), Gliederungseinheit
   (`<gliederungseinheit>` in den Metadaten) oder Einzelnorm (alles
   andere: Paragraphen, Artikel, Anlagen, Inhaltsübersicht,
   Eingangsformel …). Geprüft wird: Rahmen + Gliederung + Einzelnormen =
   Zahl der `<norm>`; Zahl der Einzelnorm-Anker im MD = Einzelnormen im
   XML; Zahl der Gliederungs-Anker im MD = Gliederungseinheiten im XML.
4. **Textabgleich je Abschnitt:** die Folge aller Buchstaben und Ziffern
   (Unicode NFC) jeder Norm — Bezeichnung, Überschrift, Text,
   Fußnoten — im XML ist gleich der Folge im zugehörigen MD-Abschnitt,
   nachdem dort die vom Konverter eingefügten Marken (Anker,
   HTML-Tags, Fußnoten-Verweise, `[Hinweis des Konverters: …]`,
   Bildverweise, Label „Fußnote“) entfernt sind. Damit fällt jeder
   verschluckte, verdoppelte oder vertauschte Text auf; Satzzeichen und
   Leerraum werden nicht verglichen.
5. **PDF** beginnt mit `%PDF` (Signatur, nicht Inhalt).

Das Manifest `manifest.tsv` hält je Gesetz: `kuerzel`, `slug`,
`xml_url`, `pdf_url`, `sha256_zip`, `sha256_xml`, `sha256_pdf`,
`sha256_md`, `abrufzeit` (ISO 8601), `stand` (Stand-Angabe aus dem XML,
`standtyp` „Stand“), `builddate` (aus dem XML), `normen_xml` (alle
`<norm>`), `einzelnormen_xml`, `einzelnormen_md`, `konverter`
(Konverter-Version), `status` (`fertig` oder `fehler: <CODES>`),
`hinweise` (Hinweise des Laufs für den Knoten).

**Bekannte Form des mitgelieferten Manifests.** Das Manifest des
mitgelieferten Stands 2026-11-05 (`REC-9001`) wurde mit einer früheren
Fassung des Werkzeugs erzeugt und trägt die Spalten `kuerzel` bis `status`
**ohne** `hinweise`. Es wird nicht umgeschrieben (der Stand ist eingefroren);
ein neuer Stand erhält das Manifest in der vollen Form mit `hinweise`.

Die Prüfsummen erlauben es, jede Datei eines Stands später gegen das
Manifest zu prüfen (etwa beim Kopieren in ein anderes Projekt):
`sha256sum "research/REC-NNN - Normen-Paket Stand JJJJ-MM-TT/JJJJ-MM-TT ao.xml"`
gegen die Spalte `sha256_xml`.

## Markdown-Form

- **Kopf:** Titel (`#`), Kurztitel, Abkürzung, Ausfertigungsdatum,
  Fundstelle, alle Stand-Angaben, builddate, Quell-URLs (XML, PDF,
  Startseite), Abrufzeit, sha256 von ZIP und XML, Konverter-Version und
  der Hinweis: „Mechanisch aus dem XML von gesetze-im-internet.de
  erzeugt; nicht die amtliche Verkündungsfassung (maßgeblich ist das
  Bundesgesetzblatt). Amtliches Werk, gemeinfrei nach § 5 UrhG.“
- **Vorspann:** Dokumentationshinweise der Rahmen-Norm
  (`(+++ Textnachweis … +++)`) als Fußnoten-Block.
- **Gliederung:** Bücher, Teile, Abschnitte, Titel … als Überschriften;
  Ebene aus der `gliederungskennzahl` (je drei Ziffern eine Ebene:
  Ebene 1 → `##`, Ebene 2 → `###`, höchstens `######`), Text
  „Bezeichnung – Titel“.
- **Einzelnormen:** Überschrift eine Ebene unter der aktuellen
  Gliederung (höchstens `######`), Text „Bezeichnung Überschrift“, z. B.
  `#### § 80` (die VwGO hat keine amtlichen Paragraphen-Überschriften)
  oder `#### § 199 Beginn der regelmäßigen Verjährungsfrist und
  Verjährungshöchstfristen`.
- **Absätze** als Absätze; Zeilenumbrüche im XML (`<BR/>`) als harter
  Umbruch (`\` am Zeilenende).
- **Nummern und Aufzählungen** (`<DL>`) als Markdown-Liste, die
  Original-Marke bleibt Text: `- 1\. bei der Anforderung …`, `- a) …`,
  `- 3a. …`. Der Backslash verhindert, dass ein Renderer neu nummeriert;
  Verschachtelung über Einrückung.
- **Tabellen:** einfache Tabellen als Pipe-Tabelle (ohne Kopfzeile im
  XML mit leerer Kopfzeile), Tabellen mit verbundenen Zellen als
  HTML-`<table>` mit `colspan`/`rowspan`. Mehrzeilige Zellen mit `<br>`.
- **Fußnoten:** Fußnoten-Blöcke einer Norm (`<fussnoten>`) als Zitat-
  block mit **Fußnote**; Fußnoten-Verweise im Text (`<FnR>`) als
  Markdown-Fußnote `[^<anker>-fn1]` mit Definition am Ende der Norm;
  Fußnoten-Definitionen stehen an der Stelle des XML; Fußnoten ohne
  Verweis-Element (z. B. Sternchen im Titel) als sichtbarer Absatz
  `[Hinweis des Konverters: Fußnote „*“] …`; in Tabellenzellen inline
  mit derselben Marke; vorformatierte
  Dokumentationsblöcke (`<pre>`) als Code-Block.
- **Nicht darstellbare Elemente** werden kenntlich gemacht, nicht
  verschluckt: Abbildungen als Bildverweis auf die Bilddatei im selben
  Ordner (`JJJJ-MM-TT <kuerzel> <bild>`) plus `[Hinweis des Konverters:
  Abbildung … nicht als Text darstellbar …]`; XML-Elemente ohne eigene
  Regel übernehmen ihren Text und erzeugen im Log den Hinweis
  `ELEMENT-UNBEKANNT`.
- **Tabellen- und Übersichtstitel** (`<Title>`, `<Ident>`, z. B. in
  Inhaltsübersichten und Anlagen) als fetter Absatz; Füllzeichen-Linien
  (`<Split>`) zwischen Text und Betrag als ` … `.
- **Escaping:** `*`, `_`, `` ` ``, `[`, `]`, `\` werden mit Backslash,
  `<` als `&lt;` geschrieben; Zeilenanfänge, die ein Renderer als
  Überschrift, Zitat oder Liste läse, werden entschärft.

### Anker (stabile Sprungziele)

Vor jeder Einzelnorm- und Gliederungs-Überschrift steht eine eigene
Zeile mit einem HTML-Anker:

```
<a id="p80"></a>
#### § 80
```

Gewählt, weil `{#p80}` (Pandoc-Attribut) in GitHub, Obsidian und den
meisten Wiki-Renderern nicht ausgewertet wird, ein leeres
`<a id>` dagegen in GitHub, GitLab, Wiki.js, VS Code und Pandoc
funktioniert und in Obsidian unsichtbar bleibt.

- **Link im Markdown/Web** (aus `wiki/`):
  `../research/REC-9001%20-%20Normen-Paket%20Stand%202026-11-05/2026-11-05%20vwgo.md#p80`
  — Leerzeichen im Pfad sind als `%20` zu schreiben, aus einem Teilaufsatz
  (`wiki/Wegweiser-X/`) mit `../../research/…`.
- **Obsidian-Wikilink:** über die Überschrift, z. B.
  `[[2026-11-05 vwgo#§ 80]]` (Obsidian springt auf Überschriften, nicht
  auf HTML-Anker).

Bildung des Ankers aus der Bezeichnung (`<enbez>`): `§` → `p`, `§§` →
`pp`, `Art`/`Artikel` → `art`, Umlaute transliteriert, Kleinbuchstaben,
alles andere → `-`; die Zahl schließt ohne Bindestrich an. Beispiele:
`§ 80` → `p80`, `§ 80a` → `p80a`, `Art 19` → `art19`, `§§ 1 bis 3` →
`pp1-bis-3`, `(XXXX) §§ 15 bis 20` → `pp15-bis-20` (vorangestellte
Klammer entfällt), `Anlage 1` → `anlage-1`, `Inhaltsübersicht` →
`inhaltsuebersicht`. Doppelte Bezeichnungen erhalten in Dokumentfolge
`-2`, `-3`. Gliederungs-Anker: `gl-<gliederungskennzahl>`, z. B.
`gl-010020`. Einzelnorm-Anker beginnen nie mit `gl-`.

## Meldungen und Exit-Codes

Vorbild ist das mitgelieferte Prüfprogramm `tools/lint.sh`: je Befund eine
Zeile `FEHLER|HINWEIS  CODE  ort: text`, ergänzt um Ursache und Abhilfe —
was ist passiert, wo, warum, was tun.

**Form einer Befund-Zeile** (stderr und Log-Datei, mit Zeitstempel):

```
<Zeit>  FEHLER   CODE  <kuerzel>: <was ist passiert, mit URL/Datei> — Ursache: <warum> — Abhilfe: <was tun>
<Zeit>  HINWEIS  CODE  <kuerzel>: …
<Zeit>  INFO     <Fortschritt>
```

Aufruf-Fehler: `normen-holen: <was> — Abhilfe: <was tun>` auf stderr.

| Code | Schwere | Bedeutung | Abhilfe |
| --- | --- | --- | --- |
| `SLUG-UNBEKANNT` | FEHLER | Slug und Titel nicht im Inhaltsverzeichnis | Titel in `gii-toc.xml` suchen, Liste korrigieren |
| `SLUG-GEAENDERT` | HINWEIS | Slug über den Titel neu gefunden und verwendet | Liste nachziehen |
| `TITEL-ABWEICHUNG` | HINWEIS | Titel in der Liste ≠ Inhaltsverzeichnis | Liste nachziehen |
| `TOC-XML` | FEHLER | Inhaltsverzeichnis nicht lesbar | später erneut |
| `URL-FREMD` | FEHLER | URL oder Umleitung außerhalb von gesetze-im-internet.de | Slug/Startseite prüfen |
| `HTTP-404`, `HTTP-<n>` | FEHLER | Server liefert 404 bzw. anderen 4xx-Status | Slug prüfen, später erneut |
| `NETZ-WIEDERHOLUNG` | HINWEIS | Versuch gescheitert, Wiederholung folgt | — |
| `NETZ` | FEHLER | nach fünf Versuchen nicht ladbar | Verbindung/Proxy/Sandbox prüfen, erneut starten |
| `ZIP`, `ZIP-NAME`, `ZIP-INHALT` | FEHLER | ZIP beschädigt, unsicherer Name, nicht genau ein XML | neuer Stand |
| `XML`, `XML-LEER` | FEHLER | XML nicht wohlgeformt bzw. ohne `<norm>` | neuer Stand |
| `PDF-LINK`, `PDF-MEHRDEUTIG` | FEHLER / HINWEIS | kein bzw. mehrere PDF-Links auf der Startseite | Startseite ansehen |
| `PDF-SIGNATUR` | FEHLER | PDF beginnt nicht mit `%PDF` | neuer Stand |
| `NORMENZAHL` | FEHLER | Normen XML ≠ Abschnitte MD | Konverter korrigieren, neuer Stand |
| `TEXTABGLEICH` | FEHLER | Buchstaben/Ziffern eines Abschnitts weichen ab | dito |
| `KONVERTER` | FEHLER | Ausnahme im Konverter | dito |
| `ELEMENT-UNBEKANNT` | HINWEIS | XML-Element ohne eigene Regel, Text übernommen | ggf. Regel ergänzen |
| `BILD-FEHLT` | HINWEIS | Abbildung im XML referenziert, nicht im ZIP | PDF ansehen |
| `XML-DRIFT` | FEHLER | eben geschriebenes XML weicht beim Rücklesen von seiner Prüfsumme ab | Datenträger prüfen, neuer Stand |
| `KNOTEN-VORHANDEN` | FEHLER | Knoten des Stands ist während des Laufs entstanden; nicht überschrieben | Knoten prüfen |
| `DATEI` | FEHLER | Datei nicht lesbar/schreibbar | Rechte/Platz prüfen |

„Neuer Stand“ als Abhilfe heißt: der Stand mit dem Fehler bleibt eingefroren
stehen (Status im Manifest); gebraucht wird ein neuer Lauf mit anderem Datum
oder — ist der Ordner nur der Rest eines abgebrochenen Laufs — der Anwender
entfernt ihn von Hand und startet neu.

Die Hinweise `TITEL-ABWEICHUNG`, `SLUG-GEAENDERT`, `PDF-MEHRDEUTIG`,
`ELEMENT-UNBEKANNT` und `BILD-FEHLT` wandern in die Spalte `hinweise` des
Manifests und von dort in den Abschnitt „Auffälligkeiten der Quelle“ des
Knotens.

**Exit-Codes:** `0` alle gewählten Gesetze fertig · `1` mindestens ein
Gesetz mit FEHLER (Lauf läuft für die übrigen weiter) · `2`
Aufruf-Fehler (Option, Liste, Zielordner, Stand liegt schon vor, Log-Datei)
· `130` mit Strg-C abgebrochen (Manifest gesichert, Ordner bleibt stehen,
kein Knoten).

## Erneuern: ein neuer Stand

gesetze-im-internet.de baut die Dateien laufend neu (`builddate`). Ein neuer
Stand entsteht als **neues Rechercheartefakt**, der alte bleibt:

```
python3 tools/normen-holen.py                    # alle Gesetze, Stand von heute, nächste freie Nummer
python3 tools/normen-holen.py --nur ao,fgo       # nur einzelne (trotzdem ein eigener Stand)
```

Danach: Register-Zeile in `wiki/Rechercheartefakte.md` anlegen; die
Übernahme des Stands als Arbeitsgrundlage ist eine Entscheidung je Stand.
Der Vergleich zweier Stände geht über die Manifeste (`stand`, `builddate`,
Prüfsummen) und `diff` der Lesefassungen. Die Wegweiser bleiben auf dem
Stand, für den sie geschrieben sind (Kopfzeile „Stand der Normtexte“);
zitiert wird aus dem neuen Stand. Auch eine Änderung am Konverter
(Konstante `KONVERTER` erhöhen) führt zu einem neuen Stand mit neuem Lauf;
ein vorhandener Stand wird nicht neu konvertiert — welche Konverter-Version
ihn erzeugt hat, steht je Gesetz im Manifest.

## Grenzen

- Die Fassung ist die Dokumentationsfassung von gesetze-im-internet.de,
  nicht die amtliche Verkündung (siehe Hinweis im Kopf jedes MD).
  Änderungen, die dort als „textlich nachgewiesen, dokumentarisch noch
  nicht abschließend bearbeitet“ vermerkt sind, stehen in den
  Stand-Angaben des Kopfs und im Abschnitt „Auffälligkeiten der Quelle“.
- Formeln, Abbildungen und Formulare in Anlagen sind nur über das PDF
  bzw. die Bilddatei vollständig.
- Geprüft wird die PDF-Signatur, nicht der PDF-Inhalt; Lücken, die schon
  im XML der Quelle fehlen, fallen nicht maschinell auf — sie sind Sache
  der menschlichen Vermerke im Knoten.

## frist-rechnen — Fristende und Wochentag

Datum und Wochentag kommen aus dem Skript, nie aus dem Modell: Der Agent
rechnet keine Frist im Kopf, sondern ruft `tools/frist-rechnen.py` auf und
trägt das Ergebnis mit Regel, Norm und auslösendem Dokument an der Frist ein
(Vorgehen SP-2 §Fristen, Katalog Fristen). Welche Regel gilt — Auslöser,
Fristlänge, Ordnung, Ausnahme —, liest er aus dem Wegweiser „Zustellung,
Bekanntgabe und Fristen“ (Abschnitt 5, Checkliste) und dem Fristenkatalog;
das Skript rechnet nur.

```
python3 tools/frist-rechnen.py 2026-11-12 "1 Monat"                       Fristende mit Wochentag
python3 tools/frist-rechnen.py 2026-11-12 "2 Wochen" --feiertage tools/feiertage-by.txt
python3 tools/frist-rechnen.py 2026-12-25                                 Wochentag, Feiertag, nächster Werktag
python3 tools/frist-rechnen.py --heute                                    heutiges Datum mit Wochentag
python3 tools/frist-rechnen.py --selbsttest
```

| Option | Wirkung |
| --- | --- |
| `DATUM FRIST` | Ereignis- bzw. Zugangsdatum `JJJJ-MM-TT` und Fristangabe mit Zahl und Einheit (Tage, Wochen, Monate, Jahre; auch `14t`, `2w`, `1m`, `1j`) |
| `DATUM` allein | Wochentag des Datums, ob Samstag, Sonntag oder Feiertag, nächster Werktag |
| `--tag-zaehlt-mit` | der Ereignistag zählt mit (Beginn eines Tages, § 187 Abs. 2 BGB); Voreinstellung: zählt nicht mit, Beginn am Folgetag (§ 187 Abs. 1) — nur setzen, wenn die Fristregel es sagt |
| `--ohne-verschiebung` | keine Verschiebung auf den nächsten Werktag (behördliche Termine; die Behörde hat einen bestimmten Tag als Ende mitgeteilt) — nur setzen, wenn die Fristregel es sagt |
| `--feiertage DATEI` | Landesfeiertage aus einer Datei, mehrfach erlaubt |
| `--kurz` | nur `JJJJ-MM-TT Wochentag` |
| `--heute` | heutiges Datum mit Wochentag und Werktag-Prüfung |
| `--selbsttest` | eingebaute Prüfungen (Osterformel bekannter Jahre, Feiertage, Wochenende, Feiertagskette über Weihnachten, Monatsende, Jahresfrist, Beginnfrist, Landesfeiertage aus Datei) |

**Rechenregeln** (Wegweiser Zustellung und Fristen, Abschnitt 5, Schritte
3–5; §§ 187, 188, 193 BGB, auf die VwVfG, SGB X, AO, ZPO und SGG
verweisen): Der Ereignistag zählt nicht mit, die Frist beginnt am Folgetag.
Tages- und Wochenfristen enden mit dem letzten Tag; Monats- und
Jahresfristen mit dem Tag, der nach seiner Zahl dem Ereignistag entspricht;
fehlt der Tag im letzten Monat, mit dem Monatsende (31. Januar + ein Monat =
28. bzw. 29. Februar). Zählt der Anfangstag mit (`--tag-zaehlt-mit`, § 187
Abs. 2), enden Monats- und Jahresfristen am Anfangstag + n Monate − 1 Tag
(§ 188 Abs. 2, 2. Fall; 1. März + ein Monat = 31. März), fehlt der
entsprechende Tag, mit dem Monatsende (§ 188 Abs. 3). Fällt das Ende auf Samstag, Sonntag oder einen
gesetzlichen Feiertag, endet die Frist mit dem nächsten Werktag; die
Ausgabe nennt jeden übersprungenen Tag mit Grund. Halbes Jahr = sechs
Monate, Vierteljahr = drei Monate, halber Monat = 15 Tage (als Zahl und
Einheit eingeben); eine verlängerte Frist läuft ab dem Ende der vorigen
(das alte Ende als Ereignisdatum angeben). Stundenfristen und die
Bekanntgabe- und Zugangsfiktionen rechnet das Skript nicht — den
Zugangstag bestimmt der Agent nach Wegweiser Abschnitt 2 und gibt ihn ein.
Rechnet er den Fiktionstag mit dem Skript (vierter Tag nach Aufgabe zur
Post), dann mit `--ohne-verschiebung`: der Normtext der Fiktion kennt keine
Verschiebung; das Fristende rechnet er getrennt ab dem Fiktionstag.
Verschiebt das Skript ein Ende, weist die Ausgabe auf diesen Fall hin.

**Feiertage.** Eingebaut sind nur die bundeseinheitlichen gesetzlichen
Feiertage (Neujahr, Karfreitag, Ostermontag, 1. Mai, Christi Himmelfahrt,
Pfingstmontag, 3. Oktober, 1. und 2. Weihnachtstag; das Osterdatum wird
berechnet). **Landesfeiertage lädt der Agent je Projekt nach:** er legt eine
Datei an (Vorschlag `tools/feiertage-<land>.txt`; Quelle ist das
Feiertagsgesetz des Landes, in dem der Erklärungs- oder Leistungsort liegt —
Wegweiser Abschnitt 5; Quelle und Stand als Kommentarzeile in die Datei) und
übergibt sie bei jedem Aufruf mit `--feiertage`. Ohne Datei sagt die Ausgabe
ausdrücklich, dass nur bundeseinheitliche Feiertage berücksichtigt sind.
Zeilenform der Datei, UTF-8:

```
# Feiertage Bayern, Quelle: Feiertagsgesetz des Landes, Stand JJJJ-MM-TT
2026-01-06  Heilige Drei Könige
2026-06-04  Fronleichnam
2026-08-15  Mariä Himmelfahrt
2026-11-01  Allerheiligen
```

Leerzeilen und Zeilen mit `#` werden überlesen; eine Zeile ohne Datum in
der Form `JJJJ-MM-TT` bricht mit Aufruf-Fehler ab.

**Exit-Codes:** `0` Ergebnis ausgegeben · `1` Selbsttest fehlgeschlagen ·
`2` Aufruf-Fehler (Datum, Fristangabe, Feiertagsdatei). Meldungen nach dem
Muster `frist-rechnen: <was> — Abhilfe: <was tun>`.

## wegweiser-quellen — Links der Wegweiser prüfen

`tools/wegweiser-quellen.py` liest alle Wegweiser `wiki/Wegweiser-*.md` mit
ihren Teilaufsätzen `wiki/Wegweiser-*/` und prüft **mechanisch, ohne
Sprachmodell**:

- jeden Markdown-Link: Ziel-Datei vorhanden; bei Normlinks (Lesefassung im
  REC-Ordner) der Anker in der Zieldatei und der Stand gegen die Kopfzeile
  des Wegweisers (`normen_stand`); bei Wiki-Zielen ein Überschriften-Anker,
  falls gesetzt;
- jeden Wikilink `[[Name]]`: `wiki/Name.md` vorhanden (`--basis ORDNER`
  nennt weitere Wiki-Ordner, solange der Prozess noch nicht gemergt ist);
- den Aufbau der Teilaufsätze: Dateiname mit dem Knotennamen als Präfix,
  Rücklink auf die Übersicht, Übersicht listet jeden Teilaufsatz, kein
  Unterordner ohne Seite, Dateinamen unter `wiki/` eindeutig;
- den Kopf jedes Wegweisers: Frontmatter `type: guide` mit `normen_rec`
  und `normen_stand`, Zeile „Stand der Normtexte“.

```
python3 tools/wegweiser-quellen.py --pruefen             # prüfen (Vorgabe); Exit 1 bei FEHLER
python3 tools/wegweiser-quellen.py --liste [DATEI]       # Liste der zitierten Normen je Gesetz (Markdown)
python3 tools/wegweiser-quellen.py --umfang              # Tabelle je Wegweiser: Teilaufsätze, Zeilen, Normverweise
python3 tools/wegweiser-quellen.py --wurzel <Projekt-Wurzel> [--basis <wiki-Ordner>]
```

Die Prüfung ist für das **Projekt nach dem Merge** gedacht. In der
Template-Quelle selbst (Prozess-Ordner ohne das Basis-Wiki daneben) meldet
sie Wikilinks, die in die Basis zeigen, als FEHLER — dort mit `--basis` den
Ordner des Basis-Wikis angeben oder den Befund als erwartet lesen; im
zusammengesetzten Projekt lösen diese Links auf.

Links werden **nie umgeschrieben**; nach einem Holen auf Zuruf bleiben die
Wegweiser auf ihrem Stand. Die Liste (`--liste`) ist die Grundlage für die
Prüfung der Wegweiser durch ein anderes Modell oder einen Menschen: jeder
Link muss auf die genannte Norm führen, jede Aussage im Wegweiser muss sich
aus dem verlinkten Text ergeben.

| Code | Schwere | Bedeutung |
| --- | --- | --- |
| `QU-LINK-TOT` | FEHLER | Link-Ziel nicht vorhanden |
| `QU-LINK-OHNE-ANKER` | FEHLER | Normlink ohne Anker |
| `QU-ANKER-TOT` | FEHLER | Anker nicht in der Normdatei |
| `QU-WIKILINK-TOT` | FEHLER | Wikilink ohne Ziel |
| `QU-RUECKLINK-FEHLT` | FEHLER | Teilaufsatz ohne Rücklink auf die Übersicht |
| `QU-TEILAUFSATZ-UNGELISTET` | FEHLER | Übersicht listet einen Teilaufsatz nicht |
| `QU-TEILAUFSATZ-NAME` | FEHLER | Teilaufsatz ohne Präfix „Wegweiser-X-NN-“ |
| `QU-ORDNER-OHNE-SEITE` | FEHLER | Unterordner ohne Seite gleichen Namens |
| `QU-DATEINAME-DOPPELT` | FEHLER | Dateiname unter `wiki/` nicht eindeutig |
| `QU-STAND-ABWEICHUNG` | HINWEIS | Normlink auf einen anderen Stand als die Kopfzeile |
| `QU-ANKER-UNBEKANNT` | HINWEIS | Überschriften-Anker auf eine Wiki-Seite nicht gefunden |
| `QU-KOPF-TYP`, `QU-KOPF-FELD`, `QU-KOPF-STAND` | HINWEIS | Kopf des Wegweisers unvollständig |

Exit-Codes: 0 fertig; 1 mindestens ein FEHLER; 2 Aufruf-Fehler.
