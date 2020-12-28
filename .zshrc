# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="/home/don/.oh-my-zsh"

## use alias 'config' inplace of  regular 'git' to interact with configuration dir '.dotfiles'
alias config='/usr/bin/git --git-dir=/home/don/.dotfiles/ --work-tree=/home/don'

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

ZSH_THEME="powerlevel10k/powerlevel10k"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
