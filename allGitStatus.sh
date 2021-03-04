#!/bin/sh

find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(cd {} && if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]; then if [ "$(git status --porcelain 2>/dev/null)" ]; then echo {} && git status -s && echo; fi else echo "This is not git repo"; fi)' \;

