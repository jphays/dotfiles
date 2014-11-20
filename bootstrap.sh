#!/usr/bin/env bash

dir=$(dirname "${BASH_SOURCE}");
cd "$dir";

git pull origin master;

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
inputrc \
screenrc \
tmux.conf \
vim \
vimrc \
wgetrc"

function makeSymlinks() {
  for file in $files
  do
    ln -s "$dir/$file" "$HOME/.$file"
  done
}

makeSymlinks;
unset makeSymlinks;
