#!/bin/bash
set -e
set -x

# This script is meant to run on Travis-CI only
if [ -z "$TRAVIS_BRANCH" ]; then 
  echo "ABORTING: this script runs on Travis-CI only"
  exit
fi
# Check essential envs
if [ -z "$GITHUB_TOKEN" ]; then
  echo "ABORTING: env GITHUB_TOKEN is missing"
  exit
fi

# create a build number
export BUILD_NR="$(date '+%Y%m%d-%H%M%S')"
echo "BUILD_NR=$BUILD_NR"

# run build
docker-compose build
docker-compose run builder

# deploy to GitHub releases
export GIT_TAG=v$BUILD_NR
export GIT_RELTEXT="Auto-released by [Travis-CI build #$TRAVIS_BUILD_NUMBER/#$TRAVIS_JOB_NUMBER](https://travis-ci.com/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID)"
curl -sSL https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_linux_amd64.zip > ghr.zip
unzip ghr.zip
./ghr --version
./ghr --debug -u DieterReuter -b "$GIT_RELTEXT" $GIT_TAG builds/$BUILD_NR/
