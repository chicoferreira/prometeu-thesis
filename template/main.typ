#import "cover.typ": render_cover

#set text(font: "NewsGotT", size: 11pt)

// Fake italic as NewsGotT doesn't have an italic style
// Change regex if italic is broken when changing lines
#show emph: it => {
  show regex("\S+"): it => box(skew(ax: -18.4deg, reflow: false, it))
  it
}

#render_cover

#set page(margin: 25mm, numbering: "i")
#counter(page).update(1)

#include "preamble/copyright.typ"
#pagebreak()
#include "preamble/acknowledgements.typ"
#pagebreak()
#include "preamble/integrity.typ"
#pagebreak()
#include "preamble/abstract.typ"
