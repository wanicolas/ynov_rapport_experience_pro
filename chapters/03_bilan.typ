// -------------------------------------------------------------
// CHAPITRE III : ANALYSE RÉFLEXIVE, STRATÉGIQUE & BILAN DE COMPÉTENCES
// -------------------------------------------------------------

= Analyse Réflexive, Stratégique & Bilan de Compétences

== Vision stratégique, innovation et gouvernance technique

=== Impact de la modernisation sur l'expérience développeur (DX) et la vélocité

L'évolution du socle technologique de Logitud Solutions vers un environnement moderne articulé autour de Nuxt 4, de TypeScript strict et de Nuxt UI v4 ne répond pas uniquement à des exigences esthétiques ou fonctionnelles. Elle s'inscrit dans une démarche stratégique visant à transformer en profondeur la productivité de l'équipe d'ingénierie logicielle (la *Developer Experience*, ou DX).

Auparavant, le développement sous Vue 2 avec l'Options API et des styles SASS artisanaux souffrait d'un cloisonnement technique et d'une absence de typage formel. Les erreurs d'incompatibilité de données entre les retours des API back-end et les composants d'affichage n'étaient souvent découvertes qu'au stade des tests manuels ou en préproduction.

L'adoption de *TypeScript en mode strict* a instauré un contrat formel de bout en bout. Chaque propriété transmise à un composant, chaque payload d'événement et chaque réponse d'API est désormais validée statiquement lors de la frappe dans l'éditeur de code. Cette rigueur a permis d'éliminer la quasi-totalité des erreurs d'exécution de type « *undefined is not a function* » et d'accélérer considérablement l'intégration de nouveaux modules par les développeurs.

#v(0.4em)
#table(
  columns: (1.4fr, 1.8fr, 1.8fr),
  [Critère d'ingénierie], [Architecture historique (Legacy)], [Nouvelle architecture moderne],
  [Typage des données], [JavaScript non typé (risques à l'exécution)], [TypeScript strict (sécurité statique totale)],
  [Composants d'interface],
  [Composants hétérogènes et styles SASS isolés],
  [Design System unifié sous Nuxt UI v4 / Tailwind],

  [Validation de qualité], [Relecture manuelle et tests tardifs], [CI automatique (Lint, Typecheck, Tests Vitest 85%)],
  [Temps d'intégration], [Intégration d'écran longue et répétitive], [Composants modulaires partagés et auto-importés],
)
#v(0.4em)

=== Standardisation de l'architecture et réduction de la dette technique

Dans un modèle d'édition logicielle multi-collectivités, la duplication de code constitue le principal vecteur d'obsolescence et de surcoût de maintenance. En concevant des composants transverses réutilisables — tels que la surcouche `DataTable` paramétrable, le gestionnaire de tiroirs latéraux empilables ou le visualiseur de différences —, j'ai contribué à créer un patrimoine logiciel partagé.

Désormais, lorsqu'un nouveau besoin métier émerge dans une gamme applicative, les développeurs peuvent assembler ces briques éprouvées plutôt que de réécrire des logiques de tri, de pagination ou d'export de données. Cette rationalisation garantit une homogénéité parfaite des comportements pour les utilisateurs finaux tout en réduisant d'environ 40 % le temps d'intégration des nouveaux modules.

=== Prospective technologique : Étude exploratoire de l'IA et questions en suspens

==== Une démarche de R&D exploratoire et responsable

L'émergence rapide des technologies d'intelligence artificielle générative et de vision par ordinateur ouvre des opportunités de modernisation considérables pour la relation citoyenne. Au sein de Logitud Solutions, l'intégration potentielle de ces briques au cœur de la plateforme *Mon-Guichet* fait actuellement l'objet d'une *étude prospective approfondie en R&D pour les versions futures*.

Toutefois, le déploiement d'intelligences artificielles dans le secteur public local ne peut être guidé par un simple effet de mode technologique : il impose une grille d'analyse lucide, mesurant les bénéfices attendus à l'aune des nombreuses questions techniques, juridiques, éthiques et financières qui demeurent aujourd'hui en suspens.

#v(0.4em)
#align(center)[
  #block(
    fill: rgb("#f8fafc"),
    stroke: 0.5pt + rgb("#cbd5e1"),
    inset: 0.8em,
    radius: 4pt,
    width: 100%,
    [
      #text(weight: "bold", size: 10pt)[Axes de R&D en étude prospective et questionnements associés] \
      #v(0.4em)
      #grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 0.5em,
        block(fill: rgb("#eff6ff"), stroke: 0.5pt + rgb("#93c5fd"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8pt, fill: rgb("#1e40af"))[1. RAG Territorial]\
            #text(size: 7pt, fill: rgb("#1e3a8a"))[Guidage conversationnel\ Question en suspens :\ Hallucinations & responsabilité]
          ]
        ],
        block(fill: rgb("#fef3c7"), stroke: 0.5pt + rgb("#fcd34d"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8pt, fill: rgb("#92400e"))[2. Vision & OCR Client]\
            #text(size: 7pt, fill: rgb("#78350f"))[Pré-contrôle justificatifs\ Question en suspens :\ Faux négatifs & AI Act]
          ]
        ],
        block(fill: rgb("#f1f5f9"), stroke: 0.5pt + rgb("#cbd5e1"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8pt, fill: rgb("#334155"))[3. Sobriété & Coûts]\
            #text(size: 7pt, fill: rgb("#475569"))[Inférence souveraine\ Question en suspens :\ ROI GPU vs Déterministe]
          ]
        ],
      )
    ],
  )
]
#v(0.4em)

