#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""frist-rechnen — Fristende und Wochentag maschinell bestimmen.

Das Modell rechnet nie selbst mit Daten: Datum und Wochentag kommen aus
diesem Skript (Vorgehen SP-2, Katalog Fristen, Wegweiser „Zustellung,
Bekanntgabe und Fristen“ Abschnitt 5). Welche Regel gilt — Auslöser,
Fristlänge, Ordnung, Ausnahme — liest der Agent aus dem Wegweiser und dem
Fristenkatalog; das Skript rechnet nur.

  python3 tools/frist-rechnen.py 2026-11-12 "1 Monat"
  python3 tools/frist-rechnen.py 2026-11-12 "2 Wochen" --feiertage tools/feiertage-by.txt
  python3 tools/frist-rechnen.py 2026-12-25            Wochentag, Feiertag, nächster Werktag
  python3 tools/frist-rechnen.py --heute               heutiges Datum mit Wochentag
  python3 tools/frist-rechnen.py --selbsttest

Rechenregeln (Wegweiser Zustellung und Fristen, Abschnitt 5, Schritte 3–5;
§§ 187, 188, 193 BGB, auf die VwVfG, SGB X, AO, ZPO und SGG verweisen):
  - Der Tag des Ereignisses (Bekanntgabe, Zustellung) zählt nicht mit; die
    Frist beginnt am Folgetag (Voreinstellung). Zählt der Tag nach der
    Fristregel mit (Beginn eines Tages), Option --tag-zaehlt-mit.
  - Tages- und Wochenfristen enden mit dem letzten Tag; Monats- und
    Jahresfristen mit dem Tag, der nach seiner Zahl dem Ereignistag
    entspricht; fehlt der Tag im letzten Monat, mit dem Monatsende.
  - Zählt der Anfangstag mit (--tag-zaehlt-mit), enden Monats- und
    Jahresfristen am Anfangstag + n Monate − 1 Tag (§ 188 Abs. 2 2. Fall);
    fehlt der entsprechende Tag, mit dem Monatsende (§ 188 Abs. 3):
    1.3. + 1 Monat = 31.3., 31.1. + 1 Monat = 28. bzw. 29.2.
  - Fällt das Ende auf Samstag, Sonntag oder einen gesetzlichen Feiertag,
    endet die Frist mit dem nächsten Werktag. Ohne Verschiebung (etwa bei
    behördlichen Terminen oder wenn die Behörde einen bestimmten Tag als
    Ende mitgeteilt hat): Option --ohne-verschiebung.
  - Bekanntgabe- und Zugangsfiktionen (vierter Tag nach Aufgabe zur Post)
    sind keine Fristen: ihr Normtext (§ 122 Abs. 2 AO, § 122a Abs. 4 AO,
    § 41 Abs. 2 VwVfG, § 37 Abs. 2 SGB X, § 4 Abs. 2 VwZG) enthält keine
    Verschiebung. Den Fiktionstag mit
    --ohne-verschiebung rechnen und das Fristende getrennt ab dem
    Fiktionstag. Ob für die AO eine Verschiebung des Fiktionstags nach
    § 108 Abs. 3 AO vertreten wird, ist im Normen-Paket nicht belegt; vor
    einer solchen Annahme die Primärquelle prüfen und die Annahme an der
    Frist vermerken. Verschiebt das Skript ein Ende, weist die Ausgabe
    darauf hin.
  - Halbes Jahr = 6 Monate, Vierteljahr = 3 Monate, halber Monat = 15 Tage;
    eine verlängerte Frist läuft ab dem Ende der vorigen (das alte Ende als
    Ereignisdatum angeben). Stundenfristen rechnet das Skript nicht.

