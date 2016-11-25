PROMPT='%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg[cyan]%}$(git_prompt_info)
%{$fg[magenta]%}❯ %{$reset_color%}'
RPROMPT='%{$fg[black]%}%*%{$reset_color%}'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[cyan]%} 💩"
