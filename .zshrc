# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="lukerandall"
ZSH_THEME="maricn"

# Exports and autoloading {{{
  # export LC_CTYPE=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
  # Setting for nano to figure out I want it in English
  export LANG=en_US.UTF-8
  # ISO-8601 and I accept nothing else, please fuck off
  export LC_TIME=en_DK.UTF-8

  export XDG_CONFIG_HOME="$HOME/.config"
  export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
  export XDG_PICTURES_DIR="$HOME/Pictures"

  # set autoload path
  fpath=($HOME/.zsh "${fpath[@]}")

  # load `kp`(ps|fzf)
  autoload -Uz kp

  # every time we load .zshrc, ditch duplicate path entries
  typeset -U PATH fpath
# }}}

alias datetime="date +'%Y-%m-%d %H:%M:%S'"
alias datetimeT="date +'%FT%T'"
alias screenpaste='WAYLAND_DEBUG=0 wl-paste -t image/png > screenshot-$(datetimeT).png'
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias logtimes='/usr/bin/pmset -g log | grep "Display is turned "'
alias cdws="cd $HOME/Workspace/"
alias light="sed -i 's/colors: \*dark/colors: *light/' ~/.config/alacritty/alacritty.yml"
alias dark="sed -i 's/colors: \*light/colors: *dark/' ~/.config/alacritty/alacritty.yml"
alias grepc="grep --color -E "
alias clear='[ $[$RANDOM % 6] = 0 ] && timeout 3 cmatrix; clear || clear'
alias trees="tree -shC"
alias pingg="ping 8.8.8.8"
alias myip="curl https://ipinfo.io/ip"
alias weather="curl wttr.in"
alias curl-weather="weather"
alias psauxgrep='ps aux | grep -i'
alias youtube-dl-audio='youtube-dl -f bestaudio --yes-playlist --output "%(title)s.%(ext)s" --ignore-errors'
alias pandoc="docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker"
alias weechat='printf "\e[?1049h\e[H" && weechat && printf "\e[?1049l"'
alias yayfzfpkginfo='yay -Qq | fzf --preview "yay -Qil {}" --layout=reverse --bind "enter:execute(yay -Qil {} | less)"'

# Use sudoedit instead, it's safer
# alias sudoe='sudo -E PATH=$PATH'

function whichla() { local res; res=$(which $@) && ls -la $res }
function echobase64() { echo -n $@ | base64; }
function echobase64decode() { echo -n $@ | base64 --decode; }
function datefromepoch() { date -j -f "%s" "$1"; }

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
plugins=(git git-extras urltools web-search pip common-aliases docker docker-compose docker-machine docker-helpers globalias highlight zsh-autosuggestions history-substring-search shrink-path)
# zsh-nvm # REMOVED DUE TO INCREASE IN STARTUP TIME
## history-substring-search plugin works with ↑ and ↓ keys;
## use opt+k and opt+j keys for old history lookup
bindkey '˚' history-beginning-search-backward
bindkey '∆' history-beginning-search-forward

source $ZSH/oh-my-zsh.sh

alias ls="lsd"
alias bat='/usr/bin/bat'
alias cat='/usr/bin/bat --decorations=never --paging=never'

## Git / GitHub
export GIT_AUTHOR_NAME=Nikola\ Maric
export GIT_AUTHOR_EMAIL=3995223+maricn@users.noreply.github.com
export GITHUB_USER=3995223+maricn@users.noreply.github.com

## Platform / Use case dependent
if [[ $(hostname) == *"work-"* ]]; then
  ### Work specific
  source "$HOME/.mimi"
else
  export PATH="$PATH:/home/nikola/Tools/F8331/android/platform-tools"

  ### What do I use Qt for, again? -qtractor
  export QTDIR=/home/nikola/Tools/Qt/5.14.1/gcc_64
  export Qt5WebEngineWidgets_DIR=/home/nikola/Tools/Qt/5.14.1/gcc_64/lib/cmake/Qt5WebEngineWidgets
  export QT_SELECT=qt5
