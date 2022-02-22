#!/bin/bash

shelltests_path="$(dirname $(realpath $0))/shelltests"
src_paths="$shelltests_path/src/*"
tests_path="$shelltests_path/tests/"

for src_path in $src_paths
do
  [ -e "$src_path" ] || continue
  src_path_without_extension=${src_path%%.*}
  src_name=${src_path_without_extension##*/}
  compile_program="stack run necklace-exe ${src_path}"
  eval "$compile_program"
  run_test="shelltest ${tests_path}${src_name}.test"
  eval "$run_test"
done
