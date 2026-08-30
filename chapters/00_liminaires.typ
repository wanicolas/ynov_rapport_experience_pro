// -------------------------------------------------------------
// PAGES LIMINAIRES : RÉSUMÉ EXÉCUTIF & REMERCIEMENTS
// -------------------------------------------------------------

#page(header: none)[
  #v(1em)
  #text(size: 16pt, weight: "bold")[Résumé Exécutif]
  #v(0.8em)

  Ce rapport d'expérience professionnelle retrace quatre années d'immersion continue au sein de l'entreprise Logitud Solutions, éditeur de référence de logiciels pour les collectivités territoriales, dans le cadre de l'obtention du titre de Mastère 2 Expert en développement logiciel à Ynov Campus Strasbourg.

  Après deux années initiales de BUT MMI consacrées à l'acquisition des fondamentaux du développement web et à la découverte de l'écosystème territorial, les deux années du cycle Mastère ont concrétisé une montée en puissance vers des responsabilités d'architecture logicielle, d'arbitrage technique et de gouvernance de la qualité front-end. Face aux impératifs croissants de modernisation des services publics, mon action s'est concentrée sur la transition d'interfaces historiques vers un écosystème SaaS modulaire, hautement performant et nativement accessible.

  Le présent mémoire détaille la conduite de projets stratégiques à fort impact : la conception de l'architecture du moteur modulaire de billetterie et de vente en ligne sous Nuxt 4 et TypeScript strict (ayant généré plus de 150 000 € de transactions dès ses premiers mois d'exploitation pour la Ville de Mulhouse), le développement de la solution de gestion de file d'attente connectée en temps réel PopQueue via WebSockets (Laravel Reverb) avec borne tactile interactive, ainsi que la refonte ergonomique et technique de la plateforme Mon-Guichet v2.

  Au-delà des réalisations techniques, ce document analyse la dimension stratégique et managériale du rôle de référent technique : la conduite du changement face au durcissement des standards de code, l'optimisation de l'expérience développeur (DX), l'industrialisation des pipelines CI/CD (avec déploiement d'environnements éphémères de test pour chaque Pull Request et 85 % de couverture de tests), ainsi que la gestion concertée des exigences avec l'ensemble des parties prenantes.

  #v(1.5em)
  #text(size: 14pt, weight: "bold")[Remerciements]
  #v(0.8em)

  Je tiens à exprimer ma sincère reconnaissance à l'ensemble des personnes qui ont accompagné et enrichi mon parcours universitaire et professionnel au cours de ces quatre années :

  - À Monsieur Stéphane Holtz et Madame Virginie Jacquemin, pour leur confiance renouvelée depuis mes débuts chez Numesia puis tout au long de l'intégration au sein de Logitud Solutions.
  - À l'équipe technique de Strasbourg et de Mulhouse — développeurs, architectes, concepteurs et chefs de projet — pour la richesse de nos échanges quotidiens, la confiance accordée lors des arbitrages techniques et la rigueur partagée au service de nos solutions.
  - À l'équipe pédagogique et aux intervenants professionnels d'Ynov Campus Strasbourg pour l'exigence de leur accompagnement et la qualité des enseignements dispensés tout au long de ce cycle Mastère.

  #pagebreak()
]

// -------------------------------------------------------------
// TABLE DES MATIÈRES & GLOSSAIRE
// -------------------------------------------------------------
#page(header: none)[
  #v(1em)
  #text(size: 16pt, weight: "bold")[Table des Matières]
  #v(0.8em)

  #show outline.entry.where(level: 1): it => {
    v(1em, weak: true)
    strong(it)
  }
  #outline(title: none, indent: 1.5em, depth: 2)

  #v(1.8em)
  #line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))
  #v(1em)

  #text(size: 14pt, weight: "bold")[Glossaire & Acronymes]
  #v(0.6em)

  #table(
    columns: (auto, 1fr),
    [Acronyme], [Définition],
    [API], [Application Programming Interface - Interface de communication logicielle],
    [CI / CD], [Continuous Integration / Continuous Delivery - Intégration et déploiement continus],
    [DORA], [DevOps Research and Assessment - Métriques de performance de livraison logicielle],
    [DX], [Developer Experience - Qualité, ergonomie et vélocité de l'outillage de développement],
    [GRU / GRC], [Gestion de la Relation Usager / Citoyen dans les collectivités territoriales],
    [KPI], [Key Performance Indicator - Indicateur clé de performance mesurable],
    [Reverb], [Serveur de WebSockets natif haute performance pour l'écosystème Laravel],
    [RGAA], [Référentiel Général d'Amélioration de l'Accessibilité (norme légale française)],
    [ROI], [Return On Investment - Retour sur investissement financier ou organisationnel],
    [SSR / SSG], [Server-Side Rendering / Static Site Generation - Modes de rendu web hybrides],
    [UI / UX], [User Interface / User Experience - Conception d'interface et expérience utilisateur],
    [WCAG], [Web Content Accessibility Guidelines - Standards internationaux d'accessibilité (W3C)],
    [WS], [WebSocket - Protocole de communication bidirectionnelle temps réel],
  )

  #pagebreak()
]
