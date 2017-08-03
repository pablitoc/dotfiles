# Remove Untagged images
doclean () {
  docker images -a | grep '^<none>' | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi -f
}
# Removes old images
docleanimages () {
  docker images | grep -e months -e weeks | grep -v passenger | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi
}
# Remove all containers
docleancontainers () {
  docker rm $(docker ps -aq)
}
# Remove VFS directory of
docleanvfs () {
  docker volume rm $(docker volume ls -qf dangling=true)
}
# Regenerate TLS connection certs, requires confirmation
docrecert () {
  docker-machine regenerate-certs $1
}
# Start Docker Machine
docstart () {
  # Start Virtual Machine for Docker
  docker-machine start
  # Get Environment Variables
  docker-machine env
  # Set Environment Variables
  eval "$(docker-machine env default)"
}
# Stop docker Machine
docstop () {
  # Start Virtual Machine for Docker
  docker-machine stop
}
