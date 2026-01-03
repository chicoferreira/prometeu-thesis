#import "state.typ"
#let chapter-count = counter("chapter counter")

#let chapter(top: none) = it => {
  pagebreak(weak: true)

  block(inset: (top: 30mm, bottom: 15mm), {
    if top != none {
      block(text(15pt, top), below: 7mm)
    }
    block(text(18pt, it.body))
  })
}

#let chapter-with-top() = it => {
  chapter-count.step()
  chapter(top: context [
    #if state.language.get() == "pt" [Capítulo] else [Chapter]
    #chapter-count.display()
  ])(it)
}

#let chapter-appendix() = it => {
  chapter-count.step()
  chapter(top: context [
    #if state.language.get() == "pt" [Apêndice] else [Appendix]
    #chapter-count.display("A")
  ])(it)
}

#let section() = it => {
  set text(16pt)
  set block(above: 2.5em, below: 1.5em)
  it
}

#let format-heading(..nums) = {
  if nums.pos().len() == 1 {
    numbering("1", ..nums) // Chapter
  } else {
    numbering("1.1", ..chapter-count.get(), ..nums.pos().slice(1)) // Section
  }
}

#let show-main-content = it => {
  // = Chapter
  // == Section
  show heading.where(level: 1): chapter-with-top()
  show heading.where(level: 2): section()

  // Use chapter-count to number chapters and sections
  set heading(numbering: format-heading)

  it
}

#let show-appendix(content) = {
  chapter-count.update(0)
  pagebreak(weak: true)

  show heading.where(level: 1): set heading(numbering: (..) => {
    numbering("A", ..chapter-count.get())
  })
  show heading.where(level: 1): chapter-appendix()

  content
}

#let show-preamble(content) = {
  set page(numbering: "i")
  counter(page).update(1)

  // Set level 1 heading to be chapters and level 2 headings to be sections
  show heading.where(level: 1): chapter()
  show heading.where(level: 2): section()

  // Preamble should not be included in the outline
  set heading(outlined: false)

  content

  chapter-count.update(0)
  counter(page).update(1)
}

#let show-postamble(content) = {
  show heading.where(level: 1): chapter()
  set heading(numbering: none)

  content
}
