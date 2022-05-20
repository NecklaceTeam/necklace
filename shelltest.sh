# !/bin/bash

shelltests_path="$(dirname $(realpath $0))/shelltests"
src_paths="$shelltests_path/src/*"
tests_path="$shelltests_path/tests/"

if [[ $1 ]]; then
  src_paths="$shelltests_path/src/$1/*"
  tests_path="$shelltests_path/tests/$1/*"
fi

for src_path in $src_paths
do
  [ -e "$src_path" ] || continue
  if [[ -d $src_path ]]; then
    echo "${src_path##*/}"
    nested_shelltest="${src_path}/*"
    for nested_src_path in $nested_shelltest
    do
      nested_src_path_without_extension=${nested_src_path%%.*}
      test_path=${nested_src_path_without_extension##*src/}
      compile_program="stack run necklace-exe ${nested_src_path}"
      eval "$compile_program"
      run_test="shelltest ${tests_path}${test_path}.test -c | head -n -5 | sed --unbuffered -e 's/\(.*OK.*\)/\o033[32m\1\o033[39m/' -e 's/\(.*Failed.*\)/\o033[31m\1\o033[39m/'"
      eval "$run_test"
      echo " "
    done
  elif [[ -f $src_path ]]; then
    src_path_without_extension=${src_path%%.*}
    src_name=${src_path_without_extension##*/}
    compile_program="stack run necklace-exe ${src_path}"
    eval "$compile_program"
    run_test="shelltest ${tests_path}${src_name}.test -c | head -n -5 | sed --unbuffered -e 's/\(.*OK.*\)/\o033[32m\1\o033[39m/' -e 's/\(.*Failed.*\)/\o033[31m\1\o033[39m/'"
    eval "$run_test"
    echo " "
  else
    echo "Invalid path"
    exit 1
  fi
done
