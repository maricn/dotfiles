# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Setting for nano to figure out I want it in English
export LANG=en_US.UTF-8
export LC_TIME=en_DK.UTF-8

ZSH_THEME="lukerandall2"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sad=gsed
alias datetime="date +'%Y-%m-%d %H:%M:%S'"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias logtimes='/usr/bin/pmset -g log | grep "Display is turned "'
alias cdws="cd ~/Workspace/"
alias cdtf="cd ~/tensorflow/ && source ./bin/activate"
alias grepc="grep --color -E "
alias trees="tree -shC"
alias pingg="ping 8.8.8.8"
alias myip="curl https://ipinfo.io/ip"
alias weather="curl wttr.in"
alias curl-weather="weather"
function whichla() { local res; res=$(which $@) && ls -la $res }
function echobase64() { echo -n $@ | base64; }
function echobase64decode() { echo -n $@ | base64 --decode; }
function datefromepoch() { date -j -f "%s" "$1"; }

alias gbuild="gradle build"

# Radio stations
alias radio='mpv --no-video --no-cache --no-audio-display --vo=none --no-resume-playback --no-config'
alias radio_ai_320ogg_gaming='radio http://ai-radio.org/320.ogg'
alias radio_ai_flac_gaming='radio http://ai-radio.org/44.flac'
alias radio_cliqhoq_128aac_idm='radio http://ice1.somafm.com/cliqhop-128-aac'
alias radio_spacestation_128aac_ambient_midtempo_electronica='radio http://ice1.somafm.com/spacestation-128-aac'
alias radio_deepspaceone_128aac_deep_ambient_experimental_space='radio http://ice1.somafm.com/deepspaceone-128-aac'
alias radio_thetrip_128aac_prog_house_trance='radio http://ice1.somafm.com/thetrip-128-aac'
alias radio_beatblender_128aac_deep_house_downtempo_chill='radio http://ice1.somafm.com/beatblender-128-aac'
alias radio_earwaves_128aac_electro_experimental='radio http://ice1.somafm.com/earwaves-128-aac'
alias radio_paradise_320aac_rock_mixup='radio http://stream-uk1.radioparadise.com/aac-320'
alias radio_krawallradio_unknown_deutschrock='radio http://yokote.streampanel.net:8124/stream'

if [ -z "$SSH_AUTH_SOCK" ] ; then
   eval `ssh-agent`
   ssh-add
fi

DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

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
plugins=(git git-extras osx urltools web-search gradle mvn pip common-aliases docker docker-compose docker-machine docker-helpers iterm2 thefuck globalias highlight zsh-autosuggestions history-substring-search)
# zsh-nvm # REMOVED DUE TO INCREASE IN STARTUP TIME

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export GIT_AUTHOR_NAME=Nikola\ Maric
## Platform / Use case dependent
if [[ $(hostname) == *"-Nikola."* ]]; then
  ### Initialize ssh-agent
  if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
    ssh-add
  fi
  
  ### Work specific
  export GIT_AUTHOR_EMAIL=nikola.maric@mimi.io
  source "$HOME/.mimi"

  ### Initialize iTerm2 shell integrations
  source $HOME/.iterm2_shell_integration.zsh
  
  ## Vim stuff
  function vim_tmux() { tmux new -d "/usr/local/bin/vim $*" \; attach; }
  alias vim='vim_tmux'
  alias vvim='/usr/local/bin/vim'
  ssh-add -A ~/.ssh/maricn
else
  export GIT_AUTHOR_EMAIL=maricn@gmail.com
  alias pbcopyx='xclip -selection clipboard'
  alias pbpastex='xclip -selection clipboard -o'
fi

export DOCKER_HOST=unix:///var/run/docker.sock

export EDITOR=vim
export HTTPIE_BASE_URL=localhost:9000

# export JAVA_HOME=$(/usr/libexec/java_home -v 10.0.2)
# export KIBANA_HOME="$HOME/Tools/kibana-6.2.2-darwin-x86_64"

# export RVM_HOME="$HOME/.rvm"
export GOPATH="$HOME/go-workspace"
# export GOPATH_WORKSPACE="$GOPATH/src"

## The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/nikola/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/nikola/google-cloud-sdk/path.zsh.inc'; fi

## The next line enables shell command completion for gcloud.
# if [ -f '/Users/nikola/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/nikola/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/usr/local/sbin:$HOME/.node/bin:$HOME/bin":$PATH

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\e]$mode;$@\a"
}
stt_both () { setTerminalText 0 $@; } 
stt_tab () { setTerminalText 1 $@; } 
stt_title () { setTerminalText 2 $@; } 
stt_tab_current_project () { stt_tab `basename $(pwd) | sad -r 's/\B[a-z]\s*//g' | sad -r 's/\-//g'` } 
stt_tab_current_project_if_in_workspace () { if [ "${PWD##/Users/nmaric/}" != "${PWD}" ] ; then ; stt_tab_current_project ; fi }

chpwd_functions=(${chpwd_functions[@]} "stt_tab_current_project_if_in_workspace")

# less 
# - if there is under one page, I don't need to press q to quit
# R handle colors
export LESS=-eFRX
# make ls use pre-8.25 behavior (per https://unix.stackexchange.com/questions/258679/why-is-ls-suddenly-wrapping-items-with-spaces-in-single-quotes)
export QUOTING_STYLE=literal

export THEFUCK_RULES=DEFAULT_RULES:git_push_force
eval $(thefuck --alias)
alias fuckyeah="fuck -y"

# For opengl video codec with mpv @ 60fps
export DYLD_INSERT_LIBRARIES='/System/Library/Frameworks/OpenGL.framework/Resources/GLEngine.bundle/GLEngine'

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Welcome message for login shells

# NVM - Node Version Manager
load_nvm() {
    unset -f nvm node npm npx
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # place this after nvm initialization!
    autoload -U add-zsh-hook
    load-nvmrc() {
      local node_version="$(nvm version)"
      local nvmrc_path="$(nvm_find_nvmrc)"

      if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
 
        if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
          nvm use 
        fi
      elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
      fi
    }
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc
}

nvm() {
    load_nvm
    nvm "$@"
}

node() {
    load_nvm
    node "$@"
}

npm() {
    load_nvm
    npm "$@"
}

npx() {
    load_nvm
    npx "$@"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/nikola/.sdkman"
[[ -s "/Users/nikola/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/nikola/.sdkman/bin/sdkman-init.sh"

