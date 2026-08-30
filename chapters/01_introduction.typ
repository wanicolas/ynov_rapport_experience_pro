// -------------------------------------------------------------
// CHAPITRE I : INTRODUCTION & CONTEXTE GÉNÉRAL
// -------------------------------------------------------------

= Introduction & Contexte Général

== Présentation de Logitud Solutions et du secteur GovTech

=== Historique, ancrage territorial et croissance

Fondée en 1987 à Mulhouse par deux informaticiens de la fonction publique territoriale, Logitud Solutions s'est imposée en plus de trente-cinq ans comme un acteur majeur de l'édition logicielle dédiée aux administrations publiques locales françaises. Initialement reconnue pour avoir conçu l'un des tout premiers logiciels d'état civil informatisé en France (*Siècle*), l'entreprise a progressivement élargi son offre pour couvrir l'ensemble des besoins administratifs et opérationnels des collectivités.

L'histoire récente de la société est marquée par une phase de consolidation stratégique, notamment concrétisée en 2023 par le rachat de la société strasbourgeoise *Numesia*. Cette acquisition a permis d'intégrer une expertise pointue dans la gestion de la relation usager (GRU) et de renforcer la présence de l'entreprise sur deux pôles alsaciens complémentaires : le siège historique de Mulhouse et l'agence de Strasbourg, au sein de laquelle j'exerce mes fonctions.

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
          #text(size: 16pt, weight: "bold", fill: rgb("#1e3a8a"))[37+ ans] \
          #text(size: 9pt, fill: rgb("#4b5563"))[d'expertise en logiciel public]
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
          #text(size: 16pt, weight: "bold", fill: rgb("#1e3a8a"))[4 000+] \
          #text(size: 9pt, fill: rgb("#4b5563"))[collectivités
            clientes en France]
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
          #text(size: 16pt, weight: "bold", fill: rgb("#1e3a8a"))[14] \
          #text(size: 9pt, fill: rgb("#4b5563"))[logiciels métiers]
        ]
      ],
    ),
  )
]
#v(0.8em)

Aujourd'hui, Logitud Solutions équipe plus de 6 000 communes et intercommunalités en France, dont 99 des 100 plus grandes municipalités françaises, incluant des métropoles de premier plan telles que Strasbourg, Nice ou Toulouse. Cette diffusion à l'échelle nationale confère à l'entreprise une responsabilité directe dans la continuité du service public numérique et dans le traitement quotidien de millions de démarches administratives.

=== Les trois gammes métiers

Le catalogue applicatif de Logitud Solutions s'articule autour de trois domaines fonctionnels majeurs, conçus pour répondre aux missions réglementaires des agents municipaux :

1. *La Gamme Population :* Ce pôle historique regroupe les applications de gestion de l'état civil (*Siècle*), la tenue des listes électorales et la gestion des scrutins (*SuffrageWeb*, *Scrutin*), la gestion des concessions funéraires (*Éternité*) ainsi que le recensement citoyen et militaire (*Avenir*, *Décennie*). Ces outils manipulent des données hautement sensibles et sont soumis à des contraintes légales d'une rigueur absolue.
2. *La Gamme Sécurité :* Dédiée à l'équipement des polices municipales et des agents de surveillance de la voie publique (ASVP), cette gamme comprend des logiciels de gestion des mains courantes et interventions (*Municipol*), des solutions mobiles de verbalisation électronique (*GVE*, *GVs*) et des outils de gestion de fourrière automobile.
3. *La Gamme Dématérialisation et Relation Usagers (GRU) :* Centrée autour de la plateforme *Mon-Guichet* et des passerelles nationales telles que le bouquet de services *HubEE*, cette gamme assure la dématérialisation complète des interactions entre les administrés et leur mairie. Elle offre des portails citoyens accessibles 24h/24 ainsi que des consoles d'instruction spécialisées pour les agents.

=== Spécificités et contraintes du secteur public (GovTech)

Le développement de solutions logicielles pour le secteur public obéit à des contraintes techniques, juridiques et ergonomiques sensiblement plus strictes que dans l'édition logicielle grand public.

Tout d'abord, la *continuité de service* et la *souveraineté des données* constituent des impératifs non négociables. Les administrations locales ne peuvent subir d'interruption lors de temps forts institutionnels (élections politiques, rentrées scolaires, déclarations d'actes d'état civil). De plus, les données personnelles des administrés doivent être hébergées et traitées dans le respect scrupuleux du Règlement Général sur la Protection des Données (RGPD) et des recommandations de l'ANSSI.