fi

### Initialize ssh-agent
if [ -x "$(command -v keychain)" ]; then
  eval $(keychain --eval --quiet "$HOME/.ssh/id_me_maricn_nikola_2019" "$HOME/.ssh/id_mimi_nikola_maric")
elif [[ $(hostname) == *"work-"* || $(hostname) == *"home-"* ]]; then
    eval $(ssh-agent -s)
fi

### Preserving legacy scripts compatibility
alias gsed=sed

### Utility for pipe copy/pasting
alias pbcopyx='xclip -selection clipboard'
alias pbpastex='xclip -selection clipboard -o'

export DOCKER_HOST=unix:///var/run/docker.sock
if [ -x "$(command -v nvim)" ]; then
  export VISUAL=nvim
  export EDITOR=nvim
else
  export VISUAL=vim
  export EDITOR=vim
fi

export PATH="$HOME/.local/bin:/usr/local/sbin:$HOME/go/bin:/usr/local/go/bin:$HOME/.fzf/bin:$HOME/Tools/git-fuzzy/bin":$PATH

# Utilities {{{
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs --glob "!{**/__pycache__,**/node_modules,**/.git,**/*.pyc,**/venv/lib}"'
  alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{**/__pycache__,**/node_modules,**/.git,**/*.pyc,**/venv/lib}" | fzf'
  alias vifi='vim $(fzfi)'

  function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
# }}}

# less
# - if there is under one page, I don't need to press q to quit
# R handle colors
export LESS=-eFRX
# make ls use pre-8.25 behavior (per https://unix.stackexchange.com/questions/258679/why-is-ls-suddenly-wrapping-items-with-spaces-in-single-quotes)
export QUOTING_STYLE=literal

export TAGSEARCH_HOME="$HOME/Sync/notes/notes"
export rmtar() {
  tar tf $1 | sort -r | while read file; do if [ -d "$file" ]; then rmdir "$file"; else rm -f "$file"; fi; done
}
export rmzip() {
  unzip -l $1 | head -n -2 | tail -n +4 | awk '{print $4}' | sort -r | while read file; do if [ -d "$file" ]; then rmdir "$file"; else rm -f "$file"; fi; done
}

source "$HOME/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Software Development (Node.JS) {{{
  # NVM - Node Version Manager
  source "/usr/share/nvm/init-nvm.sh"

  export load_nvm() {
    if ! type "nvm" >/dev/null; then return 1; fi;
    unset -f nvm node npm npx >/dev/null 2>&1
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # place this after nvm initialization!
    autoload -U add-zsh-hook
    load-nvmrc() {
      if type "nvm" >/dev/null; then
        local nvmrc_path="$(nvm_find_nvmrc)"

        if [ -n "$nvmrc_path" ]; then
          local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

          if [ "$nvmrc_node_version" != "N/A" ]; then
            local node_version="$(nvm version)"
            if [ "$nvmrc_node_version" != "$node_version" ]; then
              nvm use
            fi
          fi
        else
          local node_version="$(nvm version)"
          if [ "$node_version" != "$(nvm version default)" ]; then
            echo "Reverting to nvm default version"
            nvm use default
          fi
        fi
      fi # if type "nvm"
    }
    # optionally add zsh hook to load-nvmrc with each change of the working dir
    # add-zsh-hook chpwd load-nvmrc
    load-nvmrc
  }

  if type "nvm" >/dev/null; then
    export nvm() { load_nvm; nvm "$@"; }
    export node() { load_nvm; node "$@"; }
    export npm() { load_nvm; npm "$@"; }
    export npx() { load_nvm; npx "$@"; }

    alias vim="load_nvm;vim"
    alias nvim="load_nvm;nvim"
    alias nv="load_nvm;nvim"
  fi

  alias npmt-appv2="docker run -t --mount type=bind,src=/home/nikola/Workspace/CoreV2,dst=/usr/src/app appv2-test:ci-10.20.1-jessie"

# }}}
