# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lukerandall2"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sad='/usr/bin/sed'
alias datetime="date +'%Y-%m-%d %H:%M:%S'"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias logtimes='/usr/bin/pmset -g log | grep "Display is turned "'
alias cdws="cd ~/Workspace/"
alias pingg="ping 8.8.8.8"
alias gitca="git commit --amend"

alias mvniam='mvn clean cargo:run -Ddevelopment -Djava.net.preferIPv4Stack=true | sed -u "s/\\n\\tat\ /\
\t/g"'
alias mvniamt='mvn clean exec:java cargo:run -Djava.net.preferIPv4Stack=true | sed -u "s/\\n\\tat\ /\
\t/g"'
alias iampretty='sed -u "s/\\n\\tat\ /\
\t/g" | sed "/\tat\ \(org\.apache\.\|java\.lang\.Thread\.run\|javax\.servlet\.\).*$/d"'

if [ -z "$SSH_AUTH_SOCK" ] ; then
   eval `ssh-agent`
   ssh-add
fi

DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

setopt EXTENDED_GLOB

# Tab completion from both ends
setopt completeinword

# Better completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# Completion selection by menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,cputime,command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx urltools web-search gradle mvn pip common-aliases docker capistrano globalias)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export GIT_AUTHOR_NAME=Nikola Maric
export GIT_AUTHOR_EMAIL=nikola.maric@auto1.com

export EDITOR=nano
export HTTPIE_BASE_URL=localhost:9000
export M3_HOME=/usr/local/Cellar/maven/3.3.9/libexec

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home

export RVM_HOME="$HOME/.rvm"
export PATH="$RVM_HOME/bin:/usr/local/sbin:$M3_HOME/bin:$HOME/.node/bin":$(brew --prefix homebrew/php/php55)/bin:"$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$ANDROID_HOME"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

source $HOME/.iterm2_shell_integration.zsh

export FINDBUGS_HOME="/Users/nikola/workspaces/utils/findbugs-3.0.1"
# less 
# - if there is under one page, I don't need to press q to quit
# R handle colors
export LESS=-eFRX

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

eval $(thefuck --alias)

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Welcome message for login shells

