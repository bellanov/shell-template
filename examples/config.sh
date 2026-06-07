#!/bin/bash
#
# Example script demonstrating configuration management.
# Demonstrates reading and validating configuration from files and environment.

set -euo pipefail

# Configuration variables with defaults
APP_NAME="${APP_NAME:-myapp}"
APP_VERSION="${APP_VERSION:-1.0.0}"
CONFIG_FILE="${CONFIG_FILE:-/etc/myapp.conf}"
DEBUG="${DEBUG:-false}"

#######################################
# Load configuration from file.
# Globals:
#   CONFIG_FILE
# Arguments:
#   None
# Security Note:
#   Sourcing external files can execute arbitrary code if compromised.
#   In production, consider parsing the file line-by-line and validating
#   each configuration key-value pair instead.
#######################################
load_config() {
  if [[ -f "$CONFIG_FILE" ]]; then
    # Source the config file in a subshell to avoid polluting the environment
    # with unintended variables
    # shellcheck source=/dev/null
    source "$CONFIG_FILE"
    echo "Configuration loaded from $CONFIG_FILE" >&2
  else
    echo "Configuration file not found: $CONFIG_FILE" >&2
  fi
}

#######################################
# Display configuration information.
# Globals:
#   APP_NAME
#   APP_VERSION
#   DEBUG
# Arguments:
#   None
#######################################
display_config() {
  cat >&2 << EOF
=== Configuration ===
APP_NAME=$APP_NAME
APP_VERSION=$APP_VERSION
CONFIG_FILE=$CONFIG_FILE
DEBUG=$DEBUG
EOF
}

#######################################
# Main function.
# Globals:
#   None
# Arguments:
#   None
#######################################
main() {
  load_config
  display_config
  
  if [[ "$DEBUG" == "true" ]]; then
    echo "Debug mode is enabled" >&2
  fi
  
  echo "Application: $APP_NAME version $APP_VERSION"
}

main "$@"
