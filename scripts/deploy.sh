#!/usr/bin/env sh
set -e

yarn install
yarn build
cd dist

echo 'status.tribecamp.com' > CNAME

git init
git config --local user.email "action@github.com"
git config --local user.name "GitHub Action"

git add -A
git commit -m 'Deploy 🚀'
