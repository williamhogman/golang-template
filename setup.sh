#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"


GH_PATH=$(git remote get-url origin | grep -E -i -w -o "[a-z]+/[a-z]+")

go mod init github.com/$GH_PATH
go get go.uber.org/fx
git rm README.md
git add go.mod go.sum
