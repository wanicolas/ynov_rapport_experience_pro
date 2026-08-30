// -------------------------------------------------------------
// CHAPITRE II : RÉALISATIONS & PROJETS TECHNIQUES
// -------------------------------------------------------------

= Réalisations & Projets Techniques

== Projet Phare (1 an) : Moteur de vente en ligne et billetterie modulaire

=== Contexte, enjeux métiers et socle technologique

Dans le cadre de la modernisation de ses services municipaux, la Ville de Mulhouse a confié à Logitud Solutions la conception d'un système complet de vente en ligne et de billetterie destiné à ses établissements aquatiques. L'objectif était de remplacer un dispositif hétérogène par un moteur moderne, interconnecté à la plateforme Mon-Guichet, capable de traiter l'ensemble des transactions citoyennes : entrées unitaires à la journée, abonnements annuels, cours d'apprentissage et de perfectionnement (natation, aquagym), ainsi que des stages thématiques saisonniers.

Pour répondre aux exigences de scalabilité et de pérennité, j'ai été chargé de définir et d'implémenter l'architecture front-end de ce nouveau produit. Le choix s'est porté sur un socle technique de dernière génération articulé autour de :

- *Nuxt 4 et Vue 3 :* Utilisation du framework full-stack avec la structure applicative moderne, tirant parti de la Composition API, du rendu hybride et des mécanismes d'auto-importation pour une maintenabilité optimale.
- *TypeScript en mode strict :* Typage rigoureux de l'ensemble des flux de données, des modèles métiers et des réponses de l'API back-end, éliminant les erreurs d'exécution à la source.
- *Nuxt UI v4 et Tailwind CSS :* Utilisation d'un système de composants headless et stylisés garantissant la cohérence visuelle, l'accessibilité native et une grande flexibilité d'adaptation graphique.
- *Outillage de qualité et intégration continue (CI/CD) :* Mise en place de règles de formatage et de détection d'erreurs avec ESLint, TypeScript et Prettier, couplées à une suite de tests unitaires sous Vitest. Un pipeline d'intégration continue via GitHub Actions a été configuré pour exécuter automatiquement la vérification des types (`tsc`), le linter et les tests lors de chaque Pull Request.

=== Conception de composants d'infrastructure avancés

Afin d'éviter la duplication de logique métier et d'accélérer les développements au sein de l'équipe, j'ai conçu une bibliothèque de composants génériques hautement configurables.

==== La surcouche DataTable personnalisée

La manipulation de tableaux denses est au cœur de l'activité quotidienne des agents administratifs (suivi des réservations, listes d'inscrits, gestion des transactions). J'ai développé une surcouche avancée au composant de tableau de base, apportant des fonctionnalités professionnelles indispensables :

#figure(
  image("../assets/images/mg_shop/datatable_rowactions.png", width: 92%),
  caption: [Composant DataTable avec sélecteur de colonnes visibles et actions contextuelles par ligne],
)

- *Gestion dynamique des colonnes affichées :* Grâce à un menu déroulant intégrant des cases à cocher, l'agent peut masquer ou afficher à la volée les colonnes dont il a besoin, adaptant l'interface à sa tâche sans surcharger l'écran.
- *Boutons d'actions contextuels par ligne :* Chaque enregistrement propose un menu d'actions directes (consultation de facture, modification, annulation, remboursement), évitant des allers-retours fastidieux dans les menus de navigation.
- *Tri et filtrage hybrides (Front / Back) :* Un arbitrage technique majeur a consisté à implémenter un double moteur de tri et de recherche. Pour des ensembles de données comprenant jusqu'à 6 000 enregistrements, le tri et le filtrage sont exécutés instantanément en mémoire côté navigateur (client-side). Cela supprime tout délai de latence réseau, allège la charge des serveurs et procure une fluidité d'usage remarquable pour l'agent. Pour des volumes massifs nécessitant une pagination distante, le composant bascule de manière transparente sur un traitement côté serveur via l'API.
- *Exports natifs CSV et PDF via `defineExpose` :* Le composant expose ses données internes formatées ainsi que l'état de ses filtres actifs aux composants parents. Lorsqu'une cellule contient un rendu visuel complexe (par exemple un badge coloré indiquant un statut de paiement), le mécanisme permet de substituer une valeur textuelle propre pour garantir un export propre et immédiatement exploitable sous Excel ou en PDF.

