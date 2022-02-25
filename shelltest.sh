#!/bin/bash

shelltests_path="$(dirname $(realpath $0))/shelltests"
src_paths="$shelltests_path/src/*"
tests_path="$shelltests_path/tests/"

for src_path in $src_paths
do
  [ -e "$src_path" ] || continue
  if [[ -d $src_path ]]; then
    nested_shelltest="${src_path}/*"
    for nested_src_path in $nested_shelltest
    do
      nested_src_path_without_extension=${nested_src_path%%.*}
      test_path=${nested_src_path_without_extension##*src/}
      compile_program="stack run necklace-exe ${nested_src_path}"
      eval "$compile_program"
      run_test="shelltest ${tests_path}${test_path}.test"
      eval "$run_test"
    done
  elif [[ -f $src_path ]]; then
    src_path_without_extension=${src_path%%.*}
    src_name=${src_path_without_extension##*/}
    compile_program="stack run necklace-exe ${src_path}"
    eval "$compile_program"
    run_test="shelltest ${tests_path}${src_name}.test"
    eval "$run_test"
  else
    echo "Invalid path"
    exit 1
  fi
done
