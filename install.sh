#!/bin/bash
set -e

# Downloads arcanist, libphutil, etc. into $HOME/.arcanist/ ...
INSTALL_DIR="$HOME/.arcanist/"
BIN_DIR="$HOME/bin"

if [ ! -e "$INSTALL_DIR" ]; then
    mkdir -p $INSTALL_DIR
fi;
if [ ! -e "$BIN_DIR" ]; then
    mkdir -p $BIN_DIR
fi;

# Install or update libphutil ...
echo "Updating arcanist repos ..."
if [ -e "$INSTALL_DIR/libphutil" ]; then
    arc upgrade
else
    git clone git://github.com/facebook/libphutil.git "$INSTALL_DIR/libphutil"
    git clone git://github.com/facebook/arcanist.git "$INSTALL_DIR/arcanist"
fi

# Register arc commands ...
echo "Registering arc command ..."

# arc
ln -s "$INSTALL_DIR/arcanist/bin/arc" "$BIN_DIR/arc"

echo
echo "Please add $HOME/bin to your PATH or run arc like so: ~/bin/arc"
echo
echo "Done!"
