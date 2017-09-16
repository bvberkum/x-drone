#!/usr/bin/env bats

@test "normal exec" {
  run whoami
  test $status -eq 0
  test ${#lines[*]} -eq 1
}

@test "no arguments accepted" {
  run whoami help
  test $status -ne 0
}

@test "same as preferred alt. command" {
  run whoami
  test $status -eq 0
  test ${#lines[*]} -eq 1
  whoami="${lines[0]}"
  run id -un
  test $status -eq 0
  test ${#lines[*]} -eq 1
  test "$whoami" = "${lines[0]}"
}
