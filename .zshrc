### Initialize ssh-agent (has to go before p10k)
if [ -x "$(command -v keychain)" ]; then
  eval $(keychain --eval --quiet "$HOME/.ssh/id_me_maricn_nikola_2019" "$HOME/.ssh/id_mimi_nikola_maric")
elif [[ $(hostname) == *"work-"* || $(hostname) == *"home-"* ]]; then
  eval $(ssh-agent -s)
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="lukerandall"
# ZSH_THEME="maricn"
ZSH_THEME="powerlevel10k/powerlevel10k"

  # export LC_CTYPE=en_US.UTF-8
  # Exports and autoloading {{{
  export LC_ALL=en_US.UTF-8
  # Setting for nano to figure out I want it in English
  export LANG=en_US.UTF-8
  # ISO-8601 and I accept nothing else, please fuck off
  export LC_TIME=en_DK.UTF-8

  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_PICTURES_DIR="$HOME/Pictures"
  export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat

  # ~/.local/bin/url_handler.sh uses $BROWSER (for urlview/newsboat/neomutt)
  export BROWSER=firefox
  # So xdg-open (and opening links from other apps) would use proper firefox
  export MOZ_ENABLE_WAYLAND=1

  # set autoload path
  fpath=($HOME/.zsh "${fpath[@]}")

  # every time we load .zshrc, ditch duplicate path entries
  typeset -U PATH fpath
# }}}

# Aliases {{{
  # Shortcuts w/ arguments {{{
    alias datetime="date +'%Y-%m-%d %H:%M:%S'"
    alias datetimeT="date +'%FT%T'"
    alias screenpaste='WAYLAND_DEBUG=0 wl-paste -t image/png > screenshot-$(datetimeT).png'
    alias updatedb="sudo /usr/libexec/locate.updatedb"
    alias logtimes='/usr/bin/pmset -g log | grep "Display is turned "'
    alias cdws="cd $HOME/Workspace/"
    # alias light="sed -i 's/colors: \*dark/colors: *light/' ~/.config/alacritty/alacritty.yml"
    # alias dark="sed -i 's/colors: \*light/colors: *dark/' ~/.config/alacritty/alacritty.yml"
    alias clear='[ $[$RANDOM % 6] = 0 ] && timeout 3 cmatrix; clear || clear'
    alias trees="tree -shC"
    alias pingg="ping 8.8.8.8"
    alias myip="curl https://ipinfo.io/ip"
    alias weather="curl 'https://wttr.in/?location=Berlin' -w ''"
    alias curl-weather="weather"
    alias psauxgrep='ps aux | grep -i'
    alias youtube-dl-audio='youtube-dl -f bestaudio --yes-playlist --output "%(title)s.%(ext)s" --ignore-errors'
    alias pandoc="docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker"
    alias weechat='printf "\e[?1049h\e[H" && weechat && printf "\e[?1049l"'
    alias yayfzfpkginfo='yay -Qq | fzf --preview "yay -Qil {}" --layout=reverse --bind "enter:execute(yay -Qil {} | less)"'
    alias parufzfpkginfo='paru -Qq | fzf --preview "paru -Qil {}" --layout=reverse --bind "enter:execute(paru -Qil {} | less)"'
    alias parufzfinstall='paru -Slq | fzf -m --preview "paru -Si {1}" | sudo paru -S -'
    alias fp='/home/nikola/Tools/1pass/1pass | fzf --preview "/home/nikola/Tools/1pass/1pass -p {}" --bind "enter:execute(/home/nikola/Tools/1pass/1pass {})"'
    alias ssh='TERM=xterm-256color ssh'
    # ~~~~~~~~ startsway ~~~~~~~~~~~
    # export $(dbus-launch)         - will export some envvars necessary for ???
    # WAYLAND_DEBUG=0               - turn off wayland debug output
    # XDG_CURRENT_DESKTOP=sway      - inform all child processes that they're on sway desktop - needed for screen sharing
    # _JAVA_AWT_WM_NONREPARENTING=1 - used for java applications to fix them being completely blank (tinyMediaManager)
    # WLR_DRM_NO_MODIFIERS=1        - fix for black screens when plugging in/out displays (https://github.com/swaywm/sway/issues/6167)
    alias startsway='export $(dbus-launch) && WAYLAND_DEBUG=0 XDG_CURRENT_DESKTOP=sway _JAVA_AWT_WM_NONREPARENTING=1 WLR_DRM_NO_MODIFIERS=1 sway 2>&1 >~/sway.$(date +"%Y-%m-%d").log'
  # }}} Shortcuts w/ arguments
