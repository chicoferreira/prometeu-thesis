#import "@preview/in-dexter:0.7.2": *

#import "cover.typ": render-cover
#import "colors.typ": *

#set text(font: "NewsGotT", size: 11pt)
#show link: set text(fill: blueuminho)

// Fake italic as NewsGotT doesn't have an italic style
// Change regex if italic is broken when changing lines
#show emph: it => {
  show regex("\S+"): it => box(skew(ax: -18.4deg, reflow: false, it))
  it
}

// Setup glossary
#import "@preview/glossy:0.8.0": *
#let glossary = (
  gcd: (
    short: "GCD",
    long: "Greatest Common Divisor",
  ),
  lcm: (
    short: "LCM",
    long: "Least Common Multiple",
  ),
  maths: (
    short: "Maths",
    plural: "Maths",
  ),
  latex: (
    short: "LaTeX",
  ),
  formula: (
    short: "Formula",
    plural: "Formulas",
  )
)

#show: init-glossary.with(glossary)

#render-cover

#set page(margin: 25mm, numbering: "i")
#counter(page).update(1)

#set heading(outlined: false)
#include "preamble/copyright.typ"
#pagebreak()
#include "preamble/acknowledgements.typ"
#pagebreak()
#include "preamble/integrity.typ"
#pagebreak()
#include "preamble/abstract.typ"
#pagebreak()
#outline()
#pagebreak()
#outline(title: [List of Figures], target: figure.where(kind: image))
#pagebreak()
#outline(title: [List of Tables], target: figure.where(kind: table))
#pagebreak()
#pagebreak()
#set heading(outlined: true)

#set page(margin: 25mm, numbering: "1")
#counter(page).update(1)

#let chapter-count = counter("chapter counter")

#set heading(numbering: (..nums) => {
  if nums.pos().len() == 1 {
    numbering("I", ..nums) // Part
  } else if nums.pos().len() == 2 {
    numbering("1", chapter-count.get().first()) // Chapter
  } else {
    numbering("1.1", ..chapter-count.get(), ..nums.pos().slice(2))
  }
})

#show heading.where(level: 1): it => [
  #set align(center + horizon)
  #set text(25pt)
  #pagebreak(weak: true)
  Part #context counter(heading).display()

  #it.body
]

#let render-chapter(top, bottom) = {
  pagebreak(weak: true)
  if top != none { block(text(15pt, top), inset: (top: 30mm), below: 7mm) }
  block(text(18pt, bottom), inset: (bottom: 15mm))
}

#show heading.where(level: 2): it => {
  chapter-count.step()
  render-chapter([Chapter #context counter(heading).display()], it.body)
}

#show heading.where(level: 3): set text(14pt)
#show heading.where(level: 3): set block(above: 2em, below: 1.5em)

= Introductory Material

== Introduction

Context, motivation, main aims.

== State of the Art
State of the art review; related work.

=== Citations

Example of a citation: @GRM97, or #cite(<GRM97>, form: "full").

This entry is in the `dissertation.bib` file.

Check more information about bibliography here: https://typst.app/docs/reference/model/bibliography/ and here: https://typst.app/docs/reference/model/cite/.

=== Mathematical expressions

The mass-energy equivalence is expressed by the equation

#[
  #set math.equation(numbering: "(1)")
  $
    E = m c^2
  $
]

discovered in 1905 by Albert Einstein. In natural units ($c = 1$) the formula expresses the identity
$
  E = m
$

Check more information about math expressions in: https://typst.app/docs/reference/math/equation/.

=== Footnotes

This is a footnote example #footnote[The quick brown fox jumps over the lazy dog.].

=== Acronyms and Glossary

Given a set of numbers, there are elementary methods to compute its @gcd, which is abbreviated @gcd. This process is similar to that used for the @lcm.

The @latex typesetting markup language is specially suitable for documents that include @maths. @formula:pl are rendered properly an easily once one gets used to the commands.

This glossary is powered by the #link("https://typst.app/universe/package/glossy/")[glossy] package. Check more about it there.

=== Index

In this example, several keywords #index[keywords] will be used which are important and deserve to appear in the Index#index[Index].

Terms like generate #index[generate] and some #index[others] will also show up. Terms in the index can also be nested#index([Index], [nested]).

The index is powered by the #link("https://typst.app/universe/package/in-dexter/")[in-dexter] package. Check more about it there.

== The problem and its challenges

The problem and its challenges.

=== Images

Example of inserting an image as displayed text,

#align(center, image("logos/color/UM.jpg", width: 10%))

or as a figure:

#figure(image("logos/color/UM.jpg", width: 10%), caption: [Logo of the University of Minho])

= Core of the Dissertation

== Contribution

Main result(s) and their scientific evidence

=== Introduction

=== Summary

== Applications

Applications of the main result (examples and case studies)

=== Introduction

=== Summary

== Conclusions and future work

Conclusions and future work

=== Conclusions

=== Future work

== Planned Schedule

=== Activities

#let filled = $circle.filled.small$

#figure(
  table(
    columns: 11,
    [Task], [Oct], [Nov], [Dec], [Jan], [Feb], [Mar], [Apr], [May], [Jun], [Jul],
    [Background and SOA], filled, filled, filled, [], [], [], [], [], [], [],
    [PDR preparation], [], filled, filled, filled, [], [], [], [], [], [],
    [Contribution], [], [], ..(filled,) * 7, [],
    [Writing up], [], [], [], [], [], [], ..(filled,) * 4,
  ),
  caption: [Planned Schedule],
)

For more elegant visualisation check some community-made packages like #link("https://typst.app/universe/package/gantty/")[gantty] or #link("https://typst.app/universe/package/timeliney/")[timeliney].

// TODO: fix bibliography (will be done when this is provided as a template, so heading formatting will be only applied to the thesis content)
#bibliography("dissertation.bib", full: true)

== Index

#let index-title(letter, counter) = {
  set text(weight: "bold")
  block(letter, above: 1.5em)
}

#columns(
  2,
  make-index(title: none, use-page-counter: true, section-title: index-title),
)
