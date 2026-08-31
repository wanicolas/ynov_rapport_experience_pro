// -------------------------------------------------------------
// CHAPITRE I : INTRODUCTION & CONTEXTE GÉNÉRAL
// -------------------------------------------------------------

= Introduction & Contexte Général

== Présentation de Logitud Solutions et du secteur GovTech

=== Historique, ancrage territorial et croissance

Fondée en 1987 à Mulhouse par deux informaticiens de la fonction publique territoriale, Logitud Solutions s'est imposée en plus de trente-cinq ans comme un acteur majeur de l'édition logicielle dédiée aux administrations publiques locales françaises. Initialement reconnue pour avoir conçu l'un des tout premiers logiciels d'état civil informatisé en France (*Siècle*), l'entreprise a progressivement élargi son offre pour couvrir l'ensemble des besoins administratifs et opérationnels des collectivités.

L'histoire récente de la société est marquée par une phase de consolidation stratégique, notamment concrétisée en 2023 par le rachat de la société strasbourgeoise *Numesia*. Cette acquisition a permis d'intégrer une expertise pointue dans la gestion de la relation usager (GRU) et de renforcer la présence de l'entreprise sur deux pôles alsaciens complémentaires : le siège historique de Mulhouse et l'agence de Strasbourg, au sein de laquelle j'exerce mes fonctions.

#v(0.6em)
#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1.5em,
    block(
      fill: rgb("#f5f7fa"),
      inset: 0.9em,
      radius: 4pt,
      stroke: 0.5pt + rgb("#d1d5db"),
      width: 100%,
      [
        #align(center)[
          #text(size: 15pt, weight: "bold", fill: rgb("#1e3a8a"))[40+ ans] \
          #text(size: 8.5pt, fill: rgb("#4b5563"))[d'expertise en logiciel public]
        ]
      ],
    ),
    block(
      fill: rgb("#f5f7fa"),
      inset: 0.9em,
      radius: 4pt,
      stroke: 0.5pt + rgb("#d1d5db"),
      width: 100%,
      [
        #align(center)[
          #text(size: 15pt, weight: "bold", fill: rgb("#1e3a8a"))[4 000+] \
          #text(size: 8.5pt, fill: rgb("#4b5563"))[collectivités clientes en France]
        ]
      ],
    ),
    block(
      fill: rgb("#f5f7fa"),
      inset: 0.9em,
      radius: 4pt,
      stroke: 0.5pt + rgb("#d1d5db"),
      width: 100%,
      [
        #align(center)[
          #text(size: 15pt, weight: "bold", fill: rgb("#1e3a8a"))[14] \
          #text(size: 8.5pt, fill: rgb("#4b5563"))[logiciels métiers spécialisés]
        ]
      ],
    ),
  )
]
#v(0.6em)

Aujourd'hui, Logitud Solutions équipe plus de 4 000 communes et intercommunalités en France. Cette diffusion à l'échelle nationale confère à l'entreprise une responsabilité directe dans la continuité du service public numérique et dans le traitement quotidien de millions de démarches administratives. métiers et l'offre applicative

Le catalogue applicatif de Logitud Solutions s'articule autour de trois domaines fonctionnels majeurs, conçus pour répondre aux missions réglementaires des agents municipaux :

1. *La Gamme Population :* Ce pôle historique regroupe les applications de gestion de l'état civil (*Siècle*), la tenue des listes électorales et la gestion des scrutins (*SuffrageWeb*, *Scrutin*), la gestion des concessions funéraires (*Éternité*) ainsi que le recensement citoyen et militaire (*Avenir*, *Décennie*). Ces outils manipulent des données hautement sensibles et sont soumis à des contraintes légales d'une rigueur absolue.
2. *La Gamme Sécurité :* Dédiée à l'équipement des polices municipales et des agents de surveillance de la voie publique (ASVP), cette gamme comprend des logiciels de gestion des mains courantes et interventions (*Municipol*), des solutions mobiles de verbalisation électronique (*GVE*, *GVs*) et des outils de gestion de fourrière automobile.
3. *La Gamme Dématérialisation et Relation Usagers (GRU) :* Centrée autour de la plateforme *Mon-Guichet* et des passerelles nationales, cette gamme assure la dématérialisation complète des interactions entre les administrés et leur mairie. Elle offre des portails citoyens accessibles 24h/24 ainsi que des consoles d'instruction spécialisées pour les agents.

