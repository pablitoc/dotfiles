export EDITOR="atom --wait --new-window"
export VISUAL="atom --wait --new-window"

# Android SDK Variables
export PATH="$HOME/Android/sdk/tools:$PATH"
export PATH="$HOME/Android/sdk/platform-tools:$PATH"

# AWS & BOTO
export BOTO_CONFIG="~/.aws/config"
complete -C aws_completer aws

#Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Swapping from PHP 5.5 to PHP 5.6
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# Get the aliases and functions
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

# Terminal location Functions
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

# Papertrail Config



# Ansible Custom Config
  export ANSIBLE_HOME="$BOXEN_SRC_DIR/ansible"
  export PATH="$BOXEN_SRC_DIR/ansible/bin:$PATH"
  export ANSIBLE_LIBRARY="$ANSIBLE_HOME/lib/ansible/modules/core/:$ANSIBLE_HOME/lib/ansible/modules/extras/"
  export ANSIBLE_MODULE_PATH="$ANSIBLE_HOME/library/"
  export ANSIBLE_CUSTOM_HOME="~/my/ansible"
  export ANSIBLE_CONFIG="$ANSIBLE_CUSTOM_HOME/ansible.cfg"
  export MANPATH="$MANPATH$ANSIBLE_HOME/docs/man:"
  export PYTHONPATH="$BOXEN_SRC_DIR/ansible/lib"
  # Pyenv requires reload
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  pyenv rehash
