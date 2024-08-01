#! /usr/bin/env bash

set -euxo pipefail
#touch "$HOME/.vimrc"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

case $(uname) in
	"Darwin")
		brew install git-delta
		;;
	"Linux")
		# assume ubuntu amd64
		wget -P /tmp https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb
		sudo dpkg -i /tmp/git-delta_0.17.0_amd64.deb
		;;
esac

# Output source commands to target vimrc
cat >> "$HOME/.gitconfig" <<- EOF
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections

    # delta detects terminal colors automatically; set one of these to disable auto-detection
    # dark = true
    # light = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default

EOF

if [[ $(git config --list --show-origin | awk -F'\t' '{sub(/^file:/, "", $1); print $1}' | sort -u | grep -q "^$HOME/.gitconfig$"; echo $?) -ne 0 ]]; then
	echo "WARNING: "$HOME/.gitconfig" does not seemed to be used by git. Use git config --list --show-origin to find the right config file"
else
	echo "DONE: wrote commands to $HOME/.gitconfig"
fi

