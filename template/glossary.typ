#import "@preview/glossarium:0.5.9": *

#let show-acronyms(
  entries,
  show-all: false,
) = print-glossary(
  entries,
  show-all: show-all,
  disable-back-references: true,
  user-print-title: entry => {
    let result = text(weight: "bold", entry.short)

    if "long" in entry and entry.long != none and entry.long != "" {
      result += h(0.5em) + entry.long + [.]
    }

    result
  },
)

#let show-glossary(
  entries,
  show-all: false,
) = print-glossary(
  entries,
  show-all: show-all,
  disable-back-references: true,
  user-print-title: entry => {
    let entry-title = if not "long" in entry or entry.long == none or entry.long == "" {
      entry.short
    } else {
      entry.long
    }
    text(weight: "bold", entry-title) + h(0.5em) + entry.description
  },
  user-print-description: entry => if entry.description != none { [.] },
  description-separator: [],
)
