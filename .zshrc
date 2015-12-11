# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lukerandall2"
#ZSH_THEME="dario"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sad='/usr/bin/sed'
alias datetime="date +'%Y-%m-%d %H:%M:%S'"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias cdws="cd ~/workspaces/workspace-spring/"
alias pingg="ping 8.8.8.8"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

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
plugins=(git osx urltools web-search gradle mvn pip common-aliases docker)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export ANDROID_HOME=/Users/nikola/android-sdk-mac_x86
export ANDROID_TOOLS=/Users/nikola/android-sdk-mac_x86/tools
export ANDROID_PLATFORM_TOOLS=/Users/nikola/android-sdk-mac_x86/platform-tools

export EDITOR=nano
export HTTPIE_BASE_URL=localhost:9000
export M3_HOME=/usr/local/Cellar/maven/3.2.3

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home

#path=(/Users/nikola/.rvm/gems/ruby-2.1.2/bin /Users/nikola/.rvm/gems/ruby-2.1.2@global/bin /Users/nikola/.rvm/rubies/ruby-2.1.2/bin /Users/nikola/.gvm/vertx/current/bin 
#/Users/nikola/.gvm/springboot/current/bin /Users/nikola/.gvm/lazybones/current/bin /Users/nikola/.gvm/jbake/current/bin /Users/nikola/.gvm/groovyserv/current/bin 
#/Users/nikola/.gvm/groovy/current/bin /Users/nikola/.gvm/griffon/current/bin /Users/nikola/.gvm/grails/current/bin /Users/nikola/.gvm/gradle/current/bin 
#/Users/nikola/.gvm/glide/current/bin /Users/nikola/.gvm/gaiden/current/bin /Users/nikola/.gvm/crash/current/bin /usr/local/Cellar/maven/3.2.3/bin /usr/local/sbin 
#/usr/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin '' '' /Users/nikola/Library/Developer/Xamarin/android-sdk-mac_x86/tools 
#/Users/nikola/Library/Developer/Xamarin/android-sdk-mac_x86/platform-tools /Users/nikola/Library/Developer/Xamarin/android-sdk-mac_x86 /opt/local/bin /Users/nikola/.rvm/bin)

export GEM_HOME=$HOME/.gem
export PATH="$(pyenv which python):/usr/local/sbin:$M3_HOME/bin:$HOME/.node/bin":$(brew --prefix homebrew/php/php55)/bin:"$HOME/.project-switcher/bin:$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$ANDROID_HOME:$GEM_HOME"
eval "$(project-switcher --inject)"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
export ANDROID_STUDIO_JDK=/System/Library/Frameworks/JavaVM.framework/Versions/Current

source /Users/nikola/.iterm2_shell_integration.zsh

export PYTHONPATH=".:$(pyenv which python):/usr/local/bin/python"
export FINDBUGS_HOME="/Users/nikola/workspaces/utils/findbugs-3.0.1"
# less - if there is under one page, I don't need to press q to quit
#export LESS=-FX

eval "$(pyenv init -)"
eval $(thefuck --alias)
eval $(thefuck --alias)

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Welcome message for login shells
