---
type: internal-procedure
---

# Lebenslauf eines Stands

Anleitung vom ersten Element bis nach der Freigabe
eines Stands, in der Reihenfolge, in der ein Agent sie
bei einer Phase durchläuft. Dieser Knoten ordnet die
Schritte; die Mechanik jedes Schritts steht an ihrem
führenden Ort und wird hier nicht wiederholt —
Freeze, Ablösung, Ableitungsprüfung, Herkunftszeile,
Kopien und Überholt-Regel in [[Einfrieren-und-Abloesen]],
Prüfung und Ordnung der Freigaben in
[[Kettenpruefung]], Kernsatz der Freigabe in
`Vorgehen.md` §4, Buchung in [[Entscheidungen]]
(Meta „Freigabe-Einträge“). Lesen, sobald in einer
Phase das erste Element entsteht, und vor der
Bildung eines Stands.

Zwei Kernsätze tragen den ganzen Ablauf und stehen an
ihrem führenden Ort: der **Kernsatz der Freigabe**
(woran eine Zweck-Freigabe hängt, was mit ihr
einfriert, Trennung von Annahme und Freigabe —
`Vorgehen.md` §4 „Freigabe-Regel“) und der **Kernsatz
des Einfrierens** (woraus ein Stand freigegeben wird —
[[Einfrieren-und-Abloesen]] §Zweck); beide vor dem
ersten Durchlauf lesen.

## Schritte

1. **Erarbeiten der Elemente.** Die Elemente einer
   Phase liegen im `wiki/` — als Detail-Knoten mit
   Fassaden-Eintrag im Register. Bei den beschreibenden
   Registern (Sammelzustand `offen`, [[Katalog]]
   §Typ-Konventionen) legt der Agent ein Element als
   `offen` an: Er schreibt seinen Vorschlag als Element
   und nennt die offenen Punkte im Element selbst (nicht
   als angehängten Vermerk). Eine Klärung mit dem
   Anwender ändert das Element, solange es nicht
   eingefroren ist; was eingefroren ist, ändert nur eine
   Ablösung. Ein Element wird **einzeln angenommen**,
   wenn andere Arbeit darauf baut (der Anwender sagt
   „ja, so“), **oder gesammelt** mit der Freigabe des
   ersten Stands, der es verweist — erst damit friert
   es ein. Bei Eintritts-Registern (Entscheidungen,
   Contracts) kommt ein Element erst mit dem
   Anwender-OK ins Register, direkt `angenommen`; nur
   dort liegen Entwürfe außerhalb `wiki/`. Status und
   Freeze je Register: [[Einfrieren-und-Abloesen]]
   §Eintrittsregel, §Freeze und Ausnahmen.
2. **Lesen während der Arbeit.** Bis ein Stand
   gebildet ist, ist die **Register-Fassade** die
   Lese-Klammer der Phase: Sie listet jedes Element mit
   Link und Status, und der Agent benennt sie dem
   Anwender ausdrücklich so („Lese-Klammer dieser Phase
   ist die Fassade …“). Auf Wunsch zeigt er die Elemente
   einer Phase gesammelt im Chat. Einen frühen Stand als
   Lese-Dokument bildet der Agent nicht von sich aus; auf
   Zuruf des Anwenders gilt Schritt 3 jederzeit.
3. **Bilden des Stands.** Der Agent **bietet** die
   Bildung an, sobald er die Elemente des Dokumenttyps
   für vollständig hält, oder bildet den Stand **auf
   Zuruf** — auch vor der Vollständigkeit. Die
   Auslöser-Zeile des Katalog-Eintrags kann den Anlass
   einengen (Vorbedingung, eigener Auslöser, Angebot;
   [[Katalog]] §Typ-Konventionen „Auslöser-Zeile“).
   Ablauf der Bildung: Ableitungsprüfung nach Marke
   und Status, Herkunftszeile, Kopien der lebenden
   Quellen ([[Einfrieren-und-Abloesen]]
   §Ableitungsprüfung, §Stand, §Kopien). Eine
   vorgelegte, noch nicht freigegebene Version darf
   `offen`e Elemente der beschreibenden Register
   verweisen und weist sie im Kopf aus (Form der Zeile:
   §Ableitungsprüfung dort). Der Name folgt dem Schema
   für `output/` ohne Absender und Empfänger, die Marke
   steht nur im Kopf, Status-Wörter wie „Entwurf“ oder
   „final“ gehören nicht in den Namen
   ([[Einfrieren-und-Abloesen]] §Stand „Dateiname“;
   MasterPrompt §3.9). **Entwurfs-Dokumente neben dem
   Stand gibt es nicht** — weder im Scratch noch als
   eigene Versionskette: Die Vorlage an den Anwender ist
   der Stand selbst.
