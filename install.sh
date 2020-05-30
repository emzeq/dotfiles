#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Use package feature to install coc.nvim
mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

# Change extension names to the extensions you need
npm install \
	coc-explorer \
	coc-tsserver \
	coc-css \
	coc-html \
	coc-json \
	coc-yank \
	coc-prettier \
	coc-yaml \
	coc-snippets \
	--global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
