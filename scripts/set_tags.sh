BRANCH="release"
SEMVER="0.0.10" #VERY BAD !
VERSIONTAG="v$SEMVER-${TRAVIS_BUILD_NUMBER}"

# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then
    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo -e "Travis tag is : $TRAVIS_TAG"
      echo -e "tag of the commit : $VERSIONTAG \n"
      # Add tag and push to release.
      git tag -a $VERSIONTAG -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      echo -e "Travis tag is now : $TRAVIS_TAG"

      echo -e "push to : ${GIT_DEPLOY_REPO}"
      git push $VERSIONTAG HEAD:release --repo="${GIT_DEPLOY_REPO}"
      git fetch --tags
      echo -e "Travis tag is : $TRAVIS_TAG"
      TRAVIS_TAG=$VERSIONTAG
      echo -e "Travis tag is now : $TRAVIS_TAG"
      if [ -z "$TRAVIS_TAG" ]; then
        echo -e "Tag empty \n"
        else
        echo -e "Tag $TRAVIS_TAG added, pushed and fetched. \n"
      fi
  fi
fi