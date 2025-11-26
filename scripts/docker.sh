# Don't stop if docker fails
set +e

# Docker
# As of writing `brew install docker` installs Docker CLI, but not Docker Engine

brew install colima docker docker-compose

mkdir ~/.docker

cat >~/.docker/config.json <<EOF
  "cliPluginsExtraDirs": [
      "/opt/homebrew/lib/docker/cli-plugins"
  ]
EOF

brew services start colima

set -e
