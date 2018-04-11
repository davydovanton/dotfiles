# excess.zsh-theme
#
# Author: Anton Davydov
# URL: https://github.com/davydovanton
#
# Created on:    01.02.2014
# Last modified on: 01.02.2014

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[237]--------------------------------------------------------------------------------%{$reset_color%}
$FG[002]%~ \
$(git_prompt_info)
%(?.%{$my_light_gray%}.%{$my_light_gray%})%*%{$reset_color%} \
$FG[222]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_light_gray='$FG[245]'
eval my_red='$FG[009]'

# right prompt
#RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}%'
# RPROMPT='%(?.%{$my_gray%}.%{$my_gray%})%*%{$reset_color%}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]("
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_red*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
