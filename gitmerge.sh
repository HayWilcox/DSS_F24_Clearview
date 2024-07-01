#!/bin/bash
# Create git merge request from main to branch 
# using branch name as argument

# Usage: ./gitmerge.sh branch_name
# Example: ./gitmerge.sh nickb

# Check if branch name is provided
if [ -z "$1" ]; then
    echo "Please provide branch name"
    exit 1
fi

# Check if branch exists
if ! git show-ref --verify --quiet refs/heads/$1; then
    echo "Branch $1 does not exist"
    echo "Please provide valid branch name or use gitbranch.sh to create new branch"
    exit 1
fi

git checkout main
git pull
git checkout $1
git merge main