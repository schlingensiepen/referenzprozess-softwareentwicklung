---
type: internal-rule
---

# Kettenprüfung

Prüfung eines Pflicht-Stands gegen seine Vorgänger vor
der Freigabe, und die Ordnung, in der Pflicht-Stände
freigegeben werden. Dieser Knoten beschreibt den
Mechanismus einmal; die Prozess-Templates nennen in
ihren Dokumenttyp-Einträgen ([[Katalog]]) nur Glieder
und Reihenfolge — streng analog zu
[[Einfrieren-und-Abloesen]]. Wo die Prüfung im Ablauf
eines Stands liegt (vor der Vorlage an den Anwender)
und was davor und danach geschieht:
[[Lebenslauf-eines-Stands]]. Lesen vor jeder Freigabe
eines Pflicht-Stands.

## Kette

- Die **Kette zu Marke M** besteht aus den
  Pflicht-Ständen der Phasen (Vorgehen.md §3) mit je
  einem Zweck („für P2/P3“, „für P9 Ausarbeiten“, …);
  zum Abschluss der Marke kommt der Abschluss-Stand
  („für den Marken-Abschluss“, [[Zielmarken]]). Welche
  Dokumenttypen die Glieder sind und welche Register
  sie filtern, steht in den Dokumenttyp-Einträgen des
  aktiven Prozesses.
- **Der Tag der Implementierung ist Pflicht-Glied P9**
  dieser Ordnung; er trägt keinen Stand, sondern die
  Freigabe des **Produkts** der Marke (§Code-Glieder)
  — Code nur in Software-Projekten (Begriff:
  [[Glossar]] „Produkt“). Der Tag markiert das Produkt
  in dem Repo, das es trägt, in jedem Projekt, auch
  ohne Code und auch ohne Prozess (nächster Punkt).
  „Implementierung“ ist der Name dieses
  Glieds in jeder Domäne und steht in der
  Tag-Freigabe-Formel fest (Vorgehen.md §4 „Freigabe
  per Tag“).
- **Projekt ohne Prozess:** Auch ohne aktiven Prozess
  führt jedes Projekt Zielmarken ([[Marken]]; die
  Fassade ist Pflicht, Wiki.md §3a). Zu jeder Marke
  gehören der Tag, der ihr Produkt markiert (etwa den
  Schriftsatz), und der Abschluss-Stand
  ([[Katalog-Abschluss-Stand]]); Phasen-Pflicht-Stände
  und eine Freigabe-Ordnung gibt es ohne Prozess
  nicht, das Glied P10 fehlt, und deshalb entfällt
  die eigene Tag-Freigabe „für P10 Testen“ (Vorgehen.md
  §4 „Freigabe per Tag“). Der Agent setzt den Tag nach
  dem OK des Anwenders, der Abschluss-Stand führt ihn,
  und mit der Freigabe des Abschluss-Stands ist er
  bestätigt. Vorbedingung des Tags sind ohne Prozess
  dieses OK und **„Tests grün“ für das automatisiert
  Prüfbare des Produkts**, soweit es solche Tests gibt
  — ohne sie fällt der Nachweis aus der Regel heraus
  (§Code-Glieder: die Vorbedingung des Tags gilt in
  jeder Domäne und hängt an den Tests, nicht an einem
  Prozess); die Kettenprüfung des Produkts gegen
  freigegebene Vorgänger entfällt, weil es ohne Kette
  keine Vorgänger gibt. Ein Verzicht auf „Tests grün“
  ist nur als Anwender-Entscheidung mit benanntem
  Impact möglich und wird im Entscheidungs-Register
  gebucht — als DEC mit `decision_type: verzicht` und
  `zielmarke:`, ohne `phase:`, der Gegenstand nennt
  „Tests grün“ ([[Entscheidungen]] Meta
  „Verzichts-Einträge“); er ist kein Verzicht auf
  eine Phase (keine Verzichts-DEC mit `phase:`;
  `phase: P9` ist ohnehin unzulässig). Der Lint liest
  diesen Verzicht nicht (§Lint-Anteil).
  **Tag-Korrektur ohne Prozess:** Ein Tag wird nie
  verschoben (Vorgehen.md §4 „Freigabe per Tag“). Vor
  dem Marken-Wechsel setzt der Agent einen neuen Tag,
  und der Abschluss-Stand führt den neuen — immer als
  **neue Version** derselben Ketten-ID: versionierte
  Dokumente in `output/` werden nie überschrieben, auch
  nicht vor ihrer Freigabe ([[Versionsketten]]
  §Unveränderlichkeit; der Stand-Zwang legt die Vorlage
  an den Anwender als versionierten `output/`-Stand ab,
  einen Entwurf außerhalb davon gibt es nicht). Ist der
  Abschluss-Stand noch nicht freigegeben, bleibt die
  vorige Version ohne Freigabe liegen — es gibt keine
  abzulösende —, und die Freigabe trifft die jüngste
  Version; ist er schon freigegeben, wird die neue
  Version erneut freigegeben, und ihre Freigabe löst
  die alte ab — dieselbe Form wie die Schleife der
  Wechsel-Prozedur, ohne Überholt-Befund
  ([[Zielmarken]] §Meta, Wechsel-Prozedur Schritt 3;
  Begründung: ohne Prozess trägt die Freigabe des
  Abschluss-Stands den Tag, und ein neuer Tag ist eine
  neue Freigabe, [[Einfrieren-und-Abloesen]]
  §Überholt-Regel). Mit dem Wechsel ist
  die Marke abgeschlossen und eingefroren
  ([[Zielmarken]] §Meta); danach prüft der Agent, ob
  sich die Pfade des Produkts (unten, Übernahme des
  Tags) zwischen dem alten und dem neuen Tag
  unterscheiden: bei **gleichem Inhalt** setzt er den
  neuen Tag nach dem OK des Anwenders, der alte bleibt,
  und bucht am Marken-Eintrag den Nachtrag „Tag
  korrigiert“ (Format: [[Zielmarken]] §Meta, Nachtrag)
  — der Abschluss-Stand bleibt eingefroren, Lint und
  Vollständigkeits-Scan lesen den Tag der Marke aus dem
  jüngsten Nachtrag; bei **anderem Inhalt** gehört die
  Korrektur
  in eine Patch-Marke mit eigener Bezeichnung, eigenem
  Tag und eigenem Abschluss-Stand — läuft die
  Folge-Marke schon, als Zwischenmarke ([[Zielmarken]]
  §Meta, Zwischenmarke). **Tag-Korrektur mit Prozess
  nach dem Wechsel:** Vor dem Wechsel ist eine Korrektur
  ein neuer Tag mit neuer Tag-Freigabe, die die alte
  ablöst (Vorgehen.md §4 „Freigabe per Tag“). Nach dem
  Wechsel prüft der Agent die Pfade des Produkts wie
  ohne Prozess: bei **gleichem Inhalt** setzt er den
  neuen Tag nach dem OK des Anwenders, der alte bleibt,
  und bucht den Nachtrag „Tag korrigiert“ — er enthält
  die neue Tag-Freigabe zu derselben Marke in der Formel
  der Freigabe per Tag (Format: [[Zielmarken]] §Meta,
  Nachtrag) und ist ihr Träger: ein eigener
  Freigabe-Eintrag entsteht nicht, die alte
  Tag-Freigabe im Entscheidungs-Register bleibt stehen
  und wird nicht abgelöst ([[Entscheidungen]] Meta
  „Freigabe-Einträge“, Ausnahme Nachtrag), der
  Abschluss-Stand bleibt eingefroren, und der Lint liest
  die Tag-Freigabe im Nachtrag als Tag-Freigabe der
  Marke; bei **anderem Inhalt** gehört
  die Korrektur in eine Patch-Marke.
- **Zwei Ordnungen:** Die **Erarbeitung der Elemente
  ist ungeordnet** — ein Element jedes Registers darf
  jederzeit entstehen und angenommen werden, sobald der
  Anwender es weiß (z.B. eine Technologie-DEC für eine
  Komponente, deren Funktion noch nicht vollständig
  beschrieben ist; TEST-Elemente vor dem Tag). Die
  Phase ist kein Merkmal eines Elements. Die
  **Freigabe der Stände ist geordnet** — ein
  Pflicht-Stand der Phase Pn wird nach den
  Pflicht-Ständen der früheren Phasen derselben Marke
  freigegeben. **Phasen ordnen Freigaben, nicht
  Arbeit.**
- **Freigabe-Ordnung als Warnung:** Fehlt ein früherer
  Pflicht-Stand ohne Verzicht (§Fehlende und
  vertretene Glieder), warnt der Agent
  ([[Berichten-statt-Blockieren]]; Vorgehen.md §1
  „Phasen sind ein Angebot“). Der Anwender
  entscheidet; gibt er trotzdem frei, nennt der
  Freigabe-Eintrag den fehlenden Vorgänger als
  Einschränkung ([[Entscheidungen]] Meta
  „Freigabe-Einträge“). **Ausgenommen bleibt die
  Tag-Bedingung des Testplan-Stands:** P10 wird erst
  nach dem Tag freigegeben, ohne Ausnahme (beim
  Koordinator ohne eigene Bauteile vertreten die
  Lieferungen den Tag).
- **Doku-Glieder** (dieser Absatz und der nächste sind
  der führende Ort der Regel): Die Kette trägt drei
  Glieder, deren Stand **selbsttragend** ist
  ([[Einfrieren-und-Abloesen]] §Stand, Grad) — mit
  SP-1 die **Entwickler-Doku** (P11, „für P13
  Ausliefern“), die **Benutzer-Doku** (P12, „für P13
  Ausliefern“) und die **Betriebs-Anleitung je
  Zielumgebung** (P15, „für P15 Betreiben“); welche
  Quell-Stände sie ausformulieren, sagt ihr
  Dokumenttyp-Eintrag. **Ordnung:** Entwickler-Doku und
  Benutzer-Doku stehen in der Freigabe-Ordnung **vor**
  dem Deploy-Stand (P13) — fehlt eines ohne Verzicht,
  warnt der Agent, und der Freigabe-Eintrag des
  Deploy-Stands nennt das fehlende Glied als
  Einschränkung („Doku folgt“), keine Blockade (oben,
  Freigabe-Ordnung als Warnung). Die Betriebs-Anleitung
  steht **hinter** ihrem Quell-Stand: Sie wird erst nach
  der Freigabe des Deploy-Stands ihrer Umgebung
  freigegeben; ein weiterer Deploy-Stand derselben
  Umgebung ist der Anlass einer neuen Version ihrer
  Betriebs-Anleitung. Vorbedingung der Entwickler-Doku
  und der Benutzer-Doku ist der Testbericht wie beim
  Deploy-Stand (§Code-Glieder). Jedes Doku-Glied ist
  per Verzichts-DEC je Marke verzichtbar, bei der
  Betriebs-Anleitung je Umgebung (§Fehlende und
  vertretene Glieder); ein freigegebener Doku-Stand der
  Vormarke gilt weiter, solange er nicht überholt ist
  (unten, Übernahme aus der Vormarke). Die Freigabe
  jedes Doku-Stands einer nicht abgeschlossenen Marke
  ist ein Meilenstein-Anlass wie bei jedem
  Pflicht-Stand (mit SP-1: `Meilenstein-und-T2`).
  Welche Doku-Glieder Koordinator, Komponente und
  Standalone-Projekt führen: §Fehlende und vertretene
  Glieder, §Komponenten-Kette nach Übernahme-Art.
