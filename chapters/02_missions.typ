// -------------------------------------------------------------
// CHAPITRE II : RÉALISATIONS & PROJETS TECHNIQUES
// -------------------------------------------------------------

= Réalisations & Projets Techniques

== Projet Phare (1 an) : Moteur de vente en ligne et billetterie modulaire

=== Contexte, enjeux métiers et volumétrie financière

Dans le cadre de la modernisation de ses infrastructures publiques, la Ville de Mulhouse a confié à Logitud Solutions la conception et le déploiement d'un système complet de vente en ligne et de billetterie pour ses établissements aquatiques et sportifs. L'enjeu était de remplacer un dispositif vieillissant et hétérogène par un moteur transactionnel moderne, interconnecté à l'écosystème *Mon-Guichet*, capable de gérer l'intégralité des flux citoyens : entrées unitaires, abonnements annuels nominatifs, cours collectifs (natation, aquagym) avec jauges d'inscrits en temps réel, et stages saisonniers.

Déployée en production en juin, cette nouvelle plateforme a immédiatement démontré son efficacité en traitant plus de *150 000 € de transactions en ligne* dès ses premiers mois d'exploitation estivale, désengorgeant massivement les guichets physiques des piscines municipales.

#v(0.4em)
#align(center)[
  #block(
    fill: rgb("#f8fafc"),
    stroke: 0.5pt + rgb("#cbd5e1"),
    inset: 0.8em,
    radius: 4pt,
    width: 100%,
    [
      #text(
        weight: "bold",
        size: 10pt,
      )[Architecture logicielle en couches de la solution de billetterie (Nuxt 4 / TypeScript)] \
      #v(0.5em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 0.6em,
        block(fill: rgb("#eff6ff"), stroke: 0.5pt + rgb("#93c5fd"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8.5pt, fill: rgb("#1e40af"))[1. Présentation (UI)] \
            #text(
              size: 7.5pt,
              fill: rgb("#1e3a8a"),
            )[Nuxt UI v4 / Tailwind\ Composants réutilisables\ Tiroirs latéraux empilables]
          ]
        ],
        block(fill: rgb("#eff6ff"), stroke: 0.5pt + rgb("#93c5fd"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8.5pt, fill: rgb("#1e40af"))[2. État & Logique] \
            #text(size: 7.5pt, fill: rgb("#1e3a8a"))[Stores Pinia réactifs\ Composables Vue 3\ Typage TypeScript strict]
          ]
        ],
        block(fill: rgb("#eff6ff"), stroke: 0.5pt + rgb("#93c5fd"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8.5pt, fill: rgb("#1e40af"))[3. Couche Réseau] \
            #text(size: 7.5pt, fill: rgb("#1e3a8a"))[Intercepteurs Fetch\ Gestion globale d'erreurs\ DTOs typés d'API]
          ]
        ],
        block(fill: rgb("#eff6ff"), stroke: 0.5pt + rgb("#93c5fd"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8.5pt, fill: rgb("#1e40af"))[4. Back-End API] \
            #text(
              size: 7.5pt,
              fill: rgb("#1e3a8a"),
            )[API REST NestJS\ Base PostgreSql / Redis\ Passerelle bancaire PayFIP]
          ]
        ],
      )
    ],
  )
]
#v(0.4em)

=== Conception de composants d'infrastructure avancés

Afin d'éviter la duplication de logique métier et d'accélérer les développements au sein de l'équipe, j'ai conçu une bibliothèque de composants génériques hautement configurables intégrés au design system de l'éditeur.

==== La surcouche DataTable personnalisée et son moteur bimode

La manipulation de tableaux de données denses constitue le cœur de l'activité quotidienne des agents administratifs (suivi des réservations, listes d'inscrits, gestion des transactions). J'ai développé une surcouche avancée apportant des fonctionnalités professionnelles indispensables :

