export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

autoload -Uz colors
colors
# case ${UID} in
# 0)
#     PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#     PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#     SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#         PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#     ;;
#
# *)

# ------------------------------
# Colors
# ------------------------------
DEFAULT=$'%{\e[1;0m%}'
RESET="%{${reset_color}%}"
#GREEN=$'%{\e[1;32m%}'
GREEN="%{${fg[green]}%}"
LGREEN="\e]4;114;#87D787\a"
#BLUE=$'%{\e[1;35m%}'
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
WHITE="%{${fg[white]}%}"

# \e[属性;前景;背景m と \e[m で文字を囲む
# sono uchi ... hen sh u ...
typeset -A mycol
mycol=(
'RED' '38;9;0'
)
typeset -A mycolbg
mycolbg=(
'RED' '48;9;0'
)

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:on=35:so=32:pi33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ------------------------------
# Prompt
# ------------------------------
# test
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' formats '%F{blue}%b%f'
zstyle ':vcs_info:*' actionformats '%F{blue}%b%f(%fF{red}%a%f)'
precmd() { vcs_info }

# PROMPT='${fg[white]}%(5~,%-2~/.../%2~,%~)% ${RED} $ ${RESET}'
# PROMPT='[%n] %{${fg[yellow]}%}%~%{${reset_color}%}

PROMPT='%1(v|%F${GREEN}%1v%2v%f|)%B${vcs_info_git_pushed}%b${RESET}${WHITE}[${GREEN}%B%(5~,%-2~/.../%2~,%~)% ${WHITE}%b]${vcs_info_msg_0_}${WINDOW:+"[$WINDOW]"}${RESET} %(?.%{$fg[yellow]%}.%{$fg[cyan]%})%(?.%B(*'\''-'\'')<%b.%B(;'\''-'\''%)?<%b)%{${reset_color}%} '
SPROMPT='%{$fg[magenta]%}%{$suggest%}%B(;'\''-'\''%)..もしかして%b %B%r%b %B%{$fg[magenta]%}? [そうだよ(y), ちがうよ(n), あぼーん(a), へんしゅう(e)]:${reset_color}'

# 右プロンプト
RPROMPT='%{${fg[green]}%}%B*%n%B*%b%m'
# RPROMPT='%{${fg[yellow]}%}%B☆%n%B☆%b%m'

# ------------------------------
# IROIRO
# ------------------------------
# PCRE互換の正規表現を使う
setopt re_match_pcre
# cd でTabを押すとdir list を表示
setopt auto_pushd
# もしかしてのやつ
setopt correct
# コマンドラインの全スペルチェック
setopt correct_all
# 補完候補リストを詰める
setopt list_packed
# auto_list の補完候補一覧でファイルの種別表示
setopt list_types
# 補完候補が複数ある時一覧表示
setopt auto_list
# 引数 --poke=puyu の = 以降も補完
setopt magic_equal_subst
# 括弧補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加
setopt auto_param_slash
# 補完キーを押す度に補完候補を自動で補完
setopt auto_menu
# 色付き補完
zstyle ':completion:*' list-colors di=34 fi=0
# 余分な空白を詰める
setopt hist_reduce_blanks
# URLをコピペしたときに自動でエスケープ
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
# エラーメッセージ色付け
e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`

function make() {
    LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}
function cwaf() {
    LANG=C command ./waf "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}

# ------------------------------
# alias
# ------------------------------
setopt complete_aliases  # aliased ls needs if file/dir completions work

alias where="command -v"

# ls
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G"
    # alias ls="ls -alG"
    zle -N expand-to-home-or-insert
    # bindkey "@"  expand-to-home-or-insert
    ;;
linux*)
    alias la="ls -G"
    # alias la="ls -al"
    ;;
esac

# 補完
autoload -U compinit
compinit

# 入力時に大文字小文字を区別せず補完
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|{-_.}=**'

# Docker
alias dps="docker ps --format '{{.ID}}    {{.Names}}'"

alias d='docker'
alias g='git'
alias x='exa -lah'
alias b='bat'
alias sul='/usr/bin/subl'

# ------------------------------
# utility
# ------------------------------
alias ql='qlmanage -p "$@" >& /dev/null'  # quicklook
alias wifi='sh $HOME/Documents/shellscripts/wifi.sh'  # 無線LANのスキャン
alias ctags='/usr/local/bin/ctags'  # homebrewで入れたctagsへのエイリアスのはず

# vimらの
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias sul='/usr/bin/subl'

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
if which pyenv > /dev/null; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH=${PYENV_ROOT}/shims:${PATH}
    eval "$(pyenv init -)";
fi

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=$HOME/Documents/shellscripts:$PATH

export PATH=/usr/local/opt/openssl/bin:$PATH
