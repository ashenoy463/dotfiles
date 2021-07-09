export PATH=$HOME/bin:$HOME/.local/bin/:$HOME/.cargo/bin:$HOME/go:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX="true"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="masalaprompt"

CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=14

# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git zsh-syntax-highlighting colored-man-pages)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

alias ggrph="git log --graph"
alias gstat="git status"
alias gstag="git add -A"
alias gdiff="git diff"

alias -s pdf=zathura
alias -s epub=epr

alias sctle="sudo systemctl enable"
alias sctlr="sudo systemctl restart"
alias sctls="sudo systemctl stop"
alias sctlstat="sudo systemctl status" 

alias vcsv= "cat data.csv | perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' | column -t -s, | less -S"

alias mpc="mpc --host $MPD_HOST --port $MPD_PORT"

unalias grv

unsetopt PROMPT_SP

export SHELL="/usr/bin/zsh"

. ~/.profile

gibraltar_wallpaper(){
    x=$1;sed -i 's|RICE_WALLPAPER=.*|RICE_WALLPAPER='$x'|' $HOME/.profile
    $HOME/bin/i3start.sh
}

rss_add(){
    if [ $2 != "" ]
    then
        tags=$(echo $2 | sed "s/,/ /g")
        echo $tags
        echo "${1} \"${tags}\"" >> $HOME/.config/newsboat/urls
    fi
}

. "$HOME/.cache/wal/colors.sh"