==== Piste 1 en étude : L'orientation citoyenne par RAG territorial

Le premier cas d'usage à l'étude concerne la mise en place d'un assistant d'orientation citoyenne s'appuyant sur une architecture de génération augmentée par récupération (*Retrieval-Augmented Generation* ou RAG). L'objectif serait de permettre aux administrés d'exprimer leurs besoins en langage naturel (« _Je viens d'emménager, comment inscrire mon enfant à la cantine et faire ma carte de stationnement ?_ ») et de les orienter instantanément vers les démarches administratives appropriées.

Cependant, plusieurs verrous majeurs font l'objet d'arbitrages critiques :
- *Risque d'hallucination et engagement de la responsabilité publique :* Dans l'administration, une information erronée (ex: délais de recours contentieux, conditions de ressources erronées pour une aide sociale) engage directement la responsabilité juridique de la mairie. Comment garantir un taux d'exactitude factuelle de 100 % sur des corpus administratifs complexes ?
- *Souveraineté des données et conformité SecNumCloud :* Les requêtes citoyennes peuvent contenir des éléments de vie privée. Il est exclu d'utiliser des APIs d'acteurs commerciaux extra-européens. Le déploiement de modèles de langage *open-weights* (ex: Mistral AI) sur des infrastructures souveraines qualifiées SecNumCloud représente un coût d'inférence GPU élevé, posant la question de l'accessibilité financière pour les communes de taille intermédiaire.
- *Volatilité de la réglementation locale :* Les règlements intérieurs, tarifs municipaux et délibérations évoluent à chaque conseil municipal. Le maintien d'un index vectoriel parfaitement synchronisé sans introduire d'anachronismes documentaires constitue un défi d'ingénierie non résolu.

==== Piste 2 en étude : Le pré-contrôle des pièces justificatives par vision

