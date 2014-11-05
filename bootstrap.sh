#!/usr/bin/env bash

dir=$(dirname "${BASH_SOURCE}");
echo $dir
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
vim \
vimrc \
wgetrc"

function makeSymlinks() {
  for file in $files
  do
    ln -s "$dir/$file" "~/.$file"
  done
}

makeSymlinks;
unset makeSymlinks;
