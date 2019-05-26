#!/usr/bin/env bash
#
# helpers

usage() {
  cat << EOF
rke-installer.sh
Usage:
  rke-installer.sh <i|install|r|remove> [-h|--help] [-v|--version]
  rke-installer.sh up|upgrade
Options:
  -h|--help
          show this message
  -v|--version
          version
  i|install
          install/update rke
  r|remove
          remove rke
  up|upgrade
          upgrade rke-installer.sh
Examples:
  rke-installer.sh -v
          display version
  rke-installer.sh -h
          display this message
  rke-installer.sh upgrade
          upgrade rke-installer.sh to latest version
EOF
}

get_args() {
  if [[ -z $1 ]]; then
    usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -h|--help)
        usage
        exit 0
        ;;
      -v|--version)
        printf '%s\n' "$VERSION"
        exit 0
        ;;
      i|install)
        install_rke
        exit 0
        ;;
      r|remove)
        remove_rke
        exit 0
        ;;
      up|upgrade)
        upgrade
        exit 0
        ;;
      *)
        # get operator
        if [[ $1 =~ ^.+@.+$ ]]; then
          OPERATOR="$1"
        fi
        POSITIONAL+=("$1")
        shift
        ;;
    esac
  done
  set -- "${POSITIONAL[@]}"
}
