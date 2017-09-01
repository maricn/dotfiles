# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
# Setting for nano to figure out I want it in English
LANG=en_US.UTF-8

ZSH_THEME="lukerandall2"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sad=gsed
alias datetime="date +'%Y-%m-%d %H:%M:%S'"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias logtimes='/usr/bin/pmset -g log | grep "Display is turned "'
alias cdws="cd ~/Workspace/"
alias cdcap="cd ~/Workspace/ops-deployment/capistrano/java_app/"
alias pingg="ping 8.8.8.8"
alias grepc="grep --color -E "
alias trees="tree -shC"

# Radio stations
alias radio_ai_320ogg_gaming='mpv http://ai-radio.org/320.ogg'
alias radio_ai_flac_gaming='mpv http://ai-radio.org/44.flac'
alias radio_cliqhoq_128aac_idm='mpv http://ice1.somafm.com/cliqhop-128-aac'
alias radio_spacestation_128aac_ambient_midtempo_electronica='mpv http://ice1.somafm.com/spacestation-128-aac'
alias radio_deepspaceone_128aac_deep_ambient_experimental_space='mpv http://ice1.somafm.com/deepspaceone-128-aac'
alias radio_thetrip_128aac_prog_house_trance='mpv http://ice1.somafm.com/thetrip-128-aac'
alias radio_beatblender_128aac_deep_house_downtempo_chill='mpv http://ice1.somafm.com/beatblender-128-aac'
alias radio_earwaves_128aac_electro_experimental='mpv http://ice1.somafm.com/earwaves-128-aac'
alias radio_paradise_320aac_rock_mixup='mpv http://stream-uk1.radioparadise.com/aac-320'
alias radio_krawallradio_unknown_deutschrock='mpv http://yokote.streampanel.net:8124/stream'

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
plugins=(git osx urltools web-search gradle mvn pip common-aliases docker capistrano globalias highlight)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export GIT_AUTHOR_NAME=Nikola\ Maric
export GIT_AUTHOR_EMAIL=nikola.maric@auto1.com
export DOCKER_HOST=unix:///var/run/docker.sock

export EDITOR=nano
export HTTPIE_BASE_URL=localhost:9000

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home

export RVM_HOME="$HOME/.rvm"
export GOPATH="$HOME/go-workspace"
export PATH="$HOME/.jenv/bin:$JAVA_HOME/bin:$RVM_HOME/bin:/usr/local/sbin:$HOME/.node/bin":$(brew --prefix homebrew/php/php55)/bin:"$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$ANDROID_HOME:/usr/local/opt/go/libexec/bin:$GOPATH/bin"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

source $HOME/.auto1.zsh
source $HOME/.iterm2_shell_integration.zsh

export FINDBUGS_HOME="/Users/nikola/workspaces/utils/findbugs-3.0.1"
# less 
# - if there is under one page, I don't need to press q to quit
# R handle colors
export LESS=-eFRX

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

eval $(thefuck --alias)
eval "$(jenv init -)"

#eval "$(ssh-agent -s)"
ssh-add -A ~/.ssh/maricn

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Welcome message for login shells

