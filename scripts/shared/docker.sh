# Don't stop if docker fails
set +e

# Docker
# As of writing `brew install docker` installs Docker CLI, but not Docker Engine

check_and_install_brew colima
check_and_install_brew docker
check_and_install_brew docker-compose

mkdir ~/.docker

cat >~/.docker/config.json <<EOF
  "cliPluginsExtraDirs": [
      "/opt/homebrew/lib/docker/cli-plugins"
  ]
EOF

brew services start colima

set -e
