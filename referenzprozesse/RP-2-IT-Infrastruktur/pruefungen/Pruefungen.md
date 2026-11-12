# Prüf-Definitionen RP-2 IT-Infrastruktur

Prüf-Modul des gemeinsamen Prüfprogramms `tools/lint.sh`
([[Kettenpruefung]] §Lint-Anteil „Ein Prüfprogramm“). Das
Prüfprogramm liest diese Datei, sobald RP-2 in
[[Aktivierter-Prozess]] steht; die Datei bleibt in der
Template-Quelle und wird nicht ins Projekt kopiert.

**Führender Ort** der Prüfungen, ihrer Befunde und Stufen
ist die Prüf-Tabelle in [[Vorgehen-RP-2]] §8; diese Datei
spiegelt sie Zeile für Zeile und ergänzt je Zeile die
**Prüfart** (Mechanik des Prüfprogramms) und ihre
**Parameter**. Ändert sich die Prüf-Tabelle, wird diese
Datei in derselben Änderung nachgezogen. Lese-Regeln wie
im SP-2-Modul: Spalten `Code`, `Stufe`, `Prüfart`,
`Parameter`, `Befund`; Code mit Präfix `RP2-`; Stufe
`FEHLER` oder `HINWEIS`; Parameter `name=wert; …`.

Gelesene Felder: Zielumgebung (Inline-Eintrag der Fassade
[[Zielumgebungen]]) `zustand`, `sicherung`, `ueberwachung`;
Deploy-Stand und Betriebs-Anleitung in `output/` mit
`umgebung` und `datum` (geltend ist die jüngste Version), am
Deploy-Stand `gestalt`;
`acceptance-protocol` `umgebung`, `herkunft`;
`operations-journal-entry` `umgebung`, `abweichung`,
`datum`; `deployment-description` `umgebung`, `status`,
`superseded_by`; Frist (`deadline`, auch Inline-Eintrag)
`status`, `due`, `umgebung`, `einschraenkung`.

| Code | Stufe | Prüfart | Parameter | Befund |
|---|---|---|---|---|
| `RP2-L1` | HINWEIS | umgebung-ohne-stand | — | Zielumgebung `aktiv` ohne freigegebene Betriebs-Anleitung |
| `RP2-L2` | FEHLER | umgebung-ohne-netz | `ausnahme-feld=umgebung; kennzeichen=einschraenkung; verweis=Frist` | Zielumgebung `aktiv` ohne Sicherung oder Überwachung (`sicherung`/`ueberwachung` leer oder `keine`) und ohne offene Einschränkung mit Frist — eine Frist mit `umgebung:` dieser Zielumgebung, die `einschraenkung:` trägt oder die ein gültiger Freigabe-Eintrag mit `Frist:` nennt; `umgebung:` allein (Prüfdatum einer Annahme, Ablauf eines Zertifikats) genügt nicht |
| `RP2-L3` | HINWEIS | stand-ohne-protokoll | `typ=acceptance-protocol` | Betriebs-Anleitung ohne Abnahmeprotokoll zum geltenden Deploy-Stand ihrer Umgebung (`umgebung` gleich, `herkunft` nennt den Deploy-Stand) |
| `RP2-L4` | HINWEIS | stand-aelter-journal | `typ=operations-journal-entry` | geltender Deploy-Stand älter als ein Journal-Eintrag **mit `abweichung: ja`** derselben Zielumgebung |
| `RP2-L6` | FEHLER | frist-abgelaufen | `feld=einschraenkung; verweis=Frist` | abgelaufene, noch offene Frist einer Einschränkung oder eines Aufschubs (Frist-Link `Frist:` im Freigabe-Eintrag, sonst Frist mit `einschraenkung:`; eine Frist nur mit `umgebung:` ist keine Einschränkung — ihr Ablauf meldet der Fristen-Lebenszyklus der Basis) |
| `RP2-L7A` | FEHLER | umgebung-abgebaut-depl | `typ=deployment-description` | Zielumgebung `abgebaut` mit einem Deployment-Eintrag, der weder abgelöst noch abgeschlossen ist |
| `RP2-L7B` | HINWEIS | abbau-paarung | `kopf=gestalt; wert=abgebaut` | Deploy-Stand „abgebaut“ (geltender Deploy-Stand der Umgebung mit Kopf `gestalt: abgebaut`, [[Katalog-Deploy-Stand]] RP-2-Präzisierung) ohne Zustand `abgebaut` an der Zielumgebung, oder umgekehrt |
| `RP2-PFLICHTFELD-DEPL` | FEHLER | pflichtfelder | `typ=deployment-description; felder=aspekt; seit=2.2` | Deployment-Eintrag ohne `aspekt` (Pflicht bei aktivem RP-2, [[Katalog-Deployments]] RP-2-Präzisierung); am Bestand Hinweis |
| `RP2-PFLICHTFELD-TEST` | FEHLER | pflichtfelder | `typ=test-case; felder=pruefort,ausfuehrender; seit=2.2` | Testfall ohne `pruefort` oder `ausfuehrender` (Pflicht bei aktivem RP-2, [[Katalog-Testfaelle]] RP-2-Präzisierung); am Bestand Hinweis |
| `RP2-PFLICHTFELD-BUG` | FEHLER | pflichtfelder | `typ=bug-report; felder=ursache,klaerungsstand; seit=2.2` | Störung ohne `ursache` oder `klaerungsstand` (Pflicht bei aktivem RP-2, [[Katalog-Fehlermeldungen]] RP-2-Präzisierung); am Bestand Hinweis |

Die drei `RP2-PFLICHTFELD-…`-Zeilen stehen nicht in der
Prüf-Tabelle von [[Vorgehen-RP-2]] §8: sie lesen die
Pflichtfelder der RP-2-Präzisierungs-Blöcke in den
SP-1-Katalog-Einträgen — sperrende Prüfungen über die
Dokumentbeschreibungen ([[Kettenpruefung]] §Lint-Anteil).
Die Geheimnis-Prüfung (L5) ist Basis-Prüfung ohne eigene
Zeile; die Wächter-Anlässe W1, W2, W4 meldet der Agent
([[Vorgehen-RP-2]] §8).
