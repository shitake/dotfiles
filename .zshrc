# 補完
autoload -U compinit
compinit

# 20130227追記
# 入力時に大文字小文字を区別せず補完
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|{-_.}=**'

source ~/.pythonbrew/etc/bashrc

# vimらの
# alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim' $@
# alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim' $@
