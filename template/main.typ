// #import "@preview/tutorial:0.1.0": *
#import "../src/tutorial.typ": *

#let corr = true

#show: tutorial.with(
  title: [Titre du TD],
  lang: "en"
)

#obj[
  + Objectif 1
  + Objectif 2
  + Objectif 3
]

= Titre de l'exercice

== Présentation de l'exercice

La @fig:bielle_manivelle est un mécanisme permettant de transformer un mouvement de rotation en un mouvement de translation. Il est composé de deux pièces, la bielle et la manivelle. La @a.

#figure(
  image("images/bielle_manivelle3.svg"),
  caption: [Schéma cinématique non paramétré d'un système bielle-manivelle],
) <fig:bielle_manivelle>

#subfigure(
  figure(image("images/bielle_manivelle3.svg"), caption: []), <a>,
  figure(image("images/bielle_manivelle3.svg"), caption: []), columns: (1fr, 1fr),
  caption: [Schéma cinématique non paramétré],
)

== Questions

#question[#lorem(10)

#info[
  *Consigne* : Répondre à la question suivante.]
]

#let rep = [Réponse à la question]
#correction(corr, rep)

#show: appendix

= Annexe

#figure(
  image("images/bielle_manivelle3.svg"),
  caption: [Schéma cinématique non paramétré d'un système bielle-manivelle],
)

#figure(
  table(
  columns: 2,
  [*Amount*], [*Ingredient*],
  [360g], [Baking flour],
  [250g], [Butter (room temp.)],
  [150g], [Brown sugar],
  [100g], [Cane sugar],
  [100g], [70% cocoa chocolate],
  [100g], [35-40% cocoa chocolate],
  [2], [Eggs],
  [Pinch], [Salt],
  [Drizzle], [Vanilla extract],
),
  caption: [Ingredients for a chocolate cake],
)