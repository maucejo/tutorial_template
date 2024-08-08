#import "./manual-template.typ": *
#import "../src/tutorial.typ": *

#show: checklist.with(fill: eastern.lighten(95%), stroke: eastern, radius: .2em)

#let TeX = style(styles => {
  set text(font: "New Computer Modern")
  let e = measure("E", styles)
  let T = "T"
  let E = text(1em, baseline: e.height * 0.31, "E")
  let X = "X"
  box(T + h(-0.15em) + E + h(-0.125em) + X)
})

#let LaTeX = style(styles => {
  set text(font: "New Computer Modern")
  let a-size = 0.66em
  let l = measure("L", styles)
  let a = measure(text(a-size, "A"), styles)
  let L = "L"
  let A = box(scale(x: 110%, text(a-size, baseline: a.height - l.height, "A")))
  box(L + h(-a.width * 0.67) + A + h(-a.width * 0.25) + TeX)
})

//---------------------------------------------------------
#let abstract = [
  #package[Tutorial] est un modèle #typst pour la rédaction de sujets d'exercices ou d'examens
]

#show: manual-template.with(
  title: "Modèle pour les sujets d'exercices",
  subtitle: "",
  typst-version: "Typst 0.11.1",
  version: "0.1.0",
  abstract: abstract
)

= Qu'est-ce que Typst ?

#typst est un nouveau langage de balise open source é crit en Rust et développé à partir de 2019 par deux étudiants allemands, Laurenz Mädje et Martin Haug. La version 0.1.0 a été publiée sur GitHub le 04 avril 2023#footnote[Adresse du dépôt GitHub : #link("https://github.com/typst/typst", text("https://github.com/typst/typst", fill: typst-color))].

#typst se présente comme un successeur de #LaTeX plus moderne, rapide et simple d'utilisation. Parmi ses avantages, on peut citer :

- la compilation incrémentale ;
- des messages d'erreur clair et compréhensible ;
- un langage de programmation Turing-complet ;
- une système de style cohérent permettant de configurer aisément tous les aspects de son document (police, pagination, marges, #sym.dots) ;
- une communauté active et sympathique (serveur Discord pour le support, annonce de nouveaux paquets) ;
- un système de paquets simple d'utilisation (pour rechercher ou voir la liste des paquets, n'hésitez pas à visiter #link("https://typst.app/universe", text("Typst: Universe", fill: typst-color))) ;
- des extensions pour VS Code existent, comme `Typst LSP` ou `Typst preview`, pour avoir des fonctionnalités similaires à `LaTeX Workshop`.

#v(0.5em)

Pour finir, la documentation de #typst est suffisamment bien écrite et détaillée pour permettre de créer rapidement ses propres documents. Il faut compter moins d'une heure pour prendre en main la syntaxe (sans mentir #emoji.face.beam). Pour accéder à la documentation, suivez ce #link("https://typst.app/docs", text("lien", fill: typst-color)). Pour faciliter la transition de #LaTeX vers #typst, un guide est disponible #link("https://typst.app/docs/guides/guide-for-latex-users/", text("ici", fill: typst-color)).

= Usage

== Utilisation du template

Pour utiliser le modèle, il faut l'importer dans votre fichier principal `typ` en utilisant la commande suivante.

#codesnippet[
	```typ
	#import "./tutorial.typ": *
	```
]

#ibox[
	#set text(size: 11pt)

	Si vous décomposez votre document en différents fichiers, il faut insérer la commande précédente en préambule de chaque fichier.
]

== Initilisation du modèle

Après avoir importé le modèle, celui doit être initialisé en appliquant une règle d'affichage (`show` rule) avec la commande #cmd("tutorial") en passant les options nécessaires avec l'instruction `with` dans votre fichier principal `typ` :

#codesnippet(
	```typ
	#show tutorial.with(
	  ...
	)
	```
)

