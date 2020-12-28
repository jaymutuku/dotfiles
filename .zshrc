
# path
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/sudo:/snap/bin:/usr/sbin/go" 


# where to find the globally installed node modules
export NODE_PATH="/usr/local/lib/node_modules:$PATH"


# Add ANDROID_HOME variable
export ANDROID_HOME="home/don/Android/Sdk"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

#Set Anaconda as default python 
export PYTHONPATH="/opt/anaconda/bin:$PATH"

export PATH="$PYTHONPATH:/home/don/Documents/scripts/python"

export GOPATH=$HOME/go
export PATH=${PATH}:/{GOPATH}/bin

# tex live
export PATH="/opt/texlive/2020/bin/x86_64-linux:$PATH"

#


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="/home/don/.oh-my-zsh"

# User configuration
export PATH="/usr/local/bin:$PATH"

## use alias 'config' inplace of  regular 'git' to interact with configuration dir '.dotfiles'
alias config='/usr/bin/git --git-dir=/home/don/.dotfiles/ --work-tree=/home/don'


alias todo='todo.sh -d ~/.todo.cfg'

## Git alias
alias 'gb=git branch'
alias 'gp=git push'
alias 'gp=git push origin'
alias 'gtd=git tag --delete'
alias 'gpl=git pull'
alias 'gplo=git pull origin'
alias 'gc=git commit'
alias 'gst=git status'
alias 'gd=git diff'
alias 'gaa=git add .'
alias 'gco=git checkout'
alias 'gsb=git switch branch'
alias 'gm=git merge'
alias 'gl=git log'
alias 'gr=git remote'
alias 'grs=git remote show'
alias 'glo=git log --pretty=oneline'
alias 'glol=git log --graph  --pretty=oneline --decorate'

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

plugins=(archlinux 
	asdf 
	bundler 
	docker 
	jsontools 
	vscode 
	web-search	
	tig 
	gitfast 
	colored-man-pages 
	colorize 
	command-not-found 
	cp 
	dirhistory 
	sudo
	zsh-syntax-highlighting
  )


ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'

rule () {
	print -Pn '%F{blue}'
	local columns=$(tput cols)
	for ((i=1; i<=columns; i++)); do
	   printf "\u2588"
	done
	print -P '%f'
}

function _my_clear() {
	echo
	rule
	zle clear-screen
}
zle -N _my_clear
bindkey '^l' _my_clear

# Ctrl-O opens zsh at the current location, and on exit, cd into ranger's last location.
ranger-cd() {
	tempfile=$(mktemp)
	ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
	test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
	cd -- "$(cat "$tempfile")"
	fi
	rm -f -- "$tempfile"
	# hacky way of transferring over previous command and updating the screen
	VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

