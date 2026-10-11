---
type: internal-rule
---

# Konzept-Repositories

**Register der Konzept-/Proposal-Repositories**, aus
denen das Konzept-Angebot beim Init (MasterPrompt
§5.3, Turn „Konzept-Angebot") und spätere
Übernahme-Angebote schöpfen. Ein Eintrag je
Repository:

| Repository | Thema | Geltung |
|---|---|---|
| `https://github.com/schlingensiepen/proposals` | technisches Vorgehen | Basis |

- **Geltung** steuert, wann ein Repository angeboten
  wird: `Basis` = immer; ein Prozess-Kürzel (z.B.
  `SP-1`) = nur bei aktiviertem Prozess —
  einschließlich der Prozesse, die ihn per
  `extends:` erweitern. Beispiel: bei aktivem RP-1
  werden die Einträge von Basis, SP-1 und RP-1
  angeboten.
- **Vorbelegung:** der Basis-Eintrag oben ist eine
  Vorbelegung des Template-Betreibers — frei
  ersetzbar oder streichbar; das Register gehört dem
  Projekt.
- **Pflege:** neue Sammlungen können jederzeit
  ergänzt werden (Init-Zusatzfrage „Hast du weitere
  solche Sammlungen?" oder später auf Zuruf); je
  Eintrag werden Thema und Geltung erfragt bzw.
  abgeleitet.
- **Prozess-Beiträge:** Prozesse können eigene
  Repositories mitbringen — auch mehrere — als
  `Konzept-Repositories-Anhang-<Prozess>.md` in
  ihrem Teil-Wiki. Der Prozess-Merge (Wiki.md
  §11.3) übernimmt die Einträge mit Geltung =
  Prozess in dieses Register; der Anhang selbst
  wird nicht ins Anwender-`wiki/` kopiert (gleiches
  Muster wie der Knotentypen-Anhang).
- **Übernahme-Wirkung:** was aus einem Repository
  übernommen wird, regelt MasterPrompt §5.3
  (DEC-Buchung, Quell-Kopie als `document` mit
  `document_type: proposal`, Fassaden-Wirkung als
  Aktions-Entwurf).

_(Kein Fassaden-Knoten — `internal-rule`-Detail-Knoten,
indexiert über [[InterneMechanik]].)_
