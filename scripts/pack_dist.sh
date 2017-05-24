#!/usr/bin/env bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    SEMVER=$line
done < $TRAVIS_BUILD_DIR/version.txt
VERSION="v$SEMVER-${TRAVIS_BUILD_NUMBER}"

zip -r dist $TRAVIS_BUILD_DIR/src/ITI.PrimarySchool.WebApp/wwwroot/dist
cp -R dist.zip $TRAVIS_BUILD_DIR/artifacts/
