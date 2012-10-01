# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew osx python screen ssh-agent)

alias ga='git add'
alias gp='git push'
#alias gl='git log --graph --abbrev-commit --pretty=oneline --decorate --branches'
alias gl='git log --graph --pretty=format:"%C(green)%h%Creset %C(blue)%an%Creset -%C(red)%d%Creset %s %C(yellow)%cd" --branches --date=short'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gam='git commit -am'
alias gca='git commit -a'
alias gb='git branch -avv'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gr='git rebase'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull --rebase'
alias gcl='git clone'
alias c='cd'
alias v='vim'
alias r='rm'
alias g='ack'
alias t='tail'
alias h='head'
alias w='wc -l'
alias mvim='/usr/local/Cellar/macvim/7.3-64/bin/mvim'
alias antlocal='ant -Ddefault.resolver=local-first'
alias pr='post-review --guess-description --guess-summary'
alias fact="elinks -dump randomfunfacts.com | sed -n '/^|/p' | tr -d \|"

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
bindkey -v 

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward 

function f {
  find . -iname "*$1*$2"
}

function vimf {
  vim $(f $1 $2)
}

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/home/dan/bin:/Users/dvelkov/Library/Haskell/ghc-7.4.1/lib/ghc-mod-1.11.0/bin