#figure(
  image("../assets/images/mg_shop/datatable_rowactions.png", width: 75%),
  caption: [Composant DataTable avec sélecteur de colonnes visibles et actions contextuelles par ligne],
)

- *Gestion dynamique des colonnes :* Sélecteur interactif permettant de masquer ou d'ordonner les colonnes à la volée selon les besoins de l'agent.
- *Moteur bimode Front / Back :* Pour les listes comptant un nombre maximal d'enregistrements résonable, le tri, le filtrage multi-colonnes et la pagination s'exécutent instantanément en mémoire côté navigateur (< 30 ms), supprimant toute latence réseau. Au-delà ou sur des requêtes complexes, le composant peut être utilisé en mode distant (server-side).
- *Exports natifs typés (CSV / PDF) :* Exposition des données internes formatées via `defineExpose` pour substituer des libellés textuels propres aux badges d'état visuels lors de l'export.

```typescript
// Extrait du Composable générique de filtrage et tri bimode
export function useDataTable<T extends Record<string, any>>(items: Ref<T[]>, options: TableOptions) {
  const searchQuery = ref('');
  const sortKey = ref<keyof T | null>(null);
  const sortOrder = ref<'asc' | 'desc'>('asc');

  const processedData = computed(() => {
    if (options.mode === 'server') return items.value;
    let result = [...items.value];
    if (searchQuery.value) {
      const q = searchQuery.value.toLowerCase();
      result = result.filter(row => Object.values(row).some(v => String(v).toLowerCase().includes(q)));
    }
    if (sortKey.value) {
      result.sort((a, b) => {
        const valA = a[sortKey.value!], valB = b[sortKey.value!];
        return (valA > valB ? 1 : -1) * (sortOrder.value === 'asc' ? 1 : -1);
      });
    }
    return result;
  });
  return { searchQuery, sortKey, sortOrder, processedData };
}
```

#figure(
  image("../assets/images/mg_shop/datatable_export.png", width: 75%),
  caption: [Fenêtre de configuration et d'export personnalisé des données du tableau],
)

==== Le système de tiroirs empilables (Stackable Drawers)

Dans les applications administratives denses, l'ouverture successive de fenêtres modales classiques provoque une désorientation cognitive. Pour maintenir le contexte de travail, j'ai développé un gestionnaire de tiroirs coulissants superposables (*Stackable Drawers*).

#figure(
  image("../assets/images/mg_shop/drawer_multi_panel.png", width: 75%),
  caption: [Système de tiroirs latéraux empilables permettant la navigation multi-niveaux sans rupture de contexte],
)

Ce composant gère dynamiquement une pile (*stack*) de panneaux : lorsqu'un agent inspecte un dossier d'inscription, il peut déployer un panneau secondaire pour consulter l'historique bancaire, puis un troisième pour le profil citoyen. Chaque panneau incrémente son plan de profondeur (`z-index`), capture le focus clavier (*focus-trap* conforme RGAA) et se ferme de manière ordonnée (LIFO) lors de l'appui sur Échap ou par clic extérieur.

==== Traçabilité, audit et visualiseur de différences JSON

La gestion des finances publiques exige une transparence totale sur les modifications tarifaires et administratives :

- *Palette de commandes universelle (`Ctrl+K`) :* Recherche instantanée d'usagers, de commandes ou de raccourcis métiers sans quitter le clavier.
- *Visualiseur différentiel JSON (Git-diffs) :* Comparateur visuel d'historique permettant aux gestionnaires d'identifier immédiatement les modifications de tarifs ou de données citoyennes, en mode scindé (*Split*) ou unifié (*Unified*).

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

==== Tableaux de bord décisionnels interactifs (Apache ECharts)

Afin d'offrir aux directeurs d'équipements sportifs et aux élus une vision claire des recettes et des flux, j'ai intégré la bibliothèque *Apache ECharts* encapsulée dans des composants Vue réactifs :

