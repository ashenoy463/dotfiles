export PATH=$HOME/bin:$HOME/.local/bin/:$HOME/go:$HOME/.local/share/gem/ruby/3.0.0/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX="true"
ZSH_DISABLE_COMPFIX="true"

. ~/.profile
. "$HOME/.cache/wal/colors.sh"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="masalaprompt" # set by `omz`

CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=14

# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(zsh-syntax-highlighting colored-man-pages forgit compleat)

source $ZSH/oh-my-zsh.sh

# Set editor
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Lazy app bindings
alias rr="ranger"
alias nn="nvim"
alias mm="mutt"
alias cls="clear"

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

    if [ $1 != "" ]
    then
        new_wallpaper=$1;
    else
        new_wallpaper=$(nsxiv -otqrf ~/Wallpapers) || echo "Usage: gibraltar_wallpaper <PATH_TO_IMAGE>";
        sed -i 's|RICE_WALLPAPER=.*|RICE_WALLPAPER='$new_wallpaper'|' $HOME/.profile
        $HOME/bin/i3start.sh;
    fi
}
gibraltar_theme(){
    x=$1;sed -i 's|RICE_THEME=.*|RICE_THEME='$x'|' $HOME/.profile;
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

if [ "$TERM" = "linux" ]; then
    tbsm
fi
