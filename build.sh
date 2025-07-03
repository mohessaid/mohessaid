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

[[ -n "$HUGO_LATEST_URL" ]] || { echo "❌ Hugo URL not found"; exit 1; }
echo ">> Downloading Hugo from $HUGO_LATEST_URL"
curl -fSL "$HUGO_LATEST_URL" -o hugo.tar.gz

echo ">> Extracting Hugo to $HOME_BIN…"
TMP=$(mktemp -d)
tar -xzf hugo.tar.gz -C "$TMP"
rm hugo.tar.gz
find "$TMP" -type f -name hugo -exec mv {} "$HOME_BIN/hugo" \;
rm -rf "$TMP"
chmod +x "$HOME_BIN/hugo"
export PATH="$HOME_BIN:$PATH"
echo ">> Hugo version: $(hugo version)"

# ----------------------------------------
# 2. Install Go (via JSON API)
# ----------------------------------------
echo ">> Fetching latest Go versions list…"
GO_JSON=$(curl -s https://go.dev/dl/?mode=json)

GO_FILENAME=$(printf '%s\n' "$GO_JSON" \
  | grep -oP '"filename":\s*"\Kgo[0-9]+\.[0-9]+\.[0-9]+\.linux-amd64\.tar\.gz' \
  | head -n1)

[[ -n "$GO_FILENAME" ]] || { echo "❌ Go filename not found in JSON"; exit 1; }

GO_FULL_URL="https://go.dev/dl/${GO_FILENAME}"
echo ">> Downloading Go from $GO_FULL_URL"
curl -fSL "$GO_FULL_URL" -o go.tar.gz

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

[[ -n "$DART_SASS_VERSION" ]] || { echo "❌ Dart Sass version not found"; exit 1; }

DART_SASS_URL="https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz"
echo ">> Downloading Dart Sass from $DART_SASS_URL"
curl -fSL "$DART_SASS_URL" -o dart-sass.tar.gz

echo ">> Extracting Dart Sass to $HOME_BIN…"
tar -xzf dart-sass.tar.gz -C "$HOME_BIN" --strip-components=1
rm dart-sass.tar.gz

echo ">> Sass version: $(sass --version)"

# ----------------------------------------
# 4. Build your site
# ----------------------------------------
echo ">> Building site with Hugo…"
hugo --gc --minify

echo "✅ Build complete. Public folder is ready."
