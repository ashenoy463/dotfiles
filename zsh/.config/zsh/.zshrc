export ZDOTDIR=$HOME/.config/zsh

# Use XDG dirs for completion and history files
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

export PATH=$HOME/.local/bin/:$HOME/go:$HOME/.local/share/gem/ruby/3.0.0/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX="true"

CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
unsetopt correct
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
#
# Lazy git bindings
alias ggrph="git log --graph"
alias gstat="git status"
alias gstag="git add -A"
alias gdiff="git status -s \
 | fzf --no-sort --reverse \
 --preview 'git diff --color=always {+2} | diff-so-fancy' \
 --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
 --preview-window=right:60%:wrap"

# Lazy app bindings
alias rr="lf"
alias nn="nvim"
alias vim="nvim"
alias mm="mutt"
alias teams="teams-for-linux"
alias ncmpcpp="ncmpcpp 2> /dev/null"

# Lazy systemctl bindings
alias sctle="sudo systemctl enable"
alias sctlr="sudo systemctl restart"
alias sctls="sudo systemctl stop"
alias sctlt="sudo systemctl status" 

# Lazy pacman bindings
function pacdep() {
sudo pacman -Qi $1 |
  awk '/(^Name)|(^Required By)|(^Optional For)/'
}
alias pacorp="pacman -Qtdq | sudo pacman -Rns -"

# AUR workflow
function buildaur() {
    makepkg -f &&
        updpkgsums &&
        makepkg --printsrcinfo > .SRCINFO &&
        git add -f .SRCINFO PKGBUILD
}

# Filetype bindings
alias -s pdf=zathura
alias -s epub=zathura

unsetopt PROMPT_SP

export SHELL="/usr/bin/zsh"

# Rice bindings
gibraltar_wallpaper(){
    x=$1;sed -i 's|RICE_WALLPAPER=.*|RICE_WALLPAPER='$x'|' $HOME/.profile
    $HOME/.local/bin/i3start.sh
}
gibraltar_theme(){
    x=$1;sed -i 's|RICE_THEME=.*|RICE_THEME='$x'|' $HOME/.profile
    $HOME/.local/bin/i3start.sh
}


 function cd() {
  if [[ -d ./env ]] ; then
    deactivate
  fi

  builtin cd $1

  if [[ -d ./env ]] ; then
# . ./env/bin/activate  # commented out by conda initialize
  fi
}

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Colored manpages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

alias dwarffortress=/home/ayush/.dwarffortress/dfhack
alias bcl="bc -l"

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

export EDITOR="/usr/bin/nvim"
export OPENER="rifle"
export GNUPGHOME="$HOME/.local/share/gnupg"

#bindkey -v main
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:-1,bg:#181818,hl:#12488b --color=fg+:#d0d0d0,bg+:#262626,hl+:#2a7bde --color=info:#a2734c,prompt:#c01c28,pointer:#a347ba --color=marker:#e9ad0c,spinner:#26a269,header:#26a269'

export FZF_DEFAULT_COMMAND='rg --files --hidden'

function _fzfopen {
    zle push-input
    BUFFER="fzf --walker-root='$HOME' --style minimal --height 40% --bind 'enter:become( rifle {} || xdg-open {})'"
    zle accept-line
}

zle -N _fzfopen
bindkey '^o' _fzfopen
