#!/usr/bin/env bats

setup() {
  SCRIPT_DIR="$BATS_TEST_DIRNAME/../examples"
}

@test "args.sh with name argument" {
  run bash "$SCRIPT_DIR/args.sh" "World"
  [ "$status" -eq 0 ]
  [[ "$output" == "Hello World!" ]]
}

@test "args.sh with custom greeting" {
  run bash "$SCRIPT_DIR/args.sh" --greeting "Hi" "Alice"
  [ "$status" -eq 0 ]
  [[ "$output" == "Hi Alice!" ]]
}

@test "args.sh with short greeting option" {
  run bash "$SCRIPT_DIR/args.sh" -g "Hey" "Bob"
  [ "$status" -eq 0 ]
  [[ "$output" == "Hey Bob!" ]]
}

@test "args.sh fails without name argument" {
  run bash "$SCRIPT_DIR/args.sh"
  [ "$status" -ne 0 ]
  [[ "$output" == *"name is required"* ]]
}

@test "args.sh shows help" {
  run bash "$SCRIPT_DIR/args.sh" -h
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage:"* ]]
}
