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
public). Basis-Option — kein Pflicht-Muster. Die
Wörter Werkstatt und Schleuse gelten nur im
Zwei-Repo-Kontext; das Produkt gibt es in jedem
Projekt ([[Glossar]]), hier ist das Produkt-Repo das
Repo, das es trägt (MasterPrompt §9.6, Begriffe).

## Angebots-Trigger

Der Agent bietet die Einrichtung an zwei Stellen
aktiv an:

1. **Beim Init:** die Ein-/Zwei-Repo-Frage im
   Init-Frage-Block — Wortlaut, Platz in der
   Reihenfolge und Ableitbarkeit:
   [[Init-Choreografie]] §Baustein: Ein-/Zwei-Repo-Frage.
   Bei „zweites Repo“ richtet der Agent das Muster
   ein, mit der Standardbelegung (unten) als
   Vorgabe; bei „ein Repo“ gilt der Ein-Repo-Fall.
2. **Wenn Teil-Module ins Spiel kommen**
   (User-Doku, Quelltext-Auslieferung, gemeinsam
   genutzte Bibliotheken, Agent-verwaltete
   Sub-Bereiche): „Soll das ein eigenes Submodul
   werden?"

Ein Projekt kann mehrere Submodule für
verschiedene Scopes haben. Komponenten eines in
Komponenten zerlegten Systems sind kein Fall dieses
Angebots: sie entstehen als eigene Projekte im Schritt
der Phase P6 „Starten von Teilaktivitäten“ (Vorschlag
von Name, Pfad und Remote zur Freigabe; mit RP-1:
`Vorgehen-RP-1.md`).

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

## Standardbelegung (Werkstatt / Produkt / Schleuse)

Bei „zweites Repo“ legt der Agent die Ableitungs-Regel
mit dieser Belegung als Vorgabe vor; der Anwender kann
jedes Feld anpassen.

- **Werkstatt** (Quelle): Wiki, Register und die
  wiki-verweisenden Dokumente in `output/`, darunter
  die Deploy-Stände (mit SP-1: Dokumenttyp
  Deploy-Stand).
- **Produkt** (Ziel): das Repo, das das Produkt der
  Marke trägt ([[Glossar]]; dort wird der Tag der
  Implementierung gesetzt) — bei Software Code, Tests
  und Build; sie entstehen dort direkt und werden
  nicht abgeleitet; ihre Festlegungen werden im Wiki
  gebucht. Dazu die
  selbsttragenden Dokumente — die Kopien der
  selbsttragenden Doku-Stände in `docs/developer/`,
  `docs/user/` und `docs/ops/` (mit SP-1: Dokumenttypen
  Entwickler-Doku, Benutzer-Doku, Betriebs-Anleitung;
  der freigegebene Stand selbst bleibt in `output/` der
  Werkstatt) und selbsttragende Ableitungen
  (Abgrenzung `docs/` gegen `output/` in SP-1
  `index.md` §4.11).
- **Schleuse** (die übrigen Meta-Felder):
  - **Auslöser:** je Dokumenttyp die Auslöser-Zeile
    seines Katalog-Eintrags ([[Katalog]],
    Dokumenttyp-Block). Standard für Dokumente, die
    das Produkt beschreiben: die Freigabe eines Stands
    „für P13 Ausliefern“ oder Zuruf; für die drei
    Doku-Stände die Doku-Abfrage ([[Kettenpruefung]]
    §Kette).
  - **Transformations-Regel:** vollständige
    Neu-Erzeugung aus dem Wiki, kein Nachpflegen;
    wiki-verweisend → selbsttragend (Wikilinks und
    Register-IDs heraus, Begründungen ausgeschrieben).
    Grade und „Neu ableiten statt nachpflegen“:
    MasterPrompt §9.6.
  - **Ausschlüsse:** Register-Lebenszyklus und
    Interna.
  - **Freigabe:** über die Review-Kette; beim
    Übertrag ins Produkt mit dem verschärften
    Review-Angebot ([[Angebots-und-Beauftragungs-Muster]],
    Übertrag ins Produkt — lesen, bevor die Schleuse
    zum ersten Mal läuft).
  - **Rück-Sync-Verbot:** wie oben.

## Ein-Repo-Fall

Bei „ein Repo“ gelten dieselben Regeln ohne
Repo-Grenze: selbsttragende Dokumente liegen im selben
Repo (z.B. in `docs/`) und werden zu denselben
Auslösern vollständig neu erzeugt. Ein Submodul und
eine Ableitungs-Regel als Knoten entfallen.

## Rekursivität

Das Muster ist rekursiv: ein Produkt-Repo kann
selbst wieder Werkstatt sein — ein Agent, der ein
Submodul verantwortet, kann darin ein eigenes
Submodul für sein Teil-Produkt anlegen, nach
demselben Muster mit eigenen Ableitungs-Regeln.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Init-Frage: [[Init-Choreografie]]
- git-Umgang: MasterPrompt §6.4
- Einrichtungs-Schritte im Umfeld:
  [[Projekt-Sichtbarkeit-und-Lizenz]],
  [[Git-Bestandsaufnahme]]
