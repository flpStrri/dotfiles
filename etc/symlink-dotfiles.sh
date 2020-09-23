#!/bin/sh

DEVELOPMENT_DIR="$HOME/GitHub"
DOTFILES_DIR="$DEVELOPMENT_DIR/dotfiles"

echo ""
if [ -d "$DOTFILES_DIR" ]; then
  echo "Symlinking dotfiles from $DOTFILES_DIR"
else
  echo "$DOTFILES_DIR does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file}"
  link "$DOTFILES_DIR/$location" "$HOME/$file"
done
