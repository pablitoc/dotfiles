sk () {
  echo "Setting up SSH keys for $1@$2..."
  ssh $1@$2 'mkdir -p ~/.ssh; chmod 700 ~/.ssh'
  scp $1@$2:.ssh/authorized_keys ~/.ssh/authorized_keys_tmp
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys_tmp
  scp ~/.ssh/authorized_keys_tmp $1@$2:.ssh/authorized_keys
  ssh $1@$2 'chmod 600 ~/.ssh/authorized_keys'
  rm ~/.ssh/authorized_keys_tmp
  echo "SSH keys successfully created."
}

removeFromKnownHosts() {
  sed -i~ "$1 d" ~/.ssh/known_hosts;
}

update_keys () {
  if [ -r $BOXEN_SRC_DIR/keys/authorized_keys ] ; then
    echo "Setting up SSH keys for $1@$2..."
    ssh $1@$2 'mkdir -p ~/.ssh; chmod 700 ~/.ssh'
    scp $BOXEN_SRC_DIR/keys/authorized_keys $1@$2:.ssh/authorized_keys
    ssh $1@$2 'chmod 600 ~/.ssh/authorized_keys'
    echo "SSH keys successfully updated."
  else
    echo "You cannot update the keys on this server because you do not have the appropriate files."
  fi
}
