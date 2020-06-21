#!/bin/bash

readonly DIRPATH=$(cd $(dirname ${BASH_SOURCE:-$0})/; pwd)
readonly REPO_ROOT=$(cd $DIRPATH/..; pwd)
readonly PROJECT_NAME='ScreenBroadcasting'

if ! type -a xcodegen; then
    echo "Missing command: xcodegen" >&2
    exit 1
fi

if ! test -d $REPO_ROOT/$PROJECT_NAME; then
    echo "Missing: $REPO_ROOT/$PROJECT_NAME" >&2
    exit 1
fi

cd $REPO_ROOT/$PROJECT_NAME
xcodegen generate
