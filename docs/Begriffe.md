# Begriffe

> **Herkunft:** abgeleitet aus dem vorbereiteten
> `../wiki/` (`Glossar.md` mit den mitgelieferten
> Einträgen, `Kettenpruefung.md`,
> `Katalog-Abschluss-Stand.md`,
> `Two-Repo-Submodul-Muster.md`, `Zielmarken.md`,
> `Marken-RP-1.md`, `Fehlermeldungen.md`,
> `Anforderungen.md`, `Katalog-Deploy-Stand.md`,
> `Katalog-Deployments.md`, `Katalog-Fehlerstand.md`,
> `Katalog-Entwickler-Doku.md`, `Katalog-Benutzer-Doku.md`,
> `Katalog-Betriebs-Anleitung.md`,
> `Meilenstein-und-T2.md`, `Katalog-Release-Notes.md`,
> `Init-Choreografie.md`, `Lebenslauf-eines-Stands.md`,
> `Einfrieren-und-Abloesen.md`), `../MasterPrompt.md`,
> `../Wiki.md`, `../Vorgehen.md`, `../Reviewmuster.md`
> (Muster M6),
> `../Outgoing.md`, `../README.md`, `../INIT.md`,
> `../migration/MIGRATION.md`, `../upgrade/UPGRADE.md`
> und
> `../referenzprozesse/SP-1-Standardprozess/index.md`
> (Rollen). Stand der Quellen: Starter-Commit `3a32dbd`
> (Version 2.1). Dieses Dokument ist aus den Quellen
> abgeleitet und wird bei Änderungen der Quellen auf
> deren Stand nachgezogen (zuletzt am 2026-11-03);
> eigene Inhalte bekommt es nicht — Änderungen gehören
> in die Quellen.

Zurück zur [Einführung](Einfuehrung.md).

Die wichtigsten Wörter dieser Erklärung in je ein bis
zwei Sätzen. Die verbindlichen Definitionen der
Regelwerks-Begriffe stehen im mitgelieferten Glossar
`../wiki/Glossar.md`; in deinem Projekt wächst dieses
Glossar über den Review-Prozess weiter.

**Ableitungs-Regel.** Im Zwei-Repo-Fall der
Regel-Knoten je Produkt-Repo, der den Übergang vom
Arbeits-Repo ins Produkt festlegt: Quelle, Ziel,
Auslöser, Transformation, Ausschlüsse, Freigabe und
Rück-Sync-Verbot.

**Abschluss-Stand.** Der Stand, mit dem eine Marke
abschließt: die Liste ihrer freigegebenen Stände mit
Version und Freigabe — einschließlich der Doku-Stände
—, der Tag ihres Produkts und das, was unverändert aus
der Vormarke übernommen ist. Du
gibst ihn im Marken-Wechsel frei; abgeschlossen ist die
Marke erst mit dem Wechsel.

**Änderungsdokument, Einarbeitung, komplett neu.** Die
drei Formen, in denen ein Doku-Stand zu einer Marke
entsteht — gewählt in der Doku-Abfrage. Ein
Änderungsdokument benennt nur die Änderungen gegenüber
der letzten Vollfassung, die es im Kopf als Basis
nennt, und ist kumulativ (Vollfassung plus ein
Änderungsdokument genügen immer); eine Einarbeitung ist
eine neue Vollfassung mit neu erzeugten geänderten und
unverändert übernommenen übrigen Kapiteln; komplett neu
ist eine vollständig neu erzeugte Vollfassung. In jeder
Form stammt jeder Text aus dem Wiki bzw. den
Quell-Ständen, und die Prüfung geht über das ganze
Dokument.

**Agent (KI-Agent).** Das KI-Werkzeug, das im
Projektordner arbeitet — Dateien liest und schreibt,
git bedient, Unteragenten startet. Der Starter legt
sich auf keinen Hersteller fest.

**Alias.** Die alte Kennung eines Elements, das beim
Upgrade umbenannt wurde (etwa die frühere
Spezifikations-Kennung einer Funktionsbeschreibung);
der Lint löst Verweise auf die alte Kennung darüber
auf.

**Allgemeine Vorlage.** Die Projektvorlage, aus der
dieser Starter abgeleitet ist; sie bringt keinen
Prozess mit, sondern bietet ihn beim Start an. Ein
Projekt aus ihr hebt sich mit der Anleitung dieses
Starters auf deren neuen Stand, nicht auf den Starter.
Ob dein Projekt aus ihr stammt, steht in der Zeile
`Quelle` seines Herkunfts-Vermerks; fehlt der Vermerk
(Stand 1.0), fragt der Agent dich nach der Vorlage.

**Ampel.** Das Gesamturteil eines Prüfers über ein
Artefakt: grün, gelb oder rot. Freigaben nach einem
Umbau-Review nur bei grün.

**Anbindungs-Modus.** Wie der Starter ins Projekt kommt:
als eingefrorene Kopie (Einmal-Kopie) oder als
verknüpfte Vorlage (git-Submodul), beide unter
`_template/`. Nicht zu verwechseln mit der
Übernahme-Art einer Komponente.

