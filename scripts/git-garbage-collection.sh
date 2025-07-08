#!/bin/zsh

# Exit if not inside a Git repository
git-garbage-collection() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ Error: This is not a Git repository."
    return 1
fi

echo "🔄 Fetching and pruning stale remote references..."
git fetch --prune > /dev/null 2>&1

echo "🧹 Pruning stale remote-tracking branches for 'origin'..."
git remote prune origin > /dev/null 2>&1
echo "✅ Remote pruning complete."

# Find local branches that are tracking deleted remote branches
stale_branches=($(git branch -vv | grep ': gone]' | awk '{print $1}' | sed 's/^\*//'))

if [[ ${#stale_branches[@]} -gt 0 ]]; then
  echo "🚨 The following local branches no longer track a remote:"
  for branch in "${stale_branches[@]}"; do
    echo "  - $branch"
  done
  echo

  for branch in "${stale_branches[@]}"; do
    echo -n "❓ Force delete '$branch'? [y/N]: "
    read -r confirmation
    if [[ $confirmation =~ ^[Yy]$ ]]; then
      git branch -D "$branch"
    else
      echo "⏭️ Skipped '$branch'."
    fi
  done
else
    echo "✅ No stale local branches found."
  fi
}