#figure(
  image("../assets/images/mg_shop/datatable_export.png", width: 92%),
  caption: [Fenêtre de configuration et d'export personnalisé des données du tableau],
)

#pagebreak()

==== Le système de tiroirs empilables (Stackable Drawers)

Dans les applications administratives complexes, l'ouverture successive de fenêtres modales classiques entraîne fréquemment une perte de repères pour l'utilisateur. Pour résoudre ce problème, j'ai conçu un système de panneaux latéraux coulissants empilables (*Stackable Drawers*).

#figure(
  image("../assets/images/mg_shop/drawer_multi_panel.png", width: 92%),
  caption: [Système de tiroirs latéraux empilables permettant la navigation multi-niveaux sans rupture de contexte],
)

Ce système permet à un agent, lorsqu'il consulte une commande, d'ouvrir un tiroir latéral pour visualiser le profil de l'usager, puis un second panneau pour consulter le détail d'une transaction bancaire liée. Les panneaux se superposent avec un décalage visuel et une gestion stricte des plans de profondeur (*z-index*), du piège de focus clavier (*focus trap*) pour l'accessibilité, et de la fermeture ordonnée par touche Échap ou clic externe. L'agent conserve ainsi en permanence la visibilité sur son fil de navigation.

==== Audit, traçabilité et productivité

La gestion des deniers publics et des inscriptions municipales exige une traçabilité rigoureuse de chaque action administrative.

- *Palette de commandes globale :* Intégration d'une interface de recherche universelle accessible via un raccourci clavier (`Ctrl+K`), permettant de rechercher instantanément un usager, un numéro de dossier ou un raccourci de navigation.
- *Visualiseur de différences JSON (Git-diffs) :* Afin de permettre aux administrateurs de comprendre immédiatement les modifications apportées à un dossier ou à une grille tarifaire, j'ai développé un composant de visualisation comparative des structures JSON avant et après modification. L'agent peut basculer entre une vue scindée (*split view*) et une vue unifiée (*unified view*), les ajouts, suppressions et modifications étant mis en évidence par un code couleur universel.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  figure(
    image("../assets/images/mg_shop/gitdiff_split.png", width: 100%),
    caption: [Visualisation différentielle en mode scindé (Split)],
  ),
  figure(
    image("../assets/images/mg_shop/gitdiff_unified.png", width: 100%),
    caption: [Visualisation différentielle en mode unifié (Unified)],
  ),
)

#pagebreak()

==== Tableaux de bord décisionnels interactifs

Afin d'offrir aux directeurs d'équipements sportifs et aux élus municipaux une vision claire de la fréquentation et des recettes, j'ai intégré la bibliothèque *Apache ECharts* au sein de composants Vue réactifs. Ces graphiques permettent d'analyser en temps réel les volumes de vente, la répartition par typologie de tarif (plein tarif, tarif résident, réductions sociales) ainsi que les créneaux horaires les plus sollicités.

#figure(
  image("../assets/images/mg_shop/echarts_graph.png", width: 90%),
  caption: [Tableau de bord de suivi des ventes et de fréquentation réalisé avec Apache ECharts],
)

=== Les parcours utilisateurs et la logique transactionnelle

==== Le parcours usager (citoyen)

L'expérience citoyenne a été conçue pour offrir un parcours d'achat clair, rassurant et accessible :

