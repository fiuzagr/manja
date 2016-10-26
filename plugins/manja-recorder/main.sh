#!/usr/bin/env sh

manja_recorder_plugin () {
  set -o history

  echo
  echo "$(fgcolor green)$(icon check)$(fgcolor end) Starting recorder..."
  echo 

  fc -l -1 | sed 's/^ *\([0-9]*\).*/\1/'

  echo $APP_TITLE
}
manja_recorder_plugin "$*"