4. **Prüfen.** Bei einem Pflicht-Stand läuft die
   Kettenprüfung durch das zweite Modell **vor der
   Vorlage** an den Anwender, so dass er den
   `review-report` mit dem Stand erhält; optionale
   Stände werden auf Anfrage geprüft, der
   Abschluss-Stand nur auf Vollständigkeit
   ([[Kettenpruefung]] §Regel, §Reviewer-Anteil).
5. **Vorlegen.** Der Agent nennt den Stand mit Version
   und Pfad, den Zweck, das Nicht-Berücksichtigte und
   die ausgewiesenen `offen`en Elemente, den
   Prüfbericht und die Einschränkungen; er sagt, dass
   der Stand auf Elemente verweist und wo der Anwender
   ihnen folgt (die Fassade, die Detail-Knoten); und er
   fragt nach der Freigabe im Wortlaut der Formel
   („Stand x von ⟨Artefakt⟩, freigegeben für Zweck Z“,
   `Vorgehen.md` §4).
6. **Korrigieren vor der Freigabe.** Korrekturen gehen
   in die **Elemente**, nie in den Stand: `offen`e
   Elemente werden geändert, eingefrorene abgelöst.
   Danach bildet der Agent eine **neue Version**
   (`VV`+1) derselben Ketten-ID (gleicher Name bis
   `_VV_`, auch das Datum bleibt — MasterPrompt §3.8);
   die vorige Version
   bleibt ohne Freigabe liegen, es gibt keine
   abzulösende Freigabe, und die Freigabe trifft die
   jüngste Version. Schreibt der Anwender eine eigene
   Version des Stands (`_VV_<TLA>`), überträgt der
   Agent ihre Änderungen in die Elemente und bildet die
   nächste Version ([[Versionsketten]] §Versionen eines
   Stands). Nach einer Korrektur läuft die Prüfung aus
   Schritt 4 als neue Runde nur über die geänderten
   Elemente ([[Kettenpruefung]] §Regel). Was der Stand
   selbst trägt — der Tag im Abschluss-Stand, der
   Inhalt eines selbsttragenden Stands —, korrigiert die
   neue Version selbst.
7. **Freigeben und Buchen.** Der Freigabe-Eintrag im
   Register [[Entscheidungen]] (Meta
   „Freigabe-Einträge“: Formel, Verweise, Nachweise,
   Einschränkung, Zielmarke). Im selben Zug nimmt der
   Agent die verwiesenen `offen`en Elemente an, womit
   sie einfrieren; schon angenommene Elemente sind
   eingefroren und werden nicht erneut angenommen,
   Elemente mit anderem Freeze-Zeitpunkt behalten ihn
   ([[Einfrieren-und-Abloesen]] §Freeze und Ausnahmen).
   Ausnahme ohne Stand — der Tag: `Vorgehen.md` §4
   „Freigabe per Tag“.
8. **Nach der Freigabe.** Eine Freigabe gilt für ihren
   eingefrorenen Stand und wird nicht zurückgenommen.
   Wird ein verwiesenes Element abgelöst und gilt der
   Nachfolger für die Marke des Stands, ist der Stand
   überholt; die Antwort ist ein Neu-Stand mit
   ablösender Freigabe ([[Einfrieren-und-Abloesen]]
   §Überholt-Regel; `Vorgehen.md` §4 „Änderung nach der
   Freigabe“). Gilt ein Stand für die Folge-Marke
   weiter, wird er übernommen, nicht neu gebildet
   ([[Kettenpruefung]] §Kette, Übernahme aus der
   Vormarke); was nach dem Marken-Wechsel als Nachtrag
   möglich ist: [[Zielmarken]] §Meta „Nachtrag“.

