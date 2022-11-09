#!/usr/bin/env zsh

# cd to the location of the script
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH

installresult=$(npm i --silent)
if [[ "$installresult" == *"high"* ]]
then
  echo "Installation verified - NOT OK"
  echo $installresult
  exit 1
fi

lintresult=$(npm run lint --silent)
if [[ "$lintresult" == *"error"* ]]
then
  echo "Linting verified - NOT OK"
  echo $lintresult
  exit 1
fi

testresult=$(npm run test --silent)
if [[ "$testresult" != *"1 passing"* ]]
then
  echo "Testing verified - NOT OK"
  echo $testresult
  exit 1
fi

buildresult=$(npm run build --silent)
if [[ "$buildresult" != *""* ]]
then
  echo "Build verified - NOT OK"
  echo $buildresult
  exit 1
fi

# cd back to where we came from
cd - > /dev/null

echo "Installation, linting, testing and building verified - OK"
exit 0

