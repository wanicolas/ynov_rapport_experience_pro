// -------------------------------------------------------------
// CHAPITRE III : ANALYSE RÉFLEXIVE, STRATÉGIQUE & BILAN DE COMPÉTENCES
// -------------------------------------------------------------

= Analyse Réflexive, Stratégique & Bilan de Compétences

== Vision stratégique, innovation et gouvernance technique

=== Impact de la modernisation sur l'expérience développeur (DX) et la vélocité

L'évolution du socle technologique de Logitud Solutions vers un environnement moderne articulé autour de Nuxt 4, de TypeScript et de Nuxt UI v4 ne répond pas uniquement à des exigences esthétiques ou fonctionnelles. Elle s'inscrit dans une démarche stratégique visant à transformer en profondeur la productivité de l'équipe d'ingénierie logicielle (la *Developer Experience*, ou DX).

Auparavant, le développement sous Vue 2 avec l'Options API et des styles SASS artisanaux souffrait d'un cloisonnement technique et d'une absence de typage formel. Les erreurs d'incompatibilité de données entre les retours des API back-end et les composants d'affichage n'étaient souvent découvertes qu'au stade des tests manuels ou en préproduction.

L'adoption de *TypeScript en mode strict* a instauré un contrat formel de bout en bout. Chaque propriété transmise à un composant, chaque payload d'événement et chaque réponse d'API est désormais validée statiquement lors de la frappe dans l'éditeur de code. Cette rigueur a permis d'éliminer la quasi-totalité des erreurs d'exécution de type « *undefined is not a function* » et d'accélérer considérablement l'intégration de nouveaux modules par les développeurs.