=== Analyse de l'écosystème GovTech et dynamique concurrentielle

Le marché du logiciel public territorial (souvent qualifié de *GovTech*) se caractérise par une forte spécificité réglementaire et un haut niveau de barrière à l'entrée. Le paysage concurrentiel se structure autour de trois grandes familles d'acteurs :

- *Les éditeurs généralistes historiques :* Disposant d'un catalogue étendu mais souvent pénalisés par des architectures logicielles héritées (*legacy*) lourdes, ces acteurs peinent à offrir la réactivité et l'ergonomie attendues par les nouvelles générations d'administrés.
- *Les initiatives étatiques centralisées :* Portées par la DINUM, ces plateformes offrent des formulaires génériques gratuits mais ne répondent pas aux besoins d'interconnexion fine avec les progiciels métiers municipaux, ni à la gestion des flux physiques au guichet.
- *Les pure-players SaaS spécialisés :* De nouveaux entrants ciblent des briques isolées (ex. prise de rendez-vous ou billetterie), mais sans disposer de la profondeur fonctionnelle ni de la conformité juridique éprouvée sur l'ensemble de la chaîne administrative.

Dans cet échiquier, Logitud Solutions se différencie par une stratégie d'*écosystème unifié* : combiner la robustesse de 37 ans d'expertise réglementaire avec des interfaces web modernes, ultra-rapides et modulaires.

=== Modèle économique et transition stratégique vers le SaaS

Historiquement fondé sur la vente de licences perpétuelles sur site (*on-premise*) associées à des contrats annuels de maintenance logicielle (modèle Capex), le modèle d'affaires de Logitud a opéré une mutation structurelle vers le *SaaS multi-tenant* par abonnement récurrent (*ARR / MRR*, modèle Opex).

Cette bascule vers le SaaS apporte un triple avantage stratégique :
1. *Pour les collectivités clientes :* Élimination des coûts d'infrastructure serveur locale, mises à jour transparentes et conformité légale garantie en temps réel sans intervention manuelle de techniciens informatiques.
2. *Pour Logitud Solutions :* Prédictibilité accrue des revenus récurrents, centralisation de la maintenance et réduction drastique du coût de déploiement des nouvelles versions.
3. *Pour l'ingénierie logicielle :* Possibilité de déployer des architectures front-end découplées (*Headless* / API-driven) consommant des micro-services ou des API REST mutualisées, accélérant le rythme de livraison de fonctionnalités novatrices.

=== Contraintes réglementaires, sécurité et souveraineté des données

Le développement de solutions logicielles pour le secteur public obéit à des contraintes sensiblement plus strictes que dans l'édition grand public :

- *Continuité de service et résilience :* Les administrations locales ne peuvent tolérer d'interruption lors de temps forts institutionnels (scrutins électoraux nationaux, rentrées scolaires, déclarations de naissance).
- *Protection des données et souveraineté :* En conformité avec le RGPD et le Référentiel Général de Sécurité (*RGS*) de l'ANSSI, les données citoyennes sensibles doivent être chiffrées en transit et au repos, hébergées sur des infrastructures souveraines qualifiées (SecNumCloud) et protégées contre toute fuite ou accès non autorisé.
- *Interopérabilité nationale :* Les applications doivent s'interfacer avec les pivots d'identité de l'État (*FranceConnect*, *FranceConnect+*) et les plateformes d'échange de données inter-administrations (*HubEE*, *Api Droits Sociaux*).

== La plateforme Mon-Guichet et les défis de la dématérialisation

=== Rôle, architecture fonctionnelle et modèle hybride

La plateforme *Mon-Guichet* constitue la vitrine numérique de la collectivité auprès de ses citoyens. Elle fonctionne selon un modèle double complémentaire :

