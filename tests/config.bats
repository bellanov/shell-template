#!/usr/bin/env bats

setup() {
  SCRIPT_DIR="$BATS_TEST_DIRNAME/../examples"
}

@test "config.sh exits successfully" {
  run bash "$SCRIPT_DIR/config.sh"
  [ "$status" -eq 0 ]
}

@test "config.sh outputs application name" {
  run bash "$SCRIPT_DIR/config.sh"
  [[ "$output" == *"Application: myapp"* ]]
}

@test "config.sh respects APP_NAME environment variable" {
  run env APP_NAME="testapp" bash "$SCRIPT_DIR/config.sh"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Application: testapp"* ]]
}

@test "config.sh respects APP_VERSION environment variable" {
  run env APP_VERSION="2.0.0" bash "$SCRIPT_DIR/config.sh"
  [ "$status" -eq 0 ]
  [[ "$output" == *"APP_VERSION=2.0.0"* ]]
}
