#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" -a $"$TRAVIS_PULL_REQUEST" == "false" ]; 
then
  echo "$TRAVIS_BRANCH"
  ./node_modules/.bin/firebase deploy -P staging --token $FIREBASE_STAGING_DEPLOY_TOKEN
  exit 0
elif [ "$TRAVIS_BRANCH" == "production" -a $"$TRAVIS_PULL_REQUEST" == "false" ];
then
  echo "$TRAVIS_BRANCH"
  ./node_modules/.bin/firebase deploy -P production --token $FIREBASE_PRODUCTION_DEPLOY_TOKEN 
else
  echo "Will only deploy if not a pull request and branch is either master or staging"
  exit 0
fi