Le modèle #cmd("tutorial") possède un certain nombre de paramètres permettant de personnaliser le document. Voici la liste des paramètres disponibles :
#command("tutorial", ..args(
  title: none,
  subtitle: none,
  docfont: "Lato",
  docfontmath: "Lete Sans Math",
  [body])
)[#argument("title", default: none, types: "string")[Titre du document]

#argument("subtitle", default: (), types: "string")[Sous-titre du document]

#argument("docfont", default: none, types: "string")[Police de caractectères pour le corps du texte]

#argument("docfontmath", default: none, types: "string")[Police de caractères pour les équations mathématiques]
]

== Fonctions additionnelles

Le modèle #package[Tutorial] fournit un certain nombre de fonctions additionnelles pour faciliter la rédaction de votre document.

=== Environnements

*Exercice*

Pour créer un nouvel exercice, il suffit d'utiliser la commande #cmd("exercice") :
#codesnippet[
  ```typ
  #exercice("Titre de l'exercice")[Texte de l'exercice]
  ```
]

#ibox[La numérotation des exercices est automatique.]

*Question*

Pour ajouter une question à un exercice, il suffit d'utiliser la commande #cmd("question") :
#codesnippet[
  ```typ
  #question[Texte de la question]
  ```
]

#ibox[La numéroration des questions est automatique et est réinitialisée pour chaque exercice.]

*Correction*

Pour ajouter une correction à une question, il suffit d'utiliser la commande #cmd("correction") :

#example-box[
```typ
// À mettre au début du document
// Mettre le paramètre `false` pour masquer les corrections
#let corr = true

// À mettre à la suite de la question
#let rep = [Correction]
#correction(corr, rep)
```
#align(center)[#line(stroke: 1pt + typst-color, length: 95%)]
#let corr = true
#let rep = [Correction]
#correction(corr, rep)
]

#pagebreak()
=== Boîtes englobantes

Les boîtes englobantes sont des éléments graphiques permettant de mettre en avant des informations importantes. Le modèle #package[Tutorial] en propose actuelle trois types : `obj`, `reco` et `info`.

#v(0.5em)

1. La boîte `obj` est utilisée pour mettre en avant les objectifs des exercices ou de l'examen.
#example-box[
```typ
#obj[
  + Objectif 1
  + Objectif 2
]
```
#align(center)[#line(stroke: 1pt + typst-color, length: 95%)]

#obj[
  + Objectif 1
  + Objectif 2
]
]

#v(0.5em)

2. La boîte `reco` est utilisée pour mettre en avant les recommandations pour la réalisation des exercices ou de l'examen.

#example-box[
```typ
#reco[
  #lorem(20)
]
```
#align(center)[#line(stroke: 1pt + typst-color, length: 95%)]

#reco[
  #lorem(20)
]
]

3. La boîte `info` est utilisée pour mettre en avant des informations importantes.

#example-box[
```typ
#info[
  #lorem(20)
]
```
#align(center)[#line(stroke: 1pt + typst-color, length: 95%)]

#info[
  #lorem(20)
]
]

=== Sous-figures

#typst ne dispose pas actuellement de mécanismes permettant de gérer les sous-figures (numérotation et référencement). Pour pallier ce manque, le modèle intègre une fonction #cmd("subfigure") permettant de gérer les sous-figures de manière adaptée. Cette fonction encapsule la fonction #cmd("subpar.grid") du package `subpar`.
#codesnippet[
  ```typ
  #subfigure(
    figure(image("image1.png"), caption: []), <figa>,
    figure(image("image2.png"), caption: []), <figb>,
    columns: (1fr, 1fr),
    caption: [(a) Première image and (b) Seconde image],
    label: <fig>
  )
  ```
]

= Feuille de route

Le modèle #package[Tutorial] est en cours de développement. Certaines fonctionnalités devront être implémentées dans les prochaines versions. Voici la liste des fonctionnalités actuelles et à venir :

- [x] Mise en place du modèle de base
- [ ] Ajout de boîtes englobantes (`warning`, `tip`, `important`)
- [ ] Ajout de zones de réponses



