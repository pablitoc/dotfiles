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

# Tar and Untar direcctories
tarfile () {
  TODAY=`date "+%m-%d-%Y_%H%M%S"`
  tar -czvf $1-$TODAY.tar.gz $1
}
untarfile () {
  tar -xzvf $1
}

# Use RSYNC to copy files and remove source files
rmove () {
rsync -avhz --progress $1 $2 --remove-source-files -d --recursive && rm -rf $1
  }

rcopy () {
rsync -avhz --progress $1 $2
  }

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

# ++++++++++++++++++++++++++++++++++
# SSH
# ++++++++++++++++++++++++++++++++++

# Renew IP address. Requires 'sudo' permissions
# Need to add user input for interface to renew
# alias iprenew='sudo ipconfig set en0 DHCP'

makekeys () {
  echo "Please enter the Project Name"
  read projectname
  ssh-keygen -f $projectname -t rsa -b 4096 -C "$projectname" -N ''

}

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
catssl () {
  echo "Grabbing files"
  BUNDLE=`/bin/ls | grep bundle`
  CERT=`/bin/ls | grep -v bundle`

  divider;
  echo "Your Bundle file is ${BUNDLE}"
  echo "Your Certificate file is ${CERT}"
  echo "What would you like to name your file"
  read filename

  divider;
  echo "Concatenating both certificates"
  cat ${CERT} ${BUNDLE} > "${filename}.crt"
  echo "Your certificate is ready!"
}
