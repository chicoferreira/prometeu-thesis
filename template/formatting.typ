#let chapter-count = counter("chapter counter")

#let part-formatting() = it => {
  set align(center + horizon)
  set text(25pt)
  pagebreak(weak: true)
  
  grid(
    row-gutter: 1em,
    [Part #context counter(heading).display()],
    it.body,
  )

  v(4em) // Move the part title up
}

#let chapter-formatting(top: none) = it => {
  chapter-count.step()
  pagebreak(weak: true)
  block(inset: (top: 30mm, bottom: 15mm), {
    if top != none {
      block(text(15pt, top), below: 7mm)
    }
    block(text(18pt, it.body))
  })
}

#let section-formatting() = it => {
  set text(14pt)
  set block(above: 3.5em, below: 2em)
  it
}
