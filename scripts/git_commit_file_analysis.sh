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

call_rubocop() {
    echo "\nRuboCop:"
    rubocop $file | tail -n +4 | sed '$d'
}

call_spellcheker() {
    echo "\nCodespell:"
    /Users/anton/bin/codespell/codespell.py $file
}

analyse_for_ruby_file() {
  ruby_file='^.+\.rb$'
  test_or_config_file='^(spec|test|config|db).+\.rb$'
  schema_file='^.+schema.rb$'
  if [[ ${file} =~ $ruby_file ]]; then
    echo "\033[33;36mCHECKING: \033[33;12m" $file "\033[0m"

    if ! [[ ${file} =~ $test_file ]]; then
      call_flog $file
      call_reek $file
    fi
    if ! [[ ${file} =~ $schema_file ]]; then
      call_rubocop $file
    fi
  fi
}

files=`git diff-tree --no-commit-id --name-only -r HEAD`
for file in $files
do
  analyse_for_ruby_file $file
  call_spellcheker $file
  echo "\n"
done

/usr/local/bin/ctags -R *