- *Sélection des prestations et créneaux :* L'usager consulte le catalogue, choisit sa formule (entrée unitaire, carnet de tickets, abonnement saisonnier ou inscription à un cours d'aquagym) et sélectionne ses créneaux sur un calendrier interactif qui vérifie en temps réel les jauges maximales autorisées.
- *Panier réactif et tunnel d'achat :* Le panier d'achat recalcule dynamiquement les totaux, applique les règles d'éligibilité tarifaire et guide l'administré jusqu'au paiement sécurisé.
- *Gestion unifiée et résiliente des erreurs :* Pour éviter toute frustration en cas de panne réseau ou de créneau devenu indisponible entre-temps, j'ai mis en place un système d'intercepteurs de requêtes `fetch`. Les erreurs mineures sont signalées par des notifications discrètes (*toasts*), tandis que les erreurs nécessitant une décision explicite (session expirée, justificatif manquant) déclenchent des boîtes de dialogue modales détaillant la marche à suivre.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  figure(
    image("../assets/images/mg_shop/user_buy.png", width: 100%),
    caption: [Interface citoyenne de sélection d'une prestation aquatique],
  ),
  figure(
    image("../assets/images/mg_shop/user_cart.png", width: 100%),
    caption: [Vue détaillée du panier d'achat et validation de commande],
  ),
)

==== Le parcours agent (guichet physique)

Le système intègre également un mode « Vente guichet » destiné aux agents d'accueil situés physiquement à l'entrée des piscines. Cette interface permet d'effectuer les mêmes opérations d'inscription et de vente pour le compte d'un usager présent au comptoir, avec une saisie rapide au clavier et un encaissement direct (espèces, chèques, carte bancaire physique).

#pagebreak()

== Projet 2 (4 mois) : Gestion de file d'attente connectée & Borne tactile (PopQueue)

=== Contexte et objectifs du projet

La gestion de l'accueil physique en mairie représente un défi majeur pour les collectivités territoriales. Les temps d'attente mal régulés engendrent du stress pour les administrés et une désorganisation des services municipaux. Pour répondre à cet enjeu, Logitud Solutions a développé *PopQueue*, un système modulaire de gestion de file d'attente connecté à l'écosystème Mon-Guichet.

Le dispositif relie trois composants matériels et logiciels synchronisés :
1. Une *borne tactile d'accueil* (ou tablette) installée à l'entrée de l'hôtel de ville, permettant à l'usager de prendre un ticket ou de signaler sa présence pour un rendez-vous planifié.
2. Un *écran d'affichage collectif* placé en salle d'attente pour diffuser les appels de numéros et les informations municipales.
3. Une *console logicielle agent* permettant aux agents communaux d'appeler les usagers à leur guichet et de superviser le flux global de l'établissement.

#figure(
  image("../assets/images/popqueue/supervision_globale_bo.jpg", width: 90%),
  caption: [Tableau de bord de supervision globale des flux et des guichets en temps réel],
)

=== Back-office agent et supervision temps réel via WebSockets

Pour garantir une coordination sans faille entre les différents postes de travail, la communication entre les bornes, les serveurs et les consoles agents repose sur le protocole *WebSocket*. Contrairement à des requêtes périodiques régulières (*polling*) qui surchargent le réseau et introduisent un décalage de plusieurs secondes, les WebSockets assurent une diffusion instantanée et bidirectionnelle des événements :

- Dès qu'un usager tire un ticket à la borne, le tableau de bord de supervision des responsables de service se met à jour en temps réel.
- Lorsqu'un agent termine son entretien et clique sur « Appeler le suivant », le numéro du ticket est immédiatement envoyé à l'écran de la salle d'attente, accompagné d'un carillon sonore et d'un guidage visuel vers le numéro de guichet attribué.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  figure(
    image("../assets/images/popqueue/console_agent_guichet.jpg", width: 100%),
    caption: [Console individuelle de l'agent au guichet pour l'appel et le traitement du ticket],
  ),
  figure(
    image("../assets/images/popqueue/affichage_salle.jpg", width: 100%),
    caption: [Écran de diffusion dynamique installé en salle d'attente],
  ),
)

#pagebreak()

=== Interface usager sur borne tactile et clavier virtuel sur mesure

L'interface de la borne d'accueil physique imposait des contraintes ergonomiques et matérielles très spécifiques :

#figure(
  image("../assets/images/popqueue/choix_demarche.jpg", width: 85%),
  caption: [Interface tactile de sélection de la démarche administrative sur la borne d'accueil],
)

