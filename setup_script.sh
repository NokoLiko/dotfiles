#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"
CONFIG="$HOME/.config"

link_config() {
	local source="$1"
	local destination="$2"

	if [[ -L "$destination" && "$(readlink -f "$destination")" == "$(readlink -f "$source")" ]]; then
		echo "Already linked: $destination"
		return
	fi
	
	echo "Creating Link for: $source in $destination"
	if ! ln -s "$source" "$destination"; then
		echo "Hubo un error creando el link" >&2
	fi
}

link_config "$DOTFILES/nvim" "$CONFIG/nvim"
link_config "$DOTFILES/ghostty" "$CONFIG/ghostty"
link_config "$DOTFILES/bashrc/.bashrc" "$HOME/.bashrc"
link_config "$DOTFILES/starship.toml" "$CONFIG/starship.toml"

# [[ ... ]] evaluates conditional expressions, such as file checks and string comparisons:
# [[ -e "$path" ]]          # Path exists
# [[ -f "$path" ]]          # Regular file
# [[ -d "$path" ]]          # Directory
# [[ -L "$path" ]]          # Symbolic link
# [[ "$name" == "John" ]]   # Strings are equal
# [[ "$count" -gt 5 ]]      # Number is greater than 5
# [[ -n "$value" ]]         # String is not empty
# [[ -z "$value" ]]         # String is empty
# 'if' can test command exit status
#  if ln -s "$source" "$destination"; then
#      echo "Success"
#  fi
# $() only when you need the output, such as:
# target=$(readlink -f "$destination")
# $() captures a command’s text output