**Annahme.** Dein OK zu einem einzelnen Eintrag („ja,
so“); damit friert er ein. Einträge der beschreibenden
Register werden einzeln angenommen, wenn andere Arbeit
darauf baut, oder gesammelt mit der Freigabe des ersten
Stands, der sie verweist. Getrennt davon ist die
Freigabe: sie gibt es nur am Stand und nur für einen
Zweck.

**Arbeitsmodus.** Betriebsart des Agenten für große
Mengen: keine Rückfragen, Unklarheiten werden in
`Offene Fragen.md` gesammelt und am Ende vorgelegt.
Die Transformation einer Migration läuft ähnlich:
autonom bis zur Vorlage der Ergebnisse in der
Absicherung — deine Prüfung und die Gesamt-Annahme
brauchen dich —, Ungeklärtes sammelt die Auffang-Datei
`wiki/Migrations-Grundlagen.md`.

**Aufnahme-Commit.** Der angekündigte, nicht erfragte
Commit beim Projektstart und bei der Migration, der
Einbindung, kopierte Starter-Dateien und
Herkunfts-Vermerk ins Repo nimmt — und nur, was du
freigegeben hast.

**Bearbeitungsstand.** Die Pflegezeile einer Fassade
oder eines Regel-Dokuments: Datum der letzten Pflege.
Kein Stand im Sinne eines eingefrorenen Dokuments.

**Benutzer-Doku.** Der selbsttragende Pflicht-Stand
der Phase P12 Dokumentieren für Benutzer, freigegeben
„für P13 Ausliefern“: aus Konzept, Anforderungen,
Funktionsbeschreibung und Tag ausformuliert, so dass
ein Fremder das Produkt ohne Hilfe benutzen kann. Die
Benutzer sind die Leser des Produkts — nicht du als
Anwender, der mit dem Agenten arbeitet.

**Bestand, Bestandsschutz.** Elemente, die eine
Migration aus dem Vorgefundenen übernimmt oder die vor
einem Upgrade entstanden sind: ohne Marke und
Anlage-Datum, gültig ab ihrer Annahme; der Lint meldet
Fehlendes als Hinweis, nachgetragen wird nichts.
Altknoten und alte Vermerke bleiben lesbar; Freigaben
und Verzichte aus der Zeit vor einem Anheben behalten
ihre alten Phasennummern (siehe Herkunfts-Vermerk).

**Betriebs-Anleitung.** Der selbsttragende
Pflicht-Stand der Phase P15 Betreiben, je Zielumgebung,
freigegeben „für P15 Betreiben“: aus dem freigegebenen
Deploy-Stand der Umgebung ausformuliert, so dass ein
Fremder das Produkt dort ausführen kann; wird erst nach
dem Deploy-Stand ihrer Umgebung freigegeben. Nicht
„Betriebs-Handbuch“ oder „Betriebs-Plan“.

**Contract.** Eine zwischen Komponenten eines Systems
vereinbarte Schnittstelle, vom Provider verantwortet
und im Contract-Index des Koordinators geführt.

**Delta-Nachzug.** Der Schritt des Upgrades, in dem
der Agent jede Datei, die es im Projekt und im neuen
Stand gibt, vergleicht und Übernahmen als Vorschlag
vorlegt; eine bestehende Datei ändert sich nie
automatisch.

**Deploy-Stand.** Der Stand der Phase P13 Ausliefern
je Zielumgebung, gebildet aus den
Deployment-Festlegungen und freigegeben für die
Auslieferung in diese Umgebung; zu einer Marke kann es
mehrere geben, je Umgebung gilt der jüngste. Sein
freigegebener Stand ist Quell-Stand und Vorbedingung
der Betriebs-Anleitung seiner Umgebung.

**Detail-Knoten.** Eine Wiki-Datei je Wissensobjekt
(Anforderung, Entscheidung, Dokument, Person). Für
Inhalt maßgeblich; der Status steht in der Fassade.

**Einmal-Anweisung (Bootstrap).** Die Anweisung je
Fassade, die der Agent beim Aktivieren der Fassade
einmal abarbeitet — etwa die Fragen, mit denen Mission
Statement und Facts gefüllt werden. Sie liegt im
Starter unter `referenzprozesse/<Prozess>/bootstrap/`,
wird von dort gelesen und nie ins Projekt kopiert.

**Doku-Abfrage.** Die Vorlage des Agenten einmal je
Marke, sobald der Tag der Implementierung gesetzt ist:
je Doku-Art (Entwickler-Doku, Benutzer-Doku,
Betriebs-Anleitung je Umgebung) der Zeitpunkt — jetzt,
später, gar nicht als Übernahme oder Verzicht — und die
Form — Änderungsdokument, Einarbeitung, komplett neu —
mit Empfehlung; je Zeile eine Entscheidung.

**Doku-Stand.** Einer der drei selbsttragenden
Pflicht-Stände der Kette: Entwickler-Doku,
Benutzer-Doku, Betriebs-Anleitung. Ein Pflicht-Stand wie
jeder andere; abweichend sind nur der Grad, der Anlass
(die Doku-Abfrage) und der Verständnis-Check als
Pflicht.

**Element und Nachweis.** Register-Einträge sind
Elemente (ablösbar, gehen in Stände ein — Entscheidung,
Anforderung) oder Nachweise (werden nie abgelöst —
Bericht, Recherche, Nachricht, Dokument).

