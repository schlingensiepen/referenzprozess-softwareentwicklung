#!/bin/sh
# lint.sh — Template-Lint-Kern: deterministischer Vor-Check (POSIX sh)
#
# Prüft mechanisch, was ohne Sprachmodell prüfbar ist, bevor der
# LLM-Lint-Workflow (Wiki.md §9) läuft. Er ersetzt ihn nicht.
# Einzige Quelle der Pflichtfelder und Zeilen sind die Katalog-Einträge
# (`Katalog-*.md`; Grammatik und Lese-Regeln im Abschnitt
# Typ-Konventionen von `wiki/Katalog.md`); die Mechanik von Stand,
# Ablösung und Kette steht in `Einfrieren-und-Abloesen.md` und
# `Kettenpruefung.md`, die Nachrichten-Regel im Eintrag `message`.
#
# Aufruf im Anwender-Projekt (aus dem Projekt-Root):
#   sh _template/tools/lint.sh [OPTIONEN] [PROJEKT-ROOT]
#     liest  <ROOT>/wiki/**/*.md (ohne wiki/templates/),
#            <ROOT>/output/*.md (Stände, Ableitungen) und
#            <ROOT>/output/nachrichten/*.md (Nachrichten);
#     Nachbar-Repos aus §Komponenten der Architektur-Fassade
#     (Spalte Pfad): deren wiki/ und output/nachrichten/, nur lesend;
#     Stichtag und Übernahme-Art aus dem Herkunfts-Vermerk in
#     wiki/Aktivierter-Prozess.md (Abschnitt `## Herkunft`, Zeilen
#     `- **Template-Stand:** <Version> seit YYYY-MM-DD` und
#     `- **Übernahme-Art:**`; Format: Init-Choreografie §Phase A0
#     „Herkunfts-Vermerk“)
#
# Aufruf auf der Template-Quelle (Pflege des Templates, kein Projekt):
#   sh tools/lint.sh --template-quelle [OPTIONEN] [QUELL-ROOT]
#     liest  referenzprozesse/*/wiki/**/*.md, */bootstrap/*.md,
#            */Steckbrief.md, */index.md; Wikilinks aus */wiki/ lösen
#            nur gegen Wiki-Knoten auf (nicht gegen Steckbrief.md
#            oder index.md), wie nach dem Merge im Projekt, und nur
#            innerhalb der Paket-Grenze: ein Knoten sieht die Basis,
#            sein Paket und die Pakete, die sein Prozess per `extends:`
#            (Steckbrief.md) erbt (LINK-PAKET)
#
# Prüf-Gruppen (Befund-Codes in Klammern):
#   Typen und Frontmatter nach den Katalog-Einträgen: `type:`,
#     Pflichtfelder, Festwerte, Listen-Felder, `replaces_type`,
#     ersetzte Typen, Sammelzustand, `datum:`-Format an Knoten (OHNE-TYP,
#     TYP-UNBEKANNT, PFLICHTFELD*, FESTWERT, LISTE, REPLACES-SPIEGEL,
#     ERSETZT*, SAMMELZUSTAND, DATUM-FORMAT); Altknoten aus 1.x unter
#     wiki/ (`type: deployment`, `type: testplan`) im Bestand als Hinweis
#     mit Überführungs-Angebot statt Fehler (ALTBESTAND)
#   Katalog-Grammatik: Art, Klasse, Basis, `Freeze ab`, Präfix,
#     Dokumenttypen, Dokumenttyp-Block, Reihenfolge (KAT-*)
#   Wikilinks und Anker (LINK-TOT, LINK-ANKER, ALIAS; Paket-Grenze auf
#     der Template-Quelle: LINK-PAKET; ein toter Link im sichtbaren
#     Ablöse-Vermerk `> **⚠ Abgelöst durch [[<ID>]]**` eines
#     Bestands-Knotens — Form aus 1.x — ist ein Hinweis), Bootstrap-Reste
#     (BOOTSTRAP-REST), Umlaut oder ß im Dateinamen (DATEINAME*)
#   IDs und Register: doppelte IDs, Präfix-Format, Register-Lücke
#     (ID-DOPPELT, PRAEFIX, REG-*)
#   Agent-Berichte: Berichts-Ziele, `modell` gleich `bau_modell`
#     (BERICHT-ZIEL, C7-MODELL)
#   Ablösung: beidseitig, alte Form, Ziel, Drift (ABLOESUNG-*); Überlagerung
#     in einer Sackgasse (`ueberlagert:` nur an Elementen mit der `zielmarke:`
#     einer Sackgasse, Ziel vorhanden; eine Ablösung über die Sackgassen-Grenze
#     ist ein Hinweis — überlagern statt ablösen; ein für die Sackgasse
#     freigegebener Stand oder der aus der Vormarke für sie wirksame
#     Pflicht-Stand, dessen Element erst danach überlagert wurde, ist ein
#     Hinweis mit Rückfrage statt Fehler; beide Hinweise nennen als mögliche
#     Ursache die nach dem Festwerden geänderte Zeile `Zwischenmarke:`)
#     (UEBERLAGERUNG*); doppelte Nachfolger — ein Element mit zwei
#     Nachfolgern aus verschiedenen Marken, die für dieselbe Marke gelten
#     (Teilung in Nachfolger derselben Marke ausgenommen; bei der Rückkehr
#     aus einem Vorgänger wie beim Nachfolger-DEPL eines Nachtrags, das
#     die laufende Folge-Marke schon abgelöst hat) — Fehler, bis der
#     Anwender gewählt hat (NACHFOLGER-DOPPELT)
#   Pflicht-Fassaden im Projekt (Wiki.md §3a „mandatory“: Facts, Katalog,
#     Fassaden, InterneMechanik, Zielmarken, Entscheidungen — mit und ohne
#     Prozess vorhanden und nicht `active: false`; Abhängigkeit: die Fassade
#     Fehlermeldungen setzt Anforderungen voraus) (PFLICHT-FASSADE)
#   Zielmarken: Zustand (auch `zurückgestellt` und die Zeile `Zwischenmarke:`
#     einer Zwischenmarke; keine Marke `in-progress` ist mit der Ruhe-Zeile
#     `- **Ruht seit:** YYYY-MM-DD` kein Hinweis; der Nachtrag „Tag
#     korrigiert: <alt> → <neu>“ wird mitgelesen — der neue Tag-Name zählt
#     für die Übernahme des Tags, mit Prozess zählt die Tag-Freigabe in der
#     Formel des Nachtrags als Tag-Freigabe der Marke (fehlt sie: Hinweis),
#     der Nachtrag an einer nicht abgeschlossenen Marke ist ein Hinweis; der
#     Nachtrag eines Deploy-Stands „Nachtrag: Stand <Datei mit Version> von
#     Deploy-Stand, freigegeben für P11 Ausliefern zu Marke <M>, …“ wird
#     mitgelesen — die Freigabe in der Formel zählt als Pflicht-Freigabe P11
#     der Marke und als Freigabe des Stands, ohne eigenen Eintrag und ohne
#     Ablösung (Nachtrag ohne Formel, Formel ohne „Nachtrag:“, andere Marke,
#     Marke nicht abgeschlossen, keine Stand-Datei — die Datei wird wie im
#     Feld „Verweise“ gelesen: mit oder ohne `.md`, als Wikilink oder als
#     Pfad unter output/, sonst die Version allein —, dieselbe Freigabe auch
#     als Eintrag — derselbe Stand, über die Stand-Datei abgeglichen:
#     Hinweis); je Umgebung (`umgebung` im Kopf der Stand-Datei, sonst der
#     Gegenstand des Dateinamens) gilt der jüngste Deploy-Stand — bei
#     mehreren Nachtragszeilen derselben Umgebung die mit dem jüngsten
#     Datum, bei gleichem Datum die spätere Zeile; ein Nachtrag ist jünger
#     als ein Freigabe-Eintrag vor dem Wechsel —, die Pflicht-Freigabe P11
#     der Umgebung zählt einmal; ein weiterer Stand derselben Umgebung ist
#     eine neue Version derselben Ketten-ID — eine zweite Ketten-ID für
#     dieselbe Umgebung ist ein Hinweis, die Zeile zählt trotzdem;
#     ein Bestands-Nachfolger ohne `zielmarke:` während einer Zwischenmarke
#     ist ein Hinweis ABLOESUNG-BESTAND, bis der Vermerk „Ablösung von <E>
#     gilt ab Marke <M> (Anwender <Datum>)“ am Nachfolger steht — mit ihm
#     gilt der Nachfolger ab M wie mit `zielmarke: M`), `zielmarke:`
#     (Pflichtfeld seit 2.0 an Elementen — fehlend: Fehler ab Stichtag,
#     Hinweis am Bestand, über die Pflichtfeld-Zeile der Katalog-Einträge;
#     Stichtags-Feld ist das Anlage-Datum `datum:` des Knotens bzw. die
#     Zeile `Angelegt` des Eintrags ohne Detail-Knoten — am Eintrag aus dem
#     Feld `Zielmarke` der Fassade, fehlend: Fehler ab Stichtag, sonst
#     Hinweis; ein vergessenes Feld heilt nach der Annahme der Vermerk
#     `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)`, den der Lint
#     wie das Feld liest — der Fehler endet; bei einem Element mit
#     Detail-Knoten eine Abweichung zwischen dem Feld `Zielmarke` des
#     Fassaden-Eintrags und `zielmarke:` des Knotens: Hinweis
#     ZIELMARKE-DRIFT, gelesen wird dann die Marke des Eintrags — er ist
#     kanonisch; der Heil-Vermerk gehört bei einem Element mit Detail-Knoten
#     in den Knoten) und `marke:`, Marken-Regel
#     (Geltung aus dem Wert, nicht aus der laufenden Marke; ein Wert einer
#     Sackgasse gilt nur für sie; ein Bestands-Element ohne Feld gilt für jede
#     Marke, ein Bestands-Nachfolger ohne Feld ab der laufenden Marke; ein in
#     der Sackgasse überlagertes Element gilt dort nicht),
#     Abschluss-Stand, Verzicht (`zielmarke:` und `phase: Pn`, streng gelesen;
#     `phase: P9` ist ein Fehler — der Tag ist nicht verzichtbar; ohne
#     `phase:` nur mit Prozess ein Hinweis — ohne Prozess ist das der
#     Verzicht auf „Tests grün“, den der Lint nicht liest),
#     Fehlerbehebung (`fix_requirement:` am BUG ist eine Liste — jede
#     Anforderung, die ihn behebt, Fix-Anforderung oder ablösende bzw. neue
#     REQ; ein Einzelwert liest sich als Liste mit einem Eintrag: je Eintrag
#     liegt die Marke der REQ nicht vor der Marke des BUG — der Marke des
#     Produkt-Stands, an dem der Fehler beobachtet wurde — Fehler, ohne
#     Ausnahme (die Zeile `Zwischenmarke:` wird dafür nicht gelesen);
#     Beidseitigkeit `fix_requirement:` ↔ `behebt:` an jeder REQ und für
#     jeden Listen-Eintrag — Hinweis; `requirement_type: fix` ohne
#     `behebt:` — Hinweis; ein BUG mit `gefunden_in:` auf einen Testbericht,
#     dessen `marke` von der `zielmarke:` des BUG abweicht — Hinweis
#     MARKE-HERKUNFT) (MARKE-ZUSTAND, ZIELMARKE*, ZIELMARKE-DRIFT,
#     MARKEN-REGEL, ABLOESUNG-BESTAND, ABSCHLUSS-STAND, VERZICHT,
#     FIX-REQUIREMENT, MARKE-HERKUNFT)
#   Stände in output/: Ort, Typ, Herkunft, Marke je Ketten-ID, `datum`,
#     überholt mit Marken-Bezug (auch für die laufende Marke bei Ständen
#     der Vormarke; ein Vorgänger in `herkunft` mit jüngerer Version
#     derselben Marke wird bei abgeschlossener Marke als jüngste Version
#     gelesen — Nachtrag), Verweise, Consumer-Status (STAND-*, OUTPUT-TYP,
#     HERKUNFT, MARKE-HERKUNFT, UEBERHOLT)
#   Freigabe-Einträge: kanonische Formel im Gegenstand, Stand-Datei und
#     Marke (ohne Stand-Datei nennt der Eintrag die Marke immer — fehlt sie:
#     Fehler ab Stichtag; das `zielmarke:` des Eintrags gegen die Marke der
#     Freigabe, Abweichung: Hinweis; ein abgelöster Freigabe-Eintrag gilt
#     für seine Marke weiter, solange kein Nachfolger für sie gilt —
#     Marken-Regel), Tag-Eintrag („Stand <Tag> von Implementierung,
#     freigegeben für P10 Testen zu Marke M“), Zweck an der Phasen-Angabe,
#     Freigabe-Ordnung
#     je Marke mit Übernahme aus den Vormarken (Stände und — bei
#     unverändertem Produkt — der Tag auf Basis der für die Vormarke
#     wirksamen Pflicht-Stände; Hinweis, der entfällt, wenn der
#     Abschluss-Stand die Übernahme ausweist), Verzicht und Rolle des Repos
#     (Koordinator, Komponente, Komponente und Koordinator, Standalone,
#     unbekannt); Tag-Bedingung des Testplan-Stands; Lieferungen der
#     Komponenten, deren Übergabe-Stand zur Marke freigegeben oder aus der
#     Vormarke übernommen ist; ohne Prozess (kein Pflicht-Dokumenttyp mit
#     Phase Pn) keine Freigabe-Ordnung und kein Pflicht-Glied P9 — nur ob
#     der Abschluss-Stand den Tag führt, als Hinweis; bei einer Komponente
#     die Glieder P3/P4 nach der Übernahme-Art aus dem Herkunfts-Vermerk
#     (selbstständig: Pflicht ab P3; Auftrag: ab P5; nicht lesbar: ab P5
#     mit Hinweis) (FREIGABE-FORMEL, FREIGABE-STAND, FREIGABE-ORDNUNG,
#     ABSCHLUSS-STAND, HERKUNFT-VERMERK)
#   Kettenprüfung „mindestens einer“ (ohne Erwartung an eine
#     Fix-Anforderung auf einen Deploy: `requirement_type: fix` mit
#     `umgebung:` — an ihr wird der Vermerk „Umgesetzt mit Stand <Datei mit
#     Version> von Deploy-Stand, freigegeben zu Marke <M>“ gelesen:
#     `umgesetzt`/`abgeschlossen` ohne Vermerk, Vermerk ohne Stand-Datei
#     in output/ oder nicht eindeutig, Stand-Datei kein Deploy-Stand, Marke
#     im Vermerk ≠ `zielmarke:` oder Stand-Datei in keiner Nachtragszeile
#     und keinem Freigabe-Eintrag — Hinweis), Contract ↔ Zuschnitt (`abgeleitet_von`
#     auf ARC, `provider`, Consumer-Registrierung; Komponenten-Name ↔
#     Repo-Name über §Komponenten) und DEPL-Deckung im Repo, das die DEPL
#     führt (KETTE-DECKUNG, FIX-DEPLOY, KETTE-CON, KETTE-DEPL, DEPL-BEZUG)
#   Nachrichten: Typ, `quelle:`, `antwort_auf`, `fuer_marke`, offen
#     für C8; eigenes Repo und Nachbarn über §Komponenten (NACHRICHT*,
#     QUELLE, FUER-MARKE, EIGENES-REPO, OHNE-ZUGRIFF)
#   Glossar-Begriffe in neuen Knoten (BEGRIFF)
#
# Optionen:
#   --template-quelle      Modus Template-Quelle (sonst automatisch,
#                          wenn kein wiki/, aber referenzprozesse/base/
#                          wiki)
#   --stichtag YYYY-MM-DD  Bestandsschutz-Stichtag: Knoten mit
#                          `datum:` (Anlage-Datum) ab Stichtag sind neu,
#                          alle anderen Bestand (Hinweis statt Fehler);
#                          Stände ohne `datum:` nach dem Datum der
#                          Ketten-ID, Register-Einträge ohne Detail-Knoten
#                          nach ihrer Zeile `Angelegt`, Freigabe-Einträge
#                          nach ihrem Datum. Ohne Option liest der Lint im
#                          Projekt das Datum aus dem Herkunfts-Vermerk in
#                          wiki/Aktivierter-Prozess.md (`## Herkunft`,
#                          Zeile `- **Template-Stand:** <Version> seit
#                          YYYY-MM-DD`); fehlt beides, ist alles Bestand
#                          (die Option geht vor)
#   --kennt NAME[,NAME…]   Knoten-Namen, die als vorhanden gelten
#                          (z.B. die Init-erzeugten Knoten vor Turn 2
#                          und auf der Template-Quelle)
#   --ohne-nachbarn        Nachbar-Repos nicht lesen (Querbezüge
#                          und offene Nachrichten dann nur als Hinweis)
#   --repo NAME            Repo-Name des eigenen Repos (sonst aus der
#                          Zeile in §Komponenten, deren Pfad hierher
#                          zeigt, ersatzweise aus `von:` der eigenen
#                          Nachrichten; unerkannt: Hinweis; ohne
#                          `fuer_marke:` Rolle „unbekannt“ — DEPL-Deckung
#                          und Lieferungen entfallen, Freigabe-Ordnung nur
#                          als Hinweis);
#                          fehlt für NAME die Zeile in §Komponenten:
#                          Hinweis, SPEC- und DEPL-Deckung entfallen
#   --ohne-hinweise        nur FEHLER ausgeben
#   -h, --help             diese Hilfe
#
# Ausgabe: je Befund eine Zeile  FEHLER|HINWEIS  CODE  datei: text,
# danach Zusammenfassung und die Liste „Nicht geprüft“.
# Exit-Code 1 bei mindestens einem FEHLER, 2 bei Aufruf-Fehler, sonst 0.
# Benötigt: sh, awk, find, sort (POSIX); kein Netz, nur lesend.
# Getestet mit dash, bash --posix und mawk 1.3.4; CRLF und UTF-8-BOM
# werden toleriert.

set -u

MODE=projekt
STICHTAG=""
KENNT=""
OHNE_HINWEISE=0
OHNE_NACHBARN=0
OWNARG=""
ROOT=""

usage() {
  awk 'NR > 1 && /^#/ { sub(/^# ?/, ""); print; next } NR > 1 { exit }' "$0"
}
fehlt_wert() { echo "lint.sh: Option $1 erwartet einen Wert" >&2; exit 2; }

while [ $# -gt 0 ]; do
  case "$1" in
    --template-quelle) MODE=template-quelle ;;
    --stichtag) [ $# -ge 2 ] || fehlt_wert "$1"; shift; STICHTAG="$1" ;;
    --kennt) [ $# -ge 2 ] || fehlt_wert "$1"; shift; KENNT="$1" ;;
    --ohne-nachbarn) OHNE_NACHBARN=1 ;;
    --repo) [ $# -ge 2 ] || fehlt_wert "$1"; shift; OWNARG="$1" ;;
    --ohne-hinweise) OHNE_HINWEISE=1 ;;
    -h|--help) usage; exit 0 ;;
    --) shift; break ;;
    -*) echo "lint.sh: unbekannte Option $1" >&2; exit 2 ;;
    *) ROOT="$1" ;;
  esac
  shift
done
[ -n "$ROOT" ] || ROOT="."
ROOT="${ROOT%/}"

if [ "$MODE" = projekt ] && [ ! -d "$ROOT/wiki" ] \
   && [ -d "$ROOT/referenzprozesse/base/wiki" ]; then
  MODE=template-quelle
fi

case "$STICHTAG" in
  ""|[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) ;;
  *) echo "lint.sh: --stichtag erwartet YYYY-MM-DD" >&2; exit 2 ;;
esac

TMP="${TMPDIR:-/tmp}/lint.$$"
mkdir -p "$TMP" || exit 2
trap 'rm -rf "$TMP"' EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

LIST="$TMP/files"
DATA="$TMP/data"
AWK_EXTRACT="$TMP/extract.awk"
AWK_CHECK="$TMP/check.awk"
AWK_TERMS="$TMP/terms.awk"

# --- Lesebereich -----------------------------------------------------------
OUTP=""
if [ "$MODE" = template-quelle ]; then
  [ -d "$ROOT/referenzprozesse" ] || {
    echo "lint.sh: $ROOT/referenzprozesse fehlt" >&2; exit 2; }
  {
    find "$ROOT/referenzprozesse" -path '*/wiki/*' -name '*.md' \
      ! -path '*/wiki/templates/*'
    find "$ROOT/referenzprozesse" -path '*/bootstrap/*' -name '*.md'
    find "$ROOT/referenzprozesse" -name 'Steckbrief.md' ! -path '*/wiki/*'
    find "$ROOT/referenzprozesse" -name 'index.md' ! -path '*/wiki/*'
  } | sort -u > "$LIST"
