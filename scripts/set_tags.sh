#!/usr/bin/env bash
#define target branch
BRANCH="release"
while IFS='' read -r line || [[ -n "$line" ]]; do
    SEMVER=$line
done < $TRAVIS_BUILD_DIR/version.txt
VERSION="v$SEMVER-${TRAVIS_BUILD_NUMBER}"

# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then
    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo -e "tag of the commit : $VERSION \n"
      # Add tag and push to release.
      git tag -a $VERSION -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      echo -e "push to : ${GIT_DEPLOY_REPO}"
      git push --tags --repo="${GIT_DEPLOY_REPO}"
      git fetch --tags
      git describe --abbrev=0 --tags
      echo -e "Tag $VERSION added, pushed and fetched. \n"
      #git fetch "origin"
      #git checkout -B "master" "origin/master"
      #git merge "release"
      #echo -e "merged into master"
      #git push --repo="${GIT_DEPLOY_REPO}"
      #echo -e "pushed into master"
      #git checkout "release"
  fi
fi