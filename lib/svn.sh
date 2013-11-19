alias sup='svn update'
alias scom='svn commit -m'
sst () { ruby -e 'puts "SVN Status:";puts `svn status`;puts;puts "Files to add and remove:";puts `svn status`.gsub(/^\?( +)/, "svn add ").gsub(/^\!( ?)/, "svn remove --force ").gsub(/^( ?)(M|C|D|A)( ?)(.+?)\n/, "")'; }
sad () { svn add $1; }
sr () { svn remove --force $1; }
slog () { svn log --limit=$1; }

sir () { 
  mkdir $1;
  svnadmin create $1;
  chgrp -R deploy $1;
  chmod -R 770 $1;
  chmod g+t $1/db;
  echo "Repository successfully created!";
}

