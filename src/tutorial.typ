#import "@preview/subpar:0.1.1"
#import "@preview/showybox:2.0.3": *

#let hs = sym.space.thin
#let colors = (
  blue: rgb(29, 144, 208),
  light-blue: rgb(232, 246, 253),
  green: rgb(102, 174, 62),
  light-green: rgb(235, 244, 222),
)

#let sl = [$#h(0.1em) slash #h(0.1em)$]

// Figures
#let subfigure = subpar.grid.with(supplement: "Figure")

// Questions et réponses
#let c = counter("question")
#let question(body) = [
  #c.step()
  #context[
    *Question #c.get().first() #h(0.5em)*
  ]
  #body
]

#let rst(c) = {
  c.update(c => 0)
}

#let pb(bool) = {
  if bool {
    pagebreak()
  }
}

#let correction(bool, rep) = {
  if bool {
    v(-1em)
    showybox(
    title: [*Réponse*],
    title-style: (
      boxed-style: (
        anchor: (x: left, y: horizon),
        offset: (x: -1em, y: 1em),
        radius: (top-left: 0pt, top-right: 0pt, bottom-left: 0pt, bottom-right: 5pt)
      )
    ),
    frame: (
      title-color: colors.green,
      border-color: colors.green,
      body-color: colors.light-green,
      thickness: 2pt,
      body-inset: (top:2em, left: 1em, right: 1em, bottom: 1em)
    ),
    align: center,
    breakable: true
)[
  #rep
]
}}

#let obj(body) = {
  showybox(
  title: [*Objectifs pédagogiques*],
  title-style: (
    boxed-style: (
      anchor: (x: center, y: horizon)
    )
  ),
  frame: (
    title-color: colors.blue,
    border-color: colors.blue,
    body-color: colors.light-blue,
    thickness: 2pt
  ),
  align: center
)[
  #body
  #v(0.5em)
]
}

#let reco(body) = {
  showybox(
  title: [#h(0.1em) *Recommandations* #h(0.2em)],
  title-style: (
    boxed-style: (
      anchor: (x: center, y: horizon)
    )
  ),
  frame: (
    title-color: colors.blue,
    border-color: colors.blue,
    body-color: colors.light-blue,
    thickness: 2pt
  ),
  align: center
)[
  #body
  #v(0.5em)
]
}

// Informations
#let box-title(a, b) = {
  grid(columns: 2, column-gutter: 0.5em, align: (horizon),
    a,
    b
  )
}

#let colorize(svg, color) = {
  let blk = black.to-hex();
  if svg.contains(blk) {
    svg.replace(blk, color.to-hex())
  } else {
    svg.replace("<svg ", "<svg fill=\""+color.to-hex()+"\" ")
  }
}

#let color-svg(
  path,
  color,
  ..args,
) = {
  let data = colorize(read(path), color)
  return image.decode(data, ..args)
}

#let info(body) = {
  showybox(
    title: box-title(color-svg("images/icons/info.svg", colors.blue, width: 1em), [*Remarque*]),
    title-style: (
      color: colors.blue,
      sep-thickness: 0pt,
    ),
    frame: (
      title-color: colors.light-blue,
      border-color: colors.blue,
      body-color: none,
      thickness: (left: 1pt),
      radius: 0pt,
    ),
    breakable: true
  )[#body]
}

#let indication(body) = {
  showybox(
    title: box-title(color-svg("images/icons/info.svg", colors.blue, width: 1em), [*Indication*]),
    title-style: (
      color: colors.blue,
      sep-thickness: 0pt,
    ),
    frame: (
      title-color: colors.light-blue,
      border-color: colors.blue,
      body-color: none,
      thickness: (left: 1pt),
      radius: 0pt,
    ),
  breakable: true
  )[#body]
}


#let appendix(body) = {
  counter(heading).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)

  set heading(numbering: "A.1.")

  let numbering-fig = n => {
    let h1 = counter(heading).get().first()
    numbering("A.1", h1, n)
  }

  show figure.where(kind: image): set figure(
    numbering: numbering-fig,
  )

  show figure.where(kind: table): set figure(
    numbering: numbering-fig,
  )

  body
}

// Document
#let tutorial(
  // The paper's title.
  title: none,
  subtitle: none,
  docfont: "Lato",
  docfontmath: "Lete Sans Math",
  body
) = {
  // Set the body font.
  set page(
    paper: "a4",
    number-align: center,
    numbering: "1",
    margin : 2cm
    )

  set strong(delta: 300)
  set text(font: docfont, size: 11pt, lang: "fr", number-type: "lining")

  // Paragraph
  set par(justify: true)

  // Lists
  set list(indent: 1em)

  // Maths
  set overline(offset: -1em)
  show math.equation: set text(font: docfontmath, stylistic-set: 1)
  show math.equation: set block(breakable: true)
  set math.vec(delim: "[")
  set math.mat(delim: "[")

  // Headings
  set heading(numbering: "1.1.")
  show heading.where(level: 1): it => block(width: 100%)[
      #rst(c)
      #set text(1.1em)
      #counter(heading).display(it.numbering)
      #it.body
      #v(-0.75em)
      #line(length: 100%)
      #v(0.5em)
    ]

  show heading.where(level: 2): it => block(width: 100%)[
    #v(-0.25em)
    #counter(heading).display()
    #text(it.body)
    #v(0.3em)
  ]

  // Figures
  set figure.caption(separator: [ : ])
  show figure.where(kind: image): set figure(supplement: "Figure")
  show figure: it => block(width: 100%)[
    #v(0.5em)
    #it
    #v(0.5em)
  ]

  // Tables
  show figure.where(kind: table): it => block(width: 100%)[
    #v(0.5em)
    #it.caption
    #it.body
    #v(0.5em)
  ]

  // Display the paper's title.
  align(center, text(1.75em, strong(title)))

  v(-0.5em)
  align(center, subtitle)

  // Display the paper's contents.
  body
}