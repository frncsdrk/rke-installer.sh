#!/usr/bin/env bash
#
# main

install_rke() {
  # prerequistes
  if [[ ! -d /tmp ]]; then
    mkdir /tmp
  fi

  cd /tmp

  if [[ ! -x "$(command -v wget)" ]]; then
    printf '%s\n' "please install wget to download ${INSTALLABLE_NAME}"
  fi

  # download
  wget -q "${RKE_DOWNLOAD_URL}" -O "${RKE_BIN_TARGET}"
  # move to dest
  mv "${RKE_BIN_TARGET}" "${RKE_DEST}"

  chmod +x "${RKE_DEST}/${RKE_BIN_TARGET}"

  # symlink
  printf '%s\n' "Create symbolic link to /usr/local/bin"

  if [[ -e "${RKE_DEST}/${RKE_BIN_TARGET}" ]] ; then
    if [[ ! -e "/usr/local/bin/${RKE_BIN_TARGET}" ]] ; then
      ln -s "${RKE_DEST}/${RKE_BIN_TARGET}" /usr/local/bin
    fi
  fi
}

remove_rke() {
  # remove binary
  printf '%s\n' "Remove installation"

  if [[ -f "${RKE_DEST}/${RKE_BIN_TARGET}" ]]; then
    rm "${RKE_DEST}/${RKE_BIN_TARGET}"
  fi

  # remove symlink
  printf '%s\n' "Remove symbolic link from /usr/local/bin"

  if [[ -L "/usr/local/bin/${RKE_BIN_TARGET}" ]]; then
    unlink /usr/local/bin/${RKE_BIN_TARGET}
  fi
}

main() {
  get_args "$@"
}
