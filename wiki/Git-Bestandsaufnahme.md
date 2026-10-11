---
type: internal-procedure
---

# Git-Bestandsaufnahme

**Zweck:** den git-Zustand eines Repos vollständig
aufnehmen — beim Init, beim Sessionstart nach
Auffälligkeiten und vor Scaffolding-Entscheidungen.
MasterPrompt §6 regelt den laufenden git-Umgang;
diese Checkliste ist die Bestandsaufnahme.

**Checkliste:**

1. **Repo vorhanden?**
   `git rev-parse --is-inside-work-tree`.
2. **Commits vorhanden?** leerer Verlauf oder
   gewachsene Historie?
3. **user.name / user.email gesetzt?** (lokal oder
   global).
4. **Remote konfiguriert?** `git remote -v`.
5. **Tracking-Branch gesetzt?** aktueller Branch
   mit Upstream?
6. **Ahead/Behind?** lokaler Stand gegenüber dem
   Upstream.
7. **Branch-Strategie?** nur Default-Branch oder
   Feature-Branches; welche Konvention gilt?
8. **`.gitignore` vorhanden und stack-passend?**
9. **Untracked/dirty Dateien?** `git status` —
   was liegt unversioniert herum?
10. **Submodule initialisiert?** (Modus B) —
    existiert `_template/`, ist aber leer (clone
    ohne `--recursive`): `git submodule update
    --init` anbieten; template-abhängige Schritte
    bis dahin zurückstellen (MasterPrompt §5.3 A1).

**Ergebnis:** Befund im Erledigt-Block melden
(berichten statt blockieren); fehlende Punkte als
Aktions-Entwurf oder Frage vorlegen. Bei fehlendem
Repo in gefülltem Ordner gilt der Fail-Safe aus
MasterPrompt §5.3 Phase A1 (Standardaufgaben mit
Commit-Anteil aussetzen, keine automatische
Initialisierung).

## Bezüge

- Fassaden-Eintrag: [[InterneMechanik]]
- Verwandte Regel: [[Berichten-statt-Blockieren]]
