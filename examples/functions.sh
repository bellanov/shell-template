#!/bin/bash
#
# Example script demonstrating functions and modularity.
# Demonstrates how to structure scripts using functions for reusability.

set -euo pipefail

#######################################
# Calculate the sum of two numbers.
# Globals:
#   None
# Arguments:
#   num1: First number
#   num2: Second number
# Outputs:
#   The sum of num1 and num2
#######################################
add() {
  local num1=$1
  local num2=$2
  echo $((num1 + num2))
}

#######################################
# Calculate the product of two numbers.
# Globals:
#   None
# Arguments:
#   num1: First number
#   num2: Second number
# Outputs:
#   The product of num1 and num2
#######################################
multiply() {
  local num1=$1
  local num2=$2
  echo $((num1 * num2))
}

#######################################
# Display a formatted result.
# Globals:
#   None
# Arguments:
#   operation: Name of the operation
#   result: The result value
#######################################
display_result() {
  local operation=$1
  local result=$2
  echo "Result of $operation: $result"
}

#######################################
# Main function demonstrating function composition.
# Globals:
#   None
# Arguments:
#   None
#######################################
main() {
  echo "=== Mathematical Operations ==="
  
  local sum
  sum=$(add 5 3)
  display_result "5 + 3" "$sum"

  local product
  product=$(multiply 5 3)
  display_result "5 * 3" "$product"
}

main "$@"
