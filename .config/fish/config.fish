# Remove Greeting
set fish_greeting

# Local Bin
set -gx PATH $PATH ~/.local/bin

# Android SDK
set -gx ANDROID_HOME /opt/android/SDK
set -gx PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools

# Flutter
set -gx PATH $PATH /home/sucipto/App/flutter/bin

# Bolang
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN

# Yarn
set -gx PATH $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin $PATH

alias vim=nvim
alias rn=react-native
alias yt="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