**Entscheidung, Entscheidungs-Register.** Eine
festgelegte Projekt-Wahrheit mit Wahl, Begründung und
verworfenen Alternativen. Sie kommt erst mit deinem OK
ins Register `wiki/Entscheidungen.md`, ist ab dann
eingefroren und wird nur durch eine neue Entscheidung
abgelöst. Auch Freigaben, Verzichte und die Zeilen der
Doku-Abfrage werden so gebucht.

**Entwickler-Doku.** Mit SP-1 der selbsttragende
Pflicht-Stand der Phase P11 Dokumentieren für
Entwickler, freigegeben „für P13 Ausliefern“: aus
Architektur, Technologie-Entscheidungen, Spezifikation
und Tag ausformuliert, so dass ein Fremder das Produkt
ohne Rückfrage ändern kann. Eine Komponente bildet sie
für ihr Bauteil, der Koordinator die Gesamtsicht, die
die Teil-Dokus aufnimmt.

**Erledigt / Aktion / Frage.** Das feste Raster jeder
strukturierten Meldung des Agenten: was getan ist, was
er als Nächstes tut, wenn du nicht widersprichst, und
was er von dir braucht.

**Ersatzweg.** Die Prüf-Variante für den Fall, dass
kein Werkzeug ein zweites KI-Modell bereitstellt:
dasselbe Modell in frischem Kontext (mit sichtbarer
Einschränkung in der Freigabe) oder du als Prüfer.
Gewählt beim Projektstart, im Fragen-Block der
Migration oder beim Upgrade; steht in `Tools.md`.

**Erweiterung.** Ein Zusatz-Werkzeug des Agenten — je
nach Agent MCP-Server (angebundener Werkzeug-Dienst),
Skill, Regel oder Workflow genannt; installiert nur
nach deiner Zustimmung, verzeichnet in `Tools.md`.

**Fassade.** Ein Übersichts-Knoten im Wiki, am Stück
lesbar, je Thema genau einer; beschreibt sich in
`## Meta` selbst. Register-Fassaden führen Einträge mit
Kennung.

**FassadenLandkarte.** Die Fassade `wiki/Fassaden.md`:
welche Fassaden es gibt, wozu, und ob sie aktiv sind.
Im Starter vorbelegt.

**Fehlermeldung (BUG).** Die Meldung, dass ein
existierender Produkt-Stand sich falsch verhält — aus
dem Betrieb oder aus einem Test. Sie trägt die Marke
des Produkt-Stands, an dem der Fehler beobachtet wurde
(die „Marke der Meldung“), nie die Marke einer Arbeit,
in der er nicht beobachtet wurde; über die Behebung
wird getrennt entschieden — eine Fix-Anforderung mit
eigener Marke, die nicht vor der Marke der Meldung
liegt. Eine Meldung, die allein über Fix-Anforderungen
auf einen Deploy behoben wird, ist abgeschlossen, wenn
du die Behebung bestätigst.

**Fix-Anforderung.** Der Auftrag, eine Fehlermeldung zu
beheben — eine Anforderung im Abschnitt
Fehlerbehebungen mit der Marke der Behebung, getrennt
von der Meldung. Liegt der Fehler im Produkt, führt sie
in die nächste Marke; liegt er in der Auslieferung, ist
sie eine Fix-Anforderung auf einen Deploy: ihre
Umsetzung ist ein weiterer Deploy-Stand derselben
Umgebung, sie trägt die Marke des ausgelieferten
Produkts, ist mit der Freigabe des Stands umgesetzt und
nennt den freigegebenen Stand als angehängten Vermerk;
in Release-Notes erscheint ein so behobener Fehler
nicht. Abgeschlossen sind Meldung und Fix-Anforderung
zusammen, wenn du bestätigst, dass der Fehler behoben
ist; wann der Agent danach fragt, legst du bei der
Freigabe des Stands fest.

**Freigabe.** Die Erklärung, dass ein Stand für einen
bestimmten Zweck verlässlich ist — gebucht als
Entscheidung in der Formel „Stand x von ⟨Artefakt⟩,
freigegeben für Zweck Z“. Eine Freigabe hängt immer an
einem Stand, nie an einem einzelnen Eintrag und nie an
der lebenden Fassade; mit ihr frieren die verwiesenen
Einträge ein. Einzige Freigabe ohne Stand ist der Tag.
Wird nie zurückgenommen; eine
Änderung ergibt einen neuen Stand mit neuer Freigabe.
Eine Freigabe, die nach dem Marken-Wechsel zu einer
abgeschlossenen Marke gehört (ein nachgetragener
Deploy-Stand, eine Tag-Korrektur, ein Doku-Stand mit
„später“), steht als Nachtrag
an der Marke statt als eigener Eintrag und ist kein
Meilenstein. Daneben in engerem Sinn: die **Freigabe
eines Ordners** — die als Entscheidung gebuchte
Erlaubnis, einen zusätzlichen Ordner im Projekt zu
führen; die Ordner des Software-Prozesses gelten mit
seiner Deklaration als freigegeben.

**Glied.** Ein Pflicht-Stand der Kette einer Marke
(oder der Tag der Implementierung als Glied P9).
Welche Phasen Glieder tragen, legt der Prozess fest.

