#import "code.typ": *

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: none)
  set text(font: "Linux Libertine", lang: "en")
  set heading(numbering: "1.1")

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, font:"Libertinus Sans", title))
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.affiliation
      ]),
    ),
  )

  // Main body.
  set par(justify: true, leading: 0.5em)

  //show: columns.with(2, gutter: 1.3em)

  body
}
