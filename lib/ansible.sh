alias au='git submodule update --init --recursive'
alias unid='bundle exec unidad deploy'
alias unip='bundle exec unidad playbook'
alias unig='bundle exec unidad galaxy'

# Ansible Variables Defaults
loadansibledefaults () {
  # Unset Custom Ansible settings
  unset ANSIBLE_HOME
  unset ANSIBLE_LIBRARY
  unset ANSIBLE_MODULE_PATH
  unset ANSIBLE_CUSTOM_HOME
  unset ANSIBLE_CONFIG
  unset PYTHONPATH
  export PATH="/Users/pabz/Android/sdk/platform-tools:/Users/pabz/Android/sdk/tools:/Applications/VMware OVF Tool:/usr/local/bin/git:/usr/local/heroku/bin:/opt/boxen/rbenv/shims:bin:/opt/boxen/rbenv/shims:/opt/boxen/rbenv/bin:/opt/boxen/ruby-build/bin:node_modules/.bin:/opt/boxen/nodenv/shims:/opt/boxen/nodenv/bin:/usr/local/bin:/usr/local/sbin:/opt/boxen/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/bin:/Users/pabz/.ec2/bin:/Applications/Postgres.app/Contents/Versions/latest/bin"
  export MANPATH="/usr/local/share/man:"
  # Set new environment
  source $BOXEN_SRC_DIR/ansible/hacking/env-setup -q
  # Pyenv requires reload
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  pyenv rehash
}

encrypt () {
    ansible-vault encrypt $1
}

decrypt () {
    ansible-vault decrypt $1
}
