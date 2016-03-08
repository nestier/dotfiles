#!/usr/bin/env bash

# files=(vimrc vim zsh sarasa)
for file in $(ls); do
    destination="${HOME}/.${file}"
    # [ -e "${destination}" ] && rm -fr $destination
    [ -e $destination -o -h $destination ] && rm -rf $destination
    ln -s $(pwd)/$file $destination
done