else
  [ -d "$ROOT/wiki" ] || { echo "lint.sh: $ROOT/wiki fehlt" >&2; exit 2; }
  OUTP="$ROOT/output/"
  {
    find "$ROOT/wiki" -name '*.md' ! -path '*/wiki/templates/*'
    # Stände und Ableitungen liegen direkt in output/, Nachrichten in
    # output/nachrichten/; Kopien in output/<Dokument>_VV_TLA/ nicht.
    for f in "$ROOT"/output/*.md "$ROOT"/output/nachrichten/*.md; do
      [ -f "$f" ] && printf '%s\n' "$f"
    done
  } | sort -u > "$LIST"
fi

if [ ! -s "$LIST" ]; then
  echo "lint.sh: keine Markdown-Dateien im Lesebereich" >&2; exit 2
fi

# --- Pass 1: Extraktion ----------------------------------------------------
# Datensätze (Tab-getrennt), je Datei:
#   FILE  f                       Datei im Lesebereich
#   NOFM  f                       kein Frontmatter
#   FM    f key value             Frontmatter-Feld (Listen: ein FM je Wert;
#                                 leere Liste `[]` als Wert `[]`)
#   FML   f key                   Feld ist als YAML-Liste geschrieben
#   HD    f level text            Überschrift (außerhalb Code-Blöcken)
#   LK    f line target anchor    Wikilink ohne Alias; Code-Spannen entfernt
#   BS    f line                  `## Bootstrap`-Überschrift
#   ID    f line id               Register-Eintrag `### PRÄFIX-NNN …`
#   IDH   f id text               Überschrift des Register-Eintrags (Gegenstand)
#   RF    f id name value         Feld-Zeile `- **Name:** …` eines
#                                 Register-Eintrags
#   RL    f id line               Listen-Zeile eines Eintrags im Contract-Index
#                                 (Consumer-Registrierungen)
#   SECLK f id target             Detail-Verweis eines Register-Eintrags
#                                 (Link der Zeile `Detail:` oder Link,
#                                 dessen Ziel mit der ID beginnt)
#   SECND f id line               Zeile `Detail:` ohne Wikilink
#   CT    f type                  Typ-Abschnitt `### <typ>` im Katalog-Eintrag
#   CP    f type spec             Pflichtfelder: name|festwert|präfix|seit,…
#   CE    f type parent           `- **Extends:**`
#   CR    f type old              `- **Replaces type:**`
#   CX    f type text             Grammatik-Befund im Katalog
#   CL    f type name line value  Zeile `- **Name:** …` eines Typ-Abschnitts
#                                 (Fortsetzungszeilen angehängt)
#   GT    f kind term             Glossar: `Vormals:`/`Nicht verwenden:`
#   KP    f komp repo pfad rolle  Zeile in §Komponenten der Architektur-Fassade
#                                 (Code-Zeichen entfernt, leere Zelle `-`)
#   ENV   f name                  Umgebung `### <Name>` in den Zielumgebungen
#   MK    f bez line              Marken-Eintrag `### <Bezeichnung> — …`
#   MKZ   f bez text              Zeile `- **Zustand:** …` eines Marken-Eintrags
#   MKZX  f bez line              andere Schreibung einer Zustands-Zeile
#   MKF   f bez value             Zeile `- **fuer_marke:** …` eines Marken-Eintrags
#   MMU   f line                  Zeile mit „übernommen aus“ in einem Dokument
#                                 direkt in output/ (Abschluss-Stand; Tabs zu
#                                 Leerzeichen)
#   MKL   f bez komp line         Lieferung unter „Zuliefernde Komponenten“ eines
#                                 Marken-Eintrags: Zelle der Spalte Komponente
#                                 (leer bei Listenzeile) und die Zeile
#   QL    f line ref              qualifizierter Verweis `<repo>/<ID>` in
#                                 einer Zeile mit „quelle“
#   SREF  f ref                   ID oder `<repo>/<ID>` im Text eines
#                                 Dokuments direkt in output/
#   HV    f name value            Zeile `- **Name:** Wert` im Abschnitt
#                                 `## Herkunft` von wiki/Aktivierter-Prozess.md
#                                 (Herkunfts-Vermerk: Datum, Rolle,
#                                 Übernahme-Art; Code-Zeichen entfernt)
cat > "$AWK_EXTRACT" <<'EOF'
function trim(s) { sub(/^[ \t]+/, "", s); sub(/[ \t]+$/, "", s); return s }
function unquote(s) {
  s = trim(s)
  if (s ~ /^".*"$/ || s ~ /^'.*'$/) s = substr(s, 2, length(s) - 2)
  return s
}
function stripcomment(s,  i) {
  i = index(s, " #"); if (i > 0) s = substr(s, 1, i - 1)
  if (substr(s, 1, 1) == "#") s = ""
  return s
}
function pf_push() {
  if (pf_f != "") pf_spec = pf_spec (pf_spec == "" ? "" : ",") pf_f "|" pf_v "|" pf_fmt "|" pf_seit
  pf_f = ""
}
function pf_paren(p) {
  # Klammer-Zusatz hinter einem Feld: nur „Format `X-NNN`“ und „seit <Marke>“
  # (eigene Klammer, ohne weiteren Text)
  if (pf_f == "") return
  if (match(p, /Format `[A-Za-z]+-NNN`/)) pf_fmt = substr(p, RSTART + 8, RLENGTH - 13)
  if (trim(p) ~ /^seit [^ ]+$/) pf_seit = substr(trim(p), 6)
}
function emit_pflicht(f, t, line,   n, i, c, depth, tok, inside, paren, fld, val) {
  n = length(line); inside = 0; depth = 0; tok = ""; paren = ""
  pf_spec = ""; pf_f = ""; pf_v = ""; pf_fmt = ""; pf_seit = ""
  for (i = 1; i <= n; i++) {
    c = substr(line, i, 1)
    if (depth > 0) {
      if (c == "(") depth++
      else if (c == ")") { depth--; if (depth == 0) { pf_paren(paren); paren = "" } }
      else paren = paren c
      continue
    }
    if (c == "(") { depth = 1; paren = ""; continue }
    if (c == "`") {
      if (inside) {
        inside = 0
        pf_push()
        fld = tok; val = ""
        if (index(tok, ":") > 0) {
          fld = substr(tok, 1, index(tok, ":") - 1)
          val = trim(substr(tok, index(tok, ":") + 1))
        }
        fld = trim(fld)
        if (fld !~ /^[a-z][a-z0-9_-]*$/) {
          print "CX\t" f "\t" t "\tFeldname ungültig in Pflichtfeld-Zeile: `" tok "`"
          continue
        }
        if (val != "" && fld != "type")
          print "CX\t" f "\t" t "\tFestwert außerhalb `type`: `" tok "`"
        if (fld == "type" && val != t)
          print "CX\t" f "\t" t "\tFestwert `type: " val "` weicht vom Abschnitt ab"
        pf_f = fld; pf_v = val; pf_fmt = ""; pf_seit = ""
      } else { inside = 1; tok = "" }
      continue
    }
    if (inside) tok = tok c
  }
  pf_push()
  print "CP\t" f "\t" t "\t" pf_spec
}
function flush_pflicht() {
  if (pl_active) { emit_pflicht(FILENAME, sec, pl_line); pl_active = 0; pl_line = "" }
}
function flush_item() {
  if (it_active) print "CL\t" FILENAME "\t" sec "\t" it_name "\t" it_line "\t" it_val
  it_active = 0; it_name = ""; it_val = ""
}
function endsection() {
  flush_item()
  flush_pflicht()
  if (sec != "") {
    if (pcount == 0) print "CX\t" FILENAME "\t" sec "\tTyp-Abschnitt ohne Pflichtfeld-Zeile"
    if (pcount > 1) print "CX\t" FILENAME "\t" sec "\tmehrere Pflichtfeld-Zeilen (" pcount ")"
    if (ecount > 1) print "CX\t" FILENAME "\t" sec "\tmehrere Extends-Zeilen"
    if (rcount > 1) print "CX\t" FILENAME "\t" sec "\tmehrere Replaces-type-Zeilen"
  }
  sec = ""; pcount = 0; ecount = 0; rcount = 0
}
function flush_gt(   v, out, i, c, d, n, arr, w) {
  if (!gt_active) return
  gt_active = 0
  v = gt_val; out = ""; d = 0
  # Klammer-Zusätze (auch über Zeilen) und Code-Spannen sind Erläuterung
  for (i = 1; i <= length(v); i++) {
    c = substr(v, i, 1)
    if (c == "(") { d++; continue }
    if (c == ")") { if (d > 0) d--; continue }
    if (d == 0) out = out c
  }
  gsub(/`[^`]*`/, "", out)
  n = split(out, arr, ",")
  for (i = 1; i <= n; i++) {
    w = trim(arr[i]); sub(/[.;:]+$/, "", w); w = trim(w)
    if (w != "" && w != "—") print "GT\t" FILENAME "\t" gt_kind "\t" w
  }
}
function scan_refs(line, kind,   s, r, vor) {
  # kind QL: nur qualifizierte Verweise; kind SREF: auch einfache IDs.
  # Ein Qualifizierer mitten in einem Pfad oder einer URL (davor `/`,
  # `.` oder `:`) zählt nicht; dann gilt nur die ID.
  s = line; vor = ""
  while (match(s, /[A-Za-z0-9_.-]+\/[A-Z][A-Z]+-[0-9]+|[A-Z][A-Z]+-[0-9]+/)) {
    r = substr(s, RSTART, RLENGTH)
    if (RSTART > 1) vor = substr(s, RSTART - 1, 1)
    s = substr(s, RSTART + RLENGTH)
    if (index(r, "/") > 0 && (vor == "/" || vor == "." || vor == ":")) r = substr(r, index(r, "/") + 1)
    vor = substr(r, length(r), 1)
    if (kind == "QL") { if (index(r, "/") > 0) print "QL\t" FILENAME "\t" FNR "\t" r }
    else print "SREF\t" FILENAME "\t" r
  }
}
# Zelle einer §Komponenten-Zeile; leer oder fehlend als `-` (Tab-sicher)
function kpcell(i,  c) { c = (i > 0) ? trim(cell[i]) : ""; return (c == "" || c == "—") ? "-" : c }
function emit_links(line, nr, isdet,   s, t, a, p) {
  s = line
  gsub(/`[^`]*`/, "", s)
  while ((p = index(s, "[[")) > 0) {
    s = substr(s, p + 2)
    if ((p = index(s, "]]")) == 0) break
    t = substr(s, 1, p - 1); s = substr(s, p + 2)
    a = ""
    gsub(/\\\|/, "|", t)                      # Tabellen-Alias `\|`
    if ((p = index(t, "|")) > 0) t = substr(t, 1, p - 1)
    if ((p = index(t, "#")) > 0) { a = substr(t, p + 1); t = substr(t, 1, p - 1) }
    t = trim(t); a = trim(a)
    if (t == "" && a == "") continue
    print "LK\t" FILENAME "\t" nr "\t" t "\t" a
    if (curid != "" && (isdet || index(t, curid) == 1)) {
      print "SECLK\t" FILENAME "\t" curid "\t" t
      if (isdet) detlk = 1
    }
  }
}
{ if (FNR == 1 && substr($0, 1, 3) == BOM) $0 = substr($0, 4); sub(/\r$/, "") }
FNR == 1 {
  print "FILE\t" FILENAME
  infm = 0; fence = 0; comment = 0; key = ""; ftype = ""
  curid = ""; pl_active = 0; pl_line = ""; sec = ""; rlcons = 0
  pcount = 0; ecount = 0; rcount = 0
  it_active = 0; gt_active = 0; sect2 = ""; kp_hdr = 0; mkcur = ""; mklief = 0
  isakt = (FILENAME ~ /\/wiki\/Aktivierter-Prozess\.md$/)
  split("", fmlk)
  isout = (OUTP != "" && substr(FILENAME, 1, length(OUTP)) == OUTP \
           && index(substr(FILENAME, length(OUTP) + 1), "/") == 0)
  if ($0 == "---") { infm = 1; next }
  print "NOFM\t" FILENAME
}
infm {
  if ($0 == "---" || $0 == "...") { infm = 0; key = ""; next }
  line = stripcomment($0)
  if (line ~ /^[ \t]*-[ \t]/ && key != "") {
    v = line; sub(/^[ \t]*-[ \t]+/, "", v); v = unquote(v)
    print "FM\t" FILENAME "\t" key "\t" v
    if (!(key in fmlk)) { fmlk[key] = 1; print "FML\t" FILENAME "\t" key }
    next
  }
  if (line ~ /^[A-Za-z_][A-Za-z0-9_-]*:/) {
    key = substr(line, 1, index(line, ":") - 1)
    v = unquote(substr(line, index(line, ":") + 1))
    if (v ~ /^\[.*\]$/) {
      fmlk[key] = 1; print "FML\t" FILENAME "\t" key
      v = substr(v, 2, length(v) - 2)
      n = split(v, arr, ","); cnt = 0
      for (i = 1; i <= n; i++) { w = unquote(arr[i]); if (w != "") { print "FM\t" FILENAME "\t" key "\t" w; cnt++ } }
      if (cnt == 0) print "FM\t" FILENAME "\t" key "\t[]"      # leere Liste: eigener Marker
    } else print "FM\t" FILENAME "\t" key "\t" v
    if (key == "type") ftype = v
  }
  next
}
{
  line = $0
  if (comment) {
    if (index(line, "-->") > 0) { comment = 0; line = substr(line, index(line, "-->") + 3) }
    else next
  }
  while ((p = index(line, "<!--")) > 0) {
    q = index(substr(line, p), "-->")
    if (q > 0) line = substr(line, 1, p - 1) substr(line, p + q + 2)
    else { line = substr(line, 1, p - 1); comment = 1; break }
  }
  if (line ~ /^[ \t]*(```|~~~)/) { fence = !fence; next }
  if (fence) next
  iscat = (ftype == "catalog-entry")
  # sichtbarer Ablöse-Vermerk nach dem Titel (Einfrieren-und-Abloesen
  # §Ablösung): Zeile `> **⚠ Abgelöst durch [[…]]**` — Merker für LINK-TOT
  if (line ~ /^>[ \t]*\*\*.*Abgelöst durch/) print "ABV\t" FILENAME "\t" FNR
  if (isout) scan_refs(line, "SREF")
  if (isout && index(line, "bernommen aus") > 0) { l = line; gsub(/\t/, " ", l); print "MMU\t" FILENAME "\t" l }
  # Abschluss-Stand: Zeile mit dem Wort „Tag“ bzw. „Implementierung“ (Projekt ohne Prozess)
  if (isout && ftype == "abschluss-stand" && (line ~ /(^|[^A-Za-z])Tags?([^A-Za-z]|$)/ || index(line, "Implementierung") > 0)) print "MMT\t" FILENAME
  if (line ~ /[Qq]uelle/) scan_refs(line, "QL")
  if (line ~ /^#+[ \t]/) {
    h = line; sub(/[ \t].*$/, "", h); lvl = length(h)
    if (lvl <= 6) {
      flush_item(); flush_gt()
      txt = line; sub(/^#+[ \t]+/, "", txt); txt = trim(txt)
      print "HD\t" FILENAME "\t" lvl "\t" txt
      if (lvl <= 2) { sect2 = (lvl == 2) ? txt : ""; kp_hdr = 0; mkcur = ""; mklief = 0 }
      if (lvl == 2 && ftype == "target-mark-log") mkruhe = (txt == "Marken")
      if (lvl == 3 && ftype == "target-mark-log" && sect2 == "Marken" && index(txt, "<") == 0) {
        mkcur = txt; p = index(mkcur, " — "); if (p > 0) mkcur = substr(mkcur, 1, p - 1)
        mkcur = trim(mkcur); mklief = 0; print "MK\t" FILENAME "\t" mkcur "\t" FNR
      } else if (lvl <= 3) { mkcur = ""; mklief = 0 }
      else if (mkcur != "") { mklief = (index(txt, "Zuliefernde Komponenten") > 0); mklhdr = 0; imk = 0 }
      if (lvl == 3 && ftype == "target-environment-log" && sect2 == "Umgebungen" && index(txt, "<") == 0)
        print "ENV\t" FILENAME "\t" txt
      if (lvl == 2 && txt ~ /^Bootstrap([ \t]|$)/) print "BS\t" FILENAME "\t" FNR
      if (lvl == 3 && txt ~ /^[A-Z][A-Z]+-[0-9]+([ \t]|$)/) {
        curid = txt; sub(/[ \t].*$/, "", curid)
        print "ID\t" FILENAME "\t" FNR "\t" curid
        print "IDH\t" FILENAME "\t" curid "\t" txt
      } else if (lvl <= 3) curid = ""
      if (iscat) {
        if (lvl == 3) {
          endsection()
          if (txt ~ /^[a-z][a-z0-9-]*$/) { sec = txt; print "CT\t" FILENAME "\t" sec }
        } else if (lvl < 3) endsection()
      }
      emit_links(txt, FNR, 0)
      next
    }
  }
  # Glossar: `Vormals:` / `Nicht verwenden:` (Fortsetzung bis Leerzeile)
  if (ftype == "glossary") {
    if (line ~ /^(- )?\*\*(Vormals|Nicht verwenden):\*\*/) {
      flush_gt(); gt_active = 1
      gt_kind = (line ~ /Vormals/) ? "vormals" : "nicht verwenden"
      gt_val = line; sub(/^(- )?\*\*[^*]+\*\*/, "", gt_val)
    } else if (gt_active && line !~ /^[ \t]*$/ && line !~ /^(- )?\*\*/) gt_val = gt_val " " line
    else flush_gt()
  }
  # Herkunfts-Vermerk in Aktivierter-Prozess (Init-Choreografie §Phase A0):
  # Zeilen `- **Name:** Wert` im Abschnitt `## Herkunft`
  if (isakt && sect2 == "Herkunft" && line ~ /^- \*\*[^*]+\*\*/) {
    v = line; sub(/^- \*\*/, "", v); nm = substr(v, 1, index(v, "**") - 1); sub(/:$/, "", nm)
    v = substr(v, index(v, "**") + 2); sub(/^:/, "", v); gsub(/`/, "", v)
    print "HV\t" FILENAME "\t" trim(nm) "\t" trim(v)
  }
  # §Komponenten der Architektur-Fassade: Tabelle nach Spaltennamen
  if (ftype ~ /architecture-overview$/ && sect2 == "Komponenten" && line !~ /^[ \t]*\|/) kp_hdr = 0
  if (ftype ~ /architecture-overview$/ && sect2 == "Komponenten" && line ~ /^[ \t]*\|/) {
    r = trim(line); sub(/^\|/, "", r); sub(/\|$/, "", r); gsub(/`/, "", r)
    nc = split(r, cell, "|")
    if (!kp_hdr) {
      kp_hdr = 1; ik = 0; ir = 0; ip = 0; il = 0
      for (i = 1; i <= nc; i++) {
        c = trim(cell[i])
        if (c == "Komponente") ik = i; else if (c == "Repo-Name") ir = i
        else if (c == "Pfad") ip = i; else if (c == "Rolle") il = i
      }
    } else if (r !~ /^[ \t:|-]+$/ && ik > 0) {
      k = trim(cell[ik])
      if (k != "" && index(k, "<") == 0)
        print "KP\t" FILENAME "\t" k "\t" kpcell(ir) "\t" kpcell(ip) "\t" kpcell(il)
    }
  }
  # Vermerk `- **Vermerk <Datum>:** Ablösung von <E> gilt ab Marke <M>
  # (Anwender <Datum>)` an einem Bestands-Nachfolger ohne `zielmarke:`
  # (Einfrieren-und-Abloesen §Ablösung, Bestands-Nachfolger bei einer
  # Zwischenmarke): die Antwort des Anwenders, zu welcher Marke die Ablösung
  # gehört — gelesen werden E und M (nur diese Form)
  if (ftype != "" && line ~ /^- \*\*Vermerk[^*]*\*\*[ \t]*Ablösung von (\[\[[^]]*\]\]|[^ \t]+) gilt ab Marke /) {
    v = line; sub(/^- \*\*Vermerk[^*]*\*\*[ \t]*Ablösung von[ \t]*/, "", v); gsub(/[`*]/, "", v); v = trim(v)
    if (v ~ /^\[\[/) { e = substr(v, 3, index(v, "]]") - 3); v = substr(v, index(v, "]]") + 2); if (index(e, "|") > 0) e = substr(e, index(e, "|") + 1) }
    else { e = v; sub(/[ \t].*$/, "", e); sub(/^[^ \t]+/, "", v) }
    sub(/^[ \t]+gilt ab Marke[ \t]*/, "", v); sub(/[ \t(,;].*$/, "", v)
    print "ABM\t" FILENAME "\t" trim(e) "\t" v
  }
  # Vermerk `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)` — Heilweg
  # für ein vergessenes `zielmarke:` nach der Annahme (Zielmarken §Meta,
  # Heilweg): im Detail-Knoten (curid leer) wie im Register-Eintrag ohne
  # Detail-Knoten (curid = ID); der Lint liest ihn wie das Feld
  if (ftype != "" && line ~ /^- \*\*Vermerk[^*]*\*\*[ \t]*Zielmarke[ \t]+[^ \t]+[ \t]*\(nachgetragen\)/) {
    v = line; sub(/^- \*\*Vermerk[^*]*\*\*[ \t]*Zielmarke[ \t]+/, "", v); gsub(/[`*]/, "", v); v = trim(v); sub(/[ \t(].*$/, "", v)
    print "ZMV\t" FILENAME "\t" curid "\t" v
  }
  # Vermerk `- **Vermerk <Datum>:** Umgesetzt mit Stand <Datei mit Version>
  # von Deploy-Stand, freigegeben zu Marke <M>` an einer Fix-Anforderung auf
  # einen Deploy (Anforderungen §Meta „Fehlerbehebungen“): der freigegebene
  # weitere Deploy-Stand als angehängter Vermerk am eingefrorenen Element —
  # gelesen werden die Stand-Datei (Form wie im Feld „Verweise“) und M; nur
  # die erste Zeile je Knoten
  if (ftype != "" && line ~ /^- \*\*Vermerk[^*]*\*\*[ \t]*Umgesetzt mit Stand /) {
    v = line; sub(/^- \*\*Vermerk[^*]*\*\*[ \t]*Umgesetzt mit Stand[ \t]+/, "", v); gsub(/`/, "", v)
    fxq = index(v, " von Deploy-Stand")
    if (fxq > 0) {
      fxn = trim(substr(v, 1, fxq - 1)); fxm = ""
      fxr = substr(v, fxq); if (match(fxr, / zu Marke [^ ,;]+/)) { fxm = trim(substr(fxr, RSTART + 10, RLENGTH - 10)); sub(/[.,;]+$/, "", fxm) }
      print "FXV\t" FILENAME "\t" curid "\t" fxn "\t" fxm
    }
  }
  # Ruhe-Zeile (Zielmarken §Meta, Zeiger): `- **Ruht seit:** YYYY-MM-DD` im
  # Abschnitt `## Marken` vor dem ersten Marken-Eintrag — das Projekt ruht,
  # keine Marke ist `in-progress`
  if (ftype == "target-mark-log" && mkruhe && mkcur == "" && line ~ /^- \*\*Ruht seit:?\*\*/) {
    v = line; sub(/^- \*\*Ruht seit:?\*\*[ \t]*/, "", v); gsub(/[`*]/, "", v); v = trim(v); sub(/[ \t].*$/, "", v)
    print "MKR\t" FILENAME "\t" FNR "\t" v
  }
  # Marken-Eintrag: Zustand und fuer_marke (nur die Zeile `- **fuer_marke:** …`,
  # wie Zustand; das Wort in Prosa zählt nicht)
  if (mkcur != "") {
    if (line ~ /^- \*\*Zustand:\*\*/) { v = line; sub(/^- \*\*Zustand:\*\*[ \t]*/, "", v); print "MKZ\t" FILENAME "\t" mkcur "\t" v }
    else if (line ~ /(Zustand|Status)[*_`]*[ \t]*:/) print "MKZX\t" FILENAME "\t" mkcur "\t" FNR
    if (line ~ /^- \*\*fuer_marke:\*\*/) {
      v = line; sub(/^- \*\*fuer_marke:\*\*[ \t]*/, "", v); gsub(/[`*]/, "", v); v = trim(v); sub(/[ \t].*$/, "", v)
      if (v != "") print "MKF\t" FILENAME "\t" mkcur "\t" v
    }
    # Zwischenmarke (Zielmarken §Meta): Zeile `- **Zwischenmarke:** Vorgänger von <B>`
    # oder `- **Zwischenmarke:** Sackgasse` — das erste Wort zählt
    if (line ~ /^- \*\*Zwischenmarke:\*\*/) { v = line; sub(/^- \*\*Zwischenmarke:\*\*[ \t]*/, "", v); print "MKW\t" FILENAME "\t" mkcur "\t" v }
    # Nachtrag „Tag korrigiert“ (Zielmarken §Meta, Nachtrag): Vermerk-Zeile
    # `- **Vermerk <Datum>:** Tag korrigiert: <alt> → <neu>, …` — gelesen
    # werden alter und neuer Tag-Name (auch mit `->`)
    if (line ~ /^- \*\*Vermerk[^*]*\*\*[ \t]*Tag korrigiert/) {
      v = line; sub(/^- \*\*Vermerk[^*]*\*\*[ \t]*Tag korrigiert:?[ \t]*/, "", v); gsub(/`/, "", v)
      tkp = index(v, "→"); if (tkp == 0) { tkp = index(v, "->"); tkq = 2 } else tkq = 3
      if (tkp > 0) { tka = trim(substr(v, 1, tkp - 1)); tkb = trim(substr(v, tkp + tkq)); sub(/[,;( \t].*$/, "", tkb) } else { tka = ""; tkb = "" }
      # mit Prozess trägt der Nachtrag die neue Tag-Freigabe in der Formel
      # „Stand <neu> von Implementierung, freigegeben für P10 … zu Marke M“
      # (Vorgehen.md §4 „Freigabe per Tag“): Tag-Name und Marke werden gelesen
      tfn = ""; tfm = ""
      tfp = index(v, "Stand "); tfq = index(v, " von Implementierung, freigegeben für ")
      if (tfp > 0 && tfq > tfp) {
        tfn = trim(substr(v, tfp + 6, tfq - tfp - 6)); sub(/[ \t].*$/, "", tfn)
        tfr = substr(v, tfq); if (match(tfr, / zu Marke [^ ,;]+/)) { tfm = trim(substr(tfr, RSTART + 10, RLENGTH - 10)); sub(/[.,;]+$/, "", tfm) }
      }
      print "MKT\t" FILENAME "\t" mkcur "\t" tka "\t" tkb "\t" FNR "\t" tfn "\t" tfm
    }
    # Nachtrag eines Deploy-Stands (Zielmarken §Meta, Nachtrag; Entscheidungen
    # Meta „Freigabe-Einträge“, Ausnahme „Nachtrag zu einer abgeschlossenen
    # Marke“): Vermerk-Zeile `- **Vermerk <Datum>:** Nachtrag: Stand <Datei mit
    # Version> von Deploy-Stand, freigegeben für P11 Ausliefern zu Marke <M>,
    # freigegeben vom Anwender <Datum>[; …]` — gelesen werden x (Stand-Datei
    # oder Version) und M aus der Formel sowie das Datum des Vermerks (je
    # Umgebung gilt der jüngste Nachtrag); die Formel ist das Kennzeichen, auch
    # ohne „Nachtrag:“ am Anfang (dann Format-Hinweis); eine Vermerk-Zeile
    # „Nachtrag:“ mit dem Wort „Deploy-Stand“ ohne Formel wird gemeldet
    else if (line ~ /^- \*\*Vermerk[^*]*\*\*/) {
      v = line; sub(/^- \*\*Vermerk[^*]*\*\*[ \t]*/, "", v); gsub(/`/, "", v)
      dvd = line; sub(/^- \*\*Vermerk[ \t]*/, "", dvd); sub(/[:*].*$/, "", dvd); dvd = trim(dvd)
      dnf = (v ~ /^Nachtrag:/) ? 1 : 0
      dfp = index(v, "Stand "); dfq = index(v, " von Deploy-Stand, freigegeben für ")
      if (dfp > 0 && dfq > dfp) {
        dfn = trim(substr(v, dfp + 6, dfq - dfp - 6)); dfm = ""
        dfr = substr(v, dfq); if (match(dfr, / zu Marke [^ ,;]+/)) { dfm = trim(substr(dfr, RSTART + 10, RLENGTH - 10)); sub(/[.,;]+$/, "", dfm) }
        print "MKD\t" FILENAME "\t" mkcur "\t" FNR "\t" dfn "\t" dfm "\t" dnf "\t" dvd
      } else if (dnf && index(v, "Deploy-Stand") > 0) print "MKD\t" FILENAME "\t" mkcur "\t" FNR "\t\t\t" dnf "\t" dvd
    }
    # Lieferungen unter „Zuliefernde Komponenten“ (Zielmarken §Meta): Tabelle
    # mit Spalte „Komponente“ (Repo-Name) — je Zeile die Zelle; Listenzeilen
    # oder Tabellen ohne diese Spalte: die ganze Zeile (Wort-Suche, Bestand)
    if (index(line, "Zuliefernde Komponenten") > 0) { mklief = 1; mklhdr = 0; imk = 0 }
    else if (mklief && line ~ /^(- )?\*\*/) mklief = 0
    else if (mklief && line ~ /^[ \t]*\|/) {
      # die Zelle `quelle` der Tabelle ist eine Buchung (Zeilen mit dem Wort
      # „quelle“ — die Kopfzeile — scannt schon die allgemeine QL-Regel)
      if (line !~ /[Qq]uelle/) scan_refs(line, "QL")
      r = trim(line); sub(/^\|/, "", r); sub(/\|$/, "", r); gsub(/`/, "", r)
      if (r !~ /^[ \t:|-]+$/) {
        nc = split(r, cell, "|")
        if (!mklhdr) {
          mklhdr = 1
          for (i = 1; i <= nc; i++) if (trim(cell[i]) == "Komponente") imk = i
          if (imk > 0) r = ""                        # Kopfzeile, keine Lieferung
        }
        if (r != "") print "MKL\t" FILENAME "\t" mkcur "\t" ((imk > 0) ? trim(cell[imk]) : "") "\t" line
      }
    }
    else if (mklief && line ~ /^[ \t]*-[ \t]/) print "MKL\t" FILENAME "\t" mkcur "\t\t" line
  }
  if (iscat && sec != "") {
    # Zeilen des Typ-Abschnitts (`- **Name:** …`, Fortsetzung mit Einzug)
    if (line ~ /^- \*\*[^*]+\*\*/) {
      flush_item()
      it_name = line; sub(/^- \*\*/, "", it_name)
      it_val = substr(it_name, index(it_name, "**") + 2); it_name = substr(it_name, 1, index(it_name, "**") - 1)
      sub(/:$/, "", it_name); it_name = trim(it_name)
      if (it_name ~ /^Singleton/) it_name = "Singleton"
      sub(/^:/, "", it_val); it_val = trim(it_val)
      it_active = 1; it_line = FNR
    } else if (it_active && line ~ /^[ \t]+[^ \t]/) it_val = it_val " " trim(line)
    else flush_item()
    if (pl_active) {
      if (line ~ /^[ \t]+[^ \t]/) { pl_line = pl_line " " trim(line); emit_links(line, FNR, 0); next }
      flush_pflicht()
    }
    if (line ~ /^- \*\*Pflichtfelder:\*\*/) {
      pcount++; pl_active = 1
      pl_line = line; sub(/^- \*\*Pflichtfelder:\*\*/, "", pl_line)
      emit_links(line, FNR, 0); next
    }
    if (line ~ /^- \*\*Extends:\*\*/) {
      ecount++; v = line; sub(/^- \*\*Extends:\*\*[ \t]*/, "", v)
      if (match(v, /`[^`]+`/)) print "CE\t" FILENAME "\t" sec "\t" substr(v, RSTART + 1, RLENGTH - 2)
      else print "CX\t" FILENAME "\t" sec "\tExtends-Zeile ohne `eltern-typ`"
    }
    if (line ~ /^- \*\*Replaces type:\*\*/) {
      rcount++; v = line; sub(/^- \*\*Replaces type:\*\*[ \t]*/, "", v)
      if (match(v, /`[^`]+`/)) print "CR\t" FILENAME "\t" sec "\t" substr(v, RSTART + 1, RLENGTH - 2)
      else print "CX\t" FILENAME "\t" sec "\tReplaces-type-Zeile ohne `alter-typ`"
    }
  }
  # Feld-Zeilen und Zeile `Detail:` eines Register-Eintrags
  isdet = 0
  if (curid != "") {
    if (!iscat && line ~ /^- \*\*[^*]+\*\*/) {
      v = line; sub(/^- \*\*/, "", v); nm = substr(v, 1, index(v, "**") - 1); sub(/:$/, "", nm)
      v = substr(v, index(v, "**") + 2); sub(/^:/, "", v)
      print "RF\t" FILENAME "\t" curid "\t" trim(nm) "\t" trim(v)
    }
    # Consumer-Registrierungen: Zeile `- **Consumer` und ihre Folgezeilen
    if (!iscat && ftype == "contract-index") {
      if (line ~ /^- \*\*Consumer/) rlcons = 1
      else if (line ~ /^- \*\*/ || line ~ /^[ \t]*$/) rlcons = 0
      if (rlcons && line ~ /^[ \t]*(-[ \t]|\|)/) print "RL\t" FILENAME "\t" curid "\t" line
    }
    d = line; sub(/^[ \t]*-[ \t]+/, "", d); gsub(/\*/, "", d)
    if (d ~ /^Detail:/) isdet = 1
  }
  detlk = 0
  emit_links(line, FNR, isdet)
  if (isdet && !detlk) print "SECND\t" FILENAME "\t" curid "\t" FNR
}
END { flush_gt(); endsection() }
EOF

BOM=$(printf '\357\273\277')

extract() {
  # $1 Dateiliste; Ausgabe auf stdout
  while IFS= read -r f; do
    awk -v BOM="$BOM" -v OUTP="$2" -f "$AWK_EXTRACT" "$f"
  done < "$1"
}

# Dateinamen dürfen Leerzeichen enthalten, daher Schleife statt xargs.
extract "$LIST" "$OUTP" > "$DATA"

# --- Stichtag aus dem Herkunfts-Vermerk (Projekt, ohne --stichtag) ----------
# wiki/Aktivierter-Prozess.md, Abschnitt `## Herkunft`, feste Zeile
# `- **Template-Stand:** <Version> seit YYYY-MM-DD` — gelesen wird das
# Datum hinter `seit` (Init-Choreografie §Phase A0 „Herkunfts-Vermerk“);
# die Option geht vor.
STQ=""; HVBAD=""
if [ "$MODE" = projekt ] && [ -z "$STICHTAG" ]; then
  hvd=$(awk -F '\t' '$1 == "HV" && $3 == "Template-Stand" { print $4; exit }' "$DATA")
  case "$hvd" in
    "") ;;
    *" seit "*) hvd="${hvd#* seit }"; hvd="${hvd%%[!0-9-]*}"
      case "$hvd" in
        [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) STICHTAG="$hvd"; STQ="Aktivierter-Prozess" ;;
        *) HVBAD="seit $hvd" ;;
      esac ;;
    *) HVBAD="$hvd" ;;
  esac
fi

