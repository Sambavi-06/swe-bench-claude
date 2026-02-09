#!/bin/bash
set -e

REPO_URL="https://github.com/internetarchive/openlibrary.git"
BASE_COMMIT="84cc4ed5697b83a849e9106a09bfed501169cc20"
TEST_FILE_COMMIT="c4eebe6677acc4629cb541a98d5e91311444f5d4"
TARGET_DIR="/testbed"

echo "Setting up repository in $TARGET_DIR..."

if [ ! -d "$TARGET_DIR/.git" ]; then
    mkdir -p $TARGET_DIR
    git clone $REPO_URL $TARGET_DIR
fi

git -C $TARGET_DIR config --global --add safe.directory $TARGET_DIR
git -C $TARGET_DIR reset --hard $BASE_COMMIT
git -C $TARGET_DIR clean -fd

# Checkout the specific test file that contains the new tests
git -C $TARGET_DIR checkout $TEST_FILE_COMMIT -- openlibrary/tests/core/test_imports.py

echo "Repository setup complete."
