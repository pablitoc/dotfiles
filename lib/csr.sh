csrgen () {
  openssl genrsa -des3 -out $1.key 4096
  openssl req -new -key $1.key -out $1.csr
}

rmkeypassphrase() {
  cp $1.key $1.key.bak
  openssl rsa -in $1.key.bak -out $1.key
}

concatcerts() {
  cat $1.crt gd_bundle.crt > server.crt
}

crtgen (){
  openssl x509 -req -days 365 -in $1.csr -signkey $1.key -out $1.crt
}