- **Doku-Abfrage** (ein Mechanismus für die drei
  Doku-Glieder; der Prozess bindet ihn in seinem
  Vorgehen ein, mit SP-1 `Vorgehen-SP-1.md` §2): Sobald
  der **Tag der Implementierung** der Marke gesetzt ist
  (Glied P9 — erst dann ist der Umfang der Änderung
  bekannt; beim Koordinator ohne eigene Bauteile
  vertreten die Lieferungen den Tag — der Zeitpunkt ist
  die Buchung der letzten zur Marke erwarteten
  Lieferung, §Fehlende und vertretene Glieder,
  §Freigabe-Ordnung des Koordinators), legt der Agent
  dem Anwender **einmal je
  Marke** die Doku-Abfrage vor: eine Tabelle mit je
  einer Zeile für Entwickler-Doku, Benutzer-Doku und
  Betriebs-Anleitung **je Zielumgebung** — bei einer
  Komponente ohne eigene Zielumgebung nur die Zeile
  Entwickler-Doku, bei einer Komponente mit eigener
  Zielumgebung alle Zeilen wie bei einem
  Standalone-Projekt —, mit den Spalten Zeitpunkt,
  Form, Empfehlung des Agenten und Begründung. Die
  Arbeit an einer Doku darf früher beginnen (Zwei
  Ordnungen, oben); die Abfrage entscheidet
  Freigabe-Zeitpunkt und Form. Der Deploy-Stand selbst
  ist nicht Teil der Abfrage; die Betriebs-Anleitung
  folgt ihm. Die Abfrage ist die Auslöser-Zeile der
  drei Dokumenttyp-Einträge und ersetzt für sie den
  Standard-Auslöser ([[Katalog]] §Typ-Konventionen,
  Auslöser-Zeile).
  **Dimension Zeitpunkt:** **jetzt** — Freigabe vor der
  Auslieferung, in der Ordnung der Kette (Normalfall);
  **später** — Auslieferung zuerst, der Deploy-Stand
  wird mit der Einschränkung „Doku folgt“ freigegeben,
  die Doku spätestens zum Marken-Abschluss (unten);
  **gar nicht** — der Agent unterscheidet **Übernahme**
  (für diese Leser hat sich nichts geändert; der
  freigegebene Stand der Vormarke gilt weiter, solange
  er nicht überholt ist, und der Abschluss-Stand weist
  ihn mit „übernommen aus <Vormarke>“ aus) von
  **Verzicht** (es soll keinen Stand geben; mit
  Begründung, Buchung unten). Für die
  Betriebs-Anleitung, die hinter ihrem Quell-Stand
  steht, heißt **jetzt**: Freigabe nach dem
  freigegebenen Deploy-Stand ihrer Umgebung und vor
  dem Marken-Abschluss; **später**: der
  Marken-Abschluss wartet nicht auf sie, ihre Freigabe
  steht nach dem Wechsel als Nachtrag (unten); eine
  Einschränkung „Doku folgt“ am Deploy-Stand gibt es
  für sie nicht, weil er vor ihr freigegeben ist.
  **Dimension Form** (bei „jetzt“ und „später“):
  **Änderungsdokument** — benennt die Änderungen
  gegenüber der Vollfassung für diese Leser und trägt
  im Kopf das Feld `basis:` mit der Vollfassung
  (Stand-Datei mit Version, in der Form des Feld-Sets
  „Verweise“ eines Freigabe-Eintrags); es ist
  **kumulativ**: ein weiteres Änderungsdokument zur
  selben Vollfassung enthält die früheren Änderungen
  wieder und überholt das frühere als neuer Stand, so
  dass Vollfassung plus ein Änderungsdokument immer
  genügen (Prüfung: §Regel, Änderungsdokument);
  **Einarbeitung** — eine neue Vollfassung, geänderte
  Kapitel neu aus dem Wiki erzeugt, übrige Kapitel
  unverändert aus der Vollfassung übernommen;
  **komplett neu** — eine neue Vollfassung,
  vollständig aus dem Wiki erzeugt. In allen Formen
  stammt jeder Text aus dem Wiki bzw. aus den
  Quell-Ständen, nichts wird von Hand nachgezogen
  (MasterPrompt §9.6 „Neu ableiten statt nachpflegen“),
  und Kettenprüfung und Verständnis-Check M6
  (`Reviewmuster.md`) gehen über das **ganze**
  Dokument.
  **Empfehlungs-Heuristik** des Agenten (aus Umfang und
  Art der Änderung; der Anwender entscheidet): erste
  Marke, Bruch-Marke oder neue Struktur des Produkts →
  komplett neu; übliche Folge-Marke → Einarbeitung;
  Patch- oder Zwischenmarke mit kleiner Änderung →
  Änderungsdokument; ab zwei Änderungsdokumenten seit
  der letzten Vollfassung → Einarbeitung; dringender
  Fix → später; nichts für diese Leser sichtbar → gar
  nicht (Übernahme). Erste Marke nach einem Upgrade,
  das die Doku-Glieder einführt → komplett neu;
  vorgefundene Dokumente in `docs/` bleiben als
  Nachweis liegen. Eine beim Upgrade laufende Marke,
  deren Tag schon gesetzt ist, erhält die Abfrage mit
  dem Upgrade nachgeholt; ein zu ihr schon
  freigegebener Deploy-Stand bleibt freigegeben, die
  Doku-Zeilen stehen dann auf „später“ oder „gar
  nicht“, und ein fehlendes Doku-Glied ist Warnung,
  keine Blockade.
  **Buchung:** Das Ergebnis der Abfrage wird **je Zeile
  als eigene DEC** gebucht — je Doku-Art, bei der
  Betriebs-Anleitung je Umgebung — mit Zeitpunkt, Form
  und Begründung; Gegenstand
  `Doku-Entscheidung zu Marke <M>: <Dokumentname>[ –
  <Umgebung>] — <Zeitpunkt>, <Form>`; die Tabelle der
  Abfrage steht als Nachweis im Anlass der ersten
  dieser DECs, die übrigen verweisen darauf. Vorlage
  der Abfrage (Beispiel, Folge-Marke 1.1 mit einer
  Zielumgebung):

  | Doku-Art | Zeitpunkt | Form | Empfehlung | Begründung |
  |---|---|---|---|---|
  | Entwickler-Doku | jetzt / später / gar nicht | Änderungsdokument / Einarbeitung / komplett neu | jetzt, Einarbeitung | übliche Folge-Marke; zwei Kapitel (Persistenz, Build) betroffen |
  | Benutzer-Doku | jetzt / später / gar nicht | Änderungsdokument / Einarbeitung / komplett neu | gar nicht (Übernahme) | für Benutzer nichts Sichtbares geändert; Stand 1.0 gilt weiter |
  | Betriebs-Anleitung – Produktion | jetzt / später / gar nicht | Änderungsdokument / Einarbeitung / komplett neu | jetzt, Änderungsdokument | eine neue Umgebungsvariable; Vollfassung 1.0 als `basis:` |

  Die Zeilen-DECs dazu: `Doku-Entscheidung zu Marke 1.1:
  Entwickler-Doku — jetzt, Einarbeitung`;
  `Doku-Entscheidung zu Marke 1.1: Benutzer-Doku — gar
  nicht (Übernahme)` mit dem übernommenen Stand;
  `Doku-Entscheidung zu Marke 1.1: Betriebs-Anleitung –
  Produktion — jetzt, Änderungsdokument`. Eine Zeile
  **„gar nicht (Verzicht)“** ist eine gewöhnliche
  Verzichts-DEC mit `decision_type: verzicht`,
  `zielmarke:` und `phase:` mit **genau einer** Phase
  (P11 oder P12); für die Betriebs-Anleitung ist der
  Verzicht ein Verzicht auf P15 **je Umgebung**: die
  Verzichts-DEC trägt zusätzlich `umgebung:` mit dem
  Namen der Umgebung aus der Entitäts-Fassade der
  Zielumgebungen — dasselbe Feld wie DEPL und die
  Fix-Anforderung auf einen Deploy —, je Umgebung eine
  Verzichts-DEC (§Lint-Anteil, Verzicht;
  [[Entscheidungen]] Meta „Verzichts-Einträge“). Zeilen
  **„gar nicht (Übernahme)“** sind kein Verzicht: ihre
  DEC nennt den übernommenen Stand der Vormarke mit
  Version, der Abschluss-Stand weist ihn aus. Zeilen
  „jetzt“ und „später“: ihre DEC ist die
  Doku-Entscheidung; die Freigaben der Doku-Stände
  bleiben eigene Freigabe-Einträge ([[Entscheidungen]]
  Meta „Freigabe-Einträge“). Eine Zeilen-DEC, die erst
  nach dem Marken-Abschluss entsteht (später
  hinzukommende Umgebung, unten), trägt `zielmarke: M`
  wie jede DEC, die nur eine nachgetragene Umgebung
  betrifft ([[Zielmarken]] §Meta, Nachtrag).
  **„Später“ und Nachtrag:** Ein Doku-Stand mit
  „später“ wird spätestens zum Marken-Abschluss
  freigegeben — der Vollständigkeits-Scan der
  Wechsel-Prozedur legt ihn als offenen Punkt vor, auch
  eine Betriebs-Anleitung mit „später“; entscheidet der
  Anwender dort erneut „später“, wird der Doku-Stand
  nach dem Wechsel als **Nachtrag** am Marken-Eintrag
  gebucht: seine Freigabe steht als Formel in der
  Nachtragszeile, kein eigener Freigabe-Eintrag, keine
  Ablösung — derselbe Mechanismus wie beim
  nachgetragenen Deploy-Stand (Format: [[Zielmarken]]
  §Meta, Nachtrag); der Abschluss-Stand bleibt und ist
  dadurch nicht überholt; kein Meilenstein-Anlass, kein
  Auslöser der Release-Notes.
  **Später hinzukommende Umgebung:** Kommt nach der
  Abfrage eine Zielumgebung hinzu — vor oder nach dem
  Marken-Abschluss — oder entsteht zu einer Umgebung
  ein weiterer Deploy-Stand, stellt der Agent mit der
  Vorlage dieses Deploy-Stands die Zeile
  Betriebs-Anleitung für diese Umgebung nach (Zeitpunkt,
  Form, Heuristik wie oben); das Ergebnis ist eine DEC
  wie jede Zeile. Die Abfrage je Marke bleibt eine; die
  Nachfrage je Umgebung ist ihre Fortsetzung, kein
  zweiter Mechanismus.
  **Release-Notes bleiben unverändert**
  ([[Katalog-Release-Notes]]): Sie sagen, **was** sich
  geändert hat; ein Änderungsdokument sagt, **wie** man
  das Geänderte benutzt, ändert oder betreibt. Beides
  nebeneinander ist keine Redundanz. **Ohne Prozess**
  gibt es keine Phasen und keine Doku-Abfrage (oben,
  Projekt ohne Prozess); der Agent bietet Doku-Stände
  dann nur auf Zuruf an (optionaler Stand).