**Grundsätze.** Die drei Leitsätze, nach denen der
Agent bei Projektstart, Migration und Upgrade
entscheidet, wo die Anleitung einen Fall nicht nennt:
nichts geht verloren, alles wird einsortiert, im
Zweifel fragt er dich.

**Herkunfts-Vermerk.** Abschnitt „Herkunft“ im Knoten
`wiki/Aktivierter-Prozess.md`: mit welchem Stand der
Vorlage das Projekt angelegt, migriert oder angehoben
wurde und seit welchem Datum (Zeile „Template-Stand:
2.1 seit JJJJ-MM-TT“), dazu Quelle, Anbindungs-Modus,
Prozess, Rolle und Übernahme-Art des Repos. Das Datum
ist der Stichtag, ab dem neue Pflichten des Lints als
Fehler zählen; aus der Quelle liest der Agent beim
Upgrade, welche Vorlage er tauscht. Nach einem Anheben
steht darunter je Sprung eine Zeile „Vorher: <alte
Version> (bis JJJJ-MM-TT)“ und als Vermerk die
Zuordnung der alten zu den neuen Phasennummern, die
die Upgrade-Anleitung des Sprungs vorgibt (für
2.0 → 2.1 `../upgrade/2.0-nach-2.1.md`, für 1.x → 2.0
`../upgrade/1.x-nach-2.0.md`).

**Herkunftszeile.** Der Kopf eines Stands: Marke, Datum,
Zweck und Vorgänger-Stände mit Version; bei einem
selbsttragenden Stand darunter die Quell-Stände, aus
denen er ausformuliert ist. Bei einer
selbsttragenden Ableitung Marke und Quell-Stand.

**Idee.** Ein Eintrag im Register `wiki/Ideen.md`:
eine unverbindliche Idee oder eine zurückgestellte
Entscheidung mit Auslöser (Datum oder Marke); wird der
Auslöser fällig, legt der Wächter den Eintrag wieder
vor.

**Ingest.** Die Übernahme einer `input/`-Datei ins Wiki:
Knoten anlegen, Chronologie und Fristen füllen,
Beteiligte erkennen, Index und Log pflegen.

**Instruktionsdatei.** Die agent-spezifische Datei
(`CLAUDE.md`, `.cursorrules`, …), die der Agent beim
Start automatisch lädt; aus dem MasterPrompt abgeleitet.

**Katalog.** Die Fassade `wiki/Katalog.md` mit ihren
Einträgen: welche Typen es im Projekt gibt, mit
Pflichtfeldern. Wächst im Projektverlauf.

**Kettenprüfung.** Die Prüfung eines Pflicht-Stands
gegen alle freigegebenen Vorgänger derselben Marke
(Widerspruch, Abdeckung, Unbegründetes) vor seiner
Freigabe. Kein Wächter: sie sperrt keine Arbeit.

**Ketten-ID.** Der Teil eines Dateinamens in `output/`
oder `overview/` vor `_VV_TLA`; bleibt über alle
Versionen gleich.

**Kollisionsfrage.** Die Frage, die der Agent beim
Projektstart in einen nicht leeren Ordner und bei der
Migration für jede vorgefundene Datei stellt, deren
Name mit einer Starter-Datei kollidiert: (a) umbenennen
und nur verlinken, (b) komplett integrieren, (c)
integrieren und alte Fassung behalten — mit Empfehlung;
gelöscht wird nur auf deinen ausdrücklichen Wunsch —
sagst du ihn nicht, fragt der Agent nach und lässt die
Datei bis dahin umbenannt liegen. Umbenannt wird nach
dem Schema
`<Name>-vorgefunden.<Endung>`.

**Komponente, Koordinator.** Bei einem Schnitt in
Teil-Systeme: der Koordinator ist das Projekt, das
zerlegt und integriert; eine Komponente ist ein eigenes
Projekt mit eigenem Repo, eigener Kette und Lieferung.
Ihre Kette endet mit der Entwickler-Doku für ihr
Bauteil; Benutzer-Doku, Auslieferung und
Betriebs-Anleitungen liegen beim Koordinator, außer die
Komponente hat eine eigene Zielumgebung. Ein
Zwischen-Koordinator ist beides. Das Regelwerk und
die Frage des Agenten schreiben „Komponent“; gemeint
ist dasselbe.

**Konzept.** Im Register `wiki/Konzepte.md` ein Knoten
mit Sach-Wissen zu einem Fachbegriff; das Glossar führt
die Definition, der Konzept-Knoten erklärt den
Zusammenhang.

**Lese-Klammer.** Die Register-Fassade einer Phase,
über die du die Einträge liest, solange noch kein Stand
gebildet ist; der Agent benennt sie dir ausdrücklich so.
Ein frühes Lese-Dokument neben dem Stand gibt es nicht.

**Lieferung.** Der Tag der Implementierung einer
Komponente, als Nachricht an den Koordinator gemeldet
und an dessen Marken-Eintrag gebucht.

