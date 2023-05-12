export PATH=$HOME/.local/bin/:$HOME/go:$HOME/.local/share/gem/ruby/3.0.0/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX="true"

. ~/.profile
. "$HOME/.cache/wal/colors.sh"

export ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=14

# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(zsh-syntax-highlighting colored-man-pages compleat)

# Set defaults for SSH connections
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    ZSH_THEME="masalaprompt-ssh" && source ~/.oh-my-zsh/oh-my-zsh.sh
    export EDITOR='vim'
else
    ZSH_THEME="masalaprompt" && source ~/.oh-my-zsh/oh-my-zsh.sh
    export EDITOR='nvim'
fi

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
alias rr="ranger"
alias nn="nvim"
alias mm="mutt"
alias cls="clear"
alias jl="jupyter-lab"
alias ytdl="yt-dlp"

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

function copy() {
    "$@" | xclip -selection c
}

alias mpc="mpc --host $MPD_HOST --port $MPD_PORT"

unsetopt PROMPT_SP

export SHELL="/usr/bin/zsh"

# Rice bindings
gibraltar_wallpaper(){
    x=$1;sed -i 's|RICE_WALLPAPER=.*|RICE_WALLPAPER='$x'|' $HOME/.profile
    $HOME/bin/i3start.sh
}
gibraltar_theme(){
    x=$1;sed -i 's|RICE_THEME=.*|RICE_THEME='$x'|' $HOME/.profile
    $HOME/bin/i3start.sh
}

# Add rss to newsboat
rss_add(){
    if [ $2 != "" ]
    then
        tags=$(echo $2 | sed "s/,/ /g")
        echo $tags
        echo "${1} \"${tags}\"" >> $HOME/.config/newsboat/urls
    fi
}

 function cd() {
  if [[ -d ./env ]] ; then
    deactivate
  fi

  builtin cd $1

  if [[ -d ./env ]] ; then
    . ./env/bin/activate
  fi
}

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Display manager
if [ "$TERM" = "linux" ]; then
    tbsm
fi