- **Übernahme aus der Vormarke:** Ein freigegebener
  Pflicht-Stand der Vormarke gilt für die Folge-Marke
  weiter, solange er nicht überholt ist
  ([[Einfrieren-und-Abloesen]] §Überholt-Regel,
  Marken-Bezug) — auch wenn seine Freigabe durch eine
  Neu-Ableitung für eine spätere Marke abgelöst ist:
  die Ablösung wirkt erst ab deren Marke, für eine
  vorgezogene Zwischenmarke gilt die alte Freigabe
  weiter (ebenda §Ablösung). Vormarke ist die vorige Marke der
  Abfolge; eine Zwischenmarke, die als Sackgasse
  angelegt ist, zählt nicht als Vormarke, aus ihr wird
  nichts übernommen (nächster Punkt). Der übernommene
  Pflicht-Stand wird nicht neu gebildet und nicht
  neu freigegeben; er zählt als Pflicht-Stand der
  Folge-Marke in dieser Ordnung und ist Vorgänger
  eines neuen Stands wie ein Stand derselben Marke
  (`herkunft` nennt ihn mit Ketten-ID und Version,
  [[Einfrieren-und-Abloesen]] §Stand). Der
  Abschluss-Stand der Folge-Marke weist ihn mit
  „übernommen aus <Vormarke>“ aus; seine Freigabe
  bestätigt die Übernahme ([[Katalog-Abschluss-Stand]]).
  Hat die Folge-Marke schon einen eigenen
  freigegebenen Stand desselben Dokumenttyps, ist
  dieser ihr Glied, nicht der Stand der Vormarke — so
  liest es auch der Lint (eigene Freigabe zuerst, sonst
  die der nächsten Vormarke; bei der Rückkehr aus einer
  Zwischenmarke, die Vorgänger ist, gilt das für die
  schon gebildeten Stände der zurückgestellten Marke
  gegenüber den Ständen der Zwischenmarke; folgen
  mehrere Zwischenmarken aufeinander, ist die Vormarke
  einer folgenden die vorige Zwischenmarke, wenn diese
  Vorgänger ist, sonst die Marke davor — [[Zielmarken]]
  §Meta, Zwischenmarke). Bei der Rückkehr aus einem
  Vorgänger legt der Agent im Vollständigkeits-Scan
  auch jedes Element vor, das zwei für die
  zurückgestellte Marke geltende Nachfolger hat — einen
  aus der Zwischenmarke, einen aus der zurückgestellten
  Marke —; der Lint meldet es als Fehler
  `NACHFOLGER-DOPPELT`, bis der Anwender gewählt hat
  ([[Zielmarken]] §Meta, Zwischenmarke — doppelte
  Nachfolger; [[Einfrieren-und-Abloesen]] §Ablösung);
  dasselbe gilt, wenn der Nachfolger-DEPL eines
  Nachtrags ein DEPL ablöst, das die laufende
  Folge-Marke schon selbst abgelöst hat — die Vorlage
  spätestens im Vollständigkeits-Scan der Folge-Marke
  ([[Zielmarken]] §Meta, Nachtrag).
  Ist ein übernommener Stand überholt, entsteht ein
  neuer Stand für die Folge-Marke mit eigener Freigabe
  (Neu-Ableitung). Ein Testbericht der Vormarke gilt
  zum übernommenen Testplan-Stand weiter; ein neuer
  Durchgang (z.B. nach einer neuen Lieferung) erzeugt
  einen neuen Testbericht.
  **Folge-Marke mit eigenem Tag — Folge-Version:** Hat
  die Folge-Marke einen eigenen Tag (das Produkt ist
  geändert, der Tag wird nicht übernommen — nächster
  Absatz), gelten der **Testplan-Stand**, der
  **Deploy-Stand** je Umgebung und die
  **Betriebs-Anleitung** je Umgebung der Vormarke für
  sie **nicht als übernommen**: Testplan-Stand und
  Deploy-Stand nennen in `herkunft` den Tag der
  Vormarke, der für die Folge-Marke nicht das Glied P9
  ist — sie sind für die Folge-Marke überholt
  ([[Einfrieren-und-Abloesen]] §Überholt-Regel, Tag in
  `herkunft`); die Betriebs-Anleitung ist über ihren
  Quell-Stand überholt. Alle drei brauchen eine eigene
  Freigabe zur Folge-Marke („für P10 Testen“, „für P13
  Ausliefern“, „für P15 Betreiben“ zu Marke M) als
  **Folge-Version**: eine neue Version derselben
  Ketten-ID mit `marke: M`, eigenem `datum` und dem Tag
  der Folge-Marke in `herkunft` — beim Deploy-Stand mit
  dem Testbericht zu diesem Tag, bei der
  Betriebs-Anleitung mit der Folge-Version des
  Deploy-Stands — der einzige Fall einer neuen Version
  über die Marken-Grenze (ebenda §Stand). Die Freigabe
  der Folge-Version löst die Freigabe der
  Vormarken-Version ab; die Ablösung wirkt ab der
  Folge-Marke, die Vormarke behält Version und
  Freigabe, ihr Abschluss-Stand ist dadurch nicht
  überholt. Hat sich außer Tag und Testbericht nichts
  geändert — dieselben TEST-Elemente und dasselbe
  Test-Setup, dieselben DEPL der Umgebung, dieselbe
  SPEC der Pipeline, derselbe Ablauf —, **empfiehlt der
  Agent, die Folge-Version mit unverändertem Text
  vorzulegen** (nur der Kopf wechselt) und sagt es in
  der Vorlage („Inhalt wie Version VV zu <Vormarke>;
  neu: Tag, Testbericht“); Kettenprüfung und Freigabe
  laufen wie bei jedem Stand. Für die Betriebs-Anleitung
  stellt die Doku-Abfrage die Zeile je Umgebung dann
  ohne die Wahl „gar nicht (Übernahme)“ (oben,
  Doku-Abfrage); Entwickler-Doku und Benutzer-Doku
  bleiben bei der ausdrücklichen Wahl der Doku-Abfrage,
  „gar nicht (Übernahme)“ eingeschlossen — der Tag der
  Vormarke in ihrer `herkunft` ist für sie kein
  Überholt-Grund. Ohne eigenen Tag bleibt die
  Übernahme aller Stände wie oben. Der Lint übernimmt
  Testplan-Stand, Deploy-Stand und Betriebs-Anleitung
  aus der Vormarke nur, wenn zur Folge-Marke keine
  Tag-Freigabe gebucht ist; sonst meldet er das Glied
  als fehlend (§Lint-Anteil).
- **Sackgasse** (Zwischenmarke, die in keiner
  Folge-Marke enthalten ist; führender Ort:
  [[Zielmarken]] §Meta, Zwischenmarke): Ein Element der
  regulären Linie wird in einer Sackgasse nicht
  abgelöst, sondern überlagert — das Sackgassen-Element
  trägt neben der `zielmarke:` der Sackgasse das Feld
  `ueberlagert: [<ID>]`, das überlagerte Element bleibt
  unverändert; die Kettenprüfung liest für die Sackgasse
  das überlagernde, für jede andere Marke das
  überlagerte Element. Stände der Vormarke werden in
  die Sackgasse übernommen wie in jede Folge-Marke;
  verweist ein übernommener oder ein schon für die
  Sackgasse freigegebener Stand ein Element, das erst
  danach für die Sackgasse überlagert wird, ist das
  kein Überholt-Befund und kein Fehler: der Lint meldet
  den Hinweis `UEBERLAGERUNG`, der Agent fragt den
  Anwender, ob er eine neue Version bzw. einen eigenen
  Stand der Sackgasse ableitet oder den Stand belässt
  (Rückfrage und Vermerk: ebenda). Was der Anwender auf
  die Rückfrage des Agenten aus der Sackgasse in die
  reguläre Linie übernimmt, ist dort ein eigenes
  Element mit `zielmarke:` der zurückgestellten Marke
  und `vorgaenger:` auf das Sackgassen-Element — bei
  einem überlagernden Element als Ablösung des Elements,
  das in der zurückgestellten Marke gerade gilt (das
  überlagerte oder dessen für sie gültiger Nachfolger),
  damit kein Element zwei für sie geltende Nachfolger
  bekommt (Format
  und Rückfrage: ebenda); umgehängt wird nichts. Der
  Zweig der Sackgasse im Produkt-Repo wird nicht
  zurückgeführt; Übernommenes kommt mit eigenen Commits
  auf die Hauptlinie (ebenda, Tag und Produkt-Repo).