# --- Pass 1b: Nachbar-Repos aus §Komponenten (nur Projekt-Modus) -----------
# Datensätze: OWN repo | NBOK repo pfad | NBX repo grund |
#             N repo <FILE|FM|FML|QL|MK|RF|ID …>  (Nachbar-Daten)
if [ "$MODE" = projekt ]; then
  ROOT_ABS=$(cd "$ROOT" && pwd -P)
  awk -F '\t' '$1 == "KP" { print $4 "\t" $5 }' "$DATA" | sort -u > "$TMP/kp"
  : > "$TMP/nb"
  while IFS="$(printf '\t')" read -r repo pfad; do
    case "$repo" in ""|"-") continue ;; esac
    case "$pfad" in ""|"—"|"-") printf 'NBX\t%s\tkein Pfad in §Komponenten\n' "$repo" >> "$TMP/nb"; continue ;; esac
    case "$pfad" in /*) p="$pfad" ;; *) p="$ROOT/$pfad" ;; esac
    if [ ! -d "$p" ]; then printf 'NBX\t%s\tPfad %s nicht lesbar\n' "$repo" "$pfad" >> "$TMP/nb"; continue; fi
    pa=$(cd "$p" && pwd -P) || { printf 'NBX\t%s\tPfad %s nicht lesbar\n' "$repo" "$pfad" >> "$TMP/nb"; continue; }
    if [ "$pa" = "$ROOT_ABS" ]; then printf 'OWN\t%s\n' "$repo" >> "$TMP/nb"; continue; fi
    if [ "$OHNE_NACHBARN" -eq 1 ]; then printf 'NBX\t%s\t--ohne-nachbarn\n' "$repo" >> "$TMP/nb"; continue; fi
    if [ ! -d "$pa/wiki" ]; then printf 'NBX\t%s\tkein wiki/ unter %s\n' "$repo" "$pfad" >> "$TMP/nb"; continue; fi
    {
      find "$pa/wiki" -name '*.md' ! -path '*/wiki/templates/*'
      for f in "$pa"/output/nachrichten/*.md; do [ -f "$f" ] && printf '%s\n' "$f"; done
    } | sort -u > "$TMP/nlist"
    printf 'NBOK\t%s\t%s\n' "$repo" "$pa" >> "$TMP/nb"
    extract "$TMP/nlist" "" | awk -F '\t' -v R="$repo" \
      '$1 ~ /^(FILE|FM|FML|QL|MK|RF|ID)$/ { print "N\t" R "\t" $0 }' >> "$TMP/nb"
  done < "$TMP/kp"
  cat "$TMP/nb" >> "$DATA"
fi

# --- Pass 1c: Glossar-Begriffe in neuen Knoten (Glossar §Meta „Begriffs-Pflege“) -
# Nur Knoten mit `datum:` ab Stichtag; Wortgrenzen; Code entfernt.
if [ -n "$STICHTAG" ]; then
  awk -F '\t' '$1 == "GT" { print $3 "\t" $4 }' "$DATA" | sort -u > "$TMP/terms"
  if [ -s "$TMP/terms" ]; then
    awk -F '\t' -v S="$STICHTAG" '
      $1 == "FM" && $3 == "datum" && $4 >= S { neu[$2] = 1 }
      $1 == "FM" && $3 == "type" && ($4 == "glossary" || $4 == "glossary-review") { gl[$2] = 1 }
      END { for (f in neu) if (!(f in gl)) print f }' "$DATA" | sort > "$TMP/cand"
    cat > "$AWK_TERMS" <<'EOF'
function wordch(c) { return (c != "" && (index(W, c) > 0 || c > "\177")) }
{ sub(/\r$/, ""); if (FNR == 1 && substr($0, 1, 3) == BOM) $0 = substr($0, 4) }
FNR == NR { nt++; kind[nt] = $1; term[nt] = $2; next }
FNR == 1 { infm = ($0 == "---"); fence = 0; if (infm) next }
infm { if ($0 == "---" || $0 == "...") infm = 0; next }
/^[ \t]*(```|~~~)/ { fence = !fence; next }
fence { next }
{
  line = $0; gsub(/`[^`]*`/, "", line)
  for (i = 1; i <= nt; i++) {
    s = line; off = 0
    while ((p = index(s, term[i])) > 0) {
      b = (off + p > 1) ? substr(line, off + p - 1, 1) : ""
      a = substr(line, off + p + length(term[i]), 1)
      if (!wordch(b) && !wordch(a)) { print "VW\t" FILENAME "\t" FNR "\t" kind[i] "\t" term[i]; break }
      off += p; s = substr(s, p + 1)
    }
  }
}
EOF
    W='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_'
    while IFS= read -r f; do
      LC_ALL=C awk -F '\t' -v W="$W" -v BOM="$BOM" -f "$AWK_TERMS" "$TMP/terms" "$f"
    done < "$TMP/cand" >> "$DATA"
  fi
fi

# --- Pass 2: Prüfungen -----------------------------------------------------
cat > "$AWK_CHECK" <<'EOF'
BEGIN {
  FS = "\t"; nerr = 0; nhin = 0; nplatz = 0; nout = 0; nfiles = 0
  # Umlaute und ß, NFC und NFD (Basisvokal + kombinierendes Trema)
  UML = "(ä|ö|ü|Ä|Ö|Ü|ß|a" NFD "|o" NFD "|u" NFD "|A" NFD "|O" NFD "|U" NFD ")"
  # Katalog-Grammatik: Zeilen je Art und Klasse (Katalog.md, Tabelle
  # „Zeilen je Art und Klasse“). Spalten: Fassaden-Typ, Element,
  # Nachweis, außerhalb, Dokumenttyp; P Pflicht, K Kann, V verboten.
  # Singleton: Markierung, nur bei Singletons (eigene Zeile der Tabelle).
  RULE["Zweck"] = "PPPPP"; RULE["Extends"] = "VKKKV"; RULE["Replaces type"] = "KKKKV"
  RULE["Klasse"] = "VPPPV"; RULE["Freeze ab"] = "VPPVV"; RULE["Sammelzustand"] = "VPVVV"
  RULE["Pflichtfelder"] = "PPPPP"; RULE["Präfix"] = "PVVVV"; RULE["Empfohlen"] = "KKKKV"
  RULE["Optional"] = "KKKKV"; RULE["Dokumenttypen"] = "VPVVV"; RULE["Datei"] = "PKKKV"
  RULE["Singleton"] = "KKKKV"; RULE["Beispielname"] = "KKKKV"; RULE["Kanonizität"] = "KKKKV"
  RULE["Struktur-Konventionen"] = "KKKKV"; RULE["Ablage"] = "VKKKP"
  RULE["Phase"] = "VVVVP"; RULE["Verbindlichkeit"] = "VVVVP"; RULE["Grad"] = "VVVVP"
  RULE["Auslöser"] = "VVVVP"; RULE["Quell-Register und Filter"] = "VVVVP"
  KNAME[1] = "Fassaden-Typ eines Registers"; KNAME[2] = "Klasse Element"
  KNAME[3] = "Klasse Nachweis"; KNAME[4] = "Klasse außerhalb"; KNAME[5] = "Dokumenttyp"
  # Reihenfolge (Registerblock, Einzeltyp, Dokumenttyp-Block)
  n = split("Zweck|Replaces type|Pflichtfelder|Präfix|Datei|Singleton", oa, "|")
  for (i = 1; i <= n; i++) ORD[1, oa[i]] = i
  n = split("Zweck|Extends|Replaces type|Klasse|Freeze ab|Sammelzustand|Pflichtfelder|Empfohlen|Optional|Dokumenttypen|Datei|Singleton|Beispielname|Ablage|Kanonizität|Struktur-Konventionen", oa, "|")
  for (i = 1; i <= n; i++) { ORD[2, oa[i]] = i; ORD[3, oa[i]] = i; ORD[4, oa[i]] = i }
  n = split("Zweck|Phase|Verbindlichkeit|Grad|Auslöser|Quell-Register und Filter|Pflichtfelder|Ablage", oa, "|")
  for (i = 1; i <= n; i++) ORD[5, oa[i]] = i
  # Status-Werte, die ein Element als wirksam zählen (Register-Lebenszyklus)
  split("angenommen in-umsetzung umgesetzt abgeschlossen", oa, " ")
  for (i in oa) AKTIV[oa[i]] = 1
  # Listen-Felder (Wiki.md §4.1, Einträge `message`, Stand, BUG)
  split("supersedes superseded_by ueberlagert abgeleitet_von prueft alias herkunft an bezug gefunden_in", oa, " ")
  for (i in oa) LISTF[oa[i]] = 1
}
function trim(s) { sub(/^[ \t]+/, "", s); sub(/[ \t]+$/, "", s); return s }
function base(f,  b) { b = f; sub(/^.*\//, "", b); sub(/\.md$/, "", b); return b }
function bn(f,  b) { b = f; sub(/^.*\//, "", b); return b }
# Ketten-ID eines Stands: Dateiname ohne Endung und ohne `_VV_TLA`
function kid(f,  b) { b = bn(f); sub(/\.[A-Za-z0-9]+$/, "", b); sub(/_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]$/, "", b); return b }
function pkg(f,  p) {
  p = f
  if (match(p, /referenzprozesse\/[^\/]+\//)) return substr(p, RSTART + 17, RLENGTH - 18)
  return ""
}
# Paket-Grenze auf der Template-Quelle: sieht das Paket pf das Paket tf?
# Ja für die Basis, das eigene Paket und jedes Paket, das pf über die
# `extends:`-Kette der Steckbriefe erbt (pksb: Steckbrief je Paket,
# pkdir: Prozess-Kennung → Paket). Dateien ohne Paket (Root) sieht jeder.
function sichtbar(pf, tf,   q, s, n, i, j, m, d, e, earr) {
  if (tf == "" || tf == "base" || tf == pf) return 1
  n = 1; q[1] = pf; s[pf] = 1
  for (i = 1; i <= n; i++) {
    d = q[i]; if (!(d in pksb)) continue
    m = vals(pksb[d], "extends", earr)
    for (j = 1; j <= m; j++) {
      e = (earr[j] in pkdir) ? pkdir[earr[j]] : ""
      if (e == "") continue
      if (e == tf) return 1
      if (!(e in s)) { s[e] = 1; q[++n] = e }
    }
  }
  return 0
}
function inwiki(f) { return (f ~ /\/wiki\//) }
function isout(f) { return (OUTP != "" && substr(f, 1, length(OUTP)) == OUTP && index(substr(f, length(OUTP) + 1), "/") == 0) }
function isnach(f) { return (OUTP != "" && substr(f, 1, length(OUTP) + 12) == OUTP "nachrichten/") }
function slug(s) {
  s = tolower(s); gsub(/[`*_]/, "", s); gsub(/[^a-z0-9]+/, "-", s)
  sub(/^-+/, "", s); sub(/-+$/, "", s); return s
}
function rel(f) {
  if (substr(f, 1, length(ROOT) + 1) == ROOT "/") return substr(f, length(ROOT) + 2)
  return f
}
function fmget(f, k) { return ((f, k) in fm) ? fm[f, k] : "" }
function err(code, f, text) { out[++nout] = "FEHLER\t" code "\t" rel(f) ": " text; nerr++ }
function hin(code, f, text) { if (!OHNE) out[++nout] = "HINWEIS\t" code "\t" rel(f) ": " text; nhin++ }
# neue Knoten Fehler, Bestand Hinweis (Stichtags-Logik, Wiki.md §9 Bestandsschutz)
function befund(code, f, text) { if (bestand(f)) hin(code, f, text " — Bestand"); else err(code, f, text) }
# Katalog-Grammatik: auf der Template-Quelle immer Fehler, im Projekt mit
# Bestandsschutz (Katalog-Einträge des Anwenders aus der Zeit vor 2.0)
function katerr(code, f, text) { if (MODE == "template-quelle") err(code, f, text); else befund(code, f, text) }
function isplatz(t) {
  return (index(t, "<") > 0 || index(t, ">") > 0 || t ~ /-(XXX|NNN)$/ \
          || t ~ /-Knoten( |$)/ || t == "Wikilink" || t == "Wiki-Knoten" \
          || t == "…" || t == "...")
}
# Datum der Ketten-ID eines Dokuments in output/ (Anfang des Dateinamens)
function filedate(f,  b) { b = bn(f); if (b ~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]([ _.]|$)/) return substr(b, 1, 10); return "" }
function vvnum(f,  b) { b = base(f); if (match(b, /_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]$/)) return substr(b, RSTART + 1, RLENGTH - 5) + 0; return 0 }
# Dokumentname eines Stands: Segment nach dem Datum, vor `_VV_TLA` (MasterPrompt §3.1)
function dokname(f,  b) {
  b = base(f); sub(/_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]$/, "", b)
  sub(/^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] - /, "", b); sub(/ - .*$/, "", b); return b
}
function gegenstand(f,  b) {
  b = base(f); sub(/_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]$/, "", b)
  if (match(b, / - [^-]*$/) && index(b, " - ") < RSTART) return trim(substr(b, RSTART + 3)); return ""
}
# Umgebung eines Deploy-Stands (SP-1 Katalog-Deploy-Stand): `umgebung` im Kopf
# der Stand-Datei, sonst der Gegenstand des Dateinamens, sonst die Datei selbst
function umgvon(f,  u) {
  u = trim(fmget(f, "umgebung")); if (u == "") u = gegenstand(f); if (u == "") u = f
  return u
}
function bestand(f,  d) {
  if (STICHTAG == "") return 1
  d = trim(fmget(f, "datum"))
  if (d !~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/) d = ""   # anderes Format: wie fehlend (Hinweis am Stand)
  if (d == "" && isout(f)) d = filedate(f)        # Stand ohne `datum:`: Datum der Ketten-ID
  if (d == "") return 1
  return (d < STICHTAG)
}
# Wort w in Text s (Grenzen: kein Buchstabe, Ziffer, `_`, `-` daneben)
function hatwort(s, w,   p, b, a, off) {
  if (w == "") return 1
  off = 0
  while ((p = index(substr(s, off + 1), w)) > 0) {
    b = (off + p > 1) ? substr(s, off + p - 1, 1) : ""
    a = substr(s, off + p + length(w), 1)
    if (b !~ /[A-Za-z0-9_-]/ && a !~ /[A-Za-z0-9_-]/) return 1
    off += p
  }
  return 0
}
function namecheck(f, nm, hasfm) {
  if (nm !~ UML) return
  if (!hasfm) hin("DATEINAME-BESTAND", f, "Umlaut oder ß im Dateinamen (kein Stichtags-Feld)")
  else if (bestand(f)) hin("DATEINAME-BESTAND", f, "Umlaut oder ß im Dateinamen (Bestand)")
  else err("DATEINAME", f, "Umlaut oder ß im Dateinamen (neu)")
}
function chain(t,  r, g, n) {
  # Eltern-Kette Basis-zuerst; "ZYKLUS" bei Kreis
  r = t; n = 0
  while ((r in ext) && n < 50) { r = ext[r]; n++; if (r == t) return "ZYKLUS" }
  if (n >= 50) return "ZYKLUS"
  r = t; g = ""
  while (r != "") { g = r (g == "" ? "" : " " g); r = (r in ext) ? ext[r] : "" }
  return g
}
# erstes Wort einer Zeile (Lese-Regel a): ohne Code-Zeichen, Klammer, Satzzeichen
function fw(s) {
  s = trim(s); gsub(/[`*]/, "", s); sub(/[ (].*$/, "", s); sub(/[.,;:)]+$/, "", s); return s
}
# Zeilen-Wert eines Typs, auch geerbt über Extends
function clinh(t, nm,  r, n) {
  r = t; n = 0
  while (r != "" && n < 50) { if ((r, nm) in clv) return clv[r, nm]; r = (r in ext) ? ext[r] : ""; n++ }
  return ""
}
function idpfx(id,  p) { p = id; sub(/-.*$/, "", p); return p }
function stat(f) { return fw(fmget(f, "status")) }
function wirksam(f) { return ((stat(f) in AKTIV) && fmget(f, "superseded_by") == "") }
# Listen-Werte eines Felds (ohne `[]`, Wikilink-Klammern entfernt)
function vals(f, k, arr,   v, n, i, m, w) {
  v = fmget(f, k); gsub(/\[\[|\]\]/, "", v)
  n = split(v, tmpa, "|"); m = 0
  for (i = 1; i <= n; i++) { w = trim(tmpa[i]); if (w != "" && w != "[]" && w != "—" && w != "-") arr[++m] = w }
  return m
}
# lokale ID auflösen (auch über `alias:`); RALIAS = 1 bei Alias
function resolve(w,  id) {
  RALIAS = 0; id = w
  if (match(id, /^[A-Z][A-Z]+-[0-9]+/)) id = substr(id, RSTART, RLENGTH); else return ""
  RID = id
  if (id in byid) { split(byid[id], rsa, "\t"); return rsa[1] }
  if (id in aliasof) { RALIAS = 1; RID = idof[aliasof[id]]; return aliasof[id] }
  return ""
}
# qualifizierter Verweis <repo>/<ID>: Datei beim Nachbarn, "" wenn fehlt,
# "?" ohne Lesezugriff, sonst lokale Datei (Qualifizierer = eigenes Repo).
# Ein Register-Eintrag ohne Detail-Knoten ist zulässig: dann die Datei der
# Fassade und QFAS = 1 (Status steht an der Fassade).
function qresolve(r,  repo, id, g) {
  repo = substr(r, 1, index(r, "/") - 1); id = substr(r, index(r, "/") + 1)
  QREPO = repo; QFAS = 0
  if (repo == OWN && OWN != "") {
    g = resolve(id); if (g == "" && (id in regid)) { QFAS = 1; g = regf[id] }
    return g
  }
  if (repo in nbok) {
    if ((repo, id) in nbyid) return nbyid[repo, id]
    if ((repo, id) in nbreg) { QFAS = 1; return nbreg[repo, id] }
    return ""
  }
  return "?"
}
# Repo-Name, den der Lint als Qualifizierer kennt (eigenes Repo, §Komponenten)
function bekanntrepo(r) { return ((r == OWN && OWN != "") || (r in kprepo) || (r in nbok) || (r in nbx)) }
function midx(m) { return (m in mark) ? mark[m] : 0 }
# Geltung ab einer Marke (Zielmarken §Meta, Pflichtfeld `zielmarke:` und
# Zwischenmarke): ein Wert `zielmarke: z` gilt für Marke M, wenn z nicht
# später als M liegt — eine Sackgasse gilt nur für sich selbst (sie ist
# keine Vormarke der späteren Marken). Gelesen wird der Wert, nicht die
# laufende Marke; ein leerer Wert ist ein Bestands-Element ohne Feld
# (`zielmarke:` ist seit 2.0 Pflicht, fehlend meldet die Feld-Prüfung) und
# wird als Nachfolger ab der laufenden Marke gewertet — Bestandsschutz
# (Einfrieren-und-Abloesen §Stand). Rückgabe wie der Index-Vergleich:
# 1 = gilt, 0 = gilt nicht; unbekannte Marke: gilt
function zgilt(z, M,   zi, mi) {
  zi = (z != "") ? midx(z) : midx(inprog); mi = midx(M)
  if (zi == 0 || mi == 0) return 1
  if (z == "" ) z = inprog
  if (zi > mi) return 0
  if (z != M && (z in sackg)) return 0
  return 1
}
# Marke eines Nachfolgers: `zielmarke:` (ein Vermerk „Zielmarke <M>
# (nachgetragen)“ ist vorher ins Feld gelesen); ein Bestands-Nachfolger ohne
# Feld mit dem Vermerk „Ablösung von <E> gilt ab Marke <M>“ (Antwort des
# Anwenders, Einfrieren-und-Abloesen §Ablösung) gilt ab M wie mit
# `zielmarke: M`; ohne Vermerk "" (Bestands-Lesart: ab der laufenden Marke)
function nzm(f,  z) {
  z = trim(fmget(f, "zielmarke"))
  if (z == "" && (f in abm) && (abm[f] in mark)) z = abm[f]
  return z
}
# Lesbare Marken-Angabe eines Nachfolgers für Meldungen: Feld oder Vermerk
function nzmtxt(f,  z) {
  z = trim(fmget(f, "zielmarke"))
  if (z != "") return "`zielmarke: " z "`"
  if ((f in abm) && (abm[f] in mark)) return "Vermerk: Ablösung gilt ab Marke " abm[f]
  return "ohne `zielmarke:`"
}
# Nächste Vormarke vor Index mi (Eintrags-Reihenfolge, Sackgassen übersprungen)
function vormarke(mi,   mm) {
  for (mm = mi - 1; mm >= 1; mm--) if (!(markn[mm] in sackg)) return markn[mm]
  return ""
}
# Gilt ein Nachfolger des abgelösten Elements g0 für Marke M? (Lesart der
# Marken-Regel: `zielmarke: N` gilt ab N entlang der Vormarken-Kette, ein
# Bestands-Nachfolger ohne Feld ab der laufenden Marke; Marke unbekannt:
# jede Ablösung zählt; Sackgasse: nur für sich)
function nachfolger_gilt(g0, M,   mi, m2, q, r0, z, sarr3) {
  mi = midx(M); if (mi == 0) return 1
  m2 = vals(g0, "superseded_by", sarr3); if (m2 == 0) return 1
  for (q = 1; q <= m2; q++) {
    # Nachfolger ohne Detail-Knoten (Register-Eintrag, Einfrieren-und-Abloesen
    # §Ablösung): die Marke aus dem Feld `Zielmarke` des Eintrags
    r0 = resolve(sarr3[q])
    if (r0 != "") z = nzm(r0); else z = (sarr3[q] in regid) ? eintragzielmarke(regf[sarr3[q]], sarr3[q]) : ""
    if (zgilt(z, M)) return 1
  }
  return 0
}
# Schreibweise einer Stand-Datei auf den Dateinamen ohne Endung bringen —
# wie im Feld „Verweise“ eines Freigabe-Eintrags (Entscheidungen Meta
# „Freigabe-Einträge“; `nennt()`): Wikilink `[[…]]` (mit Alias), Pfad unter
# output/ und Endung `.md` werden abgestreift
function standname(x,  p) {
  x = trim(x); gsub(/`/, "", x)
  if (x ~ /^\[\[.*\]\]$/) { x = substr(x, 3, length(x) - 4); p = index(x, "|"); if (p > 0) x = substr(x, 1, p - 1) }
  sub(/^.*\//, "", x); sub(/\.md$/, "", x)
  return trim(x)
}
# Stand-Datei eines nachgetragenen Deploy-Stands (Zielmarken §Meta, Nachtrag)
# und des Vermerks „Umgesetzt mit Stand …“ einer Fix-Anforderung auf einen
# Deploy: x ist der Dateiname (`<Datum> - Deploy-Stand - <Umgebung>_VV_TLA`)
# in einer der Schreibweisen von `standname()` oder nur die Version `VV_TLA`
# — dann die einzige Stand-Datei mit dieser Version und ⟨Artefakt⟩
# „Deploy-Stand“; tragen mehrere Deploy-Stände die Version, ist das Ergebnis
# leer und `ntamb` gesetzt (die Meldung sagt dann „nicht eindeutig“)
function nachtragstand(x,  ff, b, vers, nc, cand) {
  ntamb = 0; x = standname(x)
  vers = x; if (!match(vers, /[0-9][0-9]+_[A-Za-z][A-Za-z][A-Za-z]$/)) return ""
  vers = substr(vers, RSTART); nc = 0; cand = ""
  for (ff in stand) {
    b = base(ff); if (b == x) return ff
    if (substr(b, length(b) - length(vers)) == "_" vers && artefakt_passt("Deploy-Stand", ff)) { cand = ff; nc++ }
  }
  if (nc > 1) ntamb = 1
  return (nc == 1) ? cand : ""
}
# Überholt-Regel mit Marken-Bezug (Einfrieren-und-Abloesen §Überholt-Regel):
# Stand f ist für Marke M überholt, wenn ein verwiesenes Element abgelöst ist
# und der Nachfolger für M gilt, oder ein Vorgänger-Stand (`herkunft`) für M
# überholt ist. Ältere Version nach dem Nachtrag: Ist die Marke von f
# abgeschlossen und nennt `herkunft` eine ältere Version eines Stands,
# dessen Ketten-ID eine jüngere Version mit derselben Marke hat (ein
# weiterer Deploy-Stand derselben Umgebung im Nachtrag, Zielmarken §Meta),
# wird der Vorgänger als diese jüngste Version gelesen — der Abschluss-Stand
# bleibt eingefroren und ist dadurch nicht überholt. Rückgabe: Grund oder ""
# (Merker uebm, Zyklus-sicher).
function ueberholt(f, M,   key, j, g0, n, i, w, p, r, harr, q) {
  key = f SUBSEP M
  if (key in uebm) return uebm[key]
  uebm[key] = ""
  for (j = 1; j <= nstref[f]; j++) {
    g0 = stref[f, j]
    if (fmget(g0, "superseded_by") != "" && nachfolger_gilt(g0, M)) { uebm[key] = idof[g0] " abgelöst, Nachfolger gilt für " M; return uebm[key] }
  }
  n = vals(f, "herkunft", harr)
  for (i = 1; i <= n; i++) {
    w = harr[i]; p = OUTP w
    if ((p in stand) && kid(w) != kid(f)) {
      q = nachtragversion(f, p); if (q != "") p = q
      r = ueberholt(p, M); if (r != "") { uebm[key] = "Vorgänger-Stand " w " überholt"; return uebm[key] }
    }
  }
  return ""
}
# Jüngste Version der Ketten-ID von Stand p mit derselben Marke wie p, wenn
# die Marke des verweisenden Stands f abgeschlossen ist und p nicht selbst
# die jüngste Version ist (Nachtrag: weiterer Deploy-Stand derselben
# Umgebung); sonst ""
function nachtragversion(f, p,   b, dn, q) {
  if (!(trim(fmget(f, "marke")) in abgeschl)) return ""
  b = base(p); dn = b
  if (match(b, /_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]$/)) dn = substr(b, 1, RSTART - 1)
  if (!(dn in neuf)) return ""
  q = neuf[dn]
  if (q == p || trim(fmget(q, "marke")) != trim(fmget(p, "marke"))) return ""
  return q
}
# Phase eines Dokumenttyps (Katalog-Zeile `Phase`): P<n> → n, Marken-Abschluss → 99
function phnum(t,  v) { v = fw(clv[t, "Phase"]); if (v ~ /^P[0-9]+$/) return substr(v, 2) + 0; if (v == "Marken-Abschluss") return 99; return 0 }
# Freigabe-Zweck eines Dokumenttyps ohne „für “ (Lese-Regel b); Platzhalter
# wie „K“ am Ende entfernt (für den Start von K)
function katzweck(t,  v, p, q) {
  v = clv[t, "Zweck"]; p = index(v, "„für "); if (p == 0) return ""
  v = substr(v, p + length("„für ")); q = index(v, "“"); if (q > 0) v = substr(v, 1, q - 1)
  v = trim(v); if (v ~ / [A-Z]$/) v = substr(v, 1, length(v) - 2)
  return v
}
# Phasen-Angaben `Pn` eines Zwecks als „ P5 P6 “ (leer: „ “)
function phasen(s,  out) { out = " "; while (match(s, /P[0-9]+/)) { out = out substr(s, RSTART, RLENGTH) " "; s = substr(s, RSTART + RLENGTH) }; return out }
# Zweck gegen den Katalog-Zweck (Entscheidungen Meta „Freigabe-Einträge“): an der Phasen-Angabe
# gelesen — eine genannte Phase des Eintrags trifft eine des Katalogs; ohne
# Phasen-Angabe im Katalog (Übergabe, Abschluss-Stand) Präfix-Vergleich
function zweckpasst(t, z,  zw, zpk, zpz, n, i, zarr) {
  zw = katzweck(t); if (zw == "") return 0
  zpk = phasen(zw); zpz = phasen(z)
  if (zpk != " " && zpz != " ") {
    n = split(trim(zpz), zarr, " ")
    for (i = 1; i <= n; i++) if (index(zpk, " " zarr[i] " ") > 0) return 1
    return 0
  }
  return (substr(z, 1, length(zw)) == zw)
}
# kanonischer Vergleichsname einer Komponente: Repo-Name (klein), wenn der
# Name eine Zeile in §Komponenten hat, sonst der Name selbst (klein)
function kanon(x,  lx) { lx = tolower(trim(x)); return (lx in kpn2r) ? tolower(kpn2r[lx]) : lx }
# Name als Wort in einem Text (klein), in beiden Namensformen; qualifizierte
# Verweise `<repo>/<ID>` (z.B. `quelle: terminal/MSG-001`) zählen nicht als Nennung
function regist(txt, nm,  ln) {
  ln = tolower(trim(nm)); txt = tolower(txt); gsub(/[a-z0-9_.-]+\/[a-z][a-z]+-[0-9]+/, " ", txt)
  if (hatwort(txt, ln)) return 1
  if ((ln in kpn2r) && hatwort(txt, tolower(kpn2r[ln]))) return 1
  if ((ln in kpr2n) && hatwort(txt, tolower(kpr2n[ln]))) return 1
  return 0
}
# Lieferung der Komponente e zu Marke M gebucht? Spalte Komponente (Repo- oder
# Komponenten-Name) oder Wort in einer Listenzeile
function geliefert(M, e,  le, lr) {
  le = tolower(trim(e)); lr = kanon(e)
  if (index(mklk[M], "|" le "|") > 0 || index(mklk[M], "|" lr "|") > 0) return 1
  if ((le in kpr2n) && index(mklk[M], "|" tolower(kpr2n[le]) "|") > 0) return 1
  return regist(mkl[M], e)
}
# Befund mit Stichtags-Schwere nach Datei fd, gemeldet an Datei fshow
function befund2(code, fd, fshow, text) { if (bestand(fd)) hin(code, fshow, text " — Bestand"); else err(code, fshow, text) }
# Stand-Datei eines Freigabe-Eintrags: Dateiname mit Version x in den Feldern
# des Eintrags (Feld „Verweise“ zuerst, bei mehreren die zu ⟨Artefakt⟩
# passende, sonst die im Dateinamen erste — unabhängig von der
# awk-Iterationsreihenfolge), sonst Version plus ⟨Artefakt⟩ in output/
# Nennt der Feldtext s die Stand-Datei ff — als Dateiname mit Endung `.md`
# (Entscheidungen Meta „Freigabe-Einträge“, Verweise) oder ohne Endung als
# ganzes Wort (Form der Nachtragszeile)?
function nennt(s, ff,  b, p, c) {
  if (index(s, bn(ff)) > 0) return 1
  b = base(ff); p = index(s, b); if (p == 0) return 0
  c = substr(s, p + length(b), 1)
  return (c == "" || c !~ /[A-Za-z0-9_-]/)
}
function standfile(f, id, x, a,  n2, j, pass, fld, ff, b, cand, nc) {
  n2 = split(rfn[f, id], rna, "\t")
  for (pass = 1; pass <= 2; pass++) {
    cand = ""
    for (j = 1; j <= n2; j++) {
      fld = rna[j]; if (fld == "") continue
      if ((pass == 1) != (fld ~ /^Verweis/)) continue
      for (ff in stand) {
        b = base(ff); if (substr(b, length(b) - length(x)) != "_" x) continue
        if (!nennt(rf[f, id, fld], ff)) continue
        if (artefakt_passt(a, ff)) return ff
        if (cand == "" || ff < cand) cand = ff
      }
    }
    if (cand != "") return cand
  }
  nc = 0; cand = ""
  for (ff in stand) { b = base(ff); if (substr(b, length(b) - length(x)) == "_" x) { if (artefakt_passt(a, ff)) return ff; cand = ff; nc++ } }
  return (nc == 1) ? cand : ""
}
# Ist die Stand-Datei sf eines Freigabe-Eintrags eindeutig bestimmt — ein Feld
# des Eintrags nennt sie, oder sie ist die einzige Stand-Datei mit der Version
# x und passendem ⟨Artefakt⟩? (Abgleich mit dem Nachtrag eines Deploy-Stands,
# unten: nur dieselbe Stand-Datei ist ein Doppel)
function standeindeutig(f, id, x, a, sf,  n2, j, fld, ff, b, nc, rnb) {
  n2 = split(rfn[f, id], rnb, "\t")
  for (j = 1; j <= n2; j++) { fld = rnb[j]; if (fld != "" && nennt(rf[f, id, fld], sf)) return 1 }
  nc = 0
  for (ff in stand) { b = base(ff); if (substr(b, length(b) - length(x)) == "_" x && artefakt_passt(a, ff)) nc++ }
  return (nc == 1)
}
# Umgebung der Stand-Dateien mit Version x und passendem ⟨Artefakt⟩, wenn alle
# dieselbe tragen (ein Freigabe-Eintrag nur mit Version nennt dann zwar keine
# eindeutige Datei, aber eine eindeutige Umgebung); sonst ""
function standumg(x, a,  ff, b, u, u0) {
  u0 = ""
  for (ff in stand) {
    b = base(ff); if (substr(b, length(b) - length(x)) != "_" x || !artefakt_passt(a, ff)) continue
    u = umgvon(ff); if (u0 == "") u0 = u; else if (u != u0) return ""
  }
  return u0
}
# ⟨Artefakt⟩ der Formel gegen die Stand-Datei: Dokumentname, Kennung oder
# Name des Katalog-Eintrags (`Katalog-<Name>`)
function artefakt_passt(a, ff,  t, kn) {
  t = stand[ff]; kn = base(ctf[t]); sub(/^Katalog-/, "", kn); a = tolower(a)
  return (a == tolower(dokname(ff)) || a == tolower(t) || a == tolower(kn))
}
# Datum eines Fassaden-Eintrags (Feld `Datum` oder Datum in der Status-Zeile)
function eintragdatum(f, id,  v) {
  v = rf[f, id, "Datum"]; if (match(v, /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/)) return substr(v, RSTART, RLENGTH)
  v = rf[f, id, "Status"]; if (match(v, /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/)) return substr(v, RSTART, RLENGTH)
  return ""
}
function eintragbestand(f, id,  d) { if (STICHTAG == "") return 1; d = eintragdatum(f, id); if (d == "") return 1; return (d < STICHTAG) }
# Anlage-Datum eines Register-Eintrags ohne Detail-Knoten (Katalog
# §Typ-Konventionen, Stichtags-Feld): Zeile `- **Angelegt:** YYYY-MM-DD`
# (auch `angelegt`); "" wenn fehlend oder nicht im Format
function eintraganlage(f, id,  v) {
  v = rf[f, id, "Angelegt"]; if (v == "") v = rf[f, id, "angelegt"]
  gsub(/[`*]/, "", v); v = trim(v)
  if (match(v, /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/)) return substr(v, RSTART, RLENGTH)
  return ""
}
# Zielmarke eines Fassaden-Eintrags (Zielmarken §Meta, Sitz; Entscheidungen
# Meta „Eintragsformat“): Feldzeile `- **Zielmarke:** M` (erstes Wort; auch
# in Kleinschreibung `zielmarke`) oder in der Status-Zeile („**Zielmarke M**“,
# „Zielmarke: M“); eine Klammer in der Überschrift ist nur Anzeige und wird
# nicht gelesen
function eintragzielmarke(f, id,  v) {
  v = rf[f, id, "Zielmarke"]; if (v == "") v = rf[f, id, "zielmarke"]
  gsub(/[`*]/, "", v); v = trim(v); sub(/[ \t(].*$/, "", v)
  if (v != "") return v
  v = rf[f, id, "Status"]
  if (match(v, /[Zz]ielmarke[*]*:?[*]*[ \t]+[^ \t*`()]+/)) { v = substr(v, RSTART, RLENGTH); sub(/^[Zz]ielmarke[*]*:?[*]*[ \t]+/, "", v); return v }
  # Heilweg: Vermerk „Zielmarke <M> (nachgetragen)“ am Eintrag (Zielmarken
  # §Meta) — gelesen wie das Feld
  if ((f, id) in zmve) return zmve[f, id]
  return ""
}
# `(seit <Marke>)` des Pflichtfelds `zielmarke` eines Typs ("" = kein Pflichtfeld)
function zmseit(t,  k, j, parr, p4) {
  if (!(t in req)) return ""
  k = split(req[t], parr, ",")
  for (j = 1; j <= k; j++) { split(parr[j], p4, "|"); if (p4[1] == "zielmarke") return (p4[4] != "") ? p4[4] : "-" }
  return ""
}
# Fehler an einem Freigabe-Eintrag; Einträge vor dem Stichtag: Hinweis (Bestandsschutz, Wiki.md §9)
function ordfehler(code, f, id, text) { if (eintragbestand(f, id)) hin(code, f, text " — Bestand"); else err(code, f, text) }
function ohnezugriff(repo, f, what) {
  if (!((repo, what) in ozseen)) { ozseen[repo, what] = 1; hin("OHNE-ZUGRIFF", f, what " bei `" repo "` nicht prüfbar: " ((repo in nbx) ? nbx[repo] : "nicht in §Komponenten")) }
}
# Für Marke Mx wirksame Pflicht-Stände der Phase k (Tab-Liste wie freif):
# eigene Freigabe, sonst die der nächsten Vormarke mit Freigabe (Übernahme);
# ein Verzicht auf dem Weg beendet die Suche (kein Stand wirksam).
# Herkunfts-Marke in WFM
function wirkfrei(Mx, k,  idx, l) {
  WFM = ""
  for (idx = midx(Mx); idx >= 1; idx--) {
    if (idx != midx(Mx) && (markn[idx] in sackg)) continue
    if ((markn[idx], "P" k) in verzicht) return ""
    if ((markn[idx], k) in frei) {
      l = freigilt(markn[idx], k, Mx); if (l == "") continue
      WFM = markn[idx]; return l
    }
  }
  return ""
}
# Freigaben der Marke M2 zur Phase k, die für Marke Mx gelten (Tab-Liste wie
# freif): eine abgelöste Freigabe (abgn: Detail-Knoten mit `superseded_by:`)
# nur, solange kein Nachfolger für Mx gilt — Marken-Regel (Kettenpruefung
# §Regel, Einfrieren-und-Abloesen §Ablösung); leer = keine Freigabe für Mx
function freigilt(M2, k, Mx,  n2, j, l, fa2) {
  n2 = split(freif[M2, k], fa2, "\t"); l = ""
  for (j = 1; j <= n2; j++) {
    if (fa2[j] == "") continue
    if (((M2, k, fa2[j]) in abgn) && nachfolger_gilt(abgn[M2, k, fa2[j]], Mx)) continue
    l = l "\t" fa2[j]
  }
  return l
}
# Weist ein Abschluss-Stand von M (jüngste Version je Ketten-ID, freigegeben
# oder nicht) den Tag der Vormarke M2 aus? Zeile mit „übernommen aus M2“
# (M2 als ganze Bezeichnung) und dem Tag-Namen von M2 oder dem Wort Tag
# bzw. Implementierung
function abschluss_tag(M, M2,  dn, ff, j, nj, l, p, c, nt, q, mta, ix, mx) {
  for (dn in neuf) {
    ff = neuf[dn]
    if (stand[ff] != "abschluss-stand" || trim(fmget(ff, "marke")) != M) continue
    nj = (ff in nmmu) ? nmmu[ff] : 0
    for (j = 1; j <= nj; j++) {
      l = mmu[ff, j]
      # Vormarke: M2 oder eine Marke zwischen M2 und M (mehrstufige
      # Übernahme nennt die unmittelbare Vormarke)
      for (ix = midx(M2); ix >= 1 && ix < midx(M); ix++) {
        mx = markn[ix]
        p = index(l, "bernommen aus " mx); if (p == 0) continue
        c = substr(l, p + length("bernommen aus " mx), 2)
        if (c ~ /^[A-Za-z0-9]/ || c ~ /^\.[0-9]/) continue
        if (hatwort(l, "Tag") || hatwort(l, "Tags") || index(l, "Implementierung") > 0) return 1
        nt = split(tagx[M2], mta, "\t")
        for (q = 1; q <= nt; q++) if (mta[q] != "" && index(l, mta[q]) > 0) return 1
      }
    }
  }
  return 0
}
$1 == "FILE" { files[$2] = 1; nfiles++; nm = base($2); names[nm] = names[nm] (names[nm] == "" ? "" : "\t") $2; if (inwiki($2)) wnames[nm] = 1; next }
$1 == "HV" { hvf = $2; hv[$3] = $4; next }
$1 == "NOFM" { nofm[$2] = 1; next }
$1 == "FM" {
  k = $3; if (k == "superseded-by") { altform[$2] = 1; k = "superseded_by" }
  if (($2, k) in fm) fm[$2, k] = fm[$2, k] "|" $4; else fm[$2, k] = $4
  if (k == "type" && !($2 in ftype)) ftype[$2] = $4
  if (k == "id") { idof[$2] = $4; if ($4 != "") byid[$4] = byid[$4] (byid[$4] == "" ? "" : "\t") $2 }
  if (k == "alias") aliasl[++nalias] = $2 "\t" $4
  next
}
$1 == "FML" { k = $3; if (k == "superseded-by") k = "superseded_by"; fml[$2, k] = 1; next }
$1 == "HD" { hd[$2, ++nhd[$2]] = $4; next }
$1 == "LK" { lk[++nlk] = $2 "\t" $3 "\t" $4 "\t" $5; next }
$1 == "ABV" { abv[$2, $3] = 1; next }
$1 == "BS" { bs[++nbs] = $2 "\t" $3; next }
$1 == "ID" { ids[++nids] = $2 "\t" $3 "\t" $4; next }
$1 == "IDH" { if (!(($2, $3) in idh)) idh[$2, $3] = $4; next }
$1 == "RF" { if (!(($2, $3, $4) in rf)) { rf[$2, $3, $4] = $5; rfn[$2, $3] = rfn[$2, $3] "\t" $4 } ; next }
$1 == "RL" { rl[$2, $3] = rl[$2, $3] "\n" $4; next }
$1 == "MKL" { if ($4 != "") mklk[$3] = mklk[$3] "|" tolower($4) "|"; else mkl[$3] = mkl[$3] "\n" tolower($5); nmkl++; next }
$1 == "MMU" { mmu[$2, ++nmmu[$2]] = $3; next }
$1 == "MMT" { mmt[$2] = 1; next }
$1 == "SECLK" { seclk[++nseclk] = $2 "\t" $3 "\t" $4; next }
$1 == "SECND" { secnd[++nsecnd] = $2 "\t" $3 "\t" $4; next }
$1 == "CT" {
  if ($3 in ctf) err("KAT-DOPPELT", $2, "Typ-Abschnitt `" $3 "` auch in " rel(ctf[$3]))
  else { ctf[$3] = $2; nct++ }
  nsec[$2]++; secs[$2] = secs[$2] (secs[$2] == "" ? "" : " ") $3
  next
}
$1 == "CP" { if (!($3 in cp)) cp[$3] = $4; next }
$1 == "CE" { ext[$3] = $4; next }
$1 == "CR" { rep[$3] = $4; repby[$4] = repby[$4] (repby[$4] == "" ? "" : ",") $3; next }
$1 == "CX" { cx[++ncx] = $2 "\t" $3 "\t" $4; next }
$1 == "CL" {
  if (ctf[$3] != $2) next
  if (!(($3, $4) in clv)) { clv[$3, $4] = $6; clln[$3, $4] = $5 }
  clc[$3, $4]++; clord[$3] = clord[$3] (clord[$3] == "" ? "" : "|") $4
  next
}
$1 == "GT" { nterm++; next }
$1 == "VW" { vw[++nvw] = $2 "\t" $3 "\t" $4 "\t" $5; next }
$1 == "KP" {
  for (i = 4; i <= 6; i++) if ($i == "-") $i = ""
  nkp++; kp[nkp] = $3 "\t" $4 "\t" $5 "\t" $6; kpf = $2
  # Namensabbildung Komponente ↔ Repo-Name (Katalog-Contract-Index „Namensformen“), ohne Groß-/Kleinschreibung
  if ($4 != "") { kprepo[$4] = $3; kpn2r[tolower($3)] = $4; kpr2n[tolower($4)] = $3 }
  next
}
$1 == "ENV" { env[$3] = 1; nenv++; envf = $2; next }
$1 == "MK" { if (!($3 in mark)) { mark[$3] = ++nmark; markn[nmark] = $3; markf = $2 } ; next }
$1 == "MKZ" { if (!($3 in mkz)) mkz[$3] = $4; else mkzdup[$3] = 1; next }
$1 == "MKZX" { if (!($3 in mkzx)) mkzx[$3] = $4; next }
$1 == "MKW" { if (!($3 in mkw)) mkw[$3] = $4; next }
$1 == "MKT" { if ($5 != "") { tagk[$3] = $5; tagx[$3] = tagx[$3] "\t" $4 "\t" $5; if ($7 != "") { tagfn[$3] = $7; tagfm[$3] = $8 } } else tagkx[$3] = $6; mktf[$3] = $2; mktl[$3] = $6; next }
$1 == "MKD" { mkd[++nmkd] = $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8; next }
$1 == "ABM" { if (!($2 in abm)) { abm[$2] = $4; abme[$2] = $3 } ; next }
$1 == "ZMV" { if ($3 == "") { if (!($2 in zmv)) zmv[$2] = $4 } else if (!(($2, $3) in zmve)) zmve[$2, $3] = $4; next }
$1 == "FXV" { if ($3 == "" && !($2 in fxv)) { fxv[$2] = $4; fxvm[$2] = $5 } ; next }
$1 == "MKR" { if (ruhe == "") { ruhe = $4; ruhef = $2; ruhel = $3 } ; next }
$1 == "MKF" { mkf[++nmkf] = $2 "\t" $3 "\t" $4; nmkfr++; next }
$1 == "QL" { ql[++nql] = $2 "\t" $3 "\t" $4; qlref[$4] = 1; next }
$1 == "SREF" { if (!(($2, $3) in srefseen)) { srefseen[$2, $3] = 1; sref[++nsref] = $2 "\t" $3 } ; next }
$1 == "OWN" { OWN = $2; ownrow = 1; next }
$1 == "NBOK" { nbok[$2] = $3; next }
$1 == "NBX" { nbx[$2] = $3; next }
$1 == "N" {
  r = $2
  if ($3 == "FM") {
    if ((r, $4, $5) in nfm) nfm[r, $4, $5] = nfm[r, $4, $5] "|" $6; else nfm[r, $4, $5] = $6
    if ($5 == "id") nbyid[r, $6] = $4
  } else if ($3 == "FILE") nfiles_n[r]++
  else if ($3 == "QL") nbql[r, $6] = 1
  else if ($3 == "MK") nbmark[r, $5] = 1
  else if ($3 == "RF") { if (!((r, $5, $6) in nrf)) nrf[r, $5, $6] = $7 }
  else if ($3 == "ID") { if (!((r, $4, "id") in nfm) && !((r, $6) in nbreg)) nbreg[r, $6] = $4 }
  next
}
END {
  n = split(KENNT, karr, ","); for (i = 1; i <= n; i++) if (karr[i] != "") kennt[karr[i]] = 1
  # Heilweg für ein vergessenes `zielmarke:` (Zielmarken §Meta): der Vermerk
  # „Zielmarke <M> (nachgetragen)“ an einem Knoten ohne Feld wird wie das Feld
  # gelesen — Pflichtfeld, Marken-Regel und Ablösungs-Wirkung lesen M; neben
  # einem gesetzten Feld ist er wirkungslos
  for (f in zmv) if (trim(fmget(f, "zielmarke")) == "") { fm[f, "zielmarke"] = zmv[f]; zmvf[f] = 1 }
  for (f in files) if (fmget(f, "type") == "catalog-entry") { art[f] = fmget(f, "art"); catfile[base(f)] = f }
  for (i = 1; i <= ncx; i++) { split(cx[i], c3, "\t"); katerr("KAT-GRAMMATIK", c3[1], "Abschnitt `" c3[2] "`: " c3[3]) }
  # --- Katalog-Konsistenz
  for (t in ctf) {
    if ((t in ext) && !(ext[t] in ctf)) err("KAT-EXTENDS", ctf[t], "`" t "` erweitert unbekannten Typ `" ext[t] "`")
    if ((t in ext) && chain(t) == "ZYKLUS") err("KAT-EXTENDS", ctf[t], "Vererbungs-Zyklus bei `" t "`")
    if ((t in rep) && !(rep[t] in ctf)) hin("KAT-REPLACES", ctf[t], "`" t "` ersetzt `" rep[t] "`, dessen Abschnitt fehlt im Katalog")
  }
  for (o in repby) if (index(repby[o], ",") > 0)
    err("KAT-REPLACES", (o in ctf) ? ctf[o] : ROOT, "`" o "` wird mehrfach ersetzt: " repby[o])
  # id-Format je Typ aus den Pflichtfeld-Zeilen
  for (t in cp) {
    k = split(cp[t], parr, ",")
    for (j = 1; j <= k; j++) { split(parr[j], p4, "|"); if (p4[3] != "") { prefixes[p4[3]] = t; if (p4[1] == "id") { fmt[t] = p4[3]; anyfmt[p4[3]] = t } } }
  }
  # --- Katalog-Grammatik: Art, Klasse, Zeilen je Art und Klasse, Werte
  for (f in art) {
    a = art[f]
    if (a != "register" && a != "dokumenttyp" && a != "einzeltyp") {
      # fehlendes `art:` meldet die Pflichtfeld-Prüfung (Typ `catalog-entry`)
      if (a != "") katerr("KAT-ART", f, "`art: " a "` unbekannt (register | dokumenttyp | einzeltyp)")
      continue
    }
    if (a == "dokumenttyp" && nsec[f] != 1) katerr("KAT-ART", f, "Dokumenttyp-Eintrag mit " (nsec[f] + 0) " Typ-Abschnitten (genau einer)")
  }
  for (t in ctf) {
    f = ctf[t]; if (!(f in art)) continue
    a = art[f]; kd = 0
    if (a == "dokumenttyp") kd = 5
    else if ((t, "Klasse") in clv) {
      kv = fw(clv[t, "Klasse"])
      kd = (kv == "Element") ? 2 : (kv == "Nachweis") ? 3 : (kv == "außerhalb") ? 4 : 0
      if (!kd) { katerr("KAT-WERT", f, "Abschnitt `" t "`: Klasse `" kv "` (Element | Nachweis | außerhalb)"); continue }
    } else if (a == "register") {
      kd = 1; nfac[f]++
      if (nfac[f] > 1) { katerr("KAT-ZEILE", f, "Abschnitt `" t "`: Klassen-Zeile fehlt (zweiter Abschnitt ohne Klasse im Register-Eintrag)"); continue }
      facof[f] = t
    } else if (a == "einzeltyp") { katerr("KAT-ZEILE", f, "Abschnitt `" t "`: Klassen-Zeile fehlt (Einzeltyp)"); continue }
    else continue
    kind[t] = kd
    for (nm in RULE) {
      if (nm == "Pflichtfelder") continue
      r = substr(RULE[nm], kd, 1)
      if (r == "P" && !((t, nm) in clv)) katerr("KAT-ZEILE", f, "Abschnitt `" t "`: Pflicht-Zeile `" nm "` fehlt (" KNAME[kd] ")")
      if (r == "V" && ((t, nm) in clv)) katerr("KAT-ZEILE", f, "Abschnitt `" t "` Zeile " clln[t, nm] ": `" nm "` ist bei " KNAME[kd] " verboten")
      if (((t, nm) in clc) && clc[t, nm] > 1) katerr("KAT-ZEILE", f, "Abschnitt `" t "`: Zeile `" nm "` mehrfach")
    }
    # Reihenfolge; Zusatzzeilen nach allen Block-Zeilen (Lese-Regel c)
    m = split(clord[t], oarr, "|"); last = 0; lastn = ""; zus = ""
    for (i = 1; i <= m; i++) {
      nm = oarr[i]
      if (!(nm in RULE)) { if (zus == "") zus = nm; continue }
      pos = ((kd, nm) in ORD) ? ORD[kd, nm] : 0
      if (pos == 0) continue
      if (pos < last) katerr("KAT-REIHENFOLGE", f, "Abschnitt `" t "`: `" nm "` steht nach `" lastn "`")
      else { last = pos; lastn = nm }
      if (zus != "" && zus != "-") { katerr("KAT-REIHENFOLGE", f, "Abschnitt `" t "`: Zusatzzeile `" zus "` vor der Block-Zeile `" nm "` (Lese-Regel c)"); zus = "-" }
    }
    # Werte (Lese-Regel a)
    if ((t, "Freeze ab") in clv) { v = fw(clv[t, "Freeze ab"]); if (v != "Anlage" && v != "angenommen" && v != "Abschluss") katerr("KAT-WERT", f, "Abschnitt `" t "`: Freeze ab `" v "` (Anlage | angenommen | Abschluss)") }
    if ((t, "Sammelzustand") in clv) { v = fw(clv[t, "Sammelzustand"]); if (v != "ja" && v != "nein") katerr("KAT-WERT", f, "Abschnitt `" t "`: Sammelzustand `" v "` (ja | nein)") }
    if (kd == 5) {
      v = fw(clv[t, "Phase"]); if (v != "" && v !~ /^P[0-9]+$/ && v != "Marken-Abschluss" && v != "—") katerr("KAT-WERT", f, "Abschnitt `" t "`: Phase `" v "` (P<n> | Marken-Abschluss | —)")
      vb = fw(clv[t, "Verbindlichkeit"]); if (vb != "" && vb != "pflicht" && vb != "optional") katerr("KAT-WERT", f, "Abschnitt `" t "`: Verbindlichkeit `" vb "` (pflicht | optional)")
      gr = fw(clv[t, "Grad"]); if (gr != "" && gr != "wiki-verweisend" && gr != "selbsttragend") katerr("KAT-WERT", f, "Abschnitt `" t "`: Grad `" gr "` (wiki-verweisend | selbsttragend)")
      grad[t] = gr; verb[t] = vb
      v = trim(clv[t, "Auslöser"]); if (v != "" && v !~ /^Standard/ && v !~ /^Angebots-Auslöser:/ && v !~ /^eigener Auslöser:/) katerr("KAT-WERT", f, "Abschnitt `" t "`: Auslöser beginnt nicht mit `Standard`, `Angebots-Auslöser:` oder `eigener Auslöser:`")
      if (vb == "pflicht" && index(clv[t, "Zweck"], "„für") == 0) katerr("KAT-WERT", f, "Abschnitt `" t "`: Zweck eines Pflicht-Stands ohne Freigabe-Zweck „für …“ (Lese-Regel b)")
      # Herkunftszeile (Einfrieren-und-Abloesen §Stand): wiki-verweisende Stände
      # tragen marke, datum, zweck, herkunft; selbsttragende marke, quell_stand
      need = (gr == "selbsttragend") ? "marke quell_stand" : (gr == "wiki-verweisend") ? "marke zweck herkunft datum" : ""
      k = split(need, narr, " ")
      for (j = 1; j <= k; j++) if (index("," cp[t], "," narr[j] "|") == 0) katerr("KAT-ZEILE", f, "Abschnitt `" t "`: Pflichtfeld `" narr[j] "` der Herkunftszeile fehlt (Grad " gr ")")
    }
    if (kd == 1) {
      v = trim(clv[t, "Präfix"])
      if (match(v, /^`[A-Z]+`/)) pv = substr(v, 2, RLENGTH - 2)
      else if (v ~ /^`—`/) pv = "—"
      else if (v ~ /^—/) { pv = "—"; katerr("KAT-WERT", f, "Abschnitt `" t "`: Präfix `—` ohne Code-Spanne (Lese-Regel a: `` `—` ``)") }
      else { katerr("KAT-WERT", f, "Abschnitt `" t "`: Präfix-Zeile ohne `XXX` oder `—` in Code-Spanne"); continue }
      facpfx[t] = pv
    }
  }
  for (f in art) if (art[f] == "register" && !(f in nfac)) katerr("KAT-ZEILE", f, "Register-Eintrag ohne Fassaden-Typ (Abschnitt ohne Klassen-Zeile mit Präfix-Zeile)")
  # Präfix-Zeile gegen das id-Format (auch über Einträge hinweg)
  for (t in facpfx) {
    f = ctf[t]; pv = facpfx[t]; m = split(secs[f], sarr, " "); found = 0
    for (i = 1; i <= m; i++) {
      s = sarr[i]; if (s == t || !(s in fmt)) continue
      found = 1
      if (pv == "—") katerr("KAT-PRAEFIX", f, "Präfix `—`, aber `" s "` trägt das id-Format `" fmt[s] "-NNN`")
      else if (fmt[s] != pv) katerr("KAT-PRAEFIX", f, "Präfix `" pv "` passt nicht zum id-Format `" fmt[s] "-NNN` von `" s "`")
    }
    if (pv != "—") {
      regpfx[pv] = t
      if (!found && !(pv in anyfmt)) katerr("KAT-PRAEFIX", f, "Präfix `" pv "`: kein Element-Typ mit id-Format `" pv "-NNN` im Katalog")
    }
  }
  # Dokumenttypen-Zeile (Lese-Regel d): Links auf Dokumenttyp-Einträge oder —
  for (t in kind) {
    if (!((t, "Dokumenttypen") in clv)) continue
    f = ctf[t]; v = clv[t, "Dokumenttypen"]; head = ""; d = 0; inl = 0
    for (i = 1; i <= length(v); i++) {
      c = substr(v, i, 1); c2 = substr(v, i, 2)
      if (c2 == "[[") inl = 1; else if (c2 == "]]") inl = 0
      if (c == "(") d++; else if (c == ")" && d > 0) d--
      if (c == "." && d == 0 && !inl && (i == length(v) || substr(v, i + 1, 1) == " ")) break
      head = head c
    }
    head = trim(head)
    if (head == "—") continue
    tok = ""; d = 0; nt = 0
    for (i = 1; i <= length(head) + 1; i++) {
      c = (i <= length(head)) ? substr(head, i, 1) : ","
      if (c == "(") d++; else if (c == ")" && d > 0) d--
      if (c == "," && d == 0) { tl[++nt] = trim(tok); tok = ""; continue }
      tok = tok c
    }
    for (j = 1; j <= nt; j++) {
      w = tl[j]
      if (w !~ /^\[\[[^]]+\]\]([ \t]*\(.*\))?$/) { katerr("KAT-GRAMMATIK", f, "Abschnitt `" t "`: Dokumenttypen-Zeile enthält `" w "` statt Wikilink oder `—` (Lese-Regel d)"); continue }
      tg = substr(w, 3, index(w, "]]") - 3); sub(/[|#].*$/, "", tg); tg = trim(tg)
      if ((tg in catfile) && art[catfile[tg]] != "dokumenttyp") katerr("KAT-GRAMMATIK", f, "Abschnitt `" t "`: Dokumenttypen-Zeile verlinkt [[" tg "]], kein Dokumenttyp-Eintrag")
    }
  }
  # aufgelöste Pflichtfelder je Typ (Basis-zuerst; `type`-Festwert des Kinds)
  for (t in ctf) {
    g = chain(t); if (g == "ZYKLUS") continue
    m = split(g, garr, " "); req[t] = ""
    for (i = 1; i <= m; i++) {
      if (!(garr[i] in cp)) continue
      k = split(cp[garr[i]], parr, ",")
      for (j = 1; j <= k; j++) {
        split(parr[j], p4, "|")
        if (p4[1] == "type" && garr[i] != t) continue
        req[t] = req[t] (req[t] == "" ? "" : ",") parr[j]
      }
    }
  }
  # --- Pflicht-Fassaden (Wiki.md §3a „mandatory“): in jedem Projekt
  # vorhanden und aktiv, mit und ohne Prozess — Zielmarken und
  # Entscheidungen, weil die Marke der Zwischenziel-Anker jeder Projektart
  # ist und Freigaben, Abschluss-Stand und Marken-Wechsel dort gebucht
  # werden (Marken, Zielmarken §Meta). Gelesen wird der `type:` der Dateien
  # unter wiki/; `active: false` zählt als fehlend.
  if (MODE == "projekt") {
    npf = split("facts|Facts|catalog|Katalog|facade-registry|Fassaden|internal-machinery-log|InterneMechanik|target-mark-log|Zielmarken|decision-log|Entscheidungen", pfa, "|")
    for (f in files) if (inwiki(f) && (f in ftype) && fmget(f, "active") != "false" && !(ftype[f] in pff)) pff[ftype[f]] = f
    for (j = 1; j < npf; j += 2) if (!(pfa[j] in pff))
      err("PFLICHT-FASSADE", ROOT "/wiki/" pfa[j + 1] ".md", "Pflicht-Fassade `" pfa[j + 1] "` (`type: " pfa[j] "`) fehlt oder ist deaktiviert — in jedem Projekt Pflicht, mit und ohne Prozess (Wiki.md §3a); ein Bestandsprojekt legt sie über den Upgrade-Weg an")
    # Abhängigkeit zwischen Fassaden (Wiki.md §3a „Abhängigkeiten“; SP-1
    # Steckbrief): die Fassade Fehlermeldungen (`bug-report-log`) setzt die
    # Fassade Anforderungen (`requirement-log`) voraus — die Behebung einer
    # Meldung ist dort eine Fix-Anforderung. Aktiv ohne Voraussetzung: Fehler.
    if (("bug-report-log" in pff) && !("requirement-log" in pff))
      err("PFLICHT-FASSADE", pff["bug-report-log"], "Fassade Fehlermeldungen (`type: bug-report-log`) ist aktiv, die vorausgesetzte Fassade Anforderungen (`type: requirement-log`) fehlt oder ist deaktiviert — wer kein Anforderungs-Register hat, braucht keine Fehlermeldungen: Anforderungen aktivieren oder Fehlermeldungen deaktivieren (Wiki.md §3a „Abhängigkeiten“)")
  }
  # --- Marken (Fassade der Zielmarken), Komponenten, Alias
  # Zustand je Marke (Zielmarken §Meta, Marken-Dreiklang): Zeile
  # `- **Zustand:** künftig | in-progress | zurückgestellt (für <Z>) |
  # abgeschlossen`, Zeiger `current` als Zusatz; maßgeblich ist das erste
  # Wort. Der Init legt die erste Marke an (Zustand in-progress); eine leere
  # Fassade ist ein Hinweis. Zwischenmarke (Zielmarken §Meta): die laufende
  # Marke ist `zurückgestellt (für <Zwischenmarke>)`, die Zwischenmarke
  # `in-progress` und trägt die Zeile `Zwischenmarke:` (Vorgänger | Sackgasse);
  # eine Sackgasse zählt für spätere Marken nicht als Vormarke (`sackg`).
  if (MODE == "projekt" && nmark == 0 && ("target-mark-log" in pff))
    hin("MARKE-ZUSTAND", pff["target-mark-log"], "keine Marke angelegt — der Init legt die erste Marke an (Zustand in-progress; Zielmarken §Meta, Marken); Marken-Regel, Ablösungs-Drift und Marken-Bezug der Kettenprüfung nicht geprüft")
  nip = 0; iplist = ""; nzg = 0
  for (i = 1; i <= nmark; i++) {
    b = markn[i]
    if (b in mkw) {
      ww = fw(mkw[b])
      if (ww == "Sackgasse") sackg[b] = 1
      else if (ww != "Vorgänger") hin("MARKE-ZUSTAND", markf, "Marke `" b "`: Zeile `Zwischenmarke:` mit `" mkw[b] "` — erwartet `Vorgänger von <Marke>` oder `Sackgasse` (Zielmarken §Meta, Zwischenmarke)")
    }
    if (!(b in mkz)) {
      hin("MARKE-ZUSTAND", markf, "Marke `" b "`: keine Zeile `- **Zustand:** …`" ((b in mkzx) ? " (andere Schreibung in Zeile " mkzx[b] ")" : "") " — Zustand nicht erkannt")
      continue
    }
    if (b in mkzdup) hin("MARKE-ZUSTAND", markf, "Marke `" b "`: Zeile `Zustand:` mehrfach (gelesen wird die erste)")
    zw = fw(mkz[b])
    if (zw == "in-progress") {
      nip++; iplist = iplist (iplist == "" ? "" : ", ") b
      if (inprog == "") inprog = b
    } else if (zw == "abgeschlossen") abgeschl[b] = 1
    else if (zw == "zurückgestellt") {
      nzg++; zv = ""
      if (index(mkz[b], "(") > 0) { zv = mkz[b]; sub(/^[^(]*\(/, "", zv); sub(/\).*$/, "", zv); gsub(/[`*]/, "", zv); zv = trim(zv); sub(/^für[ \t]+/, "", zv); zv = trim(zv) }
      if (zv == "") hin("MARKE-ZUSTAND", markf, "Marke `" b "`: `zurückgestellt` ohne Klammer `(für <Zwischenmarke>)` — Rückkehr nicht lesbar (Zielmarken §Meta, Zwischenmarke)")
      else zgz[b] = zv
    }
    else if (zw != "künftig") hin("MARKE-ZUSTAND", markf, "Marke `" b "`: Zustand `" mkz[b] "` (künftig | in-progress | zurückgestellt | abgeschlossen) — Zustand nicht erkannt")
  }
  # Ruhe (Zielmarken §Meta, Zeiger): keine Marke `in-progress` ist mit der
  # Ruhe-Zeile kein Hinweis; neben einer `in-progress`-Marke ist die Zeile
  # ein Hinweis (sie entfällt mit der neuen Marke)
  if (nmark > 0 && nip == 0 && ruhe == "") hin("MARKE-ZUSTAND", markf, "keine Marke `in-progress` erkannt — Marken-Regel für Bestands-Nachfolger ohne `zielmarke`, Ablösungs-Drift und Marken-Bezug der Kettenprüfung nicht geprüft (ruht das Projekt, trägt die Fassade die Zeile `- **Ruht seit:** YYYY-MM-DD`; Zielmarken §Meta, Zeiger)")
  if (ruhe != "" && nip > 0) hin("MARKE-ZUSTAND", ruhef, "Zeile " ruhel ": `Ruht seit: " ruhe "`, aber `" inprog "` ist `in-progress` — die Ruhe-Zeile entfällt mit der neuen Marke (Zielmarken §Meta, Zeiger)")
  if (ruhe != "" && ruhe !~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/) hin("MARKE-ZUSTAND", ruhef, "Zeile " ruhel ": `Ruht seit: " ruhe "` — Datum YYYY-MM-DD erwartet (Zielmarken §Meta, Zeiger)")
  if (nip > 1) hin("MARKE-ZUSTAND", markf, "mehrere Marken `in-progress` (" iplist ") — gelesen wird `" inprog "`")
  # Nachtrag „Tag korrigiert“ (Zielmarken §Meta, Nachtrag): nur an einer
  # abgeschlossenen Marke; vor dem Wechsel ist die Korrektur eine neue Version
  # des Abschluss-Stands. Gelesen werden alter und neuer Tag-Name (tagx);
  # der Tag der Marke ist der des jüngsten Nachtrags (tagk)
  for (b in tagk) if (b in mkz && !(b in abgeschl)) hin("MARKE-ZUSTAND", mktf[b], "Marke `" b "`: Nachtrag „Tag korrigiert: … → " tagk[b] "“, aber die Marke ist nicht abgeschlossen — vor dem Wechsel ist eine Tag-Korrektur eine neue Version des Abschluss-Stands (Zielmarken §Meta, Nachtrag; Wechsel-Prozedur Schritt 3)")
  for (b in tagkx) hin("MARKE-ZUSTAND", mktf[b], "Marke `" b "`, Zeile " tagkx[b] ": Nachtrag „Tag korrigiert“ ohne `<alt> → <neu>` — Tag-Namen nicht lesbar (Format: Zielmarken §Meta, Nachtrag)")
  if (nzg > 1) hin("MARKE-ZUSTAND", markf, "mehrere Marken `zurückgestellt` — nur die eine laufende Marke kann während einer Zwischenmarke zurückgestellt sein (Zielmarken §Meta, Zwischenmarke)")
  for (b in zgz) {
    if (!(zgz[b] in mark)) hin("MARKE-ZUSTAND", markf, "Marke `" b "`: zurückgestellt für `" zgz[b] "`, aber diese Marke gibt es nicht — Rückkehr nicht lesbar (Zielmarken §Meta, Zwischenmarke)")
    else if (zgz[b] != inprog) hin("MARKE-ZUSTAND", markf, "Marke `" b "`: zurückgestellt für `" zgz[b] "`, aber die Zwischenmarke ist nicht `in-progress` — nach ihrem Wechsel kehrt `in-progress` auf `" b "` zurück (Zielmarken §Meta, Wechsel-Prozedur Schritt 4)")
    else if (!(zgz[b] in mkw)) hin("MARKE-ZUSTAND", markf, "Zwischenmarke `" zgz[b] "`: keine Zeile `- **Zwischenmarke:** Vorgänger von " b "` bzw. `Sackgasse` — der Anwender entscheidet die Einreihung (Zielmarken §Meta, Zwischenmarke)")
    if (zgz[b] == inprog) zrueck = b        # die zurückgestellte Marke der laufenden Zwischenmarke
  }
  for (i = 1; i <= nkp; i++) { split(kp[i], k4, "\t"); kpname[k4[1]] = 1 }
  ownsrc = (OWN != "") ? "§Komponenten" : ""
  if (OWNARG != "") {
    if (OWN != "" && OWN != OWNARG) hin("EIGENES-REPO", kpf, "`--repo " OWNARG "`, aber die Zeile mit Pfad auf dieses Repo nennt `" OWN "` — gelesen wird `" OWNARG "`")
    OWN = OWNARG; ownsrc = "--repo"; ownrow = (OWN in kprepo)
    if (MODE == "projekt" && nkp > 0 && !ownrow)
      hin("OHNE-ZUGRIFF", kpf, "`--repo " OWNARG "`, aber keine Zeile für `" OWNARG "` in §Komponenten (Spalte Repo-Name) — SPEC- und DEPL-Deckung nicht geprüft")
  }
  if (OWN == "") for (f in files) if (isnach(f) && fmget(f, "von") != "") { OWN = fmget(f, "von"); ownsrc = "`von:` eigener Nachrichten"; break }
  if (MODE == "projekt" && OWN == "" && nkp > 0)
    hin("OHNE-ZUGRIFF", kpf, "eigenes Repo nicht erkannt (keine Zeile in §Komponenten, deren Pfad auf dieses Repo zeigt, keine eigene Nachricht; `--repo NAME` setzt es) — Nachrichten an das eigene Repo (C8), SPEC- und DEPL-Deckung nicht geprüft; ohne `fuer_marke:` Rolle unbekannt: Freigabe-Ordnung nur als Hinweis, Lieferungen nicht geprüft")
  # Register-Einträge (IDs in Fassaden; Register = Präfix-Zeile im Katalog);
  # vor den Instanzen, weil Verweise auch auf Einträge ohne Detail-Knoten zeigen
  for (i = 1; i <= nids; i++) {
    split(ids[i], i3, "\t"); f = i3[1]; ln = i3[2]; id = i3[3]
    if (f in idof) continue                   # Knoten mit eigener id: keine Fassade
    pfx = idpfx(id)
    if (!(pfx in regpfx)) continue            # kein Register-Präfix laut Katalog
    if (id !~ /^[A-Z]+-[0-9][0-9][0-9][0-9]*$/) err("PRAEFIX", f, "Zeile " ln ": Register-ID `" id "` entspricht nicht `" pfx "-NNN`")
    if ((f, id) in seenid) err("REG-ID-DOPPELT", f, "Zeile " ln ": `" id "` mehrfach als Eintrag")
    seenid[f, id] = 1; regid[id] = 1; regf[id] = f
    # Pflichtfeld `zielmarke:` am Eintrag ohne Detail-Knoten (Zielmarken §Meta,
    # Sitz: kanonisch der Fassaden-Eintrag): gelesen aus dem Feld `Zielmarke`
    # des Eintrags (eintragzielmarke). Stichtags-Feld ist das Anlage-Datum in
    # der Zeile `Angelegt` (Katalog §Typ-Konventionen): fehlt das Feld an
    # einem Eintrag mit Anlage-Datum ab Stichtag, Fehler; ohne Anlage-Datum
    # gilt der Eintrag als Bestand — Hinweis, Bestand und vergessenes Feld
    # sind dann nicht zu unterscheiden; die fehlende Zeile `Angelegt` selbst
    # ist ein Hinweis (Pflichtfeld seit 2.0). Nennt das Feld keine Marke:
    # Fehler wie ZIELMARKE am Detail-Knoten. Erst nach den Marken (mark).
    if (!(id in byid) && (pfx in anyfmt) && nmark > 0) {
      t = anyfmt[pfx]; seit = zmseit(t)
      if (seit != "") {
        z = eintragzielmarke(f, id); ad = eintraganlage(f, id)
        if (ad == "") hin("PFLICHTFELD-BESTAND", f, "Zeile " ln ": `" id "` ohne Detail-Knoten und ohne Zeile `Angelegt` im Eintrag — Anlage-Datum (Pflichtfeld seit 2.0, Katalog §Typ-Konventionen) fehlt; der Eintrag gilt als Bestand")
        if (z == "" && ad != "" && STICHTAG != "" && ad >= STICHTAG) err("PFLICHTFELD", f, "Zeile " ln ": `" id "` ohne Detail-Knoten und ohne Feld `Zielmarke` im Eintrag — Pflichtfeld `zielmarke`" ((seit != "-") ? " (seit " seit ")" : "") " fehlt an einem Eintrag ab dem Stichtag (Angelegt " ad "); " ((pfx == "DEC") ? "eine DEC ist mit der Buchung angenommen: es heilt der Vermerk" : "vor der Annahme ergänzen, danach heilt es der Vermerk") " `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)` am Eintrag (Zielmarken §Meta, Heilweg; Entscheidungen Meta „Eintragsformat“)")
        else if (z == "") hin("PFLICHTFELD-BESTAND", f, "Zeile " ln ": `" id "` ohne Detail-Knoten und ohne Feld `Zielmarke` im Eintrag — Pflichtfeld `zielmarke`" ((seit != "-") ? " (seit " seit ")" : "") " fehlt; Bestand" ((ad == "") ? " oder vergessen (kein Anlage-Datum, Stichtag nicht lesbar) — vor der Annahme ergänzen, danach heilt es der Vermerk `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)`; ohne Vermerk gilt der Eintrag als Bestand" : "") " (Zielmarken §Meta, Entscheidungen Meta „Eintragsformat“)")
        else if (!(z in mark)) err("ZIELMARKE", f, "Zeile " ln ": `" id "`: Zielmarke `" z "` — keine Marke `" z "` in den Zielmarken")
      }
    }
  }
  # Sitz-Regel mit Detail-Knoten (Zielmarken §Meta, Sitz): kanonisch ist der
  # Fassaden-Eintrag. Nennt das Feld `Zielmarke` des Eintrags (Feldzeile,
  # Status-Zeile oder Vermerk „nachgetragen“) eine Marke und weicht der Knoten
  # ab oder fehlt ihm das Feld, liest der Lint für alle weiteren Prüfungen
  # (Marken-Regel, Ablösungs-Wirkung, doppelte Nachfolger, Fehlerbehebung) die
  # Marke des Eintrags; der Wert des Knotens bleibt für die Drift-Meldung
  # (zdrift), ein fehlendes Feld bleibt PFLICHTFELD (zmiss). Nennt der
  # Eintrag keine Marke, bleibt es beim Knoten.
  for (id in regid) if (id in byid) {
    split(byid[id], zb2, "\t"); g0 = zb2[1]
    zf = eintragzielmarke(regf[id], id); if (zf == "") continue
    zk = trim(fmget(g0, "zielmarke"))
    if (zk == zf) continue
    if (zk == "") zmiss[g0] = zf; else zdrift[g0] = zk
    fm[g0, "zielmarke"] = zf
  }
  for (i = 1; i <= nalias; i++) {
    split(aliasl[i], a2, "\t"); w = a2[2]
    if (w == "" || w == "[]") continue
    if (w in byid) err("ALIAS", a2[1], "`alias: " w "` ist zugleich die id von " rel(byid[w]))
    else aliasof[w] = a2[1]
  }
  # --- Instanzen
  for (f in files) {
    nm = base(f)
    if ((f in nofm) || !(f in ftype)) {
      if (inwiki(f) && nm != "index" && nm != "log") hin("OHNE-TYP", f, "kein `type:` im Frontmatter")
      if (isnach(f)) err("NACHRICHT-TYP", f, "Datei in `output/nachrichten/` ohne `type: message`")
      if (inwiki(f)) namecheck(f, nm, 0)
      continue
    }
    namecheck(f, nm, 1)
    t = ftype[f]
    if (isnach(f) && t != "message") err("NACHRICHT-TYP", f, "`type: " t "` in `output/nachrichten/` (erwartet `message`)")
    # Altknoten aus 1.x unter wiki/ (Sprung 1.x → 2.0): bleiben im Bestand
    # unverändert lesbar, die Überführung wird angeboten — Hinweis statt
    # Fehler (Bestandsschutz); ein neuer Knoten dieser Art ab Stichtag
    # läuft in die normalen Prüfungen (TYP-UNBEKANNT, STAND-ORT)
    if (MODE == "projekt" && inwiki(f) && (t == "deployment" || t == "testplan") && bestand(f)) {
      if (t == "deployment") hin("ALTBESTAND", f, "`type: deployment` unter wiki/ ist ein Altknoten aus 1.x — bleibt lesbar (Bestandsschutz); Überführung anbieten: DEPL-Elemente im Register Deployments und Einträge in den Zielumgebungen (Katalog-Deployments, Katalog-Zielumgebungen)")
      else hin("ALTBESTAND", f, "`type: testplan` unter wiki/ ist ein Altknoten aus 1.x — bleibt lesbar (Bestandsschutz); Überführung anbieten: TEST-Elemente im Register Testfaelle, der nächste Testplan entsteht als Stand in output/ (Katalog-Testplan)")
      continue
    }
    if (!(t in ctf)) {
      if (isout(f)) hin("OUTPUT-TYP", f, "`type: " t "` hat keinen Katalog-Abschnitt (Lint-Richtung output/ → Dokumenttyp)")
      else err("TYP-UNBEKANNT", f, "`type: " t "` hat keinen Katalog-Abschnitt")
      continue
    }
    if (isout(f) && kind[t] != 5) hin("OUTPUT-TYP", f, "`type: " t "` in output/ ist kein Dokumenttyp")
    if (inwiki(f) && kind[t] == 5) err("STAND-ORT", f, "Dokumenttyp `" t "` unter wiki/ (Stände liegen in output/)")
    if (t in req) {
      k = split(req[t], parr, ",")
      for (j = 1; j <= k; j++) {
        split(parr[j], p4, "|"); fld = p4[1]
        if (fld == "") continue
        if (!((f, fld) in fm) || fm[f, fld] == "" || (fld == "zielmarke" && (f in zmiss))) {
          leer = ((f, fld) in fm) ? " ist leer" : " fehlt"
          # `datum` eines Stands ist Pflicht seit 2.0 (Einfrieren-und-Abloesen
          # §Stand), auch wo der Katalog-Eintrag kein „seit“ trägt
          seit = p4[4]; if (seit == "" && fld == "datum" && kind[t] == 5) seit = "2.0"
          # ohne `datum:` (Anlage-Datum) ist der Stichtag nicht lesbar (Katalog
          # §Typ-Konventionen): Bestand und vergessenes Feld sind dann nicht zu
          # unterscheiden; Heilweg für `zielmarke`: vor der Annahme ergänzen,
          # danach der Vermerk „Zielmarke <M> (nachgetragen)“ (Zielmarken §Meta)
          # eine DEC ist mit der Buchung angenommen (kein „vor der Annahme“);
          # bei einem Element mit Detail-Knoten gehört der Vermerk in den Knoten,
          # auch wenn der Fassaden-Eintrag die Marke zeigt oder den Vermerk trägt
          heil = (fld == "zielmarke") ? ((t == "decision") ? " — eine DEC ist mit der Buchung angenommen: es heilt der Vermerk `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)` in der Sektion Vermerke des Knotens (Zielmarken §Meta, Heilweg)" : " — vor der Annahme ergänzen, danach heilt es der Vermerk `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)` in der Sektion Vermerke des Knotens (Zielmarken §Meta, Heilweg)") "; ein Vermerk nur im Fassaden-Eintrag beendet den Fehler am Knoten nicht" : ""
          if (seit != "" && bestand(f)) hin("PFLICHTFELD-BESTAND", f, "Pflichtfeld `" fld "` (seit " seit ")" leer " — Bestand" ((!isout(f) && trim(fmget(f, "datum")) == "") ? " oder vergessen (kein `datum:`, Stichtag nicht lesbar)" heil ((fld == "zielmarke") ? "; ohne Vermerk gilt der Knoten als Bestand" : " — vor der Annahme ergänzen (Zielmarken §Meta)") : ""))
          else err("PFLICHTFELD", f, "Pflichtfeld `" fld "`" leer " (Typ `" t "`)" ((fld == "zielmarke" && (f in zmiss)) ? " — der Fassaden-Eintrag zeigt `Zielmarke: " zmiss[f] "`, der Lint liest sie (kanonisch ist der Eintrag, Zielmarken §Meta, Sitz); das Feld gehört auch in den Knoten" : "") heil)
          continue
        }
        if (p4[2] != "" && fm[f, fld] != p4[2]) err("FESTWERT", f, "`" fld ": " fm[f, fld] "` statt `" p4[2] "`")
        if (p4[3] != "" && fm[f, fld] !~ ("^" p4[3] "-[0-9][0-9][0-9][0-9]*$"))
          err("PRAEFIX", f, "`" fld ": " fm[f, fld] "` entspricht nicht `" p4[3] "-NNN`")
      }
    }
    # replaces_type: Spiegel-Regel laut Katalog §Typ-Konventionen „Ersetzung“
    if ((f, "replaces_type") in fm) {
      if (!(t in rep)) err("REPLACES-SPIEGEL", f, "`replaces_type: " fm[f, "replaces_type"] "` ohne Replaces-type-Zeile bei `" t "` im Katalog")
      else if (rep[t] != fm[f, "replaces_type"]) err("REPLACES-SPIEGEL", f, "`replaces_type: " fm[f, "replaces_type"] "` weicht vom Katalog (`" rep[t] "`) ab")
    } else if (t in rep) err("REPLACES-SPIEGEL", f, "Katalog: `" t "` ersetzt `" rep[t] "`, Frontmatter-Marker `replaces_type:` fehlt")
    # ersetzter Typ kommt nicht vor; Ausnahme laut Wiki.md §11.4 (Fassade mit active: false)
    if ((t in repby) && fmget(f, "active") != "false") {
      rt = repby[t]; sub(/,.*$/, "", rt)
      if (MODE == "template-quelle" && pkg(f) != "" && pkg(ctf[rt]) != pkg(f))
        hin("ERSETZT-PAKET", f, "`type: " t "` ist durch `" repby[t] "` (" pkg(ctf[rt]) ") ersetzt — greift erst beim Prozess-Merge")
      else err("ERSETZT", f, "`type: " t "` ist durch `" repby[t] "` ersetzt und kommt noch vor (nicht `active: false`)")
    }
    # berichte / vorgaenger: Ziele existieren und sind review-report
    split("vorgaenger berichte", lf, " ")
    for (j = 1; j <= 2; j++) {
      fld = lf[j]
      if (!((f, fld) in fm)) continue
      g = " " chain(t) " "
      if (fld == "vorgaenger" && index(g, " review-report ") == 0) continue
      if (fld == "berichte" && index(g, " convergence-report ") == 0) continue
      m = vals(f, fld, varr)
      for (i = 1; i <= m; i++) {
        w = varr[i]
        tf0 = resolve(w)
        if (tf0 == "") { err("BERICHT-ZIEL", f, "`" fld "`: `" w "` — kein Knoten mit `id: " RID "`"); continue }
        if (RALIAS) hin("ALIAS", f, "`" fld "`: `" w "` aufgelöst via alias (" RID ")")
        tt = (tf0 in ftype) ? ftype[tf0] : ""
        if (tt != "review-report") err("BERICHT-ZIEL", f, "`" fld "`: " RID " ist `" tt "`, nicht `review-report`")
      }
    }
    # `modell: anwender` (Ersatzweg, Reviewmuster §Schleife 2) ist kein Modell: C7 meldet nur gleiche Modelle
    if ((f, "modell") in fm && (f, "bau_modell") in fm && tolower(fm[f, "modell"]) == tolower(fm[f, "bau_modell"]) && tolower(fm[f, "modell"]) != "anwender")
      hin("C7-MODELL", f, "Prüf-Modell = Bau-Modell (`" fm[f, "modell"] "`) — Meldung für C7")
    # Listen-Felder sind Listen (Wiki.md §4.1)
    for (fld in LISTF) {
      if ((fld == "an" || fld == "bezug") && t != "message") continue
      if (fld == "gefunden_in" && t != "bug-report") continue
      if (fld == "herkunft" && kind[t] != 5 && t != "test-report") continue
      if (((f, fld) in fm) && !((f, fld) in fml) && trim(fm[f, fld]) != "")
        befund("LISTE", f, "`" fld ":` als Einzelwert statt Liste")
    }
    if (f in altform) { if (!bestand(f)) err("ABLOESUNG-ALTFORM", f, "`superseded-by:` (alte Form) statt `superseded_by:`") }
    # Sammelzustand nein: kein offen/aufgeschoben, kein trigger
    sz = fw(clinh(t, "Sammelzustand")); st = stat(f)
    if (sz == "nein" && (st == "offen" || st == "aufgeschoben" || ((f, "trigger") in fm)))
      befund("SAMMELZUSTAND", f, "`" t "` hat keinen Sammelzustand (Eintritts-Register): " (((f, "trigger") in fm) ? "`trigger:` gesetzt" : "Status `" st "`"))
    # Nachweise tragen keine zielmarke
    if (fw(clinh(t, "Klasse")) == "Nachweis" && ((f, "zielmarke") in fm))
      befund("ZIELMARKE-NACHWEIS", f, "Nachweis (`" t "`) trägt `zielmarke:` — abgeleitete Nachweise tragen die Marke als Herkunft")
    # zielmarke ohne Ziel
    if (((f, "zielmarke") in fm) && nmark > 0) {
      z = trim(fm[f, "zielmarke"]); if (z != "" && !(z in mark)) err("ZIELMARKE", f, "`zielmarke: " z "` — keine Marke `" z "` in den Zielmarken")
    }
    # `datum:` an Knoten außer Ständen (die prüft STAND-DATUM): anderes
    # Format als YYYY-MM-DD gilt für den Stichtag als fehlend (Bestand)
    if (!isout(f)) { d = trim(fmget(f, "datum")); if (d != "" && d !~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/) hin("DATUM-FORMAT", f, "`datum: " d "` — Format YYYY-MM-DD; für den Stichtag gilt der Knoten als Bestand") }
    # fuer_marke: <koordinator>:<marke>
    if ((f, "fuer_marke") in fm) { mkf[++nmkf] = f "\t\t" fm[f, "fuer_marke"]; if (!isnach(f)) nmkfr++ }
    # Ablösung beidseitig (supersedes ↔ superseded_by)
    split("supersedes superseded_by", af, " ")
    for (j = 1; j <= 2; j++) {
      fld = af[j]; gegen = (j == 1) ? "superseded_by" : "supersedes"
      m = vals(f, fld, varr)
      for (i = 1; i <= m; i++) {
        w = varr[i]; if (index(w, "/") > 0) { nqab++; continue }
        g0 = resolve(w)
        # Ziel ohne Detail-Knoten, aber als Register-Eintrag vorhanden
        # (Einfrieren-und-Abloesen §Ablösung: „hat der Nachfolger keinen
        # Detail-Knoten, steht die ID ohne Wikilink“): zulässig; Gegenseite
        # nicht prüfbar (kein Frontmatter), die Marke eines solchen Nachfolgers
        # liest nachfolger_gilt aus dem Eintrag
        if (g0 == "" && (w in regid)) continue
        if (g0 == "") { err("ABLOESUNG-ZIEL", f, "`" fld "`: `" w "` — kein Knoten und kein Register-Eintrag mit dieser id"); continue }
        if (RALIAS) hin("ALIAS", f, "`" fld "`: `" w "` aufgelöst via alias (" RID ")")
        mi = vals(g0, gegen, garr2); ok = 0
        for (q = 1; q <= mi; q++) { r0 = resolve(garr2[q]); if (r0 == f) ok = 1 }
        if (!ok) err("ABLOESUNG-BEIDSEITIG", f, "`" fld ": " w "`, aber " rel(g0) " trägt `" gegen ":` ohne " idof[f])
      }
    }
    # Überlagerung in einer Sackgasse (Zielmarken §Meta, Zwischenmarke): ein
    # Element mit der `zielmarke:` einer Sackgasse ersetzt per `ueberlagert:`
    # ein Element außerhalb der Sackgasse nur für sie; das überlagerte Element
    # bleibt unverändert (einseitig, kein Gegen-Feld). Merker `ueb[ID, Z]` =
    # überlagerndes Element für die Marken-Regel der Stände. Hinweise:
    # `ueberlagert:` ohne die `zielmarke:` einer Sackgasse; Ziel in derselben
    # Sackgasse (dort wird abgelöst); Ablösung über die Sackgassen-Grenze
    # (überlagern statt ablösen). Ziel ohne Knoten: Fehler wie ABLOESUNG-ZIEL.
    zs = trim(fmget(f, "zielmarke")); insack = (zs != "" && (zs in sackg))
    if ((f, "ueberlagert") in fm) {
      if (nmark > 0 && !insack && (zs == "" || (zs in mark)))
        hin("UEBERLAGERUNG", f, "`ueberlagert:` an einem Element " (zs == "" ? "ohne `zielmarke:`" : "mit `zielmarke: " zs "`, keiner Sackgasse") " — überlagert wird nur in einer Sackgasse, sonst ist es eine Ablösung (`supersedes:`; Zielmarken §Meta, Zwischenmarke)" ((zs != "" && (zs in mkw)) ? "; oder die Zeile `Zwischenmarke:` der Marke `" zs "` wurde nach der ersten Überlagerung auf `Vorgänger` geändert — sie ist seitdem fest (Zielmarken §Meta, Zeile `Zwischenmarke:`)" : ""))
      m = vals(f, "ueberlagert", varr)
      for (i = 1; i <= m; i++) {
        w = varr[i]; if (index(w, "/") > 0) continue
        g0 = resolve(w)
        if (g0 == "") {
          if (!(w in regid)) err("UEBERLAGERUNG-ZIEL", f, "`ueberlagert`: `" w "` — kein Knoten mit dieser id")
          else if (insack) ueb[w, zs] = ((f in idof) ? idof[f] : bn(f))
          continue
        }
        if (RALIAS) hin("ALIAS", f, "`ueberlagert`: `" w "` aufgelöst via alias (" RID ")")
        if (insack && trim(fmget(g0, "zielmarke")) == zs) hin("UEBERLAGERUNG", f, "`ueberlagert: " w "` — " idof[g0] " gehört selbst zur Sackgasse `" zs "`; innerhalb der Sackgasse wird abgelöst (`supersedes:`), nicht überlagert")
        else if (insack) ueb[idof[g0], zs] = ((f in idof) ? idof[f] : bn(f))
      }
    }
    if (insack) {
      m = vals(f, "supersedes", varr)
      for (i = 1; i <= m; i++) {
        w = varr[i]; if (index(w, "/") > 0) continue
        g0 = resolve(w); if (g0 == "") continue
        if (trim(fmget(g0, "zielmarke")) != zs) hin("UEBERLAGERUNG", f, "`supersedes: " w "` — " idof[g0] " gilt außerhalb der Sackgasse `" zs "`; in einer Sackgasse wird nicht abgelöst, sondern überlagert (`ueberlagert:`; Zielmarken §Meta, Zwischenmarke); oder die Zeile `Zwischenmarke:` der Marke `" zs "` wurde nach der ersten Ablösung auf `Sackgasse` geändert — sie ist seitdem fest (Zielmarken §Meta, Zeile `Zwischenmarke:`)")
      }
    }
    # Doppelte Nachfolger (Zielmarken §Meta, Zwischenmarke — doppelte
    # Nachfolger bei der Rückkehr; Einfrieren-und-Abloesen §Ablösung): zwei
    # Nachfolger aus verschiedenen Marken (`zielmarke:` verschieden), die für
    # dieselbe Marke M gelten und dort selbst nicht abgelöst sind — Fehler,
    # bis der Anwender gewählt hat. Keine Doppelung: die Teilung in mehrere
    # Nachfolger derselben Marke, Nachfolger für verschiedene Marken (etwa
    # einer in einer Sackgasse), Bestands-Nachfolger ohne Feld (nicht
    # vergleichbar).
    if (nmark > 0 && (f, "superseded_by") in fm) {
      ndm = vals(f, "superseded_by", ndarr); nd = 0
      if (ndm >= 2) for (ndmi = 1; ndmi <= nmark && nd == 0; ndmi++) {
        ndM = markn[ndmi]; nd1 = ""; nz1 = ""; nd2 = ""; nz2 = ""
        for (ndi = 1; ndi <= ndm; ndi++) {
          ndw = ndarr[ndi]; if (index(ndw, "/") > 0) continue
          ndg = resolve(ndw); if (ndg == "") continue
          ndz = nzm(ndg); if (ndz == "" || !(ndz in mark)) continue
          if (!zgilt(ndz, ndM)) continue
          if (fmget(ndg, "superseded_by") != "" && nachfolger_gilt(ndg, ndM)) continue
          if (nd1 == "") { nd1 = idof[ndg]; nz1 = ndz; ndg1 = ndg }
          else if (ndz != nz1) { nd2 = idof[ndg]; nz2 = ndz; ndg2 = ndg }
        }
        if (nd2 != "") {
          nd = 1
          err("NACHFOLGER-DOPPELT", f, idof[f] " hat zwei Nachfolger aus verschiedenen Marken, die beide für Marke " ndM " gelten: " nd1 " (" nzmtxt(ndg1) ") und " nd2 " (" nzmtxt(ndg2) ") — der Anwender wählt, welcher gilt (der Stand der Marke, die schon abgelöst hat, der andere Nachfolger oder die Zusammenführung), gebucht als Ablösung (Zielmarken §Meta: Zwischenmarke — doppelte Nachfolger bei der Rückkehr; Nachtrag — doppelte Nachfolger beim Nachtrag; Einfrieren-und-Abloesen §Ablösung)")
        }
      }
    }
    # Bestands-Nachfolger ohne `zielmarke:` während einer Zwischenmarke
    # (Einfrieren-und-Abloesen §Ablösung, Bestands-Nachfolger bei einer
    # Zwischenmarke; Zielmarken §Meta, Zwischenmarke): der Lint wertet die
    # Ablösung ab der laufenden Marke — der Zwischenmarke —, sie kann zur
    # zurückgestellten Marke gehören (vor dem Vorziehen gebucht). Hinweis
    # ABLOESUNG-BESTAND („Marke der Ablösung unbekannt“); der Agent fragt den
    # Anwender, die Antwort steht als Vermerk „Ablösung von <E> gilt ab Marke
    # <M> (Anwender <Datum>)“ am Nachfolger — mit Vermerk gilt der Nachfolger
    # ab M wie mit `zielmarke: M` (`nzm`), kein Hinweis; nennt der Vermerk
    # eine unbekannte Marke oder ein Element, das der Nachfolger nicht
    # ablöst, bleibt ein Hinweis
    if (inprog != "" && (inprog in mkw) && ((f, "supersedes") in fm) && trim(fm[f, "supersedes"]) != "" && trim(fmget(f, "zielmarke")) == "" && bestand(f) && !isout(f)) {
      if (f in abm) {
        if (nmark > 0 && !(abm[f] in mark)) hin("ABLOESUNG-BESTAND", f, "Vermerk „Ablösung von " abme[f] " gilt ab Marke " abm[f] "“ — keine Marke dieses Namens in den Zielmarken (Einfrieren-und-Abloesen §Ablösung)")
        r0 = resolve(abme[f]); rid0 = RID; ok = 0; m = vals(f, "supersedes", varr)
        for (i = 1; i <= m; i++) { if (varr[i] == abme[f] || varr[i] == rid0) ok = 1; else if (r0 != "" && resolve(varr[i]) == r0) ok = 1 }
        if (!ok) hin("ABLOESUNG-BESTAND", f, "Vermerk „Ablösung von " abme[f] " gilt ab Marke " abm[f] "“, aber `supersedes: " trim(fm[f, "supersedes"]) "` nennt " abme[f] " nicht — der Vermerk gehört zur Ablösung dieses Nachfolgers (Einfrieren-und-Abloesen §Ablösung)")
      }
      else hin("ABLOESUNG-BESTAND", f, "Marke der Ablösung unbekannt: Bestands-Nachfolger ohne `zielmarke:` während der Zwischenmarke `" inprog "` — der Lint wertet die Ablösung (`supersedes: " trim(fm[f, "supersedes"]) "`) ab der laufenden Marke, sie kann zur zurückgestellten Marke" ((zrueck != "") ? " `" zrueck "`" : "") " gehören: der Agent fragt den Anwender bei der ersten Meldung, spätestens bevor er einen Stand zu `" inprog "` bildet, zu welcher Marke die Ablösung gehört, und bucht die Antwort als Vermerk `- **Vermerk <Datum>:** Ablösung von <E> gilt ab Marke <M> (Anwender <Datum>)` am Nachfolger (Einfrieren-und-Abloesen §Ablösung; Zielmarken §Meta, Zwischenmarke)")
    }
    # BUG: fix_requirement (Katalog-Fehlermeldungen, Feld `fix_requirement`;
    # Fehlermeldungen §Meta „Zielmarke“): eine Liste — jede Anforderung, die
    # den BUG behebt: die Fix-Anforderung (`requirement_type: fix`) oder die
    # ablösende bzw. neue REQ (`functional`/`non-functional`); ein Einzelwert
    # liest sich als Liste mit einem Eintrag (Bestand). Je Eintrag: die
    # `zielmarke:` des BUG ist die Marke der Meldung — die Marke des
    # Produkt-Stands, an dem der Fehler beobachtet wurde —, die der REQ die
    # Marke der Behebung; sie liegt nicht vor der Marke des BUG
    # (Vormarken-Kette; eine Sackgasse ist nur für sich eine frühere Marke:
    # eine Behebung in ihrer Vormarke liegt vor ihr, eine Behebung in der
    # Sackgasse vor keiner anderen Marke — `zgilt`), sonst Fehler — ohne
    # Ausnahme: eine Behebung vor der
    # Meldung gibt es nicht, auch nicht in einer Zwischenmarke (die Zeile
    # `Zwischenmarke:` wird dafür nicht gelesen; Zielmarken §Meta,
    # Fehlerbehebung in der Zwischenmarke). Beidseitigkeit an jeder REQ: sie
    # nennt den BUG in `behebt:`, gleich welchen Typs — sonst Hinweis
    # (Anforderungen §Meta „Fehlerbehebungen“)
    if ((f, "fix_requirement") in fm) {
      nfr = vals(f, "fix_requirement", frarr)
      for (fri = 1; fri <= nfr; fri++) {
        w = frarr[fri]; if (index(w, "/") > 0) continue
        g0 = resolve(w)
        if (g0 == "" && (RID in regid)) continue   # Eintrag ohne Detail-Knoten: Marke steht an der Fassade, nicht verglichen
        if (g0 == "") { err("FIX-REQUIREMENT", f, "`fix_requirement: " w "` — weder Knoten noch Register-Eintrag mit dieser id"); continue }
        rq = RID                                  # resolve() unten überschreibt RID
        if (RALIAS) hin("ALIAS", f, "`fix_requirement`: `" w "` aufgelöst via alias (" rq ")")
        m = vals(g0, "behebt", varr); ok = 0
        for (i = 1; i <= m; i++) { r0 = resolve(varr[i]); if (r0 == f) ok = 1 }
        if (!ok && (f in idof)) hin("FIX-REQUIREMENT", f, "`fix_requirement: " w "`, aber die Anforderung " rq " nennt " idof[f] " nicht in `behebt:` — beide Verweise gehören zusammen, an jeder Anforderung, die den BUG behebt (Anforderungen §Meta „Fehlerbehebungen“)")
        z1 = trim(fmget(f, "zielmarke")); z2 = trim(fmget(g0, "zielmarke"))
        if (z1 != "" && z2 != "" && z1 != z2 && midx(z1) > 0 && midx(z2) > 0 && zgilt(z2, z1)) err("FIX-REQUIREMENT", f, "`zielmarke: " z1 "` (Marke des BUG — der Produkt-Stand, an dem der Fehler beobachtet wurde), die Anforderung " rq " zur Behebung trägt `zielmarke: " z2 "` — die Marke der Behebung liegt vor der Marke des BUG; eine Behebung vor der Meldung gibt es nicht, auch nicht in einer Zwischenmarke (Fehlermeldungen §Meta „Zielmarke“; Zielmarken §Meta, Fehlerbehebung in der Zwischenmarke)")
        else if ((z1 == "") != (z2 == "")) hin("FIX-REQUIREMENT", f, "`zielmarke:` nur an einem von BUG und " rq " gesetzt (das andere ist ein Bestands-Element ohne Feld; seit 2.0 ist das Feld Pflicht)")
      }
    }
    # BUG aus einem Test (Fehlermeldungen §Meta „Herkunft aus Tests“):
    # `gefunden_in:` nennt den Testbericht (TRES) und die TEST-ID; die `marke`
    # des Testberichts ist die Marke des BUG (Katalog-Fehlermeldungen, Feld
    # `zielmarke`; Katalog-Testberichte, `marke`) — eine Abweichung ist ein
    # Hinweis; ob die Marke den beobachteten Stand nennt, prüft der Lint sonst
    # nicht (Betriebsmeldung: kein lesbarer Träger am BUG)
    if (t == "bug-report" && ((f, "gefunden_in") in fm)) {
      z1 = trim(fmget(f, "zielmarke"))
      m = vals(f, "gefunden_in", varr)
      for (i = 1; i <= m && z1 != ""; i++) {
        w = varr[i]; if (index(w, "/") > 0 || idpfx(w) != "TRES") continue
        g0 = resolve(w); if (g0 == "" || ftype[g0] != "test-report") continue
        z2 = trim(fmget(g0, "marke"))
        if (z2 != "" && z2 != z1) hin("MARKE-HERKUNFT", f, "`zielmarke: " z1 "`, der Testbericht " RID " in `gefunden_in:` trägt `marke: " z2 "` — ein BUG aus einem Test trägt die Marke des getesteten Stands, die `marke` des Testberichts (Fehlermeldungen §Meta „Zielmarke“; Katalog-Testberichte)")
      }
    }
    # Anforderung mit `behebt:` (Katalog-Anforderungen): jede Anforderung,
    # die einen BUG behebt — Fix-Anforderung (`requirement_type: fix`; ohne
    # `behebt:` Hinweis) oder ablösende bzw. neue REQ — nennt die BUG in
    # `behebt:`; ein Ziel ohne Knoten und ohne Register-Eintrag: Fehler;
    # Beidseitigkeit: der BUG nennt die REQ in seiner Liste `fix_requirement:`
    if (fw(fmget(f, "requirement_type")) == "fix" && vals(f, "behebt", varr) == 0)
      hin("FIX-REQUIREMENT", f, "`requirement_type: fix` ohne `behebt:` — eine Fix-Anforderung nennt die BUG, die sie behebt (Katalog-Anforderungen; Anforderungen §Meta „Fehlerbehebungen“)")
    if ((f, "behebt") in fm) {
      m = vals(f, "behebt", varr)
      for (i = 1; i <= m; i++) {
        w = varr[i]; if (index(w, "/") > 0) continue
        g0 = resolve(w)
        if (g0 == "" && !(RID in regid)) err("FIX-REQUIREMENT", f, "`behebt: " w "` — weder Knoten noch Register-Eintrag mit dieser id")
        else if (g0 != "" && RALIAS) hin("ALIAS", f, "`behebt`: `" w "` aufgelöst via alias (" RID ")")
        # Beidseitigkeit: der BUG verweist mit `fix_requirement:` (Liste) zurück
        else if (g0 != "" && (f in idof)) {
          nfr = vals(g0, "fix_requirement", frarr); ok = 0
          for (fri = 1; fri <= nfr; fri++) { r0 = resolve(frarr[fri]); if (r0 == f) ok = 1 }
          if (!ok) hin("FIX-REQUIREMENT", f, "`behebt: " w "`, aber " idof[g0] " nennt " idof[f] " nicht in `fix_requirement:` — beide Verweise gehören zusammen, an jeder Anforderung, die den BUG behebt (Fehlermeldungen §Meta)")
        }
      }
    }
    # Herkunftszeile: Format von `herkunft`, Marke abgeleiteter Nachweise
    if ((f, "herkunft") in fm) {
      m = vals(f, "herkunft", varr)
      for (i = 1; i <= m; i++) {
        w = varr[i]
        if (bn(w) ~ /_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]\.[A-Za-z0-9]+$/ || w ~ /\.md$/) {
          if (bn(w) !~ /_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]\.[A-Za-z0-9]+$/) { err("HERKUNFT", f, "`herkunft`: `" w "` — Stand ohne `_VV_TLA` im Dateinamen"); continue }
          if (index(w, "/") == 0 && isout(f) && kid(w) == kid(f)) { err("HERKUNFT", f, "`herkunft`: `" w "` ist eine Version dieses Stands (gleiche Ketten-ID) — kein Vorgänger-Stand; die Nachfolge zeigt die Freigabe-DEC mit `supersedes:`"); continue }
          if (index(w, "/") == 0 && OUTP != "" && !((OUTP w) in files)) hin("HERKUNFT", f, "`herkunft`: Stand `" w "` nicht in output/")
          if (ftype[f] == "test-report" && ((OUTP w) in files) && fmget(OUTP w, "type") == "testplan") {
            if (trim(fmget(OUTP w, "marke")) != trim(fmget(f, "marke"))) err("MARKE-HERKUNFT", f, "`marke: " fmget(f, "marke") "`, Testplan-Stand " w " hat `" fmget(OUTP w, "marke") "`")
          }
        } else if (w ~ /^[A-Z][A-Z]+-[0-9]+$/ && (idpfx(w) in prefixes)) {   # sonst Tag-Name (z.B. `RC-1`)
          if (idpfx(w) != "TRES") { err("HERKUNFT", f, "`herkunft`: `" w "` — als ID ist nur ein Testbericht (TRES-NNN) vorgesehen"); continue }
          if (resolve(w) == "") err("HERKUNFT", f, "`herkunft`: `" w "` — kein Knoten mit dieser id")
        }
      }
    }
    if (grad[t] == "selbsttragend" && isout(f) && ((f, "quell_stand") in fm)) {
      w = trim(fm[f, "quell_stand"]); g0 = OUTP bn(w)
      if (!(g0 in files)) hin("MARKE-HERKUNFT", f, "`quell_stand: " w "` nicht in output/ — Marke nicht verglichen")
      else if (trim(fmget(g0, "marke")) != trim(fmget(f, "marke"))) err("MARKE-HERKUNFT", f, "`marke: " fmget(f, "marke") "` weicht von der Marke des Quell-Stands (`" fmget(g0, "marke") "`) ab")
    }
    if (isout(f) && kind[t] == 5 && nmark > 0 && ((f, "marke") in fm) && !(trim(fm[f, "marke"]) in mark))
      hin("ZIELMARKE", f, "`marke: " fm[f, "marke"] "` — keine Marke dieses Namens in den Zielmarken")
    if (isout(f) && kind[t] == 5) {
      stand[f] = t
      # Datum des Stands (Einfrieren-und-Abloesen §Stand): jeder wiki-verweisende
      # Stand trägt `datum`; Format; bei Version 01 das Datum der Ketten-ID
      d = trim(fmget(f, "datum")); fd = filedate(f)
      if (d == "" && grad[t] == "wiki-verweisend" && index("," req[t] ",", ",datum|") == 0) {
        if (bestand(f)) hin("STAND-DATUM", f, "`datum:` fehlt (Pflichtfeld jedes Stands seit 2.0) — Bestand")
        else err("STAND-DATUM", f, "`datum:` fehlt (Pflichtfeld jedes Stands seit 2.0, Einfrieren-und-Abloesen §Stand)")
      } else if (d != "" && d !~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/) hin("STAND-DATUM", f, "`datum: " d "` — Format YYYY-MM-DD (Datum des Stands); für den Stichtag gilt das Datum der Ketten-ID" ((fd == "") ? " (hier keines: Bestand)" : " (" fd ")"))
      else if (d != "" && fd != "" && vvnum(f) == 1 && d != fd) hin("STAND-DATUM", f, "`datum: " d "` weicht bei Version 01 vom Datum der Ketten-ID (" fd ") ab")
      else if (d != "" && fd != "" && d < fd) hin("STAND-DATUM", f, "`datum: " d "` liegt vor dem Datum der Ketten-ID (" fd ")")
    }
  }
  # --- Stand je Marke: alle Versionen einer Ketten-ID tragen dieselbe Marke
  for (f in stand) {
    dn = kid(f); M0 = trim(fmget(f, "marke")); if (M0 == "") continue
    if (!(dn in kidm)) { kidm[dn] = M0; kidf[dn] = f }
    else if (kidm[dn] != M0) befund("STAND-MARKE", f, "`marke: " M0 "`, die Version " bn(kidf[dn]) " derselben Ketten-ID trägt `marke: " kidm[dn] "` — ein Stand gehört zu genau einer Marke; für eine neue Marke entsteht ein neues Dokument mit neuer Ketten-ID (Einfrieren-und-Abloesen §Stand)")
  }
  # Rolle des Repos in der Kette (Kettenpruefung §Fehlende und vertretene
  # Glieder): `fuer_marke:` am Marken-Eintrag = Komponente (auch ohne Zeilen
  # in §Komponenten); ohne §Komponenten Standalone; eigenes Repo nicht
  # erkannt = unbekannt (rollenabhängige Prüfungen entfallen oder Hinweis);
  # genau eine Zeile, die eigene = Standalone; Spalte Rolle der eigenen
  # Zeile (RP-1) geht vor; sonst Koordinator. Zwischen-Koordinator
  # (Kettenpruefung §Komponenten-Kette nach Übernahme-Art): `fuer_marke:`
  # und daneben mindestens eine Unter-Komponente in §Komponenten — eine
  # Zeile, für die dieses Repo einen Übergabe-Stand gebildet hat (Name aus
  # `komponente:` oder dem Gegenstand im Dateinamen, Komponenten- oder
  # Repo-Name); die Zeile des Koordinators, bekannte Nachbarn und die eigene
  # Zeile zählen nicht = „komponente und koordinator“ — P1–P4 wie eine
  # Komponente, P5–P6 und die Lieferungen wie ein Koordinator, Kette bis
  # P10 (P11/DEPL nur mit eigener Zielumgebung). Der Übergabe-Stand ist der
  # Beleg; das erkannte eigene Repo ist dafür nicht nötig
  rolle = (nmkfr > 0) ? "komponente" : (nkp == 0) ? "standalone" : (OWN == "") ? "unbekannt" : "koordinator"
  if (rolle == "koordinator" && nkp == 1 && ownrow) rolle = "standalone"
  for (f in stand) if (stand[f] == "uebergabe") { kk = trim(fmget(f, "komponente")); if (kk == "") kk = gegenstand(f); if (kk != "") uebany[kanon(kk)] = 1 }
  nfremd = 0; nsub = 0
  for (i = 1; i <= nkp; i++) {
    split(kp[i], k4, "\t")
    if (OWN != "" && k4[2] == OWN) { if (k4[4] ~ /Komponente/) rolle = "komponente"; else if (k4[4] ~ /Koordinator/) rolle = "koordinator" }
    else if (k4[4] !~ /Koordinator/) { nfremd++; if ((kanon(k4[1]) in uebany) || (k4[2] != "-" && (kanon(k4[2]) in uebany))) { nsub++; subrow[i] = 1 } }
  }
  if (nmkfr > 0 && nsub > 0) rolle = "komponente und koordinator"
  istkoord = (rolle == "koordinator" || rolle == "komponente und koordinator")
  istkomp = (rolle == "komponente" || rolle == "komponente und koordinator")
  # Übernahme-Art der Komponente aus dem Herkunfts-Vermerk (Zeile
  # `- **Übernahme-Art:**` unter `## Herkunft` in Aktivierter-Prozess;
  # Kettenpruefung §Komponenten-Kette nach Übernahme-Art): selbstständig —
  # P1 ersetzt der Übergabe-Stand, P2 bleibt ohne Stand, Pflicht ab P3;
  # Auftrag — der Übergabe-Stand vertritt P1–P4, Pflicht ab P5. Nicht
  # lesbar: wie Auftrag geprüft, mit Hinweis
  uebart = ""; ua = ""
  for (k in hv) if (k ~ /bernahme-Art$/) ua = tolower(hv[k])
  if (ua ~ /^selbstst(ä|ae)ndig/) uebart = "selbstständig"
  else if (ua ~ /^auftrag/) uebart = "auftrag"
  if (hvf == "") hvf = ROOT "/wiki/Aktivierter-Prozess.md"
  if (HVBAD != "") hin("HERKUNFT-VERMERK", hvf, "`Template-Stand: " HVBAD "` im Herkunfts-Vermerk — feste Zeile `<Version> seit YYYY-MM-DD` erwartet (Init-Choreografie §Phase A0); Stichtag nicht gelesen, alles gilt als Bestand")
  if (MODE == "projekt" && istkomp && uebart == "")
    hin("HERKUNFT-VERMERK", hvf, "Rolle " rolle ", aber " ((ua == "") ? "keine Zeile `- **Übernahme-Art:**`" : "Übernahme-Art `" ua "` nicht erkannt (selbstständig | Auftrag)") " im Abschnitt `## Herkunft` (Init-Choreografie §Phase A0) — P3/P4 der Komponente nicht geprüft (wie Auftrag gelesen)")
  # --- Bootstrap-Reste im wiki/
  for (i = 1; i <= nbs; i++) { split(bs[i], b2, "\t"); if (inwiki(b2[1])) err("BOOTSTRAP-REST", b2[1], "`## Bootstrap` in Zeile " b2[2]) }
  # --- Wikilinks (Dokumente in output/ nicht: siehe Nicht geprüft)
  # Paket-Grenze auf der Template-Quelle (Funktion sichtbar): Steckbrief je
  # Paket und Prozess-Kennung → Paket aus den Steckbrief-Frontmattern
  if (MODE == "template-quelle") for (f0 in files) {
    if (base(f0) != "Steckbrief" || pkg(f0) == "") continue
    pksb[pkg(f0)] = f0; pk = trim(fmget(f0, "process")); if (pk != "") pkdir[pk] = pkg(f0)
  }
  for (i = 1; i <= nlk; i++) {
    split(lk[i], l4, "\t"); f = l4[1]; ln = l4[2]; tg = l4[3]; an = l4[4]
    if (isout(f) || isnach(f)) continue
    if (tg == "") tg = base(f)
    if (isplatz(tg)) { nplatz++; continue }
    # auf der Template-Quelle lösen Links aus */wiki/ nur gegen Wiki-Knoten
    # auf (Steckbrief.md und index.md bleiben nach dem Merge in _template/)
    nurwiki = (MODE == "template-quelle" && inwiki(f) && (tg in names) && !(tg in wnames))
    if (!(tg in names) || nurwiki) {
      if (tg in kennt) continue
      if (match(tg, /^[A-Z][A-Z]+-[0-9]+/) && (substr(tg, RSTART, RLENGTH) in aliasof)) {
        hin("ALIAS", f, "Zeile " ln ": [[" tg "]] aufgelöst via alias (" idof[aliasof[substr(tg, RSTART, RLENGTH)]] ")"); continue
      }
      # alter Ablöse-Vermerk `[[<ID>]]` (Form aus 1.x) an einem Bestands-Knoten
      # (ohne `datum:` oder vor dem Stichtag): bleibt eingefroren — Hinweis
      # statt Fehler (Einfrieren-und-Abloesen §Ablösung; Bestandsschutz)
      if (((f, ln) in abv) && bestand(f)) { hin("LINK-TOT", f, "Zeile " ln ": [[" tg "]] im Ablöse-Vermerk eines Bestands-Knotens — kein Knoten `" tg ".md` (Form aus 1.x: ID statt `[[<Dateiname>|<ID>]]`); der Vermerk bleibt eingefroren, Bestandsschutz"); continue }
      err("LINK-TOT", f, "Zeile " ln ": [[" tg "]] — kein " (nurwiki ? "Wiki-Knoten `" tg ".md` (Links aus wiki/ lösen nach dem Merge nicht gegen Steckbrief.md oder index.md auf)" : "Knoten `" tg ".md`")); continue
    }
    # Paket-Grenze: das Ziel muss in einem Paket liegen, das die Quelle
    # sieht — sonst ist der Link in einem Projekt ohne dieses Paket tot
    if (MODE == "template-quelle" && pkg(f) != "") {
      m = split(names[tg], tfiles, "\t"); ok = 0; tp = ""
      for (j = 1; j <= m; j++) {
        if (inwiki(f) && !inwiki(tfiles[j])) continue
        if (sichtbar(pkg(f), pkg(tfiles[j]))) { ok = 1; break }
        if (tp == "") tp = pkg(tfiles[j])
      }
      if (!ok) { err("LINK-PAKET", f, "Zeile " ln ": [[" tg "]] liegt im Paket " tp ", das " pkg(f) " nicht erbt (`extends:` im Steckbrief) — in einem Projekt ohne dieses Paket ein toter Link"); continue }
    }
    if (an == "") continue
    found = 0; m = split(names[tg], tfiles, "\t")
    for (j = 1; j <= m && !found; j++) {
      tf1 = tfiles[j]
      for (k = 1; k <= nhd[tf1]; k++) { h = hd[tf1, k]; if (h == an || slug(h) == slug(an)) { found = 1; break } }
    }
    if (!found) err("LINK-ANKER", f, "Zeile " ln ": [[" tg "#" an "]] — Abschnitt nicht gefunden")
  }
  # --- Register-Lücke: nur über den Detail-Verweis gewertet; ein Eintrag ohne
  # Detail-Zeile ist einzeilig und kein Befund.
  for (i = 1; i <= nseclk; i++) {
    split(seclk[i], s3, "\t"); f = s3[1]; id = s3[2]; tg = s3[3]
    if ((f in idof) || isplatz(tg) || (id in byid)) continue
    if (!(idpfx(id) in regpfx)) continue
    if (!((f, id) in lueck)) { lueck[f, id] = 1; err("REG-LUECKE", f, "`" id "` vergeben und Detail verlinkt ([[" tg "]]), aber kein Knoten trägt `id: " id "`") }
  }
  for (i = 1; i <= nsecnd; i++) {
    split(secnd[i], s3, "\t"); f = s3[1]; id = s3[2]; ln = s3[3]
    if (f in idof) continue
    if (!(idpfx(id) in regpfx)) continue
    hin("REG-DETAIL-OHNE-LINK", f, "Zeile " ln ": `" id "` hat eine Detail-Zeile ohne Wikilink")
  }
  for (id in byid) {
    m = split(byid[id], bf, "\t")
    if (m > 1) for (j = 1; j <= m; j++) err("ID-DOPPELT", bf[j], "`id: " id "` auch in " rel(bf[(j % m) + 1]))
    if (!(idpfx(id) in regpfx)) continue      # z.B. MSG: ohne Fassade, keine Register-Prüfung
    if (!(id in regid)) hin("REG-OHNE-EINTRAG", bf[1], "`id: " id "` ohne Eintrag `### " id "` in einer Register-Fassade")
    # Drift Ablösung Fassade ↔ Frontmatter (Register-Lebenszyklus)
    if (id in regid) {
      fs = fw(rf[regf[id], id, "Status"]); g0 = bf[1]
      if (fs == "abgelöst" && fmget(g0, "superseded_by") == "") err("ABLOESUNG-DRIFT", regf[id], "`" id "`: Status `abgelöst` in der Fassade, aber `superseded_by:` fehlt in " rel(g0))
      if (fs != "" && fs != "abgelöst" && fmget(g0, "superseded_by") != "" && inprog != "") {
        # Nachfolger gilt ab seiner `zielmarke:`; ein Bestands-Nachfolger ohne
        # Feld ab der laufenden Marke (Einfrieren-und-Abloesen §Ablösung)
        m2 = vals(g0, "superseded_by", sarr2); gilt = 0
        for (q = 1; q <= m2; q++) { r0 = resolve(sarr2[q]); if (r0 == "") continue; z = nzm(r0); if (z == "" || (midx(z) > 0 && zgilt(z, inprog))) gilt = 1 }
        if (gilt) hin("ABLOESUNG-DRIFT", regf[id], "`" id "`: `superseded_by:` gesetzt, Nachfolger gilt ab der laufenden Marke, Fassade zeigt Status `" fs "`")
      }
      # Drift `zielmarke:` Fassaden-Eintrag ↔ Detail-Knoten (Zielmarken §Meta,
      # Sitz: kanonisch der Fassaden-Eintrag, das Feld steht im Knoten und als
      # Anzeige im Eintrag; der Agent schreibt beide): nennen beide eine Marke
      # und weichen sie ab, Hinweis — der Lint hat die Marke des Eintrags
      # genommen (zdrift, oben); fehlt die Anzeige im Eintrag, kein Befund
      if (g0 in zdrift) hin("ZIELMARKE-DRIFT", regf[id], "`" id "`: Fassaden-Eintrag zeigt `Zielmarke: " trim(fmget(g0, "zielmarke")) "`, der Detail-Knoten trägt `zielmarke: " zdrift[g0] "` — kanonisch ist der Fassaden-Eintrag, beim Anlegen und Umhängen werden beide geschrieben (Zielmarken §Meta, Sitz; Wiki.md §1.1a); der Lint liest die Marke des Eintrags — vor dem Freeze des Elements zieht der Agent den Knoten nach, danach bleibt der Hinweis stehen und der Eintrag gilt")
    }
  }
  # --- Kettenprüfung, Lint-Anteil: „mindestens einer“ je Glied (Hinweis)
  for (f in idof) {
    p = idpfx(idof[f])
    if (stat(f) == "verworfen" || stat(f) == "abgelöst") continue
    if (p == "FUNC" || p == "SPEC") {
      m = vals(f, "abgeleitet_von", varr)
      for (i = 1; i <= m; i++) if (index(varr[i], "/") == 0) { r0 = resolve(varr[i]); if (r0 != "") gedeckt[idof[r0], p] = 1 }
    }
    if (p == "TEST") {
      m = vals(f, "prueft", varr)
      for (i = 1; i <= m; i++) if (index(varr[i], "/") == 0) { r0 = resolve(varr[i]); if (r0 != "") gedeckt[idof[r0], "TEST"] = 1 }
    }
    if (p == "DEPL" && wirksam(f)) {
      u = trim(fmget(f, "umgebung")); kk = trim(fmget(f, "komponente"))
      # „Standalone: das eigene Repo“ (Eintrag DEPL): für die eigene Zeile gilt
      # auch der Repo-Name
      if (nkp > 0 && kk != "" && !(kk in kpname) && kk == OWN && ownrow && (kk in kprepo)) kk = kprepo[kk]
      depl[u, kk] = 1; depl[u, "*"] = 1
      if (nenv > 0 && u != "" && !(u in env)) err("DEPL-BEZUG", f, "`umgebung: " u "` — keine Umgebung dieses Namens in den Zielumgebungen")
      if (nkp > 0 && kk != "" && !(kk in kpname)) err("DEPL-BEZUG", f, "`komponente: " kk "` — keine Zeile dieses Namens in §Komponenten")
    }
    # Verzicht auf eine Phase mit Pflicht-Stand: `decision_type: verzicht`,
    # `zielmarke:` und `phase: Pn` — `phase` streng gelesen (genau eine
    # Phase, `P` und Nummer ohne führende Null); andere Form oder fehlendes
    # Feld: Hinweis, kein Verzicht. Der Tag (P9) ist nicht verzichtbar
    # (Entscheidungen Meta „Verzichts-Einträge“): `phase: P9` ist ein Fehler, auch ohne `zielmarke:`.
    # `zielmarke:` ohne `phase:` ist kein Fehler: mit Prozess ein Hinweis
    # (unten, sobald bekannt ist, ob es Phasen gibt); ohne Prozess ist das
    # die Form des Verzichts auf „Tests grün“ (Kettenpruefung §Kette,
    # Projekt ohne Prozess), den der Lint nicht liest — keine Meldung
    if (p == "DEC" && fw(fmget(f, "decision_type")) == "verzicht" && (stat(f) in AKTIV)) {
      z = trim(fmget(f, "zielmarke")); vp = trim(fmget(f, "phase"))
      if (vp != "" && vp !~ /^P[1-9][0-9]*$/) hin("VERZICHT", f, "`phase: " vp "` — erwartet genau eine Phase `Pn` (z.B. `P8`; keine führende Null, keine Liste); gilt nicht als Verzicht")
      else if (vp == "P9") err("VERZICHT", f, "`phase: P9`" ((z != "") ? " zu Marke " z : " (ohne `zielmarke:`)") " — der Tag der Implementierung ist kein Stand und nicht verzichtbar; jedes Projekt hat ein Produkt, das der Tag markiert (Kettenpruefung §Fehlende und vertretene Glieder). Gilt nicht als Verzicht; die Tag-Bedingung des Testplan-Stands bleibt")
      else if (z == "") hin("VERZICHT", f, "Verzichts-DEC ohne `zielmarke:`" ((vp == "") ? " und `phase:`" : "") " — ohne `zielmarke:` gilt kein Verzicht (Kettenpruefung §Lint-Anteil; das Feld ist seit 2.0 Pflicht, fehlend meldet die Feld-Prüfung)")
      else if (vp == "") vzop[f] = z
      else verzicht[z, vp] = 1
    }
  }
  for (i = 1; i <= nsref; i++) { split(sref[i], s2, "\t"); if ((s2[1] in stand) && stand[s2[1]] == "uebergabe") delegiert[s2[2]] = 1 }
  ohnebau = (nkp > 0 && !ownrow)
  for (f in idof) {
    id = idof[f]; p = idpfx(id)
    if ((p != "REQ" && p != "FUNC") || !wirksam(f)) continue
    # Kette zu Marke M: ein Element einer späteren Marke als der laufenden gehört
    # noch in keine Kette (Kettenpruefung §Kette, Marken-Regel)
    z = trim(fmget(f, "zielmarke")); if (inprog != "" && z != "" && midx(z) > midx(inprog)) continue
    # Fix-Anforderung auf einen Deploy (`requirement_type: fix` mit `umgebung:`,
    # Anforderungen §Meta „Fehlerbehebungen“): umgesetzt mit der Freigabe des
    # weiteren Deploy-Stands, nicht von FUNC, SPEC, TEST gedeckt — keine
    # Erwartung (Kettenpruefung §Lint-Anteil). Den freigegebenen Stand nennt
    # sie als angehängten Vermerk „Umgesetzt mit Stand <Datei mit Version> von
    # Deploy-Stand, freigegeben zu Marke <M>“ (das Feld „Verweise“ ist
    # eingefroren): Hinweis FIX-DEPLOY bei `umgesetzt`/`abgeschlossen` ohne
    # Vermerk, Vermerk ohne Stand-Datei in output/ (Schreibweise wie im Feld
    # „Verweise“) oder nicht eindeutig, Stand-Datei kein Deploy-Stand, Marke
    # im Vermerk ≠ zielmarke; ob der Stand freigegeben ist, prüft der Abgleich
    # mit Nachtragszeilen und Freigabe-Einträgen (unten, nach dem Nachtrag)
    if (p == "REQ" && fw(fmget(f, "requirement_type")) == "fix" && trim(fmget(f, "umgebung")) != "") {
      fxs = stat(f)
      if (f in fxv) {
        if (OUTP != "") {
          fxf = nachtragstand(fxv[f])
          if (fxf == "" && ntamb) hin("FIX-DEPLOY", f, id ": Vermerk „Umgesetzt mit Stand " fxv[f] " von Deploy-Stand“ — Stand-Datei zu Version `" standname(fxv[f]) "` nicht eindeutig, mehrere Deploy-Stände verschiedener Umgebungen tragen sie; der Vermerk nennt die Datei (Anforderungen §Meta „Fehlerbehebungen“, Fix-Anforderung auf einen Deploy)")
          else if (fxf == "") hin("FIX-DEPLOY", f, id ": Vermerk „Umgesetzt mit Stand " fxv[f] " von Deploy-Stand“, aber keine Stand-Datei „" standname(fxv[f]) "“ (Deploy-Stand) in output/ — der Vermerk nennt den freigegebenen weiteren Deploy-Stand der Umgebung (Anforderungen §Meta „Fehlerbehebungen“, Fix-Anforderung auf einen Deploy)")
          else if (stand[fxf] != "deploy-stand") hin("FIX-DEPLOY", f, id ": der Vermerk „Umgesetzt mit Stand …“ nennt " bn(fxf) ", und das ist kein Deploy-Stand (Dokumenttyp `" stand[fxf] "`) — umgesetzt ist eine Fix-Anforderung auf einen Deploy mit der Freigabe des weiteren Deploy-Stands (Anforderungen §Meta „Fehlerbehebungen“)")
        }
        if (fxvm[f] != "" && z != "" && fxvm[f] != z) hin("FIX-DEPLOY", f, id ": der Vermerk „Umgesetzt mit Stand …“ nennt „zu Marke " fxvm[f] "“, die Anforderung trägt `zielmarke: " z "` — der Vermerk wiederholt die Marke der Fix-Anforderung, die Marke des ausgelieferten Stands (Anforderungen §Meta „Fehlerbehebungen“)")
      }
      else if (fxs == "umgesetzt" || fxs == "abgeschlossen") hin("FIX-DEPLOY", f, id ": Status `" fxs "`, aber kein Vermerk „Umgesetzt mit Stand <Datei mit Version> von Deploy-Stand, freigegeben zu Marke <M>“ in der Sektion Vermerke — umgesetzt ist eine Fix-Anforderung auf einen Deploy mit der Freigabe des weiteren Deploy-Stands, den sie als angehängten Vermerk nennt, nicht im eingefrorenen Feld „Verweise“ (Anforderungen §Meta „Fehlerbehebungen“)")
      continue
    }
    if (p == "REQ" && !((id, "FUNC") in gedeckt)) hin("KETTE-DECKUNG", f, id ": keine FUNC mit `abgeleitet_von:` auf diese REQ")
    if (p == "FUNC" && !((id, "SPEC") in gedeckt) && !(id in delegiert) && !ohnebau) {
      z = trim(fmget(f, "zielmarke")); if (z == "") z = inprog
      if (!((z, "P8") in verzicht)) hin("KETTE-DECKUNG", f, id ": keine SPEC mit `abgeleitet_von:` auf diese FUNC (weder Übergabe-Stand noch Verzicht `phase: P8` zu Marke " z ")")
    }
    if (!((id, "TEST") in gedeckt)) hin("KETTE-DECKUNG", f, id ": kein TEST mit `prueft:` auf diese " p)
  }
  # DEPL-Deckung im Repo, das die DEPL führt: Koordinator (und Standalone)
  # alle Zeilen in §Komponenten je Umgebung — auch eine Zeile der Rolle
  # Koordinator, sie steht für eigene Bauteile (Kettenpruefung §Freigabe-Ordnung des Koordinators) —,
  # Komponente mit eigener Zielumgebung ihre eigene Zeile, Komponente und
  # Koordinator mit eigener Zielumgebung die eigene Zeile und die seiner
  # Unter-Komponenten (Kettenpruefung §Lint-Anteil); Rolle unbekannt: entfällt
  if (nenv > 0 && rolle != "unbekannt") {
    nk = 0
    if (nkp == 0) kl[++nk] = "*"
    else for (i = 1; i <= nkp; i++) {
      split(kp[i], k4, "\t")
      if (rolle == "koordinator" || rolle == "standalone") kl[++nk] = k4[1]
      else if (rolle == "komponente und koordinator") { if ((i in subrow) || (OWN != "" && k4[2] == OWN)) kl[++nk] = k4[1] }
      else if (k4[3] != "" && OWN != "" && k4[2] == OWN) kl[++nk] = k4[1]
    }
    for (u in env) for (j = 1; j <= nk; j++) if (!((u, kl[j]) in depl))
      hin("KETTE-DEPL", envf, "kein wirksamer DEPL für Umgebung `" u "`" (kl[j] == "*" ? "" : " und Komponente `" kl[j] "`") " (Rolle " rolle ")")
  }
  # --- Contract ↔ Zuschnitt (Katalog-Einträge `contract`, `architecture-description`):
  # vom CON über `abgeleitet_von:` zum ARC-Element; `provider:` stimmt überein;
  # jeder `consumer:` des ARC ist im Eintrag des CON im Contract-Index registriert
  for (f in idof) {
    id = idof[f]; if (idpfx(id) != "CON") continue
    if (stat(f) == "verworfen" || stat(f) == "abgelöst") continue
    if (!((f, "abgeleitet_von") in fm)) continue      # Pflichtfeld (seit 2.0) meldet die Feld-Prüfung
    m = vals(f, "abgeleitet_von", varr); narc = 0
    for (i = 1; i <= m; i++) {
      w = varr[i]; if (index(w, "/") > 0) continue
      g0 = resolve(w); if (g0 == "" || idpfx(RID) != "ARC") continue
      narc++
      # Namensformen (Katalog-Contract-Index „Namensformen“): ARC nennt den Komponenten-Namen,
      # CON und Contract-Index den Repo-Namen; Abbildung über §Komponenten
      pa = trim(fmget(g0, "provider")); pc = trim(fmget(f, "provider"))
      if (pa == "" || !((g0, "consumer") in fm)) befund("KETTE-CON", g0, idof[g0] ": ARC-Element, aus dem " id " abgeleitet ist, ohne `provider:`/`consumer:` (Katalog-Systemarchitektur)")
      if (pa != "" && pc != "" && kanon(pa) != kanon(pc)) befund("KETTE-CON", f, id ": `provider: " pc "`, das ARC-Element " idof[g0] " nennt `provider: " pa "` — nicht dieselbe Komponente laut §Komponenten (Komponente ↔ Repo-Name)")
      if (!(id in regid)) continue
      m2 = vals(g0, "consumer", carr)
      # Stichtags-Schwere nach dem CON-Detail-Knoten (die Fassade trägt kein `datum`)
      for (q = 1; q <= m2; q++) if (!regist(rl[regf[id], id], carr[q]))
        befund2("KETTE-CON", f, regf[id], id ": Consumer `" carr[q] "` laut " idof[g0] " nicht im Eintrag registriert (Consumer-Registrierung, Contract-Index §Meta; Repo-Name laut §Komponenten)")
    }
    if (narc == 0) befund("KETTE-CON", f, id ": `abgeleitet_von:` nennt kein ARC-Element (Katalog-Eintrag `contract`)")
  }
  # --- Stände: überholt (für C5), Marken-Regel, Consumer-Verweise auf CON
  for (f in stand) {
    b = base(f); dn = b; vv = 0
    if (match(b, /_[0-9][0-9][0-9]*_[A-Za-z][A-Za-z][A-Za-z]$/)) { dn = substr(b, 1, RSTART - 1); split(substr(b, RSTART + 1), v2, "_"); vv = v2[1] + 0 }
    if (!(dn in neu) || vv > neu[dn]) { neu[dn] = vv; neuf[dn] = f }
  }
  for (i = 1; i <= nsref; i++) {
    split(sref[i], s2, "\t"); f = s2[1]; r = s2[2]
    if (!(f in stand)) continue
    if (index(r, "/") > 0) {
      cid = substr(r, index(r, "/") + 1)
      if (!bekanntrepo(substr(r, 1, index(r, "/") - 1)) && !(idpfx(cid) in prefixes)) continue   # Pfad oder Text, kein Verweis
      g0 = qresolve(r)
      if (g0 == "?") { ohnezugriff(QREPO, f, "Verweise des Stands"); continue }
      if (g0 == "") { err("STAND-VERWEIS", f, "`" r "` — weder Knoten noch Register-Eintrag mit dieser id bei `" QREPO "`"); continue }
      if (idpfx(cid) == "CON") {
        # Status: die Fassade ist kanonisch, sonst das Frontmatter
        if (QREPO == OWN) cs = ((cid in regid) && rf[regf[cid], cid, "Status"] != "") ? fw(rf[regf[cid], cid, "Status"]) : (QFAS ? "" : stat(g0))
        else cs = fw(((QREPO, cid, "Status") in nrf) ? nrf[QREPO, cid, "Status"] : (QFAS ? "" : nfm[QREPO, g0, "status"]))
        if (cs != "" && cs != "angenommen") err("STAND-CON", f, "`" r "` hat Status `" cs "` — ein Consumer-Stand verweist nur auf angenommene CON")
      }
      continue
    }
    g0 = resolve(r); if (g0 == "" || !(g0 in idof)) continue
    stref[f, ++nstref[f]] = g0
  }
  # überholt mit Marken-Bezug (Überholt-Regel): verwiesenes Element abgelöst
  # und der Nachfolger gilt für die Marke des Stands, oder Vorgänger-Stand
  # überholt; eine Ablösung, deren Nachfolger erst ab einer späteren Marke
  # gilt, überholt nicht. Für die Übernahme in die laufende Marke wird ein
  # Stand der Vormarke zusätzlich gegen die laufende Marke geprüft — nur
  # Pflicht-Stände ohne den Abschluss-Stand (er wird nie übernommen), und
  # eine Herkunfts-Kette als eine Meldung am ersten überholten Stand.
  for (dn in neuf) {
    f = neuf[dn]
    M = trim(fmget(f, "marke")); mi = midx(M)
    r = ueberholt(f, M)
    if (r != "") hin("UEBERHOLT", f, "Stand ist überholt (" r ") — Meldung für C5")
    else if (mi > 0 && inprog != "" && mi < midx(inprog) && stand[f] != "abschluss-stand" && verb[stand[f]] == "pflicht" && (r = ueberholt(f, inprog)) != "") {
      if (r ~ /^Vorgänger-Stand .* überholt$/) { w = r; sub(/^Vorgänger-Stand /, "", w); sub(/ überholt$/, "", w); uebpar[f] = OUTP w }
      else { uebrg[f] = r; uebrm[f] = M }
    }
    if (mi == 0) continue
    # Marken-Regel direkt (Einfrieren-und-Abloesen §Stand): ein `zielmarke:`-Wert
    # gilt für die Marke des Stands nach `zgilt` (spätere Marke oder Sackgasse,
    # die nicht die Marke des Stands ist); ein Bestands-Element ohne Feld gilt
    # für jede Marke; ein in der Sackgasse überlagertes Element gilt für sie
    # nicht (`ueb`) — Fehler, oder Hinweis UEBERLAGERUNG, wenn der Stand schon
    # freigegeben ist (entschieden nach den Freigabe-Einträgen, unten; Merker
    # `uebs`); ebenso ein Stand einer Vormarke, der in die laufende Sackgasse
    # übernommen würde; dann die Ablösung marken-bezogen
    for (j = 1; j <= nstref[f]; j++) {
      g0 = stref[f, j]; z = trim(fmget(g0, "zielmarke"))
      if (z != "" && midx(z) > 0 && !zgilt(z, M)) {
        if (z != M && (z in sackg)) err("MARKEN-REGEL", f, idof[g0] " trägt `zielmarke: " z "` einer Sackgasse — gilt nur für " z ", nicht für die Marke des Stands (" M "; Zielmarken §Meta, Zwischenmarke)")
        else err("MARKEN-REGEL", f, idof[g0] " trägt `zielmarke: " z "`, später als die Marke des Stands (" M ")")
      }
      if ((idof[g0], M) in ueb) uebs[++nuebs] = f "\t" idof[g0] "\t" M "\t" ueb[idof[g0], M] "\teigen"
      else if (inprog != "" && (inprog in sackg) && mi < midx(inprog) && !(M in sackg) && stand[f] != "abschluss-stand" && verb[stand[f]] == "pflicht" && ((idof[g0], inprog) in ueb))
        uebs[++nuebs] = f "\t" idof[g0] "\t" M "\t" ueb[idof[g0], inprog] "\tvormarke"
      m2 = vals(g0, "superseded_by", sarr2)
      for (q = 1; q <= m2; q++) {
        r0 = resolve(sarr2[q]); if (r0 == "") continue
        z = nzm(r0); zi = (z != "") ? midx(z) : midx(inprog)
        if (zi > 0 && zgilt(z, M)) err("MARKEN-REGEL", f, idof[g0] " ist abgelöst durch " idof[r0] ", der für die Marke " M " gilt — jede ID im Text eines Stands ist ein Verweis; Antwort ist ein Neu-Stand (Überholt-Regel), der Stand selbst bleibt unverändert")
      }
    }
  }
  # Vormarken-Stände, für die laufende Marke überholt: eine Meldung je
  # Herkunfts-Kette am ersten überholten Stand, abhängige Stände angehängt;
  # ein abhängiger Stand ohne gemeldeten Vorgänger (z.B. ältere Version,
  # optionaler Typ) wird einzeln gemeldet
  for (f in uebpar) {
    p = f; n = 0
    while ((p in uebpar) && n < 50) { p = uebpar[p]; n++ }
    if (p in uebrg) uebdeps[p] = uebdeps[p] (uebdeps[p] == "" ? "" : ", ") bn(f)
    else hin("UEBERHOLT", f, "Stand der Marke " trim(fmget(f, "marke")) " ist für die laufende Marke " inprog " überholt (Vorgänger-Stand " bn(uebpar[f]) " überholt) — nicht übernehmen, für " inprog " neu bilden (Überholt-Regel, Marken-Bezug)")
  }
  for (f in uebrg)
    hin("UEBERHOLT", f, "Stand der Marke " uebrm[f] " ist für die laufende Marke " inprog " überholt (" uebrg[f] ") — nicht übernehmen, für " inprog " neu bilden (Überholt-Regel, Marken-Bezug)" ((f in uebdeps) ? "; über `herkunft` davon abhängig, ebenso nicht übernehmen: " uebdeps[f] : ""))
  # --- Freigabe-Einträge (Kettenpruefung §Lint-Anteil; Entscheidungen Meta
  # „Freigabe-Einträge“): erkannt an der kanonischen Formel im Gegenstand
  # eines DEC-Eintrags der Fassade — „Stand x von ⟨Artefakt⟩, freigegeben
  # für Zweck Z [zu Marke M]“; x ist die Version `VV_TLA`. Der Tag der
  # Implementierung (Vorgehen.md §4 „Freigabe per Tag“): „Stand <Tag-Name> von
  # Implementierung, freigegeben für P10 Testen zu Marke M“ — ⟨Artefakt⟩
  # „Implementierung“, Zweck P10, Marke immer im Zusatz (eine Tag-Freigabe
  # hat keine Stand-Datei). Marke sonst = `marke` der Stand-Datei; fehlt die
  # Datei, nennt der Eintrag die Marke immer im Zusatz „zu Marke M“ (fehlt
  # er: Fehler ab Stichtag, wie bei der Tag-Freigabe). Merker `freist`: Stände
  # mit gültiger Freigabe (für UEBERLAGERUNG, unten).
  # Pflicht-Freigabe: Stand eines Pflicht-Dokumenttyps, Zweck an der
  # Phasen-Angabe gelesen (Entscheidungen Meta „Freigabe-Einträge“:
  # Formel wörtlich); Formel-Abweichung Hinweis, Fehler nur bei erkennbarer
  # Freigabe. Pflicht-Phasen des Prozesses aus den Dokumenttyp-Einträgen mit
  # Phase `Pn` (der Abschluss-Stand, Phase 99, zählt nicht als Prozess-Phase);
  # der Tag ist Pflicht-Glied P9, sobald eine Pflicht-Phase ab P10 existiert.
  # Ohne Prozess (keine Pflicht-Phase `Pn`) gibt es keine Freigabe-Ordnung
  # und keine eigene Tag-Freigabe; der Abschluss-Stand führt den Tag, und
  # seine Freigabe bestätigt ihn (Kettenpruefung §Kette, Projekt ohne
  # Prozess) — geprüft wird nur, ob jeder Abschluss-Stand eine Zeile mit
  # „Tag“ bzw. „Implementierung“ trägt (Hinweis).
  maxph = 0
  for (t in verb) if (verb[t] == "pflicht" && kind[t] == 5) { k = phnum(t); if (k > 0) { ppt[k] = ppt[k] (ppt[k] == "" ? "" : ", ") t; if (k > maxph && k < 99) maxph = k } }
  if (maxph >= 10 && !(9 in ppt)) ppt[9] = "Tag der Implementierung"
  # Nachtrag „Tag korrigiert“ mit Prozess (Zielmarken §Meta, Nachtrag): der
  # Nachtrag trägt die neue Tag-Freigabe zu derselben Marke in der Formel;
  # sie zählt als Tag-Freigabe der Marke (P9), die alte Tag-Freigabe im
  # Register bleibt stehen. Formel ohne die Marke des Eintrags: Hinweis; mit
  # Prozess ohne Formel: Hinweis; ohne Prozess mit Formel: Hinweis
  for (b in tagk) {
    if (b in tagfn) {
      if (maxph == 0) hin("MARKE-ZUSTAND", mktf[b], "Marke `" b "`, Zeile " mktl[b] ": Nachtrag „Tag korrigiert“ mit Tag-Freigabe „Stand " tagfn[b] " von Implementierung …“ — ohne Prozess gibt es keine Tag-Freigabe, der Abschluss-Stand führt den Tag (Kettenpruefung §Kette, Projekt ohne Prozess); nicht als Freigabe gelesen")
      else {
        if (tagfm[b] != b) hin("MARKE-ZUSTAND", mktf[b], "Marke `" b "`, Zeile " mktl[b] ": die Tag-Freigabe im Nachtrag „Tag korrigiert“ nennt " ((tagfm[b] == "") ? "keine Marke" : "„zu Marke " tagfm[b] "“") " — sie gehört zu derselben Marke `" b "` (Zielmarken §Meta, Nachtrag)")
        if (tagfn[b] != tagk[b]) hin("MARKE-ZUSTAND", mktf[b], "Marke `" b "`, Zeile " mktl[b] ": die Tag-Freigabe im Nachtrag nennt „Stand " tagfn[b] "“, der Nachtrag den neuen Tag `" tagk[b] "` — gelesen wird der Tag der Freigabe")
        frei[b, 9] = 1; freif[b, 9] = freif[b, 9] "\t-"; tagx[b] = tagx[b] "\t" tagfn[b]
      }
    } else if (maxph >= 10 && (b in abgeschl)) hin("MARKE-ZUSTAND", mktf[b], "Marke `" b "`, Zeile " mktl[b] ": Nachtrag „Tag korrigiert: … → " tagk[b] "“ ohne Tag-Freigabe — mit Prozess enthält der Nachtrag die neue Tag-Freigabe zu derselben Marke („Stand " tagk[b] " von Implementierung, freigegeben für P10 Testen zu Marke " b "“; die alte Tag-Freigabe bleibt stehen; Zielmarken §Meta, Nachtrag)")
  }
  # Verzichts-DEC mit `zielmarke:` ohne `phase:`: mit Prozess vermutlich ein
  # vergessenes Feld (Hinweis); ohne Prozess der Verzicht auf „Tests grün“
  # (Kettenpruefung §Kette, Projekt ohne Prozess) — keine Meldung
  if (maxph > 0) for (f in vzop) hin("VERZICHT", f, "Verzichts-DEC zu Marke " vzop[f] " ohne `phase:` — mit Prozess gilt ein Verzicht nur je Phase `Pn`; so gilt kein Verzicht auf eine Phase (Kettenpruefung §Lint-Anteil)")
  if (maxph == 0) for (dn in neuf) {
    f = neuf[dn]
    if (stand[f] != "abschluss-stand" || (f in mmt)) continue
    M = trim(fmget(f, "marke"))
    hin("ABSCHLUSS-STAND", f, "Abschluss-Stand" ((M != "") ? " zu Marke " M : "") " führt keine Zeile mit dem Tag der Marke — ohne Prozess gibt es keine eigene Tag-Freigabe; der Abschluss-Stand führt den Tag, der das Produkt markiert, und seine Freigabe bestätigt ihn (Kettenpruefung §Kette, Projekt ohne Prozess)")
  }
  nfrei = 0; nfreip = 0; nfl = 0
  for (i = 1; i <= nids; i++) {
    split(ids[i], i3, "\t"); f = i3[1]; ln = i3[2]; id = i3[3]
    if ((f in idof) || idpfx(id) != "DEC" || !((f, id) in idh)) continue
    g = idh[f, id]; sub(/^[A-Z]+-[0-9]+[ \t]*/, "", g)
    sub(/^(—|–|-|:)[ \t]*/, "", g); gsub(/[`*]/, "", g); g = trim(g)
    if (g !~ /^Stand [^ ]+ von .+, freigegeben für .+/) {
      if (g ~ /^Stand / && index(g, "freigegeben für") > 0)
        ordfehler("FREIGABE-FORMEL", f, id, "Zeile " ln ": `" id "` ist erkennbar eine Freigabe („Stand …“, „freigegeben für“), hält die Formel „Stand x von ⟨Artefakt⟩, freigegeben für Zweck Z [zu Marke M]“ aber nicht wörtlich ein — nicht als Freigabe gelesen")
      else if (g ~ /[Ff]reigegeben/)
        hin("FREIGABE-FORMEL", f, "Zeile " ln ": `" id "` nennt „freigegeben“ ohne die Formel „Stand x von ⟨Artefakt⟩, freigegeben für Zweck Z [zu Marke M]“ — nicht als Freigabe gelesen")
      continue
    }
    nfrei++
    x = g; sub(/^Stand /, "", x); sub(/ .*$/, "", x)
    a = g; sub(/^Stand [^ ]+ von /, "", a); p = index(a, ", freigegeben für ")
    z = trim(substr(a, p + length(", freigegeben für "))); a = trim(substr(a, 1, p - 1))
    sub(/[ \t.]+$/, "", z); M = ""
    if (match(z, / zu Marke [^ ]+$/)) { M = trim(substr(z, RSTART + 10)); z = trim(substr(z, 1, RSTART - 1)) }
    sub(/^Zweck /, "", z)
    # verworfene Einträge zählen nicht; ein abgelöster Freigabe-Eintrag gilt
    # für seine Marke weiter, solange kein Nachfolger für sie gilt
    # (Marken-Regel; Kettenpruefung §Regel, Einfrieren-und-Abloesen
    # §Ablösung): er wird ohne weitere Meldungen nur für `frei`/`freist`
    # gezählt — die Ablösung liest der Lint aus `superseded_by:` seines
    # Detail-Knotens (ohne Detail-Knoten: nicht gezählt)
    fs = fw(rf[f, id, "Status"])
    if (fs == "verworfen") continue
    # Nennung der Stand-Datei in einem Freigabe-Eintrag (auch einem abgelösten):
    # Abgleich mit dem Vermerk einer Fix-Anforderung auf einen Deploy (unten)
    if (OUTP != "" && tolower(a) != "implementierung") { sfn = standfile(f, id, x, a); if (sfn != "") fxnenn[sfn] = 1 }
    if (fs == "abgelöst") {
      if (!(id in byid)) continue
      split(byid[id], zba, "\t"); g0 = zba[1]
      istag = (tolower(a) == "implementierung"); sf = ""; ph = 0; pfl = 0
      if (istag) { if (M != "" && index(phasen(z), " P10 ") > 0) { ph = 9; pfl = 1 } }
      else if (OUTP != "") {
        sf = standfile(f, id, x, a)
        if (sf != "") { t = stand[sf]; fmm = trim(fmget(sf, "marke")); if (fmm != "") M = fmm; else if (M == "") M = inprog; ph = phnum(t); pfl = (verb[t] == "pflicht" && ph > 0 && zweckpasst(t, z)) }
      }
      if (!pfl || M == "" || nachfolger_gilt(g0, M)) continue
      frei[M, ph] = 1; freif[M, ph] = freif[M, ph] "\t" (sf == "" ? "-" : sf)
      # für spätere Marken entscheidet je Marke, ob der Nachfolger dort gilt
      # (freigilt); eine abgelöste Tag-Freigabe wird nur gegen die eigene
      # Marke gewertet
      if (sf != "") { freist[sf] = 1; abgn[M, ph, sf] = g0 }
      continue
    }
    istag = (tolower(a) == "implementierung")
    isver = (x ~ /^[0-9][0-9]+_[A-Za-z][A-Za-z][A-Za-z]$/)
    sf = ""; t = ""; ph = 0; mq = (M != "")      # mq: Marke der Freigabe sicher gelesen (Zusatz oder Stand-Kopf)
    if (istag) {
      if (index(phasen(z), " P10 ") == 0) { hin("FREIGABE-STAND", f, id ": Tag-Eintrag (⟨Artefakt⟩ „Implementierung“) mit Zweck „" z "“ — der Tag wird für P10 Testen freigegeben (Vorgehen.md §4 „Freigabe per Tag“); nicht als Tag-Freigabe gelesen"); continue }
      if (M == "") { ordfehler("FREIGABE-STAND", f, id, id ": Tag-Freigabe ohne Zusatz „zu Marke M“ — eine Tag-Freigabe hat keine Stand-Datei und nennt die Marke immer (Vorgehen.md §4 „Freigabe per Tag“); keiner Marke zugeordnet"); continue }
      if (nmark > 0 && !(M in mark)) hin("FREIGABE-STAND", f, id ": „zu Marke " M "“ — keine Marke dieses Namens in den Zielmarken")
      ph = 9; pfl = 1; tagx[M] = tagx[M] "\t" x
    } else {
      if (OUTP != "") sf = standfile(f, id, x, a)
      if (sf != "") {
        t = stand[sf]; fmm = trim(fmget(sf, "marke")); freist[sf] = 1
        if (M != "" && fmm != "" && M != fmm) hin("FREIGABE-STAND", f, id ": „zu Marke " M "“, die Stand-Datei " bn(sf) " trägt `marke: " fmm "` — gelesen wird die Marke der Stand-Datei")
        # Stand-Datei ohne `marke:` (Pflichtfeld, meldet STAND-*): Notbehelf
        if (fmm != "") { M = fmm; mq = 1 } else if (M == "") M = inprog
        if (!artefakt_passt(a, sf)) hin("FREIGABE-STAND", f, id ": ⟨Artefakt⟩ „" a "“ passt nicht zur Stand-Datei " bn(sf) " (Dokumenttyp `" t "`)")
        ph = phnum(t)
        pfl = (verb[t] == "pflicht" && ph > 0)
        if (pfl && !zweckpasst(t, z)) { hin("FREIGABE-STAND", f, id ": Zweck „" z "“ passt nicht zum Katalog-Zweck „für " katzweck(t) "“ des Dokumenttyps `" t "` — nicht als Pflicht-Freigabe gezählt"); pfl = 0 }
      } else {
        if (OUTP != "" && !isver) hin("FREIGABE-STAND", f, id ": `" x "` ist weder eine Version `VV_TLA` noch ein Tag-Eintrag (⟨Artefakt⟩ „Implementierung“) — keine Stand-Datei, nicht als Pflicht-Freigabe gelesen")
        else if (OUTP != "") hin("FREIGABE-STAND", f, id ": keine Stand-Datei mit Version `" x "` zu „" a "“ in output/ — Marke aus dem Zusatz, Dokumenttyp und Ordnung nicht geprüft")
        # Freigabe ohne Stand-Datei: der Eintrag nennt die Marke immer
        # (Vorgehen.md §4; Zielmarken §Meta „Freigaben“), wie die Tag-Freigabe
        if (OUTP != "" && M == "") ordfehler("FREIGABE-STAND", f, id, id ": Freigabe ohne Stand-Datei und ohne Zusatz „zu Marke M“ — ohne Stand-Datei nennt der Eintrag die Marke immer (Vorgehen.md §4); keiner Marke zugeordnet")
        else if (OUTP != "" && nmark > 0 && !(M in mark)) hin("FREIGABE-STAND", f, id ": „zu Marke " M "“ — keine Marke dieses Namens in den Zielmarken")
        pfl = 0
      }
    }
    # Pflichtfeld `zielmarke:` des Freigabe-Eintrags nennt die Marke der
    # Freigabe (Entscheidungen Meta „Freigabe-Einträge“; Zielmarken §Meta
    # „Freigaben“): Feld `Zielmarke` der Fassade (kanonisch), sonst das
    # Frontmatter des Detail-Knotens; Abweichung ist ein Hinweis
    # für den Nachtrag eines Deploy-Stands (unten): derselbe Stand im Nachtrag
    # und als Eintrag — über die eindeutig aufgelöste Stand-Datei, nicht über
    # die Version (zwei Umgebungen mit Version 01_ABC sind kein Doppel); je
    # Umgebung der Freigabe-Eintrag eines Deploy-Stands mit seiner Stand-Datei
    # (`decfu`, `decfs`; je Umgebung gilt der jüngste Stand, ein Nachtrag ist
    # jünger — Zielmarken §Meta, Nachtrag); bei mehrdeutiger Datei nur, wenn
    # alle Kandidaten dieselbe Umgebung tragen; tragen sie verschiedene, kennt
    # der Lint die Datei nicht und sagt es als Hinweis — das Feld-Set nennt
    # die Stand-Datei (Entscheidungen Meta „Freigabe-Einträge“, Verweise)
    if (M != "" && sf != "") {
      if (standeindeutig(f, id, x, a, sf)) { decfx[M, sf] = id; if (t == "deploy-stand") { decfu[M, umgvon(sf)] = id; decfs[M, umgvon(sf)] = sf } }
      else if (t == "deploy-stand") {
        u = standumg(x, a)
        if (u != "") decfu[M, u] = id
        else hin("FREIGABE-STAND", f, id ": Stand-Datei zu Version `" x "` nicht eindeutig — mehrere Deploy-Stände verschiedener Umgebungen tragen sie, und kein Feld des Eintrags nennt die Datei (Feld-Set „Verweise“: die Stand-Datei mit Version, Entscheidungen Meta „Freigabe-Einträge“); Abgleich mit einem Nachtrag für diesen Eintrag nicht geprüft")
      }
    }
    if (mq && M != "") {
      zm = eintragzielmarke(f, id)
      if (zm == "" && (id in byid)) { split(byid[id], zba, "\t"); zm = trim(fmget(zba[1], "zielmarke")) }
      if (zm != "" && zm != M) hin("FREIGABE-STAND", f, id ": `zielmarke: " zm "`, die Freigabe gehört zu Marke " M " — ein Freigabe-Eintrag trägt die Marke der Freigabe in `zielmarke:` (Entscheidungen Meta „Freigabe-Einträge“)")
    }
    if (!pfl) continue
    nfreip++
    frei[M, ph] = 1
    freif[M, ph] = freif[M, ph] "\t" (sf == "" ? "-" : sf)
    if (t == "uebergabe") { kk = trim(fmget(sf, "komponente")); if (kk == "") kk = gegenstand(sf); uebk[M] = uebk[M] "|" ((kk == "") ? "*" : kk); uebkf[M] = uebkf[M] "|" sf }
    fl[++nfl] = M "\t" ph "\t" id "\t" f "\t" g
  }
  # Nachtrag eines Deploy-Stands (Zielmarken §Meta, Nachtrag; Entscheidungen
  # Meta „Freigabe-Einträge“, Ausnahme „Nachtrag zu einer abgeschlossenen
  # Marke“): die Freigabe steht als Formel im Nachtrag am Marken-Eintrag und
  # zählt als Pflicht-Freigabe P11 der Marke und als Freigabe des Stands —
  # kein eigener Eintrag, keine Ablösung erwartet. Hinweise: Nachtrag ohne
  # Formel; Formel ohne „Nachtrag:“ am Anfang; Marke der Formel ≠ Marke des
  # Eintrags oder fehlend; Marke nicht abgeschlossen (vor dem Wechsel ist die
  # Freigabe ein eigener Eintrag); keine Stand-Datei; Stand-Datei nicht vom
  # Dokumenttyp `deploy-stand` oder nicht Pflicht; Stand-Datei mit anderer
  # `marke:`; derselbe Stand zusätzlich als eigener Freigabe-Eintrag (über die
  # aufgelöste Stand-Datei abgeglichen, nicht über die Version). Die
  # Freigabe-Ordnung wird für den Nachtrag nicht erneut geprüft (die Marke ist
  # abgeschlossen, die Kette steht). Je Umgebung gilt der jüngste Deploy-Stand
  # (Zielmarken §Meta, Nachtrag): Zu einer Marke kann es je Umgebung mehrere
  # Nachtragszeilen geben (neue Umgebung, anders ausgerollte Umgebung); je
  # Umgebung zählt der jüngste Nachtrag — das Datum der Vermerk-Zeile, bei
  # gleichem Datum die spätere Zeile —, nur sein Stand geht als Freigabe der
  # Phase in die Übernahme (`freif`), ein Freigabe-Eintrag derselben Umgebung
  # vor dem Wechsel (`decfs`) tritt dort zurück; die Pflicht-Freigabe P11
  # zählt einmal; die älteren Stände bleiben freigegeben (`freist`), abgelöst
  # wird nichts. Ein weiterer Stand derselben Umgebung ist eine neue Version
  # derselben Ketten-ID — eine zweite Ketten-ID für dieselbe Umgebung ist ein
  # Hinweis (die ältere bliebe sonst als jüngste Version im Lesebereich von
  # Marken-Regel und Überholt-Regel), die Zeile zählt trotzdem. Umgebung:
  # `umgebung` im Kopf der Stand-Datei, sonst der Gegenstand des Dateinamens,
  # sonst die Stand-Datei selbst (`umgvon`).
  ndfrei = 0; ndfu = 0
  for (di = 1; di <= nmkd; di++) {
    split(mkd[di], d6, "\t"); df = d6[1]; b = d6[2]; dl = d6[3]; x = d6[4]; M = d6[5]; dnf = d6[6] + 0; dvd = d6[7]
    if (x == "") { hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": Nachtrag zu einem Deploy-Stand ohne Freigabe-Formel — die Freigabe eines nachgetragenen Deploy-Stands steht als Formel im Nachtrag („Nachtrag: Stand <Datei mit Version> von Deploy-Stand, freigegeben für P11 Ausliefern zu Marke " b ", freigegeben vom Anwender <Datum>“; Zielmarken §Meta, Nachtrag); nicht als Freigabe gelesen"); continue }
    if (!dnf) hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": Freigabe-Formel eines Deploy-Stands in einem Vermerk ohne „Nachtrag:“ am Anfang — Format der Nachtragszeile: Zielmarken §Meta, Nachtrag; als Freigabe im Nachtrag gelesen")
    if (M == "") hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": die Freigabe im Nachtrag nennt keine Marke — im Nachtrag ist „zu Marke " b "“ immer gesetzt (Zielmarken §Meta, Nachtrag); gelesen wird die Marke des Eintrags")
    else if (M != b) hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": die Freigabe im Nachtrag nennt „zu Marke " M "“ — sie gehört zu derselben Marke `" b "` (Zielmarken §Meta, Nachtrag); gelesen wird die Marke des Eintrags")
    if (!(b in abgeschl)) { hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": Freigabe eines Deploy-Stands im Nachtrag, aber die Marke ist nicht abgeschlossen — vor dem Marken-Wechsel ist jede Freigabe ein eigener DEC-Eintrag (Entscheidungen Meta „Freigabe-Einträge“); nicht als Freigabe gelesen"); continue }
    if (OUTP == "") continue
    sf = nachtragstand(x)
    if (sf == "" && ntamb) { hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": Stand-Datei zu Version `" standname(x) "` nicht eindeutig — mehrere Deploy-Stände verschiedener Umgebungen tragen sie; die Nachtragszeile nennt die Datei (Zielmarken §Meta, Nachtrag); nicht als Pflicht-Freigabe gezählt"); continue }
    if (sf == "") { hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": keine Stand-Datei „" x "“ (Deploy-Stand) in output/ — nicht als Pflicht-Freigabe gezählt"); continue }
    fxnenn[sf] = 1
    t = stand[sf]
    if (t != "deploy-stand") { hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": die Stand-Datei " bn(sf) " ist kein Deploy-Stand (Dokumenttyp `" t "`) — nicht als Pflicht-Freigabe gezählt"); continue }
    if (verb[t] != "pflicht" || phnum(t) == 0) { hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": Dokumenttyp `" t "` ist kein Pflicht-Stand mit Phase im Katalog — nicht als Pflicht-Freigabe gezählt"); continue }
    fmm = trim(fmget(sf, "marke"))
    if (fmm != "" && fmm != b) hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": die Stand-Datei " bn(sf) " trägt `marke: " fmm "` — ein nachgetragener Deploy-Stand gehört zur Marke des Eintrags (Zielmarken §Meta, Nachtrag)")
    u = umgvon(sf); du = b SUBSEP u
    if ((b, sf) in decfx) hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": die Freigabe von Stand " bn(sf) " steht im Nachtrag und als eigener Eintrag `" decfx[b, sf] "` — nach dem Marken-Wechsel ist der Nachtrag der Träger, ein eigener Freigabe-Eintrag entsteht nicht (Entscheidungen Meta „Freigabe-Einträge“, Ausnahme)")
    else if ((b, u) in decfs && kid(decfs[b, u]) != kid(sf)) hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": Stand " bn(sf) " ist eine zweite Ketten-ID für die Umgebung „" u "“ zu Marke " b " (neben " bn(decfs[b, u]) ", Eintrag `" decfu[b, u] "`) — ein weiterer Deploy-Stand derselben Umgebung ist eine neue Version derselben Ketten-ID (Zielmarken §Meta, Nachtrag); als Freigabe gelesen, je Umgebung gilt der jüngste")
    else if ((du in nju) && kid(nju[du]) != kid(sf)) hin("MARKE-ZUSTAND", df, "Marke `" b "`, Zeile " dl ": Stand " bn(sf) " ist eine zweite Ketten-ID für die Umgebung „" u "“ zu Marke " b " (neben " bn(nju[du]) ", Zeile " njl[du] ") — ein weiterer Deploy-Stand derselben Umgebung ist eine neue Version derselben Ketten-ID (Zielmarken §Meta, Nachtrag); als Freigabe gelesen, je Umgebung gilt der jüngste")
    ndfrei++; freist[sf] = 1
    if (!(du in nju)) { ndfu++; nju[du] = sf; njd[du] = dvd; njl[du] = dl + 0; njp[du] = phnum(t) }
    else if (dvd > njd[du] || (dvd == njd[du] && dl + 0 >= njl[du])) { nju[du] = sf; njd[du] = dvd; njl[du] = dl + 0 }
  }
  # je Umgebung der jüngste: der Stand des jüngsten Nachtrags geht in die
  # Übernahme; der Stand des Freigabe-Eintrags derselben Umgebung vor dem
  # Wechsel tritt dort zurück (bleibt freigegeben, nichts abgelöst)
  for (du in nju) {
    split(du, du2, SUBSEP); b = du2[1]; ph = njp[du]
    if (du in decfs) {
      n2 = split(freif[b, ph], fa2, "\t"); l = ""
      for (j = 1; j <= n2; j++) if (fa2[j] != "" && fa2[j] != decfs[du]) l = l "\t" fa2[j]
      freif[b, ph] = l
    }
    frei[b, ph] = 1; freif[b, ph] = freif[b, ph] "\t" nju[du]
  }
  # Fix-Anforderung auf einen Deploy, `umgesetzt`/`abgeschlossen` mit Vermerk
  # „Umgesetzt mit Stand …“ (oben, FIX-DEPLOY): umgesetzt ist sie mit der
  # Freigabe des Stands (Anforderungen §Meta „Fehlerbehebungen“) — nennt
  # keine Nachtragszeile und kein Freigabe-Eintrag (auch ein abgelöster) die
  # Stand-Datei des Vermerks, Hinweis FIX-DEPLOY; überholte Stände meldet
  # UEBERHOLT für sich
  if (OUTP != "") for (f in fxv) {
    if (!(f in idof)) continue
    id = idof[f]
    if (idpfx(id) != "REQ" || !wirksam(f) || fw(fmget(f, "requirement_type")) != "fix" || trim(fmget(f, "umgebung")) == "") continue
    fxs = stat(f); if (fxs != "umgesetzt" && fxs != "abgeschlossen") continue
    fxf = nachtragstand(fxv[f]); if (fxf == "" || stand[fxf] != "deploy-stand") continue
    if (!(fxf in freist) && !(fxf in fxnenn)) hin("FIX-DEPLOY", f, id ": Status `" fxs "`, der Vermerk „Umgesetzt mit Stand …“ nennt " bn(fxf) ", aber keine Nachtragszeile und kein Freigabe-Eintrag nennt diese Stand-Datei — umgesetzt ist eine Fix-Anforderung auf einen Deploy erst mit der Freigabe des weiteren Deploy-Stands (Anforderungen §Meta „Fehlerbehebungen“; Zielmarken §Meta, Nachtrag)")
  }
  # Überlagerung gegen einen Stand (Zielmarken §Meta, Zwischenmarke —
  # Überlagerung nach einer Freigabe): ein Stand der Sackgasse, der ein für
  # sie überlagertes Element verweist, ist ein Fehler MARKEN-REGEL (neu
  # bilden, bevor er zur Freigabe kommt); ist er schon freigegeben, ein
  # Hinweis UEBERLAGERUNG mit Rückfrage an den Anwender (neue Version oder
  # belassen; kein Überholt-Grund). Ein freigegebener Pflicht-Stand einer
  # Vormarke, der in die laufende Sackgasse übernommen würde und ein dort
  # überlagertes Element verweist: ebenso Hinweis (eigener Stand der
  # Sackgasse oder belassen). Die Antwort als Vermerk am Marken-Eintrag der
  # Sackgasse liest der Lint nicht.
  for (ui = 1; ui <= nuebs; ui++) {
    split(uebs[ui], u5, "\t"); uf = u5[1]
    if (u5[5] == "eigen") {
      if (uf in freist) hin("UEBERLAGERUNG", uf, u5[2] " ist in der Sackgasse " u5[3] " überlagert durch " u5[4] " — nach der Freigabe des Stands; Rückfrage an den Anwender: neue Version des Stands für " u5[3] " oder belassen (Zielmarken §Meta, Zwischenmarke: Überlagerung nach einer Freigabe); kein Überholt-Grund, der Stand bleibt unverändert")
      else err("MARKEN-REGEL", uf, u5[2] " ist in der Sackgasse " u5[3] " überlagert durch " u5[4] " — für die Sackgasse gilt das überlagernde Element (Zielmarken §Meta, Zwischenmarke); der Stand ist nicht freigegeben: als neue Version neu bilden, der Stand selbst bleibt unverändert")
    } else if (uf in freist) {
      # nur der Stand, der für die laufende Sackgasse aus der Vormarke wirksam
      # ist (`wirkfrei`: eigene Freigabe der Sackgasse zuerst, sonst die der
      # nächsten Vormarke mit Freigabe) — ein älterer oder durch einen eigenen
      # Stand der Sackgasse ersetzter Stand wird nicht übernommen, keine Rückfrage
      zl = wirkfrei(inprog, phnum(stand[uf]))
      if (WFM != "" && WFM != inprog && index("\t" zl "\t", "\t" uf "\t") > 0)
        hin("UEBERLAGERUNG", uf, "Stand der Marke " u5[3] " verweist " u5[2] ", für die laufende Sackgasse " inprog " überlagert durch " u5[4] " — bei der Übernahme in " inprog " Rückfrage an den Anwender: eigener Stand für " inprog " oder belassen (Zielmarken §Meta, Zwischenmarke: Überlagerung nach einer Freigabe); kein Überholt-Grund")
    }
  }
  # Freigabe-Ordnung (Kettenpruefung §Kette): je Pflicht-Freigabe der Phase Pn
  # zu Marke M sind die Pflicht-Stände früherer Phasen freigegeben, aus der
  # Vormarke übernommen (nicht für M überholt) oder per Verzicht ausgelassen;
  # was nach §Fehlende und vertretene Glieder ohne Verzicht fehlen darf,
  # richtet sich nach der Rolle. Fehlender Vorgänger: Hinweis; fehlende
  # Tag-Bedingung des Testplan-Stands (P10 ohne P9): Fehler — je Marke und
  # Phase einmal je Schwere (ein früherer Hinweis verdeckt keinen Fehler).
  for (i = 1; i <= nfl; i++) {
    split(fl[i], f5, "\t"); M = f5[1]; n = f5[2] + 0; id = f5[3]; f = f5[4]; g = f5[5]
    if (n == 0) continue
    for (k = 1; k < n; k++) {
      if (!(k in ppt)) continue
      # Rolle: Standalone ohne P6; Koordinator ohne eigene Bauteile ohne P7–P9
      # (P9 vertreten durch die Lieferungen, unten je Komponente); Komponente
      # ohne P1–P2 (Übergabe-Stand ersetzt P1, P2 ohne Stand) und — bei
      # Übernahme-Art Auftrag oder nicht lesbar — ohne P3–P4 (Übergabe-Stand
      # vertritt), ohne P6; Komponente und Koordinator ebenso, P6 wie
      # Koordinator; P11 nur mit Zielumgebungen; Rolle unbekannt: nur P5,
      # P9 (Tag oder Lieferungen), P10, P11 als Hinweis
      if (k == 11 && nenv == 0) continue
      if (rolle == "standalone" && k == 6) continue
      if (istkomp && (k <= 2 || (uebart != "selbstständig" && k <= 4))) continue
      if (rolle == "komponente" && k == 6) continue
      if (rolle == "unbekannt" && (k <= 4 || (k >= 6 && k <= 8))) continue
      if (rolle == "koordinator" && nfremd == 0 && k == 6) continue
      if (istkoord && !ownrow && k >= 7 && k <= 9) continue
      if ((M, k) in frei) continue
      if (rolle == "unbekannt" && k == 9 && (mkl[M] != "" || mklk[M] != "")) continue
      if ((M, "P" k) in verzicht) continue
      # Übernahme aus einer früheren Marke: ein Pflicht-Stand, der für M nicht
      # überholt ist (jede frühere Marke mit Freigabe zählt; ist nur der
      # Stand der Vormarke überholt, eine Meldung mit dem Grund). Beim Tag
      # (Kettenpruefung §Kette, übernommener Tag): der Tag der nächsten Vormarke M2 mit Tag-Freigabe gilt
      # weiter, solange keiner der für M2 wirksamen Pflicht-Stände der Phasen
      # vor P9 — eigene Freigaben oder ihrerseits aus Vormarken übernommene
      # (`wirkfrei`) — für M überholt ist (welche Stände der Tag trägt, steht
      # in keinem lesbaren Feld); „Produkt seit dem Tag unverändert“ prüft
      # der Lint nicht — Hinweis einmal je Marke, der entfällt, wenn der
      # Abschluss-Stand von M den Tag mit „übernommen aus M2“ ausweist
      ok = 0; mi = midx(M); altM2 = ""
      if (k == 9) {
        M2 = ""
        if (mi > 0) for (mm = mi - 1; mm >= 1 && M2 == ""; mm--) if (!(markn[mm] in sackg) && ((markn[mm], 9) in frei)) M2 = markn[mm]
        if (M2 != "") {
          ok = 1; k2x = 0; m3x = ""
          for (k2 = 1; k2 < 9 && ok; k2++) {
            fl2 = wirkfrei(M2, k2); if (fl2 == "") continue
            n2 = split(fl2, fa, "\t"); ok2 = 0
            for (j = 1; j <= n2 && !ok2; j++) if (fa[j] == "-" || (fa[j] != "" && ueberholt(fa[j], M) == "")) ok2 = 1
            if (!ok2) { ok = 0; k2x = k2; m3x = WFM }
          }
          if (!(("t", M) in ordseen)) {
            ordseen["t", M] = 1
            if (!ok) hin("FREIGABE-ORDNUNG", f, id ": der Tag der Vormarke " M2 " gilt für " M " nicht weiter — Pflicht-Stand der Phase P" k2x " aus " m3x ((m3x != M2) ? " (für " M2 " übernommen)" : "") " ist für " M " überholt; neuer Tag mit Freigabe zu " M " (Kettenpruefung §Kette)")
            else if (!abschluss_tag(M, M2)) hin("FREIGABE-ORDNUNG", f, id ": kein eigener Tag zu Marke " M " — der Tag der Vormarke " M2 " gilt weiter (übernommen, Kettenpruefung §Kette). Produkt seit dem Tag unverändert? Das prüft der Lint nicht; der Abschluss-Stand von " M " führt den Tag mit „übernommen aus " vormarke(mi) "“")
          }
        }
      } else if (mi > 0) for (mm = mi - 1; mm >= 1 && !ok; mm--) {
        M2 = markn[mm]; if ((M2 in sackg) || !((M2, k) in frei)) continue
        fl2 = freigilt(M2, k, M); if (fl2 == "") continue   # nur abgelöste Freigaben, deren Nachfolger für M gilt
        n2 = split(fl2, fa, "\t")
        for (j = 1; j <= n2 && !ok; j++) if (fa[j] == "-" || (fa[j] != "" && ueberholt(fa[j], M) == "")) ok = 1
        if (!ok && altM2 == "") altM2 = M2
      }
      if (ok) continue
      sev = (k == 9 && n == 10 && rolle != "unbekannt") ? "E" : "H"
      if (("s", M, k, sev) in ordseen) continue
      ordseen["s", M, k, sev] = 1
      if (altM2 != "") msg = id " (" g "): Pflicht-Stand der Phase P" k " (" ppt[k] ") aus der Vormarke " altM2 " ist für " M " überholt — keine Übernahme; zu Marke " M " weder Freigabe noch Verzicht (`decision_type: verzicht`, `zielmarke: " M "`, `phase: P" k "`): für " M " neu bilden und freigeben — Freigabe-Ordnung (Kettenpruefung §Kette)" ((rolle == "unbekannt") ? "; Rolle des Repos nicht erkannt, nur Hinweis" : "")
      else msg = id " (" g "): kein freigegebener Pflicht-Stand der Phase P" k " (" ppt[k] ((k == 9 && rolle == "unbekannt") ? " oder Lieferungen" : "") ") zu Marke " M " — weder Freigabe noch Übernahme aus der Vormarke" ((k == 9) ? " (der Tag ist nicht verzichtbar)" : " noch Verzicht (`decision_type: verzicht`, `zielmarke: " M "`, `phase: P" k "`)") " — Freigabe-Ordnung (Kettenpruefung §Kette)" ((rolle == "unbekannt") ? "; Rolle des Repos nicht erkannt, nur Hinweis" : "")
      if (sev == "E") ordfehler("FREIGABE-ORDNUNG", f, id, msg "; Tag-Bedingung des Testplan-Stands")
      else hin("FREIGABE-ORDNUNG", f, msg)
    }
    # Koordinator (auch Komponente und Koordinator): Lieferungen vor dem
    # Testplan-Stand (Abschnitt „Zuliefernde Komponenten“ am Marken-Eintrag)
    # — erwartet werden die Komponenten, deren Übergabe-Stand zu dieser Marke
    # freigegeben oder aus einer Vormarke übernommen ist, d.h. für M nicht
    # überholt (Zielmarken §Meta „Zuliefernde Komponenten“); je Komponente entscheidet die
    # nächste Vormarke mit Übergabe an sie. Das eigene Repo ist nie Lieferant.
    # Eine Lieferungs-Zeile zählt über die Spalte Komponente, gleich welchen
    # Gegenstand sie nennt (Tag, Tag mit „(übernommen aus <Vormarke>)“,
    # `<repo>/Zielmarken` mit Marke im Text eines Zwischen-Koordinators).
    if (istkoord && n >= 10) {
      if (index(uebk[M], "|*") > 0 && !(("u", M) in ordseen)) { ordseen["u", M] = 1; hin("FREIGABE-ORDNUNG", f, id ": ein freigegebener Übergabe-Stand zu Marke " M " nennt keine Komponente (`komponente:` oder Gegenstand im Dateinamen) — erwartete Lieferungen nicht vollständig bestimmbar") }
      # erwartete Komponenten: Name und Herkunfts-Marke (leer = Übergabe zu M)
      nex = 0; split("", exs)
      ne = split(uebk[M], ea, "|")
      for (j = 1; j <= ne; j++) { kn = ea[j]; if (kn == "" || kn == "*" || (kanon(kn) in exs)) continue; exs[kanon(kn)] = 1; ex[++nex] = kn "\t" }
      mi = midx(M)
      if (mi > 0) for (mm = mi - 1; mm >= 1; mm--) {
        M2 = markn[mm]; if (M2 in sackg) continue
        ne = split(uebk[M2], ea, "|"); split(uebkf[M2], eaf, "|"); split("", exok); split("", exalt)
        for (j = 1; j <= ne; j++) {
          kn = ea[j]; if (kn == "" || kn == "*" || (kanon(kn) in exs)) continue
          if (eaf[j] != "" && ueberholt(eaf[j], M) == "") exok[kanon(kn)] = kn; else exalt[kanon(kn)] = kn
        }
        for (q in exok) { exs[q] = 1; ex[++nex] = exok[q] "\t" M2 }
        for (q in exalt) {
          if (q in exs) continue
          exs[q] = 1
          if (!(("a", M, q) in ordseen)) { ordseen["a", M, q] = 1; hin("FREIGABE-ORDNUNG", f, id ": Übergabe-Stand an `" exalt[q] "` aus der Vormarke " M2 " ist für " M " überholt — keine Übernahme, keine Lieferung zu " M " erwartet; für " M " neu bilden und freigeben (Kettenpruefung §Kette)") }
        }
      }
      for (j = 1; j <= nex; j++) {
        split(ex[j], e2, "\t"); kn = e2[1]; M2 = e2[2]
        if (OWN != "" && (kanon(kn) == tolower(OWN) || kanon(kn) == kanon(OWN))) continue
        # Komponente ist eine Zeile in §Komponenten (Kettenpruefung §Freigabe-Ordnung des Koordinators); sonst einmal Hinweis
        if (nkp > 0 && !(tolower(kn) in kpn2r) && !(tolower(kn) in kpr2n)) {
          if (!(("k", M, tolower(kn)) in ordseen)) { ordseen["k", M, tolower(kn)] = 1; hin("FREIGABE-ORDNUNG", f, id ": Übergabe-Stand an `" kn "` " ((M2 == "") ? "zu Marke " M " freigegeben" : "aus der Vormarke " M2 " für " M " übernommen") ", aber keine Zeile dieses Namens in §Komponenten (Komponente oder Repo-Name) — Lieferung nicht geprüft") }
          continue
        }
        if (geliefert(M, kn) || (("l", M, kanon(kn), (n == 10) ? "E" : "H") in ordseen)) continue
        ordseen["l", M, kanon(kn), (n == 10) ? "E" : "H"] = 1
        msg = id ": keine Lieferung der Komponente `" kn "`" (((tolower(kn) in kpn2r) && kpn2r[tolower(kn)] != kn) ? " (Repo-Name `" kpn2r[tolower(kn)] "`)" : "") " zu Marke " M " unter „Zuliefernde Komponenten“ am Marken-Eintrag gebucht — ihr Übergabe-Stand " ((M2 == "") ? "ist zu " M " freigegeben" : "aus der Vormarke " M2 " gilt für " M " weiter (übernommen; bei unverändertem Produkt den alten Tag mit „übernommen aus " M2 "“ buchen)") ", die Lieferungen vertreten den Tag (Kettenpruefung §Freigabe-Ordnung des Koordinators)"
        if (n == 10) ordfehler("FREIGABE-ORDNUNG", f, id, msg "; Tag-Bedingung des Testplan-Stands"); else hin("FREIGABE-ORDNUNG", f, msg)
      }
    }
  }
  # --- Nachrichten (Eintrag `message`): offene Nachrichten für C8, quelle
  for (f in files) {
    if (!isnach(f) || ftype[f] != "message") continue
    id = idof[f]; von = trim(fmget(f, "von"))
    if (OWN != "" && von != "" && von != OWN) hin("NACHRICHT", f, "`von: " von "` ist nicht das eigene Repo (`" OWN "` laut " ownsrc ")")
    ew = fw(fmget(f, "erwartet"))
    if (ew != "" && ew != "buchung" && ew != "antwort" && ew != "keine") err("NACHRICHT", f, "`erwartet: " ew "` (buchung | antwort | keine)")
    eigen[von "/" id] = 1
    if (fmget(f, "antwort_auf") != "") {
      w = trim(fmget(f, "antwort_auf"))
      if (index(w, "/") == 0) err("NACHRICHT", f, "`antwort_auf: " w "` ohne Qualifizierer `<absender>/`")
      else { g0 = qresolve(w); if (g0 == "?") ohnezugriff(QREPO, f, "`antwort_auf`"); else if (g0 == "") err("QUELLE", f, "`antwort_auf: " w "` — keine Nachricht mit dieser id bei `" QREPO "`") }
    }
    if (ew != "buchung" && ew != "antwort") continue
    m = vals(f, "an", varr)
    for (i = 1; i <= m; i++) {
      rr = varr[i]
      if (!(rr in nbok)) { ohnezugriff(rr, f, "Quittung zu " id); continue }
      quitt = 0
      for (k in nbyid) { split(k, kk2, SUBSEP); if (kk2[1] != rr) continue; g1 = nbyid[k]; if (index(g1, "/output/nachrichten/") > 0 && trim(nfm[rr, g1, "antwort_auf"]) == von "/" id) quitt = 1 }
      if (!quitt) hin("NACHRICHT-OFFEN", f, id " an `" rr "` (erwartet " ew "): keine Quittung mit `antwort_auf: " von "/" id "` — Meldung für C8")
    }
  }
  # beim Empfänger: Nachrichten der Nachbarn an das eigene Repo ohne Buchung
  if (OWN != "") for (k in nbyid) {
    split(k, kk2, SUBSEP); rr = kk2[1]; g1 = nbyid[k]
    if (index(g1, "/output/nachrichten/") == 0 || nfm[rr, g1, "type"] != "message") continue
    if (index("|" nfm[rr, g1, "an"] "|", "|" OWN "|") == 0) continue
    if (fw(nfm[rr, g1, "erwartet"]) != "buchung") continue
    ref = rr "/" kk2[2]; gebucht = (ref in qlref)
    if (!gebucht) for (f in files) if (index("|" fmget(f, "quelle") "|", "|" ref "|") > 0) { gebucht = 1; break }
    if (!gebucht) hin("NACHRICHT-OFFEN", ROOT, ref " (erwartet buchung) an `" OWN "`: keine Buchung mit `quelle: " ref "` — Meldung für C8")
  }
  # Nachbarn ohne Lesezugriff: Nachrichten an das eigene Repo nicht prüfbar
  for (rr in nbx) ohnezugriff(rr, kpf, "Nachrichten an das eigene Repo")
  # quelle: auflösen (Frontmatter und Zeilen mit „quelle“)
  for (f in files) {
    if (!((f, "quelle") in fm)) continue
    m = vals(f, "quelle", varr)
    for (i = 1; i <= m; i++) {
      w = varr[i]
      if (index(w, "/") == 0) { if (idpfx(w) == "MSG") err("QUELLE", f, "`quelle: " w "` ohne Qualifizierer `<absender>/`"); continue }
      g0 = qresolve(w)
      if (g0 == "?") ohnezugriff(QREPO, f, "`quelle:`")
      else if (g0 == "") err("QUELLE", f, "`quelle: " w "` — kein Knoten mit dieser id bei `" QREPO "`")
    }
  }
  for (i = 1; i <= nql; i++) {
    split(ql[i], q3, "\t"); f = q3[1]; w = q3[3]
    if (isout(f)) continue
    if (idpfx(substr(w, index(w, "/") + 1)) != "MSG") continue
    g0 = qresolve(w)
    if (g0 == "?") ohnezugriff(QREPO, f, "`quelle`-Verweise")
    else if (g0 == "") err("QUELLE", f, "Zeile " q3[2] ": `" w "` — keine Nachricht mit dieser id bei `" QREPO "`")
  }
  # --- Zielmarken: fuer_marke, abgeschlossene Marke ohne Abschluss-Stand
  for (i = 1; i <= nmkf; i++) {
    split(mkf[i], m3, "\t"); f = m3[1]; w = trim(m3[3])
    if (w !~ /^[^:]+:[^:]+$/) { err("FUER-MARKE", f, "`fuer_marke: " w "` — Format `<koordinator>:<marke>`"); continue }
    rr = substr(w, 1, index(w, ":") - 1); mm = substr(w, index(w, ":") + 1)
    if (rr == OWN && OWN != "") { if (!(mm in mark)) err("FUER-MARKE", f, "`fuer_marke: " w "` — keine Marke `" mm "`"); continue }
    if (!(rr in nbok)) { ohnezugriff(rr, f, "`fuer_marke`"); continue }
    if (!((rr, mm) in nbmark)) err("FUER-MARKE", f, "`fuer_marke: " w "` — keine Marke `" mm "` in den Zielmarken von `" rr "`")
  }
  if (OUTP != "") for (b in abgeschl) {
    found = 0
    for (f in stand) if (stand[f] == "abschluss-stand" && trim(fmget(f, "marke")) == b) found = 1
    if (!found) hin("ABSCHLUSS-STAND", markf, "abgeschlossene Marke `" b "` ohne Abschluss-Stand in output/ — der Pflicht-Stand des Marken-Abschlusses (Zielmarken §Meta, Wechsel-Prozedur; Marken, die vor Template-Stand 2.0 abgeschlossen wurden, haben keinen)")
  }
  # --- Glossar-Begriffe `vormals:` / `nicht verwenden:` in neuen Knoten
  for (i = 1; i <= nvw; i++) {
    split(vw[i], v4, "\t")
    hin("BEGRIFF", v4[1], "Zeile " v4[2] ": `" v4[4] "` steht im Glossar unter `" v4[3] ":` (Knoten ab Stichtag)")
  }
  # --- Ausgabe
  cmd = "LC_ALL=C sort -t \"\t\" -k3,3 -k1,1"
  for (i = 1; i <= nout; i++) print out[i] | cmd
  close(cmd)
  nnb = 0; for (r in nbok) nnb++; nnx = 0; for (r in nbx) nnx++; nst = 0; for (f in stand) nst++
  printf "\n== Zusammenfassung ==\n"
  printf "Modus: %s   Lesebereich: %s   Dateien: %d   Katalog-Typen: %d\n", MODE, ROOT, nfiles, nct
  printf "Stichtag: %s   Platzhalter-Links übersprungen: %d\n", (STICHTAG == "" ? "— (alles Bestand; Dateinamen- und seit-Befunde nur als Hinweis)" : STICHTAG ((STQ != "") ? " (aus " STQ ")" : "")), nplatz
  if (MODE == "projekt") {
    printf "Eigenes Repo: %s   Nachbarn gelesen: %d   ohne Zugriff: %d   Stände in output/: %d\n", (OWN == "" ? "— (nicht erkannt)" : OWN " (aus " ownsrc ")"), nnb, nnx, nst
    printf "Marken: %d   in-progress: %s   Rolle: %s   Übernahme-Art: %s\n", nmark, (nmark == 0 ? "—" : (inprog == "" ? "nicht erkannt" : inprog)), rolle, (istkomp ? (uebart == "" ? "— (nicht gelesen)" : uebart " (aus Aktivierter-Prozess)") : "—")
    printf "Freigabe-Einträge: %d   davon Pflicht-Freigaben: %d   Lieferungs-Zeilen: %d%s\n", nfrei, nfreip, nmkl, (ndfrei > 0 ? sprintf("   Freigaben im Nachtrag: %d%s", ndfrei, (ndfu < ndfrei ? sprintf(" (je Umgebung der jüngste: %d)", ndfu) : "")) : "")
  }
  printf "Glossar-Begriffe (vormals/nicht verwenden): %d   Fundstellen in neuen Knoten: %d\n", nterm, nvw
  printf "FEHLER: %d   HINWEISE: %d\n", nerr, nhin
  exit (nerr > 0 ? 1 : 0)
}
EOF

NFD=$(printf '\314\210')
awk -v ROOT="$ROOT" -v MODE="$MODE" -v STICHTAG="$STICHTAG" -v KENNT="$KENNT" \
    -v OHNE="$OHNE_HINWEISE" -v NFD="$NFD" -v OUTP="$OUTP" -v OWNARG="$OWNARG" \
    -v STQ="$STQ" -v HVBAD="$HVBAD" \
    -f "$AWK_CHECK" "$DATA"
RC=$?

cat <<'EOF'

== Nicht geprüft (bewusst) ==
- Wertlisten und Formate von Instanz-Feldern außer Präfix-Muster,
  `erwartet`, `herkunft`-Format und `fuer_marke`-Format (status, ampel,
  art, document_type, Datumsformate), Kann-/Optional-Felder, Inhalte;
  Listen-Felder nur auf „vorhanden“ (`[]` gilt als vorhanden).
- Katalog: Zeilen `Beispielname`, `Kanonizität`, `Struktur-Konventionen`
  nur auf Ort und Reihenfolge; `Singleton` ist Markierung (keine
  Pflicht); Inhalt von Zweck (außer „für …“ bei Pflicht-Ständen),
  Auslöser (außer dem Anfang) und Quell-Register und Filter.
- Drift Landkarte `Fassaden.md` ↔ `active:`; Feld-Drift Fassade ↔
  Detail-Knoten außer Status `abgelöst` ↔ `superseded_by:` (Wiki.md
  §4.1, §9.1) — LLM-Lint.
- Verwaiste Knoten, fehlende `index.md`-Einträge, nicht-verlinkte
  Erwähnungen (Wiki.md §9.1); Vererbungs-Konsistenz der Prozesse
  (§11.2) und Ablöse-Ketten über Prozess-Grenzen (§11.4) — LLM-Lint.
- Root-Dokumente (MasterPrompt, Wiki.md, Vorgehen …), `wiki/templates/`,
  Kopien in `output/<Dokument>_VV_TLA/`, Wikilinks in Dokumenten in
  `output/`, in Code-Spannen, Code-Blöcken und im Frontmatter,
  Platzhalter-Links (`<…>`, `-XXX`, `-NNN`, `…-Knoten` als Wort,
  `…`). Pfad- und Asset-Links (`[[ordner/Name]]`, `[[bild.png]]`)
  gelten im flachen `wiki/` als tot.
- Register-Lücke nur über die Zeile `Detail:` (bzw. Links, deren Ziel
  mit der ID beginnt); einzeilige Einträge ohne Detail-Zeile sind kein
  Befund. Typen ohne Fassade (z.B. MSG): keine Register-Prüfung.
  Verweise auf Register-Einträge ohne Detail-Knoten gelten als
  vorhanden (Status aus der Fassade); ihre Marke wird nicht verglichen.
- Katalog-Grammatik im Anwender-Projekt mit Bestandsschutz über `datum:`
  des Katalog-Eintrags (ohne `datum:` Bestand: Hinweis). Ob jeder
  mitgebrachte Katalog-Eintrag eine Zeile in `Katalog.md` hat (Wiki.md
  §11.3) — LLM-Lint.
- Zielmarken: Zustand nur aus der Zeile `- **Zustand:** …` des
  Marken-Eintrags (erstes Wort; andere Schreibung: Hinweis); der Zeiger
  `current` (genau eine abgeschlossene Marke trägt ihn) wird nicht
  geprüft, ebenso wenig der Marken-Wechsel-Eintrag im
  Entscheidungs-Register. Ruhe: nur die Zeile `- **Ruht seit:** …` im
  Abschnitt `## Marken` vor dem ersten Eintrag (keine `in-progress`-Marke
  dann kein Hinweis; Datum und Form der Zeile, nicht ob der Wechsel-Eintrag
  „Projekt ruht“ gebucht ist). Zwischenmarke: geprüft werden nur die Zeilen
  `Zustand: zurückgestellt (für <Z>)` und `Zwischenmarke:` (Vorgänger |
  Sackgasse) und ihr Zusammenspiel; ob die Zwischenmarke in der Abfolge
  vor der zurückgestellten Marke steht, ob Elemente einer Sackgasse
  `zielmarke:` tragen und ob der Agent Ankündigung und Fragen vorgelegt
  hat, prüft der Lint nicht; ob die Zeile `Zwischenmarke:` nach dem
  Festwerden geändert wurde, liest er nicht aus einer Historie, sondern nur
  als Widerspruch zum Bestand (Hinweis UEBERLAGERUNG, der die feste Zeile
  als Ursache nennt); der Vermerk „vormals …“ wird nicht gelesen. Doppelte
  Nachfolger nur zwischen Detail-Knoten mit `zielmarke:` (ein
  Bestands-Nachfolger ohne Feld ist nicht vergleichbar); gemeldet wird je
  Element die erste Marke der Abfolge, für die zwei Nachfolger gelten; die
  Wahl des Anwenders liest der Lint nur an der gebuchten Ablösung. Ein
  Bestands-Nachfolger ohne Feld während einer Zwischenmarke ist ein
  Hinweis ABLOESUNG-BESTAND; mit dem Vermerk „Ablösung von <E> gilt ab
  Marke <M> (Anwender <Datum>)“ am Nachfolger gilt er in der Marken-Regel
  ab M wie mit `zielmarke: M` (Ablösung, Überholt, Drift, doppelte
  Nachfolger — dort zählt er mit); ohne Vermerk bleibt die Bestands-Lesart.
  Gelesen wird nur diese Form, nur an einem Nachfolger ohne Feld (neben
  einem gesetzten Feld ist er wirkungslos) und nur die erste Vermerk-Zeile
  dieser Form — bei mehreren abgelösten Elementen eine Marke für alle; ob
  E im `supersedes:` des Nachfolgers steht, ist ein Hinweis, das Datum des
  Vermerks wird nicht gelesen. Ob während einer Zwischenmarke
  ein Prozess-Upgrade lief, prüft der Lint nicht (die Ordner-Freigabe trägt
  keine lesbare Form). Nachtrag „Tag korrigiert“: gelesen werden die beiden
  Tag-Namen und, mit Prozess, die Tag-Freigabe in der Formel des Nachtrags
  (Name und Marke; sie zählt als Tag-Freigabe der Marke) — nicht, ob die
  alte Tag-Freigabe im Register steht. Nachtrag eines Deploy-Stands: gelesen
  wird die Formel „Stand <Datei mit Version> von Deploy-Stand, freigegeben
  für P11 Ausliefern zu Marke <M>“ in einer Vermerk-Zeile am Marken-Eintrag
  (x als Dateiname ohne Endung oder als Version; die Freigabe zählt als
  Pflicht-Freigabe P11 der Marke und als Freigabe des Stands; ein eigener
  Eintrag für denselben Stand daneben ist ein Hinweis — abgeglichen über
  die aufgelöste Stand-Datei, ein Eintrag ohne eindeutige Stand-Datei wird
  dafür nicht gelesen; nennt er keine Umgebung eindeutig, sagt ein Hinweis
  FREIGABE-STAND das) — nicht „freigegeben vom Anwender“, Nachweise und
  Einschränkung; die Freigabe-Ordnung wird für den Nachtrag nicht erneut
  geprüft. Je Umgebung (`umgebung` im Kopf der Stand-Datei, sonst der
  Gegenstand des Dateinamens) gilt der jüngste Nachtrag — gelesen wird das
  Datum der Vermerk-Zeile, bei gleichem Datum die spätere Zeile; ob ein
  weiterer Stand derselben Umgebung wirklich anders ausgerollt wird oder
  Betrieb wäre, liest der Lint nicht; eine zweite Ketten-ID für dieselbe
  Umgebung ist ein Hinweis, mehr nicht. Eine Behebung in einer Sackgasse wird
  gegen keine andere Marke verglichen (eine Sackgasse ist nur für sich eine
  frühere Marke): ein BUG einer anderen Marke mit einer Fix-Anforderung in
  der Sackgasse ist kein Befund. Ablösung mit einem Ziel ohne Detail-Knoten
  (Register-Eintrag): zulässig; die Gegenseite ist dann nicht prüfbar, die
  Marke eines solchen Nachfolgers liest der Lint aus dem Feld `Zielmarke`
  des Eintrags.
  Pflichtfeld `zielmarke:` (seit 2.0) an
  Detail-Knoten über die Pflichtfeld-Zeile der Katalog-Einträge (Fehler
  ab Stichtag, Hinweis am Bestand — Stichtags-Feld ist das Anlage-Datum
  `datum:`; ohne `datum:` immer Hinweis, der Knoten gilt als Bestand, ein
  neues Element ohne Anlage-Datum ist an keinem anderen Merkmal erkennbar);
  an einem Eintrag ohne Detail-Knoten nur aus dem Feld `Zielmarke` des
  Eintrags (Feldzeile, auch `zielmarke`, oder in der Status-Zeile; eine
  Klammer in der Überschrift wird nicht gelesen), Stichtags-Feld die Zeile
  `Angelegt` (fehlt sie: Hinweis, der Eintrag gilt als Bestand); nicht
  gelesen wird, ob der Wert beim Anlegen die `in-progress`-Marke war, und
  nicht, ob ein Anlage-Datum nachträglich geändert wurde. Heilweg: der
  Vermerk `- **Vermerk <Datum>:** Zielmarke <M> (nachgetragen)` wird wie
  das Feld gelesen — im Detail-Knoten die erste Zeile dieser Form (an
  beliebiger Stelle des Texts, nicht nur in der Sektion Vermerke), im
  Eintrag ohne Detail-Knoten die erste unter seiner Überschrift; neben
  einem gesetzten Feld ist er wirkungslos, sein Datum wird nicht gelesen,
  ob M die Marke ist, die das Feld beim Anlegen hätte tragen müssen, nicht
  geprüft. Mit Detail-Knoten gilt dem Lint die Marke des Fassaden-Eintrags
  (Feldzeile, Status-Zeile oder Vermerk „nachgetragen“), sobald er eine
  nennt — weicht der Knoten ab, Hinweis ZIELMARKE-DRIFT, und alle weiteren
  Prüfungen lesen die Marke des Eintrags; fehlt sie dem Knoten, bleibt es
  beim Fehler PFLICHTFELD am Knoten, gelesen wird trotzdem der Eintrag;
  nennt der Eintrag keine Marke, bleibt es beim Knoten — eine fehlende
  Anzeige im Eintrag und ein Klammer-Zusatz in der Überschrift sind kein
  Befund. Beim
  Freigabe-Eintrag wird `zielmarke:` gegen die Marke der Freigabe
  verglichen (Hinweis), beim Marken-Wechsel-Eintrag nicht (der Lint liest
  ihn nicht). Ein abgelöster Freigabe-Eintrag zählt für eine Marke
  weiter, solange der Nachfolger (aus `superseded_by:` seines
  Detail-Knotens) für diese Marke nicht gilt — je geprüfter Marke
  entschieden; ohne Detail-Knoten zählt er nicht, eine abgelöste
  Tag-Freigabe nur gegen ihre eigene Marke, weitere Prüfungen an ihm
  entfallen. Am BUG wird je Eintrag der Liste `fix_requirement:` (ein
  Einzelwert zählt als Liste mit einem Eintrag) nur gelesen, ob die Marke
  der REQ vor der Marke des BUG liegt (Fehler, ohne Ausnahme; Sackgassen
  sind nicht vergleichbar; die Zeile `Zwischenmarke:` wird dafür nicht
  gelesen), und an der Fix-Anforderung (`requirement_type: fix`), ob
  `behebt:` einen BUG nennt (sonst Hinweis); die Beidseitigkeit beider
  Verweise ist ein Hinweis an jeder Anforderung in der Liste, gleich
  welchen Typs, und nur zwischen Detail-Knoten lesbar (ein Eintrag ohne
  Detail-Knoten trägt die Felder nicht). Ob die Marke des BUG der
  Produkt-Stand ist, an dem der Fehler beobachtet wurde, prüft der Lint
  nur bei einem BUG mit `gefunden_in:` auf einen Testbericht — dessen
  `marke` gegen `zielmarke:`, Abweichung ist ein Hinweis MARKE-HERKUNFT;
  bei einer Betriebsmeldung trägt der BUG keinen lesbaren Verweis auf den
  Deploy-Stand. Ob ein BUG behoben ist — erst über die Anforderung
  der regulären Linie, eine Anforderung in einer Sackgasse ist ein
  Workaround —, liest der Lint nicht (Status-Achse des BUG). Der Status
  `abgelöst` eines verwiesenen Elements ist für einen Stand kein Befund;
  gewertet wird nur, ob ein Nachfolger für die Marke des Stands gilt. Ein
  Bestands-Element ohne Feld gilt in der Marken-Regel für jede Marke, ein
  Bestands-Nachfolger ohne Feld ab der laufenden Marke (Näherung für „ab
  Annahme“; während einer Zwischenmarke vor der Marke seiner Annahme
  sieht die Zwischenmarke ihn). Überlagerung nur aus dem Frontmatter-Feld
  `ueberlagert:` eines Detail-Knotens (Fassaden-Zeilen und Vermerke im
  Text nicht); ob die Rückfrage zur Übernahme gestellt und ihr Vermerk
  am Marken-Eintrag der Sackgasse gebucht ist und ob übernommene
  Elemente `vorgaenger:` tragen, prüft der Lint nicht; die Überholt-Regel
  liest Überlagerungen nicht (ein Stand der Sackgasse mit überlagertem
  Element ist ein Fehler MARKEN-REGEL; ist der Stand nach den
  Freigabe-Einträgen schon freigegeben — oder ist er der für die laufende
  Sackgasse aus der Vormarke wirksame Pflicht-Stand (eigene Freigabe der
  Sackgasse zuerst, sonst die der nächsten Vormarke mit Freigabe), der
  übernommen würde —, ein Hinweis UEBERLAGERUNG mit Rückfrage, nie ein Hinweis
  UEBERHOLT; ob die Überlagerung zeitlich nach der Freigabe lag und wie
  der Anwender geantwortet hat, liest der Lint nicht); Marken-Regel
  und Überholt nur für die jüngste Version je Stand (Ketten-ID vor
  `_VV_TLA`), freigegeben oder nicht (Freigabe-Einträge zählen hier nur
  für den Hinweis UEBERLAGERUNG). Überholt nur, wenn der Nachfolger für
  die Marke des Stands gilt; ein Nachfolger erst ab einer späteren Marke
  bleibt still. Ein Stand einer abgeschlossenen Marke, dessen `herkunft`
  eine ältere Version eines Stands nennt, zu der eine jüngere Version
  derselben Ketten-ID mit derselben Marke liegt (weiterer Deploy-Stand
  derselben Umgebung im Nachtrag), liest den Vorgänger als diese jüngste
  Version und ist dadurch nicht überholt — der Abschluss-Stand bleibt
  eingefroren (Einfrieren-und-Abloesen §Überholt-Regel); ob die jüngere
  Version im Nachtrag freigegeben ist, liest die Überholt-Berechnung
  nicht. Für
  Stände der Vormarke, die für die laufende Marke überholt sind, nur
  Pflicht-Stände ohne den Abschluss-Stand, je Herkunfts-Kette eine
  Meldung am ersten überholten Stand (abhängige Stände angehängt). Die
  Ausweisung „nicht berücksichtigt (offen)“ im Kopf eines Stands wird
  nicht geprüft.
- Freigabe-Einträge: nur DEC-Einträge der Fassade, deren Gegenstand die
  Formel wörtlich trägt; „Zweck“ als Wort ist zulässig, aber nicht
  Pflicht. Formel-Abweichung: Hinweis; Fehler nur, wenn der Eintrag mit
  „Stand “ beginnt und „freigegeben für“ enthält. Eine Stand-Datei wird
  über ihren Dateinamen mit der Version der Formel in den Feldern des
  Eintrags („Verweise“ zuerst, bei mehreren die zu ⟨Artefakt⟩ passende;
  der Dateiname mit Endung `.md` oder ohne Endung als ganzes Wort; ein
  Wikilink mit Endung ist ein toter Link)
  oder über Version und ⟨Artefakt⟩ gesucht; ohne Datei gilt der Zusatz
  „zu Marke M“ (fehlt er: Fehler ab Stichtag, sonst Hinweis — eine
  Freigabe ohne Stand-Datei nennt die Marke immer), Dokumenttyp und
  Ordnung entfallen.
  Pflicht-Freigabe ist der Stand eines Pflicht-Dokumenttyps, dessen
  Zweck an der Phasen-Angabe `Pn` zum Katalog-Zweck passt („für P10“
  genügt; ohne `Pn` im Katalog-Zweck Vergleich am Anfang); passt er
  nicht: Hinweis, nicht gezählt. Tag der Implementierung nur als
  „Stand <Tag> von Implementierung, freigegeben für P10 … zu Marke M“;
  ohne Marke nicht zugeordnet (Fehler ab Stichtag); Nachweise (Tests
  grün, Code-Review) werden nicht gelesen. Die Ordnung prüft nur
  Vorhandensein, nicht die zeitliche Reihenfolge der Einträge;
  Einschränkungen im Eintrag (fehlender Vorgänger, offene BUG,
  Prüf-Modell = Bau-Modell) werden nicht gelesen. Übernahme aus der
  Vormarke: jede frühere Marke mit gültiger Pflicht-Freigabe zählt,
  solange der Stand für die geprüfte Marke nicht überholt ist (ist er
  überholt, eine Meldung je Marke und Phase mit dem Grund); der
  Abschluss-Stand („übernommen aus“) wird für Stände nicht gelesen.
  Übernahme des Tags (unverändertes Produkt): nur der Tag der nächsten
  Vormarke mit Tag-Freigabe, und nur, wenn keiner der für diese
  Vormarke wirksamen Pflicht-Stände der Phasen vor P9 — ihre eigenen
  Freigaben, sonst die der nächsten Marke davor mit Freigabe (ein
  Verzicht auf dem Weg beendet die Suche) — für die geprüfte Marke
  überholt ist; welche Stände der Tag tatsächlich trägt, steht in
  keinem lesbaren Feld; ob das Produkt seit dem Tag unverändert ist
  (kein Commit), prüft der Lint nicht (Hinweis je Marke, kein
  git-Zugriff). Der Hinweis entfällt, wenn ein Abschluss-Stand der
  geprüften Marke (jüngste Version je Ketten-ID, freigegeben oder nicht)
  eine Zeile mit „übernommen aus <Vormarke>“ und dem Tag-Namen oder dem
  Wort „Tag“ bzw. „Implementierung“ trägt — mehr wird im Abschluss-Stand
  nicht gelesen. Ein Verzicht auf P9 gilt nie (Fehler, auch ohne
  `zielmarke:`); `phase:` zählt nur in der Form `Pn` (eine Phase, keine
  führende Null), sonst Hinweis und kein Verzicht; eine Verzichts-DEC mit
  `zielmarke:` und ohne `phase:` ist mit Prozess ein Hinweis, ohne Prozess
  der Verzicht auf „Tests grün“, den der Lint nicht liest und nicht
  meldet. Ohne Prozess — kein
  Pflicht-Dokumenttyp mit Phase `Pn` — ist der Tag kein Pflicht-Glied,
  die Freigabe-Ordnung entfällt auch gegen den Abschluss-Stand
  (Kettenpruefung §Kette, Projekt ohne Prozess); am Abschluss-Stand wird
  dann nur gelesen, ob eine Zeile das Wort „Tag“ bzw. „Implementierung“ trägt
  (sonst Hinweis), nicht der Tag-Name; eine trotzdem gebuchte
  Tag-Freigabe wird nicht gemeldet. Fehler an
  Freigabe-Einträgen (Formel, Tag-Bedingung, Tag ohne Marke) nur für
  Einträge mit Datum ab Stichtag, sonst Hinweis. Rolle des Repos aus der
  Spalte Rolle (RP-1), sonst `fuer_marke:` am Marken-Eintrag (nur die
  Zeile `- **fuer_marke:** …`; Komponente, auch ohne Zeilen in
  §Komponenten), ohne §Komponenten oder mit genau der eigenen Zeile
  Standalone, sonst Koordinator; `fuer_marke:` und daneben mindestens
  eine Unter-Komponente in §Komponenten — eine Zeile, für die dieses
  Repo einen Übergabe-Stand gebildet hat (freigegeben oder nicht; Name
  aus `komponente:` oder dem Gegenstand im Dateinamen), die Zeile des
  Koordinators, bekannte Nachbarn und die eigene Zeile zählen nicht:
  Komponente und Koordinator (Zwischen-Koordinator — P1–P4 wie
  Komponente, P6 und Lieferungen wie Koordinator, P7–P9 mit eigener
  Zeile, P11 und DEPL für eigene Zeile und Unter-Komponenten nur mit
  Zielumgebungen; auch ohne erkanntes eigenes Repo); eigenes Repo nicht
  erkannt und kein `fuer_marke:`: Rolle unbekannt (P1–P4, P6–P8 still,
  P9 durch Tag oder Lieferungen, alles nur Hinweis). Die
  Übernahme-Art (selbstständig / Auftrag) wird nur aus der Zeile
  `- **Übernahme-Art:**` im Abschnitt `## Herkunft` von
  `wiki/Aktivierter-Prozess.md` gelesen (erstes Wort): selbstständig —
  P3/P4 der Komponente sind Pflicht; Auftrag oder nicht lesbar — P1–P4
  still (bei nicht lesbar ein Hinweis); P6 der Komponente immer still.
  Ob die gebuchte Rolle im Herkunfts-Vermerk zur erkannten Rolle passt,
  wird nicht verglichen.
  Lieferungen: erwartet von den Komponenten, deren Übergabe-Stand zu
  dieser Marke freigegeben oder aus einer Vormarke übernommen ist (für
  die geprüfte Marke nicht überholt; je Komponente entscheidet die
  nächste Vormarke mit Übergabe an sie) und die eine Zeile in
  §Komponenten haben (sonst Hinweis); das eigene Repo nie; eine
  Übergabe je Komponente wird nicht verlangt. Gelesen wird die Spalte
  „Komponente“ (Repo- oder Komponenten-Name) der Tabelle unter
  „Zuliefernde Komponenten“, bei Listenzeilen oder Tabellen ohne diese
  Spalte der Name als Wort in der Zeile (qualifizierte Verweise
  `<repo>/<ID>` zählen nicht); der Gegenstand der Lieferung (Tag, Tag
  mit „(übernommen aus <Vormarke>)“, Verweis `<repo>/Zielmarken` mit
  der Marke im Text bei einem Zwischen-Koordinator, `quelle:`) wird
  nicht gelesen — ob eine übernommene Lieferung ein unverändertes
  Produkt meint, bleibt Sache der Komponente.
- Qualifizierte Verweise `<repo>/<ID>` in Ständen nur mit bekanntem
  Repo-Namen oder einem Präfix aus dem Katalog; ein Qualifizierer mitten
  in einem Pfad oder einer URL zählt nicht. `STAND-CON` liest nur den
  Status der CON (angenommen), nicht ihre Marke; `ABSCHLUSS-STAND` ist
  unabhängig vom Stichtag immer ein Hinweis.
- Eigenes Repo nicht erkannt (Hinweis): Nachrichten an das eigene Repo,
  SPEC- und DEPL-Deckung und Lieferungen entfallen, Rolle unbekannt;
  mit `--repo`, aber ohne eigene Zeile in §Komponenten (Hinweis): SPEC-
  und DEPL-Deckung entfallen (Rolle Koordinator ohne Bauteile). Beim
  Empfänger nur `erwartet: buchung` ohne Buchung; `erwartet: antwort`,
  die Quittung nach der Buchung und `bezug` der Quittung nicht. `vorgaenger:` nicht als Liste
  geprüft.
- Stichtag per `--stichtag`, sonst im Projekt aus der festen Zeile
  `- **Template-Stand:** <Version> seit YYYY-MM-DD` im Abschnitt
  `## Herkunft` von `wiki/Aktivierter-Prozess.md` (nur dieser Ort, nur
  das Datum hinter `seit`; Version und `Quelle` werden nicht gelesen;
  die Option geht vor, eine Abweichung wird nicht gemeldet). Anlage-Datum:
  `datum:` des Knotens, am Eintrag ohne Detail-Knoten die Zeile
  `Angelegt` (fehlend = Bestand; `datum:` in anderem Format als
  YYYY-MM-DD gilt als fehlend — Hinweis, bei Ständen Stichtag dann nach
  dem Datum der Ketten-ID). Ein toter Link im Ablöse-Vermerk
  `> **⚠ Abgelöst durch [[<ID>]]**` eines Bestands-Knotens ist ein
  Hinweis; ob der Vermerk zum Feld `superseded_by:` passt, wird nicht
  gelesen. Pflicht-Fassaden und die Abhängigkeit Fehlermeldungen →
  Anforderungen nur über `type:` und `active:` der Dateien unter
  `wiki/`; andere Abhängigkeiten zwischen Fassaden kennt der Lint nicht.
  Altknoten aus 1.x (`ALTBESTAND`) nur `type: deployment` und
  `type: testplan` unter `wiki/` im Bestand; Contract-Einträge mit
  `fassung` und die REQ-Sektion „Nachweis“ bleiben still (Kann-Felder
  und Abschnitte werden nicht geprüft).
  Glossar-Begriffe nur in Knoten mit `datum:` ab Stichtag;
  Freigabe-Datum je Begriff nicht gelesen.
- Kettenprüfung nur „mindestens einer“ (Hinweis) über Detail-Knoten mit
  `abgeleitet_von:`/`prueft:`; Vollständigkeit, Widerspruch und
  Unbegründetes bleiben Prüfer-Sache (Kettenpruefung §Reviewer-Anteil).
  Eine Fix-Anforderung auf einen Deploy (`requirement_type: fix` mit
  `umgebung:`) ohne Erwartung an FUNC und TEST; ihr Vermerk „Umgesetzt
  mit Stand <Datei mit Version> von Deploy-Stand, freigegeben zu Marke
  <M>“ wird gelesen (Stand-Datei vorhanden und Deploy-Stand, Marke wie
  `zielmarke:`, Stand-Datei in einer Nachtragszeile oder einem
  Freigabe-Eintrag genannt; nur im Detail-Knoten, nur die erste Zeile) —
  ob er zur Umgebung der Anforderung gehört und ob ihre `zielmarke:` die
  Marke des ausgelieferten Stands ist, wird nicht geprüft.
  Delegation zählt jeden Übergabe-Stand, freigegeben oder nicht; „DEPL
  passt zu ARC“ und die Abdeckung der CON durch SPEC. DEPL-Deckung nur
  im Repo mit Zielumgebungen (Koordinator und Standalone: alle Zeilen
  in §Komponenten, auch eine Zeile der Rolle Koordinator; Komponente:
  eigene Zeile; Komponente und Koordinator: eigene Zeile und die Zeilen
  seiner Unter-Komponenten — beim übergeordneten Koordinator stehen deren
  DEPL unter der Zeile des Zwischen-Koordinators und zählen für sie;
  Rolle unbekannt: entfällt).
- Contract ↔ Zuschnitt nur über lokale CON-Detail-Knoten mit
  `abgeleitet_von:` auf ein ARC-Element; `provider:` und Consumer werden
  über §Komponenten verglichen (Komponenten-Name ↔ Repo-Name, ohne
  Groß-/Kleinschreibung) — welche der beiden Formen ein Feld trägt,
  wird nicht gemeldet. Consumer gelten als registriert, wenn der Name
  (in einer der beiden Formen) als Wort in einer Listen- oder
  Tabellenzeile des CON-Eintrags im Contract-Index steht (Abmeldungen,
  „seit“ und `quelle:` der Registrierung nicht gelesen); die
  Stichtags-Schwere folgt dem `datum` des CON-Knotens. Externe
  Consumer ohne ARC-Bezug nicht.
- Existenz von Tags (`herkunft`, Lieferungen) — kein git-Zugriff; Zweig
  einer Zwischenmarke und seine Zurückführung; Release-Notes-Filter
  (selbsttragend, ohne IDs); Inhalt von Nachtrags-Vermerken am
  Marken-Eintrag außer der Zeile „Tag korrigiert: <alt> → <neu>“ (gelesen
  werden nur die beiden Tag-Namen — ob die Pfade des Produkts zwischen
  beiden unverändert sind und ob der Anwender freigegeben hat, nicht) und
  der Freigabe-Formel eines nachgetragenen Deploy-Stands (gelesen werden
  Stand — in jeder Schreibweise des Felds „Verweise“ — und Marke, nicht
  die Freigabe durch den Anwender).
- Widerspruch und Unbegründetes bleiben Prüfer-Sache.
EOF

exit $RC
