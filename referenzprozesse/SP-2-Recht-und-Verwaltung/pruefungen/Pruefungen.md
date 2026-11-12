# Prüf-Definitionen SP-2 Recht und Verwaltung

Prüf-Modul des gemeinsamen Prüfprogramms `tools/lint.sh`
([[Kettenpruefung]] §Lint-Anteil „Ein Prüfprogramm“). Das
Prüfprogramm liest diese Datei, sobald SP-2 — oder ein
Referenzprozess, der SP-2 erbt — in [[Aktivierter-Prozess]]
steht; die Datei bleibt in der Template-Quelle und wird
nicht ins Projekt kopiert.

**Führender Ort** der Prüfungen, ihrer Befunde und Stufen
ist die Prüf-Tabelle in [[Vorgehen-SP-2]] §8; diese Datei
spiegelt sie Zeile für Zeile und ergänzt je Zeile die
**Prüfart** (welche Mechanik des Prüfprogramms die Zeile
ausführt) und ihre **Parameter**. Ändert sich die
Prüf-Tabelle, wird diese Datei in derselben Änderung
nachgezogen.

Lese-Regeln des Prüfprogramms:

- Eine Tabelle mit den Spalten `Code`, `Stufe`, `Prüfart`
  (dazu `Parameter`, `Befund`); eine Zeile je Code. Der
  Code trägt die Prozess-Kennung `SP2-` als Präfix, die
  Stufe ist `FEHLER` oder `HINWEIS` (Schwere-Tabelle der
  Basis). Formfehler meldet das Prüfprogramm als
  `PRUEF-MODUL`.
- Prüfart `waechter`: der Befund ist eine Lesung des
  Agenten zu seinen Anlässen (Wächter, T1/T2/täglich);
  das Prüfprogramm zählt die Zeile, prüft sie nicht
  mechanisch. Alle anderen Prüfarten prüft es mechanisch
  (Mechanik und Parameter: Kopf von `tools/lint.sh`).
- Parameter: `name=wert; name=wert`, Listen mit Komma.

