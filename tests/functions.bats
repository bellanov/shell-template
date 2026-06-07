#!/usr/bin/env bats

setup() {
  SCRIPT_DIR="$BATS_TEST_DIRNAME/../examples"
}

@test "functions.sh exits successfully" {
  run bash "$SCRIPT_DIR/functions.sh"
  [ "$status" -eq 0 ]
}

@test "functions.sh outputs addition result" {
  run bash "$SCRIPT_DIR/functions.sh"
  [[ "$output" == *"Result of 5 + 3: 8"* ]]
}

@test "functions.sh outputs multiplication result" {
  run bash "$SCRIPT_DIR/functions.sh"
  [[ "$output" == *"Result of 5 * 3: 15"* ]]
}