**Marke (Zielmarke).** Der Zwischenziel-Anker jedes
Projekts: ein benanntes Ergebnis, das nach außen geht
und freigegeben wird — bei Software ein Release
(„1.0“, „1.1“) — kein Datum; eine Frist kann eine
Eigenschaft der Marke sein. Genau eine Marke ist
`in-progress` — keine nur, wenn das Projekt ruht —,
genau eine `current` (bei der ersten Marke noch keine);
während einer Zwischenmarke ist die bisher laufende
Marke zurückgestellt. Keine Version. Der
Meilenstein-Vorgang ist eine abgeschlossene
Arbeits-Einheit, keine Marke.

**MasterPrompt.** `MasterPrompt.md` — die KI-agnostische
Quelle aller Regeln, vom Agenten nur auf Anweisung
gelesen.

**Meilenstein.** Der Abschluss eines
Meilenstein-Vorgangs (einer Arbeits-Einheit, etwa eines
Scaffolding-Schritts) oder der Freigabe eines
Pflicht-Stands einer nicht abgeschlossenen Marke —
Anlass für einen Wächter-Durchgang; eine Freigabe im
Nachtrag zu einer abgeschlossenen Marke ist keiner.
Kein Zwischenziel: das ist die Marke.

**Migrations-Grundlagen.** Die Auffang-Datei
`wiki/Migrations-Grundlagen.md`, die der Agent bei der
Migration bei erstem Bedarf anlegt: Festlegungen,
Ungeklärtes, Herkunft und Umbenennungen, alles, was in
keine Wissens-Klasse passt. Mit der Gesamt-Annahme wird
sie als Entscheidung gebucht.

**Migrations-Varianten.** Die sechs Dateien in
`migration/`, die bei der Migration ihr Frisch-Pendant
im kopierten Wiki ersetzen — jede mit genau einem
Unterschied, etwa der Übernahme-Marke statt der Marke
des Starts.

**Mutter.** So nennt das Regelwerk den Koordinator aus
der Sicht seiner Komponente: das Projekt, dessen
Funktionsbeschreibung und Übergabe die Komponente
übernimmt.

**Nachricht.** Datei in `output/nachrichten/` des
Absenders, mit der ein Repo einem anderen etwas
mitteilt; der Empfänger bucht daraus in seine Register.

**Nachtrag.** Ein Vermerk am Eintrag einer
abgeschlossenen Marke, der nichts an ihr ändert: Er
bucht, was nach dem Marken-Wechsel bei unverändertem
Produkt und unveränderter Spezifikation hinzukommt —
ein weiterer Deploy-Stand mit seiner Freigabe, ein
Doku-Stand, der in der Doku-Abfrage „später“ erhielt,
mit seiner Freigabe, oder die
Korrektur des Tags. Eine Änderung am Produkt oder an
der Spezifikation ist eine neue Marke; erneutes
Ausrollen ohne Änderung ist Betrieb und kein Nachtrag.

**offen.** Der Vorstatus eines Eintrags der
beschreibenden Register (mit SP-1
Funktionsbeschreibungen, Architektur, Spezifikationen,
Testfälle, Deployments): Der Agent legt ihn so im Wiki
an, mit seinem Vorschlag und den offenen Punkten im
Eintrag selbst; eine Klärung ändert ihn direkt, bis er
angenommen und damit eingefroren ist. Ein vorgelegter
Stand darf offene Einträge verweisen und weist sie im
Kopf aus; mit der Freigabe werden sie angenommen.

**Patch-Marke.** Eine gewöhnliche Folge-Marke
(„2.0.1“) mit eigener Bezeichnung, eigenem Tag und
eigenem Abschluss-Stand, die Produkt oder Spezifikation
einer abgeschlossenen Marke korrigiert; ein anderes
Ausrollen bei unverändertem Produkt ist keine
Patch-Marke, sondern ein Nachtrag. Läuft die
Folge-Marke schon, wird sie als Zwischenmarke
vorgezogen.

**Pflicht-Stand.** Ein Stand, den der Prozess für eine
seiner Phasen verlangt; sein Zweck ist die Phase, vor
seiner Freigabe steht die Kettenprüfung. Der
Abschluss-Stand gehört zur Basis.

**Produkt.** Das Ergebnis der Ausarbeitung je Marke —
bei einem Softwaresystem der Code mit seinen
automatisierten Tests. Der Tag der Implementierung
markiert es; im Zwei-Repo-Fall liegt es im
Produkt-Repo.

**Projektsprache.** Die Sprache der Dokumente deines
Projekts; der Starter setzt in `Styleguide.md` Deutsch,
`Styleguide-project.md` kann das ändern.

**Prozess (SP, RP).** Ein Paket aus Fassaden, Typen,
Anweisungen und einem Vorgehen für eine Projektart.
Standardprozesse (SP) sind eigenständig;
Referenzprozesse (RP) bauen auf genau einem SP auf. In
diesem Starter sind SP-1 und RP-1 eingespielt (Ordner
`SP-1-Standardprozess/` und `RP-1-Systementwicklung/`
unter `referenzprozesse/`).

**Prozess-Nachfrage.** Die Frage des Agenten, ob der
Software-Prozess der richtige ist — nur, wenn das
Vorhaben nicht dazu passt oder er unsicher ist, beim
Projektstart, beim Start einer Komponente oder bei der
Migration eines Projekts ohne Software-Bezug. Nennst du
einen anderen Prozess, richtet er ihn aus dem Regelwerk
im Starter ein.

