#import "colors.typ": pantonecoolgray7

#let render-cover = [
  #set text(fill: pantonecoolgray7)

  #set page(margin: (top: 0mm, bottom: 10mm, left: 79mm, right: 0mm))
  #set par(spacing: 0pt)

  #grid(
    columns: 2,
    image("logos/color/UM.jpg", width: 26mm), image("logos/color/EE.jpg", width: 26mm),
  )

  #v(8.72mm)

  #[
    #set par(leading: 0.4em)
    #set text(size: 14.5pt)
    *University of Minho*\
    #text(font: "NewsGoth Lt BT")[School of Engineering]
  ]

  #v(37.32mm)

  #place(top + left, float: false, dy: 90mm)[
    #set text(size: 17pt)
    #set par(leading: 20.4pt - 0.75em, spacing: 25pt)

    Author's full name

    *Title Title Title Title Title Title*\
    *Title Title Title Title Title*\
    *Title Title Title Title*
  ]

  #align(bottom, text(size: 10pt)[september 2025])

  #page(fill: pantonecoolgray7)[]

  #grid(
    columns: 2,
    image("logos/gray/UM.jpg", width: 26mm), image("logos/gray/EE.jpg", width: 26mm),
    column-gutter: 0.5mm,
  )

  #v(8.72mm)

  #[
    #set par(leading: 0.4em)
    #set text(size: 14.5pt)
    *University of Minho*\
    #text(font: "NewsGoth Lt BT")[School of Engineering]
  ]

  #place(top + left, float: false, dy: 90mm)[
    #set text(size: 17pt)
    #set par(leading: 20.4pt - 0.75em, spacing: 25pt)

    Author's full name

    *Title Title Title Title Title Title*\
    *Title Title Title Title Title*\
    *Title Title Title Title*
  ]

  #place(top + left, float: false, dy: 180mm)[
    #set text(size: 14.5pt)
    #set par(leading: 16.8pt - 0.75em, spacing: 25pt)

    Master's Dissertation in Informatics Engineering

    Dissertation supervised by\
    *Supervisor Name*\
    *Co-Supervisor Name*
  ]


  #align(bottom, text(size: 10pt)[september 2025])
]
