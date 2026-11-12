---
type: internal-procedure
---

# Projekt-Sichtbarkeit und Lizenz

**Zweck:** Lizenz-Wahl und Repo-Sichtbarkeit eines
Projekts bewusst klären — typischerweise im
Scaffolding-Vorlauf, vor dem ersten Commit mit
Außenwirkung. Bei Multi-Repo-Projekten wird die
Klärung **pro Repository** durchgeführt.

**Schritte:**

1. **Lizenz wählen** — passend zu Zweck und
   Verwertung: permissiv (z.B. MIT, Apache-2.0),
   Copyleft (z.B. GPL-Familie), Inhalte-Lizenzen
   (z.B. CC-BY-Varianten), proprietär/keine
   Lizenz-Datei. Der Agent legt die Optionen mit
   kurzen Konsequenzen vor; der Anwender
   entscheidet.
2. **Lizenz-Datei anlegen** (`LICENSE` bzw.
   Lizenz-Hinweis im README) und die Wahl als
   Entscheidung im Register buchen.
3. **Repo-Sichtbarkeit klären** — public /
   internal / private beim jeweiligen Hoster;
   Konsequenzen benennen (wer kann lesen, wer
   kann beitragen).
4. **Bei Multi-Repo:** Schritte 1–3 pro Repo
   wiederholen; abweichende Sichtbarkeiten
   (z.B. Koordinator privat, Komponente public)
   ausdrücklich festhalten.

**Ergebnis:** Lizenz-Datei(en) im Repo,
Sichtbarkeits-Entscheid als Register-Eintrag,
Meldung im Erledigt-Block.

## SP-2-Teil (gilt bei aktivem SP-2)

Im Verfahrens-Prozess gibt es kein Scaffolding; die
Klärung läuft mit dem Hinweis zur Vertrauenszone im
Init (SP-2-`index.md` §4.7; `Vorgehen-SP-2.md` §9):

- **Sichtbarkeit:** das Repo dient der Rekonstruktion
  des Verfahrens, nicht der Weitergabe; die
  Voreinstellung ist **privat**. Arbeitsverzeichnis,
  Git-Server und Anbieter des Sprachmodells sind die
  Vertrauenszone — der Anwender wählt den Git-Server und
  das Modell in Kenntnis dessen, was sie sehen; alles
  wird committet, auch Zugangsdaten als Akteninhalt im
  Original (Zeile im Herkunfts-Vermerk).
- **Lizenz:** eine Lizenz-Wahl für das Verfahrens-Repo
  ist selten nötig (Akteninhalte sind keine Werke des
  Projekts); der Agent fragt nur, wenn Inhalte
  veröffentlicht werden sollen. Mitgelieferte amtliche
  Normtexte eines Prozesses (Normen-Paket) sind
  gemeinfreie Inhalte; sie unterliegen nicht der Lizenz
  des Projekts. Den Satz dazu trägt die Lizenz-Datei
  des Templates.
- **Sichtbarkeit je Abspaltung:** ein abgespaltener
  Strang mit anderem Vertraulichkeitskreis bekommt ein
  eigenes Repo mit eigener Sichtbarkeit; die Nachricht
  an die Mutter trägt `vertraulich:`.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