**Provider.** Die Komponente, die eine Schnittstelle
(einen Contract) bereitstellt und verantwortet; dort
wird über Änderungswünsche an den Contract entschieden,
und von dort wird er dem Koordinator gemeldet.

**Prüfer, Review, Prüfmuster.** Ein Prüfer ist ein
Unteragent mit frischem Kontext (oder du), der ein
Artefakt beurteilt; ein Review ist dieser Prüfdurchgang
mit Bericht und Ampel; ein Prüfmuster legt fest, wie
viele Prüfer mit welchen Fragen angesetzt werden — die
Basis ist der Standard-Prüfprompt nach der
Zwei-Modelle-Regel.

**Quell-Stand.** Ein freigegebener Stand, aus dem ein
selbsttragender Stand ausformuliert ist — für die
Entwickler-Doku Architektur, Technologie-Entscheidungen
und Spezifikation, für die Benutzer-Doku Konzept,
Anforderungen und Funktionsbeschreibung, für die
Betriebs-Anleitung der Deploy-Stand ihrer Umgebung. Die
Kettenprüfung prüft die Abdeckung gegen die
Quell-Stände.

**Register.** Eine Fassade mit nummerierten Einträgen
und — wo nötig — Detail-Knoten; etwa Entscheidungen,
Anforderungen, Fehlermeldungen, Ideen, Berichte.

**reguläre Linie.** Die Marken, die aufeinander
aufbauen („2.0“ → „2.1“); ein Vorgänger reiht sich dort
ein („2.0“ → „2.0.1“ → „2.1“), eine Sackgasse steht
daneben.

**Rücklauf.** Nachricht des Koordinators an eine
Komponente, dass ihr Übergabe-Stand überholt ist.

**Ruhe.** Der Zustand eines Projekts ohne Marke
`in-progress`: Beim Marken-Wechsel fehlt eine künftige
Marke, und du entscheidest, dass das Projekt ruht; das
Register Zielmarken trägt dann die Zeile „Ruht seit“.
Wer später weitermacht, legt zuerst eine Marke an.

**Sackgasse.** Eine Zwischenmarke, die du nicht als
Vorgänger der zurückgestellten Marke einordnest: Ihr
Inhalt geht nicht von selbst in die zurückgestellte
Marke ein, ihr Zweig wird nicht zurückgeführt, und sie
überlagert Einträge anderer Marken, statt sie
abzulösen. Behebungen und Fehlermeldungen der Sackgasse
gelten nur dort; was davon in die zurückgestellte Marke
soll, wählst du auf die Rückfrage zur Übernahme.

**Scaffolding.** Die gebündelte Klärung der
Setup-Entscheidungen vor der ersten Fachlogik:
Fahrplan, **Vorlagen-Kette** (nummerierte Vorlagen mit
je wenigen zusammengehörigen Entscheidungen),
Scaffolding-Commit.

**Schleuse.** Im Zwei-Repo-Fall der geregelte Übergang
vom Arbeits-Repo ins Produkt-Repo: Auslöser,
Transformation (wiki-verweisend zu selbsttragend),
Ausschlüsse, Freigabe, Rück-Sync-Verbot.

**selbsttragend, wiki-verweisend.** Zwei Grade eines
Dokuments: selbsttragend ist, was am Stück an
Empfänger ohne Wiki-Zugang geht (keine Wikilinks, keine
Kennungen, Begründungen ausgeschrieben);
wiki-verweisend ist, was nur mit dem Wiki gelesen wird
und verlinkt statt wiederholt. Ein Stand hat einen der
beiden Grade — wiki-verweisend ist die Regel,
selbsttragend sind die drei Doku-Stände; welchen Grad
ein Dokumenttyp hat, sagt sein Katalog-Eintrag.

**Sessionstart.** Der feste Ablauf zu Beginn jeder
Session: Orientierung, Kontext laden, Abgleiche,
Ausgabe im Erledigt/Aktion/Frage-Raster, „Bereit für
den ersten Auftrag.“ Beim ersten Mal mit den Schritten
des Projektstarts.

**Sicherungs-Commit.** Der erste Commit bei Migration
und Upgrade, der den unveränderten Alt-Zustand sichert,
bevor der Starter eingebunden oder `_template/`
getauscht wird; angekündigt, nicht erfragt.

**Stand.** Ein abgeleitetes, eingefrorenes,
versioniertes Dokument in `output/`, zu einer Marke aus
den Elementen gebildet; Träger einer Freigabe, mit
einem von zwei Graden (wiki-verweisend oder
selbsttragend). Eine Freigabe hängt immer an einem
Stand; mit ihr frieren die verwiesenen Einträge ein,
ein selbsttragender Stand friert nichts Neues ein. Was
der Agent dir vorlegt, ist der Stand selbst — einen
Entwurf daneben gibt es nicht. Nicht die Version, nicht
die Marke, nicht der Bearbeitungsstand.

**Standalone.** Die Rolle eines Repos, das weder
Koordinator noch Komponente ist — ein einzelnes Repo
ohne Zerlegung in Teil-Systeme; der Standardfall,
solange ein Projekt keine Teilaktivität mit eigenem
Repo startet.

