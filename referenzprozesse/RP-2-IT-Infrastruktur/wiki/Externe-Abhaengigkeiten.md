---
type: external-dependency-log
# active: false   # bei Deaktivierung (Default ist active: true)
---

# Externe Abhängigkeiten

**Ich bin neu in RP-2.** Diese Fassade entsteht mit der
Wahl von RP-2 (Wiki.md §11 Prozess-Teil-Wikis) — sie
führt, wovon die Anlagen außerhalb des Projekts
abhängen: Anbieter, Limits, Guthaben, Fristen und
Annahmen mit Prüfdatum.

## Meta

- **Typ:** `external-dependency-log` — Register der
  **externen Abhängigkeiten** (Hoster, DNS-Anbieter,
  Zertifikatsstellen, Portale, Fremd-Images, Lizenzen).
  Singleton, keine ID — eine Abhängigkeit trägt einen
  Namen.
- **Kategorie:** (a) Fassade + Detail-Knoten im wiki/ —
  Einträge leben inline; eine Abhängigkeit mit vielen
  Annahmen darf einen eigenen Detail-Knoten bekommen.
- **Entität, lebend:** ein Eintrag hält Fakten (Anbieter,
  Vertrag, Limits, Guthaben, Ablauf) und **Annahmen**
  (was das Projekt über den Anbieter voraussetzt, ohne
  es laufend zu prüfen: Portal-Verhalten, Preis,
  Verfügbarkeit einer Schnittstelle). Er wird bei
  Änderungen überschrieben ([[Einfrieren-und-Abloesen]]
  §Kopien); Zugangsdaten stehen nie hier, nur der
  Verweis auf ihren Ablageort. Gilt ein Anbieter für
  mehrere Zielumgebungen, steht er einmal und nennt sie.
- **Annahme mit Prüfdatum:** jede Annahme trägt ein
  **Prüfdatum**. Es ist eine Frist der Fassade
  [[Fristen]] mit `richtung: gegen-uns` (Titel „Annahme
  prüfen: <Abhängigkeit> — <Annahme>“), auf die der
  Eintrag verweist; so meldet der Fristen-Lebenszyklus
  der Basis das fällige Prüfdatum, ohne eigenen
  Wächter. Zum Prüfdatum prüft der Agent die Annahme
  und schlägt die **Erneuerung** vor (Annahme bestätigt
  → neue Frist; widerlegt → Störung oder Anforderung,
  [[Vorgehen-RP-2]] §6). Grund aus realen
  Infrastruktur-Projekten:
  Annahmen über ein Anbieter-Portal veralteten still.
- **Fristen des Anbieters** (Vertragsende, Ablauf eines
  Zertifikats, Guthaben-Erschöpfung) sind ebenso Fristen
  in [[Fristen]] mit Verweis hierher; der Eintrag nennt
  sie.
- **Wofür gelesen:** bei der Wiederaufnahme an einer
  Zielumgebung (W1, [[Vorgehen-RP-2]] §8), vor einem
  Aktualisieren (neuer Pin eines Fremd-Images) und beim
  Bestandsbericht ([[Vorgehen-RP-2]] §2 Anmerkung P2);
  der Zielumgebungs-Eintrag nennt seine Abhängigkeiten
  ([[Zielumgebungen]]).
- **Offene Rückfragen** an den Anwender zu einer
  Abhängigkeit laufen über `Offene Fragen.md` (Basis),
  nicht über dieses Register.
- **Eintragsformat:** `### <Name>` mit Feldern Art
  (Hoster / DNS / Zertifikat / Portal / Fremd-Image /
  Lizenz / sonstiges) / Betrifft (Zielumgebungen) /
  Vertrag oder Konto (Verweis, ohne Zugangsdaten) /
  Limits / Guthaben (Stand, Datum) / Fristen (Verweise
  auf [[Fristen]]) / Annahmen (je Annahme ein Satz mit
  Verweis auf ihre Prüf-Frist) / Detail (Wikilink, nur
  wenn Detail-Knoten existiert).
- **`external-dependency`-Detail-Knoten-Konventionen:**
  Frontmatter `type: external-dependency`. Sektionen:
  Anbieter / Limits und Guthaben / Fristen / Annahmen /
  Bezüge (Fassaden-Eintrag [[Externe-Abhaengigkeiten]]).
  Dateiname `<Name>.md` im Title-Case.

---

**Bearbeitungsstand:** _(vom Agenten bei Anlage und laufend
gepflegt — bei Änderungen überschrieben)_

## Abhängigkeiten

_(vom Agenten bei der ersten Abhängigkeit gefüllt)_
