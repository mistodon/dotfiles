#!/usr/bin/env bash

source ../terminal-helpers.sh

current_test=""

fail_test() {
  local test_name="$1"
  local lineno="$2"
  echo "'$1' failed on line $2"
  exit 1
}
trap 'fail_test "${current_test}" ${LINENO}' ERR

pushd . > /dev/null
current_test="Finds directory from part of name"
ce ce_t
popd > /dev/null

pushd . > /dev/null
current_test="Finds subdirectory from parts"
ce ce_t dir
popd > /dev/null

pushd . > /dev/null
current_test="Finds directory with space in name"
ce ce_t space
popd > /dev/null

pushd . > /dev/null
current_test="Chooses matching directories in alphabetical order"
ce ce_t thing
cat currently_in_prefixed_directory > /dev/null
popd > /dev/null

pushd . > /dev/null
current_test="Slashes match the end of the directory name"
ce ce_t thing/
cat not_currently_in_prefixed_directory > /dev/null
popd > /dev/null

pushd . > /dev/null
current_test="Can use .. to move upwards"
ce ce_t dir ..
cat currently_in_ce_test_root > /dev/null
popd > /dev/null