Le second axe d'étude porte sur l'analyse automatisée des pièces justificatives téléversées par les usagers (justificatif de domicile, pièce d'identité, attestation de quotient familial) afin d'assister les agents communaux dans leur travail d'instruction quotidien.

Ce chantier soulève également d'importantes questions en suspens :
- *Inférence côté client (WebAssembly / On-Device) vs Inférence serveur :* L'exécution locale de modèles légers de vision par ordinateur via WebAssembly (Tesseract WASM) au sein du navigateur de l'administré présenterait l'avantage de préserver une confidentialité absolue (aucun document n'est envoyé à un serveur tiers avant validation) et d'économiser de la bande passante. En contrepartie, les disparités d'équipements (smartphones d'entrée de gamme) posent un risque d'échec d'exécution ou de ralentissement sévère pour l'utilisateur.
- *Risque de faux négatifs et rupture d'accès aux droits :* Le rejet algorithmique automatisé d'un document froissé ou mal cadré, mais pourtant parfaitement exploitable par un œil humain, risque de créer de la frustration et d'exclure les administrés les plus éloignés du numérique. La décision humaine de rejet doit impérativement rester la seule règle applicable.
- *Conformité avec l'AI Act européen :* L'Union Européenne classe les systèmes d'IA intervenant dans l'accès aux services publics et aux prestations sociales comme des systèmes à haut risque, imposant des obligations draconiennes d'auditabilité, d'évaluation des biais et de documentation technique.

==== Arbitrage fondamental : Sobriété numérique vs IA probabiliste

L'ensemble de ces réflexions prospectives conduit à une interrogation centrale d'architecture logicielle : _l'apport d'une brique d'IA probabiliste compense-t-il la complexité opérationnelle, la consommation énergétique et les coûts d'infrastructure par rapport à une automatisation déterministe rigoureuse ?_

Pour l'heure, Logitud Solutions privilégie la perfection ergonomique de ses formulaires guidés, la validation statique stricte des données de saisie et l'accessibilité universelle, tout en maintenant cette cellule de veille technologique active pour intégrer l'IA lorsque le cadre réglementaire, technique et économique offrira toutes les garanties de maturité.

== Gestion des parties prenantes, négociation et conduite du changement

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
    [Définition concertée des contrats d'API, gestion des formats d'erreurs et des flux temps réel Reverb.],

    [*Designer UI/UX (Figma)*],
    [Traduction des intentions graphiques en composants accessibles, conciliation des contraintes RGAA et d'ergonomie.],

    [*Chef de Projet / Métier*],
    [Priorisation des fonctionnalités dans Linear, respect des délais de livraison et démonstrations intermédiaires.],

    [*Agents communaux (retours)*],
    [Prise en compte des retours d'usage en situation réelle pour ajuster la densité d'information et les raccourcis.],
  ),
  caption: [Cartographie des parties prenantes et modalités de collaboration au quotidien],
)

=== Conduite du changement et résolution de conflits : Le durcissement des standards de code

L'élévation des exigences de qualité logicielle s'accompagne inévitablement de défis organisationnels. L'un des moments charnières de mon rôle de référent technique sur le projet de billetterie a concerné le durcissement progressif de la gouvernance de code.

En concertation avec les leads techniques, j'ai progressivement introduit des règles de linting ESLint plus strictes, l'interdiction du type `any`, le tri automatique des imports et des plugins d'analyse statique poussés (`typescript-eslint`, règles de scoping de templates Vue). Initialement, cette démarche a suscité des réticences de la part de plusieurs développeurs de l'équipe, qui percevaient ces contraintes comme un carcan rigide ralentissant leur rapidité d'écriture et bridant leur flexibilité.

Face à ces frictions, j'ai adopté une posture managériale constructive et pédagogique :
1. *Démonstration par la preuve :* Lors de sessions de cadrage technique, j'ai présenté des cas concrets de bugs détectés instantanément par l'IDE avant même l'exécution, évitant des heures de débogage ultérieur.
2. *Fluidification des revues de code :* J'ai démontré que l'automatisation du formatage et des règles de style libérait les revues de Pull Requests des débats de forme stériles pour se concentrer exclusivement sur la valeur métier et l'architecture.
3. *Accompagnement individuel :* J'ai assisté les développeurs dans la configuration optimale de leur environnement de travail (VS Code / WebStorm) pour que les corrections s'opèrent automatiquement à l'enregistrement du fichier.

Cette approche concertée a permis de désamorcer les craintes : l'équipe a unanimement reconnu le gain en sérénité, en cohérence globale et en lisibilité du code, faisant de cette rigueur une fierté partagée.

=== Arbitrage technique : Le cas du tri et du filtrage bimode Front / Back

Un autre arbitrage marquant a concerné l'architecture du composant `DataTable`. L'approche conventionnelle consistait à déléguer chaque tri ou filtre à l'API back-end. J'ai défendu et fait valider le mode bimode : pour les volumétries courantes (< 6 000 enregistrements), le traitement s'opère instantanément en mémoire côté navigateur (< 30 ms), procurant un confort exceptionnel aux agents tout en déchargeant significativement les serveurs applicatifs.

== Impact mesurable et indicateurs de performance (KPIs)

Afin d'évaluer concrètement la création de valeur pour l'éditeur Logitud Solutions et pour les collectivités territoriales clientes, un ensemble d'indicateurs quantifiés a été suivi :

