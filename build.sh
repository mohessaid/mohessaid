#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------
# 0. Prep
# ----------------------------------------
export HOME_BIN="$HOME/bin"
mkdir -p "$HOME_BIN"

# ----------------------------------------
# 1. Install latest Hugo
# ----------------------------------------
echo ">> Fetching latest Hugo release…"
HUGO_LATEST_URL=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest \
  | grep '"browser_download_url":' \
  | grep 'Linux-64bit.tar.gz' \
  | head -n1 \
  | cut -d'"' -f4)

echo ">> Downloading Hugo from $HUGO_LATEST_URL"
curl -sL "$HUGO_LATEST_URL" -o hugo.tar.gz

echo ">> Extracting Hugo to temp…"
TMP_DIR=$(mktemp -d)
tar -xzf hugo.tar.gz -C "$TMP_DIR"
rm hugo.tar.gz

# Move only the binary
if [[ -f "$TMP_DIR/hugo" ]]; then
  mv "$TMP_DIR/hugo" "$HOME_BIN/hugo"
else
  find "$TMP_DIR" -type f -name hugo -exec mv {} "$HOME_BIN/hugo" \;
fi
rm -rf "$TMP_DIR"

chmod +x "$HOME_BIN/hugo"
export PATH="$HOME_BIN:$PATH"
echo ">> Hugo version: $(hugo version)"

# ----------------------------------------
# 2. Install Go
# ----------------------------------------
echo ">> Fetching latest Go download path…"
GO_URL_PATH=$(curl -s https://go.dev/dl/ \
  | grep -m1 -oP '/dl/go[0-9.]+\.linux-amd64.tar.gz')

GO_FULL_URL="https://go.dev${GO_URL_PATH}"
echo ">> Downloading Go from $GO_FULL_URL"
curl -sL -o go.tar.gz "$GO_FULL_URL"

echo ">> Extracting Go…"
tar -C "$HOME" -xzf go.tar.gz
rm go.tar.gz

export GOROOT="$HOME/go"
export GOPATH="$HOME/go_projects"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
echo ">> Go version: $(go version)"

# ----------------------------------------
# 3. Install Dart Sass
# ----------------------------------------
echo ">> Fetching Dart Sass latest release URL…"
DART_SASS_VERSION=$(curl -sI -L https://github.com/sass/dart-sass/releases/latest \
  | awk -F/ '/Location:/ {print $NF}' | tr -d '\r')

DART_SASS_URL="https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz"
echo ">> Downloading Dart Sass from $DART_SASS_URL"
curl -sL -o dart-sass.tar.gz "$DART_SASS_URL"

echo ">> Extracting Dart Sass…"
tar -xzf dart-sass.tar.gz -C "$HOME_BIN" --strip-components=1
rm dart-sass.tar.gz

echo ">> Sass version: $(sass --version)"

# ----------------------------------------
# 4. Build your site
# ----------------------------------------
echo ">> Building site with Hugo…"
hugo --gc --minify

echo "✅ Build complete. Public folder is ready."

