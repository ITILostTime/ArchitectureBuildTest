#!/usr/bin/env bash

#exit if any command fails
set -e

artifactsFolder="./artifacts"
PURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
while IFS='' read -r line || [[ -n "$line" ]]; do
    SEMVER=$line
done < $TRAVIS_BUILD_DIR/version.txt
VERSION="v$SEMVER-${TRAVIS_BUILD_NUMBER}"

#if [ -d $artifactsFolder ]; then  
#  rm -R $artifactsFolder
#fi
echo -e "${PURPLE}Starting to build DOTNETCORE${NC}"
dotnet restore

# Ideally we would use the 'dotnet test' command to test netcoreapp and net451 so restrict for now 
# but this currently doesn't work due to https://github.com/dotnet/cli/issues/3073 so restrict to netcoreapp

# dotnet test ./test/TEST_PROJECT_NAME -c Release -f netcoreapp1.0

# Instead, run directly with mono for the full .net version 
#dotnet build ./src/ITI.PrimarySchool.DAL.Test -c Release -f net451

#mono \  
#./src/ITI.PrimarySchool.DAL.Test/bin/Release/net451/*/dotnet-test-xunit.exe \
#./src/ITI.PrimarySchool.DAL.Test/bin/Release/net451/*/TEST_PROJECT_NAME.dll

#switch release

dotnet pack ./src/ITI.PrimarySchool.WebApp -c Release -o $TRAVIS_BUILD_DIR/artifacts --version-suffix=$VERSION 

# look for empty dir 
if [ "$(ls -A $TRAVIS_BUILD_DIR/artifacts)" ]; then
     echo -e "\n ${GREEN} Take action $TRAVIS_BUILD_DIR/artifacts is not Empty ${NC}"
else
    echo -e "\n ${RED} $TRAVIS_BUILD_DIR/artifacts is Empty ${NC}"
fi
echo -e "${PURPLE} FINISHED BUILDING OF DOTNETCORE ${NC}"