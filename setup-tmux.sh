#! /usr/bin/env bash

set -euxo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
touch "$HOME/.tmux.conf"


# Output source commands to target vimrc
echo "source ${SCRIPT_DIR}/tmux/tmux.conf" > "$HOME/.tmux.conf"

echo "Successfully wrote source commands to ~/tmux.conf"