#table(
  columns: (1.2fr, 1fr, 1.8fr),
  [Indicateur Clé (KPI)], [Valeur mesurée], [Impact opérationnel et création de valeur],
  [Volume d'affaires billetterie],
  [150 000 €],
  [Transactions en ligne traitées dès les premiers mois post-lancement à Mulhouse.],

  [Digitalisation des achats],
  [60 % en ligne],
  [Désengorgement massif des caisses physiques des piscines dès le 1er trimestre.],

  [Couverture de tests unitaires],
  [85 % (Front) / 90 % (Back)],
  [Sécurisation des parcours critiques et élimination quasi-totale des régressions.],

  [Temps d'exécution CI/CD],
  [~3 minutes],
  [Pipeline GitHub Actions complet avec déploiement d'environnements éphémères de PR.],

  [Conformité légale RGAA],
  [> 95 %],
  [Score Lighthouse garantissant l'accessibilité universelle et l'éligibilité aux marchés publics.],

  [Poids du bundle JS initial],
  [-20 %],
  [Optimisation par code splitting Nuxt 4 et chargement dynamique des dépendances.],

  [Temps de tri / recherche table],
  [< 30 ms],
  [Fluidité instantanée pour les agents municipaux sur des listes de 6 000 lignes.],

  [Gain de temps d'intégration], [~40 %], [Réutilisation des briques partagées (Drawers, DataTables, Clavier tactile).],
)

== Bilan de compétences et posture managériale

=== Posture de référent technique, mentorat et transmission des savoirs

Au-delà de la production de code, mon rôle au cours de ce cycle de Mastère 2 s'est enrichi d'une véritable dimension de leadership technique et d'apprentissage organisationnel :

- *Formalisation des guides de contribution :* Rédaction sur Notion de la documentation d'architecture, des conventions de nommage TypeScript et des bonnes pratiques de composition de composants Vue 3.
- *Mentorat et accompagnement des pairs :* Animation d'ateliers de prise en main de Nuxt 4 et revues de code pédagogiques orientées sur la maintenabilité et l'accessibilité RGAA.
- *Veille technologique active :* Partage régulier avec l'équipe des évolutions de l'écosystème web (mises à jour Nuxt, RFCs Vue.js, nouvelles normes W3C).

#table(
  columns: (1.3fr, 2.7fr),
  [Domaine de compétences], [Acquis et réalisations concrètes en situation professionnelle],
  [
    *Compétences Techniques & Architecture*
  ],
  [
    - Maîtrise avancée de l'écosystème *Nuxt 4*, *Vue 3* (Composition API) et *TypeScript strict*.
    - Conception d'architectures front-end modulaires et de bibliothèques de composants partagés.
    - Implémentation de flux temps réel bidirectionnels via *Laravel Reverb* et WebSockets.
    - Maîtrise des standards d'accessibilité numérique (*RGAA 4.1.2 / WCAG 2.1 niveau AA*).
    - Intégration de bibliothèques graphiques complexes (*Apache ECharts*) et manipulation de diffs JSON.
  ],

  [
    *Méthodologie, Qualité & DevOps*
  ],
  [
    - Configuration de pipelines CI/CD sous GitHub Actions (tests Vitest, typage strict, déploiement d'environnements de test).
    - Mise en place et gouvernance des règles de formatage et de typage statique (*ESLint*, *Prettier*, *vue-tsc*).
    - Rédaction et automatisation de tests unitaires avec une couverture de 85 % sur le front-end.
    - Maîtrise de la gestion de branches Git en équipe (GitFlow) et revues de code pédagogiques.
  ],

  [
    *Posture Professionnelle & Soft Skills*
  ],
  [
    - Capacité d'analyse stratégique, de négociation et de conduite du changement technique en équipe.
    - Communication efficace avec des profils variés (développeurs, designers, chefs de projet, clients territoriaux).
    - Leadership technique : formalisation de conventions de code, documentation Notion et partage de connaissances.
    - Prise de recul critique sur l'expérience utilisateur et anticipation des contraintes d'exploitation à long terme.
  ],
)

=== Analyse critique de progression et perspectives d'expertise

Cette expérience prolongée de quatre années a confirmé ma vocation pour l'ingénierie front-end et l'architecture logicielle. Si mon autonomie technique est aujourd'hui solidement établie, j'identifie deux axes d'approfondissement majeurs pour la suite de mon parcours :

1. *L'élargissement des tests automatisés E2E (End-to-End) :* Si la couverture unitaire de 85 % sécurise la logique des composants isolés, l'automatisation systématique de scénarios de bout en bout (via Playwright) renforcera encore la fiabilité des tunnels d'achat face aux évolutions futures.
2. *L'exploration des architectures micro-frontends :* À mesure que le portefeuille applicatif de Logitud s'étend, l'adoption de la fédération de modules (*Module Federation*) offrira une indépendance de déploiement maximale entre les différentes gammes métiers.