#figure(
  image("../assets/images/mg_shop/echarts_graph.png", width: 75%),
  caption: [Tableau de bord de suivi des ventes et de fréquentation réalisé avec Apache ECharts],
)

=== Les parcours utilisateurs et la résilience transactionnelle

==== Le parcours usager (citoyen)

L'expérience citoyenne a été conçue pour offrir un tunnel d'achat intuitif et sans friction :
- *Sélection et calendrier de réservation :* Consultation du catalogue et sélection de créneaux avec vérification en temps réel des jauges d'accueil maximales autorisées.
- *Panier réactif et tarification dynamique :* Application instantanée des tarifs réduits (résidents municipaux, familles nombreuses, étudiants) et validation du panier.
- *Intercepteurs de requêtes et résilience réseau :* En cas d'aléa réseau ou d'indisponibilité d'un créneau, les erreurs légères sont signalées par des notifications discrètes (*toasts*), tandis que les incidents critiques (session expirée, rejet de paiement) ouvrent des modales explicatives avec reprise guidée.

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

Le système propose un mode dédié « Vente guichet » pour les agents d'accueil des piscines, optimisé pour la saisie ultra-rapide au pavé numérique et l'encaissement direct (CB physique, espèces, chèques vacances).

=== Sécurité transactionnelle, interfaçage PayFIP et résilience réseau

La manipulation de deniers publics impose une sécurité sans faille sur l'ensemble de la chaîne de paiement :

- *Interfaçage avec les passerelles bancaires publiques (PayFIP / TIPI) :* Le tunnel de paiement s'interface avec la régie des finances publiques (DGFiP). Afin d'éviter les doubles débits ou les commandes fantômes en cas de rupture de connexion côté usager, le moteur repose sur un mécanisme d'idempotence avec réconciliation asynchrone par *webhooks signés cryptographiquement*.
- *Intercepteur API résilient (`useApiFetch`) :* J'ai développé un composable encapsulant `ofetch` pour gérer le rafraîchissement automatique des jetons de session, l'injection des headers de traçabilité et la sérialisation typée des erreurs HTTP.

```typescript
// Composable d'interception et de gestion d'erreurs API
export function useApiFetch<T>(url: string | (() => string), options: UseFetchOptions<T> = {}) {
  const toast = useToast();
  return useFetch<T>(url, {
    ...options,
    $fetch: useNuxtApp().$apiFetch,
    onResponseError({ response }) {
      if (response.status === 401) {
        navigateTo('/auth/login?expired=true');
      } else if (response.status >= 500) {
        toast.add({ title: 'Erreur serveur', description: 'Action temporairement indisponible.', color: 'red' });
      }
    }
  });
}
```

== Projet 2 (4 mois) : Gestion de file d'attente connectée & Borne tactile (PopQueue)

=== Contexte et objectifs du projet

L'accueil physique en mairie constitue le premier point de contact entre l'administré et l'administration. Des files d'attente mal régulées engendrent du mécontentement et désorganisent les services. Pour répondre à cet enjeu, Logitud a développé *PopQueue*, une solution modulaire synchronisée en temps réel avec l'écosystème Mon-Guichet.

#figure(
  image("../assets/images/popqueue/supervision_globale_bo.jpg", width: 75%),
  caption: [Tableau de bord de supervision globale des flux et des guichets en temps réel],
)

=== Architecture temps réel via WebSockets et Laravel Reverb

Pour synchroniser instantanément l'ensemble des équipements sans saturer le réseau par des requêtes de scrutation périodique (*polling*), nous avons mis en place une architecture d'événements temps réel bidirectionnelle articulée autour de *Laravel Reverb* :

