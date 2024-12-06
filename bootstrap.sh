#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if ! git -C . rev-parse; then
  echo "Git repository not found in the current directory."
  exit 1
fi

git fetch --all
git pull origin main || { echo "Failed to pull from origin/main"; exit 1; }

files="\
aliases \
bash_profile \
bash_prompt \
bashrc \
curlrc \
editorconfig \
exports \
functions \
gitconfig \
gitignore \
hushlogin \
inorc \
inputrc \
screenrc \
tmux.conf \
vim \
vimrc \
wgetrc"

function makeSymlinks() {
  for file in $files; do
    if [ -e "$HOME/.$file" ]; then
      echo "File or symlink already exists: $HOME/.$file"
    else
      ln -s "$SCRIPT_DIR/$file" "$HOME/.$file"
      echo "Created symlink for $file"
    fi
  done
}

makeSymlinks;
unset makeSymlinks;

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim" || { echo "Failed to clone Vundle.vim"; exit 1; }
else
  echo "Vundle.vim already exists in $HOME/.vim/bundle/Vundle.vim"
fi