# }}} Aliases

# Use wayland/swaywm firefox
unalias firefox 2>/dev/null
function firefox() {
  MOZ_ENABLE_WAYLAND=1 /usr/bin/firejail /usr/bin/firefox "$@"
}

# Use sudoedit instead, it's safer
# alias sudoe='sudo -E PATH=$PATH'

function whichla() { local res; res=$(which $@) && ls -la $res }
function echobase64() { echo -n $@ | base64; }
function echobase64decode() { echo -n $@ | base64 --decode; }
function datefromepoch() { date -j -f "%s" "$1"; }
function nmclitoggle() { type nmcli 1>/dev/null || (echo "no nmcli found" && return 1); if [[ "$(nmcli radio wwan)" == "enabled" ]]; then nmcli radio wwan off; nmcli radio wifi on; else nmcli radio wwan on; nmcli radio wifi off; fi; return 0; }

# Radio stations
alias radio='mpv --no-video --no-cache --no-audio-display --vo=none --no-resume-playback --no-config'
# alias radio_ai_320ogg_gaming='radio http://ai-radio.org/320.ogg'
# alias radio_ai_flac_gaming='radio http://ai-radio.org/44.flac'
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

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# http://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
# You need to set both HISTSIZE and SAVEHIST. They indicate how many lines of history to keep in
# memory and how many lines to keep in the history file, respectively.
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# Settings
setopt NO_BANG_HIST
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY # puts timestamps in the history

setopt dot_glob

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
plugins=(git git-extras urltools pip common-aliases docker docker-compose docker-helpers globalias highlight zsh-autosuggestions history-substring-search fzf mvn)
# zsh-nvm # REMOVED DUE TO INCREASE IN STARTUP TIME
# shrink-path # REMOVED BC USING P10K now
# pyenv # REMOVED BC NOT BEING USED SO MUCH ANYMORE (and it was complaining it needs to be initialized and in the PATH in order to work)

# In addition to oh-my-zsh plugins, use zplug for managing zsh plugins
# source /usr/share/zsh/scripts/zplug/init.zsh
# zplug "wfxr/forgit"
# zplug "changyuheng/fz", defer:1
# zplug "skywind3000/z.lua", defer:1
# zplug "rupa/z", use:z.sh
# zplug load

# Load zsh plugin for virtualenv automatic management when using `cd`
# disabled for being too slow - uses find to depth 2 to look for `activate`
# source "$HOME/Tools/virtualenv-autodetect/virtualenv-autodetect.plugin.zsh"

# source oh-my-zsh before importing externals as they rely on compdef
source $ZSH/oh-my-zsh.sh

# External scripts {{{
  # Source these before our own `bindkeys` so that we can override stuff
  # But after plugins so we override their behavior with stuff here
  scripts_to_source=(
    ${HOME}/Tools/dht/dht-complete.zsh
    ${HOME}/.dotfiles/zsh/fzf-helpers.zsh
  )

  for script in $scripts_to_source; do
    if [ -f $script ]; then
      source $script
    fi
  done
# }}} External scripts

## history-substring-search plugin works with ↑ and ↓ keys;
## use opt+k and opt+j keys for old history lookup
bindkey '˚' history-beginning-search-backward
bindkey '∆' history-beginning-search-forward
## use alt+k and alt+j keys for old history lookup
bindkey '\ek' history-beginning-search-backward
bindkey '\ej' history-beginning-search-forward

# Aliases {{{
  # Unalias {{{
    # https://github.com/muesli/duf vs common-aliases
    unalias duf
    # http://www.graphicsmagick.org/ vs git-merge
    unalias gm
    # use rg as grep vs common-aliases
    unalias grep
  # }}} Unalias

  # change standard behavior {{{
    # 🌈
    alias ls="lsd"
    alias lat="la --sort=time"
    # 🦇
    alias bat='/usr/bin/bat'
    alias cat='/usr/bin/bat --decorations=never --paging=never'
    # 🗣
    alias rm='rm -iv'
    alias cp='cp -iv'
    alias mv='mv -iv'
    alias ln='ln -iv'
    # 🕸
    alias dog='dog --seconds'
    alias newsboat='newsboat -C ~/.config/newsboat/config'
    # 🕵️‍♀️
    alias grep='rg'
  # }}} change standard behavior
