#!/usr/bin/env bats

setup() {
  SCRIPT_DIR="$BATS_TEST_DIRNAME/../examples"
}

@test "logging.sh exits successfully" {
  run bash "$SCRIPT_DIR/logging.sh"
  [ "$status" -eq 0 ]
}

@test "logging.sh outputs INFO messages by default" {
  run bash "$SCRIPT_DIR/logging.sh"
  [[ "$output" == *"[INFO]"* ]]
}

@test "logging.sh outputs WARN messages" {
  run bash "$SCRIPT_DIR/logging.sh"
  [[ "$output" == *"[WARN]"* ]]
}

@test "logging.sh respects LOG_LEVEL environment variable" {
  run env LOG_LEVEL=1 bash "$SCRIPT_DIR/logging.sh"
  [ "$status" -eq 0 ]
  # With LOG_LEVEL=1, INFO messages should not appear
  [[ "$output" != *"[INFO] Script started"* ]]
}
