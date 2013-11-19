# ++++++++++++++++++++++++++++++++++
# General
# ++++++++++++++++++++++++++++++++++

# Verbose list view
alias ls='ls -la'

# I. Am. Lazy.
alias l='ls'

# ssh with verbose option
alias ssh='ssh -v'

# scp with verbose and remote options
alias scp='scp -rvC'

# Open something in the finder
alias o='open'

# Open this directory in the finder
alias ot='open .'

# Shortcuts to common folders in our old repository structure
alias a='cd assets'
alias ap='cd application'

# ++++++++++++++++++++++++++++++++++
# Bash
# ++++++++++++++++++++++++++++++++++

# Edit your .bash_profile
alias ebp='mate ~/.bash_profile'

# Edit your .profile
alias ep='mate ~/.profile'

# Cat the contents of your bash_history
alias bh='cat ~/.bash_history'

# Reload your bash_profile
alias reload!='. ~/.bash_profile'

# ++++++++++++++++++++++++++++++++++
# SSH
# ++++++++++++++++++++++++++++++++++

# Truncate the contents of your known_hosts file
alias knh='> ~/.ssh/known_hosts'

ekh () {
  mate --line $1 ~/.ssh/known_hosts;
}

alias divider='echo "++++++++++++++++++++++++++++++++++"'
sysconfig () {
  divider;
  echo "Ruby Info:"
  divider;
  ruby -v;
  gem --version;
  rails -v;

  divider;
  echo "Git Info:"
  divider;
  git --version;

  divider;
  echo "Apache Info:"
  divider;
  apachectl -V;
  apachectl -M;
}

