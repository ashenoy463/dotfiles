export PATH=$HOME/bin:$HOME/.local/bin/:$HOME/.cargo/bin:$HOME/go:$HOME/.local/share/gem/ruby/3.0.0/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX="true"

. ~/.profile
. "$HOME/.cache/wal/colors.sh"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="masalaprompt"

CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=14

# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(zsh-syntax-highlighting colored-man-pages)

source $ZSH/oh-my-zsh.sh

# Set editor
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
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

alias -s pdf=zathura
alias -s epub=zathura

alias sctle="sudo systemctl enable"
alias sctlr="sudo systemctl restart"
alias sctls="sudo systemctl stop"
alias sctlt="sudo systemctl status" 
alias vcsv= "cat data.csv | perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' | column -t -s, | less -S"

alias mpc="mpc --host $MPD_HOST --port $MPD_PORT"

alias sxiv="nsxiv"

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

# Open interactive fzf session
#function cd() {
    #if [[ "$#" != 0 ]]; then
        #builtin cd "$@";
        #return
    #fi
    #while true; do
        #local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        #local dir="$(printf '%s\n' "${lsd[@]}" |
            #fzf --reverse --preview '
                #__cd_nxt="$(echo {})";
                #__cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                #echo $__cd_path;
                #echo;
                #ls -p --color=always "${__cd_path}";
        #')"
        #[[ ${#dir} != 0 ]] || return 0
        #builtin cd "$dir" &> /dev/null
    #done
#}

# Base16 Shell
export BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

 function cd() {
  if [[ -d ./env ]] ; then
    deactivate
  fi

  builtin cd $1

  if [[ -d ./env ]] ; then
    . ./env/bin/activate
  fi
}