| Code | Stufe | Prüfart | Parameter | Befund |
|---|---|---|---|---|
| `SP2-POST` | HINWEIS | waechter | — | Posteingang: Datei in Projekt- oder registrierten Eingangsorten ohne Eintrag; Eingangsdokument ohne Status `eingelesen` (Basis-Wächter C9) |
| `SP2-FRIST-RV` | HINWEIS | waechter | — | Frist mit Rechtsverlust: gestufte Eskalation vor dem Ablauf; offene Marke nach Ablauf (Basis-Fristen-Wächter) |
| `SP2-ZEITBUDGET` | HINWEIS | waechter | — | `zeitbudget` einer Frist erreicht (Basis-Fristen-Wächter prüft das Feld, wo gesetzt) |
| `SP2-ZUSAGE` | HINWEIS | waechter | — | Zusage oder Erwartung fällig oder überfällig, in beide Richtungen |
| `SP2-WECKER` | HINWEIS | wecker | `typ=case; frist=deadline; fristfeld=case,verfahren; ende=abgeschlossen; ruhend=ruhend; ruht_auf=ruht_auf` | Kein Wecker gestellt: aktiver Fall (`case` nicht `abgeschlossen`, nicht `ruhend` mit `ruht_auf`) ohne offene Frist mit `case:` dieses Verfahrens |
| `SP2-EVP` | HINWEIS | waechter | — | Eventualplan: Eingangsdokument erfüllt einen offenen Auslöser; Lageänderung durch das Gegenüber ohne Eventualplan |
| `SP2-SCHRIFTSATZ` | HINWEIS | waechter | — | Schriftsatz angekündigt ohne Frist; eingegangen, aber nicht in der Kette |
| `SP2-VORTRAG` | HINWEIS | waechter | — | fremde Tatsachenbehauptung ohne Stellung vor einem Schriftsatz |
| `SP2-BEGLEIT` | HINWEIS | waechter | — | verfahrensgestaltender Schritt ohne Abschnitt Begleitanträge im Stand zu P7 |
| `SP2-REVIEW` | FEHLER | versandstand-feld | `feld=review; nicht=verzichtet,verzicht,kein review,ohne review,keine prüfung,ohne prüfung` | Versandstand ohne Eintrag im Feld `review` — sperrt den Versandstand; `review: verzichtet` ist kein Eintrag (ebenso „Verzicht“, „kein Review“, „ohne Review“ am Anfang des Felds), im Verfahrens-Prozess gibt es keinen Verzicht auf die Prüfung |
| `SP2-NACHWEIS` | HINWEIS | feld-fehlt | `typ=filing; status=eingereicht,abgesandt; feld=nachweis` | Einreichung ohne Nachweis (nachholbar) |
| `SP2-PRUEFSUMME` | FEHLER | pruefsumme | — | Prüfsumme einer Anlage im Versandstand (`pruefsumme: <Datei>: sha256:<Wert>`) weicht von der Datei ab oder die Datei fehlt — sperrt den Versandstand; nach dem Versand Rückzug prüfen |
| `SP2-ANLAGE` | HINWEIS | waechter | — | Anlagen: Nummernlücke ohne Status; Verweis ohne Eintrag; eingeführt ohne Einreichung |
| `SP2-TEMP` | FEHLER | temp | `typ=exhibit; feld=nummer; statusfeld=verwendung; status=eingefuehrt,eingeführt; ausser-status=abgelehnt; stand=schriftsatz; abschnitt=submission/Anlagen` | `temp-`-Nummer an einer eingeführten, nicht abgelehnten Anlage (`verwendung`; `status: abgelehnt` ausgenommen), im getaggten Schriftsatz (Stand in `output/`), im Anlagenverzeichnis `## Anlagen` des Schriftsatz-Knotens oder in `attachments`/`anlagen` eines Versandstands — sperrt Tag und Versandstand |
| `SP2-ABRUF` | HINWEIS | waechter | — | Abrufturnus eines Kanals mit Bereitstellung zum Abruf überschritten |
| `SP2-STUFE` | HINWEIS | waechter | — | Eskalationsanlass im Posteingang: nächste Stufe vorschlagen |
| `SP2-ROLLE` | HINWEIS | waechter | — | Rollen-Prüfung fällig |
| `SP2-NORMEN` | HINWEIS | waechter | — | Zitat eines Gesetzes aus einem Normen-REC, dessen Stand-Zeile im `manifest.tsv` eines neueren Paket-Stands sich geändert hat (ein neuer Stand allein meldet nicht) |
| `SP2-VERTRETUNG` | HINWEIS | waechter | — | Wechsel oder Ende der Vertretung ohne Prüfung von Fristen und Zustellungsadressat |
| `SP2-UNTERBRECHUNG` | HINWEIS | waechter | — | Unterbrechung oder Aufnahme ohne Neuberechnung der Fristen |
| `SP2-TERMIN` | HINWEIS | waechter | — | Termin ohne Terminsbericht und ohne die Fristen aus dem Termin |
| `SP2-NACHLAUF` | HINWEIS | waechter | — | offene Erwartung nach dem Ende |
| `SP2-VERTRAULICH` | FEHLER | waechter | — | Stufe eines Inhalts passt nicht zum Empfänger — der Agent prüft vor Tag, Versandstand, Nachricht, Dossier-Freigabe und Abspaltung (Sperre nur an Tag und Versandstand; sonst Meldung) |
| `SP2-GEHEIMNIS` | HINWEIS | geheimnis-ausnahme | `pfade=raw/,input/raw/; kopien=outgoing/` | Geheimnis-Prüfung der Basis ohne Treffer in Eingangsdokumenten (`raw/`, `input/raw/`) und ihren Versandstand-Kopien (bytegleiche Kopie unter `outgoing/`); in allen anderen Dateien HINWEIS mit dem Befund-Text der Basis |
| `SP2-PFLICHTFELD` | FEHLER | pflichtfelder | `typ=deadline; felder=entstehung,wirkung,verlaengerbar,wiedereinsetzung,zeitbudget; seit=2.2` | Frist ohne die SP-2-Pflichtfelder (Katalog-Fristen, SP-2-Präzisierung); am Bestand vor dem Stichtag Hinweis |
| `SP2-PFLICHTFELD-DOKUMENT` | FEHLER | pflichtfelder | `typ=document,notice; felder=zugang,zustellart,case; seit=2.2; ab-knoten=case:case` | Eingangsdokument ohne die SP-2-Pflichtfelder (Katalog-Eingangsdokumente, SP-2-Präzisierung; auch der Bescheid `notice` eines erbenden Prozesses, der sie erbt — Katalog-Bescheidketten); am Bestand vor dem Stichtag Hinweis, Nachtrag als neues Kopf-Feld mit angehängtem, datiertem Vermerk (der Nachweis wächst, Einfrieren-und-Abloesen §Nachweis). `case` ist erst ab Verfahrensbeginn Pflicht: solange kein `case`-Knoten besteht, fehlt das Feld ohne Befund; besteht einer, nennt ein gesammelter HINWEIS je Lauf die Eingangsdokumente ohne `case` |
| `SP2-WEGWEISER` | HINWEIS | werkzeug | `aufruf=tools/wegweiser-quellen.py --pruefen` | Links, Anker und Aufbau der Wegweiser und Fristenkataloge (Werkzeug des Prozesses; ohne `python3` nicht geprüft) |

Die drei letzten Zeilen stehen in der Prüf-Tabelle von
[[Vorgehen-SP-2]] §8 wie die übrigen: `SP2-PFLICHTFELD`
und `SP2-PFLICHTFELD-DOKUMENT` lesen die Pflichtfelder
der SP-2-Präzisierungs-Blöcke der Basis-Katalog-Einträge
([[Katalog-Fristen]], [[Katalog-Eingangsdokumente]]) —
sperrende Prüfungen über die Dokumentbeschreibungen;
`SP2-WEGWEISER` ist der Werkzeug-Schritt aus
[[Vorgehen-SP-2]] §10 (Normtexte).
