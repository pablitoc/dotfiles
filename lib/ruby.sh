alias j='jekyll --server --auto'

createtokens () {
  echo APPLICATION_TOKEN=`ruby -rsecurerandom -e "puts test=SecureRandom.hex(64)"`
  echo SECRET_KEY_BASE=`ruby -rsecurerandom -e "puts test=SecureRandom.hex(64)"`
  echo SECRET_TOKEN=`ruby -rsecurerandom -e "puts test=SecureRandom.hex(64)"`
  echo DEVISE_SECRET_KEY=`ruby -rsecurerandom -e "puts test=SecureRandom.hex(64)"`
  echo DEVISE_PEPPER=`ruby -rsecurerandom -e "puts test=SecureRandom.hex(64)"`
}