Ensuite, les logiciels territoriaux se caractérisent par une *longévité exceptionnelle*. Contrairement à des applications éphémères, les outils métiers d'une collectivité sont souvent exploités pendant dix à quinze ans. Les choix d'architecture logicielle doivent donc privilégier la maintenabilité, l'extensibilité et la robustesse à long terme, en évitant les effets de mode technologique tout en assurant une modernisation progressive du socle existant.

#pagebreak()

== La plateforme Mon-Guichet et les défis de la dématérialisation

=== Rôle et fonctionnement de la plateforme

La plateforme *Mon-Guichet* constitue la vitrine numérique de la collectivité auprès de ses citoyens. Elle fonctionne selon un modèle double :

- *Le portail usager :* Un espace public personnalisé permettant aux citoyens de consulter les informations municipales, de prendre des rendez-vous en mairie, de soumettre des demandes administratives (actes d'état civil, inscriptions périscolaires, signalements d'incivilités) et d'effectuer des achats ou réservations en ligne.
- *Le back-office agent :* Une interface d'administration sécurisée permettant aux agents territoriaux de traiter les demandes entrantes, de vérifier les pièces justificatives, de communiquer avec l'administré et de piloter les flux physiques et numériques de la mairie.

Ce double positionnement impose au développement front-end d'adopter deux ergonomies distinctes mais cohérentes : une interface grand public intuitive, épurée et guidée pour les administrés, et une interface métier dense, rapide et optimisée pour la productivité quotidienne des agents.

#align(center)[
  #block(
    fill: rgb("#f8fafc"),
    stroke: 0.5pt + rgb("#cbd5e1"),
    inset: 1.2em,
    radius: 4pt,
    width: 100%,
    [
      #text(weight: "bold", size: 11pt)[Objectif stratégique de la modernisation de Mon-Guichet] \
      #v(0.4em)
      Transformer un système d'information communal historiquement cloisonné en un écosystème SaaS modulaire, garantissant une expérience fluide pour le citoyen et un traitement unifié et automatisé pour les agents municipaux.
    ],
  )
]

=== L'accessibilité numérique comme exigence légale et éthique

Dans le secteur public, l'accessibilité web n'est pas une simple option de confort, mais une obligation légale stricte régie par l'article 47 de la loi du 11 février 2005 et détaillée par le Référentiel Général d’Amélioration de l’Accessibilité (*RGAA*), lui-même aligné sur les critères internationaux *WCAG 2.1 (niveau AA)*.

Chaque citoyen, quelles que soient ses capacités physiques, cognitives ou son équipement technique, doit pouvoir accomplir ses démarches administratives sans discrimination. Cette exigence impose une rigueur extrême dans la conception des interfaces front-end :

- *Contraste des couleurs et lisibilité :* Respect d'un ratio de contraste minimal de 4.5:1 pour les textes normaux et 3:0:1 pour les composants d'interface, y compris lorsque les collectivités personnalisent leur charte graphique aux couleurs de leur blason ou de leur logo.
- *Navigation intégrale au clavier :* Tous les composants interactifs (boutons, formulaires, modales, tiroirs, calendriers) doivent être manipulables sans souris, avec un ordre de tabulation logique et un indicateur de focus nettement visible.
- *Balisage sémantique et compatibilité avec les technologies d'assistance :* Utilisation rigoureuse des balises HTML5 natives et des attributs ARIA (Accessible Rich Internet Applications) pour permettre aux logiciels de lecture d'écran (tels que NVDA ou VoiceOver) de restituer fidèlement l'état et la nature des éléments.
- *Tolérance aux erreurs et formulaires guidés :* Les messages de validation et d'erreur doivent être explicites, localisés au plus près des champs concernés et associés à des explications claires pour corriger la saisie.

=== La transition architecturale vers le SaaS modulaire

Historiquement, les interfaces de Mon-Guichet reposaient sur une architecture monolithique basée sur Vue 2, l'Options API, et une feuille de style SASS personnalisée. Si cette architecture a permis de digitaliser un grand nombre de procédures, elle a progressivement accumulé une dette technique pénalisante : couplage fort entre composants, temps de compilation élevés, difficultés d'évolution stylistique et absence de typage statique.

Pour accompagner l'accélération des nouveaux besoins municipaux (billetterie en ligne, gestion de files d'attente en temps réel), la direction technique a engagé une refonte globale. Cette transition s'est traduite par l'adoption de *Nuxt 4*, de la librairie de composants *Nuxt UI v4*, de *Tailwind CSS* et de *TypeScript*. Cette modernisation vise à offrir une architecture modulaire en composants réutilisables, un typage de bout en bout avec les API back-end, une vitesse d'exécution optimale et une séparation nette entre logique métier et présentation.