# }}} Aliases

## Git / GitHub
export GIT_AUTHOR_NAME=Nikola\ Marić
export GIT_AUTHOR_EMAIL=3995223+maricn@users.noreply.github.com
export GITHUB_USER=3995223+maricn@users.noreply.github.com

## Platform / Use case dependent
if [[ $(hostname) == *"work-"* ]]; then
  ### Work specific
  source "$HOME/.mimi"
else
  export PATH="$PATH:/home/nikola/Tools/F8331/android/platform-tools"

  ### What do I use Qt for, again? -qtractor
  export QTDIR="$HOME/Tools/Qt/5.14.1/gcc_64"
  export Qt5WebEngineWidgets_DIR="$HOME/Tools/Qt/5.14.1/gcc_64/lib/cmake/Qt5WebEngineWidgets"
  export QT_SELECT=qt5
fi

### Preserving legacy scripts compatibility
alias gsed=sed

export DOCKER_HOST=unix:///var/run/docker.sock
if [ -x "$(command -v nvim)" ]; then
  export VISUAL=nvim
  export EDITOR=nvim
else
  export VISUAL=vim
  export EDITOR=vim
fi

export GOPATH="$HOME/go"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$HOME/.local/bin:/var/lib/snapd/snap/bin:/usr/local/sbin:$GOPATH/bin:/usr/local/go/bin:$HOME/.fzf/bin:$HOME/Tools/git-fuzzy/bin":$PATH
# export PATH="$(pyenv root)/shims:$HOME/.local/bin:/var/lib/snapd/snap/bin:/usr/local/sbin:$GOPATH/bin:/usr/local/go/bin:$HOME/.fzf/bin:$HOME/Tools/git-fuzzy/bin":$PATH
# if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  # eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
# fi

# Utilities {{{
  function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

  # z.lua {{{
    # for fuzzy directory navigation
    # https://github.com/skywind3000/z.lua
    eval "$(lua ""$HOME/.local/bin/z.lua"" --init zsh enhanced)"

    # Always pass to fzf, and don't use `fzf -e`
    # unalias z 2> /dev/null
    function zc() {
      [ $# -ne 0 ] && [ -d "$@" ] && cd "$@" && return 0;
      local args=''
      [ $# -eq 0 ] && args="" || args="-q $@"
      local dir="$(z -l 2>&1 | fzf --nth 2.. --reverse --inline-info --height 40% --tac +s $args)"
      [ -n "$dir" ] && cd "$(echo $dir | sed -e 's/^\S*\s*//')"
    }
    alias zb="z -b -I"
  # }}} z.lua

  # md2pdf {{{
  # Convert Markdown to PDF
  # Use as: convertMarkdownToPdf your_markdown_file.md
  function convertMarkdownToPdf() {
    if [[ "$1" == *".md"* ]]; then
      # Filename without extension
      local FILE_NAME=$(basename "$1" .md)
      # Read the markdown file and then convert it to an HTML file
      cat "$FILE_NAME.md" | grip - --export "$FILE_NAME.html"
      # Render HTML to PDF
      node renderToPdf.js "$FILE_NAME.html"
      # Open the generated PDF file
      zathura "$FILE_NAME.pdf"
    else
      echo "Passed file is not of markdown type. Please pass a .md file"
    fi
  }

  alias md2pdf=convertMarkdownToPdf
  # }}} md2pdf
# }}}

# less
# - if there is under one page, I don't need to press q to quit
# R handle colors
export LESS=-eFRX
# make ls use pre-8.25 behavior (per https://unix.stackexchange.com/questions/258679/why-is-ls-suddenly-wrapping-items-with-spaces-in-single-quotes)
export QUOTING_STYLE=literal

# notes {{{
  export TAGSEARCH_HOME="$HOME/Sync/notes/notes"

  # https://github.com/maricn/notes-cli
  alias no='notes ls --sort modified | fzf --preview "cat {1}" | xargs -o nvim'
  alias nn='notes new'
# }}} notes

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
  else
    alias nv="nvim"
  fi

  alias npmt-appv2="docker run -t --mount type=bind,src=/home/nikola/Workspace/CoreV2,dst=/usr/src/app appv2-test:ci-10.20.1-jessie"

# }}}
#



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