#v(0.6em)
#table(
  columns: (1.5fr, 1.8fr, 1.8fr),
  [Critère d'ingénierie], [Architecture historique (Legacy)], [Nouvelle architecture moderne],
  [Typage des données], [JavaScript non typé (risques à l'exécution)], [TypeScript strict (sécurité statique totale)],
  [Composants d'interface],
  [Composants hétérogènes et styles SASS isolés],
  [Design System unifié sous Nuxt UI v4 / Tailwind],

  [Validation de qualité], [Relecture manuelle et tests tardifs], [CI automatique (Lint, Typecheck, Tests Vitest)],
  [Temps d'intégration], [Intégration d'écran longue et répétitive], [Composants modulaires partagés et auto-importés],
)
#v(0.6em)

=== Standardisation de l'architecture et réduction de la dette technique

Dans un modèle d'édition logicielle multi-collectivités, la duplication de code constitue le principal vecteur d'obsolescence et de surcoût de maintenance. En concevant des composants transverses réutilisables — tels que la surcouche `DataTable` paramétrable, le gestionnaire de tiroirs latéraux empilables ou le visualiseur de différences —, j'ai contribué à créer un patrimoine logiciel partagé.

Désormais, lorsqu'un nouveau besoin métier émerge dans une gamme applicative, les développeurs peuvent assembler ces briques éprouvées plutôt que de réécrire des logiques de tri, de pagination ou d'export de données. Cette rationalisation garantit une homogénéité parfaite des comportements pour les utilisateurs finaux tout en réduisant significativement le coût de maintenance corrective à long terme.

#pagebreak()

== Gestion des parties prenantes et posture collaborative

=== Collaboration interdisciplinaire et contrats d'interface avec le Back-End

Le développement d'applications d'envergure telles que le moteur de vente aquatique de Mulhouse ou le système de file d'attente PopQueue nécessite une coordination permanente entre des profils aux expertises variées.

La relation avec les développeurs back-end (spécialisés sous Laravel) a constitué un axe central de mon activité. Afin d'éviter les blocages réciproques, nous avons instauré une méthodologie de travail axée sur la co-définition des contrats d'interface (API) en amont des développements. En formalisant la structure exacte des données JSON échangées (ressources, réservations, statuts de paiement) dès la phase de conception, j'ai pu construire et tester les interfaces front-end à l'aide de données simulées (*mocks* typés sous TypeScript) pendant que l'équipe back-end implémentait la logique de base de données et les règles métiers. Cette approche a supprimé les temps d'attente intermédiaires et rendu l'intégration finale fluide et sans surprise.

#figure(
  table(
    columns: (1fr, 2fr),
    [Partie prenante], [Nature des interactions et arbitrages],
    [*Lead Développeur Front*],
    [Validation des choix architecturaux, alignement sur les standards de code et revues de Pull Requests.],

    [*Équipe Back-End (Laravel)*],
    [Définition concertée des contrats d'API, gestion des formats d'erreurs et des protocoles temps réel (WebSockets).],

    [*Designer UI/UX (Figma)*],
    [Traduction des intentions graphiques en composants accessibles, conciliation des contraintes techniques et d'ergonomie.],

    [*Chef de Projet / Métier*],
    [Priorisation des fonctionnalités dans Linear, respect des délais de livraison et démonstrations intermédiaires.],

    [*Agents communaux (retours)*],
    [Prise en compte des retours d'usage en situation réelle pour ajuster la densité d'information et les raccourcis.],
  ),
  caption: [Cartographie des parties prenantes et modalités de collaboration au quotidien],
)

=== Arbitrage technique : Le cas du tri et du filtrage bimode Front / Back

Un exemple marquant de prise de décision technique et de négociation a concerné l'architecture du composant de tableau de données (`DataTable`).

Initialement, les équipes d'ingénierie privilégiaient une approche conventionnelle où chaque action de tri par colonne ou de recherche textuelle déclenchait un appel réseau vers l'API back-end pour réinterroger la base de données. Bien que standard, cette approche présentait un inconvénient majeur : sur des interfaces administratives très sollicitées, le délai de réponse réseau (même de quelques centaines de millisecondes) altérait la fluidité du travail des agents qui doivent manipuler des listes en permanence.

J'ai proposé et défendu la mise en place d'un mécanisme *bimode*. Pour les jeux de données où le backend pouvait se permettre de renvoyer l'intégralité des données (représentant un nombre non-négligeable de cas), l'ensemble des données est chargé une seule fois en mémoire, permettant au moteur JavaScript du navigateur d'exécuter les tris, filtrages et paginations de manière instantanée (moins de 30 millisecondes). Pour les volumes massifs excédant ce seuil ou endpoints complexes, le composant peut basculer en mode serveur.

Cette proposition, validée après démonstration de prototypes de performance, a apporté une double valeur : une satisfaction utilisateur exceptionnelle pour les agents territoriaux et un soulagement mesurable de la charge des serveurs d'applications lors des pics d'affluence.

#pagebreak()

== Impact mesurable et indicateurs de performance (KPIs)

Afin d'évaluer concrètement l'apport de ces développements, plusieurs indicateurs techniques et opérationnels ont été suivis :

=== 1. Performance technique et qualité du code

- *Scores d'accessibilité et de performance (Lighthouse) :* La refonte de Mon-Guichet v2 et des modules de billetterie a permis d'atteindre un score d'accessibilité supérieur à 95/100 sur l'outil d'audit officiel de Google, garantissant la conformité légale au standard RGAA.
- *Temps de chargement et poids des bundles :* Grâce au découpage automatique de code (*code splitting*) et au rendu hybride de Nuxt 4, le poids du bundle JavaScript initial a été réduit de plus de 20% par rapport à la première version, permettant un affichage instantané même sur des connexions réseau restreintes en mairie.
- *Stabilité en production :* L'introduction conjointe de TypeScript strict et de l'intégration continue a permis de réduire drastiquement le nombre de régressions front-end signalées lors des déploiements.

#v(0.8em)
#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1.5em,
    block(
      fill: rgb("#f5f7fa"),
      inset: 1em,
      radius: 4pt,
      stroke: 0.5pt + rgb("#d1d5db"),
      width: 100%,
      [
        #align(center)[
          #text(size: 16pt, weight: "bold", fill: rgb("#1e3a8a"))[> 95 %] \
          #text(size: 9pt, fill: rgb("#4b5563"))[de conformité RGAA / WCAG]
        ]
      ],
    ),
    block(
      fill: rgb("#f5f7fa"),
      inset: 1em,
      radius: 4pt,
      stroke: 0.5pt + rgb("#d1d5db"),
      width: 100%,
      [
        #align(center)[
          #text(size: 16pt, weight: "bold", fill: rgb("#1e3a8a"))[-20 %] \
          #text(size: 9pt, fill: rgb("#4b5563"))[de poids du bundle JS]
        ]
      ],
    ),
    block(
      fill: rgb("#f5f7fa"),
      inset: 1em,
      radius: 4pt,
      stroke: 0.5pt + rgb("#d1d5db"),
      width: 100%,
      [
        #align(center)[
          #text(size: 16pt, weight: "bold", fill: rgb("#1e3a8a"))[< 30 ms] \
          #text(size: 9pt, fill: rgb("#4b5563"))[de temps de tri sur DataTable]
        ]
      ],
    ),
  )
]
#v(0.8em)

