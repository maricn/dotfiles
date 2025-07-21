# Query/use custom command for `git`.
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}

#
# Functions
#

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
  git_current_branch
}
# The list of remotes
function current_repository() {
  if ! $_omz_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $($_omz_git_git_cmd remote -v | cut -d':' -f 2)
}
# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
autoload -Uz compinit
# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

#
# Aliases
# (sorted alphabetically)
#

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'

alias gb='git branch'
alias gba='git branch -a'
alias gbavv='git branch -avv'
alias gbda='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'

alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gcleann='git clean -n'
alias gcleanf='git clean -f'
alias gcleanfd='git clean -fd'
alias gcleanpristine='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcp='git cherry-pick -x'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'
alias gcs='git commit -S'

alias gd='git diff --diff-filter=d'
alias gdd='git diff | dunk'
alias gds='git diff --staged --diff-filter=d'
alias gdg='git diff -b -G'
alias gdns='git diff --name-status -b'
alias gdh='git diff HEAD~1 HEAD'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gdw='git diff --word-diff --diff-filter=d'
alias gdwh='git diff --word-diff HEAD~1 HEAD --diff-filter=d'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
function gfg() { git ls-files | grep $@ }
compdef gfg=grep
alias gfo='git fetch origin'

alias gg='git gui citool'
alias gga='git gui citool --amend'
ggf() {
[[ "$#" != 1 ]] && local b="$(git_current_branch)"
git push --force origin "${b:=$1}"
}
compdef _git ggf=git-checkout
ggl() {
if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
git pull origin "${*}"
else
[[ "$#" == 0 ]] && local b="$(git_current_branch)"
git pull origin "${b:=$1}"
fi
}
compdef _git ggl=git-checkout
alias ggpull='git pull origin $(git_current_branch)'
compdef _git ggpull=git-checkout
ggp() {
if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
git push origin "${*}"
else
[[ "$#" == 0 ]] && local b="$(git_current_branch)"
git push origin "${b:=$1}"
fi
}
compdef _git ggp=git-checkout
alias ggpush='git push origin $(git_current_branch)'
compdef _git ggpush=git-checkout
ggpnp() {
if [[ "$#" == 0 ]]; then
ggl && ggp
else
ggl "${*}" && ggp "${*}"
fi
}
compdef _git ggpnp=git-checkout
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
ggu() {
[[ "$#" != 1 ]] && local b="$(git_current_branch)"
git pull --rebase origin "${b:=$1}"
}
compdef _git ggu=git-checkout
alias ggpur='ggu'
compdef _git ggpur=git-checkout

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
# alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
# compdef git-svn-dcommit-push=git

alias gk='\gitk --all --branches'
compdef _git gk='gitk'
alias gke='\gitk --all $(git log -g --pretty=format:%h)'
compdef _git gke='gitk'

alias gl='git pull'
alias glff='git pull --ff-only'
alias glorima='git pull origin $(gh repo view --json defaultBranchRef -q ".defaultBranchRef.name")'
alias glupma='git pull upstream $(command gh && gh repo view --json defaultBranchRef -q ".defaultBranchRef.name" || echo "master")'
alias glorimaff='git pull origin $(gh repo view --json defaultBranchRef -q ".defaultBranchRef.name") --ff-only'
alias glupmaff='git pull upstream $(gh repo view --json defaultBranchRef -q ".defaultBranchRef.name") --ff-only'
alias glg='git log --stat --color'
alias glgp='git log --stat --color -p'
alias glgg='git log --graph --color'
alias glgga='git log --graph --decorate --all'
alias glgm="git log --graph --max-count=10"
alias glgsm="git log --graph --max-count=10 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %C(bold white)%s%Creset %Cgreen(%ci) %C(bold blue) ⪡%an⪢%Creset%n%+b'"
alias glo='git log --oneline --decorate --color'
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glolrn="git log --pretty=format:'* %C(yellow)%s %C(bold blue) &lt;%ae&gt;%Creset' --abbrev-commit \`git describe --abbrev=0 --tags 2>/dev/null || git rev-list --max-parents=0 HEAD\`..HEAD | gsed 's/\([a-zA-Z]\+\-[1-9][0-9]\+\|SPIKE\|HOTFIX\)/\[\1\]\(https:\/\/gomimi.atlassian.net\/browse\/\1\)/gi'"
alias glolrnbeinfra='git log --merges \
          --pretty=format:'"'"'* %C(yellow)%b %C(bold blue) <%ae>%Creset'"'"' --abbrev-commit \
          `git rev-list --first-parent --max-count 2 HEAD | tail -n 1`..HEAD \
          | grep -e "\(INFRA\|BACK\|MSDK\)\-\([0\-9]\)\+" \
          | gsed "s/\n/\\\\n/g"'
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --color --graph'
alias glp="_git_log_prettily"
alias glfb='git log --format=%B -n 1'
compdef _git glp=git-log

alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'

alias gp='git push'
alias gpfl='git push --force-with-lease'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
compdef _git gpoat=git-push
alias gpu='git push upstream'
alias gpv='git push -v'
alias gpsu="git push --set-upstream origin \`git symbolic-ref --short HEAD\`"
function gppr() {
  PR_FILE=".github/PULL_REQUEST_TEMPLATE.md"
  if [[ -f "$PR_FILE" ]]; then
    hub pull-request -b $(gh repo view --json defaultBranchRef -q ".defaultBranchRef.name") -peF "$PR_FILE"
  else
    hub pull-request -b $(gh repo view --json defaultBranchRef -q ".defaultBranchRef.name") -pe
  fi
}
alias gpmr='git push -u origin HEAD -o merge_request.create'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grhs='git reset HEAD --soft'
alias grh='git reset HEAD'
alias grhs1='git reset HEAD~1 --soft'
alias grhs2='git reset HEAD~2 --soft'
alias grhs3='git reset HEAD~3 --soft'
alias grhh='git reset HEAD --hard'
alias git-mrs-u-picku-materinu='git reset --soft `git rev-list --max-parents=0 HEAD`' # && git push --force 
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gss='git status -s'
alias gst='git status'

# alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
# alias gsr='git svn rebase'

# Replaced with apply
alias gsta='git stash apply'
# Removed gstd - I'm paranoid! # alias gstd='git stash drop'

alias gstaa='git stash apply'
# alias gstl='git stash list' # overridden by my own gstl
alias gstp='git stash pop'
alias gsts='git stash save'
alias gstsu='git stash save --include-untracked'
alias gstski='git stash save --keep-index'

alias gsu='git submodule update'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset --soft HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'

alias gvt='git verify-tag'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'

# list temporarily ignored files
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

# my aliases
alias gitce='git commit -e'
alias gitca="git commit --amend"

function lswgit() { ls -d1 ${GOPATH_WORKSPACE:-~/Workspace}/* | xargs -t -I{} git -C {} $@; }
function lswx() { ls -d1 ${GOPATH_WORKSPACE:-~/Workspace}/* | xargs -t -I{} bash -c "cd -- {} && $@"; }
alias gall="lswgit $@"

function git-release-notes() {
  git log --format='* %s' --no-merges `git describe --tags --abbrev=0 2>/dev/null`..HEAD | grep -Ev 'maven-release-plugin|(emptied release notes)|(prepare [0-9.] release)|SPIKE' |  grep -E '\* \[?[A-Z]{3,}' | sed -e 's/\[\?\([A-Z]\+-[0-9]\+\|SPIKE\)[^a-zA-Z0-9]*/\1 -- /' | uniq> RELEASE-NOTES.md
  git add RELEASE-NOTES.md
  git commit -s -m "prepare $( ( grep -A 3 -B 3 "<artifactId>$( basename `pwd` )" pom.xml || ( head pom.xml | grep -A 3 -B 3 "<artifactId>" ) ) | grep version | gsed -e 's/[^>]\+>\([0-9.]\+\)[-<].\+/\1/' ) release"
}
alias greln=git-release-notes

function grco() {
  UNIQUE_BRANCHES=$(git reflog | /usr/bin/grep -Eio 'moving from ([^[:space:]]+)' | awk '{ print $3 }' | awk ' !x[$0]++' | head "-n${1:-10}")
  [ -z "$1" ] && echo "$UNIQUE_BRANCHES" | fzf | xargs -I{} git checkout {} || git checkout "$(echo $UNIQUE_BRANCHES | tail -n1)"
}
alias grco1='grco 1'
alias grco2='grco 2'
alias grco3='grco 3'
alias ghop=grco1

alias gstl='git stash list --pretty=format:"%C(red)%h%C(reset) - %C(dim yellow)(%C(bold magenta)%gd%C(dim yellow))%C(reset) %<(120,trunc)%s %C(green)(%ci) %C(bold blue)<%an>%C(reset)"'
alias gstd='git stash list --pretty=format:"(%gd) %s %ci" | fzf | grep -o "^\((stash@\{..?\})\)" | tr -d "\(\)" | xargs -I{} git stash show {} --diff-filter=M'
alias grl='git reflog'

function git_fixup_commit_message_amend() { TARGET=$(git rev-parse "$1"); git commit --allow-empty --fixup=$TARGET ${@:2} && git rebase -i --autostash --autosquash $TARGET^; }
alias gfixmessage='git_fixup_commit_message_amend'

function git_diff_commit() {
  gd "$1~1".."$1"
}
alias gdc=git_diff_commit

function git_find_deployment() { git log --merges --pretty=format:'* %h [%ci] %b <%an>' $2 | grep $1 | tail -n 1 }
