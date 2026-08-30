// -------------------------------------------------------------
// PAGES LIMINAIRES : RÉSUMÉ EXÉCUTIF & REMERCIEMENTS
// -------------------------------------------------------------

#page(header: none)[
  #v(1em)
  #text(size: 16pt, weight: "bold")[Résumé Exécutif]
  #v(0.8em)
  
  Ce rapport d'expérience professionnelle retrace quatre années d'immersion au sein de l'entreprise Logitud Solutions, éditeur de référence de logiciels pour les collectivités territoriales, dans le cadre de l'obtention du titre de Mastère 2 Expert en Développement Web à Ynov Campus Strasbourg.
  
  Après deux années initiales de BUT MMI consacrées à l'assimilation des fondamentaux du développement web et de l'environnement métier des services publics, ces deux dernières années en cycle Mastère ont marqué un tournant stratégique. Face aux exigences croissantes de modernisation des services aux citoyens, mes missions se sont articulées autour de la conception d'architectures front-end robustes, scalables et accessibles.
  
  Le présent document détaille la réalisation de projets d'envergure, en particulier le développement d'un moteur modulaire de billetterie et de vente en ligne sous Nuxt 4 et TypeScript, la mise en œuvre d'une solution de gestion de file d'attente connectée en temps réel avec borne tactile interactive, ainsi que la refonte ergonomique et technique de la plateforme Mon-Guichet. Au-delà des choix techniques, ce mémoire met en lumière l'industrialisation des méthodes de développement, la gestion des exigences des parties prenantes et l'impact mesurable de ces innovations sur l'efficacité des agents territoriaux et la satisfaction des usagers.



  #v(1.5em)
  #text(size: 14pt, weight: "bold")[Remerciements]
  #v(0.8em)
  
  Je tiens à exprimer ma sincère reconnaissance à l'ensemble des personnes qui ont contribué à la réussite de mon parcours universitaire et professionnel au cours de ces quatre années :
  
  - À Monsieur Stéphane Holtz et Madame Virginie Jacquemin, pour leur confiance renouvelée depuis mes débuts chez Numesia puis tout au long de l'intégration au sein de Logitud Solutions.
  - À l'équipe technique de Strasbourg et de Mulhouse — développeurs, concepteurs et chefs de projet — pour la richesse de nos échanges quotidiens, la bienveillance et la rigueur partagée au service de nos solutions.
  - À l'équipe pédagogique et aux intervenants d'Ynov Campus Strasbourg pour la qualité de leur accompagnement et des enseignements dispensés tout au long de ce cycle Mastère.
  
  #pagebreak()
]

// -------------------------------------------------------------
// TABLE DES MATIÈRES & GLOSSAIRE
// -------------------------------------------------------------
#page(header: none)[
  #v(1em)
  #text(size: 16pt, weight: "bold")[Table des Matières]
  #v(1em)
  
  #show outline.entry.where(level: 1): it => {
    v(1.2em, weak: true)
    strong(it)
  }
  #outline(title: none, indent: 1.5em, depth: 2)
  
  #v(2.5em)
  #line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))
  #v(1.5em)
  
  #text(size: 14pt, weight: "bold")[Glossaire & Acronymes]
  #v(0.8em)
  
  #table(
    columns: (auto, 1fr),
    [Acronyme], [Définition],
    [API], [Application Programming Interface - Interface de communication logicielle],
    [CI / CD], [Continuous Integration / Continuous Delivery - Intégration et déploiement continus],
    [DX], [Developer Experience - Qualité et ergonomie de l'environnement de développement],
    [GRU / GRC], [Gestion de la Relation Usager / Citoyen dans les collectivités territoriales],
    [KPI], [Key Performance Indicator - Indicateur clé de performance mesurable],
    [RGAA], [Référentiel Général d'Amélioration de l'Accessibilité (norme française)],
    [SSR / SSG], [Server-Side Rendering / Static Site Generation - Modes de rendu web],
    [UI / UX], [User Interface / User Experience - Conception d'interface et expérience utilisateur],
    [WCAG], [Web Content Accessibility Guidelines - Standards internationaux d'accessibilité],
    [WS], [WebSocket - Protocole de communication bidirectionnelle temps réel]
  )
  
  #pagebreak()
]