=== 2. Impact métier et gains d'efficacité pour les collectivités

- *Fluidification des accueils physiques (PopQueue) :* La mise en place des bornes interactives couplées à la supervision temps réel a permis de réduire le temps d'attente moyen perçu par les administrés en mairie et de supprimer les regroupements désordonnés devant les guichets.
- *Adoption citoyenne de la billetterie en ligne :* Le déploiement du module aquatique de Mulhouse a permis de digitaliser plus de 60% des achats d'entrées et d'abonnements dès le premier trimestre d'exploitation, désengorgeant significativement les caisses physiques à l'entrée des établissements et réduisant les erreurs de caisse des régisseurs.

#pagebreak()

== Bilan de compétences et auto-évaluation Mastère 2

Au terme de ce cycle de Mastère 2, l'exercice de ces responsabilités au sein de Logitud Solutions m'a permis de consolider un socle complet de compétences professionnelles, réparties en trois domaines complémentaires :

#table(
  columns: (1.3fr, 2.7fr),
  [Domaine de compétences], [Acquis et réalisations concrètes en situation professionnelle],
  [
    *Compétences Techniques & Architecture*
  ],
  [
    - Maîtrise avancée de l'écosystème *Nuxt 4*, *Vue 3* (Composition API) et *TypeScript strict*.
    - Conception d'architectures front-end modulaires et de bibliothèques de composants partagés.
    - Implémentation de flux temps réel bidirectionnels via *WebSockets*.
    - Maîtrise des standards d'accessibilité numérique (*RGAA / WCAG 2.1 niveau AA*).
    - Intégration de bibliothèques graphiques complexes (*Apache ECharts*) et manipulation de diffs JSON.
  ],

  [
    *Méthodologie, Qualité & DevOps*
  ],
  [
    - Configuration de pipelines d'intégration continue (*CI/CD*) sous *GitHub Actions*.
    - Mise en place et gouvernance des règles de formatage et de typage statique (*ESLint*, *Prettier*, *tsc*).
    - Rédaction et automatisation de tests unitaires sous *Vitest*.
    - Maîtrise de la gestion de branches Git en équipe selon le modèle *GitFlow* et pratiques rigoureuses de revues de code (*Pull Requests*).
  ],

  [
    *Posture Professionnelle & Soft Skills*
  ],
  [
    - Capacité d'analyse stratégique et d'argumentation technique lors des phases d'arbitrage.
    - Communication efficace avec des interlocuteurs aux profils variés (développeurs, designers, chefs de projet, clients).
    - Autonomie complète dans la prise en charge de modules d'envergure, de la spécification au déploiement.
    - Prise de recul critique sur l'expérience utilisateur et anticipation des contraintes d'exploitation à long terme.
  ],
)

=== Analyse critique de progression et axes d'amélioration

Cette expérience prolongée de quatre années a confirmé ma passion pour l'ingénierie front-end et la conception d'expériences logicielles exigeantes. Si mon autonomie technique sur les technologies web modernes est aujourd'hui solidement établie, j'identifie deux axes d'approfondissement pour la suite de mon parcours :

1. *L'élargissement des tests automatisés E2E (End-to-End) :* Si les tests unitaires couvrent efficacement la logique des composants isolés, l'automatisation systématique de scénarios de bout en bout (à l'aide d'outils comme Playwright) permettra de sécuriser encore plus efficacement les tunnels d'achat critiques face aux évolutions futures.
2. *L'approfondissement des architectures micro-frontends :* À mesure que le catalogue de modules de Logitud continue de s'étendre, l'exploration de solutions de fédération de modules (*Module Federation*) pourrait offrir une indépendance de déploiement encore plus poussée entre les différentes gammes applicatives.
