---
type: internal-rule
---

# Schwester-Templates

**Landkarte der Schwester-Templates:** die veröffentlichten
Starter, die aus demselben Master-Template abgeleitet sind.
Hier sucht der Agent, wenn ein Projekt Einrichtungen eines
anderen Templates übernehmen soll, als einzelnen Baustein, per
Merge oder per Join. Ein Eintrag je Starter:

| Starter | Repository | Prozess | Kurzbeschreibung |
|---|---|---|---|
| Referenzprozess Softwareentwicklung | `https://github.com/schlingensiepen/referenzprozess-softwareentwicklung` | RP-1 Entwicklung eines Softwaresystems (auf SP-1) | Software-Entwicklungsprojekt auf Basis des Standardprozesses für Entwicklungsprojekte |
| Referenzprozess Infrastruktur | `https://github.com/schlingensiepen/referenzprozess-infrastruktur` | RP-2 IT-Infrastruktur (auf SP-1) | Aufbau, Änderung, Betrieb und Abbau einer selbst betriebenen Anlage |
| Referenzprozess Rechtsfall | `https://github.com/schlingensiepen/referenzprozess-rechtsfall` | RP-20 Rechtsfall (auf SP-2) | Verfahren bei Behörden und Gerichten außerhalb des Abgabenrechts, außergerichtlicher Streit, Vollstreckung |
| Referenzprozess Abgabenfall | `https://github.com/schlingensiepen/referenzprozess-abgabenfall` | RP-21 Steuer- und Abgabenfall (auf SP-2) | Steuern und Abgaben von der Mitwirkung über Einspruch und Widerspruch bis zum Gericht |

Die Starter für Infrastruktur, Rechtsfall und Abgabenfall
sind in dieser Version **zunächst privat**: Ihr Repository
ist nur mit Zugriffsrecht erreichbar. Ist ein Starter für den
Agenten nicht erreichbar, meldet er das und fragt den
Anwender nach dem Zugang oder einem lokalen Klon. Die
Prozess-Familien: SP-1 mit RP-1 und RP-2; SP-2 mit RP-20 und
RP-21.

- **Repository** nennt die GitHub-URL des Starters.
- **Prozess** nennt den Standard- oder Referenzprozess, den
  der Starter aktiviert. Ein Join ist nur innerhalb einer
  Prozess-Familie möglich; Baustein und Merge gehen zwischen
  allen Templates.
- **Kurzbeschreibung:** ein Satz, wofür der Starter gedacht ist.
- **Pflege:** Die Landkarte kommt mit dem Template und wird
  beim Upgrade aktualisiert. Eigene Einträge des Anwenders,
  etwa ein privater Starter, bleiben erhalten.

_(Kein Fassaden-Knoten — `internal-rule`-Detail-Knoten,
indexiert über [[InterneMechanik]].)_
