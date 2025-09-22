#let pantone1807 = rgb("990000")
#let pantone159 = rgb("cc6633")
#let pantonecoolgray7 = rgb("999999")
#let blueuminho = rgb("24A2DA")

#set text(font: "NewsGotT", fill: pantonecoolgray7)

#set page(margin: (top: 0mm, bottom: 10mm, left: 79mm, right: 0mm))
#set par(spacing: 0pt)

#grid(columns: 2, image("logos/color/UM.jpg", width: 26mm), image("logos/color/EE.jpg", width: 26mm))

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
    #set par(leading: 0.4em, spacing: 25pt)

    Author's full name

    *Title Title Title Title Title Title*\
    *Title Title Title Title Title*\
    *Title Title Title Title*
]

#align(bottom, text(size: 10pt)[september 2025])

#page(fill: pantonecoolgray7)[]