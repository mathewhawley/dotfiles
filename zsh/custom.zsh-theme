PROMPT='%{$fg[green]%}%n%{$reset_color%} at %{$fg[green]%}%m%{$reset_color%} in %{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
%{$fg[white]%}$ %{$reset_color%}'
RPROMPT='%{$fg[white]%}%*%{$reset_color%}'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%} !!"
