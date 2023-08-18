#!/usr/bin/env bash

if [ -n "$(git status --porcelain)" ]; then 
  echo "git status isn't clean, commit or stash your work"
  exit 1
fi
