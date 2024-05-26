#! /usr/bin/env bash

set -euxo pipefail
touch "$HOME/.vimrc"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
vimrc_path="${SCRIPT_DIR}/vim/vimrc"
coc_config_path="${SCRIPT_DIR}/vim/coc-config.vim"
target_vimrc="$HOME/.vimrc"

# Output source commands to target vimrc
echo "source $vimrc_path" > "$target_vimrc"
echo "source $coc_config_path" >> "$target_vimrc"

echo "Successfully wrote source commands to ~/.vimrc"
