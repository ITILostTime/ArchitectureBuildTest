BRANCH="release"
SEMVER="0.0.1" #VERY BAD !

# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then
  
  # Is this not a Pull Request?
  if [ "$TRAVIS_PULL_REQUEST" = false ]; then
    
    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo -e "Starting to tag commit.\n"
      #set the losttime adress ?
      #git config --global user.email "travis@travis-ci.org"
      #git config --global user.name "Travis"

      #merge the release into master with the tag

      # Add tag and push to release.
      git tag -a v$SEMVER-${TRAVIS_BUILD_NUMBER} -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      git push origin --tags
      git fetch origin
      echo -e "Done magic with tags.\n"
  fi
  fi
fi