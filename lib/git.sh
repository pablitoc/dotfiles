# ++++++++++++++++++++++++++++++++++
# General
# ++++++++++++++++++++++++++++++++++

alias gpsh='git push'
alias gpshom='git push origin master'

alias gpl='git pull'
alias gplom='git pull origin master'

alias gl='git log'

alias gs='git status'
alias gf='git fetch'

alias ga='git add'

alias gc='git commit -m'
alias gco='git checkout'

alias gm='git merge'
alias gmm='git merge master'

alias gcom='git checkout master'
alias gcodl='git checkout deploy/live'
alias gcods='git checkout deploy/stage'

alias gb='git branch'
alias gr='git rm'
alias gclean='git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d'

grao () {
  git remote add origin git@github.com:crushlovely/$1.git
}

svn2git () {
  git svn --authors-file=/Users/pjkelly/.authors clone $1 $2
}

# Create a standard .gitignore file in the current directory
cgi () {
  touch .gitignore;
  cat > .gitignore << EOF
.DS_Store
database.yml
log/*
tmp/*
EOF
}

# Create a git repo and push to its github remote
gir () {
  mkdir $1;
  cd $1;
  git init;
  cgi;
  git add .gitignore;
  git commit -m 'adding .gitignore';
  git remote add origin git@github.com:crushlovely/$1.git;
  git push origin master;
}

boom2cl () {
  cd .git;
  sed -i~ "s/boomdesigngroup/crushlovely/g" config;
  cd ..;
}

alias pair="ruby $BOXEN_SRC_DIR/dotfiles/bash/git_pairs.rb"