- **Übernahme des Tags und der Lieferung** (dieser
  Absatz ist der führende Ort der Regel): Ist das
  Produkt seit dem Tag der Vormarke unverändert — kein
  Commit am Produkt seit dem Tag, das heißt keine
  Änderung in den Pfaden des Produkts, die
  `wiki/Facts.md` §Allgemeine Fakten neben der
  Tag-Konvention nennt (im Zwei-Repo-Fall das
  Produkt-Repo, [[Two-Repo-Submodul-Muster]]) —, gilt
  dieser Tag für die Folge-Marke weiter, solange die
  Stände, auf denen er beruht, für die Folge-Marke
  nicht überholt sind ([[Einfrieren-und-Abloesen]]
  §Überholt-Regel).
  Kein neuer Tag, keine neue Tag-Freigabe; der
  übernommene Tag ist Pflicht-Glied P9 der Folge-Marke
  in dieser Ordnung, und ein Stand oder Testbericht
  der Folge-Marke, der den Tag nennt, führt in
  `herkunft` den alten Tag-Namen
  ([[Einfrieren-und-Abloesen]] §Stand). Der
  Abschluss-Stand der Folge-Marke führt den Tag mit
  „übernommen aus <Vormarke>“ wie einen übernommenen
  Stand; seine Freigabe bestätigt die Übernahme
  ([[Katalog-Abschluss-Stand]]). Bei einer Komponente
  gilt damit auch ihre **Lieferung** weiter: sie
  meldet die Übernahme dem Koordinator mit ihrem
  Marken-Abschluss (Vorgehen.md §3a), und der
  Koordinator bucht sie als übernommene Lieferung in
  „Zuliefernde Komponenten“ seiner Folge-Marke
  (Format: [[Zielmarken]]); die übernommene Lieferung
  zählt für die Vorbedingung seines Testplan-Stands
  wie eine neue (§Freigabe-Ordnung des Koordinators).
  Ist das Produkt unverändert, aber ein Stand, auf dem
  der Tag beruht, für die Folge-Marke überholt, gilt
  der Tag nicht weiter: neuer Tag nach der
  Neu-Ableitung. Ist das Produkt geändert, gilt der
  übliche Weg: neuer Tag nach der Projekt-Konvention
  mit Freigabe und neuer Lieferung — und mit dem
  eigenen Tag folgen Testplan-Stand, Deploy-Stand und
  Betriebs-Anleitung der Folge-Marke als
  Folge-Versionen mit eigener Freigabe (oben,
  Folge-Marke mit eigenem Tag). Der Tag einer
  Zwischenmarke sitzt auf ihrem eigenen Zweig ab dem
  Tag ihrer Vormarke (Zweig-Konvention in
  `wiki/Facts.md` neben der Tag-Konvention); ist die
  Zwischenmarke Vorgänger, führt der Agent den Zweig bei
  der Rückkehr in die Hauptlinie zurück, und ob ihr Tag
  für die zurückgestellte Marke weitergilt, bemisst sich
  danach an den Pfaden des Produkts auf der Hauptlinie
  wie bei jeder Vormarke ([[Zielmarken]] §Meta,
  Zwischenmarke — Tag und Produkt-Repo). Nach dem
  Marken-Wechsel kann ein Tag — mit und ohne Prozess —
  per Nachtrag „Tag korrigiert“ einen neuen Namen
  bekommen (oben, Tag-Korrektur ohne Prozess bzw. mit
  Prozess nach dem Wechsel); für die Übernahme zählt
  der Tag-Name aus dem jüngsten Nachtrag.
- **Brücke:** Früh gebuchte Elemente nimmt die
  Ableitung des Stands auf, der sie filtert; die
  Kettenprüfung prüft sie gegen das bis dahin
  Freigegebene; passt ein Element nicht, wird es
  abgelöst. Der Rücklauf ist der umgekehrte Fall: ein
  spätes Element löst ein früheres ab, der frühere
  Stand ist überholt und wird neu abgeleitet
  ([[Einfrieren-und-Abloesen]] §Überholt-Regel).

## Regel

Jedes Glied wird vor seiner Freigabe gegen **alle
freigegebenen Vorgänger derselben Marke** geprüft,
nicht nur gegen den direkten Vorgänger — auf drei
Dinge:

- **Widerspruch** — der Stand widerspricht einem
  Vorgänger; geprüft gegen **alle** freigegebenen
  Vorgänger der Marke;
- **Abdeckung** — alles vom Vorgänger ist aufgegriffen;
  geprüft nur gegen die **Quell-Stände bzw.
  Quell-Register seines Dokumenttyp-Eintrags** —
  Quell-Stände dürfen aus Komponenten-Repos stammen,
  qualifiziert als `<repo>/<Dateiname>` (die
  Entwickler-Doku der Komponenten für die Gesamtsicht
  des Koordinators); sie zählen dann als Vorgänger
  auch für den Widerspruch, und fehlt ein Quell-Stand
  (abgeleitet entfallen, §Fehlende und vertretene
  Glieder), genügen die übrigen —: die
  Benutzer-Doku deckt Konzept, Anforderungen und
  Funktionsbeschreibung ab, nicht die Spezifikation;
  die Betriebs-Anleitung den Deploy-Stand ihrer
  Umgebung; der Testplan die REQ und FUNC über
  `prueft:`;
- **Unbegründetes** — eine **neue Sachaussage**, die
  kein Vorgänger trägt (eine Funktion, eine
  Eigenschaft, eine Grenze, die das Produkt laut
  Vorgängern nicht hat). **Darstellung** — Anleitungen,
  Beispiele, Erklärungen, Gliederung, Bilder,
  Schritt-für-Schritt-Wege — ist erlaubt und kein
  Befund, solange sie keine neue Sachaussage enthält;
  das gilt für selbsttragende Stände ebenso wie für
  wiki-verweisende.

**Änderungsdokument** (Form eines Doku-Stands nach der
Doku-Abfrage, §Kette): Es benennt die Änderungen
gegenüber der Vollfassung unter `basis:` kumulativ, so
dass Vollfassung plus ein Änderungsdokument immer
genügen. Die Abdeckung wird nur für den **Zuwachs seit
der Vollfassung** geprüft — die Elemente der
Quell-Stände, die seit der Vollfassung hinzugekommen
oder abgelöst sind (`zielmarke:` der Marken seit der
Vollfassung); auf Widerspruch wird zusätzlich gegen die
Vollfassung unter `basis:` geprüft, damit Vollfassung
und Änderungsdokument zusammen gelesen keinen
Widerspruch ergeben. Der Lint liest `basis:` als
Verweis auf die Stand-Datei mit Version (§Lint-Anteil).

Die **freigegebenen Vorgänger** liest der Agent aus
dem Register [[Entscheidungen]]: es sind die Stände
früherer Phasen, deren Freigabe-Eintrag für die Marke
des geprüften Stands gilt — kein ablösender
Freigabe-Eintrag (Neu-Stand) gilt für sie; der Status
`abgelöst` allein ist kein Filter, die Ablösung wirkt
ab der Marke des Nachfolgers ([[Einfrieren-und-Abloesen]]
§Stand, §Ablösung) — und deren Marke die des geprüften
Stands ist — dazu die übernommenen Stände der
Vormarke (§Kette). **Die Marke eines
Freigabe-Eintrags ist die `marke` im Kopf des
freigegebenen Stands** ([[Einfrieren-und-Abloesen]]
§Stand); der Zusatz „zu Marke M“ in der Formel
wiederholt sie nur und steht bei der Buchung, wenn
die Marke des Stands nicht die `in-progress`-Marke
ist (Vorgehen.md §4). **Bei einer Freigabe ohne
Stand-Datei steht er immer** — bei der Freigabe per
Tag wie bei jeder anderen: der Eintrag ist die einzige
Quelle ihrer Marke, eine ungenannte Marke gibt es bei
Freigaben nicht (Vorgehen.md §4). So bleibt auch
nach einem Marken-Wechsel eindeutig, zu welcher Marke
ein älterer Eintrag gehört. Der Lint erkennt
Freigabe-Einträge an der wörtlich eingehaltenen
Formel ([[Entscheidungen]] Meta „Freigabe-Einträge“)
und liest daraus Stand mit Version bzw. Tag-Name,
Dokumenttyp, Zweck und Marke (§Lint-Anteil).

Nennt eine Regel ein Glied („gegen SPEC“, „in P4
verhandelt“), gilt sie für das, was dieses Glied
vertritt; fehlt das Glied, fällt es aus der Regel
heraus — Anwendung dieses Abschnitts; die Fälle stehen
in §Fehlende und vertretene Glieder.

Die Prüfung ist **Pflicht vor jeder Freigabe eines
Pflicht-Stands**; optionale Stände werden nur auf
Anfrage geprüft; der Abschluss-Stand wird nur auf
Vollständigkeit geprüft. **Zeitpunkt:** Bei einem
Pflicht-Stand läuft die Prüfung durch das zweite
Modell **vor der Vorlage** an den Anwender, so dass er
den `review-report` mit dem Stand erhält; wird der
Stand vor der Freigabe korrigiert (Korrektur in die
Elemente, neue Version — [[Lebenslauf-eines-Stands]]
Schritt 6), läuft eine **neue Runde nur über die
geänderten Elemente**, mit Ergebnis wie im
§Reviewer-Anteil. **Verweise eines freigegebenen
Stands** zeigen nur auf eingefrorene Knoten, die für
die Marke gelten (Marken-Regel in
[[Einfrieren-und-Abloesen]]); eine vorgelegte, noch
nicht freigegebene Version darf `offen`e Elemente der
beschreibenden Register (Sammelzustand `offen`)
verweisen und weist sie im Kopf aus — mit der Freigabe
nimmt der Agent sie an ([[Einfrieren-und-Abloesen]]
§Ableitungsprüfung).

## Lint-Anteil (Mechanik)

Der Lint prüft die Abdeckung über die Felder
`abgeleitet_von:` und `prueft:`. Alle Verknüpfungen der
Kette sind **n:m**, beide Felder nehmen Listen auf; der
Lint prüft **„mindestens einer“** je Glied, die
Vollständigkeit der Abdeckung beurteilt der Reviewer:

- Jede REQ wird von mindestens einer FUNC abgedeckt,
  jede FUNC von mindestens einer SPEC. Eine
  Fix-Anforderung ist durch ihren BUG begründet
  (`behebt:` an Stelle von `abgeleitet_von:`); eine
  ablösende oder neue REQ, die einen BUG behebt, trägt
  `behebt:` zusätzlich — ihre Begründung bleibt
  `abgeleitet_von:` (SP-1 `Anforderungen.md`
  „Fehlerbehebungen“). Eine Fix-Anforderung auf einen
  Deploy (`requirement_type: fix` mit `umgebung:`; ein
  Fehler in der Auslieferung, behoben durch einen
  weiteren Deploy-Stand derselben Umgebung) wird nicht
  von FUNC, SPEC und TEST gedeckt, weil sich am Produkt
  nichts ändert; der Lint erwartet für sie keine FUNC
  und keine TEST, und umgesetzt ist sie mit der Freigabe
  des Deploy-Stands (SP-1 `Anforderungen.md`
  „Fehlerbehebungen“; den freigegebenen Stand liest der
  Lint am angehängten Vermerk der Anforderung und
  prüft, dass eine Nachtragszeile oder ein
  Freigabe-Eintrag ihn nennt).
