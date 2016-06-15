source /opt/boxen/env.sh

export RBENV_ROOT=/opt/boxen/rbenv/
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Git Path
export PATH="/usr/local/bin/git:$PATH"

### Default JDK for all Terminal Sessions
export JAVA_HOME=$(/usr/libexec/java_home)

### Adding path for ec2 tools
export PATH=$PATH:$EC2_HOME/bin

### EC2 API Tools Default Variables
export EC2_HOME="/Users/pabz/.ec2"
export PATH=$PATH:$EC2_HOME/bin

## VMware OVFTool Path
export PATH="/Applications/VMware OVF Tool:$PATH"

## Github API Token
# export GITHUB_API_TOKEN=877fddcb0ed201f9c583522f1948bc854af0fbd2
export GITHUB_TOKEN=47fc0d04f5f809347cf5bee66020819a652939c8

## Docker Start Terminal
eval "$(docker-machine env default)"

source ~/.bashrc