- *Le portail usager :* Un espace public personnalisé permettant aux citoyens de consulter les informations municipales, de prendre des rendez-vous en mairie, de soumettre des demandes administratives (actes d'état civil, inscriptions périscolaires, signalements d'incivilités) et d'effectuer des achats ou réservations en ligne.
- *Le back-office agent :* Une interface d'administration sécurisée permettant aux agents territoriaux de traiter les demandes entrantes, de vérifier les pièces justificatives, de communiquer avec l'administré et de piloter les flux physiques et numériques de la mairie.

Ce double positionnement impose au développement front-end d'adopter deux ergonomies distinctes mais cohérentes : une interface grand public intuitive, épurée et guidée pour les administrés, et une interface métier dense, rapide et optimisée pour la productivité quotidienne des agents.

#align(center)[
  #block(
    fill: rgb("#f8fafc"),
    stroke: 0.5pt + rgb("#cbd5e1"),
    inset: 1em,
    radius: 4pt,
    width: 100%,
    [
      #text(weight: "bold", size: 10.5pt)[Objectif stratégique de la modernisation de Mon-Guichet] \
      #v(0.3em)
      Transformer un système d'information communal historiquement cloisonné en un écosystème SaaS modulaire, garantissant une expérience fluide pour le citoyen et un traitement unifié et automatisé pour les agents municipaux.
    ],
  )
]

=== L'accessibilité numérique comme exigence légale et éthique

Dans le secteur public, l'accessibilité web n'est pas une simple option de confort, mais une obligation légale stricte régie par l'article 47 de la loi du 11 février 2005 et détaillée par le Référentiel Général d’Amélioration de l’Accessibilité (*RGAA 4.1.2*), lui-même aligné sur les critères internationaux *WCAG 2.1 (niveau AA)*.

Chaque citoyen, quelles que soient ses capacités physiques, cognitives ou son équipement technique, doit pouvoir accomplir ses démarches administratives sans discrimination. Cette exigence impose une rigueur extrême dans la conception des interfaces front-end :

- *Contraste des couleurs et lisibilité :* Respect d'un ratio de contraste minimal de 4.5:1 pour les textes normaux et 3.0:1 pour les composants d'interface, y compris lorsque les collectivités personnalisent leur charte graphique aux couleurs de leur blason ou de leur logo.
- *Navigation intégrale au clavier :* Tous les composants interactifs (boutons, formulaires, modales, tiroirs, calendriers) doivent être manipulables sans souris, avec un ordre de tabulation logique et un indicateur de focus nettement visible.
- *Balisage sémantique et compatibilité avec les technologies d'assistance :* Utilisation rigoureuse des balises HTML5 natives et des attributs ARIA (*Accessible Rich Internet Applications*) pour permettre aux logiciels de lecture d'écran (tels que NVDA ou VoiceOver) de restituer fidèlement l'état et la nature des éléments.
- *Tolérance aux erreurs et formulaires guidés :* Les messages de validation et d'erreur doivent être explicites, localisés au plus près des champs concernés et associés à des explications claires pour corriger la saisie.

=== Analyse comparative et choix stratégique du socle technologique

Historiquement, les interfaces de Mon-Guichet reposaient sur une architecture monolithique basée sur Vue 2, l'Options API, et une feuille de style SASS personnalisée. Cette architecture souffrait d'une dette technique croissante : couplage fort entre composants, temps de compilation élevés, difficultés d'évolution stylistique et absence de typage statique.

Pour refondre ce socle, une étude comparative multicritère a été menée pour sélectionner la technologie front-end optimale pour les cinq à dix prochaines années :

