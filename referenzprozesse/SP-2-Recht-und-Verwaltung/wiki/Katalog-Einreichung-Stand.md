---
type: catalog-entry
art: dokumenttyp
process: SP-2
---

# Katalog-Einreichung-Stand

Dokumenttyp-Eintrag von SP-2: der Pflicht-Stand
„Einreichung je Empfänger zu Marke M“ der Phase P13
(Kennung `einreichung-stand`), abgeleitet aus dem
Register [[Einreichungen]] ([[Katalog-Einreichungen]])
über den Versandstand-Ordner in `outgoing/`
(`Outgoing.md` §2) — nach der Bauform des Deploy-Stands
je Umgebung eines Entwicklungsprozesses, ohne
Vererbung: es gibt ihn **je Empfänger**. Beim
Prozess-Merge (Wiki.md §11.3) wird dieser Eintrag als
Datei ins Anwender-`wiki/` kopiert und in [[Katalog]]
verankert.

### einreichung-stand

- **Zweck:** „für den Marken-Abschluss“ — die Marke
  darf abgeschlossen werden, weil das Produkt beim
  Empfänger **zugegangen** ist und der Nachweis
  vorliegt; sein freigegebener Stand ist Vorbedingung
  des Akten-Führungsplans der Stelle.
- **Phase:** P13
- **Verbindlichkeit:** pflicht
- **Grad:** wiki-verweisend
- **Auslöser:** Standard, je Empfänger; Vorbedingungen:
  Prüfplan mit Prüfbericht ohne offenen Befund
  freigegeben, maschinelle **Paketprüfung** bestanden
  (Verweis ↔ Eintrag ↔ Datei, Prüfsumme je Datei,
  Inhalt ↔ Bezeichnung, Seitensumme ↔ Kanal, kein
  `temp-`), Pflichtfeld `review` des Versandstands
  gefüllt, Vertraulichkeit gegen den Empfänger
  geprüft ([[Vorgehen-SP-2]] §6, §9). **Versendet wird
  durch einen Menschen;** die Freigabe setzt den
  gebuchten **Nachweis** (Datei in `nachweis/` des
  Versandstands) und den **Zugang** (Datum, Art)
  voraus — vorher ist der Stand vorgelegt, nicht
  freigegeben. Mit der Freigabe friert das Paket ein,
  die Anlagennummern werden unveränderlich, die
  Anlagen-Elemente werden angenommen, und die
  **Erwartung** je Einreichung entsteht
  ([[Vorgehen-SP-2]] §3).
- **Quell-Register und Filter:** der `filing`-Eintrag
  des Empfängers aus [[Einreichungen]] mit Fassung
  (Tag), Kanal, Zeitpunkt, Nachweis, Zugang, Prüfsumme,
  Erwartung; der Versandstand-Ordner (`Anschreiben.md`
  mit `attachments`, `pruefsumme` je Anlage, `via`,
  `review`; Anlagen-Kopien; `nachweis/`); die Anlagen
  der Marke aus [[Anlagen]] mit Status `eingeführt`;
  der geprüfte Versandweg des Empfängers aus
  [[Organisationen]]. Kopiert werden die Daten der
  Einreichung und die Liste der Nachweise.
- **Pflichtfelder:** `type: einreichung-stand`,
  `marke`, `zweck`, `herkunft`, `datum` (Herkunftszeile
  und Datum des Stands: [[Einfrieren-und-Abloesen]]
  §Stand), `empfaenger` (die Stelle oder der
  Beteiligte dieser Einreichung), `vertraulich`
- **Ablage:** `output/`, versioniert (`_VV_TLA`); der
  Name trägt den Empfänger als Gegenstand
  (`<Datum> - Einreichung - <Empfänger>_VV_TLA.md`), so
  dass jede Einreichung ihre eigene Ketten-ID hat; ein
  **weiterer Empfänger** desselben Schriftsatzes zu
  einer abgeschlossenen Marke ist ein **Nachtrag** am
  Marken-Eintrag ([[Zielmarken]] §Meta); in einer
  Folge-Marke mit eigenem Tag wird dieselbe Ketten-ID
  als **Folge-Version** fortgeführt ([[Vorgehen-SP-2]]
  §2).
- **Pflicht ab Stufe:** 1.
- **Herkunft:** `herkunft` führt zusätzlich den Tag der
  Fassung und den Prüfbericht, an dem die Freigabe
  hängt — immer den der eigenen Marke.
- **Zugang maßgeblich:** „Eingereicht“ ist nur die
  Fassung mit Einreichungsnachweis; die Absendung
  allein genügt nicht ([[Vorgehen-SP-2]] §6).
  Einreichungen einer mandatierten Vertretung kommen als
  Eingangsdokument mit ihrer Kennung und werden in
  [[Einreichungen]] mit Nachweis gebucht.
- **Wächter:** Einreichung ohne Nachweis
  (`SP2-NACHWEIS`, HINWEIS); Prüfsumme weicht vom
  freigegebenen Paket ab (`SP2-PRUEFSUMME`, FEHLER);
  Versandstand ohne `review` (`SP2-REVIEW`, FEHLER) —
  [[Vorgehen-SP-2]] §8.
- **Rückzug:** eines fehlerhaft versandten Dokuments
  ohne Prozesshandlungs-Charakter —
  [[Lebenslauf-eines-Stands]] §Rückzug und
  [[Vorgehen-SP-2]] §12 (eine Prozesshandlung wird nie
  so zurückgenommen).
- **Termin-Marke:** die Einreichung ist die Erklärung im
  Termin (Kanal `muendlich-termin`), der Nachweis das
  Protokoll ([[Marken-SP-2]] §7).
