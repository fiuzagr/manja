#!/usr/bin/env sh
{ # init script 


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
    . $core_source_file $@
    return
  elif [ -f "${core_source_file}.sh" ]; then
    shift
    . "${core_source_file}.sh" $@
    return
  fi

  # execute plugin function
  if [ -f "${plugin_source_file}" ]; then
    shift
    . $plugin_source_file $@
    return
  elif [ -f "${plugin_source_file}.sh" ]; then
    shift
    . "${plugin_source_file}.sh" $@
    return
  fi

  # try execute alias
  manja alias $@

}


} # end script

