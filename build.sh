#!/bin/bash

# Fetch the latest Go package URL
GO_URL=$(curl -s https://go.dev/dl/ | grep -oP '/dl/go[0-9.]*.linux-amd64.tar.gz' | head -n 1)

# Download the latest Go package and rename it to go.tar.gz
curl -o go.tar.gz https://go.dev$GO_URL

# Extract the package
tar -C /usr/local -xzf go.tar.gz

# Set up the environment
export PATH=$PATH:/usr/local/go/bin

# Verify the Go installation
go env GOPATH

# Fetch the latest version of DART SASS.
export DART_SASS_VERSION=$(curl -sI -L -o /dev/null -w '%{url_effective}' https://github.com/sass/dart-sass/releases/latest | awk -F '/' '{print $NF}')

# Fetch the latest version of DART SASS.
curl -LJO https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz

# Extract the package
tar -xf dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz -C /usr/local/bin

# Build website
hugo --gc --minify
