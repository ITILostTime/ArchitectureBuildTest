BRANCH="release"
SEMVER="0.0.9" #VERY BAD !
VERSIONTAG="v$SEMVER-${TRAVIS_BUILD_NUMBER}"
# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then
    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo -e "Travis tag is : $TRAVIS_TAG"
      echo -e "Starting to tag commit.\n"
      # Add tag and push to release.
      git tag -a  -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      echo -e "tag commit: $VERSIONTAG"
      echo -e "push to : ${GIT_DEPLOY_REPO}"
      #git push --tags $VERSIONTAG --repo="${GIT_DEPLOY_REPO}"
      git fetch --tags
      TRAVIS_TAG=$VERSIONTAG
      echo -e "Travis tag is : $TRAVIS_TAG"
     if [ -z "$TRAVIS_TAG" ]; then
      echo -e "Tag empty \n"
      else
      echo -e "Tag $TRAVIS_TAG added, pushed and fetched. \n"
     fi
  fi
fi