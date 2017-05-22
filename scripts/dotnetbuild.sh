#!/usr/bin/env bash

#exit if any command fails
set -e

artifactsFolder="./artifacts"

#if [ -d $artifactsFolder ]; then  
#  rm -R $artifactsFolder
#fi

dotnet restore

# Ideally we would use the 'dotnet test' command to test netcoreapp and net451 so restrict for now 
# but this currently doesn't work due to https://github.com/dotnet/cli/issues/3073 so restrict to netcoreapp

# dotnet test ./test/TEST_PROJECT_NAME -c Release -f netcoreapp1.0

# Instead, run directly with mono for the full .net version 
#dotnet build ./src/ITI.PrimarySchool.DAL.Test -c Release -f net451

#mono \  
#./src/ITI.PrimarySchool.DAL.Test/bin/Release/net451/*/dotnet-test-xunit.exe \
#./src/ITI.PrimarySchool.DAL.Test/bin/Release/net451/*/TEST_PROJECT_NAME.dll

#set tag version based on the file at the root of the system
revision=${TRAVIS_JOB_ID:=1}  
revision=$(printf "%04d" $revision) 

#switch release

dotnet pack ./src/ITI.PrimarySchool.WebApp -c Release -o $TRAVIS_BUILD_DIR/artifacts --version-suffix=$revision  
# look for empty dir 
if [ "$(ls -A $TRAVIS_BUILD_DIR/artifacts)" ]; then
     echo "Take action $TRAVIS_BUILD_DIR/artifacts is not Empty"
else
    echo "$TRAVIS_BUILD_DIR/artifacts is Empty"
fi
echo "FINISHED BUILDING OF DOTNETCORE"