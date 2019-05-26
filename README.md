# rke-installer.sh

> installer for rancher kubernetes

## usage

```
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
```

## installation

### automatically

### manually

- clone the repo
- run `./setup.sh i` (requires `sudo`)

## license

[MIT](https://github.com/frncsdrk/rke-installer.sh/blob/master/LICENSE) (c) frncsdrk 2019
