BRANCH="release"
SEMVER="0.0.1" #VERY BAD !

# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then
    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo -e "Starting to tag commit.\n"
      #set the losttime adress ?
      git config --global user.email "travis@travis-ci.org"
      git config --global user.name "Travis"
      echo -e "changed name"
      # Add tag and push to release.
      git tag -a v$SEMVER-${TRAVIS_BUILD_NUMBER} -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      echo -e "tag commit"
      echo -e "github key : ${GITHUBKEY}"
      echo -e "push with : ${GIT_DEPLOY_REPO}"
      git push origin --tags --repo="${GIT_DEPLOY_REPO}"
      git fetch origin
     if [ ! -z "$TRAVIS_TAG" ]; then
      echo -e "Tag added, pushed and fetched.\n"
     fi
  fi
fi