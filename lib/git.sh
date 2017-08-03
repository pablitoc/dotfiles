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
alias gbl='git branch --list'
alias gr='git rm'

gitcleanup () {
  git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}

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

# Remove a local branch and re-track it from origin
gfb () {
  git checkout master
  git branch -D $1
  git fetch origin
  git branch --track $1 origin/$1
  git checkout $1
}

boom2cl () {
  cd .git;
  sed -i~ "s/boomdesigngroup/crushlovely/g" config;
  cd ..;
}

xqdover () {
  git checkout pc-deploy-$1
  awk '/#### Qa/{print;print "- 'xq-qa-$1.crushops.com'";next}1' README.md > README1.md;
  awk '/#### Staging/{print;print "- 'xq-staging-$1.crushops.com'";next}1' README1.md > new_README.md;
  mv new_README.md README.md;
  rm README1.md;
  git add README.md
  git commit -m "Updating Readme"
  git rebase -i HEAD~2
}

xqboom () {
  awk '/deployment:/{print;print "  'qa-$1':\n    branch: 'qa-$1'\n    commands:\n      - bundle exec unidad deploy 'qa-$1'\n# Original Branches";next}1' circle.yml > new_circle1.yml;
  awk '/deployment:/{print;print "# Module Specific deployment\n  'staging-$1':\n    branch: 'staging-$1'\n    commands:\n      - bundle exec unidad deploy 'staging-$1'";next}1' new_circle1.yml > new_circle.yml;
  mv new_circle.yml circle.yml;
  rm new_circle*;
}

xqcommit () {
  git add circle.yml config/deploy/qa-$1 config/deploy/staging-$1
  git commit -m "Updated Circle file with deployment for branch
  Added S3 deployment scripts"
  git push origin pc-deploy-$1
}

xqcreate () {
  bundle exec s3_website cfg apply --config-dir ./config/deploy/qa-$1
  bundle exec s3_website cfg apply --config-dir ./config/deploy/staging-$1
  unid qa-$1
  unid staging-$1
}

alias pair="ruby $BOXEN_SRC_DIR/dotfiles/bash/git_pairs.rb"
