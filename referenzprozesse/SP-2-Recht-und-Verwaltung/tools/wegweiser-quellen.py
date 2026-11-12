#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""wegweiser-quellen — Links der Wegweiser prüfen und die Liste der zitierten
Normen erzeugen, mechanisch (ohne Sprachmodell).

Liest alle Wegweiser wiki/Wegweiser-*.md und die Fristenkataloge der
Referenzprozesse wiki/Fristenkatalog-*.md (Übersichtsseiten, Typ guide) und
ihre Teilaufsätze im gleichnamigen Unterordner wiki/<Name>/ und prüft

  - jeden Markdown-Link: Ziel-Datei vorhanden; bei Normlinks (Lesefassung im
    Ordner research/REC-NNN - Normen-Paket Stand JJJJ-MM-TT/) der Anker
    <a id="…"> in der Zieldatei, und dass der Stand zur Kopfzeile des
    Wegweisers passt; bei Wiki-Zielen ein Überschriften-Anker, falls gesetzt
  - jeden Wikilink [[Name]]: wiki/Name.md vorhanden
  - den Aufbau nach Wiki.md §5.4: Teilaufsätze mit dem Knotennamen als Präfix,
    Rücklink auf die Übersicht, Übersicht listet jeden Teilaufsatz, kein
    Unterordner ohne Seite, Dateinamen unter wiki/ eindeutig
  - den Kopf jedes Wegweisers: Frontmatter type: guide mit normen_rec und
    normen_stand, Zeile „Stand der Normtexte“

Nichts wird umgeschrieben. Ausgabe je Befund auf stderr:
  FEHLER|HINWEIS  CODE  ort: was — Ursache: … — Abhilfe: …
Exit-Codes: 0 fertig; 1 mindestens ein FEHLER; 2 Aufruf-Fehler.

