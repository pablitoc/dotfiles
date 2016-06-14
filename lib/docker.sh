# Remove Untagged images
alias doclean="docker images | grep '^<none>' | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi -f"
# Removes old images
alias docleanimages="docker images | grep -e months -e weeks | grep -v passenger | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi"
# Remove all containers
alias docleancontainers="docker rm $(docker ps -aq)"