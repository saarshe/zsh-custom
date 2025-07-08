#!/bin/zsh

git-branch-switch() {
  # Exit if not inside a Git repository
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ Error: This is not a Git repository."
    return 1
fi

# Fetch all remote references to ensure up-to-date branch list
echo "🔄 Fetching remote branches..."
git fetch --all > /dev/null 2>&1

# List local and remote branches, excluding symbolic refs like origin/HEAD
branch=$(
  {
    git branch --format="%(refname:short)"
    git branch -r --format="%(refname:short)" | grep -v "origin/HEAD"
  } | fzf --height=20% --reverse --prompt="Select a branch: "
)

if [[ -n $branch ]]; then
  # Remove 'remotes/origin/' if it's a remote branch
  cleaned_branch="${branch#remotes/origin/}"
  echo "📦 Checking out: $cleaned_branch"
  git checkout "$cleaned_branch"
else
  echo "⚠️ No branch selected."
  fi
}