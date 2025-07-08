#!/bin/bash

# AI Commit Script
# This script helps automate git commits

# Exit on any error
set -e

# Function to display usage
usage() {
	echo "Usage: $0 [commit message]"
	echo "Example: $0 'Added new feature'"
	exit 1
}

# Check if commit message is provided
if [ $# -eq 0 ]; then
	echo "Error: No commit message provided"
	usage
fi

# Get the commit message
COMMIT_MESSAGE="$1"

# Add all changes
git add .

# Commit with the provided message
git commit -m "$COMMIT_MESSAGE"

# Push to remote repository
git push

echo "Successfully committed and pushed changes!"
