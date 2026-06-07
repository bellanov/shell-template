#!/bin/bash
#
# Test the Codebase.

set -euo pipefail

#######################################
# Display an error message to STDERR.
# Arguments:
#   String containing the error message.
#######################################
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: ERROR $*" >&2
  exit 1
}

# Check if BATS is installed
if ! command -v bats &> /dev/null; then
  err "BATS is not installed. Please install it using: sudo apt-get install -y bats"
fi

# Run BATS tests
echo "Running BATS tests..."
bats tests/*.bats || err "BATS tests failed"

echo "All tests passed!"
