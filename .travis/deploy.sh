#!/bin/bash
# expects variables to be set:
# - SONATYPE_USERNAME
# - SONATYPE_PASSWORD
# - GPG_KEY_NAME
# - GPG_PASSPHRASE
# expects file to exist:
# - .travis/gpg-private-key.asc

set -e

# Check the variables are set
if [ -z "$SONATYPE_USERNAME" ]; then
  echo "missing environment value: SONATYPE_USERNAME" >&2
  exit 1
fi

if [ -z "$SONATYPE_PASSWORD" ]; then
  echo "missing environment value: SONATYPE_PASSWORD" >&2
  exit 1
fi

if [ -z "$GPG_KEY_NAME" ]; then
  echo "missing environment value: GPG_KEY_NAME" >&2
  exit 1
fi

if [ -z "$GPG_PASSPHRASE" ]; then
  echo "missing environment value: GPG_PASSPHRASE" >&2
  exit 1
fi

# Prepare the local keyring (requires travis to have decrypted the file beforehand)
# gpg --fast-import .travis/gpg-private-key.asc

echo "Branch is ${BRANCH_NAME}"

# Run the maven deploy steps
# ./mvnw deploy -Pdeploy -DskipTests=true "${TRAVIS_BUILD_DIR}/.travis/mvn-settings.xml"