- *Ergonomie pour écran tactile :* Les boutons de sélection de thèmes et de démarches ont été dimensionnés avec des zones de contact élargies (minimum 48x48 pixels) et des contrastes renforcés, garantissant une utilisation aisée pour les personnes âgées ou à mobilité réduite.
- *Conception d'un clavier virtuel sur mesure :* Lorsqu'un citoyen doit saisir son nom ou son numéro de dossier pour signaler sa présence à un rendez-vous, l'utilisation du clavier virtuel natif du système d'exploitation (Android / iOS / Windows) posait de lourds problèmes : décalage intempestif de la mise en page, apparition de barres d'outils non désirées en mode kiosque, et propositions de saisie automatique inadaptées.

#figure(
  image("../assets/images/popqueue/clavier.jpg", width: 85%),
  caption: [Clavier virtuel sur mesure, optimisé pour la saisie tactile sur borne d'accueil],
)

Pour surmonter ces obstacles, j'ai développé un composant de clavier virtuel sur mesure. Ce composant présente une disposition simplifiée, restreinte aux caractères alphabétiques, numériques et symboles nécessaires aux démarches administratives. Il garantit une réactivité tactile instantanée, s'intègre parfaitement à la charte graphique de l'application et élimine tout risque de blocage lié au système d'exploitation de la tablette.

#pagebreak()

== Projet 3 (4 mois) : Refonte globale UI/UX et Front-End de Mon-Guichet v2

=== Modernisation ergonomique et transition technologique

La plateforme *Mon-Guichet* constitue le cœur de l'offre de dématérialisation citoyenne de Logitud Solutions. La première version de la plateforme, bien que fonctionnelle, souffrait d'une ergonomie vieillissante et d'un socle technique reposant sur Vue 2 et des feuilles de style SASS personnalisées, rendant les évolutions graphiques complexes.

J'ai participé activement à la refonte complète du portail usager (Mon-Guichet v2) en migrant l'ensemble des pages vers *Nuxt 4* et *Tailwind CSS*.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  figure(
    image("../assets/images/mon-guichet/home_v1.png", width: 100%),
    caption: [Mon-Guichet v1 : Interface historique avec mise en page classique],
  ),
  figure(
    image("../assets/images/mon-guichet/home_v2.jpg", width: 100%),
    caption: [Mon-Guichet v2 : Interface modernisée, aérée et organisée par tuiles thématiques],
  ),
)

=== Apports de la refonte pour les usagers et les collectivités

Cette refonte a permis d'atteindre trois objectifs majeurs :
1. *Clarté de navigation :* L'organisation des démarches par tuiles thématiques illustrées permet aux administrés d'identifier immédiatement le service recherché (état civil, petite enfance, urbanisme, signalement).
2. *Accessibilité numérique :* Reprise intégrale des contrastes de couleurs, structuration sémantique des titres et compatibilité totale avec la navigation au clavier et les lecteurs d'écran, garantissant la conformité avec le standard RGAA.
3. *Personnalisation facilitée pour les collectivités :* Grâce aux variables de configuration de Tailwind CSS, chaque mairie cliente peut désormais appliquer facilement sa propre charte graphique (couleur primaire, typographie, logo) sans risque de régression sur les composants de base.

== Projet 4 (4 mois) : Optimisation de performance et intégration Place de Marché

=== Réduction de la dette technique et optimisation CSS

Le logiciel de gestion des places de marché permet aux régisseurs municipaux de gérer les emplacements des commerçants non sédentaires lors des marchés forains et foires locales. L'application comportait historiquement une part importante de scripts JavaScript utilisés pour gérer des mises en page conditionnelles et des ajustements visuels.

Ma mission a consisté à réaliser une refactorisation en profondeur de l'interface :
- *Remplacement de JavaScript par du CSS moderne :* Élimination des calculs de positionnement et de dimensionnement en JS au profit des fonctionnalités natives de CSS3 et de Tailwind CSS (*CSS Grid*, *Flexbox*, positionnement *sticky*).
- *Amélioration des performances de rendu :* La suppression du code JavaScript superflu a permis de réduire le poids des pages, d'accélérer le temps d'affichage initial et d'éliminer les micro-saccades lors du défilement des listes d'emplacements.
- *Intégration fidèle des maquettes Figma :* Collaboration étroite avec le designer d'interface pour assurer une restitution parfaite des maquettes graphiques tout en préservant une structure de code propre et maintenable.