- Jede REQ und jede FUNC wird von mindestens einer TEST
  geprüft; `prueft:` darf auf SCEN zeigen.
- Jede Komponente hat je Umgebung einen DEPL, und DEPL
  passt zu ARC. Die Paare liest der Lint aus
  §Komponenten der Architektur-Fassade und der
  Entitäts-Fassade der Zielumgebungen (mit SP-1);
  ein Standalone-Projekt gilt als eine Komponente.
  Geprüft wird im Repo, das die DEPL führt: beim
  Koordinator für alle Zeilen in §Komponenten je
  Zielumgebung, bei einer Komponente mit eigener
  Zielumgebung für die eigene Zeile, bei einem
  Zwischen-Koordinator mit eigener Zielumgebung für
  die eigene Zeile und seine Unter-Komponenten
  (§Komponenten-Kette nach Übernahme-Art).
- Welche CON eine SPEC abdecken muss, steht im
  Katalog-Eintrag `contract`.
- **Verweis-Satz:** An einem **freigegebenen** Stand
  (Freigabe-Eintrag oder Nachtragszeile, unten) meldet
  der Lint jedes verwiesene Element, das noch `offen`
  oder `aufgeschoben` ist und mit der Annahme
  einfriert, als Fehler — ein Stand wird nur aus
  Eingefrorenem freigegeben. An einer **vorgelegten**,
  noch nicht freigegebenen Version sind ausgewiesene
  `offen`e Elemente der beschreibenden Register
  (Sammelzustand `offen`) kein Befund; fehlt ein
  solches Element in der Zeile `Offen (Annahme im
  Freigabe-Zug): …` unter dem Titel, ist das ein
  Hinweis, ebenso ein verwiesenes `offen`es oder
  `aufgeschoben`es Element eines Sammel-Registers mit
  `aufgeschoben` (annehmen, weglassen oder
  Momentaufnahme — [[Einfrieren-und-Abloesen]]
  §Ableitungsprüfung). Ein in der Zeile `Nicht
  berücksichtigt (offen): …` ausgewiesenes Element ist
  kein Verweis des Stands. Geprüft werden Elemente mit
  Detail-Knoten und Fassaden-Einträge ohne Knoten
  gleichermaßen; den Status liest der Lint aus dem
  Fassaden-Eintrag.
- **Freigabe-Einträge** erkennt der Lint an der
  kanonischen Formel im Gegenstand des Eintrags
  ([[Entscheidungen]] Meta „Freigabe-Einträge“); den
  Zweck liest er an der Phasen-Angabe `Pn` (bzw.
  `Pn/Pm`) — nur bei einem eingefrorenen Eintrag vor dem
  Stichtag (Bestand; etwa aus einem 2.0-Projekt), dessen
  Nummer keine Phase des Katalog-Zwecks trifft, am
  Tätigkeitsnamen: „für P11 Ausliefern“ liest sich als
  P13 Ausliefern, „für P13 Betreiben“ als P15 Betreiben
  (die Nummer wird dann nicht gelesen, die
  Zuordnungstabelle nicht gebraucht); ein Eintrag ab dem
  Stichtag nennt Nummer und Tätigkeitsname der aktuellen
  Zählung, eine falsche Nummer ist ein Hinweis —, den Tag
  am ⟨Artefakt⟩ „Implementierung“ mit Zweck P10
  (Vorgehen.md §4). Eine Abweichung vom Wortlaut
  meldet er als **Hinweis**; ein **Fehler** ist sie
  nur, wenn der Eintrag erkennbar eine Freigabe sein
  will (beginnt mit „Stand “ und enthält „freigegeben
  für“) und die Formel trotzdem verfehlt; passt der
  Zweck nicht zum Katalog-Zweck des Dokumenttyps, ist
  das ein Hinweis. Daraus prüft er
  die **Freigabe-Ordnung** (§Kette) — ein fehlender
  früherer Pflicht-Stand ohne Verzicht ist eine
  Warnung, auch ein fehlendes Doku-Glied P11 oder P12
  vor dem Deploy-Stand („Doku folgt“); die fehlende
  Tag-Bedingung des Testplan-Stands ein Fehler; die
  Betriebs-Anleitung einer Umgebung zählt erst nach dem
  freigegebenen Deploy-Stand dieser Umgebung — und die **Übernahme**
  aus der Vormarke (Vorgänger eines Stands darf der
  übernommene Stand der Vormarke sein; ein
  übernommener Tag und eine übernommene Lieferung
  erfüllen die Tag-Bedingung, §Kette; Testplan-Stand,
  Deploy-Stand und Betriebs-Anleitung übernimmt der
  Lint nur, wenn zur geprüften Marke keine Tag-Freigabe
  gebucht ist — sonst sind sie für sie überholt, und
  eine Zeile „übernommen aus <Vormarke>“ für einen
  solchen Stand im Abschluss-Stand ist ein Fehler, an
  einer abgeschlossenen Marke ein Hinweis — §Kette,
  Folge-Marke mit eigenem Tag). Ohne Prozess
  gibt es keine Freigabe-Ordnung; der Lint prüft dann
  nur, ob der Abschluss-Stand den Tag führt (§Kette,
  Projekt ohne Prozess).
- **Rolle des Repos:** mit RP-1 liest der Lint sie
  aus der Spalte Rolle in §Komponenten der
  Architektur-Fassade; unter SP-1 (ohne diese Spalte)
  erkennt er ein Komponenten-Repo daran, dass sein
  Marken-Eintrag `fuer_marke:` trägt ([[Zielmarken]]
  §Meta „Marken-Dreiklang“); trägt er `fuer_marke:`
  und führt §Komponenten eine Unter-Komponente (Zeile
  mit Übergabe-Stand dieses Repos), prüft er als
  Komponente und Koordinator (§Komponenten-Kette nach
  Übernahme-Art, Zwischen-Koordinator). Ohne
  `fuer_marke:` prüft er als Koordinator; ein
  Standalone-Projekt (eine Zeile mit dem eigenen Repo)
  ist dabei der Koordinator mit genau einem eigenen
  Bauteil (§Freigabe-Ordnung des Koordinators).
- **Verzicht** erkennen Lint und Kettenprüfung an einer
  DEC mit `decision_type: verzicht`, `zielmarke:` und
  `phase: Pn` — mit **genau einer** Phase; für diese
  Marke entfallen der
  Pflicht-Stand der Phase und seine Lint-Pflichten
  (z.B. die SPEC-Pflicht bei P8). Der Verzicht auf die
  Betriebs-Anleitung gilt **je Umgebung**: die
  Verzichts-DEC mit `phase: P15` trägt zusätzlich
  `umgebung:` mit dem Namen der Umgebung aus der
  Entitäts-Fassade der Zielumgebungen (der Lint prüft
  den Namen wie bei DEPL), Schlüssel sind Marke, Phase
  und Umgebung; Lint und Kettenprüfung zählen die
  Betriebs-Anleitung dieser Umgebung dann nicht als
  Pflicht-Stand; `phase: P15` ohne `umgebung:` ist kein
  Verzicht, der Lint meldet einen Hinweis. `phase: P9` ist kein
  zulässiger Verzicht (der Tag markiert das Produkt in
  jedem Projekt, §Kette); eine solche DEC meldet der
  Lint als **Fehler**. Ohne diese Felder gilt kein
  Verzicht auf eine Phase; fehlt einer angenommenen
  Verzichts-DEC ein Feld, heilt eine ablösende DEC mit
  den Feldern den Mangel ([[Einfrieren-und-Abloesen]]
  §Ablösung). Eine Verzichts-DEC mit `zielmarke:` und
  ohne `phase:` ist kein Fehler: mit Prozess meldet
  der Lint sie als Hinweis (vermutlich fehlt
  `phase:`), ohne Prozess — es gibt keine Phasen — gar
  nicht; das ist die Form des Verzichts auf „Tests
  grün“ (§Kette, Projekt ohne Prozess), den der Lint
  nicht liest. Was ein Verzicht in der Kette bewirkt
  und welche Glieder ohne Verzicht fehlen dürfen:
  §Fehlende und vertretene Glieder.

**Deckung durch Delegation:** Eine FUNC des
Koordinators gilt als gedeckt, sobald sie in einem
freigegebenen Übergabe-Stand an eine Komponente steht;
die SPEC entsteht bei der Komponente.

**Selbsttragende Stände:** Die Abdeckung prüft der Lint
nur entlang der Felder oben; bei einem selbsttragenden
Stand (Doku-Glieder, §Kette) liest er die Quell-Stände
und den Testbericht aus `herkunft`
([[Einfrieren-und-Abloesen]] §Stand) und bei einem
Änderungsdokument die Vollfassung aus `basis:` (Form
wie im Feld „Verweise“ eines Freigabe-Eintrags,
[[Entscheidungen]] Meta „Freigabe-Einträge“). Ein
freigegebener Pflicht-Stand der Phasen P11–P13 —
Entwickler-Doku, Benutzer-Doku, Deploy-Stand — nennt den
Testbericht in `herkunft` (§Code-Glieder; fehlt er:
Hinweis); die Betriebs-Anleitung nennt den Deploy-Stand
ihrer Umgebung, ihre `marke` kommt aus ihm (fehlt er oder
gehört er zu einer anderen Umgebung: Hinweis; weicht die
Marke ab: Fehler). Die Präzisierung der Abdeckung in
§Regel betrifft die Reviewer-Seite.

## Reviewer-Anteil (Inhalt)

Widerspruch und Unbegründetes nach §Regel — eine neue
Sachaussage ist ein Befund, Darstellung nicht — prüft
ein Reviewer, dazu die Vollständigkeit der Abdeckung
gegen die Quell-Stände des Dokumenttyp-Eintrags (der
Lint prüft nur „mindestens einer“, §Lint-Anteil)
(Prüf-Modell ≠ Bau-Modell, MasterPrompt §5.6). Das
zweite Modell kommt zuerst über ein Werkzeug
(Peer-Agent, externes Modell; Wahl nach Vorgehen.md
§7b, dokumentiert in `Tools.md`); ohne Werkzeug gilt
der beim Init gewählte Ersatzweg aus `Tools.md` —
Ein-Modell-Weg mit Einschränkung „Prüf-Modell =
Bau-Modell“ im Freigabe-Eintrag oder Anwender als
Prüfer (`Reviewmuster.md` §2 Schleife 2, lesen vor
jeder Prüf-Beauftragung). Ergebnis
ist ein `review-report` ([[Katalog-review-report]]),
auf den die Freigabe des Stands zeigt; der Anwender
erhält ihn mit dem Stand, weil die Prüfung vor der
Vorlage läuft (§Regel). Nach einer Korrektur vor der
Freigabe prüft die neue Runde nur die geänderten
Elemente; ihr `review-report` nennt den der vorigen
Runde als Vorgänger (`Reviewmuster.md` §2 Schleife 4).
Die Freigabe
selbst wird als DEC gebucht ([[Entscheidungen]], Meta
„Freigabe-Einträge“).