Nur Standardbibliothek. Einzelheiten: tools/README.md.
"""

import argparse
import os
import re
import sys
import urllib.parse

WERKZEUG = "wegweiser-quellen"
VERSION = "2.0"
EXIT_OK, EXIT_FEHLER, EXIT_AUFRUF = 0, 1, 2

REC_ORDNER = re.compile(r"^REC-(\d{3,}) - Normen-Paket Stand (\d{4}-\d{2}-\d{2})$")
NORMDATEI = re.compile(r"^(\d{4}-\d{2}-\d{2}) ([a-z0-9_-]+)\.md$")
LINK = re.compile(r"\]\(([^)\s]+)\)")
WIKILINK = re.compile(r"\[\[([^\]|#]+)(?:#[^\]|]*)?(?:\|[^\]]*)?\]\]")
ANKER = re.compile(r'^<a id="([^"]+)"></a>\s*$')
UEBERSCHRIFT = re.compile(r"^#{1,6}\s+(.*?)\s*$")
PRAEFIXE = ("Wegweiser-", "Fristenkatalog-")   # Übersichtsseiten mit Teilaufsätzen (Typ guide)
TEILAUFSATZ = re.compile(r"^((?:Wegweiser|Fristenkatalog)-[A-Za-z0-9-]+)-(\d{2})-.+\.md$")
MARKE = "nicht im Paket belegt"


class Meldungen:
    def __init__(self):
        self.fehler = 0
        self.hinweise = 0

    def _aus(self, schwere, code, ort, was, warum=None, tun=None):
        teile = [was]
        if warum:
            teile.append("Ursache: " + warum)
        if tun:
            teile.append("Abhilfe: " + tun)
        print("%-8s %s  %s: %s" % (schwere, code, ort, " — ".join(teile)), file=sys.stderr)

    def fehl(self, *a, **k):
        self.fehler += 1
        self._aus("FEHLER", *a, **k)

    def hin(self, *a, **k):
        self.hinweise += 1
        self._aus("HINWEIS", *a, **k)


def aufruf_fehler(text, tun=None):
    meldung = WERKZEUG + ": " + text
    if tun:
        meldung += " — Abhilfe: " + tun
    print(meldung, file=sys.stderr)
    sys.exit(EXIT_AUFRUF)


def lies(pfad):
    with open(pfad, encoding="utf-8") as f:
        return f.read()


def frontmatter(text):
    """Einfache Schlüssel: Wert-Paare des Kopfblocks (ohne YAML-Bibliothek)."""
    if not text.startswith("---\n"):
        return {}, text
    ende = text.find("\n---", 4)
    if ende < 0:
        return {}, text
    felder = {}
    for z in text[4:ende].splitlines():
        m = re.match(r"^([A-Za-z_][A-Za-z0-9_-]*):\s*(.*?)\s*$", z)
        if m:
            felder[m.group(1)] = m.group(2).strip('"')
    return felder, text[ende + 4:]


def ueberschriften_anker(text):
    """Anker-Kandidaten einer Wiki-Seite: Überschriften als Slug (GitHub-Art) und wörtlich."""
    res = set()
    for z in text.splitlines():
        m = UEBERSCHRIFT.match(z)
        if m:
            t = m.group(1)
            res.add(t)
            slug = re.sub(r"[^\w\- ]", "", t.lower()).strip().replace(" ", "-")
            res.add(slug)
    return res


# --------------------------------------------------------------------------
# Einlesen
# --------------------------------------------------------------------------

def sammle_wegweiser(wiki, m):
    """Liste von Dicts: stem, datei, teil (Liste der Teilaufsatz-Dateien, relativ zu wiki/).

    Gelesen werden die Wegweiser (wiki/Wegweiser-*.md) und die Fristenkataloge der
    Referenzprozesse (wiki/Fristenkatalog-*.md), beide Knoten des Typs guide mit
    Teilaufsätzen im gleichnamigen Unterordner (Vorgehen-RP-20 §13; Wiki.md §5.4)."""
    stems = sorted(f[:-3] for f in os.listdir(wiki)
                   if f.startswith(PRAEFIXE) and f.endswith(".md") and os.path.isfile(os.path.join(wiki, f)))
    ordner = sorted(f for f in os.listdir(wiki) if f.startswith(PRAEFIXE) and os.path.isdir(os.path.join(wiki, f)))
    for o in ordner:
        if o not in stems:
            m.fehl("QU-ORDNER-OHNE-SEITE", "wiki/" + o + "/", "Unterordner ohne Seite gleichen Namens",
                   "Übersichtsseite fehlt oder umbenannt (Wiki.md §5.4)", "wiki/" + o + ".md anlegen oder Ordner umbenennen")
    res = []
    for s in stems:
        w = {"stem": s, "datei": s + ".md", "teil": []}
        o = os.path.join(wiki, s)
        if os.path.isdir(o):
            for t in sorted(os.listdir(o)):
                if not t.endswith(".md"):
                    continue
                rel = s + "/" + t
                mm = TEILAUFSATZ.match(t)
                if not mm or mm.group(1) != s:
                    m.fehl("QU-TEILAUFSATZ-NAME", "wiki/" + rel, "Dateiname ohne Präfix „%s-NN-“" % s,
                           "Teilaufsatz nicht nach Wiki.md §5.4 benannt", "Datei umbenennen und Links nachziehen")
                w["teil"].append(rel)
        res.append(w)
    return res


def pruefe_dateinamen(wiki, m):
    gesehen = {}
    doppelt = 0
    for wurzel, _, dateien in os.walk(wiki):
        for d in dateien:
            if not d.endswith(".md"):
                continue
            rel = os.path.relpath(os.path.join(wurzel, d), wiki)
            if d in gesehen:
                doppelt += 1
                m.fehl("QU-DATEINAME-DOPPELT", "wiki/" + rel, "Dateiname auch in wiki/" + gesehen[d],
                       "Dateinamen unter wiki/ müssen über alle Ordner eindeutig sein (Wiki.md §5.4)",
                       "eine der Dateien umbenennen")
            else:
                gesehen[d] = rel
    return doppelt


# --------------------------------------------------------------------------
# Prüfen
# --------------------------------------------------------------------------

class Pruefer:
    def __init__(self, wurzel, m, basis=()):
        self.wurzel = wurzel
        self.wiki = os.path.join(wurzel, "wiki")
        self.basis = [os.path.abspath(b) for b in basis]
        self.m = m
        self.anker = {}        # Pfad -> set(Anker) der Normdateien
        self.koepfe = {}       # Pfad -> set(Überschriften) der Wiki-Seiten
        self.ueberschrift = {} # (Pfad, Anker) -> Überschrift der Norm
        self.links = 0
        self.normlinks = 0
        self.wikilinks = 0
        self.zitate = {}       # Normdatei-Pfad -> Anker -> set(Wegweiser-Stem)
        self.marken = 0

    def normanker(self, pfad):
        if pfad not in self.anker:
            ids, titel = set(), {}
            zl = lies(pfad).splitlines()
            for i, z in enumerate(zl):
                mm = ANKER.match(z)
                if mm:
                    ids.add(mm.group(1))
                    if i + 1 < len(zl):
                        titel[mm.group(1)] = re.sub(r"^#+\s*", "", zl[i + 1]).strip()
            self.anker[pfad] = ids
            for a, t in titel.items():
                self.ueberschrift[(pfad, a)] = t
        return self.anker[pfad]

    def pruefe_datei(self, w, rel, stand_soll):
        pfad = os.path.join(self.wiki, rel)
        text = lies(pfad)
        basis = os.path.dirname(pfad)
        ist_teil = "/" in rel
        self.marken += len(re.findall("(?<!„)" + re.escape(MARKE), text, flags=re.I))
        if ist_teil:
            uebersicht = os.path.normpath(os.path.join(basis, "..", w["datei"]))
            hat_rueck = False
        for zeile_nr, z in enumerate(text.splitlines(), start=1):
            ort = "wiki/%s:%d" % (rel, zeile_nr)
            for mm in LINK.finditer(z):
                ziel = mm.group(1)
                if ziel.startswith(("http://", "https://", "mailto:")):
                    continue
                self.links += 1
                pfadteil, _, anker = ziel.partition("#")
                pfadteil = urllib.parse.unquote(pfadteil)
                ziel_abs = os.path.normpath(os.path.join(basis, pfadteil)) if pfadteil else pfad
                if not os.path.isfile(ziel_abs):
                    self.m.fehl("QU-LINK-TOT", ort, "Link-Ziel nicht vorhanden: " + ziel,
                                "Datei fehlt, umbenannt oder Pfad falsch", "Link korrigieren oder Datei wiederherstellen")
                    continue
                if ist_teil and ziel_abs == uebersicht:
                    hat_rueck = True
                ordner_name = os.path.basename(os.path.dirname(ziel_abs))
                nd = NORMDATEI.match(os.path.basename(ziel_abs))
                ro = REC_ORDNER.match(ordner_name)
                if nd and ro:
                    self.normlinks += 1
                    if not anker:
                        self.m.fehl("QU-LINK-OHNE-ANKER", ort, "Normlink ohne Anker: " + ziel,
                                    "Link verweist auf die ganze Normdatei", "Anker #p… oder #art… ergänzen")
                        continue
                    if anker not in self.normanker(ziel_abs):
                        self.m.fehl("QU-ANKER-TOT", ort, "Anker nicht in der Normdatei: " + ziel,
                                    "Norm umnummeriert, aufgehoben oder Anker falsch gebildet",
                                    "Anker in der Lesefassung nachsehen (tools/README.md, Abschnitt Anker)")
                        continue
                    if stand_soll and ro.group(2) != stand_soll:
                        self.m.hin("QU-STAND-ABWEICHUNG", ort, "Normlink auf Stand %s, Kopfzeile nennt %s" % (ro.group(2), stand_soll),
                                   "Wegweiser zitiert einen anderen Paket-Stand als seine Kopfzeile",
                                   "normen_stand im Kopf oder den Link angleichen")
                    self.zitate.setdefault(ziel_abs, {}).setdefault(anker, set()).add(w["stem"])
                elif anker:
                    if ziel_abs not in self.koepfe:
                        self.koepfe[ziel_abs] = ueberschriften_anker(lies(ziel_abs))
                    if urllib.parse.unquote(anker) not in self.koepfe[ziel_abs]:
                        self.m.hin("QU-ANKER-UNBEKANNT", ort, "Überschriften-Anker nicht gefunden: " + ziel,
                                   "Überschrift geändert oder Anker-Schreibweise des Renderers anders", "Anker prüfen")
            for mm in WIKILINK.finditer(z):
                self.wikilinks += 1
                name = mm.group(1).strip()
                if not any(os.path.isfile(os.path.join(w, name + ".md")) for w in [self.wiki] + self.basis):
                    self.m.fehl("QU-WIKILINK-TOT", ort, "Wikilink ohne Ziel: [[%s]]" % name,
                                "Knoten fehlt oder umbenannt", "Wikilink korrigieren")
        if ist_teil and not hat_rueck:
            self.m.fehl("QU-RUECKLINK-FEHLT", "wiki/" + rel, "Teilaufsatz ohne Rücklink auf die Übersicht",
                        "Navigationszeile fehlt (Wiki.md §5.4)", "Link „↑ Übersicht“ auf ../%s ergänzen" % w["datei"])
        return text

    def pruefe_wegweiser(self, w):
        text = lies(os.path.join(self.wiki, w["datei"]))
        felder, rumpf = frontmatter(text)
        ort = "wiki/" + w["datei"]
        if felder.get("type") != "guide":
            self.m.hin("QU-KOPF-TYP", ort, "Frontmatter ohne „type: guide“", "Kopfblock fehlt oder anderer Typ",
                       "Frontmatter nach Katalog-Wegweiser setzen")
        for feld in ("normen_rec", "normen_stand"):
            if not felder.get(feld):
                self.m.hin("QU-KOPF-FELD", ort, "Frontmatter ohne „%s“" % feld, "Feld fehlt",
                           "Feld nach Katalog-Wegweiser ergänzen")
        if "**Stand der Normtexte" not in rumpf and "**Stand der verwendeten Normtexte" not in rumpf:
            self.m.hin("QU-KOPF-STAND", ort, "Kopf ohne Zeile „Stand der Normtexte“", "Zeile fehlt",
                       "Zeile mit den Stand-Angaben und dem Normen-REC ergänzen")
        stand_soll = felder.get("normen_stand")
        self.pruefe_datei(w, w["datei"], stand_soll)
        for t in w["teil"]:
            self.pruefe_datei(w, t, stand_soll)
            if ("](" + urllib.parse.quote(t, safe="-._~/") + ")") not in text and ("](" + t + ")") not in text:
                self.m.fehl("QU-TEILAUFSATZ-UNGELISTET", ort, "Teilaufsatz nicht in der Übersicht verlinkt: " + t,
                            "Übersicht listet nicht alle Teilaufsätze (Wiki.md §5.4)", "Eintrag im Inhalt ergänzen")


# --------------------------------------------------------------------------
# Liste der zitierten Normen
# --------------------------------------------------------------------------

def sortschluessel(anker):
    mm = re.match(r"^(p|art)(\d+)([a-z]*)(?:-(.*))?$", anker)
    if mm:
        return (0, int(mm.group(2)), mm.group(3), mm.group(4) or "")
    mm = re.match(r"^anlage-(\d+)(.*)$", anker)
    if mm:
        return (1, int(mm.group(1)), mm.group(2), "")
    return (2, 0, anker, "")


def liste(pr, wegw):
    z = ["# Zitierte Normen der Wegweiser", "",
         "Mechanisch aus den Normlinks aller Wegweiser erzeugt (`tools/wegweiser-quellen.py --liste`, ohne Sprachmodell); "
         "je Gesetz die Normen in Paragraphenfolge (Anlagen am Ende) mit der Überschrift laut Lesefassung und den "
         "zitierenden Wegweisern. Grundlage für die Prüfung der Wegweiser durch ein anderes Modell oder einen Menschen: "
         "jeder Link muss auf die genannte Norm führen, jede Aussage im Wegweiser muss sich aus dem verlinkten Text ergeben.", ""]
    verschieden = sum(len(a) for a in pr.zitate.values())
    z.append("Umfang: %d Wegweiser, %d verschiedene Normen in %d Gesetzen, %d Normverweise, %d Kennzeichnungen „%s“."
             % (len(wegw), verschieden, len(pr.zitate), pr.normlinks, pr.marken, MARKE))
    z.append("")
    for pfad in sorted(pr.zitate, key=lambda p: os.path.basename(p)):
        rel = os.path.relpath(pfad, pr.wurzel).replace(os.sep, "/")
        z.append("## `%s`" % os.path.basename(pfad))
        z.append("")
        z.append("| Norm (Überschrift laut Lesefassung) | zitiert in Wegweiser |")
        z.append("|---|---|")
        for a in sorted(pr.zitate[pfad], key=sortschluessel):
            titel = pr.ueberschrift.get((pfad, a), "?")
            z.append("| [%s](%s#%s) | %s |" % (titel, urllib.parse.quote(rel, safe="-._~/"), a,
                                              ", ".join(sorted(pr.zitate[pfad][a]))))
        z.append("")
    return "\n".join(z)


def umfang(pr, wegw, wiki):
    z = ["| Wegweiser | Teilaufsätze | Zeilen | Normverweise |", "|---|---|---|---|"]
    for w in wegw:
        zeilen = sum(len(lies(os.path.join(wiki, d)).splitlines()) for d in [w["datei"]] + w["teil"])
        verweise = sum(len([1 for a in pr.zitate.get(p, {}) if w["stem"] in pr.zitate[p][a]]) for p in pr.zitate)
        z.append("| %s | %d | %d | %d (verschiedene) |" % (w["stem"], len(w["teil"]), zeilen, verweise))
    return "\n".join(z)


def main(argv=None):
    hier = os.path.dirname(os.path.abspath(__file__))
    p = argparse.ArgumentParser(
        prog="wegweiser-quellen.py",
        description="Prüft die Links der Wegweiser und Fristenkataloge (wiki/Wegweiser-*.md, wiki/Fristenkatalog-*.md und Teilaufsätze) auf die Anker der "
                    "Normen-Lesefassungen im Rechercheartefakt des Normen-Pakets sowie den Aufbau nach Wiki.md §5.4; "
                    "erzeugt auf Wunsch die Liste der zitierten Normen. Schreibt nichts in wiki/.",
        epilog="Exit-Codes: 0 fertig; 1 mindestens ein FEHLER (toter Link oder Anker, fehlender Rücklink, doppelter "
               "Dateiname); 2 Aufruf-Fehler. Ausgabe je Befund auf stderr: FEHLER|HINWEIS  CODE  ort: was — "
               "Ursache: … — Abhilfe: …  Einzelheiten: tools/README.md.")
    p.add_argument("--wurzel", default=os.path.dirname(hier),
                   help="Projekt-Wurzel mit wiki/ und research/; Vorgabe: Elternordner von tools/")
    p.add_argument("--pruefen", action="store_true", help="Links, Anker und Aufbau prüfen (Vorgabe, wenn keine Option)")
    p.add_argument("--basis", action="append", default=[], metavar="ORDNER",
                   help="weiterer wiki/-Ordner, in dem Wikilink-Ziele liegen dürfen (etwa die Basis, solange der "
                        "Prozess-Ordner noch nicht in ein Projekt gemergt ist); mehrfach möglich")
    p.add_argument("--liste", nargs="?", const="-", metavar="DATEI",
                   help="Liste der zitierten Normen als Markdown nach DATEI schreiben (ohne DATEI: Standardausgabe)")
    p.add_argument("--umfang", action="store_true", help="Tabelle je Wegweiser (Teilaufsätze, Zeilen, Normverweise) ausgeben")
    p.add_argument("--version", action="version", version="%(prog)s " + VERSION)
    args = p.parse_args(argv)

    wurzel = os.path.abspath(args.wurzel)
    wiki = os.path.join(wurzel, "wiki")
    if not os.path.isdir(wiki):
        aufruf_fehler("Ordner wiki/ fehlt unter --wurzel", "--wurzel auf die Projekt-Wurzel zeigen lassen")
    m = Meldungen()
    wegw = sammle_wegweiser(wiki, m)
    if not wegw:
        aufruf_fehler("keine Wegweiser oder Fristenkataloge (wiki/Wegweiser-*.md, wiki/Fristenkatalog-*.md) gefunden", "Wurzel prüfen")
    pruefe_dateinamen(wiki, m)
    for b in args.basis:
        if not os.path.isdir(b):
            aufruf_fehler("--basis %s ist kein Ordner" % b, "Pfad zu einem wiki/-Ordner angeben")
    pr = Pruefer(wurzel, m, args.basis)
    for w in wegw:
        pr.pruefe_wegweiser(w)
    if args.liste:
        text = liste(pr, wegw)
        if args.liste == "-":
            sys.stdout.write(text)
        else:
            with open(args.liste, "w", encoding="utf-8", newline="\n") as f:
                f.write(text)
            print("Liste geschrieben: " + args.liste)
    if args.umfang:
        print(umfang(pr, wegw, wiki))
    verschieden = sum(len(a) for a in pr.zitate.values())
    print("%s: %d Wegweiser, %d Teilaufsätze; %d Links geprüft (davon %d Normlinks, %d Wikilinks); "
          "%d verschiedene Normen in %d Gesetzen; %d Kennzeichnungen „%s“; %d FEHLER, %d HINWEISE"
          % (WERKZEUG, len(wegw), sum(len(w["teil"]) for w in wegw), pr.links + pr.wikilinks, pr.normlinks,
             pr.wikilinks, verschieden, len(pr.zitate), pr.marken, MARKE, m.fehler, m.hinweise))
    return EXIT_FEHLER if m.fehler else EXIT_OK


if __name__ == "__main__":
    sys.exit(main())