## Anhang — Arten der Abweichung

Die Abweichungen je Dokumenttyp stehen in der
Auslöser-Zeile seines Katalog-Eintrags, nicht hier.
Der Ablauf kennt folgende Arten der Abweichung:

- **Abschluss-Stand** — eigener Auslöser (die
  Marken-Wechsel-Prozedur), Prüfung nur auf
  Vollständigkeit; selbst bei einem Verzicht auf den
  Prozess bleibt er: [[Katalog-Abschluss-Stand]].
- **Optionale Stände** — Angebots-Auslöser, freier
  Zweck, Prüfung nur auf Anfrage; welche Typen das
  sind, sagt die Verbindlichkeits-Zeile ihres
  Katalog-Eintrags.
- **Selbsttragende Ableitungen** — aus einem
  freigegebenen Stand abgeleitet, sie verweisen auf
  keine Elemente, mit ihrer Freigabe friert nichts
  Neues ein; Auslöser nach ihrem Katalog-Eintrag,
  Beispiel [[Katalog-Release-Notes]].
- **Doku-Stände (selbsttragende Stände)** — mit SP-1
  Entwickler-Doku, Benutzer-Doku und Betriebs-Anleitung:
  Pflicht-Stände der Kette wie jeder andere, Ablauf und
  Freigabe-Ordnung gelten unverändert; abweichend sind
  nur der Grad — sie sind aus eingefrorenen
  Quell-Ständen ausformuliert, verweisen auf keine
  Elemente, mit ihrer Freigabe friert nichts Neues ein
  ([[Einfrieren-und-Abloesen]] §Stand) —, der eigene
  Auslöser Doku-Abfrage und der Verständnis-Check M6
  als Pflicht. Im Einzelnen:
  Schritt 3 gilt mit dem eigenen Auslöser Doku-Abfrage
  (Zeitpunkt und Form; [[Kettenpruefung]] §Kette);
  Schritt 4 zusätzlich mit dem Verständnis-Check M6 als
  Pflicht vor der Vorlage (`Reviewmuster.md`); Schritt 5
  ohne den Satz zu den Elementen — der Agent nennt
  statt dessen die Quell-Stände mit Version, aus denen
  der Stand ausformuliert ist, und den M6-Bericht;
  Schritt 6: eine Korrektur — auch nach einem
  M6-Befund — geht nicht in Elemente (die Quell-Stände
  sind eingefroren) und wird nicht von Hand
  nachgezogen, sondern der Agent erzeugt eine neue
  Version derselben Ketten-ID erneut aus den
  Quell-Ständen (MasterPrompt §9.6 „Neu ableiten statt
  nachpflegen“), Kettenprüfung und M6 laufen über das
  ganze Dokument; Schritt 7 bei „später“ nach dem
  Marken-Wechsel als Nachtrag ([[Zielmarken]] §Meta
  „Nachtrag“).

Weitere Sonderfälle — Komponente, Zwischenmarke,
Nachtrag — ändern den Ablauf nicht:
[[Kettenpruefung]] §Komponenten-Kette nach
Übernahme-Art, [[Zielmarken]] §Meta „Zwischenmarke“
und „Nachtrag“.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Basiert auf: [[Einfrieren-und-Abloesen]] (Freeze,
  Ablösung, Stand, Ableitungsprüfung, Überholt-Regel),
  [[Kettenpruefung]] (Prüfung und Ordnung der
  Freigaben), `Vorgehen.md` §4 (Kernsatz der Freigabe,
  Formel, Stand-Zwang)
- Verweist auf: [[Katalog]] (Auslöser-Zeile,
  Sammelzustand-Zeile), [[Entscheidungen]]
  (Freigabe-Einträge), [[Versionsketten]] (Versionen
  eines Stands), [[Zielmarken]] (Nachtrag,
  Zwischenmarke)
- Ablage und Name eines Stands: MasterPrompt §1.5,
  §3.1, §3.9
