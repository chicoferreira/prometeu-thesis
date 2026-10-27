// Fake italic as NewsGotT font doesn't have an italic variant.
#let fake-italic(it) = {
  // Same slant as Word's fake italic (a 1/3 shear, about 18.4deg).
  let slant = 18.4deg
  // We try to slant around half the x-height (0.475em) so the spaces on both sides stay even.
  // but skew can only pivot at the baseline or the centre, so we pivot at the baseline and shift left.
  let shift = calc.tan(slant) * 0.475em / 2
  // Slant each word separately so lines can still break between them.
  // Change regex if italic is broken when changing lines
  show regex("\S+"): word => box(move(dx: -shift, skew(ax: -slant, origin: bottom, reflow: false, word)))
  it
}
