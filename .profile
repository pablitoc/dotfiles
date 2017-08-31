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

# LC_ALL=en_US.UTF-8
## New Token Created 03/14/17
export GITHUB_API_TOKEN=

source ~/.bashrc
