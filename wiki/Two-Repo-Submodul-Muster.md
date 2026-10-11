---
type: internal-pattern
---

# Two-Repo-Submodul-Muster

**Zweck:** Werkstatt und Produkt trennen — das
Werkstatt-Repo (Entscheidungen, verworfene Wege,
Sitzungsstände, volle Historie) bettet ein oder
mehrere Produkt-Submodule ein, deren Historie
vorzeigbar bleibt (saubere Änderungen, keine
Interna). Typische Gründe: Werkstatt-Historie ist
wertvoll, Produkt-Historie soll vorzeigbar sein,
Public/Private-Trennung (Werkstatt privat, Produkt
public). Basis-Option — kein Pflicht-Muster.

## Angebots-Trigger

Der Agent bietet die Einrichtung an zwei Stellen
aktiv an:

1. **Beim Init** (MasterPrompt §5.3): „Sollen
   Werkstatt und Produkt getrennt sein (z.B.
   Werkstatt privat, Produkt public)?"
2. **Wenn Teil-Module ins Spiel kommen**
   (Komponenten, User-Doku,
   Quelltext-Auslieferung, gemeinsam genutzte
   Bibliotheken, Agent-verwaltete Sub-Bereiche):
   „Soll das ein eigenes Submodul werden?"

Ein Projekt kann mehrere Submodule für
verschiedene Scopes haben.

## Bauform-Wahl

Die Bauform entscheiden die
**Werkzeug-Umstände, nicht Geschmack**:
git-Submodul-Bauform, wo die Werkzeuge sie
hergeben; sonst Zwei-Wurzeln-Bauform (zwei
getrennte Repos nebeneinander) mit
Ignorier-Regel. Für das Remote bietet der Agent
die ihm bekannten Hoster-Möglichkeiten an
(GitHub, GitLab, private git-Instanzen, o.ä.) und
legt das Remote bei Zustimmung an.

## Strukturierte Einrichtung: die Ableitungs-Regel

Jedes Submodul ist ein
Wahrheit-→-Artefakt-Übergang: die Werkstatt ist
die Wahrheit, das Submodul die Ableitung. Pro
Submodul legt der Agent eine Ableitungs-Regel als
`internal-*`-Knoten an ([[InterneMechanik]]) und
klärt mit dem Anwender sieben Meta-Felder:

1. **Quelle** — welcher Teil der Werkstatt ist
   die Wahrheit (Register, Fassaden,
   Ordner-Baum)?
2. **Ziel** — welches Submodul, welcher Ordner
   wird abgeleitet?
3. **Auslöser** — wann wird abgeleitet
   (Anwender-Aufforderung, Prozess-Schritt,
   fester Trigger)?
4. **Transformations-Regel** — was fließt wie von
   Quelle nach Ziel (Regel-Kern, Aussage samt
   Begründung, ganze Dokumente)?
5. **Ausschlüsse** — was darf nicht ins Ziel
   (Interna, Werkstatt-Verweise,
   Entwurfs-Marker)?
6. **Freigabe** — wer gibt die Ableitung frei
   (eigenständig mit Veto-Möglichkeit oder
   Aktions-Entwurf mit Vorab-Freigabe)?
7. **Rück-Sync-Verbot** — das Ziel wird nicht in
   die Quelle zurücksynchronisiert; Änderungen
   laufen immer über die Werkstatt.

**Ankündigungspflicht:** wo mehrere Beteiligte
(Mensch + Agenten oder mehrere Agenten) an
denselben Repos arbeiten, ist jedes Repo einem
Bearbeiter als „freie Werkstatt" zugewiesen; in
jedes andere Repo wird nur mit vorheriger
Ankündigung geschrieben (festgehalten im Feld
„Freigabe" der jeweiligen Ableitungs-Regel).

## Rekursivität

Das Muster ist rekursiv: ein Produkt-Repo kann
selbst wieder Werkstatt sein — ein Agent, der ein
Submodul verantwortet, kann darin ein eigenes
Submodul für sein Teil-Produkt anlegen, nach
demselben Muster mit eigenen Ableitungs-Regeln.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- git-Umgang: MasterPrompt §6.4
- Einrichtungs-Schritte im Umfeld:
  [[Projekt-Sichtbarkeit-und-Lizenz]],
  [[Git-Bestandsaufnahme]]