#v(0.4em)
#align(center)[
  #block(
    fill: rgb("#f8fafc"),
    stroke: 0.5pt + rgb("#cbd5e1"),
    inset: 0.8em,
    radius: 4pt,
    width: 100%,
    [
      #text(weight: "bold", size: 10pt)[Flux d'événements temps réel PopQueue (Laravel Reverb)] \
      #v(0.4em)
      #grid(
        columns: (1.2fr, 0.8fr, 1.2fr, 1.2fr),
        gutter: 0.5em,
        block(fill: rgb("#fef3c7"), stroke: 0.5pt + rgb("#fcd34d"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8pt, fill: rgb("#92400e"))[Borne d'accueil]\
            #text(size: 7pt, fill: rgb("#78350f"))[Tirage ticket\ Check-in RDV]
          ]
        ],
        block(fill: rgb("#fee2e2"), stroke: 0.5pt + rgb("#fca5a5"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8pt, fill: rgb("#991b1b"))[Laravel Reverb]\
            #text(size: 7pt, fill: rgb("#7f1d1d"))[WebSocket Server\ Canaux privés]
          ]
        ],
        block(fill: rgb("#dcfce7"), stroke: 0.5pt + rgb("#86efac"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8pt, fill: rgb("#166534"))[Console Agent]\
            #text(size: 7pt, fill: rgb("#14532d"))[Appel usager\ Prise en charge]
          ]
        ],
        block(fill: rgb("#e0e7ff"), stroke: 0.5pt + rgb("#a5b4fc"), inset: 0.5em, radius: 3pt)[
          #align(center)[
            #text(weight: "bold", size: 8pt, fill: rgb("#3730a3"))[Écran Salle]\
            #text(size: 7pt, fill: rgb("#312e81"))[Diffusion n° ticket\ Synthèse vocale]
          ]
        ],
      )
    ],
  )
]
#v(0.4em)

- Dès qu'un administré tire un ticket ou signale sa présence à la borne tactile, un événement `TicketCreated` est diffusé sur le canal WebSocket privé de la collectivité.
- Lorsque l'agent clique sur « Appeler le suivant », l'événement `TicketCalled` est reçu en moins de 100 ms par l'écran de la salle d'attente, déclenchant l'affichage du numéro et l'alerte sonore vers le bon guichet.

```typescript
// Composable de gestion de flux WebSocket avec reconnexion exponentielle
export function usePopQueueSocket(channelName: string) {
  const isConnected = ref(false);
  const activeTickets = ref<Ticket[]>([]);

  onMounted(() => {
    const echo = useEcho(); // Client WebSocket Laravel Reverb
    echo.private(channelName)
      .listen('.TicketCreated', (e: { ticket: Ticket }) => {
        activeTickets.value.push(e.ticket);
      })
      .listen('.TicketCalled', (e: { ticketId: string, desk: number }) => {
        activeTickets.value = activeTickets.value.filter(t => t.id !== e.ticketId);
      });
  });

  return { activeTickets, isConnected };
}
```

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

=== Interface usager sur borne tactile et clavier virtuel sur mesure

L'interface de la borne d'accueil physique imposait des contraintes ergonomiques strictes :

#figure(
  image("../assets/images/popqueue/choix_demarche.jpg", width: 75%),
  caption: [Interface tactile de sélection de la démarche administrative sur la borne d'accueil],
)

- *Ergonomie tactile et accessibilité PMR :* Boutons dimensionnés avec des zones de contact élargies (minimum 48x48 pixels) et contrastes élevés conformes aux normes d'accessibilité.
- *Conception d'un clavier virtuel autonome :* Pour la saisie de numéros de dossier ou de noms de rendez-vous, le clavier natif des tablettes (Android / iOS / Windows) créait des désagréments majeurs : décalage intempestif du viewport, barres d'outils parasites en mode kiosque et autocomplétion inadaptée. J'ai donc conçu un composant de clavier virtuel sur mesure, intégré au design de l'application et restreint aux caractères pertinents pour les démarches administratives.

#figure(
  image("../assets/images/popqueue/clavier.jpg", width: 75%),
  caption: [Clavier virtuel sur mesure, optimisé pour la saisie tactile sur borne d'accueil],
)

=== Résilience réseau et accessibilité audiovisuelle en salle

