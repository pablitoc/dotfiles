export EDITOR="subl3 --wait --new-window"
export VISUAL="subl3 --wait --new-window"

# Ansible Variables
export ANSIBLE_CONFIG="./ansible/ansible.cfg"
export ANSIBLE_SSH_ARGS="-o ForwardAgent=yes"
export ANSIBLE_HOSTS="$BOXEN_SRC_DIR/playbooks/hosts"
export ROLES_PATH="./ansible/roles"
export ANSIBLE_MODULE_PATH="$BOXEN_SRC_DIR/ansible/library/"
export ANSIBLE_LIBRARY="/Users/pabz/src/ansible/library:/usr/share/ansible/"
export ANSIBLE_HOME="$BOXEN_SRC_DIR/ansible"
export PYTHONPATH="$BOXEN_SRC_DIR/ansible/lib:$PATH"
export PATH="/Users/pabz/src/ansible/bin:$PATH"

# Android SDK Variables
export PATH="$HOME/Android/sdk/tools:$PATH"
export PATH="$HOME/Android/sdk/platform-tools:$PATH"

# AWS & BOTO
# export AWS_DEFAULT_PROFILE=crush
export BOTO_CONFIG="~/.boto"
# export EC2_INI_PATH="~/src/ansible_roles/ansible-keys/inventory/ec2.ini"
complete -C aws_completer aws

# Get the aliases and functions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Pyenv Config
eval "$(pyenv init -)"

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
