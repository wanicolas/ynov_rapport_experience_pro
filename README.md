# Rapport d'Expérience Professionnelle — Mastère 2 Expert en Développement Web

Ce dépôt contient les sources [Typst](https://typst.app/) et les ressources graphiques du **Rapport d'expérience professionnelle** rédigé par **Nicolas Walter** dans le cadre de l'obtention du titre de **Mastère 2 Expert en Développement Web** (Ynov Campus Strasbourg, promotion 2024–2026).

Le document retrace quatre années d'immersion professionnelle chez **Logitud Solutions**, éditeur de logiciels de référence pour les collectivités territoriales, en se focalisant sur les deux années de cycle Mastère en tant que développeur et référent technique front-end.

---

## Sommaire du Rapport

Le rapport est calibré à **30 pages** et s'articule autour de quatre grands axes :

1. **Chapitre I : Introduction & Contexte Général**
   - Présentation de Logitud Solutions (35+ ans d'histoire, rachat de Numesia, 6 000+ collectivités, 99 des 100 plus grandes villes de France).
   - Les spécificités du secteur GovTech : continuité de service public, RGPD et souveraineté des données.
   - La plateforme Mon-Guichet et les exigences légales d'accessibilité numérique (RGAA / WCAG 2.1 niveau AA).
   - Trajectoire de 4 ans (du BUT MMI au Mastère 2) et évolution vers la gouvernance technique front-end.

2. **Chapitre II : Réalisations & Projets Techniques**
   - **Projet Phare (1 an) — Moteur de vente en ligne et billetterie modulaire (Ville de Mulhouse)** :
     - Stack technique moderne : Nuxt 4, Nuxt UI v4, TypeScript strict, Tailwind CSS, ESLint, Prettier et CI GitHub Actions (Vitest, `vue-tsc`).
     - Surcouche `DataTable` personnalisée : sélecteur dynamique de colonnes, actions par ligne, tri et filtrage hybrides front/back (instantanéité sur 6 000 entrées), exports natifs CSV et PDF via `defineExpose`.
     - Système de tiroirs latéraux empilables (*Stackable Drawers*) avec gestion du focus et du z-index.
     - Outils d'audit : Command Palette (`Ctrl+K`) et visualiseur de *diffs* JSON (`split` et `unified`).
     - Tableaux de bord de fréquentation avec Apache ECharts réactifs.
     - Parcours citoyen (catalogue, créneaux, panier réactif, gestion d'erreurs automatique) et parcours vente guichet.
   - **Projet 2 (4 mois) — File d'attente connectée & Borne tactile (PopQueue)** :
     - Back-office agent et supervision de salle d'attente en temps réel via WebSockets.
     - Interface tactile usager sur borne/tablette en mairie et conception d'un clavier virtuel sur mesure en JavaScript pur (optimisation tactile, simplification de saisie et contournement des contraintes du mode kiosque).
   - **Projet 3 (4 mois) — Refonte globale UI/UX de Mon-Guichet v2** :
     - Modernisation graphique, passage de Vue 2 legacy vers Nuxt 4 / Tailwind CSS, organisation par tuiles thématiques et conformité RGAA.
   - **Projet 4 (4 mois) — Optimisation Place de Marché** :
     - Réduction de la dette technique : épuration du JavaScript au profit de CSS/Tailwind natif et intégration fidèle de maquettes Figma.

3. **Chapitre III : Analyse Réflexive, Stratégique & Bilan de Compétences**
   - Gains sur l'expérience développeur (DX), standardisation des composants partagés et réduction de dette technique.
   - Gestion des parties prenantes (contrats d'API avec l'équipe back-end Laravel, designer Figma, chef de projet).
   - Arbitrage technique argumenté : tri front-end instantané vs tri back-end classique.
   - Indicateurs d'impact mesurables (Lighthouse > 95%, -40% bundle JS, tri < 5 ms).
   - Matrice d'auto-évaluation des compétences M2 (techniques, méthodologiques, humaines).

4. **Chapitre IV : Conclusion, Perspectives & Annexes**
   - Rétrospective sur la trajectoire de 4 ans chez Logitud Solutions.
   - Perspectives produit et projection de carrière (Lead Front-End / Architecte Web).
   - Webographie officielle et matrice de l'environnement technique.

---

## Structure du Dépôt

```text
├── assets/
│   ├── fonts/            # Polices typographiques (Hanken Grotesk, JetBrains Mono)
│   └── images/           # Captures d'écran et illustrations des projets
│       ├── mg_shop/      # Captures du moteur de billetterie & e-commerce
│       ├── mon-guichet/  # Comparatif avant/après Mon-Guichet v1 et v2
│       └── popqueue/     # Captures de la file d'attente et de la borne tactile
├── chapters/
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
- **Formation :** Mastère Expert en Développement Web — Ynov Campus Strasbourg (2024–2026)
- **Site personnel :** [nicolaswalter.fr](https://nicolaswalter.fr)
- **Dépôt GitHub :** [wanicolas/ynov_rapport_experience_pro](https://github.com/wanicolas/ynov_rapport_experience_pro)
