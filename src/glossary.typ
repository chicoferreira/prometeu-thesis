#import "@preview/glossarium:0.5.9": *
#import "colors.typ"

#let custom-acronyms-print-title(entry) = {
  let result = text(weight: "bold")[#entry.short]
  
  if "long" in entry and entry.long != none and entry.long != "" {
    result += h(0.5em) + entry.long + "."
  }

  return result
}

#let show-acronyms(
  entries,
  show-all: false,
) = {
  print-glossary(
    entries,
    show-all: show-all,
    disable-back-references: true,
    user-print-title: custom-acronyms-print-title,
  )
}

#let custom-glossary-print-title(entry) = {
  let result = ""
  if not "long" in entry or entry.long == none or entry.long == "" {
    result = text(weight: "bold")[#entry.short]  
  } else {
    result = text(weight: "bold")[#entry.long]
  }

  result += h(0.5em) + entry.description

  return result
}

#let custom-glossary-print-description(entry) = {
  if entry.description != none {
    return "."
  }
}

#let show-glossary(
  entries,
  show-all: false,
) = {
  print-glossary(
    entries,
    show-all: show-all,
    disable-back-references: true,
    user-print-title: custom-glossary-print-title,
    user-print-description: custom-glossary-print-description,
    description-separator: ""
  )
}
