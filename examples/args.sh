#!/bin/bash
#
# Example script demonstrating argument parsing.
# Demonstrates parsing command-line arguments with validation.

set -euo pipefail

#######################################
# Display a usage message to STDERR.
# Globals:
#   None
# Arguments:
#   None
#######################################
usage() {
  cat >&2 << EOF
Usage: $0 [OPTIONS] <name>

Positional Arguments:
  name                  Name to greet

Options:
  -g, --greeting TEXT   Greeting message (default: "Hello")
  -h, --help            Show this help message
EOF
}

#######################################
# Display an error message to STDERR and exit.
# Globals:
#   None
# Arguments:
#   String containing the error message.
#######################################
err() {
  echo "[ERROR] $*" >&2
  exit 1
}

main() {
  local greeting="Hello"
  local name=""

  # Parse command-line arguments
  while (($# > 0)); do
    case "$1" in
      -g | --greeting)
        shift
        greeting="$1"
        ;;
      -h | --help)
        usage
        exit 0
        ;;
      -*)
        usage
        err "Unknown option: $1"
        ;;
      *)
        name="$1"
        ;;
    esac
    shift
  done

  # Validate required arguments
  [[ -n "$name" ]] || err "name is required"

  # Display the greeting
  echo "$greeting $name!"
}

main "$@"
