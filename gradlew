#!/bin/sh
set -eu

BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
GRADLE_VERSION=8.9
GRADLE_HOME="$BASE_DIR/.gradle-local/gradle-$GRADLE_VERSION"

if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
    mkdir -p "$BASE_DIR/.gradle-local"
    cd "$BASE_DIR/.gradle-local"
    if [ ! -d "gradle-$GRADLE_VERSION" ]; then
        curl -fL "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip" -o gradle.zip
        unzip -q gradle.zip
        rm gradle.zip
    fi
fi

exec "$GRADLE_HOME/bin/gradle" "$@"
