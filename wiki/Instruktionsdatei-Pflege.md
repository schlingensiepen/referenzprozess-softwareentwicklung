---
type: internal-rule
---

# Instruktionsdatei-Pflege

Rolle, Pflichtabschnitte und Synchronisation der
KI-Agent-Instruktionsdatei. Wortlaut aus
MasterPrompt §8.2–8.4 hierher verlagert; der
Grundsatz KI-Agnostik (§8.1) bleibt im MasterPrompt.
Moment: bei Anlage, Abgleich oder Synchronisation
der Instruktionsdatei (Init Phase A3/D, Resync).

## Rolle

Die Instruktionsdatei wird beim Sessionstart
**automatisch** geladen — im Gegensatz zum
MasterPrompt, der nur auf Anweisung gelesen wird.
Sie ist der verpflichtende Minimal-Kontext, den die
KI bereits vor der ersten User-Nachricht kennt.

## Pflichtabschnitte

Jede Instruktionsdatei enthält verbindlich:

1. **Projekt-Identifikation** — Projektname, Zweck,
   beteiligte Parteien in einem Satz.
2. **Eiserne Regeln** (knapp, ohne Begründung):
   - **Das `wiki/` ist die Quelle der Wahrheit:
     dort nachschlagen, bevor du behauptest oder
     fragst; dort ablegen, was geklärt wird
     (MasterPrompt §9).**
   - `raw/` und `input/` werden nie verändert.
   - Einmal vergebene Dateinamen in `wiki/`,
     `output/`, `overview/` und `outgoing/` bleiben
     bestehen.
3. **Detail-Referenzen:**
   - `MasterPrompt.md` — dieses Dokument
   - `Wiki.md` — Wiki-Logik
   - `Outgoing.md` — Outgoing-Pipeline
   - `Vorgehen.md` — Vorgehensrahmen
   - `Reviewmuster.md` — Multi-Agent-Reviews
   - `wiki/Facts.md` — Projekt-Einstieg, Stolpersteine
   - `wiki/Fassaden.md` — FassadenLandkarte
   - `wiki/InterneMechanik.md` — Steuerungs-Wissen
   - `wiki/Knotentypen.md` — Typen-Katalog
   - `wiki/Fristen.md` — Fristenbuch
   - `wiki/index.md` — Wiki-Katalog
   - `Tools.md` — installierte Erweiterungen
   - `Offene Fragen.md` — offene Fragen
4. **Arbeitsmodi-Verweis** auf §5.1.
5. **git-Commit-Kadenz-Verweis** auf §6.
6. **Projektsprache** (meist Deutsch).
7. **Projektspezifische Besonderheiten** —
   Tonfall, Ansprechpartner, Stichworte, die über
   `wiki/Facts.md` hinausgehen.
8. **Konfigurations-Übersicht** — aktive und
   deaktivierte Fassaden (gespiegelt aus
   `wiki/Fassaden.md`) plus Betriebs-Konfiguration
   (gespiegelt aus den `internal-rule`-Knoten
   [[Aktivierter-Prozess]],
   [[WorkspaceManager-Kontrakt]] und
   [[Commit-Sprache]]). Dieser Abschnitt trägt
   einen **Warntext-Header**:

   > **Automatisch generiert aus `wiki/Fassaden.md`
   > und den `internal-rule`-Knoten der
   > InterneMechanik — Änderungen hier werden beim
   > nächsten Sessionstart überschrieben; ändern
   > entweder dort oder dem Agenten im Chat
   > mitteilen.**

   Der Agent prüft beim Sessionstart (Phase B) Drift
   und legt Konflikte in Phase D als Frage vor
   (siehe §5.3).

## Synchronisation

Wird der MasterPrompt geändert, sollten die
Instruktionsdateien nachgezogen werden. Der Agent
prüft beim Sessionstart das Alter seiner Datei
(siehe A3) und bietet bei Abweichung eine
Nachsynchronisation an. Er ist nur für **seine**
Datei zuständig; andere Instruktionsdateien im
Projekt synchronisieren beim jeweils nächsten
Sessionstart des betreffenden Agenten.

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Kern-Kurzformen: MasterPrompt §8.2–8.4; Grundsatz
  KI-Agnostik: MasterPrompt §8.1
- Konfigurations-Sync beim Sessionstart:
  MasterPrompt §5.3 Phase B