**Standardaufgabe.** Ein mechanisch festgelegter
Vorgang, den der Agent ohne Rückfrage ausführt, meldet
und auf Veto zurücknimmt (Ingest, Index, Commit,
Prozess-Merge).

**Starter.** Dieses Repository: die Vorlage für
Softwareprojekte mit vorbereitetem Wiki, eingespieltem
Software-Prozess und den drei Anleitungen für neues
Projekt, Migration und Upgrade. Im Projekt liegt er
unter `_template/`.

**Startprompt.** Die einmalige Übergabe, die ein
Koordinator in `output/` für den Agenten einer neuen
Komponente erzeugt: beginnt mit dem Satz für ein neues
Projekt aus der Vorlage des Koordinators, nennt Rolle,
Repo, Koordinator, Übernahme-Art, Übergabe-Stand,
Nachbarn und Transport — und gibt den Prozess nicht
vor.

**Steckbrief.** Die Selbstvorstellung eines Prozesses
(`Steckbrief.md`): was er ist, kann und mitbringt,
worauf er aufbaut, ob ausgearbeitet oder geplant.

**Stichtag.** Das Datum in der Zeile „Template-Stand“
des Herkunfts-Vermerks (Tag des Starts, Übernahme-Tag
der Migration oder Tag des Upgrades); Pflichtfelder,
die erst mit dieser Version kamen, zählen nur für
Elemente ab diesem Tag als Fehler.

**Stolperstein.** Ein Hinweis in `wiki/Facts.md` auf
einen wiederkehrenden Fehler des Agenten oder einen
subtilen Sachverhalt; überstimmt Detail-Knoten.

**Tag der Implementierung.** Der git-Tag, der das
Produkt einer Marke im Repo markiert; seine Freigabe
ist die Freigabe für das Testen, und mit ihm legt der
Agent die Doku-Abfrage vor. Wird nie verschoben
oder gelöscht; vor dem Marken-Wechsel wird ein falscher
Tag durch einen neuen mit neuer Tag-Freigabe ersetzt,
die die alte ablöst. Danach prüft der Agent, ob sich
das Produkt zwischen altem und neuem Tag unterscheidet:
ist es dasselbe, setzt er den neuen Tag nach deinem OK
und vermerkt die Korrektur als Nachtrag „Tag
korrigiert“ an der Marke; hat es sich geändert, gehört
die Korrektur in eine Patch-Marke.

**Template-Stand.** Die Version der Vorlage, mit der
dein Projekt angelegt, migriert oder zuletzt angehoben
wurde; steht mit Datum im Herkunfts-Vermerk. Diese
Erklärung ist aus Version 2.1 erzeugt.

**TLA.** Dreibuchstabiges Bearbeiter-Kürzel in
versionierten Dateinamen; `AIG` ist der Agent.

**Typ.** Die Art eines Wiki-Knotens oder Dokuments
(Anforderung, Entscheidung, Dokument, Person, …), im
Katalog mit Zweck, Pflichtfeldern und Datei-Konvention
beschrieben; steht im Kopf jedes Knotens.

**Übergabe-Stand.** Der Pflicht-Stand des Koordinators
an eine Komponente beim Start der Teilaktivität; Wurzel
der Kette der Komponente.

**überholt.** Zustand eines freigegebenen Stands,
wenn ein darin verwiesenes Element abgelöst wurde und
der Nachfolger für die Marke des Stands gilt, oder
wenn ein Vorgänger-Stand überholt ist. Wird vom Lint
berechnet, nicht gebucht; die Antwort ist ein neuer
Stand mit neuer Freigabe.

**Übernahme.** Das Wort steht in drei Verbindungen:
die **Übernahme-Marke** der Migration, die
**Übernahme-Art** einer Komponente und der
**übernommene Stand** einer Vormarke — je ein eigener
Eintrag unten.

**Übernahme-Art.** Wie eine Komponente die Vorarbeit der
Mutter (ihres Koordinators) übernimmt: selbstständig
(eigene Kette ab den Anforderungen) oder Auftrag (die
Mutter hat die Funktion beschrieben).

**Übernahme-Marke.** Die erste Marke eines migrierten
Projekts, `Uebernahme-JJJJ-MM-TT` mit dem Übernahme-Tag
(dem Tag des Aufnahme-Commits), Benennung „Übernahme
des vorgefundenen Stands“; alles, was die Migration neu
anlegt, trägt sie.

**übernommener Stand.** Ein freigegebener Stand der
Vormarke, der für die Folge-Marke weitergilt, ohne neu
gebildet oder freigegeben zu werden; bei einem
Doku-Stand die Antwort „gar nicht (Übernahme)“ der
Doku-Abfrage.

**Unteragent.** Ein vom Agenten gestarteter
Hilfs-Agent mit eigenem, frischem Kontext — für
Prüfungen, Recherchen, die Transformation bei einer
Migration oder abgegrenzte Aufträge; sein Bericht wird
unverändert ins Wiki übernommen.

**Versandstand-Ordner.** Der Ordner in `outgoing/` je
Versand an Menschen: Anschreiben, daraus erzeugte
Artefakte (PDF, E-Mail, DOCX) und Kopien der Anlagen;
ab Erzeugung als Ganzes unveränderlich.

