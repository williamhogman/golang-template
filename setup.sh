#!/usr/bin/env bash

set -x

GH_PATH=$(git remote get-url origin | grep -E -i -w -o "[a-z]+/[a-z]+")

go mod init github.com/$GH_PATH
go get go.uber.org/fx
