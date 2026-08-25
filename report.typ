#set document(
  title: "Rapport d'expérience professionnelle - Logitud Solutions",
  author: "Nicolas Walter",
)
#set text(lang: "fr")
#set text(font: "Hanken Grotesk", size: 10.5pt, fill: rgb("#1a1a1a"))
#set par(justify: true, leading: 0.65em)

#show heading: set text(fill: rgb("#000000"))
#show heading: set block(sticky: true)

#show heading.where(level: 1): set text(size: 20pt, weight: "bold", fill: rgb("fff"))
#show heading.where(level: 1): set block(below: 1.5em)
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: rgb("#000000"),
  inset: 0.4em,
  it,
)

#show heading.where(level: 2): set text(size: 14pt, weight: "bold")
#show heading.where(level: 2): set block(width: 100%, below: 1em, above: 1.5em)

#show heading.where(level: 3): set text(size: 12pt, weight: "light")
#show heading.where(level: 3): set block(width: 100%, below: 0.8em, above: 1.2em)

#show link: set text(fill: rgb("#0055cc"))

#show table: set table(
  fill: (x, y) => if y == 0 { rgb("#eaeaea") } else { none },
  stroke: 0.5pt + rgb("#d0d0d0"),
  align: left,
)
#show table.cell.where(y: 0): strong
#show table: it => {
  set par(justify: false)
  set text(hyphenate: false)
  align(center, it)
}

#show raw: set text(font: "JetBrains Mono", size: 8.5pt)
#show raw.where(block: true): it => block(
  fill: rgb("#fafafa"),
  inset: 6pt,
  radius: 3pt,
  width: 100%,
  stroke: 0.5pt + rgb("#e5e5e5"),
  it,
)

// -------------------------------------------------------------
// PAGE DE GARDE
// -------------------------------------------------------------
#page(header: none, footer: none)[
  #align(center)[
    #text(size: 14pt)[#upper("Nicolas Walter")]
  ]

  #v(1fr)

  #align(center)[
    #set par(justify: false)
    #text(
      size: 26pt,
      weight: "bold",
      hyphenate: false,
    )[
      #upper[#align(left)[Rapport d'expérience]]
      #v(-16pt)
      #upper[#align(right)[professionnelle]]
    ]
    #text(size: 14pt)[Entreprise : Logitud Solutions]
    #v(2em)
    #line(length: 40%, stroke: 0.5pt + rgb("#888888"))
    #v(2em)
    #text(size: 12pt)[
      *Période scolaire :* 2024 - 2026 \
      *Formation :* Mastère 2 Expert en Développement Full Stack \
      *École :* Ynov Campus Strasbourg \
    ]
  ]

  #v(1fr)

  #align(center)[
    #text(size: 12pt)[#datetime.today().display("[day]/[month]/[year]")]
  ]
]

// Style de la page pour le reste du document
#set page(
  paper: "a4",
  margin: 2cm,
  header: move(dy: -8pt)[
    #grid(
      columns: (1fr, auto),
      text(size: 8.5pt, fill: rgb("#777777"))[Rapport d'expérience professionnelle],
      text(size: 8.5pt, fill: rgb("#777777"))[Nicolas Walter],
    )
    #v(-0.3em)
    #line(length: 100%, stroke: 0.5pt + rgb("#d0d0d0"))
  ],
  footer: move(dy: 8pt)[
    #line(length: 100%, stroke: 0.5pt + rgb("#d0d0d0"))
    #v(-0.3em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align(left)[#text(size: 8pt, fill: rgb("#999999"))[Document d'évaluation]],
      align(center)[
        #context {
          let page-num = counter(page).get().first()
          let total-pages = counter(page).final().first()
          text(size: 9pt, fill: rgb("#777777"))[
            Page #page-num sur #total-pages
          ]
        }
      ],
      align(right)[#text(size: 8pt, fill: rgb("#999999"))[Année 2025-2026]],
    )
  ],
)

// -------------------------------------------------------------
// RÉSUMÉ EXÉCUTIF
// -------------------------------------------------------------
#page(header: none)[
  #v(2em)
  #text(size: 18pt, weight: "bold")[Résumé Exécutif]
  #v(1.5em)
  Ce rapport d'expérience professionnelle présente une analyse approfondie de mon parcours au sein de l'entreprise Logitud Solutions. Il met en lumière les compétences acquises, les projets réalisés et les défis rencontrés, offrant ainsi une vision complète de mon développement professionnel dans le cadre de ma formation en Mastère 2 Expert en Développement Full Stack à Ynov Campus Strasbourg.

  #pagebreak()
]

// -------------------------------------------------------------
// TABLE DES MATIÈRES
// -------------------------------------------------------------
#page(header: none)[
  #v(2em)
  #text(size: 18pt, weight: "bold")[Table des Matières]
  #v(1.5em)
  #show outline.entry.where(level: 1): it => {
    v(1.5em, weak: true)
    it
  }
  #outline(title: none, indent: 1.5em, depth: 2)
]


#set heading(numbering: "1.1.")

// -------------------------------------------------------------
// SECTIONS INTERNES
// -------------------------------------------------------------



// -------------------------------------------------------------
// PAGE DE FIN (4ème de couverture)
// -------------------------------------------------------------
#pagebreak()
#page(
  header: none,
  footer: move(dy: 8pt)[
    #line(length: 100%, stroke: 0.5pt + rgb("#d0d0d0"))
    #v(-0.3em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      [],
      align(center)[
        #link("https://nicolaswalter.fr")[
          #box(baseline: 20%)[#image("website_logo.svg", height: 0.8em)]
          #h(0.3em)
          #text(size: 9pt, fill: rgb("#777777"))[nicolaswalter.fr]
        ]
      ],
      [],
    )
  ],
)[
  #align(center + horizon)[
    #text(size: 20pt, weight: "bold")[Merci de votre lecture.]
    #v(3em)
    #line(length: 40%, stroke: 0.5pt + rgb("#888888"))
    #v(3em)
    #text(size: 12pt)[
      *Candidat :* Nicolas Walter \
      *Évaluation :* Rapport d'expérience professionnelle \
      *Certification :* Mastère 2 Expert en Développement Full Stack
    ]

    #v(6em)
    #text(size: 9pt, fill: rgb("#888888"))[
      Ce document a été compilé avec le moteur de composition #link("https://typst.app")[Typst], gratuit et open-source sous licence Apache 2.0.
    ]
  ]
]