#pagebreak()

== Trajectoire de 4 ans et positionnement de l'alternant

=== Une continuité de parcours au service de la montée en compétences

Mon parcours au sein de Logitud Solutions s'inscrit dans une durée continue de quatre années d'alternance, structurée en deux cycles académiques complémentaires :

- *Période 2022 - 2024 (2 ans) :* BUT Métiers du Multimédia et de l'Internet (MMI) à l'IUT de Haguenau (Université de Strasbourg). Cette première phase a été consacrée à l'apprentissage pratique du développement front-end, à l'intégration de maquettes, à la découverte des outils de versioning collaboratif (Git) et à l'assimilation des contraintes du secteur des collectivités territoriales.
- *Période 2024 - 2026 (2 ans) :* Mastère Expert en Développement Web à Ynov Campus Strasbourg. Cette seconde phase a marqué une montée en puissance vers la conception d'architectures logicielles, la standardisation des outillages de développement, la création de composants génériques avancés et la prise de décisions techniques structurantes en coordination avec les équipes de développement.

#table(
  columns: (1.2fr, 1.8fr, 2fr),
  [Période & Formation], [Périmètre d'intervention], [Posture & Responsabilités],
  [
    *2022 - 2024* \
    BUT MMI \
    _(Niveau Bac+3)_
  ],
  [
    - Intégration HTML / SASS / Vue 2
    - Maintenance corrective d'écrans
    - Découverte des workflows Git d'équipe
    - Initiation aux règles d'accessibilité
  ],
  [
    *Développeur Front-End Junior* \
    Exécution sous supervision, assimilation des bonnes pratiques et découverte du métier.
  ],

  [
    *2024 - 2026* \
    Mastère Expert Web \
    _(Niveau Bac+5)_
  ],
  [
    - Architecture Nuxt 4, TypeScript, Nuxt UI v4
    - Conception de composants réutilisables complexes
    - Industrialisation CI/CD (GitHub Actions, Vitest)
    - Temps réel (WebSockets) et ergonomie borne tactile
  ],
  [
    *Référent Technique Front-End* \
    Autonomie de conception, arbitrages techniques, garant des standards de code et de la DX.
  ],
)

=== Évolution du rôle vers la gouvernance technique front-end

Au cours de ces deux dernières années en Mastère, ma posture a profondément évolué. Initialement cantonné à l'intégration d'écrans selon des spécifications strictes, j'ai été amené à intervenir en amont des projets pour structurer l'architecture technique des nouvelles applications.

Cette évolution s'est articulée autour de trois axes de responsabilité :

1. *Standardisation de l'environnement de développement et de la qualité de code :* J'ai pris en charge la configuration des linters (ESLint), des formateurs automatiques (Prettier) et du typage statique strict via TypeScript. L'intégration de ces outils dans des pipelines d'intégration continue (GitHub Actions) garantit qu'aucun code ne peut être fusionné sans avoir validé les tests unitaires et les règles de cohérence syntaxique.
2. *Conception de bibliothèques de composants partagés :* Plutôt que de développer des fonctionnalités ad hoc pour chaque projet, j'ai conçu des composants génériques hautement configurables (comme le composant surcouche `DataTable` ou le système de tiroirs empilables) réutilisés sur plusieurs applications de l'entreprise.
3. *Arbitrage et collaboration inter-équipes :* Travaillant à la croisée des besoins des concepteurs logiciels (UI/UX), des développeurs back-end (Laravel) et du chef de projet, j'ai régulièrement proposé et défendu des arbitrages techniques visant à concilier simplicité de maintenance pour l'équipe de développement et fluidité d'usage pour les clients finaux.

=== Méthodes de travail et outillage collaboratif

L'organisation du travail au sein de l'équipe repose sur des méthodes agiles adaptées au rythme des livraisons de l'éditeur :

- *Gestion de version et revue de code :* Utilisation de GitHub avec une stratégie stricte de branches dérivées de GitFlow. Chaque fonctionnalité donne lieu à une Pull Request soumise à la relecture systématique par les pairs et à la validation automatique des pipelines d'intégration continue.
- *Suivi des tâches et planification :* Utilisation de l'outil Linear pour le suivi des tickets, la gestion des sprints et l'affectation des tâches de développement, complété par Notion pour la documentation technique interne et les spécifications d'architecture.
- *Collaboration pluridisciplinaire :* Échanges quotidiens sur Slack et points de cadrage hebdomadaires réunissant le lead front, le designer UI/UX sous Figma et les développeurs back-end afin d'ajuster les contrats d'interface (API) et les contraintes ergonomiques.
