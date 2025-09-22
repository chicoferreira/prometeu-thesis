#import "cover.typ": render_cover

#set text(font: "NewsGotT", size: 11pt)

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