#!/bin/zsh

# Navigate to a repository interactively
go-to-repo() {
  local repo_dir=~/wix/prod
  local open_in_editor=false
  local pull_latest=false

  # Parse flags
  while [[ $# -gt 0 ]]; do
    case $1 in
      -o|--open)
        open_in_editor=true
        shift
        ;;
      -p|--pull)
        pull_latest=true
        shift
        ;;
      *)
        echo "Unknown option: $1"
        return 1
        ;;
    esac
  done

  # Select repository
  local selected_repo=$(find "$repo_dir" -maxdepth 1 -type d | fzf --height=20% --reverse --border --prompt="Select a repo: ")

  if [[ -n $selected_repo ]]; then
    cd "$selected_repo" || {
      echo "❌ Failed to navigate to $selected_repo"
      return 1
    }

    if $pull_latest; then
      echo "🔄 Pulling latest changes..."
      git pull --ff-only
    fi
    if $open_in_editor; then
      code .
    fi
  else
    echo "⚠️ No valid repository selected"
  fi
}