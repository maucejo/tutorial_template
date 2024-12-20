// #import "@preview/tutorial:0.1.0": *
#import "../src/tutorial.typ": *

#let corr = false

#show: tutorial.with(
  title: [Titre du TD]
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