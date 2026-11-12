#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""normen-holen — Bundesgesetze von gesetze-im-internet.de laden und
mechanisch (ohne Sprachmodell) nach Markdown wandeln.

Ein Lauf holt einen Paket-Stand und legt ihn als Rechercheartefakt ab:

  research/REC-NNN - Normen-Paket Stand JJJJ-MM-TT/
      JJJJ-MM-TT <kuerzel>.xml      amtliches XML (aus xml.zip entpackt)
      JJJJ-MM-TT <kuerzel>.pdf      PDF der Quelle (digital erzeugter Beleg)
      JJJJ-MM-TT <kuerzel>.md       Lesefassung mit Ankern je Norm
      manifest.tsv                  Prüfsummen, Abrufzeit, Stand-Zeile, Zählung
      JJJJ-MM-TT normen-holen.log   Lauf-Log
  wiki/REC-NNN — Normen-Paket Stand JJJJ-MM-TT.md   Detail-Knoten des REC

Je Gesetz aus tools/normen-liste.tsv:
  1. Slug gegen das Inhaltsverzeichnis gii-toc.xml prüfen
  2. <slug>/xml.zip und das PDF (Link aus der Startseite) laden
  3. ZIP prüfen, XML entpacken, auf Wohlgeformtheit prüfen
  4. Markdown schreiben
  5. Normenzahl und Text (Buchstaben und Ziffern je Norm) zwischen XML
     und Markdown abgleichen, PDF-Signatur prüfen
  6. Ergebnis in manifest.tsv eintragen
Zum Schluss den REC-Knoten schreiben bzw. seinen Abschnitt
„Auffälligkeiten der Quelle“ aus den Hinweisen des Laufs füllen.

Ein Stand ist ab Anlage eingefroren. Ein Lauf legt genau einen neuen
REC-Ordner an (Vorgabe: heutiges Datum, nächste freie REC-Nummer) und
schreibt nur dorthin. Liegt der Ordner des genannten Stands schon vor —
gleich ob mit oder ohne Knoten, Register-Zeile oder Kennzeichen
„mitgeliefert“ —, bricht das Werkzeug ab, ohne etwas zu schreiben; es gibt
keinen Schalter zum Überschreiben, Fortsetzen oder Nachbessern. Ein neuer
Stand, ein neuer Konverter oder ein nachgeholtes Gesetz ist immer ein neuer
REC neben dem alten (Nachweise wachsen nur). Den Rest eines abgebrochenen
Laufs (Ordner ohne Knoten) entfernt der Anwender von Hand; das Werkzeug
löscht nie.

Bekannte Form des Manifests: dieses Werkzeug schreibt manifest.tsv mit der
Spalte „hinweise“ (Hinweise des Laufs je Gesetz); das mitgelieferte
Manifest des Stands 2026-11-05 (REC-9001) wurde mit einer früheren Fassung
erzeugt und trägt diese Spalte nicht. Es wird nicht umgeschrieben.