## Code-Glieder

- **P9 → P10:** Tests grün **plus Code-Review** als
  Vorbedingung. Mit dem gesetzten Tag legt der Agent
  die Doku-Abfrage vor, wenn der Prozess Doku-Glieder
  führt (§Kette, Doku-Abfrage; mit SP-1 immer). Das
  Code-Review ist die Kettenprüfung
  des Glieds P9 nach §Regel: gegen alle freigegebenen
  Vorgänger der Marke, darunter die SPEC, wenn es sie
  gibt; eine eigene Regel für das Code-Review gibt es
  nicht (fehlt ein Glied: §Fehlende und vertretene
  Glieder). Ohne Code ist es die Kettenprüfung des
  Produkts (z.B. eines Schriftsatzes) gegen dieselben
  Vorgänger, und „Tests grün“ gilt dann nur für das
  automatisiert Prüfbare des Produkts — ohne solche
  Tests fällt dieser Nachweis aus der Regel heraus;
  bei Code bleiben beide Nachweise Pflicht. Angeboten
  wird nur die Werkzeug-Wahl — zweites Modell über ein
  Werkzeug, sonst der Ersatzweg aus `Tools.md`
  (§Reviewer-Anteil); ein
  Verzicht auf das Code-Review ist nur als
  Anwender-Entscheidung mit benanntem Impact möglich.
  Die Freigabe erfolgt per Tag im Repo, das das
  Produkt trägt (§Kette), und wird mit einem Prozess
  wie jede Freigabe als DEC gebucht (ohne Prozess:
  §Kette, Projekt ohne Prozess); an die Stelle der
  Stand-Version tritt der Tag-Name. Ausnahme: Freigaben
  im Nachtrag zu einer abgeschlossenen Marke — die
  Tag-Freigabe einer Tag-Korrektur nach dem
  Marken-Wechsel bei gleichem Inhalt steht als Formel
  im Nachtrag „Tag korrigiert“ am Marken-Eintrag, die
  Freigabe eines nachgetragenen Deploy-Stands und die
  eines Doku-Stands mit „später“ (§Kette, Doku-Abfrage)
  in deren Nachtragszeile — kein eigener Eintrag, keine
  Ablösung
  einer früheren Freigabe (§Kette, Tag-Korrektur mit
  Prozess nach dem Wechsel; [[Zielmarken]] §Meta,
  Nachtrag; [[Entscheidungen]] Meta „Freigabe-Einträge“,
  Ausnahme). Name, wer den Tag
  setzt und dass er nie verschoben wird: Vorgehen.md
  §4 „Freigabe per Tag“ — lesen vor dem ersten Tag.
- **P10 → P11, P12, P13:** ein Testbericht (TRES) zum
  Testplan-Stand; Nicht-Bestandenes erzeugt BUG mit der
  `marke` des Testberichts. **Der Testbericht ist
  Vorbedingung auch für Entwickler-Doku (P11) und
  Benutzer-Doku (P12)**, wie für den Deploy-Stand: Die
  Doku beschreibt das getestete Produkt der Marke;
  die Arbeit an ihr darf früher beginnen, die Freigabe
  nicht. Weist der Testbericht nicht bestandene oder
  blockierte Testfälle aus, legt der Agent die Freigabe
  eines Doku-Stands trotzdem vor; der Anwender
  entscheidet, und der Freigabe-Eintrag nennt die
  offenen BUG als Einschränkung — wie unten beim
  Deploy-Stand. Bei einer Komponente ohne eigene
  Zielumgebung ist ihr Testbericht Vorbedingung ihrer
  Entwickler-Doku (§Komponenten-Kette nach
  Übernahme-Art); über die Freigabe des Deploy-Stands
  trotz ihrer offenen BUG entscheidet der Koordinator
  (unten). Träger
  der Freigabe für P13 ist der Deploy-Stand je
  Zielumgebung (mit SP-1 der Dokumenttyp-Eintrag
  `Katalog-Deploy-Stand`; er wird gebildet, sobald eine
  Zielumgebung eingetragen ist — ohne Zielumgebung
  entfällt P13, §Fehlende und vertretene Glieder; ein
  Deploy-Stand, der nach dem Marken-Wechsel zu der
  abgeschlossenen Marke hinzukommt — für eine neue
  Umgebung oder für eine Umgebung, die anders
  ausgerollt wird —, wird mit seiner Freigabe als
  Nachtrag am Marken-Eintrag gebucht; je Umgebung kann
  eine Marke mehrere freigegebene Deploy-Stände haben —
  Eintrag oder Nachtrag, Versionen derselben Ketten-ID
  —, und es gilt der jüngste; erneutes Ausrollen ohne
  Änderung ist Betrieb ohne neuen Stand, [[Zielmarken]]
  §Meta, Nachtrag). Weist
  der Testbericht nicht bestandene oder blockierte
  Testfälle aus, legt der Agent die Freigabe für P13
  trotzdem vor — mit dem Testbericht und den offenen
  BUG; der Anwender entscheidet
  ([[Berichten-statt-Blockieren]]). Gibt er trotz
  offener BUG frei, nennt der Freigabe-Eintrag die
  offenen BUG als Einschränkung ([[Entscheidungen]]
  Meta „Freigabe-Einträge“); der Agent bietet dabei
  einen Fehlerstand an, der optional bleibt. Bei
  einer Komponente ohne eigenes P13 fällt diese
  Freigabe aus der Regel heraus (§Fehlende und
  vertretene Glieder): ihre offenen BUG bleiben im
  Register, der Testbericht in ihrem Abschluss-Stand
  weist sie aus, die Komponente nennt sie als
  Einschränkung im Freigabe-Eintrag ihrer
  Entwickler-Doku, und über P13 entscheidet der
  Koordinator, der die Deploy-Stände führt. Ebenso
  bei P13 ohne Zielumgebung (ebenda): die offenen BUG
  bleiben im Register und im Abschluss-Stand
  ausgewiesen; der Vollständigkeits-Scan legt sie beim
  Marken-Abschluss vor ([[Zielmarken]] §Meta
  „Marken-Wechsel-Prozedur“).

## Fehlende und vertretene Glieder

**Grundsatz:** Nennt eine Regel ein Glied, gilt sie
für das, was dieses Glied vertritt; fehlt das Glied,
fällt es aus der Regel heraus (§Regel). Dieser
Abschnitt ist der führende Ort aller Fälle; die Texte
einzelner Phasen und Dokumenttyp-Einträge verlinken
ihn und wiederholen keine Ausnahme. Arten des
Fehlens:

- **Verzicht** — der Anwender lässt eine Phase mit
  Pflicht-Stand für eine Marke bewusst aus; die
  Verzichts-DEC ist die Grundlage (Form: §Lint-Anteil
  und [[Entscheidungen]] Meta „Verzichts-Einträge“).
- **abgeleitet entfallen** — das Glied entfällt ohne
  eigene Entscheidung, weil ein Register-Inhalt es
  ergibt (z.B. §Komponenten der Architektur-Fassade).
- **vertreten durch** — ein anderes Glied oder
  Artefakt tritt an seine Stelle; Regeln, die das
  fehlende Glied nennen, gelten für den Vertreter.

