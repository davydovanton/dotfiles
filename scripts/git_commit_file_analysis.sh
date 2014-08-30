#!/bin/sh
files=`git diff-tree --no-commit-id --name-only -r HEAD`

for file in $files
do
  if [[ ${file} =~ ^.+\.rb$ ]]; then
    echo "\033[33;36mCHECKING: \033[33;12m" $file "\033[0m"
    if [[ ${file} =~ ^[^(spec|test)].+\.rb$ ]]; then
      flog $file | grep "^10"
      reek $file
    fi
    rubocop $file
  fi
done
