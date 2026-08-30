# Rapport d'Expérience Professionnelle — Mastère 2 Expert en développement logiciel

Ce dépôt contient les sources [Typst](https://typst.app/) et les ressources graphiques du **Rapport d'expérience professionnelle** rédigé par **Nicolas Walter** dans le cadre de l'obtention du titre de **Mastère 2 Expert en développement logiciel** (Ynov Campus Strasbourg, promotion 2024–2026).

Le document retrace quatre années d'immersion professionnelle chez **Logitud Solutions**, éditeur de logiciels de référence pour les collectivités territoriales, en se focalisant sur les deux années de cycle Mastère en tant que développeur et référent technique front-end.

---

## Structure du Dépôt

```text
├── assets/
│   ├── fonts/            # Polices typographiques (Hanken Grotesk, JetBrains Mono)
│   └── images/           # Captures d'écran et illustrations des projets
│   ├── 00_liminaires.typ # Résumé exécutif, remerciements, sommaire, glossaire
│   ├── 01_introduction.typ # Chapitre I : Contexte et présentation entreprise
│   ├── 02_missions.typ   # Chapitre II : Réalisations et projets techniques
│   ├── 03_bilan.typ      # Chapitre III : Analyse réflexive et bilan de compétences
│   └── 04_conclusion.typ # Chapitre IV : Conclusion, perspectives, webographie, annexes
├── consignes/            # Guide pédagogique et grille d'évaluation académique Ynov
├── build.sh              # Script de compilation Docker (génère report.pdf)
├── watch.sh              # Script d'écoute en direct (Live-Reload)
├── report.typ            # Point d'entrée principal Typst
└── report.pdf            # Rendu PDF final compilé (30 pages)
```

---

## Compilation du Rapport

Le rapport est rédigé avec le moteur de composition open-source **[Typst](https://typst.app/)**.

### Option 1 : Compilation via Docker (Recommandé)

Aucune installation locale de Typst n'est requise si Docker est installé sur votre machine :

- **Compilation unique :**
  ```bash
  ./build.sh
  ```
- **Mode écoute en continu (Live-Reload) :**
  ```bash
  ./watch.sh
  ```

### Option 2 : Compilation avec le CLI Typst natif

Si vous disposez du binaire `typst` installé localement :

```bash
typst compile report.typ report.pdf --font-path assets/fonts
```

---

## Auteur & Contact

- **Auteur :** Nicolas Walter
- **Rôle :** Développeur Web Front-End chez [Logitud Solutions](https://www.logitud.fr)
- **Formation :** Mastère Expert en développement logiciel — Ynov Campus Strasbourg (2024–2026)
- **Site personnel :** [nicolaswalter.fr](https://nicolaswalter.fr)
- **Dépôt GitHub :** [wanicolas/ynov_rapport_experience_pro](https://github.com/wanicolas/ynov_rapport_experience_pro)
