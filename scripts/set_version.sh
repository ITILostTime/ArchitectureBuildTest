while IFS='' read -r line || [[ -n "$line" ]]; do
    SEMVER=$line
done < $TRAVIS_BUILD_DIR/version.txt
VERSION="v$SEMVER-${TRAVIS_BUILD_NUMBER}"