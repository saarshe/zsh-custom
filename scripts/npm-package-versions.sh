#!/bin/bash

npm-package-versions() {
  if [ -z "$1" ]; then
    echo "Usage: npv <package-name>"
    return 1
  fi

  npm show "$1" versions
}