- *Mode déconnecté et mise en mémoire tampon (IndexedDB) :* En cas de micro-coupure réseau entre la borne et le serveur municipal, les tickets générés sont placés dans un buffer local chiffré dans le navigateur. Dès le rétablissement de la connectivité, les événements sont automatiquement synchronisés avec le serveur Reverb sans perte de données.
- *Accessibilité audiovisuelle et synthèse vocale :* L'écran de salle d'attente intègre la *Web Speech API* pour vocaliser automatiquement les appels (« *Ticket numéro A42 au guichet 3* »), offrant une accessibilité optimale pour les personnes malvoyantes.

== Projet 3 (4 mois) : Refonte globale UI/UX et Front-End de Mon-Guichet v2

=== Modernisation ergonomique et stratégie de migration

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

=== Apports de la refonte et optimisation des Web Vitals

Cette refonte a permis d'atteindre quatre objectifs majeurs :
1. *Clarté de navigation :* L'organisation des démarches par tuiles thématiques illustrées permet aux administrés d'identifier immédiatement le service recherché (état civil, petite enfance, urbanisme, signalement).
2. *Accessibilité numérique native :* Reprise intégrale des contrastes de couleurs, structuration sémantique des titres et compatibilité totale avec la navigation au clavier et les lecteurs d'écran, garantissant la conformité avec le standard RGAA 4.1.2.
3. *Thématisation dynamique par Design Tokens :* Mise en place d'un système de tokens CSS via Tailwind permettant à chaque collectivité cliente d'injecter ses couleurs primaires, ses polices et son blason municipal sans aucune recompilation du code source.
4. *Optimisation des Core Web Vitals :* Le temps de chargement du plus grand élément visible (*LCP*) a été divisé par trois (passant de 2.8s à 0.9s), et le décalage de mise en page (*CLS*) a été ramené à 0.01, garantissant une réactivité immédiate même sur smartphone.

```typescript
// Composable d'accessibilité pour les champs de formulaires de démarches
export function useAccessibleField(id: string, errorRef: Ref<string | undefined>) {
  const inputProps = computed(() => ({
    id,
    'aria-invalid': Boolean(errorRef.value),
    'aria-describedby': errorRef.value ? `${id}-error` : undefined,
  }));
  const errorProps = computed(() => ({
    id: `${id}-error`,
    role: 'alert',
    'aria-live': 'polite' as const,
  }));
  return { inputProps, errorProps };
}
```

== Projet 4 (4 mois) : Optimisation de performance et intégration Place de Marché

=== Réduction de la dette technique et optimisation CSS moderne

Le logiciel de gestion des places de marché permet aux régisseurs municipaux de gérer les emplacements des commerçants non sédentaires lors des marchés forains et foires locales. L'application comportait historiquement une part importante de scripts JavaScript utilisés pour gérer des mises en page conditionnelles et des ajustements visuels.

Ma mission a consisté à réaliser une refactorisation en profondeur de l'interface :
- *Remplacement de JavaScript par du CSS moderne :* Élimination des calculs de positionnement et de dimensionnement en JS au profit des fonctionnalités natives de CSS3 et de Tailwind CSS (*CSS Grid*, *Flexbox*, positionnement *sticky*).
- *Amélioration des performances de rendu :* La suppression du code JavaScript superflu a permis d'éliminer les recalculs de disposition forcés (*layout thrashing*), garantissant un défilement fluide à 60 images par seconde sur les tablettes des régisseurs en extérieur.
- *Grille de placement interactive et contraintes métiers :* Conception d'une vue en grille réactive matérialisant les allées et emplacements du marché, avec persistance visuelle des en-têtes de secteurs et calcul dynamique du métrage linéaire occupé.
- *Intégration fidèle des maquettes Figma :* Collaboration étroite avec le designer d'interface pour assurer une restitution parfaite des maquettes graphiques tout en préservant une structure de code propre, accessible et maintenable.