Nur Standardbibliothek. Einzelheiten: tools/README.md.
"""

import argparse
import csv
import datetime as dt
import hashlib
import html
import io
import os
import re
import sys
import time
import unicodedata
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
import zipfile

WERKZEUG = "normen-holen"
VERSION = "1.2"
# Konverter-Version: steht je Gesetz im Manifest. Ändert sich die
# Umwandlung, entsteht ein neuer Stand (neuer Lauf, neuer REC); ein
# bestehender Stand wird nicht neu konvertiert.
KONVERTER = "1.3"

HOST = "www.gesetze-im-internet.de"
BASIS = "https://" + HOST + "/"
TOC_URL = BASIS + "gii-toc.xml"
USER_AGENT = WERKZEUG + "/" + VERSION
MIN_ABSTAND = 1.1          # Sekunden zwischen zwei Anfragen
VERSUCHE = 5               # Anfragen je URL
TIMEOUT = 60               # Sekunden je Anfrage
HINWEIS_TEXT = ("Mechanisch aus dem XML von gesetze-im-internet.de erzeugt; "
                "nicht die amtliche Verkündungsfassung (maßgeblich ist das "
                "Bundesgesetzblatt). Amtliches Werk, gemeinfrei nach § 5 UrhG.")
KONV = "Hinweis des Konverters"   # Präfix aller eingefügten Markierungen
LABEL_FN = "Fußnote"

MANIFEST_SPALTEN = [
    "kuerzel", "slug", "xml_url", "pdf_url", "sha256_zip", "sha256_xml",
    "sha256_pdf", "sha256_md", "abrufzeit", "stand", "builddate",
    "normen_xml", "einzelnormen_xml", "einzelnormen_md", "konverter",
    "status", "hinweise",
]
# Die Spalte „hinweise“ trägt die Hinweise des Laufs je Gesetz; das
# mitgelieferte Manifest des Stands 2026-11-05 (frühere Fassung) hat sie
# nicht — bekannte Form, wird nicht umgeschrieben (siehe Kopf).
# Hinweise des Laufs, die der REC-Knoten im Abschnitt „Auffälligkeiten der
# Quelle“ aufnimmt (je Gesetz in der Spalte hinweise des Manifests).
HINWEIS_CODES_REC = ("TITEL-ABWEICHUNG", "SLUG-GEAENDERT", "PDF-MEHRDEUTIG",
                     "ELEMENT-UNBEKANNT", "BILD-FEHLT")
NOCH_NICHT_ABSCHLIESSEND = "noch nicht abschließend bearbeitet"

EXIT_OK, EXIT_FEHLER, EXIT_AUFRUF = 0, 1, 2
# Abhilfe bei Fehlern je Gesetz: ein Stand ist eingefroren, nachgebessert
# wird nie — der Stand bleibt mit dem Fehler-Status im Manifest stehen, oder
# der Anwender entfernt den unvollständigen Ordner und startet neu.
ABHILFE_NEUER_STAND = ("neuen Stand anlegen (neuer Lauf, neuer REC; ein bestehender Stand wird nicht "
                       "nachgebessert) oder den unvollständigen Ordner von Hand entfernen und neu starten")


# --------------------------------------------------------------------------
# Meldungen
# --------------------------------------------------------------------------

class Log:
    """Schreibt nach stderr und (falls angegeben) in eine Log-Datei."""

    def __init__(self, pfad=None):
        self.datei = open(pfad, "a", encoding="utf-8") if pfad else None
        self.pfad = pfad
        self.hinweise = {}   # ort (Kürzel) -> Liste "CODE: was" für den REC-Knoten

    def _out(self, zeile):
        stempel = dt.datetime.now().astimezone().strftime("%Y-%m-%dT%H:%M:%S%z")
        text = stempel + "  " + zeile
        print(text, file=sys.stderr, flush=True)
        if self.datei:
            self.datei.write(text + "\n")
            self.datei.flush()

    def info(self, text):
        self._out("INFO     " + text)

    def befund(self, schwere, code, ort, was, warum=None, tun=None):
        """Befund-Zeile nach dem Vorbild von _Template/tools/lint.sh:
        SCHWERE  CODE  ort: was — Ursache: warum — Abhilfe: tun"""
        teile = [was]
        if warum:
            teile.append("Ursache: " + warum)
        if tun:
            teile.append("Abhilfe: " + tun)
        self._out("%-8s %s  %s: %s" % (schwere, code, ort, " — ".join(teile)))

    def fehler(self, code, ort, was, warum=None, tun=None):
        self.befund("FEHLER", code, ort, was, warum, tun)

    def hinweis(self, code, ort, was, warum=None, tun=None):
        self.befund("HINWEIS", code, ort, was, warum, tun)
        if code in HINWEIS_CODES_REC:
            self.hinweise.setdefault(ort, []).append("%s: %s" % (code, was))


def aufruf_fehler(text, tun=None):
    meldung = WERKZEUG + ": " + text
    if tun:
        meldung += " — Abhilfe: " + tun
    print(meldung, file=sys.stderr)
    sys.exit(EXIT_AUFRUF)


class GesetzFehler(Exception):
    """Fehler, der ein einzelnes Gesetz abbricht (Befund ist schon geloggt)."""

    def __init__(self, code):
        super().__init__(code)
        self.code = code


# --------------------------------------------------------------------------
# Netz
# --------------------------------------------------------------------------

class Netz:
    def __init__(self, log):
        self.log = log
        self.letzte = 0.0
        self.anfragen = 0

    def hole(self, url, ort):
        """Lädt url; höchstens eine Anfrage je MIN_ABSTAND Sekunden,
        Wiederholung mit exponentiellem Backoff. Gibt Bytes zurück oder
        wirft GesetzFehler (Befund geloggt)."""
        teile = urllib.parse.urlsplit(url)
        if teile.scheme != "https" or teile.hostname != HOST:
            self.log.fehler("URL-FREMD", ort, "URL %s liegt nicht auf %s" % (url, BASIS),
                            "das Werkzeug lädt nur von gesetze-im-internet.de",
                            "Slug in tools/normen-liste.tsv bzw. Link der Startseite prüfen")
            raise GesetzFehler("URL-FREMD")
        letzter_grund = ""
        for versuch in range(1, VERSUCHE + 1):
            warte = self.letzte + MIN_ABSTAND - time.monotonic()
            if warte > 0:
                time.sleep(warte)
            self.letzte = time.monotonic()
            self.anfragen += 1
            req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
            nachlauf = None
            try:
                with urllib.request.urlopen(req, timeout=TIMEOUT) as antwort:
                    daten = antwort.read()
                    endziel = urllib.parse.urlsplit(antwort.geturl())
                    if endziel.hostname != HOST:
                        self.log.fehler("URL-FREMD", ort, "%s leitet um nach %s" % (url, antwort.geturl()),
                                        "Umleitung auf einen fremden Host", "Slug prüfen; Seite im Browser öffnen")
                        raise GesetzFehler("URL-FREMD")
                    return daten
            except urllib.error.HTTPError as e:
                if e.code == 404:
                    self.log.fehler("HTTP-404", ort, "%s nicht gefunden (HTTP 404)" % url,
                                    "Slug falsch oder Gesetz auf gesetze-im-internet.de umbenannt bzw. entfernt",
                                    "Slug mit --liste-pruefen gegen gii-toc.xml abgleichen und in tools/normen-liste.tsv korrigieren")
                    raise GesetzFehler("HTTP-404")
                if e.code not in (408, 429) and e.code < 500:
                    self.log.fehler("HTTP-%d" % e.code, ort, "%s: HTTP %d %s" % (url, e.code, e.reason),
                                    "der Server lehnt die Anfrage ab",
                                    "URL im Browser prüfen; bei 403 später erneut versuchen")
                    raise GesetzFehler("HTTP-%d" % e.code)
                letzter_grund = "HTTP %d %s" % (e.code, e.reason)
                ra = e.headers.get("Retry-After") if e.headers else None
                if ra and ra.isdigit():
                    nachlauf = min(int(ra), 300)
            except (urllib.error.URLError, TimeoutError, ConnectionError, OSError) as e:
                grund = getattr(e, "reason", e)
                letzter_grund = "%s: %s" % (type(e).__name__, grund)
            if versuch < VERSUCHE:
                pause = nachlauf if nachlauf is not None else 2 ** versuch
                self.log.hinweis("NETZ-WIEDERHOLUNG", ort,
                                 "Versuch %d/%d für %s gescheitert (%s), neuer Versuch in %d s"
                                 % (versuch, VERSUCHE, url, letzter_grund, pause))
                time.sleep(pause)
        self.log.fehler("NETZ", ort, "%s nach %d Versuchen nicht ladbar (%s)" % (url, VERSUCHE, letzter_grund),
                        "Netz, DNS, Proxy/Sandbox oder Server gestört",
                        "Verbindung prüfen (curl -I %s) und das Werkzeug erneut starten; fertige Gesetze werden übersprungen" % url)
        raise GesetzFehler("NETZ")


# --------------------------------------------------------------------------
# Hilfen
# --------------------------------------------------------------------------

def sha256(daten):
    return hashlib.sha256(daten).hexdigest()


def sha256_datei(pfad):   # für Prüfungen von Hand (python3 -c …); im Lauf nicht gebraucht
    if not os.path.isfile(pfad):
        return ""
    with open(pfad, "rb") as f:
        return sha256(f.read())


def schreibe_atomar(pfad, daten):
    os.makedirs(os.path.dirname(pfad), exist_ok=True)
    tmp = pfad + ".tmp"
    with open(tmp, "wb") as f:
        f.write(daten)
    os.replace(tmp, pfad)


def jetzt_iso():
    return dt.datetime.now().astimezone().replace(microsecond=0).isoformat()


SICHERER_NAME = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]*$")


# --------------------------------------------------------------------------
# Ablage: ein REC-Ordner je Paket-Stand
# --------------------------------------------------------------------------

REC_ORDNER = re.compile(r"^REC-(\d{3,}) - Normen-Paket Stand (\d{4}-\d{2}-\d{2})$")
REC_NUMMER = re.compile(r"^REC-(\d{3,})$")
DATUM = re.compile(r"^\d{4}-\d{2}-\d{2}$")
MITGELIEFERT_AB = 9001   # reservierter Nummernbereich der mitgelieferten Stände


def rec_ordnername(rec, stand):
    return "%s - Normen-Paket Stand %s" % (rec, stand)


def rec_knotenname(rec, stand):
    return "%s — Normen-Paket Stand %s.md" % (rec, stand)


def rec_datei(ordner, stand, kuerzel, endung):
    """Datei eines Gesetzes im REC-Ordner: „JJJJ-MM-TT <kuerzel>.<endung>“."""
    return os.path.join(ordner, "%s %s.%s" % (stand, kuerzel, endung))


def url_pfad(name):
    """Dateiname als Link-Ziel (Leerzeichen prozentkodiert)."""
    return urllib.parse.quote(name, safe="-._~/")


def vorhandene_rec(wurzel):
    """[(Nummer:int, Stand, Ordnername)] aller Normen-REC unter research/."""
    research = os.path.join(wurzel, "research")
    res = []
    if os.path.isdir(research):
        for n in sorted(os.listdir(research)):
            m = REC_ORDNER.match(n)
            if m and os.path.isdir(os.path.join(research, n)):
                res.append((int(m.group(1)), m.group(2), n))
    return res


def vergebene_rec_nummern(wurzel):
    """REC-Nummern, die das Projekt schon trägt: Ordner unter research/,
    Knoten unter wiki/ und Einträge im Register wiki/Rechercheartefakte.md."""
    nummern = set()
    for ordner in ("research", "wiki"):
        p = os.path.join(wurzel, ordner)
        if os.path.isdir(p):
            for n in os.listdir(p):
                m = re.match(r"^REC-(\d{3,})\b", n)
                if m:
                    nummern.add(int(m.group(1)))
    register = os.path.join(wurzel, "wiki", "Rechercheartefakte.md")
    if os.path.isfile(register):
        with open(register, encoding="utf-8") as f:
            for m in re.finditer(r"^###\s+REC-(\d{3,})\b", f.read(), re.M):
                nummern.add(int(m.group(1)))
    return nummern


def naechste_rec_nummer(wurzel):
    """Nächste freie Projekt-Nummer (unterhalb des reservierten Bereichs)."""
    projekt = [n for n in vergebene_rec_nummern(wurzel) if n < MITGELIEFERT_AB]
    return "REC-%03d" % ((max(projekt) + 1) if projekt else 1)


def tsv_feld(text):
    return re.sub(r"[\t\r\n]+", " ", text or "").strip()


# --------------------------------------------------------------------------
# Liste, Inhaltsverzeichnis, Manifest
# --------------------------------------------------------------------------

def lies_liste(pfad):
    if not os.path.isfile(pfad):
        aufruf_fehler("Gesetzesliste %s fehlt" % pfad,
                      "Pfad mit --liste angeben oder tools/normen-liste.tsv aus dem Paket wiederherstellen")
    eintraege = []
    with open(pfad, encoding="utf-8", newline="") as f:
        leser = csv.DictReader(f, delimiter="\t")
        noetig = {"kuerzel", "slug", "titel", "gruppe"}
        if not leser.fieldnames or not noetig.issubset(leser.fieldnames):
            aufruf_fehler("%s: Kopfzeile muss die Spalten kuerzel, slug, titel, gruppe enthalten (gefunden: %s)"
                          % (pfad, leser.fieldnames),
                          "Kopfzeile tab-getrennt korrigieren")
        gesehen = set()
        for nr, z in enumerate(leser, start=2):
            k = (z.get("kuerzel") or "").strip()
            if not k or k.startswith("#"):
                continue
            if not re.fullmatch(r"[a-z0-9][a-z0-9_-]*", k):
                aufruf_fehler("%s Zeile %d: Kürzel „%s“ ist kein Dateiname aus a–z, 0–9, _ und -" % (pfad, nr, k),
                              "Kürzel klein und ohne Umlaute schreiben (z. B. sgb10)")
            if k in gesehen:
                aufruf_fehler("%s Zeile %d: Kürzel „%s“ doppelt" % (pfad, nr, k), "eine der Zeilen entfernen")
            gesehen.add(k)
            eintraege.append({"kuerzel": k, "slug": (z.get("slug") or "").strip(),
                              "titel": (z.get("titel") or "").strip(),
                              "gruppe": (z.get("gruppe") or "").strip()})
    return eintraege


def lies_toc(daten, log):
    try:
        wurzel = ET.fromstring(daten)
    except ET.ParseError as e:
        log.fehler("TOC-XML", TOC_URL, "Inhaltsverzeichnis ist kein wohlgeformtes XML (%s)" % e,
                   "Übertragung abgebrochen oder Format geändert", "später erneut starten")
        raise GesetzFehler("TOC-XML")
    nach_slug, nach_titel = {}, {}
    for item in wurzel.iter("item"):
        titel = (item.findtext("title") or "").strip()
        link = (item.findtext("link") or "").strip()
        m = re.search(r"gesetze-im-internet\.de/([^/]+)/xml\.zip$", link)
        if not m:
            continue
        nach_slug[m.group(1)] = titel
        nach_titel.setdefault(titel, []).append(m.group(1))
    return nach_slug, nach_titel


def pruefe_slug(e, toc, log):
    """Gibt den gültigen Slug zurück. Steht der Slug nicht (mehr) im
    Inhaltsverzeichnis, wird er über den exakten Titel gesucht."""
    nach_slug, nach_titel = toc
    if e["slug"] in nach_slug:
        if e["titel"] and nach_slug[e["slug"]] != e["titel"]:
            log.hinweis("TITEL-ABWEICHUNG", e["kuerzel"],
                        "Titel in der Liste („%s“) weicht vom Inhaltsverzeichnis ab („%s“)"
                        % (e["titel"], nach_slug[e["slug"]]),
                        "Titel des Gesetzes geändert oder Tippfehler in der Liste",
                        "Spalte titel in tools/normen-liste.tsv nachziehen")
        return e["slug"]
    kandidaten = nach_titel.get(e["titel"], [])
    if len(kandidaten) == 1:
        log.hinweis("SLUG-GEAENDERT", e["kuerzel"],
                    "Slug „%s“ fehlt im Inhaltsverzeichnis; über den Titel gefunden: „%s“ — wird verwendet"
                    % (e["slug"], kandidaten[0]),
                    "Slug auf gesetze-im-internet.de geändert",
                    "Spalte slug in tools/normen-liste.tsv auf „%s“ setzen" % kandidaten[0])
        return kandidaten[0]
    log.fehler("SLUG-UNBEKANNT", e["kuerzel"],
               "Slug „%s“ steht nicht im Inhaltsverzeichnis %s, und der Titel „%s“ ergibt %s"
               % (e["slug"], TOC_URL, e["titel"], "keinen Treffer" if not kandidaten else "mehrere Treffer: " + ", ".join(kandidaten)),
               "Gesetz umbenannt, aufgehoben oder Liste fehlerhaft",
               "in gii-toc.xml nach dem Titel suchen und slug/titel in tools/normen-liste.tsv korrigieren")
    raise GesetzFehler("SLUG-UNBEKANNT")


def schreibe_manifest(pfad, manifest, reihenfolge):
    buf = io.StringIO()
    w = csv.DictWriter(buf, fieldnames=MANIFEST_SPALTEN, delimiter="\t",
                       lineterminator="\n", extrasaction="ignore")
    w.writeheader()
    schluessel = [k for k in reihenfolge if k in manifest] + sorted(k for k in manifest if k not in reihenfolge)
    for k in schluessel:
        w.writerow({s: tsv_feld(str(manifest[k].get(s, ""))) for s in MANIFEST_SPALTEN})
    schreibe_atomar(pfad, buf.getvalue().encode("utf-8"))


# --------------------------------------------------------------------------
# Markdown-Konverter
# --------------------------------------------------------------------------

WS = re.compile(r"[ \t\r\n]+")
BLOCK_TAGS = {"P", "DL", "table", "pre", "Title", "Subtitle", "TOC", "Footnotes",
              "FnArea", "Revision", "Content", "text", "fussnoten", "LA", "DD",
              "kommentar", "Ident", "tgroup", "tbody", "thead", "row"}
INLINE_BEKANNT = {"B", "I", "U", "SUP", "SUB", "small", "F", "FnR", "BR", "NB",
                  "noindex", "SP", "span", "ABWFORMAT", "Citation", "IMG", "img",
                  "FILE", "Accent", "Super", "Sub", "entry", "DT", "colspec",
                  "Footnote", "tfoot", "LA", "Font", "Split"}


def transliteriere(text):
    t = text.replace("ä", "ae").replace("ö", "oe").replace("ü", "ue").replace("ß", "ss")
    t = t.replace("Ä", "Ae").replace("Ö", "Oe").replace("Ü", "Ue")
    t = unicodedata.normalize("NFKD", t)
    return "".join(c for c in t if not unicodedata.combining(c))


def anker_aus_bez(bez):
    t = re.sub(r"^\s*\([^)]*\)\s*", "", bez)      # „(XXXX) §§ 15 bis 20“ -> „§§ 15 bis 20“
    t = t.strip().replace("§§", " pp ").replace("§", " p ")
    t = re.sub(r"^\s*Art(ikel)?\.?\s", " art ", t)
    t = transliteriere(t).lower()
    t = re.sub(r"[^a-z0-9]+", "-", t).strip("-")
    t = re.sub(r"^(pp|p|art)-(?=\d)", r"\1", t)
    if t.startswith("gl-"):
        t = "n-" + t
    return t


def esc_md(text):
    """Markdown-Sonderzeichen im Fließtext entschärfen."""
    text = text.replace("\\", "\\\\")
    for z in "*_`[]":
        text = text.replace(z, "\\" + z)
    return text.replace("<", "&lt;")


def esc_html(text):
    return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


ZEILENANFANG = re.compile(r"^(\s*)(#{1,6}(?=\s|$)|>|[-+=](?=\s|$)|\d{1,9}(?=[.)](\s|$))|~~~|```)")


def esc_zeilenanfang(zeile):
    m = ZEILENANFANG.match(zeile)
    if not m:
        return zeile
    vor, tok = m.group(1), m.group(2)
    rest = zeile[m.end():]
    if tok[0].isdigit():                       # "1." oder "1)" -> "1\." / "1\)"
        return vor + tok + "\\" + rest
    return vor + "\\" + tok + rest


class Konverter:
    def __init__(self, kuerzel, log, stand=""):
        self.stand = stand
        self.kuerzel = kuerzel
        self.log = log
        self.unbekannt = set()
        self.bilder = []           # Bilddateien, auf die das XML verweist
        self.fn_map = {}           # Fußnoten-ID -> Marke
        self.fn_defs = []          # (Marke, Text)
        self.fn_basis = ""
        self.fn_texte = {}

    # ---- Inline ---------------------------------------------------------
    def inline(self, el, mode):
        """Inhalt von el (ohne el.tail) als Inline-Text. mode: md|html|pre."""
        teile = [self._text(el.text, mode)]
        for k in el:
            teile.append(self.inline_el(k, mode))
            teile.append(self._text(k.tail, mode))
        return "".join(teile)

    def _text(self, t, mode):
        if not t:
            return ""
        if mode == "pre":
            return t
        t = WS.sub(" ", t)
        return esc_md(t) if mode == "md" else esc_html(t)

    def inline_el(self, el, mode):
        tag = el.tag
        if tag == "BR":
            return "\n" if mode == "pre" else ("<br>" if mode == "html" else "\n")
        innen = self.inline(el, mode)
        if mode == "pre":
            if tag in ("IMG", "img"):
                return self.bild(el, mode)
            return innen
        if tag == "B":
            return self._umschliesse(innen, "**", "<b>", "</b>", mode)
        if tag == "I":
            return self._umschliesse(innen, "*", "<i>", "</i>", mode)
        if tag in ("U",):
            return "<u>%s</u>" % innen if innen.strip() else innen
        if tag in ("SUP", "Super"):
            return "<sup>%s</sup>" % innen if innen else ""
        if tag in ("SUB", "Sub"):
            return "<sub>%s</sub>" % innen if innen else ""
        if tag == "FnR":
            return self.fn_ref(el, mode)
        if tag == "Split":          # Füllzeichen (Punktlinie) zwischen Text und Betrag
            return " … " + innen
        if tag in ("IMG", "img"):
            return self.bild(el, mode)
        if tag in ("DL", "table", "P", "pre", "Footnotes"):
            # Block im Inline-Kontext (z. B. in einer Tabellenzelle): flach
            return " ".join(self.blocks_flach(el, mode))
        if tag not in INLINE_BEKANNT and tag not in BLOCK_TAGS:
            self.unbekannt.add(tag)
        return innen

    @staticmethod
    def _umschliesse(innen, md, auf, zu, mode):
        if not innen.strip():
            return innen
        if mode == "html":
            return auf + innen + zu
        # Leerzeichen außerhalb der Markierung halten (CommonMark-Regel)
        m = re.match(r"^(\s*)(.*?)(\s*)$", innen, re.S)
        return m.group(1) + md + m.group(2) + md + m.group(3)

    def bild(self, el, mode):
        src = el.get("SRC") or el.get("src") or el.get("Src") or ""
        name = os.path.basename(src)
        if name:
            self.bilder.append(name)
        alt = el.get("ALT") or el.get("alt") or ""
        text = "[%s: Abbildung „%s“%s nicht als Text darstellbar — Bilddatei im selben Ordner, sonst PDF]" % (
            KONV, name or "ohne Dateiname", (" (Alternativtext: %s)" % alt) if alt else "")
        if mode == "html":
            return esc_html(text)
        if mode == "pre":
            return text
        link = ""
        if name and SICHERER_NAME.match(name):
            link = "![%s](%s) " % (esc_md(name), url_pfad(bild_dateiname(self.stand, self.kuerzel, name)))
        return link + esc_md(text).replace("\\[", "[").replace("\\]", "]")

    def fn_ref(self, el, mode):
        fid = el.get("ID") or el.get("id") or ""
        if fid not in self.fn_map:
            self.fn_map[fid] = "%s-fn%d" % (self.fn_basis, len(self.fn_map) + 1)
        marke = self.fn_map[fid]
        if mode == "md":
            return "[^%s]" % marke
        return "<sup>[%s]</sup>" % esc_html(marke)

    # ---- Blöcke ---------------------------------------------------------
    def blocks(self, el, mode="md"):
        """Liste von Markdown-Blöcken für den Inhalt von el."""
        out = []
        puffer = [self._text(el.text, mode)]

        def leeren():
            text = "".join(puffer).strip(" ")
            puffer.clear()
            if text.strip():
                out.append(self.absatz(text))

        for k in el:
            if k.tag in BLOCK_TAGS or k.tag in ("Footnote",):
                leeren()
                out.extend(self.block_el(k, mode))
            else:
                puffer.append(self.inline_el(k, mode))
            puffer.append(self._text(k.tail, mode))
        leeren()
        return out

    @staticmethod
    def absatz(text):
        zeilen = [z.strip(" ") for z in text.split("\n")]
        zeilen = [z for z in zeilen if z != ""] or [""]
        zeilen = [esc_zeilenanfang(z) for z in zeilen]
        return "\\\n".join(zeilen)

    def block_el(self, el, mode):
        tag = el.tag
        if tag == "DL":
            return [self.liste(el)]
        if tag == "table":
            return [self.tabelle(el)]
        if tag == "pre":
            return [self.pre(el)]
        if tag in ("Title", "Subtitle", "Ident"):
            text = " ".join(self.inline(el, "md").split())
            return [esc_zeilenanfang("**%s**" % text)] if text else []
        if tag in ("Footnotes", "FnArea"):
            return self.fussnoten_hier(el)
        if tag == "fussnoten":
            innen = self.blocks(el, mode)
            if not innen:
                return []
            zeilen = ["> **%s**" % LABEL_FN, ">"]
            for b in innen:
                zeilen += [("> " + l) if l else ">" for l in b.split("\n")]
                zeilen.append(">")
            return ["\n".join(zeilen[:-1])]
        if tag == "Footnote":
            return self.fussnoten_hier(el)
        if tag in ("tgroup", "tbody", "thead", "row"):
            return [self.tabelle(el)]
        if tag not in BLOCK_TAGS:
            self.unbekannt.add(tag)
        return self.blocks(el, mode)

    def liste(self, dl, tiefe=0):
        posten = []
        kinder = list(dl)
        i = 0
        while i < len(kinder):
            k = kinder[i]
            if k.tag == "DT":
                marke = WS.sub(" ", "".join(k.itertext())).strip()
                dd = None
                if i + 1 < len(kinder) and kinder[i + 1].tag == "DD":
                    dd = kinder[i + 1]
                    i += 1
                bloecke = self.blocks(dd) if dd is not None else []
                posten.append(self._posten(marke, bloecke, k))
            elif k.tag == "DD":            # DD ohne DT
                posten.append(self._posten("", self.blocks(k), None))
            else:
                bl = self.block_el(k, "md") if k.tag in BLOCK_TAGS else [self.absatz(self.inline_el(k, "md"))]
                for b in bl:
                    posten.append("- " + b.replace("\n", "\n  "))
            i += 1
        return "\n".join(posten)

    def _posten(self, marke, bloecke, dt_el):
        m = esc_md(marke)
        m = re.sub(r"^(\d{1,9})([.)])", r"\1\\\2", m)
        m = re.sub(r"^([-+*=>#])", r"\\\1", m)
        if dt_el is not None and len(dt_el):
            m = self.inline(dt_el, "md").strip()
            m = re.sub(r"^(\d{1,9})([.)])", r"\1\\\2", m)
            m = re.sub(r"^([-+=>#])(?=\s|$)", r"\\\1", m)
        erster = bloecke[0] if bloecke else ""
        if erster.startswith("- ") or erster.startswith("<table") or erster.startswith("```") \
                or erster.startswith("~~~") or erster.startswith("|"):
            kopf, rest = m, bloecke
        else:
            kopf = (m + " " + erster).strip() if m else erster
            rest = bloecke[1:]
        teile = ["- " + kopf.replace("\n", "\n  ")]
        for b in rest:
            sep = "\n" if b.startswith("- ") else "\n\n"
            teile.append(sep + "  " + b.replace("\n", "\n  "))
        return "".join(teile)

    def pre(self, el):
        text = self.inline(el, "pre").strip("\n")
        zaun = "~~~~" if "```" in text else "```"
        return zaun + "text\n" + text + "\n" + zaun

    def blocks_flach(self, el, mode):
        """Block-Inhalt als Zeilen (für Tabellenzellen)."""
        zeilen = []
        puffer = [self._text(el.text, mode)]

        def leeren():
            t = "".join(puffer).strip()
            puffer.clear()
            if t:
                zeilen.append(t)

        for k in el:
            if k.tag == "DL":
                leeren()
                kinder = list(k)
                for j, d in enumerate(kinder):
                    if d.tag == "DT":
                        marke = self.inline(d, mode).strip()
                        inhalt = ""
                        if j + 1 < len(kinder) and kinder[j + 1].tag == "DD":
                            inhalt = " ".join(self.blocks_flach(kinder[j + 1], mode))
                        zeilen.append((marke + " " + inhalt).strip())
                    elif d.tag == "DD" and (j == 0 or kinder[j - 1].tag != "DT"):
                        zeilen.append(" ".join(self.blocks_flach(d, mode)))
            elif k.tag in ("P", "LA", "DD", "Content", "pre", "Title", "Subtitle", "table",
                           "tgroup", "tbody", "thead", "row", "entry"):
                leeren()
                zeilen.extend(self.blocks_flach(k, mode))
            elif k.tag in ("Footnotes", "FnArea", "Footnote"):
                leeren()
                for fn in ([k] if k.tag == "Footnote" else k.iter("Footnote")):
                    self.fn_texte[fn.get("ID") or ""] = "in Tabellenzelle"
                    zeilen.append("[%s: Fußnote %s] %s" % (KONV, self.fn_kennung(fn),
                                                           " ".join(self.blocks_flach(fn, mode))))
            elif k.tag == "BR":
                leeren()
            else:
                puffer.append(self.inline_el(k, mode))
            puffer.append(self._text(k.tail, mode))
        leeren()
        return [WS.sub(" ", z.replace("\n", " ")).strip() for z in zeilen if z.strip()]

    # ---- Tabellen -------------------------------------------------------
    def tabelle(self, el):
        tgroups = [el] if el.tag == "tgroup" else el.findall("tgroup")
        if el.tag in ("tbody", "thead", "row"):
            tgroups = [el]
        teile = []
        if el.tag == "table":
            for kind in el:
                if kind.tag == "tgroup":
                    teile.append(self._tgroup(kind))
                elif kind.tag in BLOCK_TAGS or kind.tag in ("Footnote",):
                    teile.extend(self.block_el(kind, "md"))
                else:
                    teile.append(self.absatz(self.inline_el(kind, "md")))
        else:
            for tg in tgroups:
                teile.append(self._tgroup(tg))
        if not tgroups:          # Tabelle ohne tgroup: Inhalt flach
            zeilen = self.blocks_flach(el, "md")
            return "\n".join(zeilen) if zeilen else ""
        return "\n\n".join(t for t in teile if t)

    def _zeilen(self, tg):
        kopf, rumpf = [], []
        if tg.tag == "row":
            return [], [tg]
        for teil in tg:
            if teil.tag == "thead":
                kopf.extend(teil.findall("row"))
            elif teil.tag in ("tbody", "tfoot"):
                rumpf.extend(teil.findall("row"))
            elif teil.tag == "row":
                rumpf.append(teil)
        return kopf, rumpf

    def _tgroup(self, tg):
        kopf, rumpf = self._zeilen(tg)
        alle = kopf + rumpf
        if not alle:
            return ""
        spalten = 0
        try:
            spalten = int(tg.get("cols") or 0)
        except ValueError:
            spalten = 0
        komplex = False
        for r in alle:
            eintraege = r.findall("entry")
            if spalten and len(eintraege) != spalten:
                komplex = True
            for e in eintraege:
                if e.get("namest") or e.get("nameend") or e.get("morerows") or e.get("spanname"):
                    komplex = True
        if not spalten:
            spalten = max(len(r.findall("entry")) for r in alle)
        if not komplex:
            return self._pipe_tabelle(kopf, rumpf, spalten)
        return self._html_tabelle(tg, kopf, rumpf)

    def _zelle(self, e, mode):
        zeilen = self.blocks_flach(e, mode)
        trenner = "<br>"
        text = trenner.join(zeilen)
        if mode == "md":
            text = text.replace("|", "\\|")
        return text

    def _pipe_tabelle(self, kopf, rumpf, spalten):
        def zeile(r):
            zellen = [self._zelle(e, "md") for e in r.findall("entry")]
            zellen += [""] * (spalten - len(zellen))
            return "| " + " | ".join(zellen) + " |"
        out = []
        if kopf:
            out.append(zeile(kopf[0]))
            weitere = kopf[1:] + rumpf
        else:
            out.append("|" + "   |" * spalten)
            weitere = rumpf
        out.append("|" + " --- |" * spalten)
        out.extend(zeile(r) for r in weitere)
        return "\n".join(out)

    def _html_tabelle(self, tg, kopf, rumpf):
        namen = [c.get("colname") for c in tg.findall("colspec")]
        spannen = {s.get("spanname"): (s.get("namest"), s.get("nameend")) for s in tg.findall("spanspec")}

        def colspan(e):
            st, en = e.get("namest"), e.get("nameend")
            if e.get("spanname") in spannen:
                st, en = spannen[e.get("spanname")]
            if st and en and st in namen and en in namen:
                return namen.index(en) - namen.index(st) + 1
            return 1

        def zeile(r, zelltag):
            zellen = []
            for e in r.findall("entry"):
                attr = ""
                cs = colspan(e)
                if cs > 1:
                    attr += ' colspan="%d"' % cs
                mr = e.get("morerows")
                if mr and mr.isdigit() and int(mr) > 0:
                    attr += ' rowspan="%d"' % (int(mr) + 1)
                zellen.append("<%s%s>%s</%s>" % (zelltag, attr, self._zelle(e, "html"), zelltag))
            return "<tr>" + "".join(zellen) + "</tr>"
        out = ["<table>"]
        if kopf:
            out.append("<thead>")
            out.extend(zeile(r, "th") for r in kopf)
            out.append("</thead>")
        out.append("<tbody>")
        out.extend(zeile(r, "td") for r in rumpf)
        out.append("</tbody>")
        out.append("</table>")
        return "\n".join(out)

    # ---- Fußnoten -------------------------------------------------------
    def fn_vorbereiten(self, norm):
        """Fußnoten-Marken in Verweis-Reihenfolge vergeben, bevor die Norm
        gerendert wird (Definitionen stehen an der Stelle des XML)."""
        self.fn_map, self.fn_texte = {}, {}
        for r in norm.iter("FnR"):
            fid = r.get("ID") or r.get("id") or ""
            if fid not in self.fn_map:
                self.fn_map[fid] = "%s-fn%d" % (self.fn_basis, len(self.fn_map) + 1)

    @staticmethod
    def fn_kennung(fn):
        z = (fn.get("FnZ") or "").strip()
        return ("„%s“" % z) if z else (fn.get("ID") or "ohne Kennung").replace("]", "")

    def fussnoten_hier(self, el):
        """Fußnoten an ihrer Stelle im XML ausgeben: mit Verweis im Text als
        Markdown-Fußnoten-Definition, ohne Verweis (z. B. Sternchen im Titel)
        als sichtbarer Absatz mit Marke — nichts wird verschluckt."""
        out = []
        for fn in ([el] if el.tag == "Footnote" else el.iter("Footnote")):
            fid = fn.get("ID") or fn.get("id") or ""
            text = " ".join(self.blocks_flach(fn, "md"))
            self.fn_texte[fid] = text
            if fid in self.fn_map:
                out.append("[^%s]: %s" % (self.fn_map[fid], text))
            else:
                out.append("[%s: Fußnote %s] %s" % (KONV, self.fn_kennung(fn), text))
        return out

    def fussnoten_ausgeben(self):
        """Am Ende der Norm: Verweise, deren Fußnote im XML fehlt."""
        out = []
        for fid, marke in self.fn_map.items():
            if fid not in self.fn_texte:
                out.append("[^%s]: [%s: Fußnote „%s“ im XML nicht gefunden]" % (marke, KONV, fid))
        return out


# --------------------------------------------------------------------------
# Gesetz -> Markdown
# --------------------------------------------------------------------------

def norm_meta(norm):
    m = norm.find("metadaten")
    return m if m is not None else ET.Element("metadaten")


def text_von(el):
    return WS.sub(" ", "".join(el.itertext())).strip() if el is not None else ""


def alnum(text):
    return "".join(c for c in unicodedata.normalize("NFC", text) if c.isalnum())


MARKER_RE = re.compile(r"\[\^[^\]\s]+\]:?|\[" + re.escape(KONV) + r":[^\]]*\]|!\[[^\]]*\]\([^)]*\)|"
                       r"<[^>]*>|\*\*" + LABEL_FN + r"\*\*|(```|~~~~)text", re.M)


def md_alnum(md):
    """Buchstaben und Ziffern eines Markdown-Abschnitts ohne die vom
    Konverter eingefügten Marken, Anker und HTML-Tags."""
    t = MARKER_RE.sub(" ", md)
    return alnum(html.unescape(t))


def klassifiziere(norm, index):
    meta = norm_meta(norm)
    if index == 0 and meta.find("langue") is not None:
        return "rahmen"
    if meta.find("gliederungseinheit") is not None:
        return "gliederung"
    return "einzelnorm"


def bild_dateiname(stand, kuerzel, name):
    """Bilddatei aus dem ZIP im REC-Ordner: „JJJJ-MM-TT <kuerzel> <name>“."""
    return "%s %s %s" % (stand, kuerzel, name)


def konvertiere(kuerzel, xml_bytes, quellen, log, stand=""):
    """Gibt (markdown, zahlen, befunde) zurück; befunde = Liste von Codes."""
    wurzel = ET.fromstring(xml_bytes)
    normen = wurzel.findall("norm")
    k = Konverter(kuerzel, log, stand)
    befunde = []
    if not normen:
        log.fehler("XML-LEER", kuerzel, "XML enthält kein <norm>-Element",
                   "unerwartetes Format", "XML im REC-Ordner ansehen")
        return "", {}, ["XML-LEER"]

    rahmen = normen[0]
    rm = norm_meta(rahmen)
    langue = text_von(rm.find("langue")) or text_von(rm.find("kurzue")) or kuerzel
    kurzue = text_von(rm.find("kurzue"))
    jurabk = text_von(rm.find("jurabk"))
    amtabk = text_von(rm.find("amtabk"))
    ausf = text_von(rm.find("ausfertigung-datum"))
    fund = "; ".join(" ".join(text_von(c) for c in f if text_von(c)) for f in rm.findall("fundstelle"))
    stand = []
    for s in rm.findall("standangabe"):
        stand.append((text_von(s.find("standtyp")), text_von(s.find("standkommentar"))))
    builddate = wurzel.get("builddate") or rahmen.get("builddate") or ""

    k.fn_basis = "vorspann"
    k.fn_vorbereiten(rahmen)
    if rm.find("langue") is not None:
        langue = " ".join(k.inline(rm.find("langue"), "md").split())
    else:
        langue = esc_md(langue)
    z = []
    z.append("# " + langue)
    z.append("")
    if kurzue:
        z.append("- **Kurztitel:** " + esc_md(kurzue))
    z.append("- **Abkürzung:** " + esc_md(amtabk or jurabk or "—")
             + ((" (Dokumentations-Abkürzung: %s)" % esc_md(jurabk)) if jurabk and amtabk and jurabk != amtabk else ""))
    if ausf:
        z.append("- **Ausfertigungsdatum:** " + esc_md(ausf))
    if fund:
        z.append("- **Fundstelle:** " + esc_md(fund))
    if stand:
        z.append("- **Stand-Angaben (aus dem XML):**")
        for typ, kom in stand:
            z.append("  - %s: %s" % (esc_md(typ), esc_md(kom)))
    z.append("- **builddate (XML):** " + esc_md(builddate))
    z.append("- **Quelle XML:** <%s>" % quellen["xml_url"])
    z.append("- **Quelle PDF:** <%s>" % quellen["pdf_url"] if quellen.get("pdf_url") else "- **Quelle PDF:** —")
    z.append("- **Startseite:** <%s>" % quellen["start_url"])
    z.append("- **Abgerufen:** " + quellen["abrufzeit"])
    z.append("- **sha256 xml.zip / XML:** `%s` / `%s`" % (quellen["sha256_zip"], quellen["sha256_xml"]))
    z.append("- **Konverter:** %s %s (tools/normen-holen.py, ohne Sprachmodell)" % (WERKZEUG, KONVERTER))
    z.append("")
    z.append("> " + HINWEIS_TEXT)
    z.append("")
    z.append("<!-- Anker: je Einzelnorm eine Zeile <a id=\"…\"></a> unmittelbar vor der Überschrift; "
             "Gliederungs-Anker beginnen mit gl-. Siehe tools/README.md. -->")
    z.append("")

    anker_gesehen = set()
    zahlen = {"normen_xml": len(normen), "gliederung_xml": 0, "einzelnormen_xml": 0,
              "rahmen_xml": 0, "textabgleich_fehler": 0}
    tiefe = 0
    textfehler = []

    for i, norm in enumerate(normen):
        art = klassifiziere(norm, i)
        meta = norm_meta(norm)
        td = norm.find("textdaten")
        if art == "rahmen":
            zahlen["rahmen_xml"] += 1
            bloecke = k.blocks(td) if td is not None else []
            abschnitt = []
            if bloecke:
                abschnitt += ["## Vorspann (Dokumentationshinweise aus dem XML)", ""]
                for b in bloecke:
                    abschnitt += [b, ""]
                for d in k.fussnoten_ausgeben():
                    abschnitt += [d, ""]
            soll = alnum("".join(td.itertext())) if td is not None else ""
            ist = md_alnum("\n".join(abschnitt[1:]))
            if soll != ist:
                textfehler.append("Vorspann")
            z.extend(abschnitt)
            continue
        if art == "gliederung":
            zahlen["gliederung_xml"] += 1
            ge = meta.find("gliederungseinheit")
            kz = text_von(ge.find("gliederungskennzahl"))
            bez = ge.find("gliederungsbez")
            tit = ge.find("gliederungstitel")
            tiefe = max(1, len(kz) // 3) if kz else 1
            ebene = min(6, 1 + tiefe)
            anker = "gl-" + (re.sub(r"[^0-9A-Za-z]+", "-", kz) or str(i))
            kopf_el, kopf_sep = (bez, tit), " – "
            soll_kopf = alnum(text_von(bez) + text_von(tit))
        else:
            zahlen["einzelnormen_xml"] += 1
            enbez = meta.find("enbez")
            titel = meta.find("titel")
            bez_text = text_von(enbez)
            anker = anker_aus_bez(bez_text) if bez_text else ""
            if not anker:
                anker = "n%d" % i
            ebene = min(6, 2 + tiefe)
            kopf_el, kopf_sep = (enbez, titel), " "
            soll_kopf = alnum(text_von(enbez) + text_von(titel))
        basis = anker
        n = 2
        while anker in anker_gesehen:
            anker = "%s-%d" % (basis, n)
            n += 1
        anker_gesehen.add(anker)
        k.fn_basis = anker
        k.fn_vorbereiten(norm)
        kopftext = kopf_sep.join(x for x in (" ".join(k.inline(el, "md").split()) if el is not None else ""
                                              for el in kopf_el) if x)
        if art == "einzelnorm" and kopf_el[0] is None:
            kopftext = ("[%s: Norm ohne Bezeichnung] " % KONV + kopftext).strip()
        abschnitt = ['<a id="%s"></a>' % anker, "#" * ebene + " " + kopftext, ""]
        bloecke = k.blocks(td) if td is not None else []
        for b in bloecke:
            abschnitt += [b, ""]
        for d in k.fussnoten_ausgeben():
            abschnitt += [d, ""]
        if art == "einzelnorm" and not bloecke and td is None:
            abschnitt += ["[%s: im XML ohne Textteil]" % KONV, ""]
        soll = soll_kopf + (alnum("".join(td.itertext())) if td is not None else "")
        ist = md_alnum("\n".join(abschnitt[1:]))
        if soll != ist:
            textfehler.append("%s (%s)" % (kopftext[:40], anker))
        z.extend(abschnitt)

    md = "\n".join(z).rstrip("\n") + "\n"
    # Zählung im fertigen Markdown
    anker_md = re.findall(r'^<a id="([^"]+)"></a>\n#{1,6} ', md, re.M)
    zahlen["einzelnormen_md"] = sum(1 for a in anker_md if not a.startswith("gl-"))
    zahlen["gliederung_md"] = sum(1 for a in anker_md if a.startswith("gl-"))
    zahlen["textabgleich_fehler"] = len(textfehler)
    if textfehler:
        log.fehler("TEXTABGLEICH", kuerzel,
                   "%d Abschnitt(e) weichen in Buchstaben/Ziffern vom XML ab, z. B. %s"
                   % (len(textfehler), "; ".join(textfehler[:5])),
                   "der Konverter verliert oder verdoppelt Text bei einem XML-Element",
                   "Abschnitt im MD gegen das XML vergleichen und den Konverter korrigieren; danach " + ABHILFE_NEUER_STAND)
        befunde.append("TEXTABGLEICH")
    if k.unbekannt:
        log.hinweis("ELEMENT-UNBEKANNT", kuerzel,
                    "XML-Elemente ohne eigene Regel: %s — Text übernommen, Formatierung nicht" % ", ".join(sorted(k.unbekannt)),
                    "im Konverter nicht vorgesehen", "Regel in normen-holen.py ergänzen, falls die Formatierung zählt")
    zahlen["bilder"] = sorted(set(k.bilder))
    zahlen["langue"] = langue
    zahlen["stand"] = "; ".join("%s: %s" % s for s in stand if s[0] == "Stand") or \
        "; ".join("%s: %s" % s for s in stand)
    zahlen["builddate"] = builddate
    return md, zahlen, befunde


# --------------------------------------------------------------------------
# Ablauf je Gesetz
# --------------------------------------------------------------------------

def finde_pdf(html_bytes, start_url, kuerzel, log):
    text = html_bytes.decode("iso-8859-1", errors="replace")
    links = re.findall(r'href\s*=\s*"([^"]+\.pdf)"', text, re.I)
    eigene = [l for l in links if "/" not in l]
    kandidaten = list(dict.fromkeys(eigene or links))
    if not kandidaten:
        log.fehler("PDF-LINK", kuerzel, "Startseite %s enthält keinen PDF-Link" % start_url,
                   "Seitenaufbau geändert oder Gesetz ohne PDF",
                   "Startseite im Browser öffnen; Erkennung in finde_pdf() anpassen")
        raise GesetzFehler("PDF-LINK")
    if len(kandidaten) > 1:
        log.hinweis("PDF-MEHRDEUTIG", kuerzel, "mehrere PDF-Links (%s), verwendet: %s"
                    % (", ".join(kandidaten), kandidaten[0]))
    return urllib.parse.urljoin(start_url, kandidaten[0])


def pruefe_zip(zip_bytes, kuerzel, log):
    try:
        z = zipfile.ZipFile(io.BytesIO(zip_bytes))
        kaputt = z.testzip()
    except (zipfile.BadZipFile, zipfile.LargeZipFile, OSError, EOFError) as e:
        log.fehler("ZIP", kuerzel, "xml.zip ist kein lesbares ZIP (%s)" % e,
                   "Download abgebrochen oder Server lieferte eine Fehlerseite",
                   ABHILFE_NEUER_STAND)
        raise GesetzFehler("ZIP")
    if kaputt:
        log.fehler("ZIP", kuerzel, "xml.zip: CRC-Fehler in %s" % kaputt,
                   "Download beschädigt", ABHILFE_NEUER_STAND)
        raise GesetzFehler("ZIP")
    mitglieder = {}
    for info in z.infolist():
        if info.is_dir():
            continue
        name = info.filename
        if not SICHERER_NAME.match(name):
            log.fehler("ZIP-NAME", kuerzel, "xml.zip enthält unsicheren Dateinamen „%s“" % name,
                       "Pfadanteile oder Sonderzeichen im Archiv", "Archiv von Hand prüfen; nichts entpackt")
            raise GesetzFehler("ZIP-NAME")
        mitglieder[name] = z.read(info)
    xmls = [n for n in mitglieder if n.lower().endswith(".xml")]
    if len(xmls) != 1:
        log.fehler("ZIP-INHALT", kuerzel, "xml.zip enthält %d XML-Dateien (%s), erwartet genau eine"
                   % (len(xmls), ", ".join(sorted(mitglieder))),
                   "Paketformat geändert", "Archiv ansehen und Werkzeug anpassen")
        raise GesetzFehler("ZIP-INHALT")
    return xmls[0], mitglieder


def bearbeite(e, ablage, netz, toc_holen, manifest, args, log):
    k = e["kuerzel"]
    ordner, stand = ablage["ordner"], ablage["stand"]
    xml_pfad = rec_datei(ordner, stand, k, "xml")
    pdf_pfad = rec_datei(ordner, stand, k, "pdf")
    # 1. Laden (der Ordner ist neu; nichts wird übersprungen, nichts überschrieben)
    eintrag = {"kuerzel": k}
    try:
        slug = pruefe_slug(e, toc_holen(), log)
        eintrag["slug"] = slug
        start_url = BASIS + slug + "/"
        xml_url = BASIS + slug + "/xml.zip"
        eintrag["xml_url"] = xml_url
        log.info("%s: lade %s" % (k, xml_url))
        zip_bytes = netz.hole(xml_url, k)
        abrufzeit = jetzt_iso()
        xml_name, mitglieder = pruefe_zip(zip_bytes, k, log)
        xml_bytes = mitglieder[xml_name]
        try:
            ET.fromstring(xml_bytes)
        except ET.ParseError as ex:
            log.fehler("XML", k, "%s ist nicht wohlgeformt (%s)" % (xml_name, ex),
                       "Datei beschädigt oder nicht auflösbare Entität",
                       ABHILFE_NEUER_STAND + "; bleibt es, XML von Hand prüfen")
            raise GesetzFehler("XML")
        log.info("%s: lade Startseite %s" % (k, start_url))
        start_html = netz.hole(start_url, k)
        pdf_url = finde_pdf(start_html, start_url, k, log)
        eintrag["pdf_url"] = pdf_url
        log.info("%s: lade %s" % (k, pdf_url))
        pdf_bytes = netz.hole(pdf_url, k)
        if not pdf_bytes.startswith(b"%PDF"):
            log.fehler("PDF-SIGNATUR", k, "%s beginnt nicht mit %%PDF (erste Bytes: %r)" % (pdf_url, pdf_bytes[:16]),
                       "Server lieferte eine HTML-Fehlerseite statt des PDF",
                       ABHILFE_NEUER_STAND)
            raise GesetzFehler("PDF-SIGNATUR")
        # 2. Ablegen (Originale unverändert; das ZIP selbst wird nicht gespeichert,
        #    seine Prüfsumme steht im Manifest; Bilddateien aus dem ZIP daneben)
        os.makedirs(ordner, exist_ok=True)
        schreibe_atomar(xml_pfad, xml_bytes)
        for name, daten in mitglieder.items():
            if name != xml_name:
                schreibe_atomar(os.path.join(ordner, bild_dateiname(stand, k, name)), daten)
        schreibe_atomar(pdf_pfad, pdf_bytes)
        eintrag.update({"sha256_zip": sha256(zip_bytes), "sha256_xml": sha256(xml_bytes),
                        "sha256_pdf": sha256(pdf_bytes), "abrufzeit": abrufzeit})
    except GesetzFehler as ex:
        eintrag["status"] = "fehler: " + ex.code
        manifest[k] = eintrag
        return "fehler"
    manifest[k] = eintrag
    return konvertiere_lokal(e, ablage, manifest, log)


def konvertiere_lokal(e, ablage, manifest, log):
    k = e["kuerzel"]
    ordner, stand = ablage["ordner"], ablage["stand"]
    xml_pfad = rec_datei(ordner, stand, k, "xml")
    pdf_pfad = rec_datei(ordner, stand, k, "pdf")
    md_pfad = rec_datei(ordner, stand, k, "md")
    eintrag = manifest.setdefault(k, {"kuerzel": k})
    codes = []
    try:
        xml_bytes = open(xml_pfad, "rb").read()
        if eintrag.get("sha256_xml") and sha256(xml_bytes) != eintrag["sha256_xml"]:
            log.fehler("XML-DRIFT", k, "%s weicht von der Prüfsumme im Manifest ab" % os.path.basename(xml_pfad),
                       "gespeicherte Datei beim Schreiben verändert oder unvollständig", ABHILFE_NEUER_STAND)
            raise GesetzFehler("XML-DRIFT")
        pdf_bytes = open(pdf_pfad, "rb").read() if os.path.isfile(pdf_pfad) else b""
        if not pdf_bytes.startswith(b"%PDF"):
            log.fehler("PDF-SIGNATUR", k, "%s fehlt oder beginnt nicht mit %%PDF" % os.path.basename(pdf_pfad),
                       "PDF nicht geladen oder beschädigt", ABHILFE_NEUER_STAND)
            raise GesetzFehler("PDF-SIGNATUR")
        try:
            ET.fromstring(xml_bytes)
        except ET.ParseError as ex:
            log.fehler("XML", k, "%s ist nicht wohlgeformt (%s)" % (os.path.basename(xml_pfad), ex),
                       "Datei beschädigt", ABHILFE_NEUER_STAND)
            raise GesetzFehler("XML")
        eintrag.update({"sha256_xml": sha256(xml_bytes), "sha256_pdf": sha256(pdf_bytes)})
        quellen = {"xml_url": eintrag.get("xml_url", ""), "pdf_url": eintrag.get("pdf_url", ""),
                   "start_url": BASIS + eintrag.get("slug", "") + "/",
                   "abrufzeit": eintrag.get("abrufzeit", ""), "sha256_zip": eintrag.get("sha256_zip", ""),
                   "sha256_xml": eintrag["sha256_xml"]}
        try:
            md, zahlen, codes = konvertiere(k, xml_bytes, quellen, log, stand)
        except Exception as ex:   # Konverter-Fehler: Gesetz abbrechen, Lauf fortsetzen
            log.fehler("KONVERTER", k, "Umwandlung abgebrochen: %s: %s" % (type(ex).__name__, ex),
                       "Fehler im Konverter bei einem XML-Aufbau, den er nicht erwartet",
                       "Werkzeug korrigieren, dann " + ABHILFE_NEUER_STAND)
            raise GesetzFehler("KONVERTER")
        for b in zahlen.get("bilder", []):
            if not os.path.isfile(os.path.join(ordner, bild_dateiname(stand, k, b))):
                log.hinweis("BILD-FEHLT", k, "Abbildung „%s“ ist im XML referenziert, aber nicht in xml.zip" % b,
                            "Bild nur in der HTML/PDF-Fassung", "im PDF nachsehen")
        md_bytes = md.encode("utf-8")
        schreibe_atomar(md_pfad, md_bytes)
        eintrag.update({"stand": zahlen.get("stand", ""), "builddate": zahlen.get("builddate", ""),
                        "normen_xml": zahlen.get("normen_xml", 0),
                        "einzelnormen_xml": zahlen.get("einzelnormen_xml", 0),
                        "einzelnormen_md": zahlen.get("einzelnormen_md", 0),
                        "sha256_md": sha256(md_bytes), "konverter": KONVERTER})
        # Normenzahl: alle <norm> klassifiziert, je Einzelnorm und Gliederung ein Anker
        summe = zahlen["rahmen_xml"] + zahlen["gliederung_xml"] + zahlen["einzelnormen_xml"]
        if (zahlen["einzelnormen_md"] != zahlen["einzelnormen_xml"]
                or zahlen["gliederung_md"] != zahlen["gliederung_xml"]
                or summe != zahlen["normen_xml"]):
            log.fehler("NORMENZAHL", k,
                       "XML: %d <norm> (Rahmen %d, Gliederung %d, Einzelnormen %d); MD: Gliederung %d, Einzelnormen %d"
                       % (zahlen["normen_xml"], zahlen["rahmen_xml"], zahlen["gliederung_xml"],
                          zahlen["einzelnormen_xml"], zahlen["gliederung_md"], zahlen["einzelnormen_md"]),
                       "eine Norm ging bei der Umwandlung verloren oder ihr Anker ist nicht in der erwarteten Form",
                       "Konverter korrigieren, dann " + ABHILFE_NEUER_STAND)
            codes.append("NORMENZAHL")
        log.info("%s: %d <norm> im XML = Rahmen %d + Gliederung %d + Einzelnormen %d; im MD %d Einzelnormen, %d Gliederungen; %d Bytes MD"
                 % (k, zahlen["normen_xml"], zahlen["rahmen_xml"], zahlen["gliederung_xml"],
                    zahlen["einzelnormen_xml"], zahlen["einzelnormen_md"], zahlen["gliederung_md"], len(md_bytes)))
    except GesetzFehler as ex:
        codes.append(ex.code)
    except OSError as ex:
        log.fehler("DATEI", k, "Datei nicht lesbar/schreibbar: %s" % ex,
                   "Rechte, Platz oder Pfad", "Verzeichnis prüfen und erneut starten")
        codes.append("DATEI")
    eintrag["status"] = "fertig" if not codes else "fehler: " + ",".join(codes)
    # Hinweise dieses Laufs für den REC-Knoten (Spalte hinweise des Manifests)
    if k in log.hinweise:
        eintrag["hinweise"] = " | ".join(log.hinweise[k])
    log.info("%s: Status %s" % (k, eintrag["status"]))
    return "fertig" if not codes else "fehler"


# --------------------------------------------------------------------------
# REC-Knoten
# --------------------------------------------------------------------------

KNOTEN_ANFANG = "<!-- normen-holen: Auffälligkeiten Anfang — dieser Block wird vom Werkzeug geschrieben -->"
KNOTEN_ENDE = "<!-- normen-holen: Auffälligkeiten Ende -->"


def lies_md_kopf(md_pfad):
    """Stand-Angaben (alle Typen) und Anzahl der Einzelnormen ohne amtliche
    Überschrift aus der Lesefassung."""
    stand_angaben, ohne_titel, einzel = [], 0, 0
    if not os.path.isfile(md_pfad):
        return stand_angaben, None
    with open(md_pfad, encoding="utf-8") as f:
        zl = f.read().splitlines()
    im_stand = False
    for i, z in enumerate(zl):
        if z.startswith("- **Stand-Angaben"):
            im_stand = True
            continue
        if im_stand:
            if z.startswith("  - "):
                stand_angaben.append(z[4:])
                continue
            im_stand = False
        m = re.match(r'^<a id="([^"]+)"></a>$', z)
        if m and not m.group(1).startswith("gl-") and i + 1 < len(zl):
            einzel += 1
            kopf = re.sub(r"^#+\s*", "", zl[i + 1]).strip()
            if re.fullmatch(r"(§+|Art\.?|Artikel)\s*\S+", kopf):
                ohne_titel += 1
    return stand_angaben, (ohne_titel, einzel)


def auffaelligkeiten(ablage, manifest, liste):
    """Zeilen des Abschnitts „Auffälligkeiten der Quelle“ aus Manifest, Lesefassungen
    und den Hinweisen des Laufs — mechanisch, ohne Wertung."""
    ordner, stand = ablage["ordner"], ablage["stand"]
    z = []
    abrufe = sorted({(manifest[k].get("abrufzeit") or "")[:10] for k in manifest if manifest[k].get("abrufzeit")})
    if len(abrufe) > 1:
        z.append("- **Mehrere Abrufdaten in einem Stand:** %s — der Stand trägt das Datum %s; "
                 "die Abrufzeit je Gesetz steht im Manifest." % (", ".join(abrufe), stand))
    for e in liste:
        k = e["kuerzel"]
        m = manifest.get(k)
        if not m:
            z.append("- **%s:** nicht im Manifest (nicht geladen)." % k)
            continue
        punkte = []
        if m.get("status") != "fertig":
            punkte.append("Status „%s“" % m.get("status", ""))
        if not (m.get("stand") or "").strip():
            punkte.append("keine Stand-Zeile im XML")
        stand_angaben, titel = lies_md_kopf(rec_datei(ordner, stand, k, "md"))
        for s in stand_angaben:
            if NOCH_NICHT_ABSCHLIESSEND in s:
                punkte.append("Quellvermerk „%s“ (%s)" % (NOCH_NICHT_ABSCHLIESSEND, s))
        if titel and titel[1] and titel[0] * 2 >= titel[1]:
            punkte.append("keine amtlichen Überschriften der Einzelnormen (%d von %d nur „§ n“ bzw. „Art n“)" % titel)
        pdf = rec_datei(ordner, stand, k, "pdf")
        if not os.path.isfile(pdf):
            punkte.append("PDF fehlt")
        else:
            with open(pdf, "rb") as f:
                if not f.read(5).startswith(b"%PDF"):
                    punkte.append("PDF ohne Signatur %PDF")
        try:
            if int(m.get("einzelnormen_xml") or 0) != int(m.get("einzelnormen_md") or 0):
                punkte.append("Zählung Einzelnormen XML %s ≠ MD %s" % (m.get("einzelnormen_xml"), m.get("einzelnormen_md")))
        except ValueError:
            pass
        for h in (m.get("hinweise") or "").split(" | "):
            if h.strip():
                punkte.append("Hinweis des Werkzeugs — " + h.strip())
        if punkte:
            z.append("- **%s** (`%s`): %s." % (k, os.path.basename(rec_datei(ordner, stand, k, "md")), "; ".join(punkte)))
    if not z:
        z.append("- keine Auffälligkeiten aus Manifest, Lesefassungen und Lauf-Hinweisen.")
    z.append("")
    z.append("Geprüft wird gegen die Signatur `%PDF`, nicht gegen den PDF-Inhalt; Lücken, die auch im XML "
             "fehlen, fallen nicht maschinell auf. Menschliche Funde werden als Vermerk angehängt (Abschnitt Vermerke).")
    return z


def knoten_pfad(wurzel, ablage):
    return os.path.join(wurzel, "wiki", rec_knotenname(ablage["rec"], ablage["stand"]))


def schreibe_knoten(wurzel, ablage, manifest, liste, mitgeliefert, log):
    """REC-Detail-Knoten einmal anlegen (am Ende des Laufs); ein vorhandener
    Knoten wird nie angefasst — das Gate in main() hat ihn vorher ausgeschlossen.
    Der Werkzeug-Block zwischen den Marken ist der maschinell gefüllte Teil des
    Abschnitts „Auffälligkeiten der Quelle“; menschliche Funde kommen als Vermerk."""
    rec, stand = ablage["rec"], ablage["stand"]
    ordner_name = os.path.basename(ablage["ordner"])
    pfad = knoten_pfad(wurzel, ablage)
    block = [KNOTEN_ANFANG] + auffaelligkeiten(ablage, manifest, liste) + [KNOTEN_ENDE]
    if os.path.isfile(pfad):
        log.fehler("KNOTEN-VORHANDEN", rec, "Knoten %s liegt schon vor — nicht überschrieben" % os.path.basename(pfad),
                   "ein Knoten gleichen Namens ist während des Laufs entstanden", "Knoten prüfen; der Stand ist eingefroren")
        return
    abruf = sorted({(manifest[k].get("abrufzeit") or "")[:10] for k in manifest if manifest[k].get("abrufzeit")})
    z = ["---", "type: research-artifact", "id: " + rec, "titel: \"Normen-Paket Stand %s\"" % stand,
         "datum: " + (abruf[0] if abruf else stand), "alias: [normen-" + stand + "]"]
    if mitgeliefert:
        z.append("mitgeliefert: template")
    z.append("quelle_liste:")
    for e in liste:
        m = manifest.get(e["kuerzel"], {})
        z.append("  - gesetz: %s" % e["kuerzel"])
        z.append("    url: %s" % (m.get("xml_url") or (BASIS + e["slug"] + "/")))
        z.append("    stand: \"%s\"" % (m.get("stand") or "").replace('"', "'"))
        z.append("    archiv: \"research/%s/%s\"" % (ordner_name, os.path.basename(rec_datei("", stand, e["kuerzel"], "md")).strip("/")))
    z += ["---", "", "# %s — Normen-Paket Stand %s" % (rec, stand), "",
          "**Nachweis, nicht Wahrheit.** Normtexte sind extern beschafftes Wissen; dieser Knoten ist ab Anlage "
          "eingefroren, Nachträge stehen als Vermerke. Die Übernahme des Stands als Arbeitsgrundlage ist eine "
          "Entscheidung je Paket-Stand (Feld „Übernommen als DEC“ im Register).", "",
          "## Frage", "",
          "Welcher Stand der Bundesgesetze des Normen-Pakets gilt als Arbeitsgrundlage, und woher stammt er?", "",
          "## Recherche-Verlauf", "",
          "- **Quelle:** gesetze-im-internet.de (amtliches XML und PDF je Gesetz), Dokumentationsfassung, nicht die "
          "amtliche Verkündung (maßgeblich ist das Bundesgesetzblatt). Amtliche Werke, gemeinfrei nach § 5 UrhG.",
          "- **Werkzeug:** `tools/normen-holen.py` %s (Konverter %s), mechanisch, ohne Sprachmodell; Gesetzesliste "
          "`tools/normen-liste.tsv`." % (VERSION, KONVERTER),
          "- **Abruf:** %s; je Gesetz Abrufzeit, Stand-Zeile, builddate und Prüfsummen (sha256 von xml.zip, XML, PDF, "
          "Lesefassung) in `research/%s/manifest.tsv`." % (", ".join(abruf) or stand, ordner_name),
          "- **Ablage:** `research/%s/` mit `%s <kuerzel>.xml`, `.pdf`, `.md` je Gesetz; Lauf-Log `%s normen-holen.log`."
          % (ordner_name, stand, stand), "",
          "## Fundstellen", "",
          "Je Gesetz die Lesefassung (Anker je Norm: `#p<nr>`, `#art<nr>`, Gliederung `#gl-…`):", ""]
    for e in liste:
        m = manifest.get(e["kuerzel"], {})
        md_name = os.path.basename(rec_datei("", stand, e["kuerzel"], "md"))
        z.append("- **%s** — %s: [%s](../research/%s/%s) · %s" % (
            e["kuerzel"], e["titel"], md_name, url_pfad(ordner_name), url_pfad(md_name),
            m.get("stand") or "ohne Stand-Zeile"))
    z += ["", "## Ergebnis", "",
          "Der Stand %s umfasst %d Gesetze (Status im Manifest). Wegweiser, die für diesen Stand geschrieben sind, "
          "verlinken auf die Anker der Lesefassungen; `tools/wegweiser-quellen.py --pruefen` prüft die Links." % (stand, len(liste)), "",
          "## Auffälligkeiten der Quelle", ""] + block + ["",
          "## Vermerke", "", "_(append-only)_", "",
          "## Bezüge", "",
          "- Fassaden-Eintrag: [[Rechercheartefakte]]", "- Katalog: [[Katalog-Rechercheartefakte]]", "- Wegweiser: [[Wegweiser]]", ""]
    schreibe_atomar(pfad, "\n".join(z).encode("utf-8"))
    log.info("%s: Knoten %s angelegt" % (rec, os.path.basename(pfad)))


# --------------------------------------------------------------------------
# Hauptprogramm
# --------------------------------------------------------------------------


def _anzeige_pfad(pfad, wurzel):
    """Pfad fürs Log ohne Benutzer- und Rechnerteile: relativ zur Wurzel, sonst nur der Dateiname."""
    rel = os.path.relpath(os.path.abspath(pfad), os.path.abspath(wurzel))
    return os.path.basename(pfad) if rel.startswith("..") else rel


EINGEFROREN = ("Stand %s liegt vor und ist eingefroren (research/%s); neuer Stand braucht einen neuen Ordner")
EINGEFROREN_TUN = ("ein anderes Datum mit --stand nennen (Vorgabe: heute) und --rec weglassen (nächste freie "
                   "Nummer); ein bestehender Stand wird nie fortgesetzt oder überschrieben — ist der Ordner der "
                   "Rest eines abgebrochenen Laufs ohne Knoten, von Hand entfernen und neu starten")


def ermittle_ablage(wurzel, args):
    """REC-Nummer, Stand und Ordner des neuen Laufs. Ein Stand ist ab Anlage
    eingefroren: liegt der Ordner des genannten Stands schon vor (unabhängig
    von Knoten, Register-Zeile oder Kennzeichen), bricht der Aufruf ab; es
    gibt kein Fortsetzen desselben Tages und keinen Schalter zum Überschreiben."""
    stand = args.stand or dt.date.today().isoformat()
    if not DATUM.match(stand):
        aufruf_fehler("--stand „%s“ ist kein Datum JJJJ-MM-TT" % stand, "Datum des Stands angeben, z. B. 2026-11-05")
    vorhanden = vorhandene_rec(wurzel)
    for n, d, name in vorhanden:
        if d == stand:
            aufruf_fehler(EINGEFROREN % (stand, name), EINGEFROREN_TUN)
    rec = args.rec
    if rec:
        if not REC_NUMMER.match(rec):
            aufruf_fehler("--rec „%s“ hat nicht die Form REC-NNN" % rec,
                          "Präfix REC- und mindestens drei Ziffern angeben (nächste freie Nummer des Projekts)")
        nummer = int(rec.split("-")[1])
        for n, d, name in vorhanden:
            if n == nummer:
                aufruf_fehler("%s liegt schon als Stand %s vor (research/%s) — ein Stand ist eingefroren" % (rec, d, name),
                              "neuen Stand mit neuer Nummer anlegen (--rec weglassen oder die nächste freie Nummer nennen)")
        if nummer in vergebene_rec_nummern(wurzel):
            aufruf_fehler("%s ist im Projekt schon vergeben (Knoten unter wiki/ oder Zeile im Register)" % rec,
                          "--rec weglassen (nächste freie Nummer) oder eine freie Nummer nennen")
    else:
        rec = naechste_rec_nummer(wurzel)
    ordner = os.path.join(wurzel, "research", rec_ordnername(rec, stand))
    ablage = {"rec": rec, "stand": stand, "ordner": ordner}
    # Gate: weder der Ordner noch der Knoten des Stands dürfen schon vorliegen.
    if os.path.exists(ordner):
        aufruf_fehler(EINGEFROREN % (stand, os.path.basename(ordner)), EINGEFROREN_TUN)
    if os.path.exists(knoten_pfad(wurzel, ablage)):
        aufruf_fehler("Knoten wiki/%s liegt schon vor — der Stand ist eingefroren" % os.path.basename(knoten_pfad(wurzel, ablage)),
                      EINGEFROREN_TUN)
    return ablage


def pruefe_log_pfad(log_pfad, wurzel):
    """--log darf nicht in den Ordner eines bestehenden Stands zeigen."""
    research = os.path.abspath(os.path.join(wurzel, "research"))
    ziel = os.path.abspath(log_pfad)
    for n, d, name in vorhandene_rec(wurzel):
        ordner = os.path.join(research, name)
        if ziel == ordner or ziel.startswith(ordner + os.sep):
            aufruf_fehler("--log %s liegt im Ordner des eingefrorenen Stands %s (research/%s)" % (log_pfad, d, name),
                          "Log-Datei außerhalb bestehender Stände ablegen oder --log weglassen (Vorgabe: im neuen Ordner)")


def main(argv=None):
    hier = os.path.dirname(os.path.abspath(__file__))
    p = argparse.ArgumentParser(
        prog="normen-holen.py",
        description="Lädt Bundesgesetze (XML, PDF) von gesetze-im-internet.de und wandelt sie "
                    "mechanisch, ohne Sprachmodell, in Markdown. Gesetze aus tools/normen-liste.tsv; "
                    "Ablage als Rechercheartefakt je Paket-Stand: research/REC-NNN - Normen-Paket Stand JJJJ-MM-TT/ "
                    "mit „JJJJ-MM-TT <kuerzel>.xml|.pdf|.md“, manifest.tsv und Lauf-Log; Detail-Knoten "
                    "wiki/REC-NNN — Normen-Paket Stand JJJJ-MM-TT.md mit dem Abschnitt „Auffälligkeiten der Quelle“. "
                    "Ein Lauf legt genau einen neuen Stand an; ein vorhandener Stand ist eingefroren und wird nie "
                    "fortgesetzt, nachgebessert oder überschrieben (kein Schalter dafür).",
        epilog="Exit-Codes: 0 alle gewählten Gesetze fertig; 1 mindestens ein Gesetz mit FEHLER "
               "(Befund-Zeilen im Log); 2 Aufruf-Fehler (Option, Liste, Verzeichnis, Stand liegt schon vor); "
               "130 abgebrochen (Strg-C; der angefangene Ordner bleibt stehen und ist von Hand zu entfernen). "
               "Ausgabe je Befund: FEHLER|HINWEIS  CODE  kuerzel: was — "
               "Ursache: … — Abhilfe: …  Einzelheiten: tools/README.md.")
    p.add_argument("--nur", metavar="KUERZEL[,…]", help="nur diese Gesetze (Kürzel aus der Liste, kommagetrennt); "
                                                        "das Ergebnis ist trotzdem ein eigener, vollständiger Stand")
    p.add_argument("--liste-pruefen", action="store_true",
                   help="nur die Slugs der Liste gegen gii-toc.xml prüfen (eine Anfrage), nichts laden")
    p.add_argument("--liste", default=os.path.join(hier, "normen-liste.tsv"),
                   help="Gesetzesliste (TSV: kuerzel, slug, titel, gruppe); Vorgabe: tools/normen-liste.tsv")
    p.add_argument("--ziel", default=os.path.dirname(hier),
                   help="Projekt-Wurzel mit research/ und wiki/; Vorgabe: Elternordner von tools/")
    p.add_argument("--rec", metavar="REC-NNN",
                   help="Nummer des neuen Rechercheartefakts; Vorgabe: nächste freie Projekt-Nummer "
                        "(mitgelieferte Stände tragen Nummern ab REC-%d); eine vergebene Nummer wird abgelehnt" % MITGELIEFERT_AB)
    p.add_argument("--stand", metavar="JJJJ-MM-TT",
                   help="Datum des neuen Paket-Stands im Ordner- und Dateinamen; Vorgabe: heute; "
                        "ein Datum, zu dem schon ein Ordner liegt, wird abgelehnt")
    p.add_argument("--mitgeliefert", action="store_true",
                   help="Kennzeichen „mitgeliefert: template“ in den REC-Knoten setzen (Erneuerung des Pakets im Template)")
    p.add_argument("--log", help="Log-Datei; Vorgabe: <neuer REC-Ordner>/<Stand> normen-holen.log; "
                                 "nie im Ordner eines bestehenden Stands")
    p.add_argument("--version", action="version", version="%(prog)s " + VERSION + " (Konverter " + KONVERTER + ")")
    args = p.parse_args(argv)

    wurzel = os.path.abspath(args.ziel)
    if not os.path.isdir(wurzel):
        aufruf_fehler("Zielordner %s fehlt" % wurzel, "Ordner anlegen oder --ziel korrigieren")
    liste = lies_liste(args.liste)
    reihenfolge = [e["kuerzel"] for e in liste]
    if args.nur:
        wahl = [x.strip().lower() for x in args.nur.split(",") if x.strip()]
        fremd = [x for x in wahl if x not in reihenfolge]
        if fremd:
            aufruf_fehler("--nur: unbekannte Kürzel %s" % ", ".join(fremd),
                          "Kürzel aus %s verwenden: %s" % (args.liste, ", ".join(reihenfolge)))
        liste = [e for e in liste if e["kuerzel"] in wahl]

    if args.log:
        pruefe_log_pfad(args.log, wurzel)
    if args.liste_pruefen:
        # Prüfung der Liste legt keinen Stand an und braucht keinen Ordner.
        ablage = {"rec": "—", "stand": args.stand or dt.date.today().isoformat(), "ordner": None}
        log_pfad = args.log
    else:
        ablage = ermittle_ablage(wurzel, args)   # bricht ab, wenn der Stand schon vorliegt
        log_pfad = args.log or os.path.join(ablage["ordner"], "%s normen-holen.log" % ablage["stand"])
    try:
        if log_pfad:
            os.makedirs(os.path.dirname(os.path.abspath(log_pfad)), exist_ok=True)
        log = Log(log_pfad)
    except OSError as ex:
        aufruf_fehler("Log-Datei %s nicht anlegbar (%s)" % (log_pfad, ex), "Rechte prüfen oder --log angeben")

    log.info("%s %s (Konverter %s) — %s Stand %s — Ziel %s — %d Gesetz(e)%s"
             % (WERKZEUG, VERSION, KONVERTER, ablage["rec"], ablage["stand"],
                os.path.basename(wurzel) or wurzel, len(liste),
                (" — Log " + _anzeige_pfad(log_pfad, wurzel)) if log_pfad else ""))
    netz = Netz(log)
    toc_cache = {}

    def toc_holen():
        if "toc" not in toc_cache:
            log.info("lade Inhaltsverzeichnis %s" % TOC_URL)
            toc_cache["toc"] = lies_toc(netz.hole(TOC_URL, "gii-toc.xml"), log)
        return toc_cache["toc"]

    if args.liste_pruefen:
        fehler = 0
        try:
            toc = toc_holen()
        except GesetzFehler:
            return EXIT_FEHLER
        for e in liste:
            try:
                s = pruefe_slug(e, toc, log)
                log.info("%s: Slug %s — %s" % (e["kuerzel"], s, toc[0][s]))
            except GesetzFehler:
                fehler += 1
        return EXIT_FEHLER if fehler else EXIT_OK

    manifest_pfad = os.path.join(ablage["ordner"], "manifest.tsv")
    manifest = {}   # der Ordner ist neu; es gibt kein Manifest, an das angeknüpft würde
    ergebnis = {}
    try:
        for e in liste:
            try:
                ergebnis[e["kuerzel"]] = bearbeite(e, ablage, netz, toc_holen, manifest, args, log)
            except GesetzFehler as ex:   # z. B. Inhaltsverzeichnis nicht ladbar
                manifest.setdefault(e["kuerzel"], {"kuerzel": e["kuerzel"]})["status"] = "fehler: " + ex.code
                ergebnis[e["kuerzel"]] = "fehler"
            os.makedirs(ablage["ordner"], exist_ok=True)
            schreibe_manifest(manifest_pfad, manifest, reihenfolge)
    except KeyboardInterrupt:
        os.makedirs(ablage["ordner"], exist_ok=True)
        schreibe_manifest(manifest_pfad, manifest, reihenfolge)
        log.info("abgebrochen; Stand %s ist unvollständig und ohne Knoten — der Ordner research/%s bleibt stehen "
                 "und ist von Hand zu entfernen; ein neuer Lauf legt einen neuen Stand an (kein Fortsetzen)"
                 % (ablage["stand"], os.path.basename(ablage["ordner"])))
        return 130
    # Der Knoten beschreibt genau die Gesetze dieses Laufs (mit --nur: die Auswahl).
    schreibe_knoten(wurzel, ablage, manifest, liste, args.mitgeliefert, log)
    fertig = [k for k, v in ergebnis.items() if v == "fertig"]
    fehl = [k for k, v in ergebnis.items() if v != "fertig"]
    log.info("Ende: %d fertig, %d mit Fehler%s; %d Netz-Anfragen; Manifest %s"
             % (len(fertig), len(fehl), (" (" + ", ".join(fehl) + ")") if fehl else "",
                netz.anfragen, _anzeige_pfad(manifest_pfad, wurzel)))
    return EXIT_FEHLER if fehl else EXIT_OK


if __name__ == "__main__":
    sys.exit(main())
