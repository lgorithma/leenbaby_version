#!/bin/bash

# Script to push version updates with version number in commit message
# Usage: ./push_version.sh [optional custom message]

set -e

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Extract current version from version.json
VERSION=$(grep -o '"current_version"[[:space:]]*:[[:space:]]*"[^"]*"' version.json | sed 's/.*"\([^"]*\)".*/\1/')

if [ -z "$VERSION" ]; then
    echo "Error: Could not extract version from version.json"
    exit 1
fi

echo "Current version: $VERSION"

# Check if there are changes to commit
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to commit"
    exit 0
fi

# Add all changes in the version directory
git add .

# Create commit message
if [ -n "$1" ]; then
    COMMIT_MSG="chore: release version $VERSION - $1"
else
    COMMIT_MSG="chore: release version $VERSION"
fi

echo "Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# Push to remote
echo "Pushing to remote..."
git push

echo "✅ Successfully pushed version $VERSION"