**Version.** Der zweistellige Zähler `VV` im Dateinamen
eines Stands (`_VV_TLA`); jede Änderung ist eine neue
Version derselben Ketten-ID. Nicht die Marke und nicht
die Versionsnummer eines Produkts.

**Version der Vorlage.** Die veröffentlichte Version
dieses Starters, aus der diese Erklärung erzeugt wurde
(hier 2.1; frühere Stände 1.0, 1.1 und 2.0).
Pflichtfelder, die erst mit einer Version kamen, tragen
im Katalog einen Vermerk wie „seit 2.0“; mit welcher
Version dein Projekt angelegt oder angehoben wurde,
steht im Herkunfts-Vermerk.

**Verständnis-Check.** Das Prüfmuster für
selbsttragende Dokumente: Ein Prüfer bekommt nur das
Dokument, nicht das Wiki, erzählt nach, was er
versteht, spielt die beschriebenen Schritte durch und
nennt jede Stelle, an der er raten müsste. Pflicht vor
der Vorlage der drei Doku-Stände, mit der Prüffrage des
Typs; sein Bericht ist Nachweis in der Freigabe.

**Verzicht.** Das bewusste Auslassen einer Phase mit
Pflicht-Stand für eine Marke, als Entscheidung gebucht
(mit genau einer Phase). Bei den Doku-Ständen ist er
die Antwort „gar nicht (Verzicht)“ der Doku-Abfrage,
bei der Betriebs-Anleitung je Umgebung. Nicht möglich
für den Tag der Implementierung.

**Vorgefunden.** Was beim Projektstart in einen nicht
leeren Ordner oder bei der Migration schon im Projekt
liegt. Vorgefundene Dateien bleiben unverändert; bei
einer Namenskollision werden sie mit dem Zusatz
`-vorgefunden` umbenannt und verlinkt.

**Vorlage.** Der Oberbegriff für diesen Starter und
die allgemeine Vorlage, aus der er abgeleitet ist: das,
was ein Projekt unter `_template/` einbindet und beim
Upgrade gegen den neuen Stand derselben Vorlage
tauscht. „Template“ steht nur in festen Namen —
`_template/`, `Template-Stand`, der Weg „Template
aktualisieren“ in der `../README.md`.

**Wächter.** Ein Prüfdurchgang zu festen Anlässen
(Sessionstart, täglich, auf Anfrage, Meilenstein), der
Register und Zustände prüft und Befunde meldet, ohne zu
blockieren.

**Werkstatt.** Im Zwei-Repo-Fall das Arbeits-Repo mit
Wiki, Registern und voller Historie — die Quelle, aus
der das Produkt-Repo abgeleitet wird.

**Wiedervorlage.** Ein Eintrag in deiner `TODO.md`, mit
dem sich der Agent merkt, wann er dir eine offene Frage
erneut stellt (Datum oder Anlass). Er legt ihn auf deine
Antwort hin an, führt ihn fort, bis du die Frage
entschieden hast, und erledigt ihn mit deiner
Entscheidung.

**Wikilink.** Ein Verweis `[[Knotenname]]` zwischen
Wiki-Knoten; der Name entspricht dem Dateinamen ohne
`.md`.

**Workaround.** Die Behebung einer Fehlermeldung der
regulären Linie in einer Sackgasse: sie gilt nur dort,
der Fehler bleibt in der regulären Linie offen, bis eine
Anforderung der regulären Linie ihn behebt — auch wenn
keine folgt. Die Release-Notes der Sackgasse führen ihn
als Workaround, der Fehlerstand der regulären Marke als
offenen Fehler mit Workaround.

**WorkspaceManager.** Ein externes Programm, das du
startest: wandelt Originale aus `raw/` und
`docsources.yml`-Quellen nach `input/` um und erzeugt
PDF, E-Mail oder DOCX für den Versand. Fehlt es,
übernimmt der Agent beide Aufgaben selbst — während
einer Migration immer.

**Zielumgebung.** Eine Umgebung, in die das Ergebnis
ausgeliefert wird (etwa Test- oder
Produktivumgebung), mit ihren lebenden Fakten; je
Komponente und Zielumgebung gibt es eine
Deployment-Festlegung (DEPL) und einen Deploy-Stand, je
Zielumgebung eine Betriebs-Anleitung.

**Zug.** Eine thematisch abgeschlossene Einheit aus
mehreren Arbeitsschritten; ein Zug ist ein Commit.

**Zwischenmarke.** Eine Patch-Marke, die vorgezogen
wird, während die nächste Marke schon `in-progress`
ist; diese Marke ist so lange die zurückgestellte
Marke, nach der letzten Zwischenmarke kehrt der Agent
zu ihr zurück. Ob die Zwischenmarke Vorgänger der
zurückgestellten Marke oder Sackgasse ist, fragt der
Agent dich. Im Repo arbeitet sie auf einem eigenen
Zweig ab dem Tag ihrer Vormarke. Solange sie läuft,
gibt es kein Upgrade und kein Prozess-Upgrade.

**Zwei-Modelle-Regel.** Je Prüfrunde mindestens zwei
unabhängige Prüfer mit verschiedenen Modellen, je in
frischem Kontext. Fehlt ein zweites Modell, gilt der
Ersatzweg mit Meldung der Einschränkung.
