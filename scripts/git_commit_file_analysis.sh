#!/bin/sh
files=`git diff-tree --no-commit-id --name-only -r HEAD`

for file in $files
do
  if [[ ${file} =~ ^.+\.rb$ ]]; then
    echo "\033[33;36mCHECKING: \033[33;12m" $file "\033[0m"

    if [[ ${file} =~ ^[^(spec|test)].+\.rb$ ]]; then
      echo "Flog:"
      flog $file | head -2
      flog $file | grep '^\s*\d\d.\d.\+:\d\+$'

      echo "\nReek:"
      reek $file

      echo "\n\nRuby Lint:"
      ruby-lint $file
    fi

    echo "\nRuboCop:"
    rubocop $file | tail -n +4 | sed '$d'
  fi
done
