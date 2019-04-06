alias clover="cd /Users/djones/dev/src/clover_graphs/" 
alias salt="ssh ec2-user@salt"
alias home="cd ~"
alias derekjones562="cd /Users/djones/dev/src/derekjones562/"
alias thanos="cd /Users/djones/dev/src/DobaTech/thanos/ && workon thanos"
alias crux="cd /Users/djones/dev/src/DobaTech/thanos/ && workon crux"
alias crux-ops="cd /Users/djones/dev/src/CruxConnect/crux-ops/ && workon crux-ops"
alias black="cd /Users/djones/dev/src/blackwidow/"
alias xcode="open -a /Applications/Xcode.app"
alias pycharm="open /usr/local/bin/charm"
alias homeserver="ssh derek@24.10.211.19"
alias homeserverhome="ssh derek@10.0.0.36"
alias ll="ls -al"
alias ls="ls -a"

#export PATH="/Users/djones/.venvburrito/bin:/usr/local/bin:$PATH"
PYTHONDONTWRITEBYTECODE=True

if [ -e ~/.timein.sh ] ; then {
	alias clockin="sh ~/.timein.sh"
}
fi
if [ -e ~/.timeout.sh ] ; then {
	alias clockout="sh ~/.timeout.sh"
}
fi
export GREP_OPTIONS='--color=auto' 

#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion 
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ \u != root ] ; then 
	BLUE="\[\e[34m\]"
	BASH_CHAR="$"

else
	BLUE="\[\e[31m\]"
	BASH_CHAR="#"

fi

CYAN="\[\e[36m\]"
RED="\[\e[31m\]"
YELLOW="\[\e[33m\]"
WHITE="\[\e[97m\]"
MAGENTA="\[\033[1;35m\]"
GREEN="\[\033[0;32m\]"
export PS1="${RED}$BLUE--[$CYAN\h:\u$BLUE]--[]--[$YELLOW\w$BLUE]--${RED}\n$BLUE--${BASH_CHAR}$WHITE"



GIT_PROMPT_ONLY_IN_REPO=0
# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
GIT_PROMPT_THEME=Custom # use theme optimized for solarized color scheme

Time12a="\$(date +%I:%M%P)"
##_LAST_COMMAND_INDICATOR_ will be replaced by the appropriate GIT_PROMPT    _COMMAND_OK OR GIT_PROMPT_COMMAND_FAIL
GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_  ${CYAN}${Time12a} \u ${YELLOW}\w${WHITE}"
GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_  ${GIT_PROMPT_START_USER}    "
GIT_PROMPT_STAGED="${YELLOW}●"
GIT_PROMPT_BRANCH="${GREEN}"
GIT_PROMPT_PREFIX="${BLUE}[${WHITE}"
GIT_PROMPT_SUFFIX="${BLUE}]${WHITE}"
GIT_PROMPT_END_USER=" \n${BLUE} ➭ ${WHITE}"
GIT_PROMPT_END_ROOT=" \n${WHITE} # ${WHITE}"
GIT_PROMPT_BRANCH="${GREEN}"
GIT_PROMPT_STASHED="${MAGENTA}⚑ "

source ~/.bash-git-prompt/gitprompt.sh
