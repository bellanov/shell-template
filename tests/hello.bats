#!/usr/bin/env bats

setup() {
  SCRIPT_DIR="$BATS_TEST_DIRNAME/../examples"
}

@test "hello.sh exits successfully" {
  run bash "$SCRIPT_DIR/hello.sh"
  [ "$status" -eq 0 ]
}

@test "hello.sh outputs 'Hello World'" {
  run bash "$SCRIPT_DIR/hello.sh"
  [[ "$output" == "Hello World" ]]
}