Feiertage: eingebaut sind nur die bundeseinheitlichen (Neujahr, Karfreitag,
Ostermontag, 1. Mai, Christi Himmelfahrt, Pfingstmontag, 3. Oktober,
1. und 2. Weihnachtstag; Osterdatum berechnet). Landesfeiertage sind nicht
eingebaut: der Agent legt sie je Projekt als Datei an (Quelle: das
Feiertagsgesetz des Landes, in dem der Erklärungs- oder Leistungsort liegt;
siehe Wegweiser Abschnitt 5) und übergibt sie mit --feiertage DATEI. Zeilenform:
  JJJJ-MM-TT  Name des Feiertags        Leerzeilen und Zeilen mit # werden überlesen

Nur Standardbibliothek, Python 3 ab 3.8. Einzelheiten: tools/README.md.
"""

import argparse
import datetime as dt
import os
import re
import sys
import tempfile

WERKZEUG = "frist-rechnen"
VERSION = "1.0"
EXIT_OK, EXIT_FEHLER, EXIT_AUFRUF = 0, 1, 2

WOCHENTAGE = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"]
DATUM = re.compile(r"^\d{4}-\d{2}-\d{2}$")
FRIST = re.compile(r"^\s*(\d+)\s*([A-Za-zÄÖÜäöü.]+)\s*$")
EINHEITEN = {
    "t": "Tage", "tag": "Tage", "tage": "Tage", "tg": "Tage",
    "w": "Wochen", "wo": "Wochen", "woche": "Wochen", "wochen": "Wochen",
    "m": "Monate", "mon": "Monate", "monat": "Monate", "monate": "Monate",
    "j": "Jahre", "jahr": "Jahre", "jahre": "Jahre",
}


# --------------------------------------------------------------------------
# Meldungen
# --------------------------------------------------------------------------

def aufruf_fehler(text, tun=None):
    meldung = WERKZEUG + ": " + text
    if tun:
        meldung += " — Abhilfe: " + tun
    print(meldung, file=sys.stderr)
    sys.exit(EXIT_AUFRUF)


def mit_wochentag(d):
    return "%s, %s" % (WOCHENTAGE[d.weekday()], d.isoformat())


def lies_datum(text, was="Datum"):
    if not DATUM.match(text or ""):
        aufruf_fehler("%s „%s“ hat nicht die Form JJJJ-MM-TT" % (was, text), "etwa 2026-11-12 angeben")
    try:
        return dt.date.fromisoformat(text)
    except ValueError:
        aufruf_fehler("%s „%s“ ist kein gültiger Kalendertag" % (was, text), "Monat und Tag prüfen")


# --------------------------------------------------------------------------
# Feiertage
# --------------------------------------------------------------------------

def ostersonntag(jahr):
    """Gregorianisches Osterdatum (Formel nach Butcher/Meeus)."""
    a = jahr % 19
    b, c = divmod(jahr, 100)
    d, e = divmod(b, 4)
    f = (b + 8) // 25
    g = (b - f + 1) // 3
    h = (19 * a + b - d - g + 15) % 30
    i, k = divmod(c, 4)
    l = (32 + 2 * e + 2 * i - h - k) % 7
    m = (a + 11 * h + 22 * l) // 451
    monat, tag = divmod(h + l - 7 * m + 114, 31)
    return dt.date(jahr, monat, tag + 1)


def bundesfeiertage(jahr):
    """Bundeseinheitliche gesetzliche Feiertage eines Jahres: {Datum: Name}."""
    o = ostersonntag(jahr)
    return {
        dt.date(jahr, 1, 1): "Neujahr",
        o - dt.timedelta(days=2): "Karfreitag",
        o + dt.timedelta(days=1): "Ostermontag",
        dt.date(jahr, 5, 1): "Tag der Arbeit",
        o + dt.timedelta(days=39): "Christi Himmelfahrt",
        o + dt.timedelta(days=50): "Pfingstmontag",
        dt.date(jahr, 10, 3): "Tag der Deutschen Einheit",
        dt.date(jahr, 12, 25): "1. Weihnachtstag",
        dt.date(jahr, 12, 26): "2. Weihnachtstag",
    }


def lies_feiertage(pfad):
    """Landesfeiertage aus einer Datei: je Zeile „JJJJ-MM-TT  Name“."""
    feiertage = {}
    try:
        with open(pfad, encoding="utf-8") as f:
            zeilen = f.read().splitlines()
    except OSError as ex:
        aufruf_fehler("Feiertagsdatei %s nicht lesbar (%s)" % (pfad, ex), "Pfad prüfen")
    for nr, zeile in enumerate(zeilen, 1):
        z = zeile.strip()
        if not z or z.startswith("#"):
            continue
        teile = z.split(None, 1)
        if not DATUM.match(teile[0]):
            aufruf_fehler("%s Zeile %d: „%s“ beginnt nicht mit einem Datum JJJJ-MM-TT" % (pfad, nr, z),
                          "Zeilenform „JJJJ-MM-TT  Name“, Kommentare mit #")
        try:
            tag = dt.date.fromisoformat(teile[0])
        except ValueError:
            aufruf_fehler("%s Zeile %d: „%s“ ist kein gültiger Kalendertag" % (pfad, nr, teile[0]), "Datum prüfen")
        feiertage[tag] = teile[1].strip() if len(teile) > 1 else "Feiertag (ohne Namen, %s)" % os.path.basename(pfad)
    return feiertage


class Kalender:
    def __init__(self, landesfeiertage=None):
        self.landes = dict(landesfeiertage or {})

    def feiertag(self, d):
        """Name des Feiertags oder None."""
        if d in self.landes:
            return self.landes[d]
        return bundesfeiertage(d.year).get(d)

    def grund(self, d):
        """Warum d kein Werktag ist — oder None."""
        name = self.feiertag(d)
        if name:
            return "Feiertag: " + name
        if d.weekday() == 5:
            return "Samstag"
        if d.weekday() == 6:
            return "Sonntag"
        return None

    def naechster_werktag(self, d):
        """[(Datum, Grund), …] der übersprungenen Tage und der erste Werktag ab d."""
        uebersprungen = []
        while True:
            g = self.grund(d)
            if not g:
                return uebersprungen, d
            uebersprungen.append((d, g))
            d += dt.timedelta(days=1)


# --------------------------------------------------------------------------
# Fristrechnung
# --------------------------------------------------------------------------

def lies_frist(text):
    """„1 Monat“, „2 Wochen“, „14 Tage“, „1 Jahr“ → (Zahl, Einheit)."""
    m = FRIST.match(text or "")
    einheit = EINHEITEN.get(m.group(2).lower().rstrip(".")) if m else None
    if not m or not einheit or int(m.group(1)) < 1:
        aufruf_fehler("Fristangabe „%s“ nicht verstanden" % text,
                      "Zahl und Einheit angeben: Tage, Wochen, Monate oder Jahre, etwa \"1 Monat\" oder \"2 Wochen\"")
    return int(m.group(1)), einheit


def monate_weiter(d, n):
    """Tag d um n Monate weiter; fehlt der Tag im Zielmonat, dessen letzter Tag (§ 188 Abs. 3 BGB)."""
    jahr, monat = divmod(d.month - 1 + n, 12)
    jahr, monat = d.year + jahr, monat + 1
    letzter = (dt.date(jahr + (monat == 12), monat % 12 + 1, 1) - dt.timedelta(days=1)).day
    return dt.date(jahr, monat, min(d.day, letzter))


def rechnerisches_ende(ereignis, zahl, einheit, tag_zaehlt_mit=False):
    """Fristende ohne Wochenend- und Feiertagsverschiebung.

    Ereignisfrist (Voreinstellung): der Ereignistag zählt nicht mit (§ 187 Abs. 1);
    Ende nach § 188 Abs. 1–3. Beginnfrist (--tag-zaehlt-mit, § 187 Abs. 2):
    Tages- und Wochenfristen enden mit dem Tag vor dem entsprechenden Tag
    (§ 188 Abs. 1, Abs. 2 2. Fall). Monats- und Jahresfristen: Anfangstag
    + n Monate − 1 Tag (§ 188 Abs. 2 2. Fall); fehlt im letzten Monat der
    Tag, der dem Anfangstag entspricht, endet die Frist mit dem Monatsende
    (§ 188 Abs. 3). Nicht: Vortag + n Monate — das trifft beim Anfangstag
    „1.“ das Monatsende nicht (1.3. + 1 Monat wäre sonst 28.3.)."""
    if einheit in ("Tage", "Wochen"):
        basis = ereignis - dt.timedelta(days=1) if tag_zaehlt_mit else ereignis
        tage = zahl if einheit == "Tage" else 7 * zahl
        return basis + dt.timedelta(days=tage)
    monate = zahl if einheit == "Monate" else 12 * zahl
    if not tag_zaehlt_mit:
        return monate_weiter(ereignis, monate)
    entsprechend = monate_weiter(ereignis, monate)
    if entsprechend.day < ereignis.day:
        return entsprechend          # Tag fehlt im letzten Monat: Monatsende (§ 188 Abs. 3)
    return entsprechend - dt.timedelta(days=1)


def frist(ereignis, zahl, einheit, kalender, tag_zaehlt_mit=False, verschieben=True):
    """Ergebnis als Wörterbuch: beginn, rechnerisch, ende, uebersprungen."""
    beginn = ereignis if tag_zaehlt_mit else ereignis + dt.timedelta(days=1)
    rechnerisch = rechnerisches_ende(ereignis, zahl, einheit, tag_zaehlt_mit)
    uebersprungen, ende = kalender.naechster_werktag(rechnerisch) if verschieben else ([], rechnerisch)
    return {"beginn": beginn, "rechnerisch": rechnerisch, "ende": ende, "uebersprungen": uebersprungen}


# --------------------------------------------------------------------------
# Ausgabe
# --------------------------------------------------------------------------

def zeige_tag(d, kalender, kurz=False):
    g = kalender.grund(d)
    if kurz:
        print("%s %s%s" % (d.isoformat(), WOCHENTAGE[d.weekday()], (" (" + g + ")") if g else ""))
        return
    print("Datum:            %s%s" % (mit_wochentag(d), (" — " + g) if g else " — Werktag"))
    if g:
        uebersprungen, werktag = kalender.naechster_werktag(d)
        print("Nächster Werktag: %s" % mit_wochentag(werktag))


def zeige_frist(ereignis, zahl, einheit, erg, kalender, args):
    if args.kurz:
        print("%s %s" % (erg["ende"].isoformat(), WOCHENTAGE[erg["ende"].weekday()]))
        return
    regel = "Beginn am Ereignistag (Tag zählt mit)" if args.tag_zaehlt_mit else "Ereignistag zählt nicht mit, Beginn am Folgetag"
    print("Ereignis/Zugang:    %s" % mit_wochentag(ereignis))
    einzahl = {"Tage": "Tag", "Wochen": "Woche", "Monate": "Monat", "Jahre": "Jahr"}
    print("Frist:              %d %s — %s" % (zahl, einheit if zahl != 1 else einzahl[einheit], regel))
    print("Fristbeginn:        %s" % mit_wochentag(erg["beginn"]))
    print("Rechnerisches Ende: %s" % mit_wochentag(erg["rechnerisch"]))
    if not args.verschieben:
        print("Fristende:          %s — ohne Verschiebung (--ohne-verschiebung)" % mit_wochentag(erg["ende"]))
    elif erg["uebersprungen"]:
        for d, g in erg["uebersprungen"]:
            print("  übersprungen:     %s — %s" % (mit_wochentag(d), g))
        print("Fristende:          %s — verschoben auf den nächsten Werktag" % mit_wochentag(erg["ende"]))
        # Hinweis nur bei kurzen Tagesfristen (bis 4 Tage): nur dort kann das
        # Ergebnis der Tag einer Bekanntgabe- oder Zugangsfiktion sein
        if einheit == "Tage" and zahl <= 4:
            print("Achtung Fiktion:    Ist das Ergebnis ein Bekanntgabe- oder Zugangstag nach einer Fiktion (etwa vierter Tag "
                  "nach Aufgabe zur Post), gilt die Verschiebung nicht ohne Weiteres: der Normtext der Fiktion (§ 122 Abs. 2 AO, "
                  "§ 122a Abs. 4 AO, § 41 Abs. 2 VwVfG, § 37 Abs. 2 SGB X, § 4 Abs. 2 VwZG) sieht keine vor. Fiktionstag mit "
                  "--ohne-verschiebung rechnen, das Fristende getrennt ab dem Fiktionstag; eine abweichende Annahme an der "
                  "Frist vermerken.")
    else:
        print("Fristende:          %s — keine Verschiebung (Werktag)" % mit_wochentag(erg["ende"]))
    if args.feiertage:
        print("Landesfeiertage:    %s (%d Einträge)" % (", ".join(args.feiertage), len(kalender.landes)))
    else:
        print("Landesfeiertage:    keine Datei geladen — nur bundeseinheitliche Feiertage berücksichtigt "
              "(--feiertage DATEI, siehe tools/README.md)")
    print("Hinweis:            Regel, Norm und auslösendes Dokument stehen an der Frist; maßgeblich ist der Normtext.")


# --------------------------------------------------------------------------
# Selbsttest
# --------------------------------------------------------------------------

def selbsttest():
    fehler = []

    def pruefe(name, ist, soll):
        if ist != soll:
            fehler.append("%s: ist %s, soll %s" % (name, ist, soll))

    for jahr, soll in [(2000, "2000-04-23"), (2024, "2024-03-31"), (2025, "2025-04-20"),
                       (2026, "2026-04-05"), (2027, "2027-03-28"), (2038, "2038-04-25")]:
        pruefe("Ostersonntag %d" % jahr, ostersonntag(jahr).isoformat(), soll)
    k = Kalender()
    f = bundesfeiertage(2026)
    pruefe("Feiertage 2026 Anzahl", len(f), 9)
    pruefe("Karfreitag 2026", f.get(dt.date(2026, 4, 3)), "Karfreitag")
    pruefe("Himmelfahrt 2026", f.get(dt.date(2026, 5, 14)), "Christi Himmelfahrt")
    pruefe("Pfingstmontag 2026", f.get(dt.date(2026, 5, 25)), "Pfingstmontag")

    def ende(ereignis, text, **kw):
        z, e = lies_frist(text)
        return frist(dt.date.fromisoformat(ereignis), z, e, kw.pop("kalender", k), **kw)

    # Wochenfrist ohne Verschiebung: Montag → Montag
    pruefe("2 Wochen ab Mo 2026-11-02", ende("2026-11-02", "2 Wochen")["ende"].isoformat(), "2026-11-16")
    # Wochenende: Fr + 1 Tag = Sa → Mo
    e = ende("2026-11-13", "1 Tag")
    pruefe("1 Tag ab Fr rechnerisch", e["rechnerisch"].isoformat(), "2026-11-14")
    pruefe("1 Tag ab Fr verschoben", e["ende"].isoformat(), "2026-11-16")
    pruefe("1 Tag ab Fr Gründe", [g for _, g in e["uebersprungen"]], ["Samstag", "Sonntag"])
    # Feiertagskette: 24.12. + 1 Tag = 25.12. (Fr) → 26.12. (Sa, Feiertag) → So → Mo 28.12.
    e = ende("2026-12-24", "1 Tag")
    pruefe("Weihnachten 2026", e["ende"].isoformat(), "2026-12-28")
    pruefe("Weihnachten 2026 Gründe", [g for _, g in e["uebersprungen"]],
           ["Feiertag: 1. Weihnachtstag", "Feiertag: 2. Weihnachtstag", "Sonntag"])
    # Monatsfrist: 12.11. → 12.12. (Sa) → Mo 14.12.
    e = ende("2026-11-12", "1 Monat")
    pruefe("1 Monat ab 2026-11-12 rechnerisch", e["rechnerisch"].isoformat(), "2026-12-12")
    pruefe("1 Monat ab 2026-11-12 Ende", e["ende"].isoformat(), "2026-12-14")
    # Monatsende (§ 188 Abs. 3): 31.1. + 1 Monat = 28.2. (Sa) → Mo 2.3.
    e = ende("2026-01-31", "1 Monat")
    pruefe("Monatsende rechnerisch", e["rechnerisch"].isoformat(), "2026-02-28")
    pruefe("Monatsende verschoben", e["ende"].isoformat(), "2026-03-02")
    pruefe("Monatsende Schaltjahr", ende("2024-01-31", "1 Monat")["rechnerisch"].isoformat(), "2024-02-29")
    pruefe("Monatsende 31.3.", ende("2026-03-31", "1 Monat")["rechnerisch"].isoformat(), "2026-04-30")
    pruefe("3 Monate ab 30.11.", ende("2026-11-30", "3 Monate")["rechnerisch"].isoformat(), "2027-02-28")
    # Jahresfrist: 28.2.2026 + 1 Jahr = 28.2.2027 (So) → Mo 1.3.2027; Schalttag
    e = ende("2026-02-28", "1 Jahr")
    pruefe("1 Jahr rechnerisch", e["rechnerisch"].isoformat(), "2027-02-28")
    pruefe("1 Jahr verschoben", e["ende"].isoformat(), "2027-03-01")
    pruefe("1 Jahr ab Schalttag", ende("2024-02-29", "1 Jahr")["rechnerisch"].isoformat(), "2025-02-28")
    # Ohne Verschiebung
    pruefe("ohne Verschiebung", ende("2026-11-13", "1 Tag", verschieben=False)["ende"].isoformat(), "2026-11-14")
    # Tag zählt mit (§ 187 Abs. 2): 1.1. + 1 Monat → 31.1.; 31.3. + 1 Monat → 30.4.; 1.3. + 3 Tage → 3.3.
    pruefe("Beginnfrist 1.1. + 1 Monat", ende("2026-01-01", "1 Monat", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-01-31")
    pruefe("Beginnfrist 31.3. + 1 Monat", ende("2026-03-31", "1 Monat", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-04-30")
    # R3: Anfangstag + n Monate − 1 Tag (§ 188 Abs. 2 2. Fall), Monatsende nach § 188 Abs. 3
    pruefe("Beginnfrist 1.3. + 1 Monat", ende("2026-03-01", "1 Monat", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-03-31")
    pruefe("Beginnfrist 1.12. + 1 Monat", ende("2026-12-01", "1 Monat", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-12-31")
    pruefe("Beginnfrist 1.7. + 6 Monate", ende("2026-07-01", "6 Monate", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-12-31")
    pruefe("Beginnfrist 31.1. + 1 Monat", ende("2026-01-31", "1 Monat", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-02-28")
    pruefe("Beginnfrist 31.1. + 1 Monat Schaltjahr", ende("2024-01-31", "1 Monat", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2024-02-29")
    pruefe("Beginnfrist 15.3. + 1 Monat", ende("2026-03-15", "1 Monat", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-04-14")
    pruefe("Beginnfrist 1.3. + 1 Jahr", ende("2026-03-01", "1 Jahr", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2027-02-28")
    pruefe("Beginnfrist 1.3. + 1 Woche", ende("2026-03-01", "1 Woche", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-03-07")
    # G-21: Fiktionstag ohne Verschiebung; mit Verschiebung nur auf ausdrücklichen Aufruf
    pruefe("Fiktion 11.11. + 4 Tage ohne Verschiebung", ende("2026-11-11", "4 Tage", verschieben=False)["ende"].isoformat(), "2026-11-15")
    pruefe("Beginnfrist 1.3. + 3 Tage", ende("2026-03-01", "3 Tage", tag_zaehlt_mit=True)["rechnerisch"].isoformat(), "2026-03-03")
    pruefe("Beginnfrist Beginn", ende("2026-03-01", "3 Tage", tag_zaehlt_mit=True)["beginn"].isoformat(), "2026-03-01")
    # Landesfeiertage aus Datei: 2026-11-18 als Feiertag → 17.11. + 1 Tag → 19.11.
    with tempfile.TemporaryDirectory() as tmp:
        pfad = os.path.join(tmp, "feiertage.txt")
        with open(pfad, "w", encoding="utf-8") as fh:
            fh.write("# Testdatei\n\n2026-11-18  Buß- und Bettag\n2026-08-15 Mariä Himmelfahrt\n")
        landes = lies_feiertage(pfad)
        pruefe("Feiertagsdatei Einträge", len(landes), 2)
        kl = Kalender(landes)
        pruefe("Landesfeiertag Name", kl.feiertag(dt.date(2026, 11, 18)), "Buß- und Bettag")
        e = ende("2026-11-17", "1 Tag", kalender=kl)
        pruefe("Landesfeiertag Verschiebung", e["ende"].isoformat(), "2026-11-19")
        pruefe("Landesfeiertag ohne Datei", ende("2026-11-17", "1 Tag")["ende"].isoformat(), "2026-11-18")
    # Fristangaben
    pruefe("Frist „14 Tage“", lies_frist("14 Tage"), (14, "Tage"))
    pruefe("Frist „2w“", lies_frist("2w"), (2, "Wochen"))
    pruefe("Frist „1 Monat“", lies_frist("1 Monat"), (1, "Monate"))
    pruefe("Frist „6 Monate“", lies_frist("6 Monate"), (6, "Monate"))
    pruefe("Frist „1 Jahr“", lies_frist("1 Jahr"), (1, "Jahre"))

    if fehler:
        print("%s --selbsttest: %d Fehler" % (WERKZEUG, len(fehler)), file=sys.stderr)
        for f_ in fehler:
            print("  FEHLER  " + f_, file=sys.stderr)
        return EXIT_FEHLER
    print("%s %s --selbsttest: alle Prüfungen bestanden (Osterformel, Feiertage, Wochenende, Feiertagskette, "
          "Monatsende, Jahresfrist, Beginnfrist, Landesfeiertage aus Datei, Fristangaben)" % (WERKZEUG, VERSION))
    return EXIT_OK


# --------------------------------------------------------------------------
# Hauptprogramm
# --------------------------------------------------------------------------

def main(argv=None):
    p = argparse.ArgumentParser(
        prog="frist-rechnen.py",
        description="Rechnet aus Ereignis- bzw. Zugangsdatum und Fristangabe das Fristende mit Wochentag; "
                    "verschiebt bei Samstag, Sonntag und gesetzlichem Feiertag auf den nächsten Werktag. "
                    "Eingebaut sind nur die bundeseinheitlichen Feiertage; Landesfeiertage kommen aus einer Datei "
                    "(--feiertage), die der Agent je Projekt anlegt. Regeln: Wegweiser „Zustellung, Bekanntgabe und "
                    "Fristen“ Abschnitt 5 (§§ 187, 188, 193 BGB und die entsprechenden Verweise der Ordnungen).",
        epilog="Beispiele: frist-rechnen.py 2026-11-12 \"1 Monat\" · frist-rechnen.py 2026-11-12 \"2 Wochen\" "
               "--feiertage tools/feiertage-by.txt · frist-rechnen.py 2026-12-25 · frist-rechnen.py --heute. "
               "Fiktionstag (vierter Tag nach Aufgabe zur Post): frist-rechnen.py 2026-11-11 \"4 Tage\" "
               "--ohne-verschiebung, dann das Fristende getrennt ab dem Fiktionstag. "
               "Exit-Codes: 0 Ergebnis ausgegeben; 1 Selbsttest fehlgeschlagen; 2 Aufruf-Fehler. "
               "Einzelheiten: tools/README.md.")
    p.add_argument("datum", nargs="?", metavar="JJJJ-MM-TT",
                   help="Ereignis- bzw. Zugangsdatum (Bekanntgabe, Zustellung, Verkündung); ohne FRIST: nur Wochentag und Werktag-Prüfung")
    p.add_argument("frist", nargs="?", metavar="FRIST",
                   help="Fristangabe mit Zahl und Einheit: Tage, Wochen, Monate, Jahre — etwa \"1 Monat\", \"2 Wochen\", \"14 Tage\"")
    p.add_argument("--tag-zaehlt-mit", action="store_true",
                   help="der Ereignistag zählt mit (Beginn eines Tages, § 187 Abs. 2 BGB); Voreinstellung: zählt nicht mit, "
                        "Beginn am Folgetag (§ 187 Abs. 1) — nur setzen, wenn die Fristregel es sagt")
    p.add_argument("--ohne-verschiebung", dest="verschieben", action="store_false",
                   help="keine Verschiebung bei Samstag, Sonntag, Feiertag (behördliche Termine; Behörde hat einen bestimmten "
                        "Tag als Ende mitgeteilt; Fiktionstag einer Bekanntgabe- oder Zugangsfiktion, deren Normtext keine "
                        "Verschiebung kennt — das Fristende dann getrennt ab dem Fiktionstag rechnen) — nur setzen, wenn die "
                        "Fristregel es sagt")
    p.add_argument("--feiertage", metavar="DATEI", action="append", default=[],
                   help="Datei mit Landesfeiertagen, je Zeile „JJJJ-MM-TT  Name“ (# Kommentar); mehrfach erlaubt")
    p.add_argument("--kurz", action="store_true", help="nur „JJJJ-MM-TT Wochentag“ ausgeben")
    p.add_argument("--heute", action="store_true", help="heutiges Datum mit Wochentag ausgeben")
    p.add_argument("--selbsttest", action="store_true", help="eingebaute Prüfungen laufen lassen")
    p.add_argument("--version", action="version", version="%(prog)s " + VERSION)
    args = p.parse_args(argv)

    if args.selbsttest:
        return selbsttest()
    landes = {}
    for pfad in args.feiertage:
        landes.update(lies_feiertage(pfad))
    kalender = Kalender(landes)
    if args.heute:
        heute = dt.date.today()
        if args.kurz:
            zeige_tag(heute, kalender, kurz=True)
        else:
            print("Heute:            %s" % mit_wochentag(heute))
            g = kalender.grund(heute)
            print("Werktag:          %s" % ("nein — " + g if g else "ja"))
        return EXIT_OK
    if not args.datum:
        aufruf_fehler("kein Datum angegeben", "Ereignisdatum JJJJ-MM-TT [FRIST] nennen oder --heute, --selbsttest, --help")
    ereignis = lies_datum(args.datum, "Ereignisdatum")
    if not args.frist:
        zeige_tag(ereignis, kalender, kurz=args.kurz)
        return EXIT_OK
    zahl, einheit = lies_frist(args.frist)
    erg = frist(ereignis, zahl, einheit, kalender, args.tag_zaehlt_mit, args.verschieben)
    zeige_frist(ereignis, zahl, einheit, erg, kalender, args)
    return EXIT_OK


if __name__ == "__main__":
    sys.exit(main())
