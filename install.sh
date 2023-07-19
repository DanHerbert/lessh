#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -eux

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config/source-highlight

hilite_wrapper='src-hilite-lesspipewrapper.sh'
ln -sf "$SCRIPT_DIR/$hilite_wrapper" "$HOME/.local/bin/"
ln -sf "$SCRIPT_DIR/lessh" "$HOME/.local/bin/"

ln -sf "$SCRIPT_DIR/esc.outlang" "$HOME/.config/source-highlight/"
ln -sf "$SCRIPT_DIR/esc256.outlang" "$HOME/.config/source-highlight/"
ln -sf "$SCRIPT_DIR/lang.map" "$HOME/.config/source-highlight/"

set +x
echo 'lessh has been set up and is ready to use.'
