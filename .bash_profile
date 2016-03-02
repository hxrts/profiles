#set terminal in vi editing mode
set -o vi

# set vim alias
alias vi='vim -N'  

# colored ls
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='Linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='Darwin'
fi

if [[ $platform == 'Linux' ]]; then
  alias ls="ls -a --color"
  eval 'dircolors ~/gitProfiles/dircolors.256dark' > /dev/null
  export TERM=xterm-256color
  export LS_COLORS
elif [[ $platform == 'Darwin' ]]; then
  export CLICOLOR=1
  export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
  alias ls='ls -GFha'
  alias tree="tree -C"
fi

# prompt coloring
parse_git_branch() {
	           git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
		   }
		   export PS1="\[$(tput bold)\]\[$(tput setaf 7)\]\\$ \[$(tput setaf 6)\]\u\[$(tput setaf 7)\] @ \[$(tput setaf 4)\]\h\[$(tput setaf 7)\] ◷ \[$(tput setaf 10)\]\D{%F %T}\[$(tput setaf 7)\] : \[$(tput setaf 10)\]\w\[$(tput setaf 9)\]\$(parse_git_branch)\n> \[$(tput sgr0)\]"

# grep coloring
export GREP_OPTIONS='--color=auto' 

# rsync params
alias rsync='rsync -rzvPh'

# RVM
[[ -s "/Users/bermans/.rvm/scripts/rvm" ]] && source "/Users/bermans/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# command log command
if [[ "$unamestr" == 'Linux' ]]; then
	editor='vi'
elif [[ "$unamestr" == 'Darwin' ]]; then
  editor="subl"
fi

# captain's log
alias log='$editor ~/gitProfiles/log.md'

# locations
alias terra='ssh hxrts@terra.hxrts.com' # 104.236.26.234
alias juno='ssh admin@juno.hxrts.com' # 74.66.134.22

# msk locations
alias saba='ssh -X -i ~/.ssh/saba.private bermans@saba2.cbio.mskcc.org'
alias unagi='ssh -X -i ~/.ssh/saba.private bermans@unagi.cbio.mskcc.org'
alias e01='ssh -X -i ~/.ssh/saba.private bermans@e01.cbio.mskcc.org'
alias e02='ssh -X -i ~/.ssh/saba.private bermans@e02.cbio.mskcc.org'
alias e03='ssh -X -i ~/.ssh/saba.private bermans@e03.cbio.mskcc.org'
alias e04='ssh -X -i ~/.ssh/saba.private bermans@e04.cbio.mskcc.org'
alias e05='ssh -X -i ~/.ssh/saba.private bermans@e05.cbio.mskcc.org'
alias e06='ssh -X -i ~/.ssh/saba.private bermans@e06.cbio.mskcc.org'
alias ika='ssh -X -i ~/.ssh/saba.private bermans@ika.cbio.mskcc.org'

# formats history timestamping, call by using command 'history'
export HISTTIMEFORMAT="%d/%m/%y %T "

