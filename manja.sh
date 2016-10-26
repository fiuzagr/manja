#!/usr/bin/env sh
{ # init script 

# posix mode
# set -o posix

if [ -f $HOME/.manjarc ] || [ -h $HOME/.manjarc ]; then
  . $HOME/.manjarc
fi

if [ ! -n "$MANJA_DIR" ]; then
  export MANJA_DIR="${HOME}/.manja"
fi

if [ ! -n "$MANJA_PLUGINS_DIR" ]; then
  export MANJA_PLUGINS_DIR="${MANJA_DIR}/plugins"
fi


# source SHML Vendor
if [ -f $MANJA_DIR/vendor/shml/shml.sh ] || [ -h $MANJA_DIR/vendor/shml/shml.sh ]; then
  . $MANJA_DIR/vendor/shml/shml.sh
fi

manja() {
  local env="$(eval "$(sed -E -n 's/^[^#]+/&/ p' $MANJA_DIR/.env)")"
  echo $env
  return
  # local env="$(printenv)"
  # env="$env\nHISTFILE=${HISTFILE}"

  env sh -c -e ". ${MANJA_DIR}/manja.sh; _manja ${*}" || {
    echo
    printf "$(fgcolor red)$(icon x)$(fgcolor end) Error...\n"
    echo
    # exit 1
  }
}

_manja() {
  # eval "$(sed -E -n 's/^[^#]+/&/ p' $MANJA_DIR/.env.tmp)"

  # without parameters, execute help
  if [ $# -lt 1 ]; then
    manja help
    return
  fi

  # local variables
  local core_source_file="${MANJA_DIR}/core/${1}"
  local plugin_source_file="${MANJA_PLUGINS_DIR}/bin/${1}"

  # execute core function
  if [ -f "${core_source_file}" ]; then
    shift
    cd "$(dirname $core_source_file)"
    . $core_source_file "$*"
    return
  elif [ -f "${core_source_file}.sh" ]; then
    shift
    cd "$(dirname "$core_source_file.sh")"
    . "${core_source_file}.sh" "$*"
    return
  fi

  # execute plugin function
  if [ -f "${plugin_source_file}" ]; then
    shift
    cd "$(dirname "$plugin_source_file")"
    . $plugin_source_file "$*"
    return
  elif [ -f "${plugin_source_file}.sh" ]; then
    shift
    cd "$(dirname "$plugin_source_file.sh")"
    . "${plugin_source_file}.sh" "$*"
    return
  fi

  # try execute alias
  manja alias "$*"

  exit 0
}

} # end script

