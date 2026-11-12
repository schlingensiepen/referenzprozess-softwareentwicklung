---
type: internal-procedure
---

# Begleit-Dokumentation mit NotebookLM

Ausformuliertes Beispiel des werkzeug-neutralen
Musters „Begleit-Dokumentation mit einem
Wissens-Werkzeug“ ([[Angebots-und-Beauftragungs-Muster]]
§Begleit-Dokumentation mit einem Wissens-Werkzeug) für
das Werkzeug NotebookLM: ein extern bedientes
Wissens- und Medien-Werkzeug, das aus hochgeladenen
Quellen Erläuterungen, Übersichten, Folien,
Audio-Zusammenfassungen und Lernmaterial erzeugt. Das
Muster selbst bleibt werkzeug-neutral; dieser Knoten
zeigt, wie es mit einem konkreten Werkzeug aussieht.
Lesen, wenn der Anwender NotebookLM gewählt hat
(`Tools.md`, Werkzeug-Wahl nach `Vorgehen.md` §7b) und
Begleit-Dokumentation entstehen soll.

## Voraussetzungen

- Der Anwender bedient NotebookLM; der Agent bereitet
  Quellen und Aufträge vor und übernimmt die
  Ergebnisse. Eine Dauerfreigabe für wiederkehrende
  Aufträge kann der Anwender erteilen
  ([[InterneMechanik]] §Werkzeug-Dauerfreigabe).
- Was ins Werkzeug hochgeladen wird, verlässt das
  Repo: vorher den Hinweis zur Vertrauenszone des
  Prozesses und MasterPrompt §6.3 (Geheimnisse) lesen;
  vertrauliche Inhalte nicht hochladen.

## Schritte

1. **Quellen bestimmen.** Der Agent nennt je
   Dokument der Begleit-Dokumentation (Erläuterung,
   Overview, Folien, Handbuch-Kapitel) die
   eingefrorenen Quell-Stände und Rechercheartefakte,
   aus denen es entstehen soll — als Liste mit Pfad
   und Version. Grundsatz: nur freigegebene oder
   eingefrorene Quellen, keine `offen`en Elemente.
2. **Quellen-Bereinigung nach der Recherche.** Vor dem
   Hochladen prüft der Agent die Quellenliste: tote
   Quellen (nicht mehr erreichbar, überholt, abgelöst)
   streichen, Passung jeder Quelle zum Dokument
   prüfen („trägt diese Quelle zu diesem Dokument
   bei?“); Ergebnis als bereinigte Liste.
3. **Eigene Quellen kennzeichnen.** Quellen, die aus
   dem Projekt stammen (Stände, Berichte, eigene
   Notizen), erhalten im Werkzeug ein Präfix, etwa
   „Projekt - <Titel>“, damit sie in den Ergebnissen
   von fremden Quellen (Normen, Literatur, Fremd-Doku)
   unterscheidbar bleiben.
4. **Auftragsliste zur Freigabe.** Der Agent legt die
   Aufträge als Auftragsliste vor
   ([[Angebots-und-Beauftragungs-Muster]]
   §Auftragsliste zur Freigabe): je Artefakt Zweck,
   Quellen (bereinigt, gekennzeichnet), gewünschtes
   Format (Text, Folien, Audio), Zielgruppe. Serien
   werden **gestaffelt** eingereicht (das Werkzeug
   begrenzt die Zahl der Aufträge je Zeitraum); die
   Liste nennt Staffelung und Wiederholungs-Regel bei
   Abweisung.
5. **Ausführen und übernehmen.** Der Anwender führt
   die Aufträge aus (oder der Agent, soweit eine
   Anbindung besteht). Ergebnisse legt der Agent als
   Ableitung ab: Text nach `output/` oder `overview/`
   mit Herkunftszeile (Quell-Stände mit Version,
   Werkzeug, Datum; [[Einfrieren-und-Abloesen]]
   §Stand), Medien (Audio, Folien) als Dateien neben
   dem Text mit Verweis.
6. **Prüfen.** Jedes übernommene Dokument durchläuft
   die Prüfung seines Typs (Verständnis-Check für
   selbsttragende Doku, `Reviewmuster.md`); ein
   Befund führt zu einem neuen Auftrag aus denselben
   Quellen, nicht zu einer Nachpflege von Hand
   (MasterPrompt §9.6).

## Grenzen

- Das Werkzeug ersetzt keine Quelle: Was es erzeugt,
  ist Ableitung, zitiert wird aus den Quell-Ständen.
- Ergebnisse ohne nachvollziehbare Quellenliste werden
  nicht übernommen.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Muster (werkzeug-neutral):
  [[Angebots-und-Beauftragungs-Muster]]
  §Begleit-Dokumentation mit einem Wissens-Werkzeug
- Werkzeug-Wahl und `Tools.md`: `Vorgehen.md` §7b
- Geheimnisse und Vertrauenszone: MasterPrompt §6.3
