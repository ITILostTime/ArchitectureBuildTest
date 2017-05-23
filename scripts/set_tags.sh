BRANCH="release"
SEMVER="0.0.8" #VERY BAD !

# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then
    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo -e "$TRAVIS_TAG"
      echo -e "Starting to tag commit.\n"
      # Add tag and push to release.
      git tag -a v$SEMVER-${TRAVIS_BUILD_NUMBER} -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      echo -e "tag commit"
      echo -e "github key : ${GITHUBKEY}"
      echo -e "push with : ${GIT_DEPLOY_REPO}"
      git push --tags --repo="${GIT_DEPLOY_REPO}"
      git fetch --tags
     if [ ! -z "$TRAVIS_TAG" ]; then
      echo -e "Tag added, pushed and fetched.\n"
      else
      echo -e "NOPE \n"
     fi
  fi
fi