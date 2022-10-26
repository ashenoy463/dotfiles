PROMPT="%(?:%{$fg_bold[green]%}%n@%M :%{$fg_bold[red]%}%n@%M:)"
PROMPT+='%{$fg[blue]%}%~%{$reset_color%}$ $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg[red]%}> ᚴ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}~"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} %{$fg[green]%}~"
