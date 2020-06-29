#!/bin/sh

# Install Vim Plug
echo "Install Vim Plugin Manager"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Plugin
echo "Install Vim Plugin"
nvim -c 'PlugInstall|q|q'

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy Tmux Conf
cp .tmux.conf ~/.tmux.conf