| Glied | Wie es fehlt | Grundlage |
|---|---|---|
| jede Phase mit Pflicht-Stand, für eine Marke | **Verzicht:** Pflicht-Stand der Phase und seine Lint-Pflichten entfallen für diese Marke; die Freigabe-Ordnung geht über die Phase hinweg; spätere Glieder prüfen gegen die übrigen freigegebenen Vorgänger. Bei P8 bleibt der Verzicht dem Fall „baut, will aber keine SPEC“ vorbehalten (in kleinen Projekten darf P8 auch schmal bleiben). Bei den Doku-Gliedern P11 und P12 ist der Verzicht die Zeile „gar nicht (Verzicht)“ der Doku-Abfrage (§Kette). **Nicht verzichtbar ist der Tag (P9):** er markiert das Produkt in jedem Projekt (§Kette), und die Tag-Bedingung des Testplan-Stands gilt ohne Ausnahme (eine DEC mit `phase: P9` meldet der Lint, §Lint-Anteil) | Verzichts-DEC mit `decision_type: verzicht`, `zielmarke:` der Marke und `phase: Pn` (genau eine Phase) |
| P15 je Umgebung (Betriebs-Anleitung) | **Verzicht je Umgebung:** die Betriebs-Anleitung dieser Umgebung entfällt für die Marke, die der übrigen Umgebungen bleibt Pflicht; die Zeile „gar nicht (Verzicht)“ der Doku-Abfrage für diese Umgebung (§Kette). Ohne `umgebung:` ist die DEC kein Verzicht (§Lint-Anteil) | Verzichts-DEC mit `decision_type: verzicht`, `zielmarke:`, `phase: P15` und `umgebung:` (Name aus der Entitäts-Fassade der Zielumgebungen), je Umgebung eine |
| P11, P12, P15, für eine Marke | **Übernahme aus der Vormarke** — kein Fehlen: die Zeile „gar nicht (Übernahme)“ der Doku-Abfrage; der freigegebene Doku-Stand der Vormarke gilt weiter wie jeder übernommene Stand (§Kette, Übernahme aus der Vormarke) und steht im Abschluss-Stand mit „übernommen aus <Vormarke>“. Bei P15 nur, wenn die Marke keinen eigenen Tag hat — mit eigenem Tag ist die Betriebs-Anleitung der Vormarke für sie überholt, die Zeile hat die Wahl „gar nicht (Übernahme)“ nicht, es folgt die Folge-Version (§Kette, Folge-Marke mit eigenem Tag); bei P11 und P12 bleibt die Wahl auch mit eigenem Tag | Zeilen-DEC der Doku-Abfrage, die den übernommenen Stand nennt |
| P2 | **kein Glied:** mit SP-1 hat P2 keinen Pflicht-Stand (SP-1 `index.md` §3.2; ob eine Phase ein Glied trägt, legt die Phasentabelle des aktiven Prozesses fest) — bei Koordinator, Komponente und Standalone gleich; es gibt nichts zu vertreten | Dokumenttyp-Einträge des aktiven Prozesses |
| P14 | **kein Glied:** mit SP-1 hat P14 keinen Pflicht-Stand (wie P2) | Dokumenttyp-Einträge des aktiven Prozesses |
| P6 ohne Schnitt in Komponenten | **abgeleitet entfallen:** ohne Komponenten gibt es keine Übergabe (Standalone; Koordinator-Repo, dessen §Komponenten nur das eigene Repo führt) | §Komponenten der Architektur-Fassade; Dokumenttyp-Eintrag `uebergabe` (mit SP-1) |
| P7, P8 beim Koordinator | **abgeleitet entfallen,** wenn der Koordinator keine eigenen Bauteile hat — keine Verzichts-DEC nötig | §Komponenten der Architektur-Fassade: keine Zeile mit Lage im eigenen Repo (§Freigabe-Ordnung des Koordinators) |
| P9 (Tag) beim Koordinator ohne eigene Bauteile | **vertreten durch** die gebuchten Lieferungen aller Komponenten der Marke; die Tag-Bedingung des Testplan-Stands gilt für die Lieferungen. Wo ein Dokumenttyp-Eintrag „den Tag der Implementierung“ in `herkunft` verlangt (Testplan-Stand, Testbericht, Deploy-Stand), stehen dort die Lieferungs-Tags als `<repo>/<tag>` ([[Einfrieren-und-Abloesen]] §Stand). Ein Zwischen-Koordinator ohne eigene Bauteile liefert nach oben an Stelle des Tags den Verweis auf seine Zielmarken-Fassade (§Komponenten-Kette nach Übernahme-Art, Zwischen-Koordinator) | Abschnitt „Zuliefernde Komponenten“ am Marken-Eintrag ([[Zielmarken]]), gespeist aus den Lieferungs-Nachrichten ([[Katalog-message]]) |
| P11, P12 beim Koordinator ohne eigene Bauteile | **kein Fehlen:** Gesamtsicht der Entwickler-Doku (P11) und Benutzer-Doku (P12) bleiben seine Glieder — sie beschreiben das Gesamtsystem; Vorbedingung ist sein Testbericht über die Lieferungen (§Freigabe-Ordnung des Koordinators). Die Gesamtsicht nimmt die Entwickler-Doku der Komponenten auf (§Komponenten-Kette nach Übernahme-Art) | Dokumenttyp-Einträge der Doku-Stände (mit SP-1) |
| P1 der Komponente (Übernahme-Art selbstständig) | **vertreten durch** den freigegebenen Übergabe-Stand des Koordinators (er ersetzt den Konzept-Stand); Pflicht-Stände ab P3. Als Quell-Stand eines Doku-Glieds der Komponente tritt der Übergabe-Stand an die Stelle des Konzept-Stands | Übergabe-Stand (Wurzel der Kette, §Komponenten-Kette nach Übernahme-Art) |
| P1–P4 der Komponente (Übernahme-Art Auftrag) | **vertreten durch** den freigegebenen Übergabe-Stand — einschließlich des P4-Glieds der CON, in denen die Komponente Provider ist; Pflicht-Stände ab P5. Als Quell-Stand eines Doku-Glieds der Komponente tritt er an die Stelle von Konzept, Anforderungen und Funktionsbeschreibung. Ein neuer CON oder eine Änderung über den Übergabe-Stand hinaus ist ein Rücklauf an den Koordinator | Übergabe-Stand (§Komponenten-Kette nach Übernahme-Art) |
| P6 der Komponente | **abgeleitet entfallen,** wenn die Komponente nicht weiter zerlegt wird | §Komponenten der Komponente: keine weiteren Komponenten |
| P12, P13, P15 der Komponente | **abgeleitet entfallen:** Benutzer-Doku (P12), Deploy-Stände und DEPL (P13) und Betriebs-Anleitungen (P15) führt der Koordinator — bzw. das Standalone-Projekt, das Koordinator mit einem Bauteil ist — mit dem Gesamt-Deploy für alle Komponenten seiner §Komponenten-Zeilen, bei einem Zwischen-Koordinator für ihn und seine Komponenten (§Komponenten-Kette nach Übernahme-Art, Zwischen-Koordinator); die Kette der Komponente endet mit P11, der Entwickler-Doku für ihr Bauteil „für P13 Ausliefern“, die die Gesamtsicht des Koordinators aufnimmt (offene BUG aus ihrem Testbericht: §Code-Glieder). **Ausnahme:** eine Komponente mit eigener Zielumgebung (unabhängig ausgeliefert) führt wie ein Standalone-Projekt die Benutzer-Doku (P12), P13 mit ihren DEPL und die Betriebs-Anleitung ihrer Umgebung (P15) selbst — wer unabhängig ausliefert, hat eigene Benutzer und betreibt, was er ausliefert; ihre Doku-Abfrage hat alle Zeilen (§Kette), „gar nicht“ bleibt je Marke möglich | Entitäts-Fassade der Zielumgebungen und §Komponenten (§Komponenten-Kette nach Übernahme-Art) |
| P13, P15 ohne Zielumgebung | **abgeleitet entfallen:** Deploy-Stände und Betriebs-Anleitungen gibt es je Zielumgebung; führt das Repo, das P13 trägt, keine Zielumgebung, gibt es keinen Deploy-Stand, keine DEPL-Pflicht und keine Betriebs-Anleitung | Entitäts-Fassade der Zielumgebungen (mit SP-1): kein Eintrag |

Für jedes dieser Glieder gilt: Fehlt es auf eine
dieser Arten oder gibt es das Glied nicht (P2), löst
sein Fehlen keine Warnung der Freigabe-Ordnung aus
(§Kette); fehlt es auf andere Weise, warnt der Agent.
Welche Glieder eine Komponente führt, listet ihr
Abschluss-Stand ([[Katalog-Abschluss-Stand]]).

## Freigabe-Ordnung des Koordinators

Bei einem Schnitt in Komponenten gilt für den
Koordinator:

- **Eigenes Bauteil** ist jede Zeile in §Komponenten
  der Architektur-Fassade, deren Lage das eigene Repo
  ist — in einem Standalone-Projekt die eine
  Komponente; beim Koordinator auch eigener Code wie
  System-CI, Integrationstests oder
  Deployment-Automatisierung, den er als solche Zeile
  führt. Für jedes eigene Bauteil sind die Glieder
  P7–P9 Pflicht wie in jeder Kette.
- **Ohne eigene Bauteile** fehlen P7, P8 und P9 auf
  die in §Fehlende und vertretene Glieder genannte
  Weise (P9 vertreten durch die Lieferungen: eine
  Lieferung ist der Tag der Komponente, als Nachricht
  gemeldet — [[Katalog-message]] — und am
  Marken-Eintrag gebucht; welche Komponenten zur
  Marke erwartet werden und wo die Lieferung steht:
  [[Zielmarken]] Abschnitt „Zuliefernde Komponenten“;
  Meldepflicht der Komponente: Vorgehen.md §3a).
- **Vorbedingung des Testplan-Stands (P10):** der
  eigene Tag (falls eigene Bauteile) **und** alle
  Lieferungen — übernommene Lieferungen unveränderter
  Komponenten eingeschlossen (§Kette, Übernahme des
  Tags und der Lieferung). Den Integrationstest des
  Gesamtsystems führt der Koordinator;
  Teil-Integrationstests sind Arbeit, keine Freigabe.
- **P13 und die DEPL** liegen beim Koordinator mit
  dem Gesamt-Deploy für alle Komponenten seiner
  §Komponenten-Zeilen (Deploy-Stände je Zielumgebung),
  auch für einen Zwischen-Koordinator und dessen
  Komponenten; die Ausnahme der Komponente mit eigener
  Zielumgebung steht in §Fehlende und vertretene
  Glieder.
- **Doku-Glieder:** Die **Gesamtsicht der
  Entwickler-Doku** (P11), die **Benutzer-Doku** (P12)
  und die **Betriebs-Anleitungen** je Zielumgebung
  (P15) liegen beim Koordinator — auch ohne eigene
  Bauteile; Vorbedingung von P11 und P12 ist sein
  Testbericht über die Lieferungen (§Code-Glieder). Die
  Gesamtsicht nimmt die Entwickler-Doku jeder
  Komponente auf — als Kopie der ausgelieferten Datei
  oder als Anhang, selbsttragend, kein Verweis auf eine
  Datei im Komponenten-Repo (MasterPrompt §9.6) —,
  auch die einer Komponente mit eigener Zielumgebung;
  die Entwickler-Doku-Stände der Komponenten sind
  Quell-Stände der Gesamtsicht (SP-1
  `Katalog-Entwickler-Doku.md`). Fehlt die
  Entwickler-Doku einer Komponente („später“ oder
  Verzicht in ihrer Doku-Abfrage), legt der
  Koordinator die Gesamtsicht trotzdem vor und weist
  die Lücke aus; der Freigabe-Eintrag nennt sie als
  Einschränkung „Teil-Doku <Komponente> fehlt“
  ([[Entscheidungen]] Meta „Freigabe-Einträge“; wie
  bei offenen BUG einer Komponente, §Code-Glieder).
  Wird die Teil-Doku nachgeholt, legt der Koordinator
  in seiner Doku-Abfrage dafür eine Zeile für die
  Gesamtsicht vor (neue Version oder
  Änderungsdokument) — eine Nachfrage wie bei einer
  später hinzukommenden Umgebung (§Kette).
  In seiner Doku-Abfrage stehen alle Zeilen (§Kette).

Was die Herkunftszeile des Testberichts (TRES) beim
Koordinator trägt: [[Einfrieren-und-Abloesen]] §Stand.
Wie die Kette einer Komponente beginnt und wogegen
sie prüft: §Komponenten-Kette nach Übernahme-Art.

## Komponenten-Kette nach Übernahme-Art

Eine Komponente hat ihre eigene Kette. Ihre **Wurzel**
ist der freigegebene Übergabe-Stand des Koordinators
an diese Komponente (Pflicht-Stand der Phase P6 beim
Koordinator). Welche Glieder er in der Kette der
Komponente vertritt, hängt von der Übernahme-Art ab
(die Arten und ihre Wahl: Vorgehen.md §3; die Glieder
je Art: §Fehlende und vertretene Glieder):

- **selbstständig:** Pflicht-Stände ab P3; die
  Komponente legt eigene REQ an, je mit
  `abgeleitet_von:` auf die FUNC des Koordinators
  (`<koordinator>/FUNC-NNN`).
