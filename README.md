# zsh-custom 🧰

A collection of personal Zsh scripts and aliases to enhance your terminal workflow.

---

## 📦 Features

- **Scripts** — Useful custom functions for Git workflows:
  - `grepo` — Interactively select and open a local Git repo; with options to pull and launch in VS Code.
  - `git-garbage-collection` — Prune stale remotes & branches in the current Git repo.
  - `git-branch-switch` — Browse local and remote branches via `fzf` and check out easily.
- **aliases** — A curated set of time-saving aliases for Git, filesystem navigation, and the scripts in this repo.

---

## ⚙️ Prerequisites

- macOS or Unix-like environment
- [Zsh](https://www.zsh.org/)
- [Oh My Zsh](https://ohmyz.sh/) (optional)
- [fzf](https://github.com/junegunn/fzf) – required for interactive selections
- [`code`](https://code.visualstudio.com/) CLI – optional, for opening repos in VS Code (`grepo -o`)

### 📖 Want the full context?
Check out the blog post that explains my full `.zshrc` setup, including these scripts and more:  
👉 [Supercharging Your Terminal: A Deep Dive into My .zshrc](https://medium.com/wix-engineering/supercharging-your-terminal-a-deep-dive-into-my-zshrc-ea57757a1d23)

---

## 🚀 Installation

Clone the repo to a hidden directory:

```bash
git clone git@github.com:saarshe/zsh-custom.git ~/.zsh-custom
```

Update your `~/.zshrc` with the following:

```zsh
# Load custom aliases
source "$HOME/.zsh-custom/aliases"

# Add custom scripts to your PATH
export PATH="$HOME/.zsh-custom/scripts:$PATH"
```

Apply the changes:

```bash
chmod +x ~/.zsh-custom/scripts/*
source ~/.zshrc
```

> 💡 You can clone the repo anywhere you like — just update the paths in `.zshrc` accordingly.

---

## 🛠 Usage

### 🔧 Aliases

Your shell will now support useful shortcuts like:

| Alias       | Expands To                   | Description                              |
|-------------|------------------------------|------------------------------------------|
| **Yarn/Package Management** |              |                                          |
| `y`         | `yarn`                       | Yarn package manager                     |
| `my`        | `midgard-yarn`               | Custom Midgard yarn command              |
| `yb`        | `yarn build`                 | Build the project                        |
| `yba`       | `yarn build:app`             | Build the app specifically               |
| `ys`        | `yarn start`                 | Start the development server             |
| `yt`        | `yarn test`                  | Run tests                                |
| `ytw`       | `yarn test:watch`            | Run tests in watch mode                  |
| **Git**     |                              |                                          |
| `gc-`       | `git checkout -`             | Switch to previous branch                |
| `ggc`       | `git-garbage-collection`     | Clean stale Git branches                 |
| `gbs`       | `git-branch-switch`          | Interactively switch Git branch          |
| **Navigation** |                          |                                          |
| `..`        | `cd ..`                      | Go up one directory                      |
| `...`       | `cd ../..`                   | Go up two directories                    |
| **Date/Time** |                            |                                          |
| `now`       | `date "+%Y-%m-%d %H:%M:%S"`  | Show current date and time               |
| `ts`        | `date +%s`                   | Show current timestamp                   |
| **macOS Finder** |                        |                                          |
| `showfiles` | `defaults write...`          | Show hidden files in Finder             |
| `hidefiles` | `defaults write...`          | Hide hidden files in Finder             |

> 📁 See [`aliases`](aliases) for the full list.

### 📜 Scripts

| Script                   | Description                                         |
|--------------------------|-----------------------------------------------------|
| `grepo`                  | Interactively select and `cd` into a local repo    |
|                          | Use `-p` to pull changes, `-o` to open in VS Code  |
| `git-garbage-collection` | Prune remotes and delete stale local branches       |
| `git-branch-switch`      | Select a branch (local or remote) and switch to it  |

---
## 📄 Examples

Open a project, pull changes, and launch in VS Code:

```bash
grepo -p -o
```

Clean up old branches:

```bash
ggc
```

Switch branches:

```bash
gbs
```
---

## 📬 Feedback

Have ideas, requests, or feedback?  
Open an issue or reach out via [my Medium profile](https://medium.com/@saarshe).

---
