#!/usr/bin/env sh

manja_example_plugin() {
  echo
  echo "$(fgcolor green)$(icon check)$(fgcolor end) $(bgcolor blue)Example of use$(bgcolor end)"
  echo
  echo 'You can call manja functions:'
  echo "$(a bold OS:) $(a invert)$(manja os)$(a end)"
  echo
  echo 
  echo 'And can use SHML vendor plugin to style your code'
  echo 'with colors (fg and bg), attributes (bold, underline, invert),'
  echo 'elements (hr, br, indent, tab), icons, emojis and color bar'
  echo
  echo 'Emojis:'
  echo "$(fgcolor red)$(emoji fire)$(fgcolor end)$(i)and$(i)$(fgcolor yellow)$(emoji monkey)$(fgcolor end)"
  echo 'and some others'
  echo
  echo 'Elements:'
  echo "$(hr '--' 10)"
  echo "$(i)You can make indent lines and make $(a bold bold) text"
  echo "You can make too $(a underline underline) and $(a invert invert) text"
  echo "And line$(br)break"
  echo "$(tab)and tabulated lines"
  echo 
}
manja_example_plugin $@

