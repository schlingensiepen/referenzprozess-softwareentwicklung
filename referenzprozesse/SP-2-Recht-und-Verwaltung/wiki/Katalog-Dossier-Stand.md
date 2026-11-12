---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Dossier-Stand

Dokumenttyp-Eintrag von SP-2: der selbsttragende
Pflicht-Stand „Übergabe-Dossier zu Marke M“ der Phase
P11 (Kennung `dossier-stand`) — für eine Vertretung
(Mandat, [[Vorgehen-SP-2]] §13) oder einen Nachfolger,
die das Verfahren ohne Wiki-Zugang weiterführen oder
mitführen. Entsteht nach der Doku-Abfrage; bei den
meisten Schriftsatz-Marken entfällt er. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### dossier-stand

- **Zweck:** „für P13 Einreichen“ — die Vertretung darf
  das Dossier als vollständige Grundlage ihrer Arbeit
  nehmen; die Einreichung durch die Vertretung setzt
  es voraus.
- **Phase:** P11
- **Verbindlichkeit:** pflicht
- **Grad:** selbsttragend
- **Auslöser:** eigener Auslöser: die **Doku-Abfrage**
  je Marke, sobald der Tag gesetzt ist
  ([[Kettenpruefung]] §Kette, Doku-Glieder;
  [[Vorgehen-SP-2]] §2) — Zeile Dossier mit Zeitpunkt
  und Form; beim Mandat (P6) ist „jetzt“ die
  Empfehlung. Freigabe des Strategie-Abschnitts nur mit
  einem Prüfbericht der Gegenperspektive ohne offenen
  Befund.
- **Quell-Register und Filter:** die freigegebenen
  Quell-Stände der Marke — Strategie-, Sachverhalts-,
  Argumentations- und Verfahrens-Stand, die
  Verfahrens-Entscheidungen — und die getaggte Fassung;
  dazu Verfahren mit Fristen ([[Verfahren]],
  [[Fristen]]), Beteiligte, der Posteingang
  ([[Eingangsdokumente]]) mit den Anlagen; alles
  **kopiert**, nicht verwiesen (der Leser hat keinen
  Wiki-Zugang), gefiltert nach der
  **Vertraulichkeitsstufe des Empfängers**
  ([[Vorgehen-SP-2]] §9: `streng-intern` erreicht im
  Standard auch die eigene Vertretung nicht).
  Verständnis-Check M6 (`Reviewmuster.md`) vor der
  Freigabe.
- **Pflichtfelder:** `type: dossier-stand`, `marke`,
  `zweck`, `herkunft`, `datum` (Herkunftszeile und Datum
  des Stands: [[Einfrieren-und-Abloesen]] §Stand),
  `empfaenger`, `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); je
  Empfänger eine Ketten-ID (der Name trägt den
  Empfänger als Gegenstand); in einer Folge-Marke mit
  eigenem Tag als Folge-Version fortgeführt.
- **Pflicht ab Stufe:** 2, nach Doku-Abfrage.
- **Entfällt abgeleitet, wenn:** die Ausbaustufe unter
  2 liegt; sonst entscheidet die Doku-Abfrage
  (später / gar nicht als Verzicht).
- **Selbsttragender Stand bei Abspaltung:** fehlt dem
  abgespaltenen Projekt der Lesezugriff, ist das
  Dossier die Form des selbsttragenden Stands zum
  Übergabe-Tag ([[Vorgehen-SP-2]] §13).
- **Vertraulichkeit:** die Stufe des Empfängers; der
  Stand erbt die höchste Stufe seiner Quellen und darf
  sie nicht überschreiten — Prüfpunkt vor der Freigabe
  (`SP2-VERTRAULICH`).
