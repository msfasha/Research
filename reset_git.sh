#!/usr/bin/env bash

# Exit immediately if any command fails
set -e

# Check for required arguments
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 \"repo-name\" \"commit message\""
  exit 1
fi

REPO_NAME="$1"
COMMIT_MSG="$2"
GITHUB_USER="msfasha"
REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
BRANCH="main"

# Remove existing git history
rm -rf .git

# Reinitialize repository
git init
git add .
git commit -m "$COMMIT_MSG"

# Configure remote and branch
git remote add origin "$REMOTE_URL"
git branch -M "$BRANCH"

# Force push to remote
git push --force origin "$BRANCH"

