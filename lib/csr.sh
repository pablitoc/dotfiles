csrgen () {
  openssl genrsa -des3 -out $1.key 2048
  openssl req -new -key $1.key -out $1.csr
}

rmkeypassphrase() {
  cp $1.key $1.key.bak
  openssl rsa -in $1.key.bak -out $1.key
}

concatcerts() {
  cat $1.crt gd_bundle.crt > server.crt
}