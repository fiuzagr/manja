#!/usr/bin/env sh

manja_example_plugin() {
  echo
  printf "$(fgcolor green)$(icon check)$(fgcolor end) "
  printf "$(bgcolor blue) Example of use $(bgcolor end)"
  echo
  echo
  printf "You receive all parameters: "
  printf "$(fgcolor black)$(bgcolor yellow) ${*} $(bgcolor end)$(fgcolor end)"
  echo
  echo
  echo 'And you can call the manja functions:'
  echo "$(a bold)Your OS:$(a end) $(a invert)$(manja os)$(a end)"
  echo
  echo 'And can use SHML vendor plugin to style your code'
  echo 'with colors (fg and bg), attributes (bold, underline, invert),'
  echo 'elements (hr, br, indent, tab), icons, emojis and color bar.'
  echo 'See:'
  echo
  echo 'Icons:'
  printf "$(icon check)"
  printf "$(i)$(fgcolor red)$(icon x)$(fgcolor end)"
  printf "$(i)$(fgcolor red)$(icon heart)$(fgcolor end)"
  printf "$(i)$(fgcolor yellow)$(icon sun)$(fgcolor end)"
  printf "$(i)$(icon skull)"
  echo
  echo 'and some others'
  echo
  echo 'Emojis:'
  printf "$(emoji fire)"
  printf "$(i)$(emoji monkey)"
  printf "$(i)$(emoji smiley)"
  printf "$(i)$(emoji panda)"
  printf "$(i)$(emoji star)"
  echo
  echo 'and some others'
  echo
  echo 'Color bar:'
  printf "$(color_bar red yellow red yellow)"
  echo 
  echo 
  echo 'Elements:'
  echo "$(hr '--' 10)"
  echo "$(i)You can make indent lines and make $(a bold bold) text"
  echo "You can make too $(a underline underline) and $(a invert invert) text"
  echo "And line$(br)break"
  echo "$(tab)and tabulated lines"
  echo 
}
manja_example_plugin "$*"

