export EDITOR="subl3 --wait --new-window"
export VISUAL="subl3 --wait --new-window"

# Get the aliases and functions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

__git_repo () {
  local g="$(__gitdir)"
  local repo_dir=""

  if [ -n "$g" ]; then
    if [ ! ".git" == "$g" ]; then
      git_dir=`dirname $g`
      repo_dir=`basename $git_dir`
    printf "$repo_dir"
    fi
  fi
}

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='[$(__git_repo)\[\033[0;34m\]\W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\033[0m\]]\$ '

for script in $BOXEN_SRC_DIR/dotfiles/lib/*.sh ; do
  if [ -r $script ] ; then
    . $script
  fi
done