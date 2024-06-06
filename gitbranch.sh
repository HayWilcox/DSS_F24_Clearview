# Create a new branch in git based on input from user
# using branch name as argument

# Usage: ./gitbranch.sh branch_name
# Example: ./gitbranch.sh nickb

# Check if branch name is provided
if [ -z "$1" ]; then
    echo "Please provide branch name"
    exit 1
fi

# Check if branch exists
if git show-ref --verify --quiet refs/heads/$1; then
    echo "Branch $1 already exists"
    echo "Please provide different branch name"
    exit 1
fi

git branch $1
git push --set-upstream origin $1
git branch --set-upstream-to=origin/$1 $1
git pull
git push
git branch
echo "Branch $1 created successfully"