#!/bin/bash
#
# Example script demonstrating logging patterns.
# Demonstrates structured logging with levels (INFO, WARN, ERROR).

set -euo pipefail

# Log level constants
# Lower numeric values = more verbose (show more messages)
# Higher numeric values = less verbose (show fewer messages)
# Examples: LOG_LEVEL=0 shows all (INFO, WARN, ERROR)
#          LOG_LEVEL=1 shows WARN and ERROR
#          LOG_LEVEL=2 shows only ERROR (then exits script)
readonly LOG_LEVEL_INFO=0
readonly LOG_LEVEL_WARN=1
readonly LOG_LEVEL_ERROR=2

# Current log level (can be overridden by LOG_LEVEL environment variable)
LOG_LEVEL="${LOG_LEVEL:-${LOG_LEVEL_INFO}}"

#######################################
# Log an informational message.
# Globals:
#   LOG_LEVEL
# Arguments:
#   Message to log
#######################################
log_info() {
  if (( LOG_LEVEL <= LOG_LEVEL_INFO )); then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [INFO] $*" >&2
  fi
}

#######################################
# Log a warning message.
# Globals:
#   LOG_LEVEL
# Arguments:
#   Message to log
#######################################
log_warn() {
  if (( LOG_LEVEL <= LOG_LEVEL_WARN )); then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [WARN] $*" >&2
  fi
}

#######################################
# Log an error message and exit.
# Globals:
#   LOG_LEVEL
# Arguments:
#   Message to log
#######################################
log_error() {
  if (( LOG_LEVEL <= LOG_LEVEL_ERROR )); then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [ERROR] $*" >&2
  fi
  exit 1
}

#######################################
# Main function demonstrating logging.
# Globals:
#   None
# Arguments:
#   None
#######################################
main() {
  log_info "Script started"
  log_info "Processing file: example.txt"
  
  # Simulate some work
  sleep 0.1
  
  log_warn "File size is larger than expected"
  log_info "Processing completed successfully"
}

main "$@"