#table(
  columns: (1.3fr, 1.2fr, 1.2fr, 1.3fr),
  [Critère d'évaluation], [Vue 2 Legacy], [Next.js / React], [Nuxt 4 / TypeScript (Retenu)],
  [Typage & Sécurité], [JavaScript non typé], [TypeScript strict], [*TypeScript strict de bout en bout*],
  [Rendu Hybride (SSR/SSG)], [SPA monolithique], [SSR / App Router], [*Rendu hybride universel (Nitro)*],
  [Système de Composants], [Composants SASS ad hoc], [Shadcn / Radix], [*Nuxt UI v4 + Tailwind CSS*],
  [Courbe d'apprentissage équipe], [Maîtrisé (Legacy)], [Rupture de paradigme], [*Continuité Vue Composition API*],
  [Accessibilité native], [Manuelle (faible)], [Bonne (Radix)], [*Excellente (Reka UI)*],
  [Écosystème & DX], [Build Webpack lent], [Écosystème riche], [*Vite ultra-rapide, auto-imports*],
)

Le choix de *Nuxt 4 combiné à TypeScript strict et Nuxt UI v4* a été validé car il offrait le meilleur équilibre entre sécurité de typage, rapidité de développement (*Developer Experience*), conformité d'accessibilité native et capitalisation sur l'expertise Vue.js existante au sein de l'équipe de Logitud.

=== Sécurité applicative, DevSecOps et identités régaliennes

Dans le cadre du traitement de données citoyennes sensibles (état civil, inscriptions scolaires, transactions financières municipales), la sécurité ne peut être abordée comme une simple étape finale de validation. Elle a été intégrée nativement selon les principes du *Shift-Left Security* (DevSecOps) :

- *Protection contre les vulnérabilités web (OWASP Top 10) :* Élimination des risques d'injection XSS grâce à l'échappement automatique des templates Vue, assainissement strict des entrées utilisateur via Zod, et protection contre les attaques CSRF par l'utilisation de cookies de session `HttpOnly`, `Secure` et `SameSite=Strict`.
- *Analyse statique et gestion des dépendances :* Intégration dans les pipelines d'intégration continue d'analyses de vulnérabilités automatiques (`npm audit`, analyse statique de sécurité SAST) bloquant toute dépendance compromise.
- *Fédération d'identité régalienne :* Interconnexion avec les passerelles *FranceConnect* et *FranceConnect+* pour garantir une authentification forte des administrés tout en respectant le principe de minimisation des données prescrit par la CNIL.

== Trajectoire de 4 ans et positionnement de l'alternant

=== Une continuité de parcours au service de la montée en compétences

Mon parcours au sein de Logitud Solutions s'inscrit dans une durée continue de quatre années d'alternance, structurée en deux cycles académiques complémentaires :

- *Période 2022 - 2024 (2 ans) :* BUT Métiers du Multimédia et de l'Internet (MMI) à l'IUT de Haguenau (Université de Strasbourg). Cette première phase a été consacrée à l'apprentissage pratique du développement front-end, à l'intégration de maquettes, à la découverte des outils de versioning collaboratif (Git) et à l'assimilation des contraintes du secteur des collectivités territoriales.
- *Période 2024 - 2026 (2 ans) :* Mastère Expert en développement logiciel à Ynov Campus Strasbourg. Cette seconde phase a marqué une montée en puissance vers la conception d'architectures logicielles, la standardisation des outillages de développement, la création de composants génériques avancés et la prise de décisions techniques structurantes en coordination avec les équipes de développement.

#table(
  columns: (1.1fr, 1.8fr, 2.1fr),
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

L'organisation du travail au sein de l'équipe d'ingénierie repose sur des pratiques agiles et un outillage moderne calibré pour l'édition logicielle :

- *Gestion de version et revue de code :* Utilisation de GitHub avec une stratégie de branches dérivée de GitFlow. Chaque fonctionnalité donne lieu à une Pull Request soumise à une relecture obligatoire par les pairs.
- *Industrialisation CI/CD et environnements éphémères :* Configuration d'un pipeline GitHub Actions automatisé qui exécute en environ 3 minutes l'ensemble des vérifications : contrôle des types (`vue-tsc`), linter ESLint, suite de tests unitaires Vitest, et déploiement automatique d'un environnement de préproduction temporaire dédié à la Pull Request pour validation fonctionnelle par les équipes produit.
- *Suivi des tâches et documentation :* Utilisation de Linear pour la gestion des cycles et l'affectation des tickets, complété par Notion pour la documentation d'architecture technique et les guides de contribution internes.
- *Collaboration pluridisciplinaire :* Échanges quotidiens sur Slack et points de cadrage hebdomadaires réunissant le lead front, le designer UI/UX sous Figma et les développeurs back-end afin d'ajuster les contrats d'interface (API) et les contraintes ergonomiques.


