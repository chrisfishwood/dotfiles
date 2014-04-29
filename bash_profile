export LANG="en_US.UTF-8"

#GRAY="\[\033[1;30m\]"
#LIGHT_GRAY="\[\033[0;37m\]"
#CYAN="\[\033[0;36m\]"
#LIGHT_CYAN="\[\033[1;36m\]"
#NO_COLOUR="\[\033[0m\]"
#AQUA="\[\033[36m\]"
#BLACK="\[\033[0;30m\]"
#BLACKBOLD="\[\033[1;30m\]"
#RED="\[\033[0;31m\]"
#REDBOLD="\[\033[1;31m\]"
#GREEN="\[\033[0;32m\]"
#GREENBOLD="\[\033[1;32m\]"
#YELLOW="\[\033[0;33m\]"
#YELLOWBOLD="\[\033[1;33m\]"
#BLUE="\[\033[0;34m\]"
#BLUEBOLD="\[\033[1;34m\]"
#PURPLE="\[\033[0;35m\]"
#PURPLEBOLD="\[\033[1;35m\]"
#CYAN="\[\033[0;36m\]"
#CYANBOLD="\[\033[1;36m\]"
#WHITE="\[\033[0;37m\]"
#WHITEBOLD="\[\033[1;37m\]"
#BoldGreen="\[\033[1;32m\]"    # Green
#BoldBlue="\[\033[1;34m\]"     # Blue
#IntenseBlack="\[\033[0;90m\]" # Grey
#Magenta="\[\033[1;95m\]"      # Purple
#Yellow="\[\033[0;33m\]"
#White='\[\033[37m\]'
#Red="\[\033[0;31m\]"
#Blue="\[\033[0;34m\]"
#Cyan="\[\033[0;36m\]"

#GIT_PROMPT_PREFIX="["
#GIT_PROMPT_SUFFIX="]"
#GIT_PROMPT_SEPARATOR="|"
#GIT_PROMPT_BRANCH="${Magenta}"
#GIT_PROMPT_STAGED="●"
#GIT_PROMPT_CONFLICTS="${Red}✖"
#GIT_PROMPT_CHANGED="✚"
#GIT_PROMPT_REMOTE=" "
#GIT_PROMPT_UNTRACKED="…"
#GIT_PROMPT_STASHED="${BoldBlue}⚑"
#GIT_PROMPT_CLEAN="✔"

function start {
echo "╭─"
}

function end {
echo "╰─>"
}

#export PS1="$CYAN ╭─ $WHITE\w$GREEN\$(parse_git_branch)$CYAN \n ╰─> $WHITE"
export GIT_PROMPT_START="$CYAN$(start) \w$WHITE"
export GIT_PROMPT_END="$CYAN \n$(end) $WHITE"

#source ~/dotfiles/bash_files/bash-git-prompt/gitprompt.sh

export PATH=~/bin:/usr/local/bin:$PATH

# Macports installer addition
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# alias wemux="TERM=screen-256color-bce wemux"
export TERM=screen-256color-bce

#git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#set -o vi

alias ll='ls -alh'
alias mysql=/usr/local/Cellar/mysql/5.6.16/bin/mysql
alias mysqladmin=/usr/local/Cellar/mysql/5.6.16/bin/mysqladmin

# use mvim inplace of vim (better integration with mac)

alias vi='mvim -v'
alias vim='mvim -v'
export EDITOR='vim'

# GIT helpers
alias gs='git status'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias grs='git reset --hard'
alias grb='git rebase -i'
alias gpo='git push origin'
alias gpfo='git push -f origin'
alias gm='git merge --no-ff'
alias gd='git diff'
alias ga='git add'
alias gau='git add --update'
alias gc='git commit -v -m'
alias gca='git commit -v -m -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias gl='git log --color --graph --pretty=format:"Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

alias be='bundle exec '
alias berc='bundle exec rake rails c'
alias bers='bundle exec rake rails s'
alias ber='bundle exec rake'
alias bergj='bundle exec rake guard:jasmine'

#test runner
alias vim_test_runner='ruby ~/.vim/bundle/vim_test_runner/test_runner'
alias rspec="bundle exec rspec"


# disable XON/XOFF flow control (hitting ctrl-s can cause this)
# stty -ixon
#


GROOVY_HOME=/usr/share/groovy
export GROOVY_HOME
PATH=$GROOVY_HOME/bin:$PATH
GRAILS_HOME=/usr/share/grails
export GRAILS_HOME
PATH=$GRAILS_HOME/bin:$PATH

export PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
