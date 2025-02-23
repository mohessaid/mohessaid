#!/bin/bash
set -e

# Fetch the latest Go package URL
GO_URL=$(curl -s https://go.dev/dl/ | grep -oP '/dl/go[0-9.]*.linux-amd64.tar.gz' | head -n 1)

# Download the latest Go package and rename it to go.tar.gz
curl -L -o go.tar.gz https://go.dev$GO_URL

# Extract the package to $HOME
tar -C $HOME -xzf go.tar.gz

# Set up the environment for Go
export GOROOT=$HOME/go
export GOPATH=$HOME/go_projects
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Verify the Go installation
go version

# Fetch the latest version of Dart Sass
DART_SASS_VERSION=$(curl -sI -L -o /dev/null -w '%{url_effective}' https://github.com/sass/dart-sass/releases/latest | awk -F '/' '{print $NF}')

# Download Dart Sass
curl -L -o dart-sass.tar.gz https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz

# Extract the package to $HOME/bin
mkdir -p $HOME/bin
tar -xzf dart-sass.tar.gz -C $HOME/bin --strip-components=1

# Set up the environment for Dart Sass
export PATH=$HOME/bin:$PATH

# Verify the Dart Sass installation
sass --version

# Build website
hugo --gc --minify
