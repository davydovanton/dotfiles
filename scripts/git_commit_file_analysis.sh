#!/bin/sh

call_flog() {
  echo "Flog:"
  flog $file | head -2
  flog $file | grep '^\s*\d[1-9].\d.\+:\d\+$'
}

call_reek() {
  echo "\nReek:"
  reek $file
}

call_ruby_lint() {
  echo "\n\nRuby Lint:"
  ruby-lint $file
}

call_rubocop() {
    echo "\nRuboCop:"
    rubocop $file | tail -n +4 | sed '$d'
}

analyse_for_ruby_file() {
  ruby_file='^.+\.rb$'
  test_or_config_file='^(spec|test|config|db).+\.rb$'
  if [[ ${file} =~ $ruby_file ]]; then
    echo "\033[33;36mCHECKING: \033[33;12m" $file "\033[0m"

    if ! [[ ${file} =~ $test_file ]]; then
      call_flog $file
      call_reek $file
      call_ruby_lint $file
    fi
    call_rubocop $file
  fi
}

files=`git diff-tree --no-commit-id --name-only -r HEAD`
for file in $files
do
  analyse_for_ruby_file $file
done