- **Auftrag:** Pflicht-Stände ab P5.

In beiden Arten wird P5 Architektur nicht vom
Übergabe-Stand vertreten: die Komponente führt den
Architektur-Stand selbst (er darf dünn sein) oder
verzichtet darauf wie auf jede Phase mit Pflicht-Stand
per Verzichts-DEC je Marke (§Fehlende und vertretene
Glieder) — etwa eine kleine Komponente ohne eigene
Zerlegung. Wann eine FUNC des Koordinators durch die
Übergabe als gedeckt gilt: §Lint-Anteil (Deckung durch
Delegation).

**Ende der Kette.** Die Komponente führt ihre Kette
bis P11: Nach ihrem Tag (der Lieferung an den
Koordinator, Vorgehen.md §3a) bildet sie einen
Testplan-Stand, belegt den Durchgang mit einem
Testbericht (§Code-Glieder) und bildet die
**Entwickler-Doku für ihr Bauteil** (P11); deren
Freigabe trägt den Zweck „für P13 Ausliefern“ — die
Lieferung an den, der P13 führt —, ihr Testbericht ist
deren Vorbedingung, und offene BUG stehen als
Einschränkung im Freigabe-Eintrag. In ihrer
Doku-Abfrage steht deshalb nur die Zeile
Entwickler-Doku (§Kette). Benutzer-Doku (P12), P13 mit
den DEPL und Betriebs-Anleitungen (P15) liegen beim
Koordinator, der die Entwickler-Doku der Komponente in
seine Gesamtsicht aufnimmt (§Freigabe-Ordnung des
Koordinators); nur eine Komponente mit eigener
Zielumgebung führt P12, P13 und P15 selbst (§Fehlende
und vertretene Glieder). Ihr Abschluss-Stand listet die
Glieder, die sie führt, und geht mit dem
Marken-Abschluss an den Koordinator
([[Katalog-Abschluss-Stand]]).

**Zwischen-Koordinator** (dieser Absatz ist der
führende Ort der Regel). Zerlegt eine Komponente
weiter — ihr Marken-Eintrag trägt `fuer_marke:`, und
ihr §Komponenten führt mindestens eine
**Unter-Komponente**: eine Zeile, für die ihr Repo
einen Übergabe-Stand gebildet hat (P6, Übergabe je
Komponente) —, ist sie **Komponente und Koordinator**
zugleich. Die Zeile des Koordinators und die bekannten
Nachbarn haben keinen solchen Übergabe-Stand und
zählen nicht; ebenso wenig ihr eigenes Bauteil (die
Zeile mit Lage im eigenen Repo, §Freigabe-Ordnung des
Koordinators) — eine Komponente mit Nachbar-Zeilen
oder eigenem Bauteil allein bleibt Komponente. Ihre
Kette führt P1–P4 wie eine Komponente (der
Übergabe-Stand vertritt sie je Übernahme-Art, oben),
P5–P6 und die Prüfung der Lieferungen ihrer
Unter-Komponenten wie ein Koordinator
(§Freigabe-Ordnung des Koordinators); P7–P9 richten
sich wie beim Koordinator nach eigenen Bauteilen —
ohne eigene Bauteile entfallen P7 und P8 abgeleitet,
und die Lieferungen vertreten ihr Glied P9 (§Fehlende
und vertretene Glieder). Ihre Kette endet mit P11: Sie
führt für ihren Teilbaum die Entwickler-Doku wie eine
Komponente — ihre Gesamtsicht nimmt die
Entwickler-Doku ihrer Unter-Komponenten auf —;
Benutzer-Doku (P12), P13 und die DEPL sowie die
Betriebs-Anleitungen (P15) für sie und ihre
Unter-Komponenten führt der übergeordnete Koordinator
mit dem Gesamt-Deploy — außer bei eigener Zielumgebung:
dann führt sie P12, P13 und die DEPL sowie P15 für
sich und ihre Unter-Komponenten selbst (ihr Teilbaum).
**DEPL der Unter-Komponenten:** Beim übergeordneten
Koordinator stehen die Unter-Komponenten nicht als
eigene Zeilen in §Komponenten (sie würden sonst zu
erwarteten Lieferantinnen); er bucht ihre DEPL unter
der Zeile des Zwischen-Koordinators (`komponente:` =
dessen Name in seiner §Komponenten) und nennt die
Unter-Komponente im Kurzsatz des Eintrags als „<Name>
aus <repo>“ (ohne `/`; der Kurzsatz ist zugleich der
Dateiname des Detail-Knotens, mit SP-1
`Katalog-Deployments.md`). Die Abdeckung prüft der Lint weiter
je Zeile (§Lint-Anteil). Mit eigener Zielumgebung
führt der Zwischen-Koordinator die DEPL für sich und
seine Unter-Komponenten in seinem Teilbaum; dort sind
sie Zeilen seiner §Komponenten (mit SP-1:
Register-Fassade der Deployments, §Meta „Wer führt
die DEPL“).
**Lieferung nach oben:** mit eigenen Bauteilen ist ihr
Tag die Lieferung wie bei jeder Komponente (P9 ist
nicht vertreten) und steht beim übergeordneten
Koordinator allein in `herkunft`. Ohne eigene Bauteile
liefert sie eine Nachricht mit qualifiziertem Verweis
auf ihre Zielmarken-Fassade — `<repo>/Zielmarken` mit
der Bezeichnung der Marke im Text, kein Anker —, deren
Tabelle „Zuliefernde Komponenten“ die Lieferungs-Tags
trägt; sie liefert, sobald alle Lieferungen ihrer
Unter-Komponenten gebucht sind, vor ihrem
Testplan-Stand (wie eine Komponente nach ihrem Tag).
Der übergeordnete Koordinator bucht diesen Verweis als
Gegenstand (Format: [[Zielmarken]]); er dient der
Buchung und ist bis zum Marken-Abschluss des
Zwischen-Koordinators ein Lesehinweis. Im Fall des
Verweises gilt: Wo ein Dokumenttyp-Eintrag beim
übergeordneten Koordinator die Lieferungs-Tags in
`herkunft` verlangt (Testplan-Stand, Testbericht,
Deploy-Stand), stehen dort die Tags der
Unter-Komponenten als `<repo>/<tag>`, aus der Tabelle
des Zwischen-Koordinators gelesen (ihre Lage steht in
seinem §Komponenten) — nicht der Verweis
([[Einfrieren-und-Abloesen]] §Stand). In der
Folge-Marke gilt seine Lieferung weiter, wenn alle
seine Lieferungen übernommen sind (§Kette, Übernahme
des Tags und der Lieferung): er meldet das mit seinem
Marken-Abschluss, der übergeordnete Koordinator bucht
den Verweis wie einen übernommenen Tag mit dem Zusatz
„übernommen aus <Vormarke>“ ([[Zielmarken]]).

**Vorgänger beim Koordinator.** Die Komponente prüft
gegen den Übergabe-Stand und ihre eigenen Vorgänger,
nicht erneut gegen die Stände P1–P5 des Koordinators.
Verweist ein Stand der Komponente auf ein
eingefrorenes Element des Koordinators
(`<koordinator>/FUNC-NNN`, `<koordinator>/CON-NNN`),
ist dieses Element Vorgänger in der Prüfung
(Widerspruch, §Regel). Für einen Contract ist das die
**Consumer-Prüfung**; ihre Reihenfolge-Regel (ein
Consumer-Stand wird erst freigegeben, wenn der CON
beim Koordinator gebucht ist) und die Rollen eines CON
je Phase stehen mit SP-1 im Katalog-Eintrag
`contract`, Abschnitt „Rollen eines CON in der
Kette“. Ohne Lesezugriff auf den Koordinator meldet der
Lint einen Hinweis, keinen Fehler.

**Rücklauf.** Wird der Übergabe-Stand überholt
([[Einfrieren-und-Abloesen]] §Überholt-Regel), meldet
der Koordinator das der Komponente per Nachricht
(Lese-Hinweis `art: ruecklauf`; was der Rücklauf vom
Empfänger erwartet: [[Katalog-message]], Eintrag
`message`, Punkt `art`);
die Stände der Komponente, die auf ihn verweisen, sind
damit überholt.

## Abgrenzung zu den Wächtern

**Kettenprüfung ist kein Wächter**, sondern
Vorbedingung einer Freigabe. Die Arbeit wird nie
gesperrt; die Freigabe eines Pflicht-Stands setzt die
Kettenprüfung voraus (Ausnahme „Freigabe mit
Vorbedingung“ in [[Berichten-statt-Blockieren]]).

- **T2 Meilenstein-Wechsel** läuft **nach** der
  Freigabe eines Pflicht-Stands (die Freigabe ist der
  Meilenstein) und prüft Register und Zustände; er
  prüft nicht die Kette.
- **T4 Freigabe-Bezugsprüfung** (Vorgehen.md §5) läuft
  **während** der Arbeit, wenn sich ein Artefakt auf
  ein Artefakt einer anderen Phase bezieht, und fragt,
  ob die Grundlage für den Zweck freigegeben ist; sie
  ersetzt die Kettenprüfung nicht. Das Anlegen eines
  Elements löst T4 nicht aus, auch nicht im Vorgriff
  auf eine spätere Phase: die Phase ist kein Merkmal
  eines Elements (§Kette).
- Mechanische Prüfungen stehen genau einmal im
  Lint-Kern; Wächter rufen sie zu ihren Anlässen auf
  und melden („Lint erkennt, Wächter melden“).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Freeze, Ablösung, Stand, Überholt-Regel:
  [[Einfrieren-und-Abloesen]]
- Ablauf eines Stands, Lage der Prüfung darin:
  [[Lebenslauf-eines-Stands]]
- Glieder je Prozess: Dokumenttyp-Einträge im
  [[Katalog]]; Phasen und Übernahme-Arten: Vorgehen.md
  §3
- Freigabe-Formel: Vorgehen.md §4; Buchung der
  Freigabe: [[Entscheidungen]] (Meta);
  Review-Kette und Prüfer-Modell: MasterPrompt §5.6,
  [[Angebots-und-Beauftragungs-Muster]]
- Abschluss-Stand ([[Katalog-Abschluss-Stand]]),
  Lieferungen am Marken-Eintrag:
  [[Zielmarken]]; Lieferung und Rücklauf als
  Nachricht: [[Katalog-message]], Vorgehen.md §3a
- Wächter-Anlässe: MasterPrompt §5.4
  „Wächter-Trigger“ (Basis-Anlässe und Verweis auf
  die prozess-eigenen), Vorgehen.md §5 (T4)
