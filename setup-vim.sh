#! /usr/bin/env bash

set -euxo pipefail
touch "$HOME/.vimrc"

vimrc_path="/Users/maruthgoyal/dotfiles/vim/vimrc"
coc_config_path="/Users/maruthgoyal/dotfiles/vim/coc-config.vim"
target_vimrc="$HOME/.vimrc"

# Output source commands to target vimrc
echo "source $vimrc_path" > "$target_vimrc"
echo "source $coc_config_path" >> "$target_vimrc"

echo "Successfully wrote source commands to ~/.